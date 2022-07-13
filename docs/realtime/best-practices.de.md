# GTFS Realtime Best Practices

## Einführung

Dies sind empfohlene Praktiken für die Beschreibung von Realtime des öffentlichen Verkehrs im [Realtime](../reference).

### Struktur des Dokuments

Die empfohlenen Praktiken sind in zwei Hauptabschnitte unterteilt

* __[Praxisempfehlungen nach Nachrichten geordnet](#practice-recommendations-organized-by-message)__: Die Empfehlungen sind nach Nachrichten und Feldern in der gleichen Reihenfolge geordnet, wie sie in der offiziellen Realtime für Echtzeitdaten beschrieben ist.
* __[Praxisempfehlungen nach Fall gegliedert](#practice-recommendations-organized-by-use-case)__: In bestimmten Fällen, z. B. bei frequenzbasierten Diensten (im Gegensatz zu Schedule Diensten), müssen Praktiken möglicherweise auf mehrere Nachrichten und Felder sowie auf die entsprechenden Schedule angewendet werden. Solche Empfehlungen werden in diesem Abschnitt zusammengefasst.

### Veröffentlichung von Feeds und allgemeine Praktiken

* Feeds sollten unter einer öffentlichen, permanenten URL veröffentlicht werden.
* Die URL sollte direkt zugänglich sein, ohne dass eine Anmeldung für den Zugriff auf den Feed erforderlich ist. Falls gewünscht, können API-Schlüssel verwendet werden, aber die Registrierung für API-Schlüssel sollte automatisch erfolgen und für alle zugänglich sein.
* Beibehaltung dauerhafter Identifikatoren (id-Felder) innerhalb eines GTFS Realtime Feeds (z. B. `FeedEntity.id`, `VehicleDescriptor.id`, `CarriageDetails.id`) über Feed-Iterationen hinweg.
* Realtime sollten mindestens einmal alle 30 Sekunden oder immer dann aktualisiert werden, wenn sich die im Feed dargestellten Informationen (Position eines Fahrzeugs) ändern, je nachdem, was häufiger vorkommt. Fahrzeugpositionen ändern sich in der Regel häufiger als andere Feed-Entitäten und sollten daher so häufig wie möglich aktualisiert werden. Wenn sich der Inhalt nicht geändert hat, sollte der Feed mit einem neuen `FeedHeader.timestamp` aktualisiert werden, der angibt, dass die Informationen zu diesem Zeitpunkt noch relevant sind.
* Die Daten in einem Realtime sollten nicht älter als 90 Sekunden für Trip Updates und Fahrzeugpositionen und nicht älter als 10 Minuten für Service Alerts sein. Selbst wenn ein Hersteller beispielsweise den Zeitstempel `FeedHeader.timestamp` alle 30 Sekunden aktualisiert, sollte das Alter der Fahrzeugpositionen in diesem Feed nicht älter als 90 Sekunden sein.
* Der Server, auf dem Realtime gehostet werden, sollte zuverlässig sein und durchgängig gültig formatierte, protobuf-kodierte Antworten liefern. Weniger als 1 % der Antworten sollten ungültig sein (Protobuf-Fehler oder Abruffehler).
* Der Web-Server, der die Realtime hostet, sollte so konfiguriert sein, dass er das Änderungsdatum der Datei korrekt meldet (siehe HTTP/1.1 - Request for Comments 2616, unter Abschnitt 14.29), damit die Verbraucher den HTTP-Header `If-Modified-Since` nutzen können. Dies spart Produzenten und Konsumenten Bandbreite, da die Übertragung von Feed-Inhalten, die sich nicht geändert haben, vermieden wird.
* Feeds sollten standardmäßig protokollpufferkodierte Feed-Inhalte bereitstellen, wenn sie über eine HTTP-Anfrage unter der angegebenen URL abgefragt werden - Verbraucher sollten keine speziellen HTTP-Accept-Header definieren müssen, um protokollpufferkodierte Inhalte zu erhalten.
* Aufgrund der Art und Weise, wie Protokollpuffer [optionale Werte](https://developers.google.com/protocol-buffers/docs/proto#optional) kodieren, sollten Verbraucher vor dem Lesen von Daten aus einem Realtime das Vorhandensein von Werten mit Hilfe der vom Protokollpuffer generierten `hasX()` -Methoden prüfen, bevor sie diesen Wert verwenden, und den Wert nur verwenden, wenn `hasX()` wahr ist (wobei `X` der Name des Feldes ist). Wenn `hasX()` `false` zurückgibt, sollte der im `GTFS`.proto-Wert definierte Standardwert für dieses Feld angenommen werden. Wenn der Verbraucher den Wert verwendet, ohne vorher die Methode `hasX()` zu überprüfen, liest er möglicherweise Standarddaten, die nicht absichtlich vom Hersteller veröffentlicht wurden.
* Feeds sollten HTTPS anstelle von HTTP (ohne Verschlüsselung) verwenden, um die Integrität des Feeds zu gewährleisten.
* Die Feeds sollten die große Mehrheit der im statischen GTFS enthaltenen Fahrten abdecken. Insbesondere sollten sie Daten für Stadtgebiete mit hoher Dichte und hohem Verkehrsaufkommen sowie für stark befahrene Strecken enthalten.

## Praxisempfehlungen nach Nachricht geordnet

### FeedHeader

| Feldname                | Empfehlung                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gtfs_realtime_version` | Die aktuelle Version ist "2.0".  Alle GTFS Realtime Feeds sollten "2.0" oder höher sein, da frühe Versionen von GTFS Realtime nicht alle Felder benötigten, um verschiedene Transitsituationen adäquat darzustellen.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `timestamp`             | Dieser Zeitstempel sollte zwischen zwei aufeinanderfolgenden Feed-Iterationen nicht abnehmen.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|                         | Dieser Zeitstempelwert sollte sich immer ändern, wenn sich der Inhalt des Feeds ändert - der Inhalt des Feeds sollte sich nicht ändern, ohne dass der Header aktualisiert wird. `timestamp`.<br/><br/>*Häufige Fehler* - Wenn mehrere Instanzen von GTFS Realtime Feed hinter einem Load Balancer installiert sind, kann es vorkommen, dass jede Instanz Informationen aus der Realtime abruft und sie leicht versetzt an die Verbraucher veröffentlicht. Wenn ein GTFS Realtime zwei aufeinanderfolgende Anfragen stellt und jede Anfrage von einer anderen GTFS Realtime bedient wird, könnte derselbe Feed-Inhalt möglicherweise mit unterschiedlichen Zeitstempeln an den Verbraucher zurückgegeben werden.<br/><br/>*Mögliche Lösung* - Produzenten sollten einen `Last-Modified` HTTP-Header bereitstellen, und die Verbraucher sollten ihren aktuellsten `If-Modified-Since` HTTP-Header übergeben, um den Empfang veralteter Daten zu vermeiden.<br/><br/>*Mögliche Lösung* - Wenn HTTP-Header nicht verwendet werden können, können Optionen wie Sticky Sessions verwendet werden, um sicherzustellen, dass jeder Verbraucher zum gleichen Producer-Server geleitet wird. |

### FeedEntity

Alle Entitäten sollten nur dann aus einem GTFS Realtime Feed entfernt werden, wenn sie für die Benutzer nicht mehr relevant sind. Feeds werden als zustandslos betrachtet, d. h. jeder Feed spiegelt den gesamten Echtzeitzustand des Transitsystems wider. Wenn eine Entität in einer Feed-Instanz zur Verfügung gestellt wird, aber in einer nachfolgenden Feed-Aktualisierung wegfällt, sollte davon ausgegangen werden, dass es keine Echtzeitinformationen für diese Entität gibt.

| Feldname | Empfehlung                                                |
| -------- | --------------------------------------------------------- |
| `id`     | sollte über die gesamte Fahrtdauer stabil gehalten werden |

### TripUpdate

Allgemeine Richtlinien für Reisestornierungen:

* Wenn Fahrten über mehrere Tage storniert werden, sollten die Hersteller TripUpdates bereitstellen, die sich auf die angegebenen `trip_ids` und `start_dates` als `CANCELED` beziehen, sowie einen Alert mit `NO_SERVICE`, der sich auf dieselben `trip_ids` und `TimeRange` bezieht und den Fahrern als Erklärung für die Stornierung angezeigt werden kann (z. B. Umleitung).
* Wenn in einer Fahrt keine Haltestellen angefahren werden, sollte die Fahrt `ABGESAGT werden`, anstatt alle `stop_time_updates` als `SKIPPED` zu markieren.

| Feldname           | Empfehlung                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip`             | Verweis auf [Nachricht TripDescriptor](#TripDescriptor).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|                    | Falls getrennt `VehiclePosition` und `TripUpdate` Feeds vorhanden sind, [TripDescriptor](#TripDescriptor) und [FahrzeugDeskriptor](#VehicleDescriptor) sollten die ID-Werte zwischen den beiden Feeds übereinstimmen.<br/><br/>Zum Beispiel ein `VehiclePosition` Entität hat `vehicle_id:A` und `trip_id:4`, dann die entsprechende `TripUpdate` Entität sollte auch haben `vehicle_id:A` und `trip_id:4`. Wenn eine `TripUpdate` Entität hat `trip_id:4` und jede `vehicle_id` anders als 4, ist dies ein Fehler.                                                                                                                                                                          |
| `vehicle`          | Verweis auf [Nachricht VehicleDescriptor](#VehicleDescriptor).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|                    | Wenn separate `VehiclePosition` und `TripUpdate` Feeds bereitgestellt werden, [TripDescriptor](#TripDescriptor) und [FahrzeugDeskriptor](#VehicleDescriptor) Die Paarung der ID-Werte sollte zwischen den beiden Feeds übereinstimmen.<br/><br/>Zum Beispiel, eine `VehiclePosition` Entität hat `vehicle_id:A` und `trip_id:4`hat, dann sollte die entsprechende `TripUpdate` Entität sollte auch haben `vehicle_id:A` und `trip_id:4`. Wenn eine `TripUpdate` Entität hat `trip_id:4` und irgendeine `vehicle_id` anders als 4, ist dies ein Fehler.                                                                                                                                       |
| `stop_time_update` | `stop_time_updates` für eine gegebene `trip_id` sollte streng geordnet sein, indem die Anzahl der `stop_sequence` und keine `stop_sequence` sollte wiederholt werden.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|                    | Während der Fahrt sollten alle `TripUpdates` sollten mindestens eine `stop_time_update` mit einer voraussichtlichen Ankunfts- oder Abfahrtszeit in der Zukunft enthalten. Beachten Sie, dass die [ Realtime ](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates) besagt, dass die Hersteller keine vergangenen `StopTimeUpdate` nicht verwerfen sollen, wenn es sich auf eine Haltestelle mit einer geplanten Ankunftszeit in der Zukunft für die gegebene Fahrt bezieht (d. h. das Fahrzeug hat die Haltestelle vor dem Schedule passiert), da sonst der Schluss gezogen wird, dass es für diese Haltestelle keine Aktualisierung gibt. |
| `timestamp`        | sollte den Zeitpunkt wiedergeben, zu dem diese Vorhersage für diese Fahrt aktualisiert wurde.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `delay`            | `TripUpdate.delay` sollte die Schedule darstellen, d. h. den in der Vergangenheit beobachteten Wert dafür, wie weit vor/nach dem Schedule das Fahrzeug liegt. Vorhersagen für zukünftige Halte sollten durch `StopTimeEvent.delay` oder `StopTimeEvent.time`.                                                                                                                                                                                                                                                                                                                                                                                                                                |

### TripDescriptor

Wenn getrennte `VehiclePosition-` und `TripUpdate-Feeds` bereitgestellt werden, sollten die Wertepaare [TripDescriptor](#TripDescriptor) und [VehicleDescriptor](#VehicleDescriptor) ID zwischen den beiden Feeds übereinstimmen.

Ein Beispiel: Eine `VehiclePosition-Entität` hat `vehicle_id:A` und `trip_id`:4, dann sollte die entsprechende `TripUpdate-Entität` ebenfalls `vehicle_id:A` und `trip_id`:4 haben.

| Feldname                | Empfehlung                                                                                                        |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `schedule_relationship` | Das Verhalten von `ADDED` Trips ist nicht spezifiziert und die Verwendung dieser Aufzählung wird nicht empfohlen. |

### FahrzeugDeskriptor

Wenn separate `VehiclePosition-` und `TripUpdate-Feeds` zur Verfügung gestellt werden, sollten die [TripDescriptor-](#TripDescriptor) und [VehicleDescriptor-ID-Werte](#VehicleDescriptor) zwischen den beiden Feeds übereinstimmen.

Zum Beispiel, eine `VehiclePosition` Entität hat `vehicle_id:A` und `trip_id`:4, dann sollte die entsprechende `TripUpdate` Entität auch `vehicle_id:A` und `trip_id`:4 haben.

| Feldname | Empfehlung                                                                          |
| -------- | ----------------------------------------------------------------------------------- |
| `id`     | Sollte ein Fahrzeug über die gesamte Fahrtdauer eindeutig und stabil identifizieren |

### StopTimeUpdate

| Feldname        | Empfehlung                                                                                                                                                                                                                                                                                 |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `stop_sequence` | Geben Sie `stop_sequence` an, wann immer dies möglich ist, da es sich eindeutig in eine GTFS auflöst `stop_times.txt` im Gegensatz zu `stop_id`die mehr als einmal während einer Fahrt auftreten können (z. B. Schleifenfahrt).                                                            |
| `arrival`       | Die Ankunftszeiten zwischen aufeinanderfolgenden Haltestellen sollten sich verlängern - sie sollten nicht gleich bleiben oder sich verringern.                                                                                                                                             |
|                 | Ankunft `time` (angegeben in [StopTimeEvent](#StopTimeEvent)) sollte vor der Abfahrt liegen `time` für dieselbe Haltestelle liegen, wenn eine Zwischenlandung oder Verweildauer zu erwarten ist - andernfalls sollte die Ankunft `time` mit der Abfahrtszeit identisch sein. `time`.       |
| `departure`     | Die Abfahrtszeiten zwischen aufeinanderfolgenden Haltestellen sollten sich verlängern - sie sollten nicht gleich bleiben oder sich verringern.                                                                                                                                             |
|                 | Die Abfahrtszeit `time` (angegeben in [StopTimeEvent](#StopTimeEvent)) sollte die gleiche sein wie die Ankunft `time` für dieselbe Haltestelle sein, wenn keine Zwischenlandung oder Verweildauer zu erwarten ist - andernfalls sollte die Abfahrt `time` nach der Ankunft liegen `time` . |

### StopTimeEvent

| Feldname | Empfehlung                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `delay`  | Wenn nur `delay` vorgesehen ist in einer `stop_time_update` `arrival` oder `departure` (und nicht `time`), dann sollte das GTFS [`stop_times.txt`](https://gtfs.org/reference/static#stopstxt) enthalten sollte `arrival_times` und/oder `departure_times` für diese entsprechenden Haltestellen enthalten. A `delay` Wert im Realtime ist bedeutungslos, wenn Sie keine Uhrzeit haben, zu der Sie ihn im GTFS hinzufügen können. `stop_times.txt` Datei. |

### FahrzeugPosition

Nachfolgend sind die empfohlenen Felder aufgeführt, die in einem VehiclePostions-Feed enthalten sein sollten, um den Verbrauchern qualitativ hochwertige Daten zu liefern (z. B. für die Erstellung von Vorhersagen)

| Name des Feldes      | Anmerkungen                                                                                                                                                                                                                                                                                                                 |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity.id`          | Sollte über die gesamte Fahrtdauer stabil gehalten werden                                                                                                                                                                                                                                                                   |
| `vehicle.timestamp`  | Die Angabe des Zeitstempels, zu dem die Fahrzeugposition gemessen wurde, wird dringend empfohlen. Andernfalls müssen die Verbraucher den Zeitstempel der Nachricht verwenden, was zu irreführenden Ergebnissen für Fahrer führen kann, wenn die letzte Nachricht häufiger aktualisiert wurde als die individuelle Position. |
| `vehicle.vehicle.id` | Sollte ein Fahrzeug über die gesamte Fahrtdauer hinweg eindeutig und stabil identifizieren                                                                                                                                                                                                                                  |

### Standort

Die Fahrzeugposition sollte innerhalb von 200 Metern der GTFS `shapes.txt` für die aktuelle Fahrt liegen, es sei denn, es liegt eine Ausschreibung mit der Wirkung `DETOUR` für diese `trip_id` vor.

### Warnung

Allgemeine Richtlinien für Ausschreibungen:

* Wenn `trip_id` und `start_time` innerhalb des Intervalls `exact_time=1` liegen, sollte `start_time` um ein genaues Vielfaches von `headway_secs` nach dem Beginn des Intervalls liegen.
* Wenn Fahrten über mehrere Tage storniert werden, sollten die Hersteller TripUpdates bereitstellen, die sich auf die angegebenen `trip_ids` und `start_dates` als `CANCELED` beziehen, sowie eine Warnung mit `NO_SERVICE`, die sich auf dieselben `trip_ids` und `TimeRange` bezieht und den Fahrern angezeigt werden kann, um die Stornierung zu erklären (z. B. Umleitung).
* Wenn eine Meldung alle Haltestellen einer Linie betrifft, verwenden Sie eine streckenbezogene Meldung anstelle einer haltestellenbezogenen Meldung. Wenden Sie die Meldung nicht auf jede Haltestelle der Linie an.
* Es gibt zwar keine Zeichenbeschränkung für Servicewarnungen, aber die Fahrgäste werden die Warnmeldungen häufig auf mobilen Geräten lesen. Bitte fassen Sie sich kurz.

| Feldname           | Empfehlung                                                                      |
| ------------------ | ------------------------------------------------------------------------------- |
| `description_text` | Verwenden Sie Zeilenumbrüche, um Ihre Servicewarnung leichter lesbar zu machen. |

## Empfehlungen für die Praxis, geordnet nach Anwendungsfall

### Frequenzbasierte Fahrten

Eine frequenzbasierte Fahrt folgt keinem festen Schedule, sondern versucht, vorgegebene Fahrzeiten einzuhalten. Diese Fahrten werden in der [GTFS.org/reference/static/#frequenciestxt">GTFS](<https://\<glossary variable=>) frequency.txt durch die Einstellung `exact_times=0` oder das Weglassen des `exact_times-Feldes` gekennzeichnet (beachten Sie, dass Fahrten mit `exact_times=1` *KEINE* frequenzbasierten Fahrten sind - `frequencies.txt` mit `exact_times=1` wird einfach als praktische Methode zum Speichern von Schedule Fahrten in einer kompakteren Weise verwendet). Bei der Erstellung von Realtime für frequenzbasierte Fahrten sind einige bewährte Verfahren zu beachten.

* In [TripUpdate.StopTimeUpdate](#StopTimeUpdate) sollte das [StopTimeEvent](#StopTimeEvent) für `Ankunft` und `Abfahrt` keine `Verspätung` enthalten, da fahrplanmäßige Fahrten keinem festen Schedule folgen. Stattdessen sollte die `Zeit` angegeben werden, um Ankunfts-/Abfahrtsprognosen zu erstellen.

* Wie in der Spezifikation gefordert, müssen bei der Beschreibung von `Fahrten` in [TripUpdate](#TripUpdate) oder [VehiclePosition](#VehiclePosition) unter Verwendung von [TripDescriptor](#TripDescriptor) alle Angaben zu `trip_id`, `start_time` und `start_date` gemacht werden. Außerdem sollte `schedule_relationship` `UNSCHEDULED` sein.

(z. B. Verstärkungsfahrten).

## Über dieses Dokument

### Ziele

Die Ziele der Pflege der GTFS Realtime Best Practices sind:

* Verbesserung der Kundenerfahrung der Endnutzer bei Anwendungen für den öffentlichen Verkehr
* Erleichterung der Bereitstellung und Skalierung von Anwendungen, Produkten und Dienstleistungen für Softwareentwickler

### Wie man veröffentlichte GTFS Realtime Best Practices vorschlägt oder ändert

GTFS und -Praktiken entwickeln sich weiter, so dass dieses Dokument möglicherweise von Zeit zu Zeit geändert werden muss. Um eine Änderung dieses Dokuments vorzuschlagen, öffnen Sie einen Pull-Request [im GitHub-Repository GTFS](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) [GTFS](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) [GTFS](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) [Realtime](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) Best Practices und befürworten Sie die Änderung.

### Verlinkung auf dieses Dokument

Bitte verlinken Sie hier, um Futtermittelherstellern eine Anleitung für die korrekte Erstellung von Realtime zu geben. Jede einzelne Empfehlung hat einen Anker-Link. Klicken Sie auf die Empfehlung, um die URL für den seiteninternen Ankerlink zu erhalten.

Wenn eine Realtime Anforderungen oder Empfehlungen für Realtime stellt, die hier nicht beschrieben sind, wird empfohlen, ein Dokument mit diesen Anforderungen oder Empfehlungen zu veröffentlichen, um diese allgemeinen Best Practices zu ergänzen.
