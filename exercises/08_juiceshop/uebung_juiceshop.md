# Übung 07: Cloud Security mit OWASP Juice Shop 🍹

In dieser Übung lernst du die Grundlagen der Web-Sicherheit kennen. Wir nutzen dafür den **OWASP Juice Shop**, eine bewusst unsicher gestaltete Web-Anwendung. Deine Aufgabe ist es, die Anwendung in der Google Cloud zu hosten und erste Sicherheitslücken zu finden.

## Lernziele
-   Bereitstellung einer Container-Anwendung auf **Google Cloud Run**.
-   Verständnis von gängigen Web-Sicherheitslücken (OWASP Top 10).
-   Praktische Erfahrung mit SQL Injection und XSS.

---

## 🚀 Schritt 1: Deployment auf Google Cloud Run

Da der Juice Shop als Docker-Container verfügbar ist, können wir ihn direkt auf **Cloud Run** deployen.

1.  Öffne deine Google Cloud Shell oder dein lokales Terminal.
2.  Führe den folgenden Befehl aus, um den Juice Shop zu starten:
    ```bash
    gcloud run deploy juice-shop \
      --image=bkimminich/juice-shop \
      --platform=managed \
      --region=europe-west3 \
      --allow-unauthenticated
    ```
3.  Notiere dir die **Service URL**, die am Ende des Befehls ausgegeben wird (z.B. `https://juice-shop-xyz.a.run.app`).

---

## 🕵️‍♂️ Schritt 2: Die Jagd beginnt (Challenges)

Öffne den Juice Shop in deinem Browser. Deine Aufgabe ist es, die folgenden drei Sicherheitslücken zu finden und auszunutzen.

### Challenge 1: Der Score Board (Information Disclosure)
Es gibt eine versteckte Seite, auf der alle "Hacks" aufgelistet sind. Finde sie!
-   **Hinweis:** Probiere gängige Pfade in der URL aus (z.B. `/admin`, `/dashboard`, ...).

### Challenge 2: SQL Injection (Login)
Melde dich als Administrator (`admin@juice-sh.op`) an, ohne das Passwort zu kennen.
-   **Hinweis:** Nutze das `'` Zeichen in der E-Mail Adresse, um die SQL-Abfrage zu manipulieren (z.B. `admin@juice-sh.op' --`). Das Passwort ist egal.

### Challenge 3: Cross-Site Scripting (XSS)
Bringe die Anwendung dazu, ein JavaScript-Alert-Fenster anzuzeigen.
-   **Hinweis:** Suche nach einem Suchfeld oder einem Eingabefeld, das deine Eingabe direkt wieder auf der Seite anzeigt. Probiere `<script>alert('XSS')</script>`.

---

## 🧹 Schritt 3: Aufräumen

Vergiss nicht, den Cloud Run Service nach der Übung zu löschen, um Kosten zu vermeiden:
```bash
gcloud run services delete juice-shop --region=europe-west3 --quiet
```
