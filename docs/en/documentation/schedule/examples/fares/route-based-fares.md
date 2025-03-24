# Route-based Fares

*Main files: fare\_leg\_rules.txt, networks.txt, route\_networks.txt, routes.txt*

*Example: Translink (Vancouver)*

**Recall ([Fares v2 Features](?tab=t.0#heading=h.o1dhl0gqp9z8)):** Route-based fares provide a different fare based on which route is used. We will use this to create a flat fare for Translink’s buses.

Route-Based fares are represented by fare products that offer a flat-rate fare. Recall: A Fare Product is the type of fare offered by an agency to access a service.

Route-Based fares are created as follows:

### Create fare products
Each fare product is created in fare\_products.txt by specifying:

   1. fare\_product\_id: An identifier for the fare product
   2. fare\_product \_name which is the name of the rider-facing fare product (eg: Bus Flat Fare, Bus Flat Fare monthly, etc)  
   3. Amount and currency: The cost of the fare and its currency.  
   4. fare\_media\_id: The fare media where this fare product can be stored and used. This fare\_media\_id is a Foreign Key referencing fare\_media\_id in fare\_media.txt ([Section. Fare Media](?tab=t.0#heading=h.74vq7n7w2syl))  
      - We can associate multiple fare media for the same fare product by copying the row containing the fare product information and changing only fare\_media\_id.  
      - An empty fare\_media\_id means that the fare media is unknown.  

[Consult the documentation](https://gtfs.org/documentation/schedule/reference/#fare_productstxt) for more details on fare products

Below is an example of flat-rate fare products for Translink buses, specified in `fare_products.txt`

`fare_products.txt`

| fare\_product\_id | fare\_product\_name | amount | currency | fare\_media\_id |
| :---- | :---- | :---- | :---- | :---- |
| bus\_flat\_fare | Bus Flat Fare | 3.20 | CAD | contactless |
| bus\_flat\_fare | Bus Flat Fare | 3.20 | CAD | cash |
| bus\_flat\_fare | Bus Flat Fare | 2.60 | CAD | compass\_card |
| … | … | … | … | … |

Note that by having three entries with the same product but different fare\_media\_id we are effectively stating that this product (`bus_flat_fare`) can be purchased with cash, contactless card and compass\_card. Note that the price for someone paying with a compass card is less than the rest of the fare media options.

To simplify the example, we will work using *only the contactless* fare products.

### Create networks that group the routes  
For route-based fares, each group of routes has a different fare. These groups are also called networks. If all routes for an agency have the same fare, then they will be grouped under one network.  

In Translink’s case, buses need to be separated into their own group, because they have a flat-rate fare. As opposed to SkyTrain and Seabus whose fare depends on the number of crossed zones ([Section. Zone-Based Fares](?tab=t.0#heading=h.6a6lgwt3uh85))

Networks are created in networks.txt and route\_networks.txt (or routes.txt).  

   1. networks.txt contains the definitions of the networks, fill it with:  
      - network\_id: Unique identifier for the network  
      - Network\_name: Name of the network (eg: Translink Buses, TTC Subway, STM All Routes, etc)  
   2. After creating the networks, associate them with routes by using either route\_networks.txt (or routes.txt).
      - In route\_networks.txt: Add rows that contain route\_id and the corresponding network\_id.  
      - Or, in routes.txt, add a field called network\_id that associates a network to each route.  

[Consult the documentation](https://gtfs.org/documentation/schedule/reference/#networkstxt) for more details on networks

The “translink\_bus” network includes all buses from Translink.  `translink\_bus` is specified in the table `networks.txt`. 

`networks.txt`

| network\_id | network\_name |
| :---- | :---- |
| bus | Translink Buses |

Then, it is linked to every bus route in `route_networks.txt`. Where route\_ids refers to all the route\_ids of all vancouver buses (found in routes.txt).

`route_networks.txt`

| route\_id | network\_id |
| :---- | :---- |
| 10232 | bus |
| 11201 | bus |
| … | … |

### Create fare leg rules   
   In GTFS, a fare leg corresponds to a trip that a rider makes without transferring between different modes, routes, networks, or agencies. Therefore, a leg associates a network of routes (specified in network.txt) to a route-based fare product (specified in fare\_products.txt). 
   
   In Translink’s case, one bus leg means taking one Translink bus and remaining on that bus from stop A to stop B. Once the rider changes the bus to another bus, another mode or another agency, they start a different leg.
   
   In GTFS, route-based fare legs are created by having: 

   1. leg\_group\_id: An identifier for the leg  
   2. network\_id: The network\_id associated to the routes that are covered by the leg. It is a Foreign Key referencing the network\_id from networks.txt  
   3. fare\_product\_id: The fare product that will determine the cost of the leg. It is a Foreign Key referencing the fare product from fare\_products.txt  

[Consult the documentation](https://gtfs.org/documentation/schedule/reference/#fare_leg_rulestxt) for more details on fare legs.

The fare\_leg\_rules.txt table below contains the bus fare leg for Translink. It means that all legs that are made within the "translink\_bus" network will be priced according to the bus\_flat\_fare product.

`fare_leg_rules.txt`

| leg\_group\_id | network\_id | fare\_product\_id |
| :---- | :---- | :---- |
| flat\_fare\_leg | bus | bus\_flat\_fare |