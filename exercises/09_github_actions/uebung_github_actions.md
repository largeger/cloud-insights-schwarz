# Übung 09: CI/CD mit GitHub Actions

In dieser Übung lernst du, wie du eine mehrstufige Pipeline (Multistage Pipeline) mit GitHub Actions erstellst.

## Lernziele
- Struktur einer GitHub Actions Datei (`.github/workflows/*.yml`) verstehen.
- Jobs, Steps und Abhängigkeiten (`needs`) definieren.
- Pipeline-Trigger kennenlernen (Push/Pull Request).

---

## Aufgabe 1: Repository vorbereiten
1. Erstelle ein neues GitHub Repository (oder nutze ein bestehendes).
2. Kopiere die Dateien aus `exercises/09_github_actions/app/` in dein Repository.
3. Die Pipeline-Datei muss im Pfad `.github/workflows/main.yml` liegen.

## Aufgabe 2: Pipeline-Analyse
Schau dir die Datei `github_workflow_example.yml` an:
- Wie viele **Jobs** gibt es?
- Welcher Job muss erfolgreich sein, bevor der **Security Check** startet?
- Warum wird der **Deploy-Job** nur bei einem Push auf den `main` Branch ausgeführt?

## Aufgabe 3: Fehler provozieren
1. Ändere den Text in `index.js`, aber passe den Test in `app.test.js` NICHT an.
2. Pushe die Änderung. Was passiert in GitHub unter dem Reiter "Actions"?
3. Korrigiere den Test und beobachte den "Green Build".

## Aufgabe 4: Pipeline erweitern (Bonus)
Füge einen neuen Step im Job `build-and-test` hinzu, der einen Linter (z.B. `eslint`) ausführt.
