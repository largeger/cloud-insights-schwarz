# 🏗️ Übung 3.2: 3-Tier Webarchitektur mit Postgres & pgAdmin

## Ziel der Übung
In dieser Übung lernst du, wie man eine klassische Webarchitektur mit einem Datenbank-Verwaltungstool (**pgAdmin**) und einer verwalteten Datenbank (**Cloud SQL for PostgreSQL**) auf Google Cloud aufbaut.

Dabei verstehen wir die Schichten wie folgt:
1.  **Presentation Tier:** Der Browser, in dem du die pgAdmin-Weboberfläche aufrufst.
2.  **Logic Tier:** Der pgAdmin-Server, der als Container auf Cloud Run läuft und die SQL-Anfragen verarbeitet.
3.  **Data Tier:** Die verwaltete PostgreSQL-Datenbank auf Cloud SQL.

---

## 📝 Aufgabenstellung

### 1. Architektur-Verständnis
Beantworte folgende Fragen zum Aufbau:
- Warum lassen wir die Datenbank nicht im selben Container wie pgAdmin laufen?
- Welchen Vorteil bietet Cloud SQL gegenüber einer selbst installierten Postgres-Datenbank auf einer VM?
- Wie kommuniziert pgAdmin (Logic Tier) mit der Datenbank (Data Tier) sicher innerhalb von Google Cloud?

### 2. Konfiguration & Deployment (Theorie)
Welche Umgebungsvariablen (`Environment Variables`) braucht pgAdmin zwingend, um im Web-Modus zu starten?
*Tipp: Schau in die offizielle pgAdmin4 Docker Dokumentation.*

### 3. Sicherheit & Zugriff
- Wie schützen wir pgAdmin vor unbefugtem Zugriff aus dem öffentlichen Internet?
- Warum ist es wichtig, die Datenbank nicht über eine öffentliche IP erreichbar zu machen?

---

## 🛠️ Praktische Umsetzung (Vorschau)
Das beiliegende Skript `deploy_postgres_gcp.sh` wird folgendes tun:
1.  Eine Cloud SQL Instanz erstellen (PostgreSQL).
2.  Das offizielle pgAdmin Docker-Image auf Cloud Run deployen.
3.  Beide Komponenten miteinander verknüpfen.

---

## ⏱️ Zeitrahmen
- 15 Minuten für die theoretischen Fragen.
- 15 Minuten für das Ausführen und Testen des Deployment-Skripts.

---
*Viel Erfolg beim Aufbau deiner Datenbank-Architektur!* 🐘☁️
