#!/bin/bash

# Konfiguration
PROJECT_ID=$(gcloud config get-value project)
CLUSTER_NAME="cloud-basics-cluster"
REGION="europe-west3"
NAMESPACE="jenkins"

echo "Using Project: $PROJECT_ID"

# 1. Verbindung zum GKE Cluster herstellen
echo "Connecting to GKE Cluster..."
gcloud container clusters get-credentials $CLUSTER_NAME --region $REGION --project $PROJECT_ID

if [ $? -ne 0 ]; then
    echo "Fehler: Cluster $CLUSTER_NAME nicht gefunden."
    exit 1
fi

# 2. Helm Repo hinzufügen
echo "Adding Jenkins Helm Repo..."
helm repo add jenkins https://charts.jenkins.io
helm repo update

# 3. Jenkins installieren (via Helm)
echo "Installing Jenkins via Helm..."
# Wir nutzen ein paar Standard-Settings für den Kurs (ServiceType=LoadBalancer)
helm upgrade --install my-jenkins jenkins/jenkins \
    --namespace $NAMESPACE \
    --create-namespace \
    --set controller.serviceType=LoadBalancer \
    --wait

if [ $? -eq 0 ]; then
    echo "---------------------------------------------------"
    echo "Jenkins erfolgreich auf GKE installiert!"
    
    # 4. Passwort abrufen
    echo "Hole Initial Admin Password..."
    JENKINS_PASSWORD=$(kubectl exec --namespace $NAMESPACE -it svc/my-jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password 2>/dev/null || \
                      kubectl get secret --namespace $NAMESPACE my-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode)
    
    # 5. IP Adresse abrufen
    echo "Hole externe IP..."
    EXTERNAL_IP=""
    while [ -z "$EXTERNAL_IP" ]; do
        EXTERNAL_IP=$(kubectl get svc --namespace $NAMESPACE my-jenkins -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
        [ -z "$EXTERNAL_IP" ] && sleep 5
    done

    echo ""
    echo "URL: http://$EXTERNAL_IP:8080"
    echo "User: admin"
    echo "Passwort: $JENKINS_PASSWORD"
    echo "---------------------------------------------------"
else
    echo "Deployment fehlgeschlagen."
fi
