### attributions.txt

File: **Optional**

Primary key (`attribution_id`)

The file defines the attributions applied to the dataset.

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
|  `attribution_id` | Unique ID | Optional | Identifies an attribution for the dataset or a subset of it. This is mostly useful for translations. |
|  `agency_id` | Foreign ID referencing `agency.agency_id` | Optional | Agency to which the attribution applies.<br><br>If one `agency_id`, `route_id`, or `trip_id` attribution is defined, the other ones must be empty. If none of them is specified, the attribution will apply to the whole dataset. |
|  `route_id` | Foreign ID referencing `routes.route_id`  | Optional | Functions in the same way as `agency_id` except the attribution applies to a route. Multiple attributions may apply to the same route. |
|  `trip_id` | Foreign ID referencing `trips.trip_id`  | Optional | Functions in the same way as `agency_id` except the attribution applies to a trip. Multiple attributions may apply to the same trip. |
|  `organization_name` | Text | **Required** | Name of the organization that the dataset is attributed to. |
|  `is_producer` | Enum | Optional | The role of the organization is producer. Valid options are:<br><br>`0` or empty - Organization doesn’t have this role.<br>`1` - Organization does have this role.<br><br>At least one of the fields `is_producer`, `is_operator`, or `is_authority` should be set at `1`. |
|  `is_operator` | Enum | Optional | Functions in the same way as `is_producer` except the role of the organization is operator. |
|  `is_authority` | Enum | Optional | Functions in the same way as `is_producer` except the role of the organization is authority. |
|  `attribution_url` | URL | Optional | URL of the organization. |
|  `attribution_email` | Email | Optional | Email of the organization. |
|  `attribution_phone` | Phone number | Optional | Phone number of the organization. |
