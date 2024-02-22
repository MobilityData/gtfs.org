# Fares
GTFS allows to preciely model a wide variety of fare structures used by different transit agencies around the world, such as fares based by zone, by distance traveled, or by time-of-day. GTFS Fares informs riders of the price applicable to their trip and the media they can use to pay.

## Fare Products

<div class="grid" markdown>

Fare Products lists the types of tickets or fares (i.e. single-trip fare, monthly pass, etc.) offered by a transit agency to access a service. Fare Products serve as a foundation for modeling an agency's fare structure, and they are linked to the transit service through mechanisms outlined in `fare_leg_rules.txt`. The association of Fare Products to various travel conditions, such as routes, areas, and times, determines the fare costs for individual travel segments and transfers.

| Files associated      | [fare_products.txt](/schedule/reference/#fare_productstxt)                  | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)  |
|-----------------------|-----------------------------------------------------------------------------|--------------------|
| **Fields associated** | fare_product_id<br>fare_product_name<br>amount<br>currency<br>fare_media_id | fare_product_id    |

</div>

### Sample Data
The following table presents a simple fare product (single ride $2.75 USD). 

[fare_products.txt](/schedule/reference/#fare_productstxt)

| fare_product_id  | fare_product_name  | amount  | currency  |
|------------------|--------------------|---|---|
| single_ride | Single Ride Fare |  2.75 | USD  |

[fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)

| fare_product_id  |
|------------------|
| single_ride |

## Fare Media

<div class="grid" markdown>

Fare Media defines the supported media that can be used to hold and/or validate a fare product. This refers to physical or virtual containers such as a paper ticket, a rechargeable transit card or even contactless payment with credit cards or smartphones.

| Files associated      | [fare_media.txt](/schedule/reference/#fare_mediatxt)                                       | [fare_products.txt](/schedule/reference/#fare_productstxt)  |
|-----------------------|-----------------------------------------------------|-------------------|
| **Fields associated** | fare_media_id<br>fare_media_name<br>fare_media_type | fare_media_id     |

</div>

### Sample Data
The following table shows a snippet of different fare media in the San Francisco Bay Area. `Clipper` is described as a physical transit card with `fare_media_type=2`. `SFMTA Munimobile` is described as a mobile app with `fare_media_type=2`. `Cash` which is given directly to the driver without a ticket, is `fare_media_type=0`.

[fare_media.txt](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| munimobile    | SFMTA MuniMobile | 4               |
| cash          | Cash             | 0               |

[fare_products.txt](/schedule/reference/#fare_productstxt)

| fare_product_id | fare_media_id |
|-----------------|---------------|
| single_ride     | Clipper       | 
| single_ride     | munimobile    |
| single_ride     | cash          |

## Route-Based Fares

<div class="grid" markdown>

Route-Based Fares is used to assign different fares for specific groups of routes, such as special fares for express services or differentiating fares between a Bus Rapid Transit service versus traditional bus services.

| Files associated      | [routes.txt](/schedule/reference/#routestxt) | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)            | [netowrks.txt](/schedule/reference/#networkstxt)               | [route_networks.txt](/schedule/reference/#route_networkstxt)    |
|-----------------------|------------|-------------------------------|----------------------------|------------------------|
| **Fields associated** | network_id | fare_product_id<br>network_id | network_id<br>network_name | network_id<br>route_id |

</div>

### Sample data
The following table shows a system that categorizes routes into express and local categories, each associated with distinct fare products.

**Using `networks.txt` + `route_networks.txt`**

[netowrks.txt](/schedule/reference/#networkstxt)

| network_id | network_name    |
|------------|-----------------|
| express    | Express         |
| local      | Local           |

[route_networks.txt](/schedule/reference/#route_networkstxt)

| network_id | route_id |
|------------|-----------|
| express    | express_a |
| express    | express_b |
| local      | local_1   |
| local      | local_2   |

[fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)

| network_id | fare_product_id |
|------------|-----------------|
| express    | express_single_ride |
| local      | local_single_ride   |

**OR using `routes.networks_id`**

[routes.txt](/schedule/reference/#routestxt)

| route_id   | network_id |
|------------|------------|
| express_a  | express    |
| express_b  | express    |
| local_1    | local      |
| local_2    | local      |

[fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)

| network_id | fare_product_id |
|------------|-----------------|
| express    | express_single_ride |
| local      | local_single_ride   |

## Time-Based Fares

<div class="grid" markdown>

Time-based Fares is used to assign fares for specific time-of-day or day-of-week, such as peak and off-peak fares and/or weekend fares.

| Files associated      | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)        | [timeframes.txt](/schedule/reference/#timeframestxt)       |
|-----------------------|---------------------------------------------------------------------|------------------------------------------------------------|
| **Fields associated** | fare_product_id<br>from_timeframe_group_id<br>to_timeframe_group_id | timeframe_group_id<br>start_time<br>end_time<br>service_id |

### Sample data
The following table presents a system where the peak hours are from 8:00 to 10:00, and the remaining hours are off-peak.

[timeframes.txt](/schedule/reference/#timeframestxt)

| timeframe_group_id | start_time | end_time | service_id |
|--------------------|------------|----------|------------|
| peak               | 8:00:00    | 10:00:00 | all_day    |
| regular            | 0:00:00    | 08:00:00 | all_day    |
| regular            | 10:00:00   | 24:00:00 | all_day    |

[fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)

| from_timeframe_group_id | fare_product_id     |
|-------------------------|---------------------|
| peak                    | peak_single_ride    |
| regular                 | regular_single_ride |

</div>

## Zone-Based Fares

<div class="grid" markdown>

Zone-Based Fares is used to represent zone-based systems where a specific fare applies when traveling from one particular zone to another. A zone is defined by a group of stops.

| Files associated      | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)                            | [areas.txt](/schedule/reference/#areastxt)            | [stop_areas.txt](/schedule/reference/#stop_areastxt)     |
|-----------------------|-----------------------------------------------|----------------------|--------------------|
| **Fields associated** | fare_product_id<br>from_area_id<br>to_area_id | area_id<br>area_name | area_id<br>stop_id |

### Sample data
The following table shows the fare from Zone A to Zone B.

[areas.txt](/schedule/reference/#areastxt)

| area_id | area_name |
|---------|-----------|
| zone_a  | Zone A    |
| zone_b  | Zone B    |

[stop_areas.txt](/schedule/reference/#stop_areastxt)

| area_id | stop_id |
|---------|---------|
| zone_a  | stop_a  |
| zone_a  | stop_b  |
| zone_b  | stop_c  |
| zone_b  | stop_d  |

[fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)

| from_area_id | to_area_id | fare_product_id |
|--------------|------------|-----------------|
| zone_a       | zone_b     | zone_a_b_single |

</div>

## Fares Transfers

<div class="grid" markdown>

Fares Transfers is used to define rules applicable when transferring between legs (or individual travel segments). This allows to model the total cost of a multi-leg travel journey, accounting for special transfer policies, such as free transfers for a specific time limit, or applying fare discounts based on legs already traveled.

| Files associated      | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt) | [fare_transfer_rules.txt](/schedule/reference/#fare_transfer_rulestxt)                                                                                                                  |
|-----------------------|--------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | leg_group_id       | from_leg_group_id<br>to_leg_group_id<br>transfer_count<br>duration_limit<br>duration_limit_type<br>fare_transfer_type<br>fare_product_id |

</div>

### Sample data
The following table illustrates that within a 2-hour window, unlimited free transfers are allowed between Leg A within the system.

[fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)

| leg_group_id  |
|---------------|
| a             |

[fare_transfer_rules.txt](/schedule/reference/#fare_transfer_rulestxt)

| from_leg_group_id | to_leg_group_id | transfer_count | duration_limit | duration_limit_type | fare_transfer_type | fare_product_id |
|-------------------|-----------------|----------------|----------------|---------------------|--------------------|-----------------|
| a                 | a               | -1             | 7200           | 1                   | 0                  | free_transfer   |

## Fares V1

<div class="grid" markdown>

Fares v1 is a legacy alternative to other Fares features described above. It allows to model basic fare information such as fare pricing, payment methods transfers and zone-based fares using the `fare_rules.txt` and `fare_attributes.txt` files. While simpler to produce, it's less capable or modeling more complex fare structures and may be deprecated with sufficient endorsement of other Fare features (that are part of what is called Fares v2).

| Files associated      | [stops.txt](/schedule/reference/#stopstxt) | [fare_attributes.txt](/schedule/reference/#fare_attributestxt)                                                                                | [fare_rules.txt](/schedule/reference/#fare_rulestxt)                                                    |
|-----------------------|-----------|----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| **Fields associated** | zone_id   | fare_id<br>price<br>currency_type<br>payment_method<br>transfers<br>agency_id<br>transfer_duration | fare_id<br>route_id<br>origin_id<br>destination_id<br>contains_id |

</div>
