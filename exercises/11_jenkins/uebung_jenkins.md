# Übung 11: CI/CD mit Jenkins 🤖

In dieser Übung lernst du die klassische CI/CD-Automatisierung mit Jenkins und einer `Jenkinsfile` (Pipeline as Code) kennen.

## Lernziele
- Lokales Setup eines Jenkins-Servers via Docker.
- Erstellen einer Pipeline-Definition (`Jenkinsfile`).
- Stages und Post-Actions verstehen.

---

## Aufgabe 1: Jenkins Setup (Wähle eine Option)

### Option A: Lokal via Docker Compose
1. Starte Jenkins lokal:
   ```bash
   cd exercises/11_jenkins/setup/
   docker-compose -f docker-compose-jenkins.yml up -d
   ```
2. Passwort abrufen: `docker exec jenkins-local cat /var/jenkins_home/secrets/initialAdminPassword`

### Option B: Cloud via Google Kubernetes Engine (GKE)
1. Nutze das bereitgestellte Skript, um Jenkins auf deinen Cluster zu schieben:
   ```bash
   cd exercises/11_jenkins/setup/
   ./deploy_jenkins_gke.sh
   ```
2. Das Skript gibt dir am Ende die URL und das Passwort aus.

## Aufgabe 2: Neue Pipeline erstellen
1. Wähle "New Item" -> "Pipeline" -> Name: `My-First-Pipeline`.
2. Scrolle zu "Pipeline Definition" und wähle "Pipeline script".
3. Kopiere den Inhalt des `Jenkinsfile` aus dieser Übung hinein.
4. Speichere und klicke auf "Build Now".

## Aufgabe 3: Pipeline-Visualisierung
- Schau dir den "Stage View" an. Welche Phasen wurden durchlaufen?
- Überprüfe den "Console Output" eines Runs.

## Aufgabe 4: Pipeline as Code (Bonus)
In einer realen Welt liegt das `Jenkinsfile` im Git Repository. Ändere die Job-Konfiguration auf "Pipeline script from SCM" und verbinde dein Git Repository.
