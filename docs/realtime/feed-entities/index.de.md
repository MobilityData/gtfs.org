# Feed-Entitäten

GTFS Realtime unterstützt drei verschiedene Arten von Echtzeitdaten, die in einem einzigen Echtzeit-Feed kombiniert werden können. Im Folgenden finden Sie Zusammenfassungen, die vollständige Dokumentation finden Sie im entsprechenden Abschnitt.

## Trip Updates

#### "Bus X verspätet sich um 5 Minuten"

Trip updates stellen Schwankungen im Fahrplan dar. Wir würden erwarten, dass wir für alle Fahrten, die Sie geplant haben und die echtzeitfähig sind, trip updates erhalten. Die trip updates können auch komplexere Szenarien abbilden, bei denen Fahrten gestrichen, in den Fahrplan aufgenommen oder sogar umgeleitet werden.

[Mehr über Trip Updates...](trip-updates.md)

## Service Alerts

#### "Station Y ist wegen Bauarbeiten geschlossen".

Service alerts stellen Probleme auf höherer Ebene mit einer bestimmten Einheit dar und haben im Allgemeinen die Form einer textlichen Beschreibung der Störung.

Sie können Probleme darstellen mit:

*   Bahnhöfen
*   Linien
*   dem gesamten Netz
*   usw.

Eine service alert besteht in der Regel aus einem Text, der das Problem beschreibt, und wir erlauben auch URLs für weitere Informationen sowie besser strukturierte Informationen, die uns helfen zu verstehen, wen diese Service Alerts betrifft.

[Mehr über Service Alerts...](service-alerts.md)

## Vehicle Positions

#### "Dieser Bus ist an der Position X zur Zeit Y"

Die Vehicle position enthält einige grundlegende Informationen über ein bestimmtes Fahrzeug im Netz.

Am wichtigsten sind der Breiten- und Längengrad, an dem sich das Fahrzeug befindet, aber wir können auch Daten über die aktuelle Geschwindigkeit und den Kilometerstand des Fahrzeugs abrufen.

[Mehr über Vehicle Position Updates...](vehicle-positions.md)

## Historische Anmerkung zu den Futtermittelarten

Frühe Versionen der GTFS Realtime spezifikation verlangten, dass jeder Feed nur einen einzigen Typ von Entitäten enthält. Ein Beispieltool zur Konvertierung von merged in dasfeed-per-type Schema befindet sich im Bliksem Labs [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py) GitHub Repository.
