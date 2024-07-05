# Fares
GTFS allows to precisely model a wide variety of fare structures used by different transit agencies around the world, such as fares based by zone, by distance traveled, or by time-of-day. GTFS Fares informs riders of the price applicable to their trip and the media they can use to pay.

## Fare Products

Fare Products lists the types of tickets or fares (i.e. single-trip fare, monthly pass, transfer fees, etc.) offered by a transit agency to access a service. Fare Products serve as a foundation for modeling an agency's fare structure, and they are linked to the transit service through mechanisms outlined in `fare_leg_rules.txt`. The association of Fare Products to various travel conditions, such as routes, areas, and times, determines the fare costs for individual travel segments and transfers.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)|`fare_product_id`, `fare_product_name`, `amount`, `currency`, `fare_media_id` |
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`fare_product_id`|


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample presents a simple fare product (single ride $2.75 USD). 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_productstxt"><b>fare_products.txt</b></a> <br>
        </p>

        | fare_product_id  | fare_product_name      | amount  | currency  |
        |------------------|--------------------    |---      |---        |
        | single_ride      | Single Ride Fare       |  2.75   | USD       |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | fare_product_id  |
        |------------------|
        | single_ride |


## Fare Media

Fare Media defines the supported media that can be used to hold and/or validate a fare product. This refers to physical or virtual containers such as a paper ticket, a rechargeable transit card or even contactless payment with credit cards or smartphones.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[fare_media.txt](../../../documentation/schedule/reference/#fare_mediatxt)|`fare_media_id`, `fare_media_name`, `fare_media_type`|
|[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)|`fare_media_id`|


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows a snippet of different Fare Media in the San Francisco Bay Area. `Clipper` is described as a physical transit card with `fare_media_type=2`. `SFMTA Munimobile` is described as a mobile app with `fare_media_type=2`. `Cash` which is given directly to the driver without a ticket, is `fare_media_type=0`.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_mediatxt"><b>fare_media.txt</b></a> <br>
        </p>

        | fare_media_id | fare_media_name  | fare_media_type |
        |---------------|------------------|-----------------|
        | clipper       | Clipper          | 2               |
        | munimobile    | SFMTA MuniMobile | 4               |
        | cash          | Cash             | 0               |  

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_productstxt"><b>fare_products.txt</b></a> <br>
        </p>

        | fare_product_id  | fare_product_name      | amount  | currency  | fare_media_id |
        |------------------|--------------------    |---      |---        | ---           |
        | single_ride      | Single Ride Fare       |  2.75   | USD       | munimobile          |




## Route-Based Fares

Route-Based Fares is used to assign different fares for specific groups of routes, such as special fares for express services or differentiating fares between a Bus Rapid Transit service versus traditional bus services.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[routes.txt](../../../documentation/schedule/reference/#routestxt)|`network_id`|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`fare_product_id`, `network_id`|
|[netowrks.txt](../../../documentation/schedule/reference/#networkstxt)|`network_id`, `network_name`|
|[route_networks.txt](../../../documentation/schedule/reference/#route_networkstxt)|`network_id`, `route_id`|

**Prerequisites**:

- [Base features](../base)
- [Fare Products feature](#fare-products)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows a system that categorizes routes into express and local categories, each associated with distinct fare products. </p>

    <p style="font-size:16px"> **Using `networks.txt` + `route_networks.txt`** </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#networkstxt"><b>networks.txt</b></a> <br>
        </p>

        | network_id | network_name    |
        |------------|-----------------|
        | express    | Express         |
        | local      | Local           |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#route_networkstxt"><b>route_networks.txt</b></a> <br>
        </p>

        | network_id | route_id |
        |------------|-----------|
        | express    | express_a |
        | express    | express_b |
        | local      | local_1   |
        | local      | local_2   |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | network_id | fare_product_id |
        |------------|-----------------|
        | express    | express_single_ride |
        | local      | local_single_ride   |

    <p style="font-size:16px"> **OR using `routes.networks_id`** </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id   | network_id |
        |------------|------------|
        | express_a  | express    |
        | express_b  | express    |
        | local_1    | local      |
        | local_2    | local      |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | network_id | fare_product_id |
        |------------|-----------------|
        | express    | express_single_ride |
        | local      | local_single_ride   |


## Time-Based Fares

Time-Based Fares is used to assign fares for specific time-of-day or day-of-week, such as peak and off-peak fares and/or weekend fares.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`fare_product_id`, `from_timeframe_group_id`, `to_timeframe_group_id`|
|[timeframes.txt](../../../documentation/schedule/reference/#timeframestxt)|`timeframe_group_id`, `start_time`, `end_time`, `service_id`|

**Prerequisites**:

- [Base features](../base)
- [Fare Products feature](../fares/#fare-products)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample presents a system where the peak hours are from 8:00 to 10:00, and the remaining hours are off-peak. </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#timeframestxt"><b>timeframes.txt</b></a> <br>
        </p>

        | timeframe_group_id | start_time | end_time | service_id |
        |--------------------|------------|----------|------------|
        | peak               | 8:00:00    | 10:00:00 | all_day    |
        | regular            | 0:00:00    | 08:00:00 | all_day    |
        | regular            | 10:00:00   | 24:00:00 | all_day    |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | from_timeframe_group_id | fare_product_id     |
        |-------------------------|---------------------|
        | peak                    | peak_single_ride    |
        | regular                 | regular_single_ride |


## Zone-Based Fares

Zone-Based Fares is used to represent zone-based systems where a specific fare applies when traveling from one particular zone to another. A zone is defined by a group of stops.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`fare_product_id`, `from_area_id`, `to_area_id`|
|[areas.txt](../../../documentation/schedule/reference/#areastxt)|`area_id`, `area_name`|
|[stop_areas.txt](../../../documentation/schedule/reference/#stop_areastxt)|`area_id`, `stop_id`|

**Prerequisites**:

- [Base features](../base)
- [Fare Products feature](../fares/#fare-products)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows the fare from Zone A to Zone B. </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#areastxt"><b>areas.txt</b></a> <br>
        </p>

        | area_id | area_name |
        |---------|-----------|
        | zone_a  | Zone A    |
        | zone_b  | Zone B    |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_areastxt"><b>stop_areas.txt</b></a> <br>
        </p>

        | area_id | stop_id |
        |---------|---------|
        | zone_a  | stop_a  |
        | zone_a  | stop_b  |
        | zone_b  | stop_c  |
        | zone_b  | stop_d  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | from_area_id | to_area_id | fare_product_id |
        |--------------|------------|-----------------|
        | zone_a       | zone_b     | zone_a_b_single |

## Fares Transfers

Fares Transfers is used to define rules applicable when transferring between legs (or individual travel segments). This allows to model the total cost of a multi-leg travel journey, accounting for special transfer policies, such as free transfers for a specific time limit, or applying fare discounts based on legs already traveled.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`leg_group_id`|
|[fare_transfer_rules.txt](../../../documentation/schedule/reference/#fare_transfer_rulestxt)|`from_leg_group_id`, `to_leg_group_id`, `transfer_count`, `duration_limit`, `duration_limit_type`, `fare_transfer_type`, `fare_product_id`|

**Prerequisites**:

- [Base features](../base)
- [Fare Products feature](../fares/#fare-products)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample illustrates that within a 2-hour window, unlimited free transfers are allowed between Leg A within the system. </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | leg_group_id  |
        |---------------|
        | a             |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_transfer_rulestxt"><b>fare_transfer_rules.txt</b></a> <br>
        </p>

        | from_leg_group_id | to_leg_group_id | transfer_count | duration_limit | duration_limit_type | fare_transfer_type | fare_product_id |
        |-------------------|-----------------|----------------|----------------|---------------------|--------------------|-----------------|
        | a                 | a               | -1             | 7200           | 1                   | 0                  | free_transfer   |


## Fares v1

Fares v1 is a legacy alternative to other Fares features described above. It allows to model basic fare information such as fare pricing, payment methods transfers and zone-based fares using the `fare_rules.txt` and `fare_attributes.txt` files. While simpler to produce, it's less capable or modeling more complex fare structures and may be deprecated with sufficient endorsement of other Fare features (that are part of what is called Fares v2).

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`zone_id`|
|[fare_attributes.txt](../../../documentation/schedule/reference/#fare_attributestxt)|`fare_id` `price` `currency_type` `payment_method` `transfers` `agency_id` `transfer_duration`|
|[fare_rules.txt](../../../documentation/schedule/reference/#fare_rulestxt)|`fare_id` `route_id` `origin_id` `destination_id` `contains_id`|


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample illustrates that a trip on a network costs $3.20 CAD using a prepaid card, allowing free transfers within a 2-hour window. </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_attributestxt"><b>fare_attributes.txt</b></a> <br>
        </p>

        | fare_id           | price | currency_type | payment_method | transfers | transfer_duration |
        |-------------------|-------|---------------|----------------|-----------|-------------------|
        | prepaid-card_fare | 3.2   | CAD           | 1              |           | 7200              |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_rulestxt"><b>fare_rules.txt</b></a> <br>
        </p>

        | fare_id           | route_id | origin_id       | destination_id  |
        |-------------------|----------|-----------------|-----------------|
        | prepaid-card_fare | line1    | subway_stations | subway_stations |
        | prepaid-card_fare | line2    | subway_stations | subway_stations |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name | stop_lat  | stop_lon   | zone_id         |
        |---------|-----------|-----------|------------|-----------------|
        | A       | stopA     | 43.670049 | -79.385389 | subway_stations |
        | B       | stopB     | 43.671049 | -79.386789 | subway_stations |


        | stop_id | stop_name | stop_lat  | stop_lon   | zone_id         |
        |---------|-----------|-----------|------------|-----------------|
        | A       | stopA     | 43.670049 | -79.385389 | subway_stations |
        | B       | stopB     | 43.671049 | -79.386789 | subway_stations |

