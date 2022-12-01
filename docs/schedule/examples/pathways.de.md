---
search:
  exclude: true
---

# Laufwege

<hr/>

## Beschreiben Sie die Lage der Ein- und Ausgänge von Bahnhöfen

Mit GTFS ist es möglich, Bahnhöfe anhand von Informationen über die Eingänge und das Innere des Bahnhofs genau zu beschreiben. In diesem Beispiel werden Teile des Bahnhofs Waterfront in der Innenstadt von Vancouver beschrieben. Der Bahnhof ist Teil des Skytrain-Netzes der Stadt und wird von der Canada Line, der Expo Line, dem SeaBus und dem West Coast Express bedient. Drei Eingänge auf Straßenebene ermöglichen den Ein- und Ausstieg in den Bahnhof. Der Rest des Bahnhofs ist unterirdisch mit einer Halle für die Fahrkartenkontrolle und einer unteren Ebene mit Bahnsteigen.

Zunächst werden die Lage des Bahnhofs und seine Eingänge in [stops.txt](../../reference/#pathwaystxt) definiert:

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

In der obigen Datei bezieht sich der erste Datensatz auf den Standort des Bahnhofs, daher ist der `location_type` auf `1` gesetzt. Die anderen fünf Datensätze beziehen sich auf die drei Eingänge des Bahnhofs (fünf Datensätze sind erforderlich, da der Granville-Eingang eigentlich drei separate Eingänge hat, eine Treppe, eine Rolltreppe und einen Aufzug). Diese fünf Datensätze sind als Eingänge definiert, da der `location_type` auf `3` gesetzt ist.

Außerdem wird die `stop_id` für Waterfront Station unter `parent_station` für die Eingänge aufgeführt, um sie mit der Station zu verknüpfen. Für die zugänglichen Eingänge ist `wheelchair_boarding` auf `1` und für die nicht zugänglichen auf `2` gesetzt.

## Beschreibung der Treppen und Rolltreppen

Der Eingang der Waterfront Station in der Granville Street verfügt über einen Aufzug, eine Rolltreppe und eine Treppe; die Eingänge sind als Knoten oben in [stops.txt](../../reference/#stopstxt) definiert. Um die Eingänge mit den inneren Bereichen des Bahnhofs zu verbinden, müssen zusätzliche Knoten in [stops.txt](../../reference/#stopstxt) unter der `parent_station` von Waterfront Station erstellt werden. In der folgenden Datei [stops.txt](../../reference/#stopstxt) werden generische Knoten`(location_type 3`) definiert, die dem unteren Ende der Treppe und der Rolltreppe entsprechen.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width="700px"/>

Anschließend werden in der Datei [pathways.txt](../../reference/#pathwaystxt) Knoten miteinander verknüpft, um Pfade zu erstellen, wobei der erste Datensatz die Knoten am oberen und unteren Ende der Treppe miteinander verbindet. Der `pathway_mode` wird auf `2` gesetzt, um die Treppe zu kennzeichnen, und das letzte Feld beschreibt, dass die Passagiere die Treppe in beide Richtungen (aufwärts und abwärts) begehen können.

In ähnlicher Weise beschreibt der zweite Datensatz die Rolltreppe`(pathway_mode` auf `4` gesetzt). Da sich Rolltreppen nur in eine Richtung bewegen können, ist das Feld `is_bidirectional` auf `0` gesetzt, so dass sich die Rolltreppe nur in eine Richtung bewegt, von Knoten `96` nach `91` (nach oben).

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## Beschreiben Sie Aufzüge und Fahrwege

Der Aufzug in der Granville Street bringt die Fahrgäste zu einem Weg auf der Ebene der Bahnhofshalle, wo die Rolltreppe und die Treppe end. Der Aufzug auf der oberirdischen Ebene ist bereits als Bahnhofseingang oben definiert`stop_id` `92`). Daher muss auch die Aufzugstür in der Bahnhofshalle definiert werden.

Außerdem gibt es, wie in der Abbildung unten gezeigt, einen unterirdischen Gang, der das untere Ende der Treppe, der Rolltreppe und des Aufzugs in der Granville Street mit dem Hauptbahnhofsgebäude verbindet. Daher werden zwei zusätzliche Knotenpunkte erstellt, um die Gehwegabschnitte zu definieren.

<img class="center" src="../../../assets/pathways-2.png" width="500px"/>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width="500px"/>

Schließlich werden die Knoten miteinander verbunden, um den unterirdischen Weg zu definieren, wie in der folgenden Datei [pathways.txt](../../reference/#pathwaystxt) dargestellt:

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
