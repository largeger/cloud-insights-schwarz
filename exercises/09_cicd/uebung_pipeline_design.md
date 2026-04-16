# Übung 8.1: Pipeline Design

## Ziel
Einen automatisierten Prozess von Code zu Produktion entwerfen.

## Aufgabe
Zeichnen Sie (z.B. auf Papier oder im Miro-Board) eine Pipeline für eine einfache Web-Anwendung.
Berücksichtigen Sie folgende Schritte und bringen Sie sie in die richtige Reihenfolge:

- Security Scan (Snyk/SonarQube)
- Unit Tests (Jest/JUnit)
- Deployment in Test-Umgebung
- Build Docker Image
- Code Push zu GitHub
- Approval durch Product Owner
- Deployment in Produktion

## Diskussionsfragen
1. Warum sollte der Security Scan möglichst früh passieren?
2. Was passiert, wenn die Unit Tests fehlschlagen?
3. Warum brauchen wir ein "Approval" vor der Produktion?
