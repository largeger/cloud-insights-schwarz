# Lösung Übung 11: CI/CD mit Jenkins 🤖

## 1. Lokales Setup 💻
Das Docker-Compose Setup nutzt das offizielle LTS Image von Jenkins. Der Port 8081 wurde gewählt, um Konflikte mit anderen lokalen Diensten (oft 8080) zu vermeiden.

## 2. Das Jenkinsfile (Erklärung) 📜
- `agent any`: Die Pipeline kann auf jedem verfügbaren Jenkins-Node laufen.
- `stages`: Logische Abschnitte für die einzelnen Schritte.
- `post`: Aktionen, die nach Abschluss der Pipeline ausgeführt werden (z.B. Benachrichtigungen).

## 3. Cloud Setup (GKE) ☁️
Die Installation auf GKE erfolgt über **Helm**. Dies ist der Industriestandard für komplexe Applikationen auf Kubernetes.
- Das Skript `deploy_jenkins_gke.sh` automatisiert:
  - Helm Repo Management.
  - Namespace Erstellung.
  - Provisionierung eines Google Cloud Load Balancers (via `serviceType=LoadBalancer`).
  - Sicheres Auslesen des generierten Passworts aus den K8s Secrets.

## 4. Wichtige Jenkins Plugins
Für eine moderne Cloud-Pipeline werden meist folgende Plugins benötigt:
- **Docker Pipeline**: Erlaubt die Nutzung von Docker-Containern als Build-Agents.
- **Google Kubernetes Engine Plugin**: Für das Deployment direkt in GKE.
- **Git**: Zur Anbindung von Repositories.
