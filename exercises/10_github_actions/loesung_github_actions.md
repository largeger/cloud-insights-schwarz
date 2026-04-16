# Lösung Übung 10: CI/CD mit GitHub Actions 🚀

## Aufgabe 2: Pipeline-Analyse
- **Anzahl der Jobs:** 3 (`build-and-test`, `security-check`, `deploy`).
- **Abhängigkeiten:** Der Job `security-check` benötigt `build-and-test` (`needs: build-and-test`).
- **Deploy-Logik:** Der `if` Filter (`github.event_name == 'push' && github.ref == 'refs/heads/main'`) stellt sicher, dass nur Code auf dem Haupt-Branch deployed wird. Pull Requests werden zwar getestet, aber nicht deployed.

## Aufgabe 3: Fehler provozieren
Wenn der Test fehlschlägt, bricht die Pipeline sofort ab. Der Job `security-check` wird gar nicht erst gestartet, da er den erfolgreichen Abschluss des ersten Jobs voraussetzt. Dies spart Zeit und Ressourcen.

## Aufgabe 4: Pipeline erweitern (Bonus)
Beispiel für einen ESLint Step:
```yaml
      - name: Run Lint
        run: npm run lint # Vorher muss "lint" in der package.json definiert sein
```

## Troubleshooting
- **Node-Version:** Achtet darauf, dass die `node-version` im Workflow (`20`) zur App passt.
- **Paths:** Wenn die App in einem Unterordner liegt, muss `working-directory` korrekt gesetzt sein (wie in der Übung vorbereitet).
