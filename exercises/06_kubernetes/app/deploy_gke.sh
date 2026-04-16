#!/bin/bash

# ==============================================================================
# Cloud Basics 2026 - Kubernetes (GKE) Deployment
# ==============================================================================
# Dieses Skript erstellt einen GKE Autopilot Cluster und deployt das Manifest.
# ACHTUNG: Das Erstellen des Clusters dauert ca. 5-10 Minuten! ☕
# ==============================================================================

# Variablen
PROJECT_ID=$(gcloud config get-value project 2>/dev/null | tr -d '\r')
CLUSTER_NAME="cloud-basics-cluster"
REGION="europe-west3" # Frankfurt

if [ -z "$PROJECT_ID" ]; then
    echo "❌ FEHLER: Keine Google Cloud Projekt-ID gefunden."
    exit 1
fi

# Prüfung auf Auth-Plugin
if ! gcloud components list --filter="id:gke-gcloud-auth-plugin" --format="value(state.name)" | grep -q "Installed"; then
    echo "⚠️  WARNUNG: Das 'gke-gcloud-auth-plugin' fehlt vermutlich."
    echo "Bitte installiere es mit: gcloud components install gke-gcloud-auth-plugin"
    echo "Falls du gcloud per msi/apt installiert hast, folge der Google Dokumentation."
fi

echo "🚀 Starte GKE Setup für Projekt: $PROJECT_ID"

# 1. API Services aktivieren
echo "--------------------------------------------------------"
echo "🛠️  Aktiviere Kubernetes API..."
gcloud services enable container.googleapis.com

# 2. Cluster erstellen (Autopilot)
# Autopilot ist ideal, da Google die Nodes & Security verwaltet.
echo "--------------------------------------------------------"
echo "🏗️  Erstelle GKE Autopilot Cluster (Dauer: ~5-10 Min)..."
gcloud container clusters create-auto $CLUSTER_NAME \
    --region $REGION

# 3. Credentials für kubectl holen
echo "--------------------------------------------------------"
echo "🔐 Verbinde kubectl mit dem neuen Cluster..."
gcloud container clusters get-credentials $CLUSTER_NAME --region $REGION

# 4. Manifest deployen
echo "--------------------------------------------------------"
echo "🚢 Deploye Anwendung (Deployment & Service)..."
kubectl apply -f k8s-manifest.yaml

# 5. Status abfragen
echo "--------------------------------------------------------"
echo "⏳ Warte auf LoadBalancer IP (kann 1-2 Min dauern)..."
kubectl get service hello-world-service --watch &
WATCH_PID=$!

# Warte kurz, damit der Nutzer die IP sieht, dann beende den Watch
sleep 10
kill $WATCH_PID

echo "--------------------------------------------------------"
echo "✅ Fertig! Deine K8s-App wird deployt."
echo "Prüfe den Status mit: kubectl get pods"
echo "Hole die externe IP mit: kubectl get service hello-world-service"
