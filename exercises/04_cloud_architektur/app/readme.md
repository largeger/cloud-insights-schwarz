So startest du die 3-Tier App lokal:

   1. Öffne dein Terminal und gehe zum Ordner:
      cd exercises/03_web_app_architektur/app/
   2. Baue und starte die Container:
      docker-compose up --build -d
   3. Öffne den Browser:
       * Frontend: http://localhost:3000 (Nginx serviert die Seite)
       * Backend: http://localhost:8080/api/products (Die API, auf die das Frontend zugreift)

  Warum das jetzt so gut funktioniert:
   * Automatischer Lokal-Modus: Das Frontend prüft jetzt über JavaScript (window.location.hostname), ob du die Seite über localhost aufrufst. Wenn ja, nutzt es automatisch den lokalen
     Backend-Port 8080.
   * Sauberes Deployment: Das Cloud-Deployment-Skript funktioniert weiterhin wie gewohnt, da es bei der Veröffentlichung in die Google Cloud einfach die Platzhalter-Variable im Code
     überschreibt