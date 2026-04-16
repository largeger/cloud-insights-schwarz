# 🏆 Lösung: Skalierungs-Szenarien "Grill-Shop"

## 1. Vertikale Skalierung (Scaling Up) 💪

Definition: Du gibst einem bestehenden Server mehr "Power" (mehr CPU, mehr RAM).

Wann du sie brauchst:
- Komplexe Datenbank-Abfragen: Wenn deine SQL-Datenbank bei großen Inventar-Listen (z. B. 5.000 verschiedene Grillzangen) zu langsam wird, hilft ein größerer Arbeitsspeicher (RAM), um die Daten schneller zu verarbeiten.
- Software-Limits: Wenn du eine ältere Software nutzt, die nicht darauf ausgelegt ist, auf mehreren Servern gleichzeitig zu laufen (nicht "cloud-native").
- Metapher: Du kaufst deinem Lieferfahrer einen Ferrari statt eines VW-Busses. Er ist schneller, kann aber immer noch nur eine Lieferung gleichzeitig machen.

## 2. Horizontale Skalierung (Scaling Out) 👯️

Definition: Du fügst weitere Server (Instanzen) hinzu, die parallel arbeiten.

Wann du sie brauchst:
- Hohes Besucheraufkommen: Wenn im Frühling plötzlich 10.000 Grill-Fans gleichzeitig auf die Seite stürmen. Ein einzelner Server würde unter der Last zusammenbrechen, egal wie stark er ist.
- Ausfallsicherheit: Wenn du 5 kleine Server hast und einer abstürzt, übernehmen die anderen 4 den Job. Dein Shop bleibt online.
- Metapher: Statt einem schnellen Ferrari stellst du 20 Lieferfahrer mit Fahrrädern ein. Wenn einer einen Platten hat, liefern die anderen 19 trotzdem aus.

## 3. Elastizität am "Schwarzen Freitag" 📈
Definition: Die Fähigkeit der Cloud, Ressourcen automatisch und in Echtzeit je nach Bedarf hoch- und wieder runterzufahren.

Wie sie am Black Friday hilft:
- Vormittags (Ruhe vor dem Sturm): Dein Shop läuft auf 2 kleinen Servern (kostet fast nichts).
- Mittags (Ansturm beginnt): Die CPU-Last steigt über 70%. Die Cloud bemerkt das und startet automatisch 10 weitere Server hinzu (Auto-Scaling).
- Abends (Peak-Time): Es sind 50 Server aktiv. Niemand merkt eine Verzögerung, der "Grill-König 3000" verkauft sich im Sekundentakt.
- Nachts (Nach dem Sale): Die Besucherzahlen sinken. Die Cloud schaltet die überflüssigen Server sofort wieder ab.

Der Clou: Du zahlst nur für die 50 Server, solange sie wirklich aktiv waren (Pay-as-you-go). Ohne Elastizität müsstest du das ganze Jahr über teure Hardware für diesen einen Tag vorhalten.