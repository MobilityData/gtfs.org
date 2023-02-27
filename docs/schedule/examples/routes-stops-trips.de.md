---
search:
  exclude: true
---

# Routen, Haltestellen und Fahrten

<hr/>

## Fahrtrouten

Routen sind das Herzstück des Linienverkehrs, da sie die geografische Reichweite eines Verkehrsnetzes beschreiben. In GTFS ist die Definition von Routen der erste Schritt zur Beschreibung des Betriebs eines Verkehrsunternehmens.

Der erste Schritt ist das Hinzufügen der Agenturinformationen, wie in der Datei [agency.txt](../../reference/#agencytxt) unten gezeigt. Diese Datei enthält allgemeine Informationen über die Agentur.

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
    CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000

Calgary Transit betreibt LRT, BRT, regulären Busverkehr, Paratransit und Transit auf Abruf in Calgary, AB. In diesem Beispiel werden zwei Routen definiert, die erste ist ein Bus und die zweite ein LRT. In der Datei [routes.txt](../../reference/#routestxt) wird jeder Strecke eine eindeutige id, ein Kurzname und ein langer Name zur besseren Lesbarkeit zugewiesen.

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
    CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
    CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff

Das fünfte Feld (`route_type`) wird verwendet, um die verschiedenen Arten von Linien zu unterscheiden:

- Die erste ist ein Bus, daher `route_type=3`
- Die zweite ist eine Stadtbahn, daher `route_type=0`
- Eine vollständige Liste der Werte für `route_type` finden Sie [hier](../../reference/#routestxt)

Die verbleibenden Felder enthalten zusätzliche Informationen, wie z. B. eine streckenspezifische url sowie agentur-spezifische Farben zur Darstellung des Dienstes auf einer Karte.

<hr/>

## Haltestellen

In GTFS werden Haltestellen und Bahnhöfe mit Hilfe der Datei [stops.txt](../../reference/#stopstxt) beschrieben. Im ersten Datensatz wird eine Bushaltestelle und im zweiten Datensatz eine Stadtbahnhaltestelle definiert.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
    8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
    6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,0

- `stop_id` ist ein eindeutiger Bezeichner
- `stop_code` und `stop_name` enthalten in der Regel fahrerbezogene Informationen
- Der genaue Standort wird anhand von Koordinaten (`stop_lat` und `stop_lon`) angegeben.
- Das sechste Feld (`location_type`) dient der Unterscheidung zwischen Haltestellen und Bahnhöfen
- Der erste Datensatz entspricht einer Bushaltestelle, also `location_type=0`
- Der zweite Datensatz entspricht einer Haltestelle, also `location_type=1`
- Eine vollständige Liste der Werte für `location_type` finden Sie [hier](../../reference/stopstxt)

<hr/>

## Fahrten

Nachdem die Routen der Agentur beschrieben wurden, können nun die Fahrten beschrieben werden, die von jeder Route bedient werden.

Zunächst muss die Bedienungszeit mit [calendar.txt](../../reference/#calendartxt) definiert werden.

[**calendar.txt**](../../reference/#calendartxt)

    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    weekend_service,0,0,0,0,0,1,1,20220623,20220903

Hier wird ein Dienst beschrieben, der nur samstags und sonntags verkehrt. Daher werden die Felder für diese Tage mit 1 und die Felder für die übrigen Tage mit Null gefüllt. Dieser Dienst läuft vom 23. Juni 2022 bis zum 3. September 2022, wie in den Feldern `start_date` und `end_date` angegeben.

In diesem Beispiel beschreibt die Datei [trips.txt](../../reference/#tripstxt) 3 Wochenendfahrten, die von der oben beschriebenen MAX Orange Route bedient werden.

[**trips.txt**](../../reference/#tripstxt)

    route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
    303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
    303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
    303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027

- Die `route_id` aus [routes.txt](../../reference/#routestxt), die MAX Orange entspricht, wird aufgeführt
- Die `service_id` aus [calendar.txt](../../reference/#calendartxt), die den Wochenenden entspricht, wird aufgelistet
- Jeder Datensatz enthält eine eindeutige id für jede trip Der text des Fahrtziels wird angegeben, der normalerweise auf Schildern innerhalb und außerhalb des Busses angezeigt wird.

- Das Feld `direction_id` ermöglicht eine Unterscheidung zwischen Fahrten auf derselben Strecke in unterschiedliche Richtungen. So kann z. B. zwischen Fahrten in Richtung Hinfahrt und in Richtung Rückfahrt unterschieden werden - oder zwischen Fahrten in Richtung Süden und in Richtung Norden.
- In diesem Fall haben Fahrten in Richtung Saddletowne eine `direction_id=0` und Fahrten in Richtung Brentwood eine `direction_id=1`. Die Werte in direction_id haben keine inhärente Bedeutung, sie werden nur verwendet, um eine Fahrtrichtung einer anderen zuzuordnen.
- Die `shape_id` aus [shapes.txt](../../reference/#shapestxt), die der MAX Orange-Strecke in Richtung Saddletowne entspricht, wird für den ersten Datensatz aufgelistet und diejenige für die MAX Orange-Strecke in Richtung Brentwood für den zweiten und dritten Datensatz

Die `shape_id=3030026` entspricht dem MAX Orange in Richtung Saddletowne. Die nachstehende Datei enthält Informationen zu den Punkten, die die Route umreißen, sowie die Entfernung zwischen diesen Punkten. Mit diesen Informationen ist es möglich, die Route auf einer Karte für die trip oder zu Analysezwecken darzustellen.

[**shapes.txt**](../../reference/#shapestxt)

    shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
    3030026,51.086506,-114.132259,10001,0.000
    3030026,51.086558,-114.132371,10002,0.010
    3030026,51.086781,-114.132865,10003,0.052
    3030026,51.086938,-114.133179,10004,0.080
    3030026,51.086953,-114.133205,10005,0.083
    3030026,51.086968,-114.133224,10006,0.085
    3030026,51.086992,-114.133249,10007,0.088
    3030026,51.087029,-114.133275,10008,0.093
    3030026,51.087057,-114.133286,10009,0.096
    3030026,51.087278,-114.133356,10010,0.121
    3030026,51.087036,-114.132864,10011,0.165
    3030026,51.086990,-114.132766,10012,0.173
    3030026,51.086937,-114.132663,10013,0.183

<hr/>

## Ausnahmen vom Dienst

Es ist möglich, Ausnahmen für den Service zu definieren, wie z.B. zusätzliche Servicetage (spezielle Tage) oder entfernte Servicetage (z.B. kein Service an Feiertagen).

Wenn zum Beispiel am Sonntag, dem 17. Juli 2022, kein planmäßiger Dienst stattfindet, kann dieses Datum aus `weekend_service` in [calendar.txt](../../reference/#calendartxt) entfernt werden, indem der Service in zwei Datensätze aufgeteilt wird:

| Dienst             | Start      | Ende       |
| ------------------ |------------|------------|
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

Dies macht die Datei jedoch komplizierter, da `service_id` in zwei Teile zerlegt wird und diese Zerlegung sich auf [trips.txt](../../reference/#tripstxt) auswirkt. Stattdessen kann dies auf einfachere Weise mit [calendar_dates.txt](../../reference/#calendar_datestxt) geschehen, wie unten gezeigt:

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

    service_id,date,exception_type
    weekend_service,20220623,2

- Die `service_id` `weekend_service` wird aufgelistet
- Das Datum des gestrichenen oder zusätzlicher Dienst ist unter `date` aufgeführt (17. Juli 2022)
- Das Feld `exception_type` ist auf 2 gesetzt, was bedeutet, dass der Dienst für diesen Tag aufgehoben ist.

[Beispiel Quelle](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)
