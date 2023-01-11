# Feed-Entitäten

GTFS Realtime unterstützt drei verschiedene Arten von Echtzeitdaten, die in einem einzigen Echtzeit-Feed kombiniert werden können. Im Folgenden finden Sie Zusammenfassungen, die vollständige Dokumentation finden Sie im entsprechenden Abschnitt.

## Trip-Updates

#### "Bus X verspätet sich um 5 Minuten"

Fahrtenaktualisierungen stellen Schwankungen im Fahrplan dar. Wir würden erwarten, dass wir für alle Fahrten, die Sie geplant haben und die echtzeitfähig sind, Fahrtenaktualisierungen erhalten. Die Fahrtenaktualisierungen können auch komplexere Szenarien abbilden, bei denen Fahrten gestrichen, in den Fahrplan aufgenommen oder sogar umgeleitet werden.

[Mehr über Reise-Updates...](trip-updates.md)

## Service-Warnungen

#### "Station Y ist wegen Bauarbeiten geschlossen".

Servicewarnungen stellen Probleme auf höherer Ebene mit einer bestimmten Einheit dar und haben im Allgemeinen die Form einer textlichen Beschreibung der Störung.

Sie können Probleme darstellen mit:

*   Bahnhöfen
*   Linien
*   dem gesamten Netz
*   usw.

Eine Servicewarnung besteht in der Regel aus einem Text, der das Problem beschreibt, und wir erlauben auch URLs für weitere Informationen sowie besser strukturierte Informationen, die uns helfen zu verstehen, wen diese Servicewarnung betrifft.

[Mehr über Service-Warnungen...](service-alerts.md)

## Fahrzeugpositionen

#### "Dieser Bus ist an der Position X zur Zeit Y"

Die Fahrzeugposition enthält einige grundlegende Informationen über ein bestimmtes Fahrzeug im Netz.

Am wichtigsten sind der Breiten- und Längengrad, an dem sich das Fahrzeug befindet, aber wir können auch Daten über die aktuelle Geschwindigkeit und den Kilometerstand des Fahrzeugs abrufen.

[Mehr über Fahrzeugpositions-Updates...](vehicle-positions.md)

## Historische Anmerkung zu den Futtermittelarten

Frühe Versionen der GTFS-Echtzeitspezifikation verlangten, dass jeder Feed nur einen einzigen Typ von Entitäten enthält. Ein Beispieltool zur Konvertierung von merged in dasfeed-per-type Schema befindet sich im Bliksem Labs [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py) GitHub Repository.
