# ✅ Lösung: Übung 3.2: 3-Tier Architektur mit Postgres & pgAdmin

## 1. Architektur-Verständnis
- **Warum Datenbank separat?** In der Cloud trennen wir Logik (pgAdmin) von Daten (Postgres), um sie unabhängig voneinander skalieren zu können. Wenn die Logikschicht (der Container) abstürzt, bleiben die Daten in Cloud SQL sicher und unberührt.
- **Vorteil Cloud SQL:** GCP übernimmt das Patchen, Backups, Monitoring und die Hochverfügbarkeit. Du musst dich nicht um die Wartung der zugrunde liegenden VM kümmern.
- **Sichere Kommunikation:** Wir nutzen den **Cloud SQL Auth Proxy** (in Cloud Run eingebaut) oder **Private Service Connect (VPC)**. Dadurch muss die Datenbank nicht im öffentlichen Internet stehen.

## 2. Konfiguration & Deployment
Um pgAdmin im Docker-Container (Logic Tier) zu betreiben, sind folgende Umgebungsvariablen nötig:
- `PGADMIN_DEFAULT_EMAIL`: Deine Login-E-Mail (z.B. `admin@example.com`).
- `PGADMIN_DEFAULT_PASSWORD`: Dein sicheres Passwort für pgAdmin.
- `PGADMIN_CONFIG_SERVER_MODE`: Muss auf `True` stehen (Standard in vielen Images).

## 3. Sicherheit & Zugriff
- **pgAdmin Schutz:** Wir könnten **Google Cloud Identity-Aware Proxy (IAP)** davor schalten, um sicherzustellen, dass nur autorisierte Mitarbeiter die Web-Oberfläche überhaupt sehen können.
- **Öffentliche IP:** Datenbanken enthalten sensible Firmendaten. Eine öffentliche IP macht sie anfällig für Brute-Force-Angriffe. In einer 3-Tier Architektur sollte die DB nur für die Logic-Schicht (pgAdmin/App) erreichbar sein.

---

## 🚀 Das Deployment-Skript verstehen
Das beigelegte Skript `deploy_postgres_gcp.sh` führt folgende Schritte aus:
1.  **Aktiviert APIs:** `sqladmin.googleapis.com` (Cloud SQL) und `run.googleapis.com` (Cloud Run).
2.  **Erstellt Datenbank:** Eine Cloud SQL PostgreSQL Instanz (Micro-Instanz für Testzwecke).
3.  **Bereitet pgAdmin vor:** Nutzt das offizielle `dpage/pgadmin4` Image.
4.  **Verknüpft Cloud Run mit Cloud SQL:** Über die sogenannte Cloud SQL Verbindung (`add-cloudsql-instances`).

---
*Glückwunsch! Du hast verstanden, wie man Datenbanken sicher in der Cloud verwaltet.* 🐘🚀
