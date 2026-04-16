# 🚢 Übung 06: Kubernetes (K8s) Deep Dive

Willkommen in der "Champions League" der Container-Orchestrierung! In dieser Übung lernst du, wie du eine Anwendung nicht nur als einzelnen Container, sondern als skalierbares, selbstheilendes System in Kubernetes verwaltest.

---

## 🎯 Lernziele
- Verstehen von K8s **Deployments** (Soll-Zustand).
- Verstehen von K8s **Services** (Zugang & Load Balancing).
- Lokaler Cluster vs. Managed GKE Cluster in der Cloud.

---

## 🛠️ Vorbedingungen (Prerequisites)

Bevor du startest, brauchst du ein lokales Kubernetes-Setup und das Google Auth-Plugin:

### 1. Google Cloud Auth-Plugin (WICHTIG!)
Da GKE eine sichere Authentifizierung nutzt, muss ein spezielles Plugin für `kubectl` installiert sein:
```bash
gcloud components install gke-gcloud-auth-plugin
```

### 2. Lokaler Cluster: Docker Desktop (Empfohlen für Windows/Mac)
- Öffne die Docker Desktop Settings. ⚙️
- Gehe zu "Kubernetes" und aktiviere den Haken "Enable Kubernetes". ✅
- Klicke auf "Apply & Restart". (Das dauert einen Moment).

### Option B: Minikube
- Installiere Minikube und starte es mit `minikube start`.

---

## 🏗️ Teil 1: Lokales Kubernetes (Schritt 1)

In diesem Teil arbeitest du auf deinem lokalen Rechner mit dem Tool `kubectl`.

### 1. Prüfe deinen Cluster
Stelle sicher, dass `kubectl` auf deinen lokalen Cluster zeigt:
```bash
kubectl get nodes
```
*(Du solltest eine Liste mit einem Node namens "docker-desktop" oder "minikube" sehen).*

### 2. Manifest anwenden
Gehe in den Ordner `exercises/06_kubernetes/app/` und wende das Manifest an:
```bash
kubectl apply -f k8s-manifest.yaml
```

### 3. Was ist passiert?
Prüfe den Zustand deiner "Flotte":
```bash
kubectl get deployments
kubectl get pods
```
Du solltest **3 Pods** sehen, die laufen. Kubernetes sorgt dafür, dass dieser Zustand erhalten bleibt! 👯‍♂️

### 4. Die Anwendung aufrufen
Lokal wird kein echter Cloud-LoadBalancer erstellt. Um die Seite zu sehen, nutze ein Port-Forwarding:
```bash
kubectl port-forward service/hello-world-service 8080:80
```
Öffne nun `http://localhost:8080` im Browser. (Beende danach mit `Strg + C`).

---

## ☁️ Teil 2: Google Kubernetes Engine (Schritt 2)

Nun bringen wir das Ganze in die Cloud. Wir nutzen die **GKE Autopilot** (Google Kubernetes Engine), bei der Google die Server für uns verwaltet.

### 1. Cloud-Projekt prüfen
Stelle sicher, dass die Projekt-ID gesetzt ist:
```bash
gcloud config set project [DEINE_PROJEKT_ID]
```

### 2. GKE Setup-Skript ausführen
Führe das bereitgestellte Skript aus. **Hinweis:** Das Erstellen des Clusters dauert ca. 5-10 Minuten. Perfekte Zeit für einen Kaffee! ☕
```bash
./deploy_gke.sh
```

### 3. Den LoadBalancer testen
Sobald das Skript fertig ist, hole dir die **EXTERNAL-IP** deines Services:
```bash
kubectl get service hello-world-service
```
Öffne diese IP im Browser. Dein Nginx läuft nun hochverfügbar in der Google Cloud! 🌐🚀

---

## 💡 Bonus-Aufgaben (Self-Healing)
1. Lösche manuell einen Pod: `kubectl delete pod [NAME_EINES_PODS]`.
2. Beobachte sofort mit `kubectl get pods`, was Kubernetes tut.
3. **Erkenntnis:** K8s bemerkt die Abweichung vom Soll-Zustand (3 Replicas) und startet sofort einen neuen Pod! ❤️
