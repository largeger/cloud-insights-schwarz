# 💡 Lösung & Erklärung: Kubernetes Deep Dive

In dieser Übung hast du die mächtigste Art der Cloud-Infrastruktur kennengelernt: Managed Kubernetes. Hier ist die Auflösung dazu.

---

## 🏗️ Teil 1: Lokales Kubernetes

Das Tool **`kubectl`** ist der einzige Befehl, den du brauchst. Es schickt Befehle an die K8s-API deines Clusters. Das `k8s-manifest.yaml` beschreibt zwei Dinge:

### 📜 Das Deployment
Hier definierst du den **Soll-Zustand** (Desired State):
- **`replicas: 3`**: Du willst immer 3 laufende Kopien deiner App.
- **`selector`**: Kubernetes weiß so, welche Pods zu diesem Deployment gehören.
- **`resources`**: Wichtig für die Cloud! Du sagst K8s genau, wie viel CPU und RAM deine App braucht. So kann K8s die Server optimal ausnutzen. 📏

### 🚦 Der Service
Ein Deployment erstellt vergängliche Pods mit wechselnden IPs. Ein Service ist der **stabile Ankerpunkt**:
- Er verteilt den Traffic auf alle 3 Pods (Load Balancing).
- Er bietet einen festen Namen innerhalb des Clusters.

---

## ☁️ Teil 2: Google Kubernetes Engine (GKE)

In der Cloud passiert etwas Magisches, wenn du den Service-Typ **`LoadBalancer`** nutzt:
1. Google Cloud erkennt diesen Wunsch.
2. Google erstellt automatisch einen physischen **Cloud Load Balancer**. 🚦
3. Dieser erhält eine öffentliche IP und leitet den Traffic in deinen Cluster weiter.

### GKE Autopilot vs. Standard 🚢
- **GKE Standard**: Du musst die virtuellen Maschinen (Nodes) selbst auswählen und warten. Du zahlst pro VM.
- **GKE Autopilot**: Du definierst nur deine App (Pods). Google kümmert sich um die Server, skaliert sie und sichert sie ab. Du zahlst nur für die Ressourcen, die deine Pods tatsächlich verbrauchen. 💡

---

## 🚦 Troubleshooting
- **`kubectl get pods` zeigt 'Pending'**: In GKE Autopilot kann das beim ersten Start 1-2 Minuten dauern, da Google erst die passende Hardware bereitstellen muss.
- **LoadBalancer IP ist 'pending'**: Das Erstellen einer öffentlichen IP in der Cloud dauert systembedingt ca. 1-2 Minuten. Hab Geduld! ⏳
- **Keine Berechtigung**: Stelle sicher, dass du das Skript `./deploy_gke.sh` in einer Umgebung mit vollen Rechten ausführst.
