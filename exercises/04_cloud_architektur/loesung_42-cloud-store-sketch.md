# 🏆 Lösung: Architektur-Sketch "Cloud-Store"

## 1. Die visuelle Struktur (Diagramm-Konzept)
Ein moderner Cloud-Store wird in Schichten (Tiers) aufgebaut. Stell dir den Aufbau von links (User) nach rechts (Daten) vor:

- Client-Ebene: Smartphone-App oder Browser (React).
- Edge-Ebene: Ein CDN (Content Delivery Network) liefert Bilder und Skripte weltweit aus.
- Einstiegs-Ebene: Der Load Balancer nimmt Anfragen entgegen.
- Logik-Ebene (Microservices): Die spezialisierten Dienste (Katalog, Zahlung, Bestellung).
- Daten-Ebene: SQL für Tabellen, Object Storage für Dateien, Redis für Speed.

## 2. Beantwortung der Leitfragen
### 📍 Wo sitzen Frontend, Backend und Datenbank?

- Frontend: Läuft technisch im Browser des Nutzers. Die Dateien dafür werden aber von einem globalen CDN oder einem statischen Webserver (z. B. S3/GCS Bucket) bereitgestellt.
- Backend: Befindet sich in der Cloud-Infrastruktur (meist in Containern wie Docker/Kubernetes). Es ist durch Firewalls geschützt und nur über den Load Balancer erreichbar.
- Datenbank: Sitzt in der sichersten Zone (Private Subnet). Sie hat keine direkte Verbindung zum Internet, sondern spricht nur mit den Backend-Services.

### ⚖️ Wo könnte ein Load Balancer helfen?

Ein Load Balancer fungiert als "Verkehrspolizist" an zwei Stellen:
- Vor dem Backend: Wenn während eines Sales (z. B. Black Friday) tausende Nutzer gleichzeitig kommen, verteilt der Load Balancer die Last auf viele parallele Instanzen der Microservices.
- Health Checks: Wenn ein Service-Container abstürzt ("das Haus brennt"), merkt das der Load Balancer und schickt die Nutzer automatisch zu einem funktionierenden Server.

### 🖼️ Welche Daten landen im Object Storage?

Object Storage (S3/GCS) ist perfekt für unstrukturierte Daten, die nicht in eine Excel-ähnliche Tabelle passen:
- Produktfotos: Millionen von Sneaker-Bildern in verschiedenen Auflösungen.
- Medien: Produkt-Videos oder Werbe-Banner.
- Statische Assets: Das JavaScript und CSS der Website selbst.
- Backups: Datenbank-Dumps und Log-Dateien.

## 3. Der "Happy Path" einer Bestellung (Beispiel)

Um die Kommunikation zu verstehen, folgt hier der Datenfluss:

1. Katalog-Service: Nutzer sieht den Schuh (Daten kommen aus SQL & Bilder aus Object Storage).
2. Bestell-Service: Nutzer klickt "Kaufen" (Daten gehen an den Bestell-Service).
3. Asynchrone Nachricht: Der Bestell-Service legt eine Nachricht in die Message Queue.
4. Zahlungs-Service: Holt sich die Nachricht aus der Queue, wenn er bereit ist, und wickelt PayPal ab.
5. Bestätigung: Eine E-Mail wird versendet und der Lagerbestand in der SQL-DB aktualisiert.

💡 Checkliste für deine Zeichnung
[ ] Frontend (React App)
[ ] Load Balancer (Eingangstor)
[ ] Microservices (Katalog, Zahlung, Bestellung)
[ ] Cloud SQL (User-Daten, Preise, Bestände)
[ ] Object Storage (Bilder)
[ ] Redis Cache (Top 100 Produkte für schnellen Zugriff)