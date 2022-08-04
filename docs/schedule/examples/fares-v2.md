<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/fares-v2.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Fares v2

<hr>

## Define a transit fare

There are several ways to pay fares to use the TTC transit system in Toronto. The TTC provides two options of fare prices depending on the payment method. An adult fare is $3.20 CAD to travel if using a PRESTO card, while the same fare is $3.25 CAD to travel if paying by cash. 

Transit tickets or fares can be described using the [fare_products.txt](../../reference/#fare_productstxt) file. Each entry corresponds to a specific fare.

[**fare_products.txt**](../../reference/#fare_productstxt) 

```
fare_product_id,fare_product_name,amount,currency
presto_fare,PRESTO Card Fare,3.2,CAD
cash_fare,Cash Fare,3.25,CAD
```

<sup>[Example source](https://www.ttc.ca/Fares-and-passes)</sup>

<hr>

## Describe service locations in the same fare zone

Some transit agencies operate a zone-based fare structure. Fare zones are divided geographic areas associated with different fare prices. Whether they’re traveling within a single zone or from one zone to another, transit riders will need to know the right fare. In Toronto’s TTC system, there is only one fare zone. Transit riders simply need to pay the same single ticket fare for any trip distance within the boundaries of the City of Toronto, no matter which form of transit is used. 

Fare zones can be described using the [stops_areas.txt](../../reference/#stops_areastxt) file, which assigns stops from [stops.txt](../../reference/#stopstxt) to [areas.txt](../../reference/#areastxt).

First, identify the area (fare zone). 

[**areas.txt**](../../reference/#areastxt) 

```
area_id,area_name
ttc_service_area,TTC Fare Zone
```

Afterwards, using `stop_id` from the [stops.txt](../../reference/#stopstxt) file, group stops together to its respective identified area (fare zone). 

[**stops_areas.txt**](../../reference/#stops_areastxt)

```
area_id,stop_id 
ttc_service_area,262
ttc_service_area,263
ttc_service_area,264
ttc_service_area,265
ttc_service_area,266
…
```

<sup>[Example source](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)</sup>

<hr>

## Create rules for single leg journeys

In GTFS, a fare leg corresponds to a trip that a rider makes without transferring between different modes, routes, networks, or agencies. 
A single fare allows riders to travel within any pair of bus stops, subway stations, and streetcar stops within the TTC’s network.

Leg groups define trips within a network from an origin to a destination (or a set of origins to a set of destinations if the area IDs correspond to grouped stops). The file below describes two rules to travel anywhere within the TTC’s network. The first rule corresponds to traveling using a PRESTO fare and the second corresponds to traveling using a cash fare.

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt) 

```
leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare
```

<sup>[Example source](https://www.ttc.ca/Fares-and-passes)</sup>

<hr>

## Create rules for transfers

Riders who use their PRESTO card to ride the TTC have a 2 hour unrestricted transfer window. This means that they can transfer an unlimited number of times between the agency’s buses, subways, and streetcars within the 2 hour timeframe.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt) 

```
from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer
```

The file above represents this in GTFS with the following fields:

- A transfer is possible to and from legs that are paid for by a PRESTO card (`ttc_trip_presto`)
- The `transfer_count` is set to `-1` since there is no limit on the number of transfers permitted
- The `transfer_duration` is set to `7200` seconds, which is equivalent to 2 hours 
- The `duration_limit_type` is set to `3`, since riders have to tap their PRESTO card as soon as they enter the fare-paid zone or as soon as they board a bus or streetcar. This corresponds to the arrival fare validation of the current leg and the arrival fare validation of the next leg.
- The `fare_transfer_type` is set to `0` since riders only pay for the first fare only. There is no transfer fee or a second fare for transferring within the 2 hour window. Hence, the cost can be modeled as the sum of the first fare and the sums of the transfer fees.
- The transfer fee is set to zero as they are free within the TTC system. This is indicated by the `fare_product_id=free_transfer`.

<sup>[Example source](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)</sup>