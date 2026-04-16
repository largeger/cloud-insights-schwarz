# ✅ Lösung: Design einer 3-Tier Web-Applikation auf Google Cloud (GCP)

## 1. Empfohlene Service-Auswahl (GCP Portfolio)

| Komponente | Gewählter GCP Service | Begründung |
| :--- | :--- | :--- |
| **Hosting der React SPA** | **Google Cloud Storage (GCS)** (als statische Website) oder **Firebase Hosting** | Günstig, hochverfügbar, keine Server zu managen. Firebase bietet zusätzlich einfache CI/CD-Anbindung. |
| **Hosting der Container** | **Cloud Run** | Vollständig verwalteter "Serverless"-Service für Container. Skaliert automatisch auf Null (kosteneffizient) und bei Last hoch. |
| **Relationale Datenbank** | **Cloud SQL** (PostgreSQL/MySQL) | Vollständig verwaltet: Backups, Patches und Hochverfügbarkeit per Mausklick. |
| **Speicher für Produktbilder**| **Google Cloud Storage (GCS)** | Ideal für unstrukturierte Daten (Bilder/PDFs) mit fast unbegrenzter Kapazität. |
| **Beschleunigung weltweit** | **Cloud CDN** | In Kombination mit GCS oder dem Load Balancer: Speichert Bilder an Edge-Locations (nah am Kunden) für blitzschnelles Laden. |

---

## 2. Der Weg des User-Requests (Warenkorb-Beispiel)

1.  **User-Browser:** Der Kunde klickt auf "In den Warenkorb".
2.  **DNS (Cloud DNS):** Übersetzt `www.cloud-store.de` in die IP des Google Load Balancers.
3.  **Global Load Balancer:** Nimmt den HTTPS-Request entgegen und leitet ihn an den nächsten freien **Cloud Run** Backend-Container weiter.
4.  **Backend (Microservice):** Der Container verarbeitet den Request (Logik: "Darf der User das?").
5.  **Datenbank (Cloud SQL):** Der Service schreibt die neue Warenkorb-Position in die Datenbank.
6.  **Response:** Das Backend schickt eine Bestätigung (HTTP 200 OK) als JSON an das Frontend zurück.
7.  **User-Browser:** React aktualisiert die Anzeige (Warenkorb-Zähler erhöht sich um eins).

---

## 3. Skalierung & Sicherheit (Diskussion)

### 📈 Skalierung am "Black Friday"
- **Horizontal:** Durch **Cloud Run** skaliert das Backend automatisch (Scale-Out). Wenn mehr User kommen, startet GCP einfach mehr Container-Instanzen (Elastizität!).
- **Datenbank:** In **Cloud SQL** können wir ein größeres Instanz-Profil (Vertikale Skalierung) wählen oder Read Replicas (Horizontale Skalierung für Lesezugriffe) hinzufügen.

### 🛡️ Platzierung von Load Balancer & WAF
- Der **HTTP(S) Load Balancer** bildet den "Eingang" (Ingress) in die Cloud-Umgebung.
- Direkt am Load Balancer aktivieren wir **Google Cloud Armor** (die Web Application Firewall - WAF), um SQL-Injection oder DDoS-Angriffe zu stoppen.

### 🔐 Sicherheit (Secrets & IAM)
- Wir verwenden **Secret Manager** zum Speichern von DB-Passwörtern oder API-Keys.
- Die Services nutzen **Cloud IAM (Identity and Access Management)**. Das Backend-Cloud-Run bekommt eine "Service Account"-Rolle, die es ihm erlaubt, ohne Passwort auf Cloud SQL zuzugreifen (mittels IAM-Authentifizierung oder Cloud SQL Auth Proxy).

---
*Glückwunsch! Mit dieser Architektur ist der Cloud-Store bereit für das globale Geschäft!* ☁️🚀
