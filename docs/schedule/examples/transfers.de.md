# Übertragungen

<hr/>

## Blocktransfers

Blocktransfers, auch Sitzplatztransfers genannt, sind möglich, wenn eine Reihe von Fahrten die folgenden Bedingungen erfüllt:

1. Die Fahrten sind aufeinanderfolgend.
2. Beide Fahrten werden von demselben Fahrzeug durchgeführt.
3. Die Fahrten werden mit demselben `block_id` Wert in der Datei [trips.txt](../../reference/#tripstxt) im Transit-Feed bereitgestellt.

### Verwenden Sie `block_id`, um Blocktransfers zu aktivieren.

Blocktransfers können zwischen aufeinanderfolgenden Fahrten auf verschiedenen Strecken oder auf derselben Strecke durchgeführt werden, wenn es sich um eine Schleifenstrecke handelt. Verwenden Sie das Feld `block_id`, um festzulegen, welche Fahrten zu einem Block gehören und wo Umsteigevorgänge in einem Sitzplatz möglich sind.

Nehmen wir zum Beispiel die folgenden Werte für [trips.txt](../../reference/#tripstxt) und [stop_times.txt](../../reference/#stoptimestxt):

[**trips.txt**](../../reference/#tripstxt)

| route_id | trip_id     | block_id |
|----------|-------------| -------- |
| RouteA   | RouteATrip1 | Block1   |
| RouteB   | RouteBTrip1 | Block1   |

[**stop_times.txt**](../../reference/#stoptimestxt)

| trip_id       | arrival_time | departure_time | stop_id | stop_sequence |
| ------------- | ------------ | ----------- | ------- | ------------- |
| RouteATrip1 | 12:00:00     | 12:01:00    | A       | 1             |
| RouteATrip1 | 12:05:00     | 12:06:00    | B       | 2             |
| RouteATrip1 | 12:15:00     |             | C       | 3             |
| RouteBTrip1   |              | 12:18:00    | C       | 1             |
| RouteBTrip1   | 12:22:00     | 12:23:00    | D       | 2             |
| RouteBTrip1   | 12:30:00     |             | E       | 3             |

In diesem Beispiel:

- Ein Benutzer, der eine Route von der Haltestelle A zur Haltestelle E sucht, wird angewiesen, um 12:00 Uhr an der Haltestelle A auf der Route A einzusteigen und im Fahrzeug zu bleiben, wenn es die Haltestelle C nach dem Ende der `RouteATrip1` erreicht. Dies liegt daran, dass das gleiche Fahrzeug die `RouteBTrip1` für die Route B bedient.
- Fahrgäste der `RouteATrip1`, die zu einer Haltestelle der `RouteBTrip1` weiterfahren möchten, können für diesen Transfer im Fahrzeug bleiben.
- Fahrgäste anderer Fahrten mit anderen Fahrzeugen auf denselben Strecken haben diese Möglichkeit nicht, da sie für jede Fahrt ein anderes Fahrzeug benutzen.

### Blocktransfer in einer Ringlinie

In einer Ringlinie sind die erste und die letzte Haltestelle einer Fahrt identisch und haben die gleiche `stop_id`. Wenn aufeinanderfolgende Fahrten einer Ringlinie die gleiche `block_id` haben, ist die Blockumsteigefunktion aktiviert, so dass die Fahrgäste der ersten Fahrt im Fahrzeug verbleiben können, wenn es auf der nächsten Ringlinie weiterfährt.
