# Time-based fares

*Main files: fare_leg_rules.txt, timeframes.txt*  
*Example: [Translink (Vancouver)](../intro/#translink-vancouver)*

!!! info "Reminder"

    Time-Based Fares assign different fares to journeys based on different times of the day of different weekdays. This fare feature models peak/off-peak fares and fare updates for special occasions. For more information revisit the [Features section](../intro/#fares-features-and-their-files) in the Introduction page.

## Create fare products and fare leg rules

Create fare products and fare leg rules. Based on the fare structure, add the relevant fare products and fare leg rules.

* For route-based fares, visit the [Route-Based Fares](../route-based-fares) section.  
* For zone-based fares, visit the [Zone-Based Fares](../zone-based-fares) section.

For this example, both route-based and zone-based fares have been defined for Translink in the Route-Based Fares and Zone-Based Fares sections.

## Create timeframes

Timeframes are the time windows that enclose the periods of different fares. e.g: A timeframe enclosing weekday morning rush hour for peak fares, a timeframe enclosing weekend evening for discounted fares, etc.

Timeframes contain both the days of the week and the times of day under which the fare is valid. They are created in `timeframes.txt` as follows:

1. Fill **timeframe_group_id** with the id for the group of timeframes.  
2. Fill **start_time** with the start time of the timeframe for the special fare  
3. Fill **end_time** with the end time of the timeframe for the special fare  
4. Fill **service_id**: with the ID that references a **service_id** from `calendar.txt` or `calendar_dates.txt`. This allows the Time-based fare to be matched to a service day or a range of service days.

[Consult the documentation](../../../reference/#timeframestxt) to read more about timeframe.txt and how to set it up.

!!! Note  

	The timeframe ends one second before end_time. E.g. If `end_time=11:00:00`, then the timeframe ends at 10:59:59.  
	If a timeframe crosses midnight, then it should be split at midnight into two timeframe rows with the same `timeframe_group_id`. Values over 24:00:00 are forbidden.

!!! info "Reminder"

    Translink offers reduced fares during the evening (6:30 PM to 3:00 AM) and on weekends. All SkyTrain and Seabus fares become a one zone fare (CAD 3.20). Travel from Sea Island during the evening and weekends costs CAD 8.20 (the CAD 5.00 surcharge + one zone fare of CAD 3.20).

This can be modeled using the file `timeframes.txt`. The cheaper time-based fares (fare products and fare leg rules) will be added to all the fare products that were created in the previous sections ([Route-Based fares](../route-based-fares) section, [Zone-Based fares](../zone-based-fares) section).

In this example, three timeframe groups are created. 

First, a `weekday_daytime` timeframe is defined from 3:00 AM to 6:30 PM.

Next, the `weekday_evening` timeframe is split into two parts because it crosses midnight: from 6:30 PM to midnight, and from midnight to 3:00 AM. Both parts are associated with the weekday service.

Finally, a `weekend` timeframe is created to cover the entire day on weekends. For this timeframe, `start_time` and `end_time` are left empty, meaning it applies to the entire duration of the `weekend_service`.

[**timeframes.txt**](../../../reference/#timeframestxt)

| timeframe_group_id | start_time | end_time | service_id |
| :---- | :---- | :---- | :---- |
| weekday_daytime | 03:00:00 | 18:30:00 | weekday_service |
| weekday_evening | 18:30:00 | 24:00:00 | weekday_service |
| weekday_evening | 00:00:00 | 03:00:00 | weekday_service |
| weekend |  |  | weekend_service |

Here's a quick look at `calendar.txt`, showing the service_ids that appear in `timeframes.txt`:

[**calendar.txt**](../../../reference/#calendartxt)

| service_id | monday | tuesday  | wednesday | thursday | friday | saturday | sunday | start_date | end_date |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| weekday_service | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 20250101 | 20251231 |
| weekend_service | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 20250101 | 20251231 |

## Associate fare leg rules to timeframes

Fare leg rules are associated with different timeframes to ensure that leg matching is restricted to the time periods when the fare is applicable. This is done in `fare_leg_rules.txt` as follows:

1. Fill **from_timeframe_group_id** and **to_timeframe_group_id** of the fare leg rule with the ID for the timeframe (or timeframe group) when the fare is applicable.  
   * This is a Foreign Key referencing **timeframe_group_id** from `timeframes.txt`.  
2. Replicate the same **leg_group_id** but with different **from_timeframe_group_id**, **to_timeframe_group_id** and **fare_product_id** to represent legs that have similar matching rules (**network_id**, **from_area_id**, **to_area_id**) but different timeframes and cost.

!!! Note

    For Translink, there's no information on whether a leg's end time affects the fare, so we assume it doesn't. This means if a leg starts during the `weekday_daytime` timeframe, it's treated as part of that timeframe, even if it ends in a different timeframe.

In this example, `flat_fare_leg` was repeated twice, once for the `weekday_evening` timeframe and once for the `weekend` timeframe. This allows the association of the one-zone/flat rate fare to SkyTrain and Seabus on evenings and weekends.

Furthermore, the `flat_fare_sea_island_leg` was created to associate the Sea Island legs that depart from `sea_island` to any zone with a `sea_island_1_zone_fare` during `daytime_evening` and `weekend`.

With `rule_priority=1` for Sea Island legs, they keep their priority in applying the additional CAD 5.00 fare. Since all fares are 1-zone fares outside of weekday daytime, the additional CAD 5.00 applies to the 1-zone fare and the new fare for trips originating from Sea Island is `sea_island_1_zone_fare` which has an amount of CAD 5.00 + CAD 3.20 = CAD 8.20.

!!! Note

    If the column `rule_priority` exists, when `from_area_id` (respectively `to_area_id`) is left empty it means that the origin zone `from_area_id` (respectively the destination zone `to_area_id`) does not affect the matching of the leg. Similarly if one of `from_timeframe_group_id` and `to_timeframe_group_id` is left empty, that field is irrelevant to the matching process.

**[fare_leg_rules.txt](../../../reference/#fare_leg_rulestxt) (full file)**	

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id | from_timeframe_group_id | to_timeframe_group_id | rule_priority |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | translink_bus | bus_flat_fare |  |  |  |  |  |
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

## Simplify using rule_priority

!!! info "Reminder"

    The `rule_priority` field determines the order in which matching rules are applied: rules with higher `rule_priority` values take precedence over those with lower or empty values.

Since the weekday evening and weekend fare is the same as a flat fare or a one-zone fare, further simplification can be achieved using **rule_priority**.

1. Assign a higher priority to evening/weekend legs.  
2. Remove the timeframe association to weekday daytime legs.

In this example, by setting a higher `rule_priority` for the weekday evening and weekend legs, and leaving the `rule_priority` field empty for the weekday daytime legs (which is the same as setting it to 0), the evening and weekend legs are prioritized over the weekday daytime leg when they are in effect (during their timeframes). This will lead to the calculation of the correct fare.

* The leg `flat_fare_leg` during weekday evenings and weekends is assigned `rule_priority=1` so that it takes precedence over all other flat fare legs or zone-based legs. So when the journey takes place inside the timeframe `weekday_evening` or `weekend`, the flat fare leg is selected on top of all other legs (excluding Sea Island legs) since it’s prioritized.  
* The leg `flat_fare_leg_sea_island` during evenings and weekends is assigned `rule_priority=2` so that it is prioritized over other legs originating from Sea Island (whose rule_priority was assigned 1 from the previous [Zone-Based Fares](../zone-based-fares) section) during these timeframes.  
* The leg `sea_island_sea_island_leg` is assigned `rule_priority=3` so that it is prioritized over all other legs that match `from_area_it=sea_island` and `to_area_it=sea_island` at all times. This guarantees the free fare within Sea Island at all times, regardless of any timeframes.

**[fare_leg_rules.txt](../../../reference/#fare_leg_rulestxt) (full file)**	

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id | from_timeframe_group_id | to_timeframe_group_id | rule_priority |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | translink_bus | bus_flat_fare |  |  |  |  |  |
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