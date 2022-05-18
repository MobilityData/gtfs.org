### calendar_dates.txt

File: **Conditionally Required**

Primary key (`service_id`, `date`)

The [calendar_dates.txt](#calendar_datestxt) table explicitly activates or disables service by date. It may be used in two ways.

* Recommended: Use [calendar_dates.txt](#calendar_datestxt) in conjunction with [calendar.txt](#calendartxt) to define exceptions to the default service patterns defined in [calendar.txt](#calendartxt). If service is generally regular, with a few changes on explicit dates (for instance, to accommodate special event services, or a school schedule), this is a good approach. In this case `calendar_dates.service_id` is a foreign ID referencing `calendar.service_id`.
* Alternate: Omit [calendar.txt](#calendartxt), and specify each date of service in [calendar_dates.txt](#calendardatestxt). This allows for considerable service variation and accommodates service without normal weekly schedules. In this case `service_id` is an ID.

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
|  `service_id` | Foreign ID referencing `calendar.service_id` or ID | **Required** | Identifies a set of dates when a service exception occurs for one or more routes. Each (`service_id`, `date`) pair may only appear once in [calendar_dates.txt](#calendar_datestxt) if using [calendar.txt](#calendartxt) and [calendar_dates.txt](#calendar_datestxt) in conjunction. If a `service_id` value appears in both [calendar.txt](#calendartxt) and [calendar_dates.txt](#calendar_datestxt), the information in [calendar_dates.txt](#calendardatestxt) modifies the service information specified in [calendar.txt](#calendartxt). |
|  `date` | Date | **Required** | Date when service exception occurs. |
|  `exception_type` | Enum | **Required** | Indicates whether service is available on the date specified in the date field. Valid options are:<br><br> `1` - Service has been added for the specified date.<br>`2` - Service has been removed for the specified date.<hr>*Example: Suppose a route has one set of trips available on holidays and another set of trips available on all other days. One `service_id` could correspond to the regular service schedule and another `service_id` could correspond to the holiday schedule. For a particular holiday, the [calendar_dates.txt](#calendar_datestxt) file could be used to add the holiday to the holiday `service_id` and to remove the holiday from the regular `service_id` schedule.* |

