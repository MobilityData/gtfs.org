# Time-based fares

*Main files: fare_leg_rules.txt, areas.txt, stop_areas.txt*

*Example: Translink (Vancouver)*

**Recall ([Fares v2 Features](../../../../../getting-started/features/overview)):** Time-Based Fares assigns different fares to journeys based on different times of the day of different weekdays. This fare feature models peak/off-peak fares and fare updates for special occasions.

Recall: Translink offers reduced fares during the evening (6:30pm to 3am) and on weekends. All SkyTrain and Seabus fares become a one zone fare (3.20$). Travel from Sea Island during the evening and weekends costs 8.20$ (the 5$ surcharge + one zone fare of 3.20$).

This can be modeled using the file `timeframes.txt`. The cheaper time-based fares (fare products and fare leg rules) will be added to all the fare products that were created in the previous sections (see [Route-Based fares](../route-based-fares) and [Zone-Based fares](../zone-based-fares)).

Time-Based fares are created as follows:

### Create timeframes

	  
In `timeframes.txt`, add the different timeframes that allow the modeling of the fare rules

  1. `timeframe_group_id`: Unique id for the timeframe  
  2. `start_time`: When the timeframe for the special fare starts  
  3. `end_time`: when the timeframe for the special fare ends.  
  4. `service_id`: A foreign key referencing a `service_id` from `calendar.txt` or `calendar_dates.txt`. This allows the Time-based fare to be matched to a service day or a range of service days.  

[Consult the documentation](../../../reference/#timeframestxt) to read more about `timeframes.txt` and how to set it up.  

Note:

* `end_time` is not included in the timeframe. Eg: If `end_time=12:00:00`, then the timeframe ends at 11:59:59.  
* `start_time` and `end_time` values over 24:00:00 are forbidden. If a timeframe spans across midnight, then it should be split at midnight into two timeframe rows. They can have the same `timeframe_group_id`.

First, the weekday and weekend services are separately created in `calendar.txt`

[**calendar.txt**](../../../reference/#calendartxt)

| service_id | monday | tuesday  | wednesday | thursday | friday | saturday | sunday | start_date | end_date |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| weekday_service | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 20250101 | 20251231 |
| weekend_service | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 20250101 | 20251231 |

Then, we create the timeframes in `timeframes.txt`. First a weekday service from 3am to 6:30 pm that will be used for the pre-created Zone-based fares created in the previous section. The weekday evening service is created in two parts since it crosses midnight, from 6:30pm to midnight and from midnight to 3am. Finally create a weekend service for the entire length of the day.

[**timeframes.txt**](../../../reference/#timeframestxt)

| timeframe_group_id | start_time | end_time | service_id |
| :---- | :---- | :---- | :---- |
| weekday_daytime | 03:00:00 | 18:30:00 | weekday_service |
| weekday_evening | 18:30:00 | 24:00:00 | weekday_service |
| weekday_evening | 00:00:00 | 03:00:00 | weekday_service |
| weekend |  |  | weekend_service |

Note that the same `timeframe_group_id` weekday_evening is kept to avoid duplication of fare legs. For "weekend", keep `start_time` and `end_time` empty which means that the timeframe is associated with the whole service (entire weekend).

### Add fare products and fare leg rules

  1. Create the fare products in `fare_products.txt` and the fare leg rules in `fare_leg_rules`.txt.  
    For Translink’s case, there are two fares to add. A one-zone fare and a one-zone Sea Island fare. In this case, both fares already exist (We will simplify them at a later stage).  
  2. Restrict the previous fare legs to weekday daytime timeframes, and the new legs to weekday evening and weekend timeframes, this is done by referencing `from_timeframe_group_id` and `to_timeframe_group_id` in `fare_leg_rules.txt`. For Translink, we assume that only the leg’s start time matters in determining the fare (no further information was found)

In `fare_leg_rules.txt` below, flat_fare_leg was repeated and associated with skytrain_seabus network twice, once for the weekday evening timeframe and once for the weekend timeframe. This allows the association of the one-zone fare to SkyTrain and Seabus on evenings and weekends.

Furthermore, note that flat_fare_sea_island_leg was created to associate the Sea Island SkyTrain legs that depart from sea_island to any zone with a one-zone Sea Island fare (sea_island_1_zone_fare) during evenings and weekends.  
Note: `to_area_id` left empty with the existence of `rule_priority` means that the destination zone (`to_area_id`) does not affect the leg matching

With `rule_priority=1` for Sea Island legs, they keep their priority in applying the additional 5$ fare. Since all fares are 1-zone fares outside of weekday daytime, the additional 5$ applies to the 1-zone fare and the new fare for trips originating from Sea Island is sea_island_1_zone_fare which has an amount of 5 + 3.20 = 8.20$.

[**fare_leg_rules.txt**](../../../reference/#fare_leg_rulestxt) (full file)	

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id | from_timeframe_group_id | to_timeframe_group_id | rule_priority |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | bus | bus_flat_fare |  |  |  |  |  |
| ZN1_ZN1 | skytrain_seabus | 1_zone_fare | ZN1 | ZN1 | weekday_daytime |  |  |
| ZN2_ZN2 | skytrain_seabus | 1_zone_fare | ZN2 | ZN2 | weekday_daytime |  |  |
| ZN3_ZN3 | skytrain_seabus | 1_zone_fare | ZN3 | ZN3 | weekday_daytime |  |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN1 | ZN2 | weekday_daytime |  |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN2 | ZN3 | weekday_daytime |  |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN2 | ZN1 | weekday_daytime |  |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN3 | ZN2 | weekday_daytime |  |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN1 | ZN3 | weekday_daytime |  |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN3 | ZN1 | weekday_daytime |  |  |
| sea_island_ZN1 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN1 | weekday_daytime |  | 1 |
| sea_island_ZN2 | skytrain_seabus | sea_island_1_zone_fare | sea_island | ZN2 | weekday_daytime |  | 1 |
| sea_island_ZN3 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN3 | weekday_daytime |  | 1 |
| sea_island_sea_island | skytrain_seabus | sea_island_sea_island_fare | sea_island | sea_island |  |  | 2 |
| flat_fare_leg | skytrain_seabus | 1_zone_fare |  |  | weekday_evening |  |  |
| flat_fare_leg | skytrain_seabus | 1_zone_fare |  |  | weekend |  |  |
| flat_fare_sea_island_leg | skytrain_seabus | sea_island_1_zone_fare | sea_island |  | weekday_evening |  | 1 |
| flat_fare_sea_island_leg | skytrain_seabus | sea_island_1_zone_fare | sea_island |  | weekend |  | 1 |

### Simplify using rule_priority

Since the evening/weekend fare is the same as a flat fare/one-zone fare, further simplification can be achieved using `rule_priority`.

  1. Assign a higher priority to evening/weekend legs.  
  2. Remove the timeframe association to weekday daytime legs.

By setting a higher `rule_priority` for the evening and weekend legs, and leaving the `rule_priority` field empty for the weekday daytime legs (which interprets it as 0), the evening and weekend legs are prioritized when they are in effect (in their timeframes). This will lead to the calculation of the correct fare.

- `flat_fare_leg` during evenings and weekends is assigned `rule_priority=1` so that it takes precedence over all other flat fare legs or zone-based legs. So when the fare is inside the timeframe weekday_evening or weekend, the flat fare leg is selected on top of all other legs (excluding Sea Island) since it’s prioritized.  
- `flat_fare_leg_sea_island` during evenings and weekends is assigned `rule_priority=2` so that it is prioritized over other legs originating from Sea Island (whole `rule_priority` is already 1 from the previous Zone-Based Fares section) during these timeframes.  
- For `sea_island_sea_island_leg`, the `rule_priority` is increased to 3 so that it is prioritized over all other legs that match `from_area_id=sea_island` and `to_area_it=sea_island` at all times. This guarantees the free fare within Sea Island at all times.

**Updated [fare_leg_rules.txt](../../../reference/#fare_leg_rulestxt) (full file)**

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id | from_timeframe_group_id | to_timeframe_group_id | rule_priority |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | bus | bus_flat_fare |  |  |  |  |  |
| ZN1_ZN1 | skytrain_seabus | 1_zone_fare | ZN1 | ZN1 |  |  |  |
| ZN2_ZN2 | skytrain_seabus | 1_zone_fare | ZN2 | ZN2 |  |  |  |
| ZN3_ZN3 | skytrain_seabus | 1_zone_fare | ZN3 | ZN3 |  |  |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN1 | ZN2 |  |  |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN2 | ZN3 |  |  |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN2 | ZN1 |  |  |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN3 | ZN2 |  |  |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN1 | ZN3 |  |  |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN3 | ZN1 |  |  |  |
| sea_island_ZN1 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN1 |  |  | 1 |
| sea_island_ZN2 | skytrain_seabus | sea_island_1_zone_fare | sea_island | ZN2 |  |  | 1 |
| sea_island_ZN3 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN3 |  |  | 1 |
| sea_island_sea_island | skytrain_seabus | sea_island_sea_island_fare | sea_island | sea_island |  |  | 3 |
| flat_fare_leg | skytrain_seabus | 1_zone_fare |  |  | weekday_evening |  | 1 |
| flat_fare_leg | skytrain_seabus | 1_zone_fare |  |  | weekend |  | 1 |
| flat_fare_sea_island_leg | skytrain_seabus | sea_island_1_zone_fare | sea_island |  | weekday_evening |  | 2 |
| flat_fare_sea_island_leg | skytrain_seabus | sea_island_1_zone_fare | sea_island |  | weekend |  | 2 |