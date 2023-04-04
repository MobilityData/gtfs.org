# Fares V2

<hr/>

Fares V2 ist ein GTFS, das darauf abzielt, die Einschränkungen von Fares V1 zu beseitigen. Dieses Erweiterungsprojekt wird in mehreren Iterationen umgesetzt. Die folgenden Beispiele zeigen, wie grundlegende Konzepte modelliert werden können, einschließlich Tarifprodukten und wie Fahrgäste ihren Fahrpreis für Transfers verwenden können. Weitere Informationen über [das Fares V2 Erweiterungsprojekt finden Sie hier](/extensions/fares-v2/).

In der Zwischenzeit können die Hersteller Fares V2 neben Fares V1 im selben Datensatz implementieren, da es keinen technischen Konflikt zwischen den beiden gibt. Die Verbraucher haben die Wahl, welche Implementierung sie unabhängig von der anderen konsumieren möchten. Wenn Fares V2 angenommen und ausreichend unterstützt wird, kann Fares V1 in Zukunft veraltet sein.

## Definieren Sie einen Fahrpreis

Es gibt mehrere Möglichkeiten, Fahrpreise für die Nutzung des Maryland Transit Administration Systems zu bezahlen. <a href="https://www.mta.maryland.gov/regular-fares" target="_blank">Es gibt vier Arten von regulären Fahrpreisen zum voll Preis:</a>

- Einfacher Fahrschein zum Preis von 2,00 USD
- Tageskarte, die 4,60 USD kostet
- Wochenkarte zum Preis von 22 USD
- Monatskarte zum Preis von 77 USD

Fahrscheine oder Fahrpreise werden in GTFS als Tarifprodukte bezeichnet. Sie können mithilfe der Datei [fare_products.txt](../../reference/#fare_productstxt) beschrieben werden. Jeder Eintrag entspricht einem bestimmten Fahrpreis.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id         | fare_product_name              | amount  | currency |
| ----------------------- | ------------------------------ | ------ |----------|
| core_local_oneway_fare | One Way Full Fare                         | 2.00   | USD      |
| core_local_1_day_fare  | 1-Day Pass - Core Service     | 4.60   | USD      |
| core_local_31_day_fare  | 31-Day Pass - Core Service | 77.00  | USD      |
| core_local_7_day_fare   | 7-Day Pass - Core Service  | 22.00  | USD      |

<sup>[GTFS für Nahverkehrsbusse der Maryland Transit Administration herunterladen](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Erstellen Sie Regeln für Einzelfahrten

In GTFS entspricht ein Tarifabschnitt einer Fahrt, die ein Fahrgast unternimmt, ohne zwischen verschiedenen Verkehrsmitteln, Strecken, Netzen oder Agenturen umzusteigen. Bei der Maryland Transit Administration ermöglicht ein einziger Fahrpreis die Fahrt innerhalb eines beliebigen Paares von Haltestellen und U-Bahn-Stationen innerhalb des `core` der BaltimoreLink-Busse, Light RailLink und Metro SubwayLink-Strecken.

Streckengruppen definieren Fahrten innerhalb eines Netzes von einem Ausgangsort zu einem Zielort (oder von einer Gruppe von Ausgangsorten zu einer Gruppe von Zielorten, wenn die Gebietskennungen gruppierten Haltestellen entsprechen). Die folgende Datei beschreibt Regeln für Fahrten innerhalb des Kernnetzes der Maryland Transit Administration. Jede Regel entspricht einem der regulären Tarifprodukte im ["Beispiel Definieren Sie einen Transit-Tarif"](#definieren-sie-einen-fahrpreis).

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id            | network_id | fare_product_id         |
| ----------------------- | ---------- | ----------------------- |
| core_local_one_way_trip | core       | core_local_oneway_fare |
| core_local_one_way_trip | core       | core_local_1_day_fare  |
| core_local_one_way_trip | core       | core_local_31_day_fare  |
| core_local_one_way_trip | core       | core_local_7_day_fare   |

<sup>[GTFS für Nahverkehrsbusse der Maryland Transit Administration herunterladen](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Regeln für Transfers erstellen

Es gibt einen 90-minütigen Umsteigevorgang für Fahrgäste, die einen Einwegfahrschein für BaltimoreLink-Lokalbusse, Metro SubwayLink oder Light RailLink kaufen. Das bedeutet, dass sie innerhalb des 90-Minuten-Zeitfensters unbegrenzt oft zwischen den lokalen Bussen, der U-Bahn und der Stadtbahn umsteigen können.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id       | to_leg_group_id         | duration_limit | duration_limit_type | fare_transfer_type | transfer_count |
| ----------------------- | ----------------------- | -------------- | ------------------- | ----------------------- | -------------- |
| core_local_one_way_trip | core_local_one_way_trip | 5400           | 1                   | 0                       | -1             |

Die obige Datei stellt dies in GTFS mit den folgenden Feldern dar:

- Ein Transfer ist von und zu Strecken möglich, die eine einfache Fahrt sind`(core_local_one_way_trip`)
- `transfer_count` ist auf `-1` gesetzt, da es keine Begrenzung für die Anzahl der zulässigen Überweisungen gibt
- Das `duration_limit` ist auf `5400` Sekunden gesetzt, was 90 Minuten entspricht.
- Der `duration_limit_type` ist auf `1` gesetzt, da die Umsteigezeit beginnt, wenn der Fahrer eine beliebige Strecke in der Tarifzone `core_local_one_way_trip` fährt und endet, wenn er eine andere Tarifzone verlässt.
- `fare_transfer_type` ist auf `0` gesetzt, da die Fahrgäste nur für den ersten Fahrpreis zahlen. Für das Umsteigen innerhalb des 90-Minuten-Fensters wird keine Umsteigegebühr oder ein zweiter Fahrpreis erhoben. Daher können die Kosten als die Summe des ersten Fahrpreises und der Summen der Umsteigegebühren modelliert werden.
- Der `transfer_count` wird auf `-1` gesetzt, da der Fahrer innerhalb des `duration_limit` beliebig oft umsteigen kann.

Nach der Definition des Fahrpreises, der Erstellung der entsprechenden `fare_leg_rule` und der Definition der `fare_transfer_rule` wird der Fahrpreis von 2,00 USD `core_local_oneway_fare` in der Fahrplanauskunft angezeigt. Hier ist ein Beispiel aus Transit:

<div class="flex-photos">
    <img src="../../../assets/transit-fares-mdot.png" alt="fare of $2 USD">
</div>

<sup>[GTFS für Nahverkehrsbusse der Maryland Transit Administration herunterladen](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

## Beschreiben Sie Dienstorte in derselben Tarifzone

Einige Verkehrsbetriebe verwenden eine zonenbasierte Tarifstruktur. Tarifzonen sind unterteilte geografische Gebiete, die mit unterschiedlichen Fahrpreisen verbunden sind. Im BART-System der Bay Area sind die Fahrpreise je nach Ausgangs- und Zielort unterschiedlich [(BART-Tarifunterschiede)](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf), und die Fahrgäste müssen den richtigen Tarif kennen. Tarifgebiete können mit der Datei [stops_areas.txt](../../reference/#stops_areastxt) beschrieben werden, die Haltestellen aus [stops.txt](../../reference/#stopstxt) zu [areas.txt](../../reference/#areastxt) zuordnet.

Zunächst ist das Gebiet in [areas.txt](../../reference/#areastxt) zu identifizieren. Es ist zulässig, `area_name` leer zu lassen, wenn es keinen Gebietsnamen gibt. In der folgenden Tabelle gibt es drei `area_id` - `ASHB`, `GLEN` und `OAKL`.

[**areas.txt**](../../reference/#areastxt)

| area_id | area_name |
| ------- | ----------- |
| ASHB    |             |
| GLEN    |             |
| OAKL    |             |

Anschließend werden die Haltestellen unter Verwendung der `stop_id` aus der Datei [stops.txt](../../reference/#stopstxt) zu dem jeweils identifizierten Bereich (Tarifzone) zusammengefasst.

Als nächstes gruppieren Sie `stop_id` zu jeder `area_id`. Im BART-Beispiel enthält jeder Bereich nur 1 `stop_id`. Zum Beispiel ist nur die Haltestelle `ASHB` (Ashby Station) im Bereich `ASHB` enthalten. Wenn ein Bereich jedoch mehrere Haltestellen umfasst, sollten mehrere `stop_id` aufgeführt werden.

[**stops_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
| ------- | ------- |
| ASHB    | ASHB    |
| GLEN    | GLEN    |
| OAKL    | OAKL    |

In `fare_leg_rules.txt` können verschiedene Tarifprodukte auf der Grundlage verschiedener Abfahrts- und Ankunftsbereiche identifiziert werden. Der erste Eintrag zeigt zum Beispiel:

- Abfahrtsbereich ist `ASHB`
- Ankunftsgebiet ist `GLEN`
- Das Tarifprodukt für den Abflug-/Ankunftsbereich ist `BA:matrix:ASHB-GLEN`

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id | to_area_id | fare_product_id     |
| ------------ | ------------ | ---------- | ------------------- |
| BA           | ASHB         | GLEN       | BA:matrix:ASHB-GLEN |
| BA           | ASKB         | OAKL       | BA:matrix:ASHB-OAKL |

Der Tarif ist in `fare_products.txt` angegeben.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name | amount | currency |
| ------------------- | ------------------ |--------|----------|
| BA:matrix:ASHB-GLEN | generated         | 4.75   | USD      |
| BA:matrix:ASHB-OAKL | generated          | 9.45   | USD      |

<sup><a href="https://511.org/open-data/transit" target="_blank">Siehe den San Francisco Bay Area Regional Feed</a></sup>

<hr/>

## Beschreiben Sie, welche Zahlungsmittel akzeptiert werden

San Francisco Muni-Fahrgäste können verschiedene Arten von Zahlungsmitteln verwenden, um ihre Fahrt zu bezahlen und ihren Fahrpreis zu entwerten:

- Verwenden Sie eine <a href="https://www.clippercard.com/ClipperWeb/" target="_blank">Clipper-Karte</a>, die Nahverkehrskarte der Bay Area
- Verwenden Sie die <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">Munimobile-App</a>
- Bezahlen Sie den Fahrpreis in bar

Diese Validierungsmethoden werden in GTFSFares V2 als `fare_media` bezeichnet und können mit `fare_media.txt` beschrieben werden.

Nachfolgend finden Sie einen Beispielausschnitt aus dem <a href="https://511.org/open-data/transit" target="_blank">regionalen Feed für die San Francisco Bay Area</a>, auf den mit der 511 SF Bay API zugegriffen werden kann.

`Clipper` wird als eine physische Transitkarte mit `fare_media_type=2` beschrieben. `SFMTA Munimobile` wird als eine mobile App mit `fare_media_type=2` beschrieben. `Cash` hat kein Fahrgeldmedium, da es ohne Fahrschein direkt an den Fahrer ausgegeben wird. Daher hat `Cash` den `fare_media_type=0`.

Hersteller, die einen physischen Fahrschein als Fahrpreis-Medientyp beschreiben möchten, können die experimentelle Option `fare_media_type=1` verwenden, die im <a href="https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd" target="_blank">Vorschlag voll Fares V2</a> enthalten ist.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
| ------------------- |------------------| -------------------- |
| clipper             | Clipper          | 2                    |
| munimobile          | SFMTA MuniMobile | 4                    |
| cash                | Cash             | 0                    |

<sup><a href="https://511.org/open-data/transit" target="_blank">Siehe den San Francisco Bay Area Regional Feed</a></sup>

## Preisunterschiede auf Basis von Tarifmedien definieren

Der Fahrpreis der Muni unterscheidet sich je nach dem vom Fahrgast verwendeten Tarifmedium. In diesem Beispiel wird erläutert, wie sich der Preis für den lokalen Erwachsenentarif ändert, wenn Bargeld oder eine Clipper-Karte verwendet wird. Ein mit Bargeld bezahlter Erwachsenentarif kostet 3 USD, während derselbe Tarif mit der Clipper-Karte 2,50 kostet , also 50 Cent weniger.

Jeder Eintrag unten beschreibt ein Tarifmedium.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name | fare_media_type |
| ------------------- |-----------------| -------------------- |
| clipper             | Clipper         | 2                    |
| cash                 | Cash               | 0                    |

Der folgende Ausschnitt aus der Datei `fare_products.txt` zeigt, wie der Betrag des `Muni single local fare` verkehr je nach dem vom Fahrgast benutzten Fahrscheinmedium variiert.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name      | amount | currency | fare_media_id |
| --------------- |------------------------| ------ | ------- |---------------------|
| SF:local:single | Muni single local fare | 3      | USD     | cash                |
| SF:local:single | v                      | 2.5    | USD     | clipper             |

In Apple Maps können Fahrgäste sehen, wie sich ihr Fahrpreis ändert. Sie können die Fahrpreise unter der Anweisung "Board the Muni J Church train" vergleichen:

<div class="flex-photos">
    <img src="../../../assets/apple-muni-cash.jpg" alt="cash fare of $3 USD">
    <img src="../../../assets/apple-muni-clipper.jpg" alt="Clipper card fare of $2.50 USD">
</div>

<sup><a href="https://511.org/open-data/transit" target="_blank">Siehe den San Francisco Bay Area Regional Feed</a></sup>

## Beschreiben Sie eine Option für kontaktlose Zahlungsmittel

[Der Clean Air Express im nördlichen Santa Barbara County akzeptiert die kontaktlose Bezahlung](https://vimeo.com/539436401) mit Kreditkarte, Google Pay und Apple Pay.

Im Clean Air Express-Feed gibt es ein `tap_to_ride` Tarifmedium mit `fare_media_type=3`, da es sich um eine cEMV-Option (kontaktlose Europay, Mastercard und Visa) handelt.

| fare_media_id | fare_media_name | fare_media_type |
| ------------------- | ---------------- | -------------------- |
| tap_to_ride         | Tap to Ride      | 3                    |

Das unten gezeigte Produkt für eine Einzelfahrt hat sowohl `cash` als auch `tap-to-ride`. Wenn die Einzelfahrt mit dem `tap-to-ride` bezahlt wird, ist sie um einen US-Dollar günstiger.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | fare_media_id | amount | currency |
| --------------- | ------------------ | ------------------- | ------ |----------|
| single-ride     | Single Ride        | tap_to_ride         | 6      | USD      |
| single-ride    | Single Ride       |                     | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">Laden Sie den Clean Air Express-Feed herunter</a></sup>
