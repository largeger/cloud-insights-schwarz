#!/bin/bash

# ==============================================================================
# Cloud Basics 2026 - Docker Deployment auf Google Cloud Run
# ==============================================================================
# Dieses Skript nutzt Google Cloud Build, um ein Container-Image zu bauen,
# und deployt es anschließend auf Google Cloud Run (PaaS).
# ==============================================================================

# Setze Variablen für das Projekt
# Entferne mögliche \r Zeichen (Windows Carriage Return) aus den gcloud Outputs
PROJECT_ID=$(gcloud config get-value project 2>/dev/null | tr -d '\r')
SERVICE_NAME="docker-hello-world"
REGION="europe-west3" # Frankfurt

# Falls die Projekt-ID nicht gesetzt ist, Abbruch
if [ -z "$PROJECT_ID" ]; then
    echo "❌ FEHLER: Keine Google Cloud Projekt-ID gefunden."
    echo "Bitte setze dein Projekt mit: gcloud config set project [PROJEKT_ID]"
    exit 1
fi

echo "🚀 Starte Deployment für Projekt: $PROJECT_ID"
echo "📦 Service: $SERVICE_NAME"
echo "🌍 Region:  $REGION"

# 1. API Services aktivieren (falls noch nicht geschehen)
echo "--------------------------------------------------------"
echo "🛠️  Aktiviere benötigte Cloud APIs..."
gcloud services enable run.googleapis.com \
                       artifactregistry.googleapis.com \
                       cloudbuild.googleapis.com

# 2. Deployment auf Cloud Run
# --source . bewirkt, dass Cloud Build den Build-Prozess übernimmt
echo "--------------------------------------------------------"
echo "🏗️  Baue Image und deploye auf Cloud Run..."
gcloud run deploy $SERVICE_NAME \
    --source . \
    --region $REGION \
    --allow-unauthenticated \
    --port 80

# 3. Ergebnis anzeigen
echo "--------------------------------------------------------"
if [ $? -eq 0 ]; then
    echo "✅ SUCCESS! Dein Container ist live."
    echo "🔗 Die URL findest du oben in der Ausgabe von Cloud Run."
else
    echo "❌ FEHLER beim Deployment."
fi
