# 🏗️ Übung: Design einer 3-Tier Web-Applikation auf Google Cloud (GCP)

## Ziel der Übung
In dieser Übung entwerft ihr die Cloud-Architektur für den **"Cloud-Store"** (einen modernen Online-Shop für Sneaker). Ihr lernt dabei, die passenden Google Cloud Services für die drei Schichten (Frontend, Backend, Database) auszuwählen und das Zusammenspiel der Komponenten zu verstehen.

---

## 🛒 Das Szenario: "Cloud-Store"
Euer Team hat den Auftrag, den "Cloud-Store" in die Google Cloud zu bringen. Die Applikation besteht aus:
1.  **Frontend:** Eine moderne Single Page Application (SPA) in React.
2.  **Backend:** Mehrere Microservices (Java/Spring Boot und Node.js), die als Docker-Container vorliegen.
3.  **Datenbank:** Eine relationale Datenbank für Kunden- und Bestelldaten sowie ein Speicherort für Millionen von Produktbildern.

---

## 📝 Aufgabenstellung

### 1. Service-Auswahl (GCP Portfolio)
Wählt für jede der folgenden Komponenten den am besten geeigneten Google Cloud Service aus. Begründet kurz eure Wahl (achtet auf Skalierbarkeit und geringen Wartungsaufwand).

| Komponente | Gewählter GCP Service | Begründung |
| :--- | :--- | :--- |
| **Hosting der React SPA** (Statische Dateien) | | |
| **Hosting der Container** (Microservices) | | |
| **Relationale Datenbank** (Kunden & Bestellungen) | | |
| **Speicher für Produktbilder** (unstrukturiert) | | |
| **Beschleunigung weltweit** (Caching von Bildern) | | |

### 2. Request-Response Cycle zeichnen
Skizziert (oder beschreibt textuell), welchen Weg ein User-Request nimmt, wenn er ein Produkt in den Warenkorb legt:
- Wo startet der Request?
- Welche Komponenten werden nacheinander durchlaufen?
- Wo werden Daten gelesen, wo werden sie geschrieben?

### 3. Skalierung & Sicherheit (Diskussion)
- Wie stellt ihr sicher, dass die Applikation am "Black Friday" (hoher Traffic) nicht abstürzt?
- Wo in eurer Architektur würdet ihr eine Firewall (WAF) oder einen Load Balancer platzieren?
- Wie greift das Backend sicher auf die Datenbank zu, ohne Passwörter im Code zu speichern?

---

## ⏱️ Zeitrahmen
- 20 Minuten für das Design
- 10 Minuten für die Besprechung im Team

---
*Viel Erfolg beim Designen eures Cloud-Stores!* 🚀
