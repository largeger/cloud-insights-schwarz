#!/bin/bash

# ==============================================================================
# Cloud Basics 2026 - OWASP Juice Shop Deployment auf Google Cloud Run
# ==============================================================================
# Dieses Skript deployt den OWASP Juice Shop direkt als Container-Image
# auf Google Cloud Run (PaaS).
# ==============================================================================

# Setze Variablen für das Projekt
# Entferne mögliche \r Zeichen (Windows Carriage Return) aus den gcloud Outputs
PROJECT_ID=$(gcloud config get-value project 2>/dev/null | tr -d '\r')
SERVICE_NAME="juice-shop"
REGION="europe-west3" # Frankfurt
IMAGE="bkimminich/juice-shop"

# Falls die Projekt-ID nicht gesetzt ist, Abbruch
if [ -z "$PROJECT_ID" ]; then
    echo "❌ FEHLER: Keine Google Cloud Projekt-ID gefunden."
    echo "Bitte setze dein Projekt mit: gcloud config set project [PROJEKT_ID]"
    exit 1
fi

echo "--------------------------------------------------------"
echo "🚀 Starte Deployment für Projekt: $PROJECT_ID"
echo "📦 Service: $SERVICE_NAME"
echo "🌍 Region:  $REGION"
echo "--------------------------------------------------------"

# 1. Deployment auf Cloud Run
# Wir nutzen das fertige Docker-Hub Image direkt
echo "🏗️  Deploye Juice Shop Image auf Cloud Run..."
gcloud run deploy $SERVICE_NAME \
    --image=$IMAGE \
    --platform=managed \
    --region=$REGION \
    --allow-unauthenticated \
    --port=3000

# 2. Ergebnis anzeigen & URL extrahieren
echo "--------------------------------------------------------"
if [ $? -eq 0 ]; then
    # URL extrahieren und von \r säubern
    URL=$(gcloud run services describe $SERVICE_NAME --platform=managed --region=$REGION --format='value(status.url)' | tr -d '\r')
    echo "✅ SUCCESS! Dein Juice Shop ist live."
    echo "🔗 URL: $URL"
    echo ""
    echo "💡 Löschen mit: gcloud run services delete $SERVICE_NAME --region=$REGION --quiet"
else
    echo "❌ FEHLER beim Deployment."
fi
echo "--------------------------------------------------------"
