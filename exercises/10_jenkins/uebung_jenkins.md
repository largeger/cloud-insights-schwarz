# Übung 10: CI/CD mit Jenkins

In dieser Übung lernst du die klassische CI/CD-Automatisierung mit Jenkins und einer `Jenkinsfile` (Pipeline as Code) kennen.

## Lernziele
- Lokales Setup eines Jenkins-Servers via Docker.
- Erstellen einer Pipeline-Definition (`Jenkinsfile`).
- Stages und Post-Actions verstehen.

---

## Aufgabe 1: Jenkins Setup
1. Starte Jenkins lokal mittels Docker Compose:
   ```bash
   cd exercises/10_jenkins/setup/
   docker-compose -f docker-compose-jenkins.yml up -d
   ```
2. Öffne `http://localhost:8081` im Browser.
3. Hole das Initial Admin Password aus dem Container:
   ```bash
   docker exec jenkins-local cat /var/jenkins_home/secrets/initialAdminPassword
   ```
4. Installiere die "Suggested Plugins".

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
