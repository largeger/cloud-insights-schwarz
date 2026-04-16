#!/bin/bash

# 1. Project ID sicher auslesen
# Wir unterdrücken Fehlermeldungen und entfernen Windows-Zeilenenden
PROJECT_ID=$(gcloud config get-value project 2>/dev/null | tr -d '\r')

# Falls die ID noch immer leer ist (z.B. wegen des Python Fehlers), 
# versuchen wir es über einen alternativen Weg oder brechen mit klarer Hilfe ab.
if [ -z "$PROJECT_ID" ] || [[ "$PROJECT_ID" == *python* ]]; then
    echo "❌ FEHLER: Das gcloud Tool hat ein Pfad-Problem in der Git Bash."
    echo "Lösung: Bitte führe diesen Befehl EINMAL manuell in deiner Git Bash aus:"
    echo "   gcloud config set project [DEINE_PROJEKT_ID]"
    echo ""
    echo "Falls der Fehler 'python3.12.exe: can't open file' weiterhin erscheint,"
    echo "nutze bitte die 'Google Cloud SDK Shell' oder PowerShell für das Deployment."
    exit 1
fi

REGION="europe-west3" 
BUCKET_NAME="${PROJECT_ID}-cloud-store-assets"
SERVICE_NAME="cloud-store-backend"

echo "🚀 Starte Deployment für Projekt: $PROJECT_ID"

# 2. APIs aktivieren
gcloud services enable run.googleapis.com \
                       containerregistry.googleapis.com \
                       storage.googleapis.com \
                       cloudbuild.googleapis.com

# 3. Storage Bucket erstellen & konfigurieren
echo "🗄️ Erstelle Storage Bucket: $BUCKET_NAME"
gcloud storage buckets create gs://$BUCKET_NAME --location=$REGION --uniform-bucket-level-access || echo "Bucket existiert bereits."

gcloud storage buckets add-iam-policy-binding gs://$BUCKET_NAME \
    --member="allUsers" \
    --role="roles/storage.objectViewer"

# 4. Backend bauen & deployen
echo "⚙️ Baue Backend-Container..."
cd backend
gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

echo "🚢 Deploye auf Cloud Run..."
gcloud run deploy $SERVICE_NAME \
    --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
    --platform managed \
    --region $REGION \
    --allow-unauthenticated

# URL extrahieren
BACKEND_URL=$(gcloud run services describe $SERVICE_NAME --platform managed --region $REGION --format 'value(status.url)' | tr -d '\r')
echo "✅ Backend erreichbar unter: $BACKEND_URL"

# 5. Frontend vorbereiten & hochladen
echo "🎨 Bereite Frontend vor..."
cd ../frontend

# Backend URL im HTML anpassen (Wichtig: Wir nutzen ein anderes Trennzeichen für sed)
sed -i "s|https://cloud-store-backend-XXXXX.a.run.app|$BACKEND_URL|g" index.html

echo "📤 Lade Frontend hoch..."
gcloud storage cp index.html gs://$BUCKET_NAME/index.html
gcloud storage buckets update gs://$BUCKET_NAME --web-main-page-suffix=index.html

echo "---------------------------------------------------"
echo "🎉 DEPLOYMENT ERFOLGREICH!"
echo "🔗 Frontend URL: https://storage.googleapis.com/$BUCKET_NAME/index.html"
echo "---------------------------------------------------"
