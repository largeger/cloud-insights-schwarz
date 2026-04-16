# 🐳 Übung 05: Docker in der Cloud

Willkommen in der Welt der Container! In dieser Übung lernst du, wie du eine einfache Webseite in einen Docker-Container verpackst, diesen lokal testest und ihn anschließend auf Google Cloud Run (PaaS) veröffentlichst.

## 🎯 Lernziele
- Verstehen, wie ein `Dockerfile` aufgebaut ist.
- Container-Images lokal bauen und ausführen.
- Images in die Cloud pushen und dort hosten.

---

## 🏗️ Teil 1: Lokales Docker (Schritt 1)

In diesem Teil arbeitest du auf deinem eigenen Rechner.

### 1. Projektstruktur ansehen
Navigiere in den Ordner `exercises/05_docker/app/`. Dort findest du:
- `index.html`: Deine einfache Webseite.
- `Dockerfile`: Die "Bauanleitung" für deinen Container.

### 2. Das Image bauen
Öffne ein Terminal (z. B. Git Bash unter Windows) im Ordner `app/` und baue dein Image:
```bash
docker build -t mein-web-container .
```
*(Das `-t` steht für "Tag" – also der Name des Images. Der Punkt `.` am Ende sagt: "Nutze das Dockerfile in diesem Ordner".)*

### 3. Den Container starten
Starte deinen Container und verknüpfe den Port 80 des Containers mit dem Port 8080 deines Rechners:
```bash
docker run -p 8080:80 mein-web-container
```

### 4. Testen
Öffne deinen Browser und gehe auf: `http://localhost:8080`
Siehst du deine Seite? 🥳 (Beende den Container im Terminal mit `Strg + C`).

---

## ☁️ Teil 2: Google Cloud Hosting (Schritt 2)

Nun bringen wir den Container ins Internet. Wir nutzen dafür **Google Cloud Run**, einen serverlosen Dienst, der Container automatisch ausführt und skaliert.

### 1. Cloud-Projekt prüfen
Stelle sicher, dass du in der gcloud CLI angemeldet bist und das richtige Projekt gesetzt hast:
```bash
gcloud auth login
gcloud config set project [DEINE_PROJEKT_ID]
```

### 2. Deployment-Skript nutzen
Wir haben ein Skript vorbereitet, das alles für dich erledigt:
- Es aktiviert die nötigen Cloud-APIs.
- Es schickt deinen Code an **Cloud Build**, wo das Image direkt in der Cloud gebaut wird.
- Es erstellt einen **Cloud Run Service**.

Führe das Skript aus:
```bash
./deploy_docker_gcp.sh
```

### 3. Live-Test
Am Ende des Skripts erhältst du eine URL (z. B. `https://docker-hello-world-xxxxxx.a.run.app`). Öffne diese im Browser.
**Glückwunsch! Deine App ist weltweit erreichbar.** 🌍🚀

---

## 💡 Bonus-Aufgaben
- Ändere den Text in der `index.html` und deploye erneut. Was passiert mit der URL?
- Schaue dir in der Google Cloud Console den Bereich "Cloud Run" an. Wie viel CPU/RAM verbraucht dein Container?
