#!/bin/bash

# Konfiguration
PROJECT_ID=$(gcloud config get-value project)
CLUSTER_NAME="cloud-basics-cluster"
REGION="europe-west3"
RELEASE_NAME="my-helm-app"
CHART_PATH="./charts/web-app"

echo "Using Project: $PROJECT_ID"

# Prüfen ob GKE Cluster existiert (optional, hier wird davon ausgegangen, dass er aus Übung 06 da ist)
echo "Connecting to GKE Cluster..."
gcloud container clusters get-credentials $CLUSTER_NAME --region $REGION --project $PROJECT_ID

if [ $? -ne 0 ]; then
    echo "Fehler: Konnte keine Verbindung zum Cluster $CLUSTER_NAME herstellen."
    echo "Stelle sicher, dass der Cluster aus Übung 06 noch läuft."
    exit 1
fi

# Helm Deployment
echo "Starting Helm Deployment..."
helm upgrade --install $RELEASE_NAME $CHART_PATH \
    --set service.type=LoadBalancer \
    --set replicaCount=2 \
    --namespace default \
    --wait

if [ $? -eq 0 ]; then
    echo "---------------------------------------------------"
    echo "Deployment erfolgreich!"
    echo "Hole externe IP (kann einen Moment dauern)..."
    EXTERNAL_IP=""
    while [ -z "$EXTERNAL_IP" ]; do
        EXTERNAL_IP=$(kubectl get svc "$RELEASE_NAME-web-app" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
        [ -z "$EXTERNAL_IP" ] && sleep 5
    done
    echo "Die Web-App ist erreichbar unter: http://$EXTERNAL_IP"
    echo "---------------------------------------------------"
else
    echo "Deployment fehlgeschlagen."
fi
