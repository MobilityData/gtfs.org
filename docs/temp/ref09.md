## Dataset Files

This specification defines the following files:

|  File Name | Presence | Description |
|  ------ | ------ | ------ |
|  [agency.txt](#agencytxt) | **Required** | Transit agencies with service represented in this dataset. |
|  [stops.txt](#stopstxt) | **Required** | Stops where vehicles pick up or drop off riders. Also defines stations and station entrances.  |
|  [routes.txt](#routestxt) | **Required** | Transit routes. A route is a group of trips that are displayed to riders as a single service. |
|  [trips.txt](#tripstxt)  | **Required** | Trips for each route. A trip is a sequence of two or more stops that occur during a specific time period. |
|  [stop_times.txt](#stop_timestxt)  | **Required** | Times that a vehicle arrives at and departs from stops for each trip. |
|  [calendar.txt](#calendartxt)  | **Conditionally Required** | Service dates specified using a weekly schedule with start and end dates. <br><br>Conditionally Required:<br> - **Required** unless all dates of service are defined in [calendar_dates.txt](#calendar_datestxt).<br> - Optional otherwise. |
|  [calendar_dates.txt](#calendar_datestxt)  | **Conditionally Required** | Exceptions for the services defined in the [calendar.txt](#calendartxt). <br><br>Conditionally Required:<br> - **Required** if [calendar.txt](#calendartxt) is omitted. In which case [calendar_dates.txt](#calendar_datestxt) must contain all dates of service. <br> - Optional otherwise. |
|  [fare_attributes.txt](#fare_attributestxt)  | Optional | Fare information for a transit agency's routes. |
|  [fare_rules.txt](#fare_rulestxt)  | **Conditionally Required** | Rules to apply fares for itineraries.<br><br>Conditionally Required:<br>- **Required** if [fare_attributes.txt](#fare_attributestxt) is defined.<br>- **Forbidden** otherwise. |
|  [fare_products.txt](#fare_productstxt)  | Optional | To describe the different types of tickets or fares that can be purchased by riders.<br><br>File [fare_products.txt](fare_productstxt) describes fare products that are not represented in [fare_attributes.txt](#fare_attributestxt) and [fare_rules.txt](#fare_rulestxt). As such, the use of [fare_products.txt](#fare_productstxt) is entirely separate from files [fare_attributes.txt](#fare_attributestxt) and [fare_rules.txt](#fare_rulestxt). |
|  [fare_leg_rules.txt](#fare_leg_rulestxt)  | Optional | Fare rules for individual legs of travel.<br><br>File [fare_leg_rules.txt](#fare_leg_rulestxt) provides a more detailed method for modeling fare structures. As such, the use of [fare_leg_rules.txt](#fare_leg_rulestxt) is entirely separate from files [fare_attributes.txt](#fare_attributestxt) and [fare_rules.txt](#fare_rulestxt). |
|  [fare_transfer_rules.txt](#fare_transfer_rulestxt)  | Optional | Fare rules for transfers between legs of travel.<br><br>Along with [fare_leg_rules.txt](#fare_leg_rulestxt), file [fare_transfer_rules.txt](#fare_transfer_rulestxt) provides a more detailed method for modeling fare structures. As such, the use of [fare_transfer_rules.txt](#fare_transfer_rulestxt) is entirely separate from files [fare_attributes.txt](#fare_attributestxt) and [fare_rules.txt](#fare_rulestxt). |
|  [areas.txt](areastxt) | Optional | Area grouping of locations. |
|  [stop_areas.txt](stop_areastxt) | Optional | Rules to assign stops to areas. |
|  [shapes.txt](#shapestxt)  | Optional | Rules for mapping vehicle travel paths, sometimes referred to as route alignments. |
|  [frequencies.txt](#frequenciestxt)  | Optional | Headway (time between trips) for headway-based service or a compressed representation of fixed-schedule service. |
|  [transfers.txt](#transferstxt)  | Optional | Rules for making connections at transfer points between routes. |
|  [pathways.txt](#pathwaystxt)  | Optional | Pathways linking together locations within stations. |
|  [levels.txt](#levelstxt)  | **Conditionally Required** | Levels within stations.<br><br>Conditionally Required:<br>- **Required** when describing pathways with elevators (`pathway_mode=5`).<br>- Optional otherwise. |
|  [translations.txt](#translationstxt)  | Optional | Translations of customer-facing dataset values. |
|  [feed_info.txt](#feed_infotxt)  | Optional | Dataset metadata, including publisher, version, and expiration information. |
|  [attributions.txt](#attributionstxt)  | Optional | Dataset attributions. |

