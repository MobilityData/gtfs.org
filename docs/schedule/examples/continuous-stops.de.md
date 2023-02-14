---
search:
  exclude: true
---

# Kontinuierliche Haltestellen

<hr/>

## Überall einsteigen und aussteigen

Das Verkehrsunternehmen The Current (Rockingham, US-VT) wendet auf den Linien 2, 53 und 55 eine kontinuierliche Haltestellenpolitik an. Ein Fahrgast kann zwischen geplante Haltestellen auf der gesamten Strecke aufgenommen und abgesetzt werden, solange der Bus an einer sicheren Stelle halten kann.

Die Datei [routes.txt](../../reference/#routestxt) wird verwendet, um diesen Dienst mit den Feldern `continuous_pickup` und `continuous_drop_off` zu beschreiben. Die Felder werden auf `0` gesetzt, um anzuzeigen, dass kontinuierliche Abholungen und Ablieferungen erlaubt sind.

[**routes.txt**](../../reference/#routestxt)

    route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
    2,2,Bellows Falls In-Town,3,0,0
    53,53,Bellows Falls / Battleboro Commuter,3,0,0
    55,55,Bellows Falls / Springfield Shuttle,3,0,0

[Beispiel Quelle](https://crtransit.org/bus-schedules/)

<hr/>

## Abholen und Absetzen auf einem Teil der Strecke

Die Verkehrsgesellschaft Victor Valley Transit (Victorville, US-CA) wendet eine durchgehende Haltestellenpolitik nur auf einem Teil der Linie 22 an. Der Fahrgast kann an jedem sicheren Ort innerhalb der County Fare Zone ein- und aussteigen. Im Bereich des Lokaltarifs ist ein ständiges Aufnehmen und Absetzen nicht möglich.

Der Bereich des Lokaltarifs und der Bereich des Landestarifs sind durch den Air Expressway getrennt, wie in der Abbildung unten dargestellt. Die geplante National Trails Highway - Air Expressway befindet sich etwas nördlich von dieser Grenze. Um genau zu sein, kann das Verkehrsunternehmen eine Haltestelle an der tatsächlichen Kreuzung der Buslinie mit der Grenze einrichten, von der aus ein ständiges Aufnehmen und Absetzen möglich ist. Diese Haltestelle kann außerplanmäßig bleiben.

![](../../assets/victor-valley-transit.svg)

Dieser Dienst wird durch die Dateien [stops.txt](../../reference/#stopstxt) und [stop_times.txt](../../reference/#stoptimestxt) beschrieben:

- Die erste Datei definiert die Haltestellen entlang der Route
- Die zweite Datei definiert die Regeln für das kontinuierliche Abholen und Absetzen zwischen den Haltestellen.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon
    A,Victoriaville Transfer Station,34.514356,-117.318323
    B,Dante St & Venus Ave,34.564499,-117.287097
    C,Victorville Transportation Center,34.538433,-117.294703
    X,Local/County Fare Boundary,34.566224,-117.318357
    D,National Trails Highway - Air Expressway,34.567536,-117.319716
    E,Oro Grande Post Office,34.599292,-117.334452
    F,Silver Lakes Market,34.744662,-117.335407

In [stop_times.txt](../../reference/#stoptimestxt), für eine bestimmte trip:

- Ein Datensatz mit `continuous_pickup=0` bedeutet, dass kontinuierliche Abholungen von dieser Haltestelle bis zur nächsten Haltestelle erlaubt sind
- Ein Datensatz mit `continuous_pickup=1` bedeutet, dass kontinuierliche Abholungen ab dieser Haltestelle bis zur nächsten Haltestelle verboten sind.

[**stop_times.txt**](../../reference/#stoptimestxt)

    trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
    22NB9AM,A,1,09:00:00,09:00:00,1,1,1
    22NB9AM,B,2,09:14:00,09:14:00,1,1,1
    22NB9AM,C,3,09:21:00,09:21:00,1,1,1
    22NB9AM,X,4,,,0,0,0
    22NB9AM,D,5,09:25:00,09:25:00,0,0,1
    22NB9AM,E,6,09:31:00,09:31:00,0,0,1
    22NB9AM,F,7,09:46:00,09:46:00,0,0,1

Die gleiche Logik gilt für das Feld `continuous_drop_off`, jedoch für den Fall, dass es sich um einen Drop-Off handelt.

Im obigen Beispiel sind die Haltestellen A, B, C mit continuous_pickup und `continuous_drop_off` auf `1` gesetzt, was kontinuierliche Abholungen und Ausstiege zwischen ihnen verbietet. Bei den Haltestellen `X`, `D`, `E` und `F` sind die Felder `continuous_pickup` und `continuous_drop_off` auf `0` gesetzt, was kontinuierliche Abholungen und Ausstiege zwischen ihnen erlaubt.

[Beispiel für eine Quelle](https://vvta.org/routes/route-22/)
