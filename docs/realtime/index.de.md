# GTFS Realtime Überblick

<div class="landing-page">
   <a class="button" href="reference">Referenz
</a>  <a class="button" href="best-practices">Bewährte Praktiken</a>
   <a class="button" href="feed-examples">Beispiele</a>
   <a class="button" href="changes">Änderungen</a>
</div>

## Erste Schritte

Wenn Sie Ihren Nutzern aktuelle Verkehrsdaten in Echtzeit zur Verfügung stellen, können diese Ihre Verkehrsdienste besser nutzen. Die Bereitstellung aktueller Informationen über aktuelle Ankunfts- und Abfahrtszeiten ermöglicht den Nutzern eine reibungslose Planung ihrer Fahrten. Im Falle einer unglücklichen Verspätung ist der Fahrgast erleichtert, wenn er weiß, dass er noch ein wenig länger zu Hause bleiben kann.

GTFS Realtime ist eine Feed-Spezifikation, die es Verkehrsbetrieben ermöglicht, Anwendungsentwicklern Realtime über ihre Flotte zur Verfügung zu stellen. Es handelt sich um eine Erweiterung von [Schedule/reference">GTFS](<../\<glossary variable=>)General Transit Feed Specification), einem offenen Datenformat für Fahrpläne des öffentlichen Verkehrs und zugehörige geografische Informationen. GTFS Realtime wurde mit Blick auf eine einfache Implementierung, eine gute GTFS und einen Schwerpunkt auf Fahrgastinformationen entwickelt.

Die Spezifikation wurde im Rahmen einer Partnerschaft zwischen den ersten [Live Transit Updates-Partneragenturen](https://developers.google.com/transit/google-transit#LiveTransitUpdates), einer Reihe von Verkehrsentwicklern und Google entwickelt. Die Spezifikation wird unter der [Apache 2.0-Lizenz](https://www.apache.org/licenses/LICENSE-2.0.html) veröffentlicht.

## Wie kann ich beginnen?

1.  Lesen Sie die Übersicht weiter unten.
2.  Entscheiden Sie, welche [Feed-Entitäten](feed-entities) Sie bereitstellen werden.
3.  Werfen Sie einen Blick auf [Beispiel-Feeds](feed-examples).
4.  Erstellen Sie Ihre eigenen Feeds unter Verwendung der [Referenz](reference).
5.  [Veröffentlichen Sie Ihren Feed](best-practices/#feed-publishing-general-practices).

## Überblick über Realtime

Die Spezifikation unterstützt derzeit die folgenden Arten von Informationen:

*   **Fahrtaktualisierungen** - Verspätungen, Annullierungen, geänderte Routen
*   **Servicewarnungen** - verschobene Haltestellen, unvorhergesehene Ereignisse, die eine Station, eine Strecke oder das gesamte Netz betreffen
*   **Fahrzeugpositionen** - Informationen über die Fahrzeuge, einschließlich Standort und Überlastungsgrad

Ein Feed kann, muss aber nicht, Einheiten verschiedener Typen kombinieren. Feeds werden über HTTP bereitgestellt und häufig aktualisiert. Die Datei selbst ist eine reguläre Binärdatei, so dass jeder Webserver die Datei hosten und bereitstellen kann (auch andere Übertragungsprotokolle können verwendet werden). Alternativ können auch Webanwendungsserver verwendet werden, die als Antwort auf eine gültige HTTP-GET-Anfrage den Feed zurückgeben. Es gibt keine Einschränkungen hinsichtlich der Häufigkeit oder der genauen Methode, wie der Feed aktualisiert oder abgerufen werden soll.

Da GTFS Realtime es Ihnen ermöglicht, den _aktuellen_ Status Ihrer Flotte darzustellen, muss der Feed regelmäßig aktualisiert werden - vorzugsweise immer dann, wenn neue Daten von Ihrem automatischen Fahrzeugortungssystem eingehen.

[Mehr über Feed-Entitäten...](feed-entities)

## Datenformat

Das Realtime basiert auf [Protokollpuffern](https://developers.google.com/protocol-buffers/)

Protokollpuffer sind ein language und plattformneutraler Mechanismus zur Serialisierung strukturierter Daten (wie XML, nur kleiner, schneller und einfacher). Die Datenstruktur wird in einer [GTFS](proto).proto-Datei definiert, die dann verwendet wird, um Quellcode zu generieren, mit dem Sie Ihre strukturierten Daten einfach aus einer Vielzahl von Datenströmen lesen und in diese schreiben können, und zwar in einer Vielzahl von Sprachen - z. B. Java, C++ oder Python.

[Mehr über Protokollpuffer....](https://developers.google.com/protocol-buffers/)

## Struktur der Daten

Die Hierarchie der Elemente und ihre Typdefinitionen sind in der Datei [GTFS](proto).proto festgelegt.

Diese Textdatei wird verwendet, um die erforderlichen Bibliotheken in der von Ihnen gewählten language zu generieren. Diese Bibliotheken stellen die Klassen und Funktionen zur Verfügung, die für die Erstellung gültiger GTFS Realtime Feeds benötigt werden. Die Bibliotheken erleichtern nicht nur die Erstellung von Feeds, sondern stellen auch sicher, dass nur gültige Feeds erzeugt werden.

[Mehr über die Datenstruktur...](reference)

## Hilfe erhalten

Wenn Sie sich an Diskussionen über GTFS Realtime beteiligen und Änderungen und Ergänzungen zur Spezifikation vorschlagen möchten, treten Sie der [GTFS-realtime">GTFS Realtime](<https://groups.google.com/group/\<glossary variable=>) bei und verfolgen Sie die Konversationen im [GitHub-Repository google/transit](https://github.com/google/transit).

## Google Maps und Live-Transit-Aktualisierungen

Eine der möglichen Anwendungen, die GTFS Realtime nutzen, ist [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates), eine Funktion in Google Maps, die Nutzern Realtime über den Nahverkehr liefert. Wenn Sie für ein öffentliches Verkehrsunternehmen arbeiten, das an der Bereitstellung von Realtime für Google Maps interessiert ist, besuchen Sie bitte die [Google Transit Partner-Seite](https://maps.google.com/help/maps/transit/partners/live-updates.html).
