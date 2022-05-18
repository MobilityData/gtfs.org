### transfers.txt

File: **Optional**

Primary key (`from_stop_id`, `to_stop_id`, `from_trip_id`, `to_trip_id`, `from_route_id`, `to_route_id`)

When calculating an itinerary, GTFS-consuming applications interpolate transfers based on allowable time and stop proximity. [Transfers.txt](#transferstxt) specifies additional rules and overrides for selected transfers.

Fields `from_trip_id`, `to_trip_id`, `from_route_id` and `to_route_id` allow higher orders of specificity for transfer rules. Along with `from_stop_id` and `to_stop_id`, the ranking of specificity is as follows:

1. Both `trip_id`s defined: `from_trip_id` and `to_trip_id`.
2. One `trip_id` and `route_id` set defined: (`from_trip_id` and `to_route_id`) or (`from_route_id` and `to_trip_id`).
3. One `trip_id` defined: `from_trip_id` or `to_trip_id`.
4. Both `route_id`s defined: `from_route_id` and `to_route_id`.
5. One `route_id` defined: `from_route_id` or `to_route_id`.
6. Only `from_stop_id` and `to_stop_id` defined: no route or trip related fields set.

For a given ordered pair of arriving trip and departing trip, the transfer with the greatest specificity that applies between these two trips is chosen. For any pair of trips, there should not be two transfers with equally maximal specificity that could apply.

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
|  `from_stop_id` | Foreign ID referencing `stops.stop_id` | **Required** | Identifies a stop or station where a connection between routes begins. If this field refers to a station, the transfer rule applies to all its child stops. |
|  `to_stop_id` | Foreign ID referencing `stops.stop_id` | **Required** | Identifies a stop or station where a connection between routes ends. If this field refers to a station, the transfer rule applies to all child stops. |
| `from_route_id`  | Foreign ID referencing `routes.route_id` | Optional | Identifies a route where a connection begins.<br><br>If `from_route_id` is defined, the transfer will apply to the arriving trip on the route for the given `from_stop_id`.<br><br>If both `from_trip_id` and `from_route_id` are defined, the `trip_id` must belong to the `route_id`, and `from_trip_id` will take precedence. |
| `to_route_id`  | Foreign ID referencing `routes.route_id` | Optional | Identifies a route where a connection ends.<br><br>If `to_route_id` is defined, the transfer will apply to the departing trip on the route for the given `to_stop_id`.<br><br>If both `to_trip_id` and `to_route_id` are defined, the `trip_id` must belong to the `route_id`, and `to_trip_id` will take precedence. |
| `from_trip_id`  | Foreign ID referencing `trips.trip_id` | Optional | Identifies a trip where a connection between routes begins.<br><br>If `from_trip_id` is defined, the transfer will apply to the arriving trip for the given `from_stop_id`.<br><br>If both `from_trip_id` and `from_route_id` are defined, the `trip_id` must belong to the `route_id`, and `from_trip_id` will take precedence. |
| `to_trip_id`  | Foreign ID referencing `trips.trip_id` | Optional | Identifies a trip where a connection between routes ends.<br><br>If `to_trip_id` is defined, the transfer will apply to the departing trip for the given `to_stop_id`.<br><br>If both `to_trip_id` and `to_route_id` are defined, the `trip_id` must belong to the `route_id`, and `to_trip_id` will take precedence. |
|  `transfer_type` | Enum | **Required** | Indicates the type of connection for the specified (`from_stop_id`, `to_stop_id`) pair. Valid options are:<br><br> `0` or empty - Recommended transfer point between routes.<br>`1` - Timed transfer point between two routes. The departing vehicle is expected to wait for the arriving one and leave sufficient time for a rider to transfer between routes.<br>`2` - Transfer requires a minimum amount of time between arrival and departure to ensure a connection. The time required to transfer is specified by `min_transfer_time`.<br>`3` - Transfers are not possible between routes at the location. |
|  `min_transfer_time` | Non-negative integer | Optional | Amount of time, in seconds, that must be available to permit a transfer between routes at the specified stops. The `min_transfer_time` should be sufficient to permit a typical rider to move between the two stops, including buffer time to allow for schedule variance on each route. |

