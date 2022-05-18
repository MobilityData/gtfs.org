### stop_areas.txt

File: **Optional**

Primary key (`*`)

Assigns stops from [stops.txt](#stopstxt) to areas.

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
| `area_id` | Foreign ID referencing `areas.area_id` | **Required** | Identifies an area to which one or multiple `stop_id`s belong. The same `stop_id` may be defined in many `area_id`s. |
| `stop_id` | Foreign ID referencing `stops.stop_id` | **Required** | Identifies a stop. If a station (i.e. a stop with `stops.location_type=1`) is defined in this field, it is assumed that all of its platforms (i.e. all stops with `stops.location_type=0` that have this station defined as `stops.parent_station`) are part of the same area. This behavior can be overridden by assigning platforms to other areas. |

