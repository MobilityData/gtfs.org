---
search:
  exclude: true
---

# Fares V1

<hr/>

Fares V1, bestehend aus [fare_attributes.txt](../../reference/#fare_attributestxt) und [fare_rules.txt](../../reference/#fare_rulestxt), ist seit jeher die offizielle Methode zur Beschreibung von Tarifinformationen in GTFS. Die beiden Dateien sind jedoch in der Breite der Faktoren, die sie effizient beschreiben können, begrenzt, und ihre Implementierung ist nicht eindeutig. [Fares V2](../../examples/fares-v2/) ist ein Erweiterungsprojekt, das sich in aktiver Entwicklung befindet und darauf abzielt, die Einschränkungen von Fares V1 zu beseitigen.

## Definieren Sie die Tarifregeln einer Agentur

Eine Fahrt im U-Bahn-Netz der Toronto Transit Commission kostet 3,20 CAD, wenn die Fahrgäste mit der PRESTO-Karte bezahlen. Die Fahrgäste können innerhalb eines Zeitfensters von zwei Stunden auch auf andere U-Bahn-, Straßenbahn- oder Buslinien der TTC umsteigen.

Dieser Dienst kann durch die Dateien [fare_attributes.txt](../../reference/#fare_attributestxt), [fare_rules.txt](../../reference/#fare_rulestxt) und [transfers.txt](../../reference/#transferstxt) dargestellt werden. Die erste Datei, [fare_attributes.txt](../../reference/#fare_attributestxt), beschreibt die Tarife der Agentur, unten ist ein Beispiel für den presto-Tarif:

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- Der Fahrpreis ist unter price and `currency_type` angegeben.
- Die Fahrgäste müssen ihren Fahrpreis vor dem Einsteigen in die U-Bahn an den Fahrkartenschaltern der Station bezahlen. Dies wird durch `payment_method=1` dargestellt.
- Das Feld transfers wird leer gelassen, um unbegrenzte Transfers darzustellen
- Das Feld `transfer_duration` entspricht dem 2-Stunden-Transferfenster (in Sekunden)

Die zweite Datei, [fare_rules.txt](../../reference/#fare_rulestxt), ordnet die Fahrpreise den Fahrten zu, indem sie einen Fahrpreis an eine Strecke sowie an einen Start- und Zielort auf dieser Strecke bindet.

Zu diesem Zweck werden unten in [routes.txt](../../reference/#routestxt) zwei U-Bahn-Linien definiert:

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

In diesem Beispiel werden die Transfers an der Station Bloor-Yonge modelliert. Die erste ist die Bloor Station, die von der Linie 1 bedient wird, und die zweite ist die Yonge Station, die von der Linie 2 bedient wird. Beide haben `zone_id=ttc_subway_stations`, um alle U-Bahn-Stationen in einer einzigen Tarifzone zusammenzufassen.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

In [fare_rules.txt](../../reference/#fare_rulestxt) wird der PRESTO-Tarif sowohl mit den U-Bahn-Linien als auch mit den Bahnhöfen über die folgenden Beziehungen verknüpft:

- Für `fare_id=presto_fare` können die Fahrgäste zwischen zwei beliebigen Stationen der Linie 1`(route_id=line1`) und `origin_id=ttc_subway_stations` und `destination_id=ttc_subway_stations` fahren.

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

Die dritte Datei, [transfers.txt](../../reference/#transferstxt), definiert Umsteigepunkte zwischen verschiedenen Linien. Um die Umsteigepunkte an der Station Bloor-Yonge zu modellieren, sind zwei Einträge erforderlich:

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- Die erste modelliert das Umsteigen von Linie 1 auf Linie 2 mit `from_route_id` und `to_route_id` von der Station Bloor zur Station Yonge
- Die zweite modelliert Umsteigevorgänge von der Linie 2 zur Linie 1 unter Verwendung von `from_route_id` und `to_route_id` von der Station Yonge zur Station Bloor
- Der Wert für `transfer_type` ist `0`, da es keine besonderen Anforderungen oder Überlegungen für Transfers gibt.

[Beispiel Quelle](https://www.ttc.ca/Fares-and-passes)
