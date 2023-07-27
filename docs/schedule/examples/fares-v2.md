<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/fares-v2.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Fares v2

<hr>

Fares v2 is a GTFS extension project that aims to address the limitations of Fares v1. This extension project is being adopted in iterations. The below examples outline how to model basic concepts, including fare products and how riders can use their fare for transfers. See more information about [the Fares v2 extension project here](/extensions/fares-v2/).

In the interim, producers may implement Fares v2 alongside implementation of Fares v1 in the same dataset as there exists no technical conflict between the two. Consumers will have the choice on which implementation to consume independently from the other. 
With adoption and sufficient endorsement of Fares v2, Fares v1 may be deprecated in the future.

## Define a transit fare

There are several ways to pay fares to use the Maryland Transit Administration system. <a href="https://www.mta.maryland.gov/regular-fares" target="_blank">There are four types of regular full price fare options:</a>

- One-way ticket that costs $2.00 USD
- Day pass that costs $4.60 USD
- Weekly pass that costs $22 USD
- A monthly pass that costs $77 USD

Transit tickets or fares are referred to as fare products in GTFS. They can be described using the [fare_products.txt](../../reference/#fare_productstxt) file. Each entry corresponds to a specific fare.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id  | fare_product_name  | amount  | currency  |
|------------------------|--------------------|---|---|
| core_local_oneway_fare | One Way Full Fare |  2.00 | USD  |
| core_local_1_day_fare  | 1-Day Pass - Core Service  | 4.60  | USD   |
| core_local_31_day_fare | 31-Day Pass - Core Service  | 77.00  | USD  |
| core_local_7_day_fare  | 7-Day Pass - Core Service |  22.00 | USD  |


<sup>[Download the Maryland Transit Administration local bus GTFS feed](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr>

## Create rules for single leg journeys

In GTFS, a fare leg corresponds to a trip that a rider makes without transferring between different modes, routes, networks, or agencies. In the Maryland Transit Administration's feed, a single fare allows riders to travel within any pair of stops and subway stations within the `core` network of BaltimoreLink buses, Light RailLink and Metro SubwayLink routes.

Leg groups define trips within a network from an origin to a destination (or a set of origins to a set of destinations if the area IDs correspond to grouped stops). The file below describes rules to travel anywhere within the Maryland Transit Administration’s core network. Each rule corresponds to one of the regular fare products in the [Define a transit fare example](#define-a-transit-fare).

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

|  leg_group_id |  network_id | fare_product_id  |
|---|---|---|
| core_local_one_way_trip | core  |  core_local_oneway_fare |
| core_local_one_way_trip | core  |  core_local_1_day_fare |
| core_local_one_way_trip | core  |  core_local_31_day_fare |
| core_local_one_way_trip | core  |  core_local_7_day_fare |

<sup>[Download the Maryland Transit Administration local bus GTFS feed](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr>

## Create rules for transfers

There is a 90 minute transfer for riders who purchase a one-way fare to ride BaltimoreLink local buses, Metro SubwayLink, or Light RailLink. This means that they can transfer an unlimited number of times between the local buses, subway, and light rail within the 90 minute timeframe.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id       | to_leg_group_id  | duration_limit | duration_limit_type | fare_transfer_type | transfer_count |
|-------------------------|---|----------------|-------------------|---------------------|----------------|
| core_local_one_way_trip | core_local_one_way_trip  | 5400           | 1                 | 0                   | -1             |


The file above represents this in GTFS with the following fields:

- A transfer is possible to and from legs that are a one way trip (`core_local_one_way_trip`)
- The `transfer_count` is set to `-1` since there is no limit on the number of transfers permitted
- The `duration_limit` is set to `5400` seconds,  which is equivalent to 90 minutes
- The `duration_limit_type` is set to `1` since the transfer time starts when the rider departs on any route in the `core_local_one_way_trip` fare leg and ends when they depart on a different fare leg. 
- The `fare_transfer_type` is set to `0` since riders only pay for the first fare only. There is no transfer fee or a second fare for transferring within the 90 minute window. Hence, the cost can be modeled as the sum of the first fare and the sums of the transfer fees.
- The `transfer_count` is set to `-1` as the rider can transfer an unlimited number of times within the 90 minute `duration_limit` window.

After defining the fare, creating the appropriate `fare_leg_rule`, and defining the `fare_transfer_rule`,  you can see the $2.00 USD `core_local_oneway_fare` appear in trip planners. Here is an example from Transit:

<div class="flex-photos">
    <img src="../../../assets/transit-fares-mdot.png" alt="fare of $2 USD">
</div>

<sup>[Download the Maryland Transit Administration local bus GTFS feed](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

## Describe service locations in the same fare zone

Some transit agencies operate a zone-based fare structure. Fare zones are divided geographic areas associated with different fare prices. In Bay Area’s BART system, fares are different depending on the origin and destination <a href="https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf" target="_blank">(BART fare differences)</a>, and transit riders will need to know the right fare. Fare areas can be described using the [stops_areas.txt](../../reference/#stops_areastxt) file, which assigns stops from [stops.txt](../../reference/#stopstxt) to [areas.txt](../../reference/#areastxt).

First, identify the area in [areas.txt](../../reference/#areastxt) . It is acceptable to leave `area_name` blank if there is no area name. In the table below, there are three `area_id` - `ASHB`, `GLEN`, and `OAKL`.

[**areas.txt**](../../reference/#areastxt) 

| area_id | area_name |
|---------|-----------|
| ASHB    |           |
| GLEN    |           | 
| OAKL    |           | 

Afterwards, using `stop_id` from the [stops.txt](../../reference/#stopstxt) file, group stops together to its respective identified area (fare zone). 

Next, group `stop_id` to each `area_id`. In the BART example, each area contains only 1 `stop_id`. For instance, only stop `ASHB` (Ashby Station) is included in the area `ASHB` However, if an area includes multiple stops, multiple `stop_id` should be listed.

[**stops_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
|---------|---------|
| ASHB    | ASHB    |
| GLEN    | GLEN    | 
| OAKL    | OAKL    | 

In `fare_leg_rules.txt`, different fare products can be identified based on different departure and arrival areas. For example, the first entry shows:

* Departure area is `ASHB` 
* Arrival area is `GLEN`
* The fare product for the departure/arrival area is `BA:matrix:ASHB-GLEN`

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id|to_area_id|fare_product_id|
|--------------|-----------|------------|---------------|
|   BA    |  ASHB   | GLEN | BA:matrix:ASHB-GLEN |
|     BA         |  ASKB   | OAKL | BA:matrix:ASHB-OAKL |

The fare is identified in `fare_products.txt`. 

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name| amount | currency |
|---------------------|-----------|--------|----------|
| BA:matrix:ASHB-GLEN |  generated  | 4.75   | USD      |
| BA:matrix:ASHB-OAKL  |  generated  | 9.45   | USD       |


<sup><a href="https://511.org/open-data/transit" target="_blank">See the San Francisco Bay Area Regional feed</a></sup>

<hr>

## Describe what fare media is accepted

San Francisco Muni riders can use several different types of fare media to pay for their trip and validate their fare:

- Use a <a href="https://www.clippercard.com/ClipperWeb/" target="_blank">Clipper card</a>, the Bay Area’s transit card
- Use the <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">Munimobile app</a>
- Pay for the fare in cash

These validation methods are referred to as `fare_media` in GTFS-Fares v2 and can be described using `fare_media.txt`.

Below is an example snippet from the <a href="https://511.org/open-data/transit" target="_blank">San Francisco Bay Area Regional Feed</a> that can be accessed with the 511 SF Bay API.

`Clipper` is described as a physical transit card with `fare_media_type=2`. `SFMTA Munimobile` is described as a mobile app with `fare_media_type=2`. `Cash` has no fare media, since it is given directly to the driver without a ticket. As a result, `Cash` is `fare_media_type=0`.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| munimobile    | SFMTA MuniMobile | 4               |
| cash           | Cash             | 0               |

<sup><a href="https://511.org/open-data/transit" target="_blank">See the San Francisco Bay Area Regional feed</a></sup>

Additionally, producers who want to describe a physical ticket as a fare media can use `fare_media_type=1`.

The Massachusetts Bay Transportation Authority (MBTA) allows users to pay for trips and passes using a physical paper ticket called CharlieTicket. To reflect this, there is a `charlieticket` fare media in MBTA’s feed with a `fare_media_type=1`.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
|cash           |Cash              |0                |
|charlieticket  |CharlieTicket     |1                |
|mticket        |m Ticket app      |4                |

<sup><a href="https://www.mbta.com/developers/gtfs" target="_blank">See the Massachusetts Bay Transportation Authority feed</a></sup>

## Define price differences based on fare media

Muni's fare price is different based on the fare media the rider uses. This example will cover how the adult local fare price changes when using cash or Clipper card. An adult local fare paid for with cash costs $3 USD and the same fare paid for with the Clipper card costs $2.50, 50 cents less.

Each entry below describes a fare media.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| cash           | Cash             | 0               |

The `fare_products.txt` file snippet below shows how the amount of the `Muni single local fare` product varies depending on the fare media that the rider uses.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | amount | currency | fare_media_id |
|---------------|------------------|-------|--- |---------------|
| SF:local:single | Muni single local fare | 3     | USD | cash |
| SF:local:single | Muni single local fare  | 2.5   |USD | clipper |

In Apple Maps, riders can see how their fare price changes. You can compare fare prices under the "Board the Muni J Church train" instruction:

<div class="flex-photos">
    <img src="../../../assets/apple-muni-cash.jpg" alt="cash fare of $3 USD">
    <img src="../../../assets/apple-muni-clipper.jpg" alt="Clipper card fare of $2.50 USD">
</div>

<sup><a href="https://511.org/open-data/transit" target="_blank">See the San Francisco Bay Area Regional feed</a></sup>


## Describe a contactless fare media option

<a href="https://vimeo.com/539436401" target="_blank">The Clean Air Express in Northern Santa Barbara County accepts contactless payment</a> by credit card, Google Pay and Apple Pay.

In the Clean Air Express feed, there is a `tap_to_ride` fare media with a  `fare_media_type=3`, since it’s a cEMV (contactless Europay, Mastercard and Visa) option.

| fare_media_id | fare_media_name | fare_media_type |
|---------------|-----------------|-----------------|
| tap_to_ride   | Tap to Ride   | 3  |

The single ride fare product shown below has both `cash` and `tap-to-ride` fare media options. When the single ride is paid for with the `tap-to-ride` fare media, it is one USD dollar cheaper.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | fare_media_id | amount | currency |
|---------------|------------------|---------------|--------|----------|
| single-ride | Single Ride | tap_to_ride       | 6      | USD      |
| single-ride | Single Ride |       | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">Download the Clean Air Express feed</a></sup>






