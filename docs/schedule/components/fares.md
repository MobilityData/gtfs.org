# Fares Component
The Fares component includes multiple features that allow to precisely describe a wide variety of pricing structures and payment methods used by different transit agencies around the world, such as zone-based fares and reloadable prepaid cards. This helps users know the correct price applicable to their trip.

## Fare Products

<div class="grid" markdown>

This feature is used to list the types of tickets or fares (i.e. single-trip fare, Monthly pass, etc.)  offered by a transit agency that can be purchased by riders to access a service, defining their name, price and currency. This feature acts as the base to implement all other functionalities associated with fares (except for Fares v1).

| Files associated      | [fare_products.txt](/schedule/reference/#fare_productstxt)                  | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)  |
|-----------------------|-----------------------------------------------------------------------------|--------------------|
| **Fields associated** | fare_product_id<br>fare_product_name<br>amount<br>currency<br>fare_media_id | fare_product_id    |

</div>

## Fare Media

<div class="grid" markdown>

This feature helps define the supported media that can be used to hold and/or validate a fare product. This refers to physical or virtual containers such as a paper ticket, a rechargeable transit card or even contactless payment with credit cards or smartphones.

| Files associated      | [fare_media.txt](/schedule/reference/#fare_mediatxt)                                       | [fare_products.txt](/schedule/reference/#fare_productstxt)  |
|-----------------------|-----------------------------------------------------|-------------------|
| **Fields associated** | fare_media_id<br>fare_media_name<br>fare_media_type | fare_media_id     |

</div>

## Route-Based Fares

<div class="grid" markdown>

This feature allows to describe rules used to apply different fares for specific groups of routes, such as special fares for express services or differentiating fares between a BRT service versus traditional bus services.

| Files associated      | [routes.txt](/schedule/reference/#routestxt) | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)            | [netowrks.txt](/schedule/reference/#networkstxt)               | [route_networks.txt](/schedule/reference/#route_networkstxt)    |
|-----------------------|------------|-------------------------------|----------------------------|------------------------|
| **Fields associated** | network_id | fare_product_id<br>network_id | network_id<br>network_name | network_id<br>route_id |

</div>

## Time-Based Fares

<div class="grid" markdown>

This feature can be used to create rules that are useful to represent fares differentiated based on the time of the day or the day of the week, such as peak and off-peak fares and/or weekend fares.

| Files associated      | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)        | [timeframes.txt](/schedule/reference/#timeframestxt)       |
|-----------------------|---------------------------------------------------------------------|------------------------------------------------------------|
| **Fields associated** | fare_product_id<br>from_timeframe_group_id<br>to_timeframe_group_id | timeframe_group_id<br>start_time<br>end_time<br>service_id |

</div>

## Zone-Based Fares

<div class="grid" markdown>

This feature allows to define rules that enable fares differentiated when traveling from a specific group of stops to another. This can be useful to represent zone-based systems where a specific fare applies when traveling from one particular zone to another.

| Files associated      | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt)                            | [areas.txt](/schedule/reference/#areastxt)            | [stop_areas.txt](/schedule/reference/#stop_areastxt)     |
|-----------------------|-----------------------------------------------|----------------------|--------------------|
| **Fields associated** | fare_product_id<br>from_area_id<br>to_area_id | area_id<br>area_name | area_id<br>stop_id |

</div>

## Transfer Fares

<div class="grid" markdown>

This feature allows to define rules applicable when transferring from one leg of the trip to another, this is helpful to correctly model the cost of a multi leg trip especially when a special transfer policy is used such as free transfers for a specific time limit or applying fare discounts to the second leg of the trip.

| Files associated      | [fare_leg_rules.txt](/schedule/reference/#fare_leg_rulestxt) | [fare_transfer_rules.txt](/schedule/reference/#fare_transfer_rulestxt)                                                                                                                  |
|-----------------------|--------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | leg_group_id       | from_leg_group_id<br>to_leg_group_id<br>transfer_count<br>duration_limit<br>duration_limit_type<br>fare_transfer_type<br>fare_product_id |

</div>

## Fares V1

<div class="grid" markdown>

This feature is a legacy alternative to other Fares Features that allows to model simpler fare information including fare pricing, payment methods and transfers and zone-based fares. While simpler to produce, its capacity to adapt to more complex fare structures is more limited compared to using the rest of the Fares features, thus their is preferred over Fares V1.

| Files associated      | [stops.txt](/schedule/reference/#stopstxt) | [fare_attributes.txt](/schedule/reference/#fare_attributestxt)                                                                                | [fare_rules.txt](/schedule/reference/#fare_rulestxt)                                                    |
|-----------------------|-----------|----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| **Fields associated** | zone_id   | fare_id<br>price<br>currency_type<br>payment_method<br>transfers<br>agency_id<br>transfer_duration | fare_id<br>route_id<br>origin_id<br>destination_id<br>contains_id |

</div>
