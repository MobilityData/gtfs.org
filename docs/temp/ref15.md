### trips.txt

File: **Required**

Primary key (`trip_id`)

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
|  `route_id` | Foreign ID referencing `routes.route_id` | **Required** | Identifies a route. |
|  `service_id` | Foreign ID referencing `calendar.service_id` or `calendar_dates.service_id` | **Required** | Identifies a set of dates when service is available for one or more routes. |
|  `trip_id` | Unique ID | **Required** | Identifies a trip. |
|  `trip_headsign` | Text | Optional | Text that appears on signage identifying the trip's destination to riders. Should be used to distinguish between different patterns of service on the same route.<br><br> If the headsign changes during a trip, values for `trip_headsign` may be overridden by defining values in `stop_times.stop_headsign` for specific `stop_time`s along the trip. |
|  `trip_short_name` | Text | Optional | Public facing text used to identify the trip to riders, for instance, to identify train numbers for commuter rail trips. If riders do not commonly rely on trip names, `trip_short_name` should be empty. A `trip_short_name` value, if provided, should uniquely identify a trip within a service day; it should not be used for destination names or limited/express designations. |
|  `direction_id` | Enum | Optional | Indicates the direction of travel for a trip. This field should not be used in routing; it provides a way to separate trips by direction when publishing time tables. Valid options are: <br><br>`0` - Travel in one direction (e.g. outbound travel).<br>`1` - Travel in the opposite direction (e.g. inbound travel).<hr>*Example: The `trip_headsign` and `direction_id` fields may be used together to assign a name to travel in each direction for a set of trips. A [trips.txt](#tripstxt) file could contain these records for use in time tables:* <br> `trip_id,...,trip_headsign,direction_id` <br> `1234,...,Airport,0` <br> `1505,...,Downtown,1` |
|  `block_id` | ID | Optional | Identifies the block to which the trip belongs. A block consists of a single trip or many sequential trips made using the same vehicle, defined by shared service days and `block_id`. A `block_id` may have trips with different service days, making distinct blocks. See the [example below](#example-blocks-and-service-day) |
|  `shape_id` | Foreign ID referencing `shapes.shape_id` | **Conditionally Required** | Identifies a geospatial shape describing the vehicle travel path for a trip. <br><br>Conditionally Required: <br>- **Required** if the trip has a continuous pickup or drop-off behavior defined either in `routes.txt` or in `stop_times.txt`. <br>- Optional otherwise. |
|  `wheelchair_accessible` | Enum | Optional | Indicates wheelchair accessibility. Valid options are:<br><br>`0` or empty - No accessibility information for the trip.<br>`1` - Vehicle being used on this particular trip can accommodate at least one rider in a wheelchair.<br>`2` - No riders in wheelchairs can be accommodated on this trip. |
|  `bikes_allowed` | Enum | Optional | Indicates whether bikes are allowed. Valid options are:<br><br>`0` or empty - No bike information for the trip.<br>`1` - Vehicle being used on this particular trip can accommodate at least one bicycle.<br>`2` - No bicycles are allowed on this trip. |

