---
search:
  exclude: true
---

# GTFS Schedule Übersicht

<div class="landing-page">
   <a class="button" href="reference">Referenz
</a>  <a class="button" href="best-practices">Bewährte Praktiken</a>
   <a class="button" href="examples">Beispiele</a>
   <a class="button" href="changes">Änderungen</a>
</div>

## Erste Schritte

Ein GTFS, der statische Verkehrsinformationen enthält, besteht aus einer Reihe von Textdateien (.txt), die in einer einzigen ZIP-Datei enthalten sind. Jede Datei beschreibt einen bestimmten Aspekt der Verkehrsinformationen: Haltestellen, Routen, Fahrten, Tarife usw. Weitere Informationen zu den einzelnen Dateien finden Sie in der GTFS.

Gehen Sie wie folgt vor, um einen GTFS zu erstellen.

1. Erstellen Sie alle erforderlichen Dateien, die in der [GTFS Schedule](reference) beschrieben sind. Erstellen Sie die optionalen Dateien, wenn deren Funktionalität gewünscht ist.
1. Speichern Sie alle Dateien im .txt-Format. Die Feldwerte sollten durch Kommata getrennt sein und jede Zeile sollte mit einem Zeilenumbruch enden. Ausführliche Informationen über den Inhalt der Dateien finden Sie in der GTFS.
1. Zipen Sie alle Textdateien zusammen. Die gezippte Datei enthält eine Version des Feeds.
1. Veröffentlichen Sie den Feed, indem Sie eine der folgenden Optionen verwenden.

## Einen Transit-Feed öffentlich zugänglich machen

<hr/>

Datensätze sollten unter einer öffentlichen, dauerhaften URL veröffentlicht werden, die auch den Namen der Zip-Datei enthält. (z. B. www.agency.org/gtfs/gtfs.zip). Im Idealfall sollte die URL direkt heruntergeladen werden können, ohne dass eine Anmeldung für den Zugriff auf die Datei erforderlich ist, um das Herunterladen durch Softwareanwendungen zu erleichtern. Es wird zwar empfohlen (und ist die gängigste Praxis), einen GTFS offen zum Herunterladen bereitzustellen, doch wenn ein Datenanbieter den Zugriff auf GTFS aus lizenzrechtlichen oder anderen Gründen kontrollieren muss, wird empfohlen, den Zugriff auf den GTFS mithilfe von API-Schlüsseln zu kontrollieren, was automatische Downloads erleichtert.

Der Web-Server, der die GTFS hostet, sollte so konfiguriert sein, dass er das Änderungsdatum der Datei korrekt meldet (siehe HTTP/1.1 - Request for Comments 2616, unter Abschnitt 14.29).

Siehe "[Bewährte Praktiken: Dataset Publishing](best-practices/#dataset-publishing-general-practices)" für weitere Empfehlungen.

## Ausbildung

<hr/>

**Technische Details über GTFS, was es ist und wie man Daten erstellt und pflegt:**

- [GTFS Schedule Übersicht](schedule/)
- [Online-Kurs "Einführung in GTFS" der Weltbank](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping)
- [MBTA GTFS](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb)

**Sehen Sie sich Beispiel-Feeds mit verschiedenen Funktionen an:**

- [GTFS](https://database.mobilitydata.org/)
- [Transitland](https://www.transit.land/)

**Kostenlose Tools und Lehrmaterial:**

- [MobilityData GTFS Schedule Validator](https://gtfs-validator.mobilitydata.org)
- [NRTAP-Lektionen und GTFS Builder](https://www.nationalrtap.org/Technology-Tools/GTFS-Builder/Support)
- [Arcadis IBI-Datenwerkzeuge](https://www.ibigroup.com/ibi-products/transit-data-tools/)

**Ideen zu Anbietern von GTFS:**

- [Zentrum für Stadtverkehrsforschung, Universität von Südflorida Liste der GTFS](https://docs.google.com/spreadsheets/u/1/d/1Gc9mu4BIYC8ORpv2IbbVnT3q8VQ3xkeY7Hz068vT_GQ/pubhtml)

Siehe weitere [Online-Kurse](../resources/other/#on-line-courses).


## Hilfe & Gemeinschaft

<hr/>

### Mailing-Listen

Es gibt eine Reihe von Mailinglisten, die bei Fragen zu ÖPNV-Daten, Software, Formaten wie GTFS und GTFS und anderen Themen eine gute Anlaufstelle sind:

* [GTFS Changes](https://groups.google.com/group/gtfs-changes): Diskussion der Vorschläge zur Erweiterung der GTFS, wie im [GTFS Changes](https://github.com/google/transit/blob/master/gtfs/CHANGES.md) dargelegt.
* [GTFS Realtime](https://groups.google.com/group/gtfs-realtime): Diskussion über die [GTFS-realtime specification](https://github.com/google/transit/tree/master/gtfs-realtime).
* [MobilityData Slack](https://mobilitydata-io.slack.com/): Slack-"Organisation" mit Kanälen, die sich mit GTFS befassen. [Fordern Sie hier eine Einladung zu mobilitydata-io.slack.com](https://share.mobilitydata.org/slack) an.
* [transitfeed](https://groups.google.com/group/transitfeed): Diskussion über das Open-Source-Projekt [transitfeed](https://groups.google.com/group/transitfeed) sowie über die GTFS und zugehörige Tools.
* [transit-developers](https://groups.google.com/group/transit-developers): allgemeine Transit-Entwickler-Diskussionen. Viele Verkehrsbetriebe haben auch ihre eigenen Mailinglisten für Entwickler, die speziell auf den Betrieb zugeschnitten sind. Zum Beispiel:
      * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
      * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
      * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
      * [MassDOT](https://groups.google.com/group/massdotdevelopers)
      * [Region Atlanta, GA](https://groups.google.com/forum/#!forum/atl-transit-developers)
      * [511 San Francisco Bay Area Ressourcen für Entwickler](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)

Erkundigen Sie sich bei Ihrer örtlichen Verkehrsgesellschaft, ob sie eine eigene Mailingliste hat.


Siehe weitere [Ressourcen der Gemeinschaft](../resources/community).
