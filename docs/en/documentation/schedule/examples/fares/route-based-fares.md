# Route-based Fares

*Main files: fare_leg_rules.txt, networks.txt, route_networks.txt, routes.txt*

*Example: Translink (Vancouver)*

**Recall ([Fares v2 Features](../../../../../getting-started/features/overview)):** Route-based fares provide a different fare based on which route is used. We will use this to create a flat fare for Translink’s buses.

Route-Based fares are represented by fare products that offer a flat-rate fare. Recall: A Fare Product is the type of fare offered by an agency to access a service.

Route-Based fares are created as follows:

### Create fare products
Each fare product is created in fare_products.txt by specifying:

   1. `fare_product_id`: An identifier for the fare product
   2. `fare_product_name` which is the name of the rider-facing fare product (eg: Bus Flat Fare, Bus Flat Fare monthly, etc)  
   3. `amount` and `currency`: The cost of the fare and its currency.  
   4. `fare_media_id`: The fare media where this fare product can be stored and used. This `fare_media_id` is a Foreign Key referencing `fare_media_id` in `fare_media.txt` (see [Fare Media](../fare-media))  
      - We can associate multiple fare media for the same fare product by copying the row containing the fare product information and changing only `fare_media_id`.  
      - An empty `fare_media_id` means that the fare media is unknown.  

[Consult the documentation](../../../reference/#fare_productstxt) for more details on fare products

Below is an example of flat-rate fare products for Translink buses, specified in `fare_products.txt`

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | amount | currency | fare_media_id |
| :---- | :---- | :---- | :---- | :---- |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | contactless |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | cash |
| bus_flat_fare | Bus Flat Fare | 2.60 | CAD | compass_card |
| … | … | … | … | … |

Note that by having three entries with the same product but different `fare_media_id` we are effectively stating that this product (`bus_flat_fare`) can be purchased with cash, contactless card and compass_card. Note that the price for someone paying with a compass card is less than the rest of the fare media options.

To simplify the example, we will work using *only the contactless* fare products.

### Create networks that group the routes  
For route-based fares, each group of routes has a different fare. These groups are also called networks. If all routes for an agency have the same fare, then they will be grouped under one network.  

In Translink’s case, buses need to be separated into their own group, because they have a flat-rate fare. As opposed to SkyTrain and Seabus whose fare depends on the number of crossed zones ([see Zone-Based Fares](../zone-based-fares))

Networks are created in `networks.txt` and `route_networks.txt` (or `routes.txt`).  

   1. `networks.txt` contains the definitions of the networks, fill it with:  
      - `network_id`: Unique identifier for the network  
      - `network_name`: Name of the network (eg: Translink Buses, TTC Subway, STM All Routes, etc)  
   2. After creating the networks, associate them with routes by using either `route_networks.txt` (or `routes.txt`).
      - In `route_networks.txt`: Add rows that contain route_id and the corresponding `network_id`.  
      - Or, in `routes.txt`, add a field called `network_id` that associates a network to each route.  

[Consult the documentation](../../../reference/#networkstxt) for more details on networks

The “translink_bus” network includes all buses from Translink.  `translink_bus` is specified in the table `networks.txt`. 

[**networks.txt**](../../../reference/#networkstxt)

| network_id | network_name |
| :---- | :---- |
| bus | Translink Buses |

Then, it is linked to every bus route in `route_networks.txt`. Where route_ids refers to all the route_ids of all vancouver buses (found in `routes.txt`).

[**route_networks.txt**](../../../reference/#route_networkstxt)

| route_id | network_id |
| :---- | :---- |
| 10232 | bus |
| 11201 | bus |
| … | … |

### Create fare leg rules   
In GTFS, a fare leg corresponds to a trip that a rider makes without transferring between different modes, routes, networks, or agencies. Therefore, a leg associates a network of routes (specified in `networks.txt`) to a route-based fare product (specified in `fare_products.txt`). 
   
In Translink’s case, one bus leg means taking one Translink bus and remaining on that bus from stop A to stop B. Once the rider changes the bus to another bus, another mode or another agency, they start a different leg.
   
In GTFS, route-based fare legs are created by having: 

1. `leg_group_id`: An identifier for the leg  
2. `network_id`: The `network_id` associated to the routes that are covered by the leg. It is a Foreign Key referencing the `network_id` from `networks.txt`  
3. `fare_product_id`: The fare product that will determine the cost of the leg. It is a Foreign Key referencing the fare product from `fare_products.txt`  

[Consult the documentation](../../../reference/#fare_leg_rulestxt) for more details on fare legs.

The `fare_leg_rules.txt` table below contains the bus fare leg for Translink. It means that all legs that are made within the "translink_bus" network will be priced according to the bus_flat_fare product.

[**fare_leg_rules.txt**](../../../reference/#fare_leg_rulestxt)

| leg_group_id | network_id | fare_product_id |
| :---- | :---- | :---- |
| flat_fare_leg | bus | bus_flat_fare |