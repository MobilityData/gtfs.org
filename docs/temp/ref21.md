### fare_rules.txt

File: **Conditionally Required**

Primary key (`*`)

The [fare_rules.txt](#farerulestxt) table specifies how fares in [fare_attributes.txt](#fare_attributestxt) apply to an itinerary. Most fare structures use some combination of the following rules:

* Fare depends on origin or destination stations.
* Fare depends on which zones the itinerary passes through.
* Fare depends on which route the itinerary uses.

For examples that demonstrate how to specify a fare structure with [fare_rules.txt](#farerulestxt) and [fare_attributes.txt](#fareattributestxt), see [https://code.google.com/p/googletransitdatafeed/wiki/FareExamples](https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) in the GoogleTransitDataFeed open source project wiki.

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
|  `fare_id` | Foreign ID referencing `fare_attributes.fare_id`  | **Required** | Identifies a fare class. |
|  `route_id` | Foreign ID referencing `routes.route_id` | Optional | Identifies a route associated with the fare class. If several routes with the same fare attributes exist, create a record in [fare_rules.txt](#fare_rules.txt) for each route.<hr>*Example: If fare class "b" is valid on route "TSW" and "TSE", the [fare_rules.txt](#fare_rules.txt) file would contain these records for the fare class:* <br> ` fare_id,route_id`<br>`b,TSW` <br> `b,TSE`|
|  `origin_id` | Foreign ID referencing `stops.zone_id` | Optional | Identifies an origin zone. If a fare class has multiple origin zones, create a record in [fare_rules.txt](#fare_rules.txt) for each `origin_id`.<hr>*Example: If fare class "b" is valid for all travel originating from either zone "2" or zone "8", the [fare_rules.txt](#fare_rules.txt) file would contain these records for the fare class:* <br> `fare_id,...,origin_id` <br> `b,...,2`  <br> `b,...,8` |
|  `destination_id` | Foreign ID referencing `stops.zone_id` | Optional | Identifies a destination zone. If a fare class has multiple destination zones, create a record in [fare_rules.txt](#fare_rules.txt) for each `destination_id`.<hr>*Example: The `origin_id` and `destination_id` fields could be used together to specify that fare class "b" is valid for travel between zones 3 and 4, and for travel between zones 3 and 5, the [fare_rules.txt](#fare_rules.txt) file would contain these records for the fare class:* <br>`fare_id,...,origin_id,destination_id` <br>`b,...,3,4`<br> `b,...,3,5` |
|  `contains_id` | Foreign ID referencing `stops.zone_id` | Optional | Identifies the zones that a rider will enter while using a given fare class. Used in some systems to calculate correct fare class. <hr>*Example: If fare class "c" is associated with all travel on the GRT route that passes through zones 5, 6, and 7 the [fare_rules.txt](#fare_rules.txt) would contain these records:* <br> `fare_id,route_id,...,contains_id` <br>  `c,GRT,...,5` <br>`c,GRT,...,6` <br>`c,GRT,...,7` <br> *Because all `contains_id` zones must be matched for the fare to apply, an itinerary that passes through zones 5 and 6 but not zone 7 would not have fare class "c". For more detail, see [https://code.google.com/p/googletransitdatafeed/wiki/FareExamples](https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) in the GoogleTransitDataFeed project wiki.* |

