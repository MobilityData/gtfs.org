---
search:
  exclude: true
---

# Fares V2

<hr/>

Fares V2 ist ein GTFS, das darauf abzielt, die Einschränkungen von Fares V1 zu beseitigen. Dieses Erweiterungsprojekt wird in Iterationen angenommen, und die folgenden Beispiele zeigen, was mit dem Teil von Fares V2, der in die offizielle Spezifikation aufgenommen wurde, modelliert werden kann. Weitere Informationen über das Fares V2 Erweiterungsprojekt finden Sie im Abschnitt [Erweiterungen](../../../extensions).

In der Zwischenzeit können die Hersteller Fares V2 neben Fares V1 im selben Datensatz implementieren, da es keinen technischen Konflikt zwischen den beiden gibt. Die Verbraucher haben die Wahl, welche Implementierung sie unabhängig von der anderen konsumieren möchten. Wenn Fares V2 angenommen und ausreichend unterstützt wird, kann Fares V1 in Zukunft veraltet sein.

## Definieren Sie einen Fahrpreis

Für die Nutzung des TTC-Transitsystems in Toronto gibt es mehrere Möglichkeiten, Fahrpreise zu bezahlen. Die TTC bietet zwei verschiedene Fahrpreise an, je nach Zahlungsmethode. Der Fahrpreis für einen Erwachsenen beträgt 3,20 CAD bei Verwendung einer PRESTO-Karte, während derselbe Fahrpreis 3 ,25 CAD beträgt , wenn Sie bar bezahlen.

Fahrscheine oder Fahrpreise können in der Datei [fare_products.txt](../../reference/#fare_productstxt) beschrieben werden. Jeder Eintrag entspricht einem bestimmten Fahrpreis.

[**fare_products.txt**](../../reference/#fare_productstxt)

    fare_product_id,fare_product_name,amount,currency
    presto_fare,PRESTO Card Fare,3.2,CAD
    cash_fare,Cash Fare,3.25,CAD

[Beispiel Quelle](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Beschreiben Sie Dienstorte in derselben Tarifzone

Einige Verkehrsbetriebe verwenden eine zonenbasierte Tarifstruktur. Tarifzonen sind unterteilte geografische Gebiete, die mit unterschiedlichen Fahrpreisen verbunden sind. Egal, ob sie innerhalb einer Zone oder von einer Zone in eine andere fahren, müssen die Fahrgäste den richtigen Tarif kennen. Im TTC-System von Toronto gibt es nur eine Tarifzone. Fahrgäste müssen für jede trip innerhalb der Stadtgrenzen Torontos den gleichen Einzelfahrschein bezahlen, unabhängig davon, welches Verkehrsmittel sie benutzen.

Fahrpreiszonen können mit der Datei [stops_areas.txt](../../reference/#stops_areastxt) beschrieben werden, die Haltestellen aus [stops.txt](../../reference/#stopstxt) [areas.txt](../../reference/#areastxt) zuordnet.

Bestimmen Sie zunächst das Gebiet (Tarifzone).

[**areas.txt**](../../reference/#areastxt)

    area_id,area_name
    ttc_service_area,TTC Fare Zone

Anschließend werden die Haltestellen unter Verwendung der `stop_id` aus der Datei [stops.txt](../../reference/#stopstxt) zu dem jeweils identifizierten Bereich (Tarifzone) zusammengefasst.

[**stops_areas.txt**](../../reference/#stops_areastxt)

    area_id,stop_id
    ttc_service_area,262
    ttc_service_area,263
    ttc_service_area,264
    ttc_service_area,265
    ttc_service_area,266
    …

[Beispiel-Quelle](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)

<hr/>

## Erstellen Sie Regeln für Einzelfahrten

In GTFS entspricht eine Strecke einer trip, die ein Fahrgast ohne Umsteigen zwischen verschiedenen Verkehrsmitteln, Strecken, Netzen oder Agenturen zurücklegt. Ein einziger Fahrpreis ermöglicht es Fahrgästen, innerhalb eines beliebigen Paares von Bushaltestellen, U-Bahn-Stationen und Straßenbahnhaltestellen innerhalb des TTC-Netzes zu fahren.

Streckengruppen definieren Fahrten innerhalb eines Netzes von einem Startpunkt zu einem Zielpunkt (oder von einer Gruppe von Startpunkten zu einer Gruppe von Zielpunkten, wenn die Gebiets-IDs gruppierten Haltestellen entsprechen). Die folgende Datei beschreibt zwei Regeln für Fahrten innerhalb des TTC-Netzes. Die erste Regel entspricht einer Fahrt mit einem PRESTO-Tarif und die zweite einer Fahrt mit einem Bargeldtarif.

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

    leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
    ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
    ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare

[Beispiel Quelle](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Regeln für Transfers erstellen

Fahrgäste, die ihre PRESTO-Karte für die Fahrt mit der TTC verwenden, haben ein 2-stündiges, unbeschränktes Transferfenster. Das bedeutet, dass sie innerhalb dieses Zeitfensters beliebig oft zwischen den Bussen, U-Bahnen und Straßenbahnen der Agentur umsteigen können.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

    from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
    ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer

Die obige Datei stellt dies in GTFS mit den folgenden Feldern dar:

- Ein Transfer ist möglich von und zu Strecken, die mit einer PRESTO-Karte bezahlt werden`(ttc_trip_presto`)
- `transfer_count` ist auf `-1` gesetzt, da es keine Begrenzung für die Anzahl der zulässigen Überweisungen gibt
- Das `duration_limit` wird auf `7200` Sekunden gesetzt, was 2 Stunden entspricht.
- `duration_limit_type` ist auf `3` gesetzt, da die Fahrgäste ihre PRESTO-Karte abziehen müssen, sobald sie den Tarifbereich betreten oder in einen Bus oder eine Straßenbahn einsteigen. Dies entspricht der arrival für die aktuelle Strecke und der arrival für die nächste Strecke.
- Der `fare_transfer_type` ist auf `0` gesetzt, da die Fahrgäste nur für den ersten Fahrpreis zahlen. Es gibt keine Umsteigegebühr oder einen zweiten Fahrpreis für das Umsteigen innerhalb des 2-Stunden-Fensters. Daher können die Kosten als die Summe des ersten Fahrpreises und der Summen der Umsteigegebühren modelliert werden.
- Die Umsteigegebühr wird auf Null gesetzt, da sie innerhalb des TTC-Systems kostenlos ist. Dies wird durch `fare_product_id=free_transfer` angezeigt.

[Beispiel-Quelle](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)
