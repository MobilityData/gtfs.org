<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/fares-v1.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Fares v1

<hr>

Composed of [fare_attributes.txt](../../reference/#fare_attributestxt) and [fare_rules.txt](../../reference/#fare_rulestxt), Fares v1 has historically been the official method for describing fare information in GTFS. However the two files are limited in the breadth of factors they can efficiently describe, and are ambiguous to implement. 
[Fares v2](../../examples/fares-v2/) is an extension project under active development, and it aims to address the limitations of Fares v1.

## Define an agency’s fare rules

A trip on the Toronto Transit Commission’s subway network costs $3.20 CAD if riders pay using the PRESTO card. Riders can also transfer to other subway, streetcar, or bus routes operated by the TTC within a two-hour window.

This service can be represented using the files [fare_attributes.txt](../../reference/#fare_attributestxt), [fare_rules.txt](../../reference/#fare_rulestxt), and [transfers.txt](../../reference/#transferstxt). The first file, [fare_attributes.txt](../../reference/#fare_attributestxt) describes the agency’s fares, below is an example for the presto fare:

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

```
fare_id,price,currency_type,payment_method,transfers,transfer_duration
presto_fare,3.2,CAD,1,,7200
```

- The price of the fare is listed under price and `currency_type`
- Riders have to pay their fare at the station fare gates before boarding the subway. This is represented by `payment_method=1`
- The field transfers is left blank to represent unlimited transfers 
- The field `transfer_duration` corresponds to the 2-hour transfer window (in seconds)

The second file, [fare_rules.txt](../../reference/#fare_rulestxt) assigns fares to journeys through tying a fare to a route as well as an origin/destination on that route. 

For that, two subway lines are defined below in [routes.txt](../../reference/#routestxt):

[**routes.txt**](../../reference/#routestxt)

```
agency_id,route_id,route_type
TTC,Line1,1
TTC,Line2,1
```

In this example, transfers at Bloor-Yonge station are modeled. For that, this station is modeled as two separate stops, the first is Bloor Station which is served by Line 1, and the second is Yonge station, which is served by Line 2. Both have `zone_id=ttc_subway_stations` in order to group all subway stations in a single fare zone. 

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_name,stop_lat,stop_lon,zone_id
Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations
```

In [fare_rules.txt](../../reference/#fare_rulestxt), the PRESTO fare is associated with both subway lines and stations using the following relationships:

- For `fare_id=presto_fare`, riders can travel between any two stations on Line 1 (`route_id=line1`) and `origin_id=ttc_subway_stations` and `destination_id=ttc_subway_stations`.

[**fare_rules.txt**](../../reference/#fare_rulestxt) 

```
fare_id,route_id,origin_id,destination_id
presto_fare,line1,ttc_subway_stations,ttc_subway_stations
presto_fare,line2,ttc_subway_stations,ttc_subway_stations
```

The third file, [transfers.txt](../../reference/#transferstxt) defines transfer points between different routes. To model transfers at Bloor-Yonge station, two entries are required:

[**transfers.txt**](../../reference/#transferstxt) 

```
from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
Bloor,Yonge,line1,line2,0
Yonge,Bloor,line2,line1,0
```

- The first models transfers from Line 1 to Line 2 using `from_route_id` and `to_route_id` from Bloor station to Yonge station
- The second models transfers from Line 2 to Line 1 using `from_route_id` and `to_route_id` from Yonge station to Bloor station
- The value for `transfer_type` is `0` since there are no specific requirements or considerations for transfers

<sup>[Example source](https://www.ttc.ca/Fares-and-passes)</sup>
