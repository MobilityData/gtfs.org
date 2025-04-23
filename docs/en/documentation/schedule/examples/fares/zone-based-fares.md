# Zone-Based Fares

*Main files: fare_leg_rules.txt, areas.txt, stop_areas.txt*  
*Example: [Translink (Vancouver)](../intro/#translink-vancouver)*

!!! info "Reminder"

    Zone-Based Fares is used to represent zone-based fare systems, where a specific fare applies when traveling from one particular zone to another zone. A zone is defined by an area or group of stops. For more information revisit the [Features section](../intro/#fares-features-and-their-files) in the Introduction page.

!!! Note

    This section includes examples for Contactless fares only. To support other fare media types, duplicate the relevant `fare_products.txt` rows and update the amount and `fare_media_id` fields accordingly.

## Define zones

For routes operating under zone-based fares, each stop served by the route is located in a zone. Zones are created in `areas.txt` as follows:

1. Fill **area_id** with the unique identifier for the zone.  
2. Fill **area_name** with the name of the zone.

[Consult the documentation](../../../reference/#areastxt) for more information on zones.

!!! info "Reminder"

    For [Translink](../intro/#translink-vancouver), buses use flat-rate fares. But SkyTrain and SeaBus use zone fares. Each stop is assigned to one of the three zones: ZN1, ZN2 and ZN3.

    - A **1-zone** fare is for legs within one zone only (ZN1 to ZN1, ZN2 to ZN2, ZN3 to ZN3)  
    - A **2-zone** fare is for legs that cross only two zones (ZN1 to ZN2, ZN2 to ZN3)  
    - A **3-zone** fare is for legs that cross all three zones (ZN1 to ZN3, passing through ZN2)

    Furthermore, there is an additional zone contained within ZN2 called Sea Island, containing **Vancouver Airport (YVR)**, **Sea Island Centre**, and **Templeton** stations. 

    * Journeys that start from Sea Island charge an additional CAD 5.00 over journeys starting from ZN2.   
    * Journeys that end in Sea Island charge the same amount as journeys ending in ZN2. Journeys that take place entirely within Sea Island are free.

In this example, four areas are created, one per each zone and an additional one for Sea Island. Each zone is assigned a unique identifier (`ZN1`, `ZN2`, `ZN3`, `sea_island`) as well as their respective name in `area_name`. 

[**areas.txt**](../../../reference/#areastxt)

| area_id | area_name |
| :---- | :---- |
| ZN1 | Zone 1 - Vancouver |
| ZN2 | Zone 2 - Burnaby, Richmond and North Vancouver |
| ZN3 | Zone 3 - Surrey and Coquitlam |
| sea_island | Sea Island (Vancouver Airport YVR Airport, Sea Island Centre, Templeton) |

## Assign stops to zones

Each stop from `stops.txt` needs to be assigned to a zone that contains it. Stop are associated with zones in `stop_areas.txt` as follows:

1. Fill **stop_id** with the id of the stop from `stops.txt`  
2. Fill **area_id** with the id of the zone from `areas.txt`

[Consult the documentation](../../../reference/#areastxt) for more information on areas.

In this example, each stop in Translink’s service area is assigned to `ZN1`, `ZN2` or `ZN3`. The Sea Island stops (`99901`, `99902`, `99903`) are associated with both `ZN2` and `sea_island` since they exist within both zones. Later in this section, `rule_priority` will help differentiate between `sea_island` and `ZN2` legs.

[**stop_areas.txt**](../../../reference/#stop_areastxt)

| stop_id | area_id |
| :---- | :---- |
| 8039 | ZN1 |
| 8066 | ZN2 |
| … | … |
| 99901 | ZN2 |
| 99902 | ZN2 |
| 99903 | ZN2 |
| 99901 | sea_island |
| 99902 | sea_island |
| 99903 | sea_island |

Here's a quick look at `stops.txt`, showing the stop_ids of some stops that appear in `stop_areas.txt`:

[**stops.txt**](../../../reference/#stopstxt)

| stop_id | stop_name |
| :---- | :---- |
| 8039 | Waterfront Station @ Platform 2 |
| 8066 | Edmonds Station @ Platform 1 |
| 99901 | YVR-Airport Station @ Canada Line |
| … | … |

## Create fare products

Just like with [Route-Based Fares](../route-based-fares), fare products for Zone-Based Fares are created in `fare_products.txt` as follows:

1. Fill the **fare_product_id** column with a unique ID identifying the fare product.  
2. Fill the **fare_product_name** column with the rider-facing name of the fare product (e.g., 1-Zone Fare, 2-Zone Fare, 1-Zone Fare Monthly).  
3. Fill the **amount** and **currency** columns with the cost of the fare and its currency ([currency codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)).  
4. Fill the **fare_media_id** column with the fare media where this fare product can be stored and used. 
    * This is a Foreign Key referencing **fare_media_id** in `fare_media.txt` ([Fare Media](../../../reference/#faremediatxt)).  
    * Multiple fare media can be associated with the same fare product, potentially at different prices.  
    * An empty **fare_media_id** means that the fare media is unknown.

[Consult the documentation](../../../reference/#fare_productstxt) for more details on Fare Products.

In this example, a fare product is created for each zone-based fare in `fare_products.txt`.

* CAD 3.20 for a 1-zone fare: the journey takes place in one zone only.  
* CAD 4.65 for a 2-zone fare: the journey crosses from one zone to another.  
* CAD 6.35 for a 3-zone fare: the journey crosses from Zone 1, to Zone 2 (or Sea Island), then to Zone 3.  
* CAD 8.20 (CAD 5.00 + CAD 3.20) for 1-zone Sea Island fares: From Sea Island to Zone 2.  
* CAD 9.65 (CAD 5.00 + CAD 4.65) for 2-zone Sea Island fares: From Sea Island to Zone 1 or Zone 3.  
* CAD 0 for journeys that start and end within Sea Island.


[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | amount | currency | fare_media_id |
| :---- | :---- | :---- | :---- | :---- |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | contactless |
| 1_zone_fare | 1-Zone Fare | 3.20 | CAD | contactless |
| 2_zone_fare | 2-Zone Fare | 4.65 | CAD | contactless |
| 3_zone_fare | 3-Zone Fare | 6.35 | CAD | contactless |
| sea_island_1_zone_fare | Sea Island travel + 1-zone Fare | 8.20 | CAD | contactless |
| sea_island_2_zone_fare | Sea Island travel + 2-zone fare | 9.65 | CAD | contactless |
| sea_island_sea_island_fare | Free fare inside Sea Island | 0 | CAD | contactless |

## Create networks that group the routes

For Zone-Based Fares, the relevant routes need to be grouped together under networks since they have the same fare structure.

Networks are created in `networks.txt` as follows:

1. Fill the **network_id** column with a unique ID identifying the network.  
2. Fill the **network_name** column with the name of the network (e.g., Translink Buses, TTC Subway, STM All Routes).

[Consult the documentation](../../../reference/#networkstxt) for more details on networks.

In [Translink’s](../intro/#translink-vancouver) case, buses were previously separated into their own network (see [Route-Based Fares](../route-based-fares) section), since they have a flat fare structure. Similarly, SkyTrain and Seabus will be grouped under one network since their fare depends on the number of crossed zones. A `network_id` called `skytrain_seabus` is created.

[**networks.txt**](../../../reference/#networkstxt)

| network_id | network_name |
| :---- | :---- |
| skytrain_seabus | SkyTrain and SeaBus |

## Associate routes to networks

After creating the network, it needs to be associated with the routes contained by it. Routes are associated with networks in `route_networks.txt` as follows:

1. Fill the **route_id** column with the ID of the route from `routes.txt`.
2. Fill the **network_id** column with the ID of the corresponding network from `networks.txt`.

[Consult the documentation](../../../reference/#route_networkstxt) for more details on route networks.

In this example, The `route_ids` for the SkyTrain routes (Canada Line, Millennium Line, Expo Line) and for the SeaBus are associated with the `network_id` `skytrain_seabus` in `route_networks.txt`. In the snapshot below, *13686* is the `route_id` for the Canada Line, `30052` is the route_id for the Millennium Line.

[**route_networks.txt**](../../../reference/#route_networkstxt)

| route_id | network_id |
| :---- | :---- |
| 13686 | skytrain_seabus |
| 30052 | skytrain_seabus |
| … | … |

## Create fare leg rules 

!!! info "Reminder"

    **Leg**: A single continuous segment of a journey taken on a specific service or route, typically between two stops, with no transfer.

    **Leg Group**: A set of one or more legs that share specific common attributes or fare conditions as defined in the context of the `fare_leg_rules.txt` file.

The fare of a leg is determined by matching the leg to a fare product using a fare leg rule. For Zone-Based Fares, a fare leg rule associates a network of routes (which was created in `networks.txt`) operating between zones (defined in `areas.txt`) to a fare product (which was created in `fare_products.txt`).

Zone-based fare leg rules are created in `fare_leg_rules.txt` as follows:

1. Fill the **leg_group_id** column with a unique ID identifying a group of legs.  
2. Fill the **network_id** column with the ID of the network associated with the routes covered by the leg.  
    * This is a Foreign Key referencing **network_id** in `networks.txt`.  
3. Fill **from_area_id** with the ID of the zone that the leg departs from.  
4. Fill **to_area_id** with the ID of the zone that the leg arrives to.  
5. Fill the **fare_product_id** column with the ID of the fare product that determines the cost of the leg.  
    * This is a Foreign Key referencing **fare_product_id** in `fare_products.txt`.

[Consult the documentation](../../../reference/#fare_leg_rulestxt) for more details on fare leg rules.

In this example, multiple leg groups are added for each possible zone combination. For example, `ZN1_ZN1` is the leg that remains within Zone 1 because `from_area_id=ZN1` and `to_area_id=ZN1`. `ZN1_ZN1` is associated with  `fare_product_id=1_zone_fare`. 

Note that `ZN1_ZN2` is listed twice in the example below. It is first associated with (`from_area_id=ZN1`, `to_area_id=ZN2`), then with (`from_area_id=ZN2`, `to_area_id=ZN1`) in a second line. This means that `ZN1_ZN2` represents a leg group whose fare rules match both directions of travel between `ZN1` and `ZN2`.

!!! Note

    The example below does not include Sea Island leg rules; these will be addressed in the following step.

[**fare_leg_rules.txt**](../../../reference/#fare_leg_rulestxt)

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id |
| :---- | :---- | :---- | :---- | :---- |
| … | … | … |  |  |
| ZN1_ZN1 | skytrain_seabus | 1_zone_fare | ZN1 | ZN1 |
| ZN2_ZN2 | skytrain_seabus | 1_zone_fare | ZN2 | ZN2 |
| ZN3_ZN3 | skytrain_seabus | 1_zone_fare | ZN3 | ZN3 |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN1 | ZN2 |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN2 | ZN1 |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN2 | ZN3 |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN3 | ZN2 |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN1 | ZN3 |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN3 | ZN1 |

## Prioritize overlapping zones

In some cases, multiple zones may share the same stop. This can create ambiguity about which zone should be used when applying a fare leg rule to a leg. To resolve this, the `rule_priority` field is used in `fare_leg_rules.txt`. It determines the order in which matching rules are applied: rules with higher `rule_priority` values take precedence over those with lower or empty values.

This is done in `fare_leg_rules.txt` as follows:

1. Create all potential fare leg rules by following the instructions in the previous step.  
2. Fill **rule_priority** with the order of priority of the leg. The higher the value of **rule_priority**, the higher the priority of the fare leg rule.

[Consult the documentation](../../../reference/#fare_transfer_rulestxt) for more details on fare leg rules.

In this example, since Sea Island exists inside Zone 2, if a leg starts from Sea Island and ends in Zone 2, is it considered a "Sea Island to Zone 2" leg or a "Zone 2 to Zone 2" leg, or a "Sea Island to Sea Island leg"? In fact, the leg will be matched to all 3 possibilities, which will cause ambiguity.

First, the legs that start from Sea Island are added:

* The legs `sea_island_ZN1` and `sea_island_ZN3` both cost CAD 5.00 + a 2-zone fare.  
* The leg `sea_island_ZN2` costs CAD 5.00 + a 1-zone fare.  
* The leg `sea_island_sea_island` is free.

Then, `rule_priority` is filled with the appropriate values:

* `sea_island_sea_island`has the highest priority (`rule_priority=2`). This ensures that if the origin stop and destination stop of a leg are in `sea_island` (inside Zone 2), the prioritized leg is `sea_island_sea_island` 
* The legs that start from Sea Island and end somewhere else (Zone 1, Zone 3, Zone 2 outside of Sea Island) have `rule_priority=1`  
* The remaining legs have the lowest priority: `rule_priority=0` (or empty)

[**fare_leg_rules.txt**](../../../reference/#fare_leg_rulestxt)

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id | rule_priority |
| :---- | :---- | :---- | :---- | :---- | :---- |
| … | … | … |  |  |  |
| sea_island_ZN1 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN1 | 1 |
| sea_island_ZN2 | skytrain_seabus | sea_island_1_zone_fare | sea_island | ZN2 | 1 |
| sea_island_ZN3 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN3 | 1 |
| sea_island_sea_island | skytrain_seabus | sea_island_sea_island_fare | sea_island | sea_island | 2 |
| ZN1_ZN1 | skytrain_seabus | 1_zone_fare | ZN1 | ZN1 |  |
| ZN2_ZN2 | skytrain_seabus | 1_zone_fare | ZN2 | ZN2 |  |
| ZN3_ZN3 | skytrain_seabus | 1_zone_fare | ZN3 | ZN3 |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN1 | ZN2 |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN2 | ZN1 |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN2 | ZN3 |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN3 | ZN2 |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN1 | ZN3 |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN3 | ZN1 |  |