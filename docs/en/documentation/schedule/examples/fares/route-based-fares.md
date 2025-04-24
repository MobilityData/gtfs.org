# Route-Based Fares

*Main files: fare_leg_rules.txt, networks.txt, route_networks.txt, routes.txt*  
*Example: [Translink (Vancouver)](../intro/#translink-vancouver)*

!!! info "Reminder"

    Route-Based Fares assign different fares based on which route is used. Fare Products are the types of fares offered by a transit agency to access a service. For more information revisit the [Features section](../intro/#fares-features-and-their-files) in the Introduction page.

!!! Note

    This section will display different types of fare media for the same fare product. In later sections, only fare products with *contactless* fare media will be shown to simplify the guide.

## Create fare products

Route-Based Fares are represented by fare products that offer a flat-rate fare. Route-based fare products are created in `fare_products.txt` as follows:

1. Fill the **fare_product_id** column with a unique ID identifying the fare product.  
2. Fill the **fare_product_name** column with the rider-facing name of the fare product (e.g., Bus Flat Fare, Bus Flat Fare Monthly).  
3. Fill the **amount** and **currency** columns with the cost of the fare and its currency ([currency codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)).  
4. Fill the **fare_media_id** column with the fare media where this fare product can be stored and used.  
    * This is a Foreign Key referencing **fare_media_id** in `fare_media.txt` ([Fare Media](../fare-media)).  
    * Multiple fare media can be associated with the same fare product, potentially at different prices.  
    * An empty **fare_media_id** means that the fare media is unknown.

[Consult the documentation](../../../reference/#fare_productstxt) for more details on Fare Products.

In this example, a fare product called `bus_flat_fare` represents the flat fares for Translink Buses. Since there are three entries with different `fare_media_id` values, this fare product can be validated with cash, a contactless card, or a Compass Card. The price for paying with a Compass Card is lower than the other fare media options.

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | amount | currency | fare_media_id |
| :---- | :---- | :---- | :---- | :---- |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | contactless |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | cash |
| bus_flat_fare | Bus Flat Fare | 2.60 | CAD | compass_card |
| … | … | … | … | … |


## Create networks that group the routes

For Route-Based Fares, each group of routes has a different fare. These groups are also called networks. If all routes for an agency have the same fare, then they could be grouped under one network.

Networks are created in `networks.txt` as follows:

1. Fill the **network_id** column with a unique ID identifying the network.  
2. Fill the **network_name** column with the name of the network (e.g., Translink Buses, TTC Subway, STM All Routes).

In [Translink’s](../intro/#translink-vancouver) case, buses need to be separated into their own group, because they have a flat-rate fare. As opposed to SkyTrain and Seabus whose fare depends on the number of crossed zones (revisit the [Zone-Based Fares](../zone-based-fares) section).

In this example, a network called translink_bus is created to represent Translink Buses.

[**networks.txt**](../../../reference/#networkstxt)

| network_id | network_name |
| :---- | :---- |
| translink_bus | Translink Buses |

## Associate routes to networks

After creating the network, it needs to be associated with the routes contained by it. Routes are associated with networks in `route_networks.txt` as follows:

1. Fill the **route_id** column with the ID of the route from `routes.txt`.  
2. Fill the **network_id** column with the ID of the corresponding network from `networks.txt`.

[Consult the documentation](../../../reference/#networkstxt) for more details on networks.

In this example, each bus route is associated with the `translink_bus` network. The `route_id` refers to a bus `route_id` in `routes.txt`.

[**route_networks.txt**](../../../reference/#route_networkstxt)


| route_id | network_id |
| :---- | :---- |
| 10232 | translink_bus |
| 11201 | translink_bus |
| … | … |

## Create fare leg rules 

!!! info "Reminder"

    **Leg**: A single continuous segment of a journey taken on a specific service or route, typically between two stops, with no transfer.

    **Leg Group**: A set of one or more legs that share specific common attributes or fare conditions as defined in the context of the `fare_leg_rules.txt` file.

The fare of a leg is determined by matching the leg to a fare product using a fare leg rule. For Route-Based Fares, a fare leg rule associates a network of routes (which was created in `networks.txt`) to a fare product (which was created in `fare_products.txt`). 

Route-based fare leg rules are created in `fare_leg_rules.txt` as follows:

1. Fill the **leg_group_id** column with a unique ID identifying a group of legs.  
2. Fill the **network_id** column with the ID of the network associated with the routes covered by the leg.  
    * This is a Foreign Key referencing **network_id** in `networks.txt`.  
3. Fill the **fare_product_id** column with the ID of the fare product that determines the cost of the leg.  
    * This is a Foreign Key referencing **fare_product_id** in `fare_products.txt`.

[Consult the documentation](../../../reference/#fare_leg_rulestxt) for more details on fare leg rules.

For [Translink](../intro/#translink-vancouver), a bus leg consists of taking a single Translink bus from stop A to stop B without transferring. Changing to another bus, mode, or agency starts a new leg.

In this example, a fare leg rule in `fare_leg_rules.txt` links the `translink_bus` network to the `bus_flat_fare` product, ensuring all legs within this network are priced accordingly.

[**fare_leg_rules.txt**](../../../reference/#fare_leg_rulestxt)

| leg_group_id | network_id | fare_product_id |
| :---- | :---- | :---- |
| flat_fare_leg | translink_bus | bus_flat_fare |