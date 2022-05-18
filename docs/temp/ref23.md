### fare_leg_rules.txt

File: **Optional**

Primary Key (`network_id, from_area_id, to_area_id, fare_product_id`)

Fare rules for individual legs of travel.

Fares in [`fare_leg_rules.txt`](#fare_leg_rulestxt) must be queried by filtering all the records in the file to find rules that match the leg to be traveled by the rider.

To process the cost of a leg:

1. The file `fare_leg_rules.txt` must be filtered by the fields that define the characteristics of travel, these fields are:
    - `fare_leg_rules.network_id`
    - `fare_leg_rules.from_area_id`
    - `fare_leg_rules.to_area_id`<br/>
<br/>

2. If the leg exactly matches a record in `fare_leg_rules.txt` based on the characteristics of travel, that record must be processed to determine the cost of the leg.
3. If no exact matches are found, then empty entries in `fare_leg_rules.network_id`, `fare_leg_rules.from_area_id`, and `fare_leg_rules.to_area_id` must be checked to process the cost of the leg:
    - An empty entry in `fare_leg_rules.network_id` corresponds to all networks defined in `routes.txt` excluding the ones listed under `fare_leg_rules.network_id`
    - An empty entry in `fare_leg_rules.from_area_id` corresponds to all areas defined in `areas.area_id` excluding the ones listed under `fare_leg_rules.from_area_id`
    - An empty entry in `fare_leg_rules.to_area_id` corresponds to all areas defined in `areas.area_id` excluding the ones listed under `fare_leg_rules.to_area_id`<br/>
<br/>

4. If the leg does not match any of the rules described above, then the fare is unknown.

<br/>

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
| `leg_group_id` | ID | Optional | Identifies a group of entries in [fare_leg_rules.txt](#fare_leg_rulestxt).<br><br> Used to describe fare transfer rules between `fare_transfer_rules.from_leg_group_id` and `fare_transfer_rules.to_leg_group_id`.<br><br>Multiple entries in [fare_leg_rules.txt](#fare_leg_rulestxt) may belong to the same `fare_leg_rules.leg_group_id`.<br><br>The same entry in [fare_leg_rules.txt](#fare_leg_rulestxt) (not including `fare_leg_rules.leg_group_id`) must not belong to multiple `fare_leg_rules.leg_group_id`.|
| `network_id` | Foreign ID referencing `routes.network_id` | Optional | Identifies a route network that applies for the fare leg rule.<br><br>If there are no matching `fare_leg_rules.network_id` values to the `network_id` being filtered, empty `fare_leg_rules.network_id` will be matched by default.<br><br> An empty entry in `fare_leg_rules.network_id` corresponds to all networks defined in `routes.txt` excluding the ones listed under `fare_leg_rules.network_id` |
| `from_area_id` | Foreign ID referencing `areas.area_id` | Optional | Identifies a departure area.<br><br>If there are no matching `fare_leg_rules.from_area_id` values to the `area_id` being filtered, empty `fare_leg_rules.from_area_id` will be matched by default. <br><br>An empty entry in `fare_leg_rules.from_area_id` corresponds to all areas defined in `areas.area_id` excluding the ones listed under `fare_leg_rules.from_area_id` |
| `to_area_id` | Foreign ID referencing `areas.area_id` | Optional | Identifies an arrival area.<br><br>If there are no matching `fare_leg_rules.to_area_id` values to the `area_id` being filtered, empty `fare_leg_rules.to_area_id` will be matched by default.<br><br> An empty entry in `fare_leg_rules.to_area_id` corresponds to all areas defined in `areas.area_id` excluding the ones listed under `fare_leg_rules.to_area_id` |
| `fare_product_id` | Foreign ID referencing `fare_products.fare_product_id` | **Required** | The fare product required to travel the leg. |

