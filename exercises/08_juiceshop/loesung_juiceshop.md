# Lösung Übung 07: OWASP Juice Shop 🍹

Hier findest du die Erklärungen und Lösungen für die Challenges.

---

## ✅ Challenge 1: Score Board finden
**URL:** `[Cloud-Run-URL]/#/score-board`
**Erklärung:** Diese Seite ist nicht direkt verlinkt, aber über die URL erreichbar. Sie zeigt eine Liste aller verfügbaren Challenges und deinen Fortschritt.

---

## ✅ Challenge 2: SQL Injection (Login)
**Vorgehensweise:**
1. Öffne die Seite **Login**.
2. Gib als E-Mail `admin@juice-sh.op' --` ein.
3. Gib als Passwort ein beliebiges Zeichen ein (z.B. `1`).
4. Klicke auf **Login**.
**Was ist passiert?**
Die SQL-Abfrage in der Datenbank sieht ungefähr so aus:
`SELECT * FROM Users WHERE email = 'admin@juice-sh.op' --' AND password = '1'`
Durch das `' --` (das Hochkomma schließt die Eingabe, das `--` kommentiert den Rest der Zeile aus) wird der Passwort-Check einfach ignoriert.

---

## ✅ Challenge 3: Cross-Site Scripting (XSS)
**Vorgehensweise:**
1. Klicke auf die **Lupe** oben rechts, um das Suchfeld zu öffnen.
2. Gib folgenden Code ein: `<iframe src="javascript:alert('XSS')">` (oder `<script>alert('XSS')</script>`, aber der Juice Shop blockiert das oft im Suchfeld, während ein `iframe` oder ein `svg`-onload oft funktioniert).
3. Drücke Enter. Ein Alert-Fenster sollte erscheinen.
**Erklärung:** Die Anwendung vertraut der Benutzereingabe ungeprüft und rendert sie direkt als HTML im Browser. Ein Angreifer könnte so Cookies stehlen oder Benutzer auf andere Seiten umleiten.

---

## 🛠️ Deployment Troubleshooting
Sollte das Deployment auf **Cloud Run** fehlschlagen, stelle sicher, dass:
- Deine `gcloud` CLI aktuell ist.
- Du ein aktives GCP-Projekt ausgewählt hast (`gcloud config get-value project`).
- Die Cloud Run API in deinem Projekt aktiviert ist.
