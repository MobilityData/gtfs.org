### fare_attributes.txt

File: **Optional**

Primary key (`fare_id`)

**Versions**<br>
There are two modelling options for describing fares. GTFS-Fares V1 is the legacy option for describing minimal fare information. GTFS-Fares V2 is an updated method that allows for a more detailed account of an agency's fare structure. Both are allowed to be present in a dataset, but only one method should be used by a data consumer for a given dataset. It is recommended that GTFS-Fares V2 takes precedence over GTFS-Fares V1. <br><br>The files associated with GTFS-Fares V1 are: <br>- [fare_attributes.txt](#fare_attributestxt)<br>- [fare_rules.txt](#fare_rulestxt)<br><br>The files associated with GTFS-Fares V2 are: <br>- [fare_products.txt](#fare_productstxt)<br>- [fare_leg_rules.txt](#fare_leg_rulestxt)<br>- [fare_transfer_rules.txt](#fare_transfer_rulestxt)

<br>

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
|  `fare_id` | Unique ID | **Required** | Identifies a fare class. |
|  `price` | Non-negative float | **Required** | Fare price, in the unit specified by `currency_type`. |
|  `currency_type` | Currency code | **Required** | Currency used to pay the fare. |
|  `payment_method` | Enum | **Required** | Indicates when the fare must be paid. Valid options are:<br><br>`0` - Fare is paid on board.<br>`1` - Fare must be paid before boarding. |
|  `transfers` | Enum | **Required** | Indicates the number of transfers permitted on this fare. Valid options are:<br><br>`0` - No transfers permitted on this fare.<br>`1` - Riders may transfer once.<br>`2` - Riders may transfer twice.<br>empty - Unlimited transfers are permitted. |
|  `agency_id` | Foreign ID referencing `agency.agency_id` | **Conditionally Required** | Identifies the relevant agency for a fare. <br><br>Conditionally Required:<br>- **Required** if multiple agencies are defined in `agency.txt`.<br>- Optional otherwise. |
|  `transfer_duration` | Non-negative integer | Optional | Length of time in seconds before a transfer expires. When `transfers`=`0` this field may be used to indicate how long a ticket is valid for or it may be left empty. |

