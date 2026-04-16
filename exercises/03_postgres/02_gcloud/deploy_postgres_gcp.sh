#!/bin/bash

# --- KONFIGURATION ---
PROJECT_ID=$(gcloud config get-value project | tr -d '\r')
REGION="europe-west3" # Frankfurt
DB_INSTANCE_NAME="cloud-basics-db-$(date +%s)"
DB_PASSWORD="SuperSecurePassword123"
PGADMIN_EMAIL="admin@example.com"
PGADMIN_PASSWORD="pgAdminPassword123"

if [ -z "$PROJECT_ID" ]; then
    echo "❌ FEHLER: Keine Project ID gefunden. Bitte 'gcloud config set project [ID]' ausführen."
    exit 1
fi

echo "🚀 Starte Deployment für Projekt: $PROJECT_ID"

# 1. APIs aktivieren
echo "📦 Aktiviere APIs (Cloud Run & Cloud SQL)..."
gcloud services enable run.googleapis.com \
                       sqladmin.googleapis.com \
                       compute.googleapis.com

# 2. Cloud SQL Instanz erstellen (Tier 3: Data)
echo "🐘 Erstelle Cloud SQL PostgreSQL Instanz (das kann dauern...)"
# Fix: Wir lassen die Public IP aktiviert, damit das Skript ohne VPC-Setup funktioniert.
# Der Zugriff ist trotzdem sicher, da nur autorisierte Nutzer/Services via Proxy rankommen.
gcloud sql instances create $DB_INSTANCE_NAME \
    --database-version=POSTGRES_15 \
    --tier=db-f1-micro \
    --region=$REGION \
    --root-password=$DB_PASSWORD

# 3. pgAdmin auf Cloud Run deployen (Tier 1 & 2)
echo "🚢 Deploye pgAdmin auf Cloud Run..."
# Fix: pgAdmin muss auf Port 8080 hören, damit Cloud Run den Health-Check besteht.
gcloud run deploy pgadmin-service \
    --image=dpage/pgadmin4 \
    --platform=managed \
    --region=$REGION \
    --set-env-vars="PGADMIN_DEFAULT_EMAIL=$PGADMIN_EMAIL,PGADMIN_DEFAULT_PASSWORD=$PGADMIN_PASSWORD,PGADMIN_CONFIG_SERVER_MODE=True,PGADMIN_LISTEN_PORT=8080" \
    --add-cloudsql-instances="${PROJECT_ID}:${REGION}:${DB_INSTANCE_NAME}" \
    --allow-unauthenticated

# 4. Zusammenfassung
SERVICE_URL=$(gcloud run services describe pgadmin-service --platform=managed --region=$REGION --format 'value(status.url)' | tr -d '\r')
CONNECTION_NAME=$(gcloud sql instances describe $DB_INSTANCE_NAME --format 'value(connectionName)' | tr -d '\r')

echo "---------------------------------------------------"
echo "🎉 DEPLOYMENT ABGESCHLOSSEN!"
echo "🔗 pgAdmin URL: $SERVICE_URL"
echo "📧 Login E-Mail: $PGADMIN_EMAIL"
echo "🔑 Login Passwort: $PGADMIN_PASSWORD"
echo ""
echo "🐘 DB Verbindungs-Infos für pgAdmin:"
echo "   Host: /cloudsql/$CONNECTION_NAME"
echo "   User: postgres"
echo "   Passwort: $DB_PASSWORD"
echo "---------------------------------------------------"
