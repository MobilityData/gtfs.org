### calendar.txt

File: **Conditionally Required**

Primary key (`service_id`)

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ |------ |
|  `service_id` | Unique ID | **Required** | Identifies a set of dates when service is available for one or more routes. Each `service_id` value must be unique in a [calendar.txt](#calendartxt) file. |
|  `monday` | Enum | **Required** | Indicates whether the service operates on all Mondays in the date range specified by the `start_date` and `end_date` fields. Note that exceptions for particular dates may be listed in [calendar_dates.txt](#calendar_datestxt). Valid options are:<br><br>`1` - Service is available for all Mondays in the date range.<br>`0` - Service is not available for Mondays in the date range. |
|  `tuesday` | Enum | **Required** | Functions in the same way as `monday` except applies to Tuesdays |
|  `wednesday` | Enum | **Required** | Functions in the same way as `monday` except applies to Wednesdays  |
|  `thursday` | Enum | **Required** | Functions in the same way as `monday` except applies to Thursdays  |
|  `friday` | Enum | **Required** | Functions in the same way as `monday` except applies to Fridays  |
|  `saturday` | Enum | **Required** | Functions in the same way as `monday` except applies to Saturdays. |
|  `sunday` | Enum | **Required** | Functions in the same way as `monday` except applies to Sundays. |
|  `start_date` | Date | **Required** | Start service day for the service interval. |
|  `end_date` | Date | **Required** | End service day for the service interval. This service day is included in the interval. |

