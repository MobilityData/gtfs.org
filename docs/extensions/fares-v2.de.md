<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# GTFS-Fares v2

Fares v2 ist ein GTFS Schedule-Erweiterungsprojekt, das darauf abzielt, die Einschränkungen von [Fares v1](/schedule/examples/fares-v1) zu beseitigen.

Die wichtigsten Konzepte, die Fares v2 darstellen soll, sind

- Tarifprodukte (z. B. Fahrscheine und Fahrkarten)
- Fahrgastkategorien (z. B. Senioren und Kinder)
- Zahlungsmöglichkeiten für Fahrpreise (z.B. Bankkarte und Kreditkarte)
- Fahrpreisbegrenzung

Diese Konzepte werden es den Datenproduzenten ermöglichen, zonenbasierte, zeitabhängige und verbundübergreifende Tarife zu modellieren. Dieses Erweiterungsprojekt wird in mehreren Iterationen angenommen.

Derzeit funktioniert die angenommene Basisimplementierung von Fares v2 für die folgenden Anwendungsfälle:

- Definition eines Fahrpreises
- Beschreibung von Servicestandorten in der gleichen Tarifzone
- Erstellen von Regeln für einfache Fahrten
- Erstellen von Regeln für Umsteigevorgänge

Sie können [hier Beispiele](/schedule/examples/fares-v2) sehen, die zeigen, was mit der angenommenen Fares v2 Basisimplementierung modelliert werden kann.

Hersteller können Tarif v2 im gleichen Datensatz wie Tarif v1 implementieren, da es keinen technischen Konflikt zwischen den beiden gibt. Die Verbraucher können wählen, welche Version sie unabhängig von der anderen verwenden möchten. Wenn Fares v2 angenommen und ausreichend unterstützt wird, kann Fares v1 in Zukunft veraltet sein.

<a class="button no-icon" href="https://share.mobilitydata.org/gtfs-fares-v2" target="_blank">Siehe den vollständigen Vorschlag</a>

## Laufende Arbeiten zu Fares v2

Der Vorschlag für Tarifmedien (früher Tarifcontainer) wurde zur Abstimmung aufgerufen!

[Stimmt im GitHub Pull Request vor dem 13. März 23:59:59 UTC ab.](https://github.com/google/transit/pull/355#issuecomment-1456392466)

<a class="button no-icon" href="https://share.mobilitydata.org/slack" target="_blank">Treten Sie #gtfs-fares auf Slack bei</a><a class="button no-icon" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057" target="_blank">Siehe den Sitzungsplan</a><a class="button no-icon" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit" target="_blank">Siehe Sitzungsnotizen</a>

## Erste Übernehmer

🎉 Aufruf an die Fares v2-Erstanwender! Mindestens 1 Datenproduzent und 1 Verbraucher müssen sich verpflichten, eine experimentelle Funktion zu implementieren, bevor eine öffentliche Abstimmung zur Aufnahme in die offizielle Spezifikation stattfindet. Diese Organisationen investieren viel Zeit und Energie in experimentelle Änderungen, um sicherzustellen, dass GTFS sich weiter entwickelt.

Bei der angenommenen Basisimplementierung waren die Erstanwender

- Produzenten: [Interline](https://www.interline.io/), [Maryland Department of Transportation](https://www.mta.maryland.gov/developer-resources), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Verbraucher: [Transit](https://transitapp.com/)

Für die derzeit diskutierte Funktion der fare media sind die Erstanwender

- Produzent: [Interline](https://www.interline.io/)
- Verbraucher: [Apple](https://www.apple.com/), [Transit](https://transitapp.com/)

<a class="button no-icon" href="https://docs.google.com/spreadsheets/d/1jpKjz6MbCD2XPhmIP11EDi-P2jMh7x2k-oHS-pLf2vI/edit?usp=sharing" target="_blank">Sehen Sie, wer die Dateien und Felder von Fares v2 verwendet</a>

## In der Diskussion befindliche Fares v2 Merkmale

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## Geschichte

- **2017**: Branchenforschung und Datenmodellierung
- **Oktober 2021**: [Entwurf der Basisimplementierung und gemeinsame Nutzung](https://github.com/google/transit/pull/286#issue-1026848880)
- **Dezember 2021**: [Offene Abstimmung #1 → nicht angenommen](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **März 2022**: Offene [Abstimmung #2 → nicht angenommen](https://github.com/google/transit/pull/286#issuecomment-1080716109)
- **Mai 2022**: Offene [Abstimmung #3 → angenommen](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **August 2022**: [Diskussion der Gemeinschaft über die nächste Phase von Fares v2 beginnt](https://github.com/google/transit/issues/341)
- **Dezember 2022**: Die [Gemeinschaft legt eine Rangfolge der Funktionen fest, um die Iterationen zu priorisieren](https://github.com/google/transit/issues/341#issuecomment-1339947915)
