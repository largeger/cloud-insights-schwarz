# Lösung Übung 09: Pipeline Design 🏗️

## Beispiel für eine optimale Reihenfolge:

1. **Code Push zu GitHub** ➡️ (Trigger)
2. **Unit Tests (Jest/JUnit)** ➡️ (Schnelles Feedback)
3. **Security Scan (Snyk/SonarQube)** ➡️ (Schwachstellen früh finden)
4. **Build Docker Image** ➡️ (Artefakt erstellen)
5. **Deployment in Test-Umgebung** ➡️ (Automatischer Testlauf)
6. **Approval durch Product Owner** ➡️ (Qualitätssicherung)
7. **Deployment in Produktion** ➡️ (Live-Gang)

## Diskussionsfragen (Antwortvorschläge):

1. **Warum Security Scan früh?** 🛡️
   Je später ein Fehler gefunden wird, desto teurer ist seine Behebung ("Shift Left" Prinzip). Ein Image zu bauen, das bekannte Sicherheitslücken hat, verschwendet zudem Zeit und Ressourcen.

2. **Was passiert bei fehlgeschlagenen Unit Tests?** 🛑
   Die Pipeline bricht sofort ab ("Fail Fast"). Es wird kein Image gebaut und nichts deployed. Der Entwickler muss den Code fixen und erneut pushen.

3. **Warum "Approval" vor Produktion?** 🤝
   Obwohl alles automatisiert ist, gibt es oft geschäftliche Gründe (Marketing-Termine, Compliance-Vorgaben) oder komplexe E2E-Tests, die eine manuelle Freigabe sinnvoll machen. Bei echtem "Continuous Deployment" fällt dieser Schritt weg.
