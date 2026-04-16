# Lösung Übung 10: CI/CD mit Jenkins

## 1. Lokales Setup
Das Docker-Compose Setup nutzt das offizielle LTS Image von Jenkins. Der Port 8081 wurde gewählt, um Konflikte mit anderen lokalen Diensten (oft 8080) zu vermeiden.

## 2. Das Jenkinsfile (Erklärung)
- `agent any`: Die Pipeline kann auf jedem verfügbaren Jenkins-Node laufen.
- `stages`: Container für die einzelnen Schritte.
- `post`: Aktionen, die nach Abschluss der Pipeline ausgeführt werden (z.B. Benachrichtigungen).

## 3. Deployment auf GKE (Alternative)
Um Jenkins auf GKE zu installieren, nutzt man am besten **Helm**:
```bash
helm repo add jenkins https://charts.jenkins.io
helm repo update
helm install my-jenkins jenkins/jenkins --namespace jenkins --create-namespace
```

## 4. Wichtige Jenkins Plugins
Für eine moderne Cloud-Pipeline werden meist folgende Plugins benötigt:
- **Docker Pipeline**: Erlaubt die Nutzung von Docker-Containern als Build-Agents.
- **Google Kubernetes Engine Plugin**: Für das Deployment direkt in GKE.
- **Git**: Zur Anbindung von Repositories.
