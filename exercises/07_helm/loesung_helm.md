# Lösung Übung 07: Kubernetes Paketmanagement mit Helm

## Aufgabe 1: Lokale Installation

Validierung:
```bash
helm lint ./charts/web-app
```

Installation:
```bash
helm install local-web-app ./charts/web-app
```

## Aufgabe 2: Upgrade mit Values

Manuelles Upgrade über Kommandozeile (statt Datei-Änderung):
```bash
helm upgrade local-web-app ./charts/web-app --set replicaCount=3
```

## Aufgabe 3: GKE Deployment

Das Skript `deploy_helm_gke.sh` führt im Wesentlichen folgende Schritte aus:

1. **Projekt-Konfiguration:**
   ```bash
   PROJECT_ID=$(gcloud config get-value project)
   CLUSTER_NAME="my-cluster" # Oder dein existierender GKE-Cluster
   REGION="europe-west3"
   ```

2. **Cluster-Verbindung:**
   ```bash
   gcloud container clusters get-credentials $CLUSTER_NAME --region $REGION
   ```

3. **Helm-Installation:**
   ```bash
   helm upgrade --install gke-web-app ./charts/web-app \
     --set service.type=LoadBalancer \
     --wait
   ```

## Nützliche Helm-Befehle

- `helm list`: Zeigt alle installierten Releases.
- `helm status <release>`: Status einer spezifischen Installation.
- `helm history <release>`: Zeigt die Revisionshistorie (gut für Rollbacks).
- `helm rollback <release> <revision>`: Geht zu einer alten Version zurück.
- `helm uninstall <release>`: Löscht alles.
