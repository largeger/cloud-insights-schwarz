---
title: ☁️ Cloud Basics Training 2026
theme: league
revealOptions:
  transition: slide
---

# ☁️ Cloud Insights Training 2026

[Lars Gerhard](lars.gerhard@winonagroup.com)

![[Pasted image 20260412091139.png]]


---

## 👋 Willkommen!
### Wer seid ihr?
- 👤 Name
- 💼 Rolle / Team
- 🎯 Erwartungen an das Training
- 📊 "Cloud-Level" (1-10)

--

### 🍦 Eisbrecher-Frage
"Wenn die Cloud ein Fortbewegungsmittel wäre, welches wäre es für dich aktuell?"

(🚲 Fahrrad, 🚀 Rakete, 🎈 Heißluftballon...)

--

### 🎤 Wer sind wir?
- [Lars Gerhard](lars.gerhard@winonagroup.com)
- [Brights](https://www.brights.com/)

---

## 📅 Agenda - Tag 1 
### Cloud-Architektur & Cloud-Native Design🏗️
- **09:00** 🚀 Einstieg & Kultur
- **10:45** ☁️ Grundlagen Cloud
- **12:00** 🏗️ Web-Anwendung Architektur
- **13:00** 🍴 Mittagspause
- **14:00** 📈 Cloud-Architektur I (Elastizität & Skalierung)
- **15:45** 📦 Cloud-Native Design (12-Factor, Container)

---

## 📅 Agenda - Tag 2 
### Infrastruktur, Security & CI/CD ⚙️
- **09:00** 🚢 Infrastruktur (Kubernetes)
- **10:45** 🔒 Cloud Security & Zero Trust
- **12:00** ⚙️ CI/CD/CD (Continuous X)
- **13:00** 🍴 Mittagspause
- **14:00** 🤖 Deep Dive Automation & Tooling
- **15:45** 🏁 Abschlussrunde & Feedback

---

# 🚀 Modul 1: Einstieg & Kultur
## Warum sind wir hier?

---

## Wie sieht die ideale Softwareentwicklungswelt aus? 🤓

--
##  Die Evolution der IT ⏳
- **1990er:** 💾 Eigene Server im Besenkammerl.
- **2000er:** 🖥️ Rechenzentren & Virtualisierung (VMware).
- **2010er:** ☁️ Der Aufstieg der Public Cloud (AWS, GCP).
- **2020er:** 🧠 Cloud-Native & KI-Integration.

--
## Warum entwickeln wir Software? 💡🤓

--
![[Pasted image 20260413112539.png]]

--
## Was bedeutet das für die Softwareentwicklung? 🎯
- Software muss Business Value erzeugen 💰
- Software muss Geschäftsprozesse unterstützen 🤝
	- erst das Geschäft 🏢
	- dann die Software 💻
--
## Was ist gute Software? ✅
- löst das Geschäftsproblem 🧩
- ist anpassungsfähig, wenn sich das Geschäftsmodell ändert 🔄
	- zumindest schneller anpassbar als beim Mitbewerber 😄
- Geschwindigkeit zählt! 🏎️

--
## DevOps ⚒️
- Moving faster improves quality and stability 🚀
- If quality is low, ship more often, ship smaller things 📦

--
## DevOps Assessment ⚒️
- **Deployment Frequency** ⏱️ - Wie oft wird deployed?
- **Lead Time for Changes** 📅 - Wie lange dauert es von Commit zu Production?
- **Change Failure Rate** 📉 - Wie häufig sind Bugs?
- **Mean Time to Recovery** 🛠️ - Wie lang dauert es bis zu fix oder rollback?

--

![[Pasted image 20260413123850.png]]

---

## 🌱 Fehlerkultur & Psychological Safety
### Warum ist das wichtig?
- Wer Angst vor Fehlern hat, traut sich keine Innovation zu. 🚫
- Komplexe Systeme führen zwangsläufig zu Fehlern. 🧩
- Ziel: "Failure as a learning opportunity". 🎓

--
## Wer von euch fliegt gerne? ✈️
Fliegen ist das sicherste Verkehrsmittel!

**Warum?**

![[Tenerife-airport-disaster-crash-animation.gif]]
[Flugunfall Teneriffa](https://de.wikipedia.org/wiki/Flugzeugkatastrophe_von_Teneriffa#Auszug_aus_dem_Kommunikationsprotokoll)

--

- Rigorose Aufarbeitung von Unfällen und Beinahe-Unfällen 🔍
- Anpassung der Arbeitsweise aller auf Basis der Unfälle und Beinahe-Unfälle der Vergangenheit 📉

--
## Was heißt das für moderne Teams? 🧑‍🤝‍🧑
- Ihr wollt das Beste aus eurem Team herausholen? 🚀
- Ihr wollt morgen besser sein als heute? 📈
	- Umarmt den Status Quo 🤗
	- Feiert (Team-)Erfolge 🎉
	- nehmt Probleme zum Anlass, gemeinsam zu wachsen 🌳

--
## Teamkultur 🤝
###  Was passiert, wenn etwas schief geht? 💥
- Good decisions come from experience 🧠
- Experience comes from bad decisions 💡

>"Aus Fehlern wird man klug, drum ist einer nicht genug" 🎓

--
### Wie geht man mit Fehlern um, wenn sie passiert sind? 🗣️
- Rigorose Aufklärung und Beleuchtung der Situation 💡
- No Finger-Pointing! Es geht nicht um die Person, sondern um den Prozess. 🚫👈
- Ziel: "Was", "Wie" und "Warum" erkennen! 🔍

--
### Wie geht man mit Fehlern um, wenn sie passiert sind? 🧐
- Es gibt quasi nie eine Ursache - nur beitragende Faktoren. 🧩
- Zum Problem kommt es erst, wenn die Faktoren zusammen kommen. ⚡
- Faktoren benennen, und an den Faktoren arbeiten. 🛠️
- Fakten und Gefühle sind beide relevant, aber sie müssen getrennt voneinander betrachtet werden. ⚖️
--
![[Pasted image 20260413130223.png]]

--
### Blameless Post-Mortems 📋

- Meeting nach einem "schwerwiegenden Unfall" 🏥
- Vordefinierte Templates zur Dokumentation: 📝
	- Was ist passiert? Was waren die Handlungen auf dem Weg zur Lösung? Wann sind die passiert? 🕒
	- Welche Faktoren haben das Problem begünstigt? 🧩
	- Wie können Prozesse angepasst werden, um nicht noch einmal in eine solche Situation zu kommen? 🛠️

--

### ... und gerne vergessen:
- teilt die Ergebnisse 🧩
- Minimum: Im Fachbereich
- Besser: Firmenweit! 🏭

--
### "Safe to fail" in der Cloud 🛠️
- **Infrastructure as Code:** Infrastruktur kann per Klick wiederhergestellt werden. 🔄
- **Rollbacks:** Schnell zur letzten funktionierenden Version zurückkehren. 🔙
- **Automatisierte Tests:** Fehler finden, bevor sie den Kunden erreichen. 🔍

---

## ✍️ Übung 1.1: Fehlerkultur (Diskussion)
1. Gab es in eurem Team schon einmal einen Fehler in der Produktion? 💥
2. Wie wurde damit umgegangen? 🗣️
3. Was hätte man in einer Cloud-Umgebung anders machen können? ☁️

*(15 Minuten)* ⏱️

---

# ☁️ Modul 2: Grundlagen Cloud
## Was ist "Die Cloud" eigentlich?

---

## 📖 Definition (NIST)
>"Cloud Computing ist ein Modell, das es ermöglicht, bei Bedarf über das Netz auf einen gemeinsamen Pool konfigurierbarer Rechenressourcen zuzugreifen..."

---
## Warum Cloud? 🌟 (Die Business Sicht)
- **⚡ Schnelligkeit:** Time-to-Market (Idee -> Produktion in Minuten).
- **🌍 Skalierbarkeit:** Weltweit wachsen ohne neue Server zu kaufen.
- **💰 Kosten:** Pay-per-Use (Nur zahlen, was man nutzt).
- **💡 Innovation:** Vorgefertigte KI- und Daten-Services nutzen.

--

### Warum Cloud? 🛠️ (Die IT Sicht)
- 🔧 Keine Hardware-Wartung mehr.
- 🛡️ Höhere Ausfallsicherheit (Hochverfügbarkeit).
- 🤖 Automatisierung statt manueller Arbeit.
- 🎯 Fokus auf Wertschöpfung (Code) statt Infrastruktur.

---

## 🧐 Cloud Mythen (Wahrheit oder Fiktion?)
1. "In der Cloud ist alles automatisch sicher." ❌
2. "In der Cloud ist alles automatisch günstiger." ❌
3. "Cloud ist nur 'die Computer von jemand anderem'." ⚠️

--

### Die Realität: 💡
- **Sicherheit:** Ist eine gemeinsame Aufgabe (Shared Responsibility). 🤝
- **Kosten:** Erfordern aktives Management (FinOps). 💸
- **Konzept:** Cloud ist ein neues Betriebsmodell, nicht nur Hardware. 🔄

---
### Die 5 wesentlichen Merkmale: ✨
1. **On-demand Self-service:** Ressourcen selbst buchen. 🖱️
2. **Broad network access:** Zugriff über Internet. 🌐
3. **Resource pooling:** Ressourcen dynamisch teilen. 🤝
4. **Rapid elasticity:** Schnelles Skalieren. 📈
5. **Measured service:** Abrechnung nach Nutzung. 🧾

---

## 🏗️ Die 3 Service Modelle
(Einer der wichtigsten Begriffe!)

--

### IaaS (Infrastructure as a Service) 🏗️
- Du bekommst: Virtuelle Server, Festplatten, Netzwerke.
- Du verwaltest: Betriebssystem, Middleware, Apps, Daten.
- *Beispiel: Google Compute Engine (GCE), AWS EC2.*

--

### PaaS (Platform as a Service) 🛠️
- Du bekommst: Eine fertige Umgebung für deinen Code.
- Du verwaltest: Deine App und deine Daten.
- *Beispiel: Google App Engine, Cloud Functions, Cloud SQL.*

--

### SaaS (Software as a Service) 💻
- Du bekommst: Eine fertige Anwendung.
- Du verwaltest: Fast nichts (vielleicht Nutzer/Einstellungen).
- *Beispiel: Gmail, Salesforce, Microsoft 365.*

---

## 🍕 Das Pizza-Modell (Vergleich)
- **Traditional IT:** Pizza selbst backen (alles selbst machen). 👨‍🍳
- **IaaS:** Teig & Ofen geliehen (du backst). 🍕
- **PaaS:** Pizza wird geliefert (du belegst sie nur). 🛵
- **SaaS:** Du gehst ins Restaurant (alles fertig). 🍽️

---

## 🏢 Deployment Modelle
- **Public Cloud:** Offen für alle (Google, AWS, Azure, STACKIT). 🌍
- **Private Cloud:** Im eigenen Rechenzentrum (nur für dich). 🔐
- **Hybrid Cloud:** Mix aus Public & Private. 🔀
- **Multi Cloud:** Nutzung mehrerer Cloud-Provider. ☁️☁️

---

## 🏆 Die "Big Three" Provider

--
### 🟧 AWS (Amazon Web Services)
![[Amazon-Web-Services-Logo-500x281.png]]

- Der Pionier (seit 2006).
- Größte Auswahl an Services. Marktführer. 👑

--

### 🟦 Microsoft Azure
![[northware-microsoft-azure-logo.webp|300]]
- Stark in der Enterprise-Welt.
- Nahtlose Integration mit Windows/Office. 🏢

--

### 🟥 Google Cloud Platform (GCP)
![[google-cloud.png]]
- Fokus auf Daten, KI und Machine Learning. 🧠
- Starker Kubernetes-Fokus (GKE). 🚢

--

![[Pasted image 20260414133728.png]]

- Eure "Go-To-Cloud"
---
## 🌤️ Vorteile von Cloudsystemen
- Verwendung von Cloud-Anbietern kann die Entwicklungsgeschwindigkeit erheblich beschleunigen 🚀

--
## ⛈️ Risiken
- "Mal eben" Dinge machen heißt im Zweifel auch "es fehlen wichtige Grundlagen", die nicht zur unmittelbaren Zielerfüllung notwendig sind (Sicherheit, Prozesstreue, Dokumentation, ...) ⚠️
- Rechte, die notwendig sein können um diese Dinge zu erreichen, können umfangreich sein 🔑


---
## 💸 FinOps: Kostenmanagement 📊
### "Pay-per-Use" kann teuer werden! ⚠️
- Cloud-Rechnungen sind komplex. 🧾
- **FinOps** = Finanzielle Verantwortung übernehmen. 💰
- Ziel: Wert maximieren, nicht nur Kosten minimieren. 📈

--

### Top 3 Spar-Tipps: 💡
1. **Right-sizing:** Nur so viel buchen, wie man braucht. 📏
2. **Scheduling:** Instanzen nachts ausschalten. 😴
3. **Commitment:** Rabatte für langfristige Nutzung. 🤝

---

## 🌿 Nachhaltigkeit in der Cloud
- Cloud-Provider sind oft effizienter als kleine Firmen. 🔋
- Nutzung von Ökostrom und Kühl-Optimierung. 🍃
- **Tipp:** "Green Ops" - Nur laufen lassen, was nötig ist! 🟢

---

## ✍️ Übung 2.1: Service Modelle einordnen
Ordnet folgende Services ein (IaaS, PaaS, SaaS):
1. Microsoft 365 📧
2. Virtueller Server (VM) bei Google 🖥️
3. Google App Engine 🛠️
4. Salesforce 💼
5. Managed Database (Cloud SQL) 🗄️

--
## ✍️Lösung 2.1: Service Modelle einordnen
Ordnet folgende Services ein (IaaS, PaaS, SaaS):
1. Microsoft 365 📧 - SaaS
2. Virtueller Server (VM) bei Google 🖥️ - IaaS
3. Google App Engine 🛠️ - PaaS
4. Salesforce 💼 - SaaS
5. Managed Database (Cloud SQL) 🗄️ - PaaS



---
# 🏗️ Modul 3: Web-Anwendung Architektur
## Wie funktioniert das Web? 🌐

---
## Im Restaurant... 🍴
![[mr-bean-biff.gif]]

--
## 4 Freiwillige... 😇
- Kunde 👤
- Kellner 🤵
- Koch 👨‍🍳
- Kühlschrank ❄️

> Kunde betritt Restaurant, bestellt, wird bedient, isst und verlässt das Restaurant 🍕

--
## 🤔❓🤔
- Warum ist diese Aufgabentrennung sinnvoll? 🧩
- Wie kann man das auf Software übertragen? 💻


---
## 🏛️ Klassische 3-Tier Architektur

![[Pasted image 20260414140222.png]]

--

1. **Presentation Tier (Frontend):** Der User-Teil (HTML/JS). 🎨
   - Was der Benutzer sieht und anklickt.
   - Läuft im Browser des Kunden.
2. **Logic Tier (Backend):** Die Geschäftslogik (Java/Python). ⚙️
   - Das "Gehirn" der Anwendung.
   - Berechnet Preise, prüft Lagerbestände, verwaltet Logins.
3. **Data Tier (Datenbank):** Wo die Infos liegen. 🗄️
   - Das Gedächtnis der Anwendung.
   - Speichert Benutzer, Produkte und Bestellungen.

--

- "Der" Standard für einfache Webanwendungen
- Die Realität ist fast immer komplexer
- Ermöglicht einfache horizontale Skalierung (später mehr)
- Go-To-Architektur, wenn die Anforderungen "einfach" sind

--
### Warum trennen? 🤔
- **📈 Unabhängiges Skalieren:** Wenn viele User kommen, brauchen wir mehr Backend-Power, aber nicht unbedingt eine größere Datenbank.
- **🔒 Bessere Sicherheit:** Die Datenbank ist "versteckt" hinter dem Backend.
- **🔄 Austauschbarkeit:** Wir können das Frontend neu designen, ohne die Datenbank anzufassen.

--

## 🎨 Frontend 

- User-Interface 
- nimmt Nutzerinteraktion entgegen
- Mensch-Maschine-Interaktion
- Häufig im Webbrowser
- CLI (command-line interface) ist auch ein Frontend 
- Verantwortlich für Dateneingabe 
- Läuft häufig auf Endgeräten des Nutzers
- Vertrauen in Integrität => gering!
- Enthält mittlerweile mehr Business-Logik
- Verlust im Betrieb: wenig kritisch👍

--

### 🧰 Frontend Technologien 🛠️
- HTML, CSS, JS 🌐
- Webassembly, Typescript 🟦
- Frameworks: 📦
	- Vue.js 🟢
	- React ⚛️
	- Angular 🅰️
	- Svelte 🧡

--
### ⚙️ Backend (Logic) ⚙️

- Läuft auf Hardware im Rechenzentrum 🏢
- Enthält Business-Logik 🧠
- Validiert Eingaben des Frontends ✅
- Liefert häufig Frontend-Code mit aus (muss aber nicht) 📤
- Kümmert sich um Auth* 🔐
- Vertrauen in Integrität => hoch! 🛡️
- Enthält "die API"; "API-first" bezieht sich aufs Backend 🔌
- Nach Möglichkeit "stateless", d.h. selbst nicht für Datenspeicherung verantwortlich 💨
- Verlust im Betrieb: Kritisch ⚠️

--

### 🧰 Backend Technologien 🛠️

- Java / JVM, Kotlin, .NET ☕
- Rust, Go, Python, PHP, ABAP 🐍
- Frameworks: 📦
	- Spring, Spring Boot (➡ JVM) 🍃
	- Flask, Django (➡ Python) 🌶️
	- Node.js (➡ JavaScript, TypeScript) 🟢 

--

### 🗄️ Datenbank (Data) 🗄️
- Läuft auf Hardware im Rechenzentrum 🏢
- Kann Business-Logik enthalten (Menge tendentiell sinkend) 📉
- Speichert Daten der Kunden 👥
- Backups sehr wichtig 💾
- Vertrauen in Integrität => sehr hoch! 🛡️
- Verlust im Betrieb: Extrem kritisch 💥

--
### 🧰 Datenbank Technologien 🛠️

 - relationale: PostgreSQL, MySQL 🐘
 - dokumentbasierte: MongoDB, CouchDB, Google Firebase, Amazon Amplify 🍃
 - Blob Storage: Amazon S3, Google Cloud Storage 📦   

 ...und datenbankähnliche: 🔄
 Solace, Kafka, Google PubSub 📮
---

## 🗣️ Die Sprache des Webs: HTTP & JSON
### Wie reden Browser und Server?

--

## 1. Das "Telefonbuch": DNS 🌐
**Domain Name System (DNS)**
- Wir merken uns: `www.google.com`
- Computer brauchen: `142.251.36.164` (IP-Adresse)
- DNS übersetzt Namen in Nummern. 📖 -> 🔢

--
### 2. Der HTTP Request (Die Frage) 📤
- **GET /produkte:** "Gib mir bitte alle Produkte."
- **POST /bestellung:** "Hier sind meine Bestelldaten, bitte ausführen!"

--

### 3. JSON (Das Datenformat) 📦
- Ein einfaches Textformat, das jeder versteht.
- Sieht so aus:
  ```json
  {
    "produkt": "Cloud-Sneaker",
    "preis": 99.90,
    "vorrat": 12
  }
  ```

--

## 🔄 Der Request-Response Cycle
1. **URL Eingabe:** Benutzer will shoppen. ⌨️
2. **DNS Lookup:** "Wo steht der Server?" 🔍
3. **Request:** Browser schickt HTTP GET an den Server. 📤
4. **Logic:** Backend prüft in der DB, ob Artikel da sind. ⚙️
5. **Data:** Datenbank liefert die Produktliste. 🗄️
6. **Response:** Server schickt JSON + HTML zurück. 📥
7. **Rendering:** Browser zeichnet die Seite schön. 🎨

---

## 🧠 Wichtiges Konzept: Statelessness
- **Zustandslosigkeit:** Der Server vergisst den User nach jedem Request sofort wieder. 💨
- **Warum?** So kann jeder beliebige Server in der Cloud die nächste Anfrage bearbeiten.
- **Wo ist der Zustand?** Im "Warenkorb" (Datenbank) oder im Browser ("Cookie"). 🍪

---
## 🚀 Praxis-Beispiel: Postgres DB

![[Pasted image 20260414150210.png]]


--

#### In zwei Varianten:
- Docker-Compose 🐋
- Google Cloud ⛅

---

## 🏗️ Was ändert sich in der Cloud?
### Monolith vs. Microservices

--

### 📦 Der Monolith
- Ein großer Block Code für alles.
- Schwer zu ändern, schwer zu skalieren.
- "Wenn ein Teil brennt, brennt das ganze Haus." 🔥

--

### 🧩 Microservices
- Viele kleine, spezialisierte Services.
- Jeder Service hat seine eigene Aufgabe.
- Unabhängig skalierbar und deploybar. 🚀

---

## 🗣️ Kommunikation zwischen Microservices
- **Synchron:** HTTP/REST (Direktes Telefonat - warten auf Antwort). 📞
- **Asynchron:** Message Queues (E-Mail/Briefkasten - Nachricht schicken, später lesen). 📮
  - *Vorteil:* Wenn der Empfänger kurz weg ist, geht die Nachricht nicht verloren!

---

# 📈 Modul 4: Cloud-Architektur I
## Elastizität & Skalierung

---
## Wie dimensioniert man seine Systeme? 

![[Pasted image 20260414160826.png]]
--

![[Pasted image 20260414160758.png]]

---

## ⬆️ Vertikale Skalierung (Scale Up)
- Den bestehenden Server "stärker" machen. 💪
- Limit: Hardware-Grenzen.
- Oft Downtime nötig. 💤

--
## ➡️ Horizontale Skalierung (Scale Out)
- Mehr Server vom gleichen Typ hinzufügen. 👯‍♂️
- Fast unbegrenzt möglich.
- Erfordert einen **Load Balancer**. 🚦

--
## 🚦 Was ist ein Load Balancer?
- Der "Verkehrspolizist" der Cloud.
- Verteilt Requests auf verfügbare Server.
- Erkennt tote Server (**Health Checks**). 🩺

--
## 📉 Elastizität vs. Skalierbarkeit
- **Skalierbarkeit:** Die Fähigkeit, Last zu verarbeiten. 🏗️
- **Elastizität:** Die Fähigkeit, dies **automatisch** zu tun. 🤖

--
### Warum brauchen wir das? 🤔
- 💰 Kosteneinsparung in der Nacht.
- 🚀 Verfügbarkeit bei Peaks (Black Friday).

--

## Faustregel ✊
- Auslastung bei etwa 70%
- Minimum ein Ausfall (z.B. eines Servers) muss verkraftet werden 
- Wenn höhere Anforderungen: Mehr Ausfall verkraften

---

## 🧠 "Statelessness" (Zustandslosigkeit)
- Server darf keine User-Infos speichern ("Sessions").
- Zustand gehört in die Datenbank oder den Cache! 🗄️
- Nur so funktioniert horizontales Skalieren. 👯‍♂️

---
## Skalierung bei 3-Tier-Architekturen

### 🎨Frontend
![[Pasted image 20260414161247.png]]

--

### 🎨Frontend
![[Pasted image 20260414161312.png]]

--
### ⚙️ Backend Skalierung ⚙️
![[Pasted image 20260414161340.png]]

--

### ⚙️ Backend - Herausforderungen 🤔

Wann sollte skaliert werden? 📉
Faustregel 70% Auslastung, aber... 
- CPU? RAM? I/O? 📊
- ➡ abhängig von der Anwendung 🧩
- ➡ Monitoring! 🩺

--

### 🗄️ Datenbank Skalierung 🗄️
- herausfordernd, da sie Zustand hält 💾
- vertikale Skalierung kann weit führen, wenn wenig Logik verwaltet wird ⬆️
- horizontale Skalierung ist technologieabhängig ➡️


--

### 🗄️Datenbank
![[Pasted image 20260414161828.png]]

--

### 🗄️ Datenbank - Sharding 🧩
- Finden des Sharding-Keys 🔑
- kann einfach sein, oder kompliziert - je nach wie man auf die Daten zugreifen will! 🔍
- Können die Daten gut aufgeteilt werden? ✂️
- Müssen Daten aus mehreren Shards zusammengezogen werden? 💣
- Dokumentenbasierte Datenbanken haben hier Vorteile 🚀

--

### 🗄️ Datenbank - Read Replicas 👯‍♂️

![[Pasted image 20260414162042.png]]

--

### 🗄️ Datenbank - Read Replicas 📖
- Höhere Leseperformance ⚡
- Oft Zeitverzug zwischen Lesen und Schreiben ⏳
- Kann problematisch sein, muss aber nicht - je nach Anwendungsfall ⚖️

--

### 🗄️ Datenbank - Multi-Master Replication 👑

![[Pasted image 20260414162228.png]]

--

### 🗄️ Datenbank - Multi-Master Replication 🌐

- Kann nicht jede Datenbank 🚫
- Split-Brain-Problem (Netzwerkpartitionierung) 🧠💥
- ➡ ungerade Anzahl Nodes zur "Mehrheitsbestimmung" 🗳️

--
### 🗄️ Datenbank - Faustregeln ✊

- vertikale Skalierung so weit wie es geht ⬆️
- wenn möglich mit Read-Replication arbeiten 📖
- danach Sharding, wenn möglich 🧩
- danach: kauft es euch extern ein, Betrieb ist schwierig 💸
- für spezielle Anforderungen ist es sinnvoll auch spezielle Datenbanken zu verwenden (z.B. Zeitserien) 📈


---
## ✍️ Übung 4.1: Skalierungs-Szenario
Stellt euch vor: Ihr betreibt einen Online-Shop für Grillzubehör. 🌭
1. Wann braucht ihr vertikale Skalierung? 💪
2. Wann braucht ihr horizontale Skalierung? 👯‍♂️
3. Wie hilft euch Elastizität am "Schwarzen Freitag"? 📈

---
## 🗄️ Storage Typen in der Cloud
- **Object Storage:** Unstrukturierte Daten (Bilder/PDFs) -> *GCS / S3*. 📦
- **Block Storage:** Festplatten für VMs. 💾
- **File Storage:** Gemeinsame Netzlaufwerke (NFS). 📂


---

## 🚀 Praxis-Beispiel : Der "Cloud-Store"
Wie sieht ein moderner Online-Shop aus?

--

### 🎨 Frontend (Presentation)
- Web-App (React) & Mobile App.
- Zeigt Bilder, Beschreibungen und den Warenkorb an.
- Nutzt ein **CDN**, damit Bilder weltweit blitzschnell laden. ⚡

--

### ⚙️ Backend (Logic)
- Mehrere **Microservices**:
  - **Katalog-Service:** Listet Sneaker auf.
  - **Zahlungs-Service:** Redet mit PayPal/Kreditkarte.
  - **Bestell-Service:** Schickt E-Mails und Lager-Updates.

--

### 🗄️ Daten (Data)
- **SQL Datenbank:** Für Kunden und Rechnungen (strukturierte Daten).
- **Object Storage (GCS/S3):** Für die Millionen Produktbilder. 🖼️
- **Cache (Redis):** Für die 100 beliebtesten Produkte (super schnell). 🚀

---

## ✍️ Übung 4.2: Architektur-Sketch
Zeichnet die Architektur für unseren **Cloud-Store**. 🛒
1. Wo sitzen Frontend, Backend und Datenbank?
2. Wo könnte ein Load Balancer helfen?
3. Welche Daten landen im Object Storage? 🖼️

--
### 🚀 Demo "Cloud-Store"
- Docker-Compose 🐋
- Google Cloud ⛅

---

# 📦 Modul 5: Cloud-Native Design
## Wie baut man "richtig" für die Cloud?

---

## 📜 Die 12-Factor App (Komplette Übersicht)
Ein Leitfaden für moderne, Cloud-native Anwendungen.

--

### 1. Codebase 📝
- Ein Code-Repo (Git), viele Deployments.

--

### 2. Dependencies 📦
- Abhängigkeiten explizit deklarieren.

--

### 3. Config ⚙️
- Konfiguration über Umgebung (Env-Vars). **Keine Secrets im Code!** 🔐

--

### 4. Backing Services 🔌
- Dienste (DB/Mail) als "angehängte Ressourcen".

--

### 5. Build, Release, Run 🏗️
- Strenge Trennung der Phasen. Build ist unveränderlich.

--

### 6. Processes ⚙️
- Die App muss zustandslos (stateless) sein.

--

### 7. Port Binding 🔌
- App bietet Dienste über einen Port an.

--

### 8. Concurrency 👯‍♂️
- Skalierung durch weitere Instanzen.

--

### 9. Disposability 🏃‍♂️
- Schneller Start und sicheres Beenden.

--

### 10. Dev/Prod Parity 👥
- Entwicklung und Produktion so ähnlich wie möglich.

--

### 11. Logs 📜
- Logs als Event-Streams behandeln.

--

### 12. Admin Processes 🛠️
- Admin-Aufgaben als einmalige Prozesse.

---

## Warum 12-Factor? 🤔
- **Portabilität:** Läuft überall. 🌍
- **Skalierbarkeit:** Einfach zu vervielfältigen. 👯‍♂️
- **Automatisierbarkeit:** Ideal für Pipelines. ⚙️

---
## 📦 Einführung in Container

>Warum sind Plastikboxen so praktisch?

![[Pasted image 20260414163026.png|522]]




---

### Das Problem: "Works on my machine!" 🤷‍♂️
- Unterschiede in Umgebungen führen zu Fehlern.

--

![[Pasted image 20260414163344.png]]

--
### Die Lösung: Container 📦
- Ein Container "verpackt" die App mit allem.
- "Build once, run anywhere". 🚢

--

![[Pasted image 20260414163443.png]]

--
###  Bare-Metal vs. Virtualisierung 🖥️ 
- Hardwarevirtualisierung erstellt "virtuelle Computer" innerhalb eines anderen Computers 💻
- Virtualbox, VMWare, KVM, QEMU, ... 🛠️
- Hardware wird besser ausgenutzt 📈
- Nicht alle Ressourcen werden gleichzeitig gebraucht ⚖️

--

### Virtualisierung 🖥️ vs. Container 📦
- **Virtuelle Maschinen (VMs):** Jedes Mal ein ganzes OS (schwer). 🐘
- **Container:** Teilen sich das OS des Hosts (leicht). 🕊️

--

![[Pasted image 20260414164150.png]]


---

## 🐳 Docker: Der Industriestandard
- Tool zum Erstellen (Build), Teilen (Ship) und Ausführen (Run) von Containern. 🚢

--
### Vorteile von Containern 🌟
- Startet sehr schnell ⚡
- Kombiniert Applikation mit Bibliotheken und Dateien 📦
- kann auf Host zugreifen, wenn Volumes mounted werden 💾
- Ressourcenbeschränkung möglich 📏
- Vereinfacht Standardisierung 📐

--
### Beispiel: Ein einfaches `Dockerfile`

```dockerfile
FROM nginx 
COPY my/static/html/directory /usr/share/nginx/html
```

---

## 🏁 Zusammenfassung Tag 1
- Wir kennen die Service Modelle (IaaS/PaaS/SaaS). 🏗️
- Wir verstehen moderne Architekturen (Microservices). 🧩
- Wir kennen Skalierung und Container. 📦
