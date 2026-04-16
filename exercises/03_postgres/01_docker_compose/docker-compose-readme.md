   1. Öffne dein Terminal und navigiere zum Ordner:
      cd exercises/02_postgres/
   2. Starte Docker Compose:
      docker-compose up -d
   3. Öffne deinen Browser:
      http://localhost:8080 (Hier ist pgAdmin erreichbar)
   4. Melde dich in pgAdmin an:
       * E-Mail: admin@example.com
       * Passwort: pgAdminPassword123
   5. Verbindung zur Datenbank herstellen:
       * Klicke in pgAdmin auf "Add New Server".
       * Name: beliebig (z.B. "Lokaler Postgres")
       * Connection Tab:
           * Host Name/Address: db (Dies ist der Name des Services aus der docker-compose.yml)
           * Port: 5432
           * Maintenance database: cloud_basics_demo
           * Username: postgres
           * Password: SuperSecurePassword123