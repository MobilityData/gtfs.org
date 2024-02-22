# Fares
GTFS allows to preciely model a wide variety of fare structures used by different transit agencies around the world, such as fares based by zone, by distance traveled, or by time-of-day. GTFS Fares informs riders of the price applicable to their trip and the media they can use to pay.

## Fare Products

<div class="grid" markdown>

Fare Products lists the types of tickets or fares (i.e. single-trip fare, monthly pass, etc.) offered by a transit agency to access a service. Fare Products serve as a foundation for modeling an agency's fare structure, and they are linked to the transit service through mechanisms outlined in `fare_leg_rules.txt`. The association of Fare Products to various travel conditions, such as routes, areas, and times, determines the fare costs for individual travel segments and transfers.

| Files associated      | [fare_products.txt](/schedule/reference/#fare_productstxt)                  | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)  |
|-----------------------|-----------------------------------------------------------------------------|--------------------|
| **Fields associated** | fare_product_id<br>fare_product_name<br>amount<br>currency<br>fare_media_id | fare_product_id    |

</div>

## Fare Media

<div class="grid" markdown>

Fare Media defines the supported media that can be used to hold and/or validate a fare product. This refers to physical or virtual containers such as a paper ticket, a rechargeable transit card or even contactless payment with credit cards or smartphones.

| Files associated      | [fare_media.txt](/schedule/reference/#fare_mediatxt)                                       | [fare_products.txt](/schedule/reference/#fare_productstxt)  |
|-----------------------|-----------------------------------------------------|-------------------|
| **Fields associated** | fare_media_id<br>fare_media_name<br>fare_media_type | fare_media_id     |

</div>

## Route-Based Fares

<div class="grid" markdown>

Route-Based Fares is used to assign different fares for specific groups of routes, such as special fares for express services or differentiating fares between a Bus Rapid Transit service versus traditional bus services.

| Files associated      | [routes.txt](/schedule/reference/#routestxt) | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)            | [netowrks.txt](/schedule/reference/#networkstxt)               | [route_networks.txt](/schedule/reference/#route_networkstxt)    |
|-----------------------|------------|-------------------------------|----------------------------|------------------------|
| **Fields associated** | network_id | fare_product_id<br>network_id | network_id<br>network_name | network_id<br>route_id |

</div>

## Time-Based Fares

<div class="grid" markdown>

Time-based Fares is used to assign fares for specific time-of-day or day-of-week, such as peak and off-peak fares and/or weekend fares.

| Files associated      | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)        | [timeframes.txt](/schedule/reference/#timeframestxt)       |
|-----------------------|---------------------------------------------------------------------|------------------------------------------------------------|
| **Fields associated** | fare_product_id<br>from_timeframe_group_id<br>to_timeframe_group_id | timeframe_group_id<br>start_time<br>end_time<br>service_id |

</div>

## Zone-Based Fares

<div class="grid" markdown>

Zone-Based Fares is used to represent zone-based systems where a specific fare applies when traveling from one particular zone to another. A zone is defined by a group of stops.

| Files associated      | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)                            | [areas.txt](/schedule/reference/#areastxt)            | [stop_areas.txt](/schedule/reference/#stop_areastxt)     |
|-----------------------|-----------------------------------------------|----------------------|--------------------|
| **Fields associated** | fare_product_id<br>from_area_id<br>to_area_id | area_id<br>area_name | area_id<br>stop_id |

</div>

## Fares Transfers

<div class="grid" markdown>

Fares Transfers is used to define rules applicable when transferring between legs (or individual travel segments). This allows to model the total cost of a multi-leg travel journey, accounting for special transfer policies, such as free transfers for a specific time limit, or applying fare discounts based on legs already traveled.

| Files associated      | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt) | [fare_transfer_rules.txt](/schedule/reference/#fare_transfer_rulestxt)                                                                                                                  |
|-----------------------|--------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | leg_group_id       | from_leg_group_id<br>to_leg_group_id<br>transfer_count<br>duration_limit<br>duration_limit_type<br>fare_transfer_type<br>fare_product_id |

</div>

## Fares V1

<div class="grid" markdown>

Fares v1 is a legacy alternative to other Fares features described above. It allows to model basic fare information such as fare pricing, payment methods transfers and zone-based fares using the `fare_rules.txt` and `fare_attributes.txt` files. While simpler to produce, it's less capable or modeling more complex fare structures and may be deprecated with sufficient endorsement of other Fare features (that are part of what is called Fares v2).

| Files associated      | [stops.txt](/schedule/reference/#stopstxt) | [fare_attributes.txt](/schedule/reference/#fare_attributestxt)                                                                                | [fare_rules.txt](/schedule/reference/#fare_rulestxt)                                                    |
|-----------------------|-----------|----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| **Fields associated** | zone_id   | fare_id<br>price<br>currency_type<br>payment_method<br>transfers<br>agency_id<br>transfer_duration | fare_id<br>route_id<br>origin_id<br>destination_id<br>contains_id |

</div>
