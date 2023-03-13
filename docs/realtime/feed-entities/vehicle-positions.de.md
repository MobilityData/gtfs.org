# Vehicle Positions

Die vehicle position wird verwendet, um automatisch generierte Informationen über den Standort eines Fahrzeugs bereitzustellen, z. B. von einem GPS-Gerät an Bord. Für jedes Fahrzeug, das dazu in der Lage ist, sollte eine einzige vehicle position angegeben werden.

Die Fahrt, die das Fahrzeug gerade durchführt, sollte durch einen [TripDescriptor](../reference.md#message-tripdescriptor) angegeben werden. Sie können auch einen [VehicleDescriptor](../reference.md#message-vehicledescriptor) angeben, der ein genaues physisches Fahrzeug spezifiziert, über das Sie Updates bereitstellen. Die Dokumentation dazu finden Sie weiter unten.

Es kann ein **timestamp** angegeben werden, der die Zeit angibt, zu der die Positionsbestimmung vorgenommen wurde. Dieser Zeitstempel unterscheidet sich vom Zeitstempel in der Kopfzeile des Feeds, der die Zeit angibt, zu der diese Nachricht vom Server erzeugt wurde.

Auch die **current passage** kann angegeben werden (entweder als `stop_sequence` oder `stop_id`). Dies ist ein Verweis auf die Haltestelle, zu der das Fahrzeug entweder unterwegs ist oder an der es bereits angehalten hat.

## Position

Position enthält die Standortdaten innerhalb von Vehicle Position. Breitengrad und Längengrad sind obligatorisch, die anderen Felder sind optional. Diese Arten von Daten sind:

*   **Latitude** - Grad Nord, im WGS-84-Koordinatensystem
*   **Longitude** - Grad Ost, im WGS-84-Koordinatensystem
*   **Bearing** - Richtung, in die das Fahrzeug gerichtet ist
*   **Odometer** - die vom Fahrzeug zurückgelegte Strecke
*   **Speed** - vom Fahrzeug gemessene momentane Geschwindigkeit in Metern pro Sekunde

## CongestionLevel

Anhand der vehicle position kann die Agentur auch den Grad der Überlastung angeben, die das Fahrzeug gerade erfährt. Staus können in die folgenden Kategorien eingeteilt werden:

*   Unknown congestion level
*   Running smoothly
*   Stop and go
*   Congestion
*   Severe congestion

Es ist Sache der Agentur, die einzelnen Arten von Staus zu klassifizieren. Unserer Meinung nach werden schwere Staus nur in Situationen verwendet, in denen der Verkehr so dicht ist, dass die Leute ihr Auto verlassen.

## OccupancyStatus

Die vehicle position ermöglicht es der Behörde auch, den Grad der Belegung des Fahrzeugs mit Fahrgästen anzugeben. Der Belegungsstatus kann in die folgenden Kategorien eingeteilt werden:

*   Empty
*   Many seats available
*   Few seats available
*   Standing room only
*   Crushed standing room only
*   Full
*   Not accepting passengers

Dieses Feld ist noch **experimentell** und kann sich noch ändern. Es kann in Zukunft offiziell eingeführt werden.

## VehicleStopStatus

Der vehicle stop status dem Status eines Fahrzeugs in Bezug auf eine Haltestelle, der es sich gerade nähert oder an der es sich befindet, mehr Bedeutung. Er kann auf einen der folgenden Werte eingestellt werden.

*   **Incoming at** - das Fahrzeug ist im Begriff, die angegebene Haltestelle zu erreichen
*   **Stopped at** - das Fahrzeug steht an der angegebenen Haltestelle
*   **In transit to** - die angegebene Haltestelle ist die nächste Haltestelle des Fahrzeugs - **Voreinstellung**

## VehicleDescriptor

VehicleDescriptor beschreibt ein genaues physisches Fahrzeug und kann jedes der folgenden Attribute enthalten:

*   **ID** - internes Identifikationssystem für das Fahrzeug. Sollte für das Fahrzeug eindeutig sein
*   **Label** - eine für den Benutzer sichtbare Bezeichnung - zum Beispiel der Name eines Zuges
*   **License plate** - das tatsächliche Nummernschild des Fahrzeugs
