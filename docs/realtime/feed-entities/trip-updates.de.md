# Trip Updates

Trip updates stellen Schwankungen im Fahrplan dar. Wir würden erwarten, dass wir für alle Fahrten, die Sie geplant haben und die echtzeitfähig sind, trip updates erhalten. Diese Aktualisierungen würden eine voraussichtliche Ankunfts- oder Abfahrtszeit für Haltestellen entlang der Strecke angeben. Die trip updates können auch komplexere Szenarien abbilden, bei denen Fahrten storniert oder dem Fahrplan hinzugefügt oder sogar umgeleitet werden.

**Zur Erinnerung:** In [GTFS](../../schedule/reference.md) ist eine Fahrt eine Folge von zwei oder mehr Haltestellen, die zu einer bestimmten Zeit angefahren werden.

Für jede geplante Fahrt sollte es **höchstens** eine trip update geben. Gibt es für eine geplante Fahrt keine Reiseaktualisierung, so wird daraus geschlossen, dass für diese Fahrt keine Echtzeitdaten verfügbar sind. Der Datenkonsument sollte **nicht** davon ausgehen, dass die Fahrt pünktlich durchgeführt wird.

Wenn ein Fahrzeug mehrere Fahrten innerhalb desselben Blocks bedient (weitere Informationen über Fahrten und Blöcke finden Sie in [GTFS trips.txt](../../schedule/reference.md#tripstxt)):

*   sollte der Feed ein TripUpdate für die trip enthalten, die gerade von dem vehicle bedient wird. Die Produzenten werden ermutigt, TripUpdate für eine oder mehrere Fahrten nach der aktuellen trip in den Block dieses vehicle aufzunehmen, wenn der Produzent von der Qualität der Vorhersagen für diese zukünftige(n) trip(en) überzeugt ist. Durch die Aufnahme mehrerer TripUpdates für dasselbe vehicle wird vermieden, dass die Vorhersagen für die Fahrgäste beim Übergang von einer trip zu einer anderen "aufpoppen" und dass die Fahrgäste im Voraus über Verspätungen informiert werden, die sich auf nachfolgende Fahrten auswirken (z. B. wenn die bekannte delay die geplanten Wartezeiten zwischen den Fahrten überschreitet).
*   Die jeweiligen TripUpdate müssen nicht in der Reihenfolge, in der sie im Block geplant sind, zum Feed hinzugefügt werden. Wenn es beispielsweise Fahrten mit den `trip_ids` 1, 2 und 3 gibt, die alle zu einem Block gehören, und das vehicle fährt zuerst die trip 1, dann die trip 2 und dann die trip 3, können die `trip_update` in beliebiger Reihenfolge erscheinen - zum Beispiel ist das Hinzufügen der trip 2, dann der trip 1 und dann der trip 3 zulässig.

## StopTimeUpdate

Eine trip update besteht aus einer oder mehreren Aktualisierungen der Fahrzeughaltezeiten, die als [StopTimeUpdates](../reference.md#message-stoptimeupdate) bezeichnet werden. Diese können für vergangene und zukünftige Haltezeiten geliefert werden. Es ist erlaubt, aber nicht erforderlich, vergangene Stoppzeiten zu löschen. Hersteller sollten ein vergangenes `StopTimeUpdate` nicht weglassen, wenn es sich auf eine Haltestelle mit einer geplanten Ankunftszeit in der Zukunft für die gegebene Fahrt bezieht (d. h. das Fahrzeug hat die Haltestelle vorzeitig passiert), da sonst der Schluss gezogen wird, dass es für diese Haltestelle keine Aktualisierung gibt.

Zum Beispiel, wenn die folgenden Daten im GTFS-rt-Feed erscheinen:

*   Haltestelle 4 - Voraussichtlich um 10:18 Uhr (planmäßig um 10:20 Uhr - 2 Minuten zu früh)
*   Haltestelle 5 - vorhergesagt um 10:30 Uhr (geplant um 10:30 Uhr - pünktlich)

...die Vorhersage für die Haltestelle 4 kann nicht vor 10:21 Uhr aus dem Feed gelöscht werden, selbst wenn der Bus die Haltestelle tatsächlich um 10:18 Uhr passiert. Wenn das `StopTimeUpdate` für die Haltestelle 4 um 10:18 Uhr oder 10:19 Uhr aus dem Feed gelöscht wurde und die planmäßige Ankunftszeit 10:20 Uhr ist, dann sollte der Verbraucher davon ausgehen, dass für die Haltestelle 4 zu diesem Zeitpunkt keine Echtzeitinformationen vorliegen, und es sollten Fahrplandaten von GTFS verwendet werden.

Jedes [StopTimeUpdate](../reference.md#message-stoptimeupdate) ist mit einer Haltestelle verknüpft. Normalerweise kann dies entweder mit einer GTFS stop_sequence oder einer GTFS stop_id geschehen. Wenn Sie jedoch eine Aktualisierung für eine Fahrt ohne GTFS trip_id bereitstellen, müssen Sie stop_id angeben, da stop_sequence keinen Wert hat. Die stop_id muss dennoch auf eine stop_id in GTFS verweisen. Wird dieselbe Haltestelle in einer Fahrt mehr als einmal angefahren, sollte stop_sequence in allen StopTimeUpdates für diese stop_id in dieser Fahrt angegeben werden.

Die Aktualisierung kann eine genaue Zeitangabe für die **arrival** und/oder **departure** an einer Haltestelle in [StopTimeUpdates](../reference.md#message-stoptimeupdate) unter Verwendung von [StopTimeEvent](../reference.md#message-stoptimeevent) liefern. Diese sollte entweder eine absolute **time** oder eine **delay** (d. h. einen Versatz von der geplanten Zeit in Sekunden) enthalten. Die Verzögerung kann nur verwendet werden, wenn sich die trip update auf eine planmäßige GTFS-Fahrt bezieht, im Gegensatz zu einer frequenzbasierten Fahrt. In diesem Fall sollte die Zeit gleich der fahrplanmäßigen Zeit + Verzögerung sein. Sie können auch die **uncertainty** der Vorhersage zusammen mit [StopTimeEvent](../reference.md#message-stoptimeevent) angeben, was im Abschnitt [Uncertainty](#uncertainty) weiter unten auf der Seite näher erläutert wird.

Für jedes [StopTimeUpdate](../reference.md#message-stoptimeupdate) wird die Standard-Zeitplanbeziehung **scheduled**. (Beachten Sie, dass sich dies von der Fahrplanbeziehung für die Fahrt unterscheidet). Sie können dies auf **"skipped" (übersprungen)** ändern, wenn die Haltestelle nicht angefahren wird, oder auf **"no data" (keine Daten)**, wenn Sie nur für einen Teil der Fahrt Echtzeitdaten haben.

**Aktualisierungen sollten nach Haltestellenfolge** (oder stop_ids in der Reihenfolge, in der sie in der Fahrt vorkommen)**sortiert werden**.

Wenn eine oder mehrere Haltestellen entlang der Fahrt fehlen, wird die `delay` aus der Aktualisierung (oder, wenn nur die `time` in der Aktualisierung angegeben ist, eine Verspätung, die durch Vergleich der `time` mit der GTFS-Fahrplanzeit berechnet wird) auf alle nachfolgenden Haltestellen übertragen. Das bedeutet, dass die Aktualisierung einer Haltestellenzeit für eine bestimmte Haltestelle alle nachfolgenden Haltestellen verändert, sofern keine anderen Informationen vorliegen. Beachten Sie, dass Aktualisierungen mit einer Fahrplanbeziehung von `SKIPPED` die Ausbreitung der Verspätung nicht stoppen, aber Aktualisierungen mit Fahrplanbeziehungen von `SCHEDULED` (auch der Standardwert, wenn keine Fahrplanbeziehung angegeben ist) oder `NO_DATA` schon.

**Beispiel 1**

Bei einer Fahrt mit 20 Haltestellen bedeutet ein [StopTimeUpdate](../reference.md#message-stoptimeupdate) mit einer Ankunftsverzögerung und einer Abfahrtsverzögerung von 0[(StopTimeEvents](../reference.md#message-stoptimeevent)) für die stop_sequence der aktuellen Haltestelle, dass die Fahrt genau pünktlich ist.

**Beispiel 2**

Für dieselbe Fahrtinstanz werden drei [StopTimeUpdates](../reference.md#message-stoptimeupdate) bereitgestellt:

*   Verzögerung von 300 Sekunden für stop_sequence 3
*   Verzögerung von 60 Sekunden für stop_sequence 8
*   [ScheduleRelationship](../reference.md#enum-schedulerelationship) von `NO_DATA` für stop_sequence 10

Dies wird interpretiert als:

*   stop_sequences 1,2 haben eine unbekannte Verzögerung.
*   stop_sequences 3,4,5,6,7 haben eine Verzögerung von 300 Sekunden.
*   stop_sequences 8,9 haben eine Verzögerung von 60 Sekunden.
*   stop_sequences 10,...,20 haben eine unbekannte Verzögerung.

## TripDescriptor

Die vom TripDescriptor bereitgestellten Informationen hängen von der Fahrplanbeziehung der zu aktualisierenden Fahrt ab. Es gibt eine Reihe von Optionen, die Sie einstellen können:

| _**Wert**_         | _**Bemerkung**_                                                                                                                                                                                                                                      |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Scheduled**        | Diese Fahrt läuft nach einem GTFS-Fahrplan oder ist nahe genug dran, um noch mit ihm verbunden zu sein.                                                                                                                                              |
| **Added**    | Diese Fahrt war nicht geplant und wurde hinzugefügt. Zum Beispiel, um die Nachfrage zu befriedigen oder ein ausgefallenes Fahrzeug zu ersetzen.                                                                                                      |
| **Unscheduled** | Diese Fahrt findet statt und ist nie mit einem Fahrplan verknüpft. Zum Beispiel, wenn es keinen Fahrplan gibt und die Busse im Pendelverkehr fahren.                                                                                                 |
| **Canceled**       | Diese Fahrt war geplant, wurde aber gestrichen.                                                                                                                                                                                                      |
| **Duplicated**     | Diese neue Fahrt ist eine Kopie einer bestehenden Fahrt im statischen GTFS, mit Ausnahme von Datum und Uhrzeit des Dienstbeginns. Die neue Fahrt wird zu dem in TripProperties angegebenen Fahrtdatum und der dort angegebenen Uhrzeit durchgeführt. |

In den meisten Fällen sollten Sie die trip_id der geplanten Reise in GTFS angeben, auf die sich diese Aktualisierung bezieht.

#### Systeme mit wiederholten trip_ids

Bei Systemen mit wiederholten trip_ids, z. B. bei Fahrten, die mit frequencies.txt modelliert wurden, d. h. bei frequenzbasierten Fahrten, ist die trip_id an sich kein eindeutiger Identifikator für eine einzelne Fahrt, da ihr eine spezifische Zeitkomponente fehlt. Um solche Fahrten innerhalb einesTripDescriptor eindeutig zu identifizieren, muss ein Tripel von Identifikatoren angegeben werden:

*   **trip_id**
*   **start_time**
*   **start_date**

start_time sollte zuerst veröffentlicht werden, und alle nachfolgenden Aktualisierungen des Feeds sollten dieselbe start_time verwenden, wenn sie sich auf dieselbe Fahrt beziehen. StopTimeUpdates sollten verwendet werden, um Anpassungen anzuzeigen; die start_time muss nicht genau die Abfahrtszeit vom ersten Bahnhof sein, obwohl sie dieser Zeit ziemlich nahe kommen sollte.

Angenommen, wir entscheiden am 25. Mai 2015 um 10:00 Uhr, dass eine Fahrt mit trip_id=T um start_time=10:10:00 Uhr beginnt, und geben diese Information um 10:01 Uhr per Echtzeit-Feed weiter. Um 10:05 Uhr wissen wir plötzlich, dass die Reise nicht um 10:10 Uhr, sondern um 10:13 Uhr beginnen wird. In unserem neuen Echtzeit-Feed können wir diese Fahrt immer noch als (T, 2015-05-25, 10:10:00) identifizieren, aber ein StopTimeUpdate mit Abfahrt vom ersten Halt um 10:13:00 bereitstellen.

#### Alternativer Fahrtenabgleich

Fahrten, die nicht frequenzbasiert sind, können auch eindeutig durch einen TripDescriptor identifiziert werden, der die Kombination von:

*   **route_id**
*   **direction_id**
*   **start_time**
*   **start_date**

wobei start_time die im statischen Fahrplan definierte planmäßige start_time ist, sofern die Kombination der angegebenen IDs eine eindeutige Fahrt ergibt.

## Uncertainty

Die Uncertainty gilt sowohl für den Zeit- als auch für den Verzögerungswert eines [StopTimeUpdates](../reference.md#message-stoptimeupdate). Die Uncertainty gibt grob den erwarteten Fehler in der tatsächlichen Verzögerung als ganze Zahl in Sekunden an (die genaue statistische Bedeutung ist jedoch noch nicht definiert). Es ist möglich, dass die Uncertainty 0 ist, z. B. bei Zügen, die unter Computerzeitsteuerung gefahren werden.

Ein Beispiel: Ein Fernbus, der mit einer geschätzten Verspätung von 15 Minuten innerhalb eines Fehlerfensters von 4 Minuten (d. h. +2 / -2 Minuten) an seiner nächsten Haltestelle ankommt, hat einen Uncertainty swert von 240.
