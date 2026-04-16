# Übung 07: Kubernetes Paketmanagement mit Helm

In dieser Übung lernst du, wie man Kubernetes-Anwendungen mit **Helm** paketiert, konfiguriert und bereitstellt. Helm wird oft als der "Package Manager für Kubernetes" bezeichnet.

## Lernziele
- Struktur eines Helm-Charts verstehen
- Lokale Installation und Test eines Charts
- Deployment auf Google Kubernetes Engine (GKE) mittels Helm
- Anpassung von Parametern über `values.yaml`

## Voraussetzungen
- Installiertes `helm` CLI (`brew install helm` oder `choco install kubernetes-helm`)
- Ein laufender Kubernetes-Cluster (lokal: Docker Desktop/Minikube oder Cloud: GKE)
- `kubectl` ist konfiguriert

---

## Aufgabe 1: Lokale Installation (Test)

1. Navigiere in das Verzeichnis `exercises/07_helm/app/charts/web-app`.
2. Validiere das Chart auf Syntaxfehler:
   ```bash
   helm lint .
   ```
3. Führe einen "Dry Run" durch, um zu sehen, welche Kubernetes-Manifeste generiert würden:
   ```bash
   helm install my-test-release . --dry-run --debug
   ```
4. Installiere das Chart lokal:
   ```bash
   helm install my-web-app .
   ```
5. Überprüfe den Status:
   ```bash
   helm list
   kubectl get pods,svc
   ```

---

## Aufgabe 2: Anpassung mit Values

1. Ändere die Anzahl der Replikate in der `values.yaml` von 2 auf 3.
2. Aktualisiere die laufende Installation:
   ```bash
   helm upgrade my-web-app .
   ```
3. Verifiziere, dass nun 3 Pods laufen.

---

## Aufgabe 3: Deployment auf GKE (Cloud)

Verwende das bereitgestellte Skript `deploy_helm_gke.sh`, um das Chart auf einen GKE-Cluster zu schieben. Das Skript übernimmt die Verbindung zum Cluster und führt `helm upgrade --install` aus.

**Vorgehensweise:**
1. Stelle sicher, dass du in der Google Cloud CLI eingeloggt bist (`gcloud auth login`).
2. Führe das Skript aus:
   ```bash
   cd exercises/07_helm/app/
   ./deploy_helm_gke.sh
   ```

---

## Aufgabe 4: Cleanup

Entferne die Installationen:
```bash
helm uninstall my-web-app
```
