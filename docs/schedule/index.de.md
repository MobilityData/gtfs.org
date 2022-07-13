# Schedule Übersicht

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

Datensätze sollten unter einer öffentlichen, dauerhaften URL veröffentlicht werden, die auch den Namen der Zip-Datei enthält. (z. B. www. [GTFS/GTFS.zip">GTFS](<http://www.agency.org/\<glossary variable=>). Im Idealfall sollte die URL direkt heruntergeladen werden können, ohne dass eine Anmeldung für den Zugriff auf die Datei erforderlich ist, um das Herunterladen durch Softwareanwendungen zu erleichtern. Es wird zwar empfohlen (und ist die gängigste Praxis), einen GTFS offen zum Herunterladen bereitzustellen, doch wenn ein Datenanbieter den Zugriff auf GTFS aus lizenzrechtlichen oder anderen Gründen kontrollieren muss, wird empfohlen, den Zugriff auf den GTFS mithilfe von API-Schlüsseln zu kontrollieren, was automatische Downloads erleichtert.

Der Web-Server, der die GTFS hostet, sollte so konfiguriert sein, dass er das Änderungsdatum der Datei korrekt meldet (siehe HTTP/1.1 - Request for Comments 2616, unter Abschnitt 14.29).

Siehe "[Bewährte Praktiken: Dataset Publishing](best-practices/#dataset-publishing-general-practices)" für weitere Empfehlungen.

## Ausbildung

<hr/>

Der Open Learning Campus (OLC) der Weltbank bietet einen Online-Kurs zum Selbststudium mit dem Titel "[GTFS-and-informal-transit-system-mapping">Introduction to the General Transit Feed Specification (GTFS](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)) and Informal Transit System Mapping" an. Dieser Kurs umfasst die folgenden Abschnitte:

* Was ist GTFS? Geschichte und Dateistruktur
* Was ist GTFS? Visualisierung & Gemeinschaft
* Einrichten eines GTFS
* Einführung in GitHub & Open Source Tools
* Geschichten aus der Praxis
* Wie man Transitdaten abbildet
* Wie man Daten für den ersten Feed einer Stadt sammelt
* App-Übersicht
* GTFS

Siehe weitere [Online-Kurse](../resources/other/#on-line-courses).

## Hilfe & Gemeinschaft

<hr/>

### Mailing-Listen

Es gibt eine Reihe von Mailinglisten, die bei Fragen zu ÖPNV-Daten, Software, Formaten wie GTFS und GTFS und anderen Themen eine gute Anlaufstelle sind:

* [GTFS-changes">GTFS](<https://groups.google.com/group/\<glossary variable=>): Diskussion des Vorschlags zur Erweiterung der GTFS.
* [MobilityData Slack](https://mobilitydata-io.slack.com/): Slack-"Organisation" mit Kanälen, die sich mit GTFS befassen. [Fordern Sie hier eine Einladung zu mobilitydata-io.slack.com an](https://share.mobilitydata.org/slack).
* [Transit Developers](https://groups.google.com/group/transit-developers): Allgemeine Diskussionen von Entwicklern im Bereich Verkehrswesen. Viele Verkehrsbetriebe haben auch ihre eigenen Mailinglisten für Entwickler, die speziell auf den Betrieb zugeschnitten sind. Zum Beispiel:
  * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
  * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
  * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
  * [MassDOT](https://groups.google.com/group/massdotdevelopers)
  * [Region Atlanta, GA](https://groups.google.com/forum/#!forum/atl-transit-developers)
  * [511 San Francisco Bay Area Ressourcen für Entwickler](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)
* Erkundigen Sie sich bei Ihrer örtlichen Verkehrsgesellschaft, ob sie eine eigene Mailingliste hat.

Siehe weitere [Ressourcen der Gemeinschaft](../resources/community).
