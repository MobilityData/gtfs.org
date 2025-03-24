# Time-based fares

*Main files: fare\_leg\_rules.txt, areas.txt, stop\_areas.txt*

*Example: Translink (Vancouver)*

**Recall ([Fares v2 Features](?tab=t.0#heading=h.o1dhl0gqp9z8)):** Time-Based Fares assigns different fares to journeys based on different times of the day of different weekdays. This fare feature models peak/off-peak fares and fare updates for special occasions.

Recall: Translink offers reduced fares during the evening (6:30pm to 3am) and on weekends. All SkyTrain and Seabus fares become a one zone fare (3.20$). Travel from Sea Island during the evening and weekends costs 8.20$ (the 5$ surcharge \+ one zone fare of 3.20$).

This can be modeled using the file `timeframes.txt`. The cheaper time-based fares (fare products and fare leg rules) will be added to all the fare products that were created in the previous sections (section. [Route-Based fares](?tab=t.0#heading=h.47j0ltwx34j3), section. [Zone-Based fares](?tab=t.0#heading=h.6a6lgwt3uh85)).

Time-Based fares are created as follows:

### Create timeframes

	  
In timeframes.txt, add the different timeframes that allow the modeling of the fare rules

  1. Timeframe\_group\_id: Unique id for the timeframe  
  2. start\_time: When the timeframe for the special fare starts  
  3. end\_time: when the timeframe for the special fare ends.  
  4. service\_id: A foreign key referencing a service\_id from calendar.txt or calendar\_dates.txt. This allows the Time-based fare to be matched to a service day or a range of service days.  

[Consult the documentation](https://gtfs.org/documentation/schedule/reference/#timeframestxt) to read more about timeframe.txt and how to set it up.  

Note:

* end\_time is not included in the timeframe. Eg: If end\_time=12:00:00, then the timeframe ends at 11:59:59.  
* start\_time and end\_time values over 24:00:00 are forbidden. If a timeframe spans across midnight, then it should be split at midnight into two timeframe rows. They can have the same timeframe\_group\_id

First, the weekday and weekend services are separately created in `calendar.txt`

`calendar.txt`

| service\_id | monday | tuesday  | wednesday | thursday | friday | saturday | sunday | start\_date | end\_date |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| weekday\_service | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 20250101 | 20251231 |
| weekend\_service | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 20250101 | 20251231 |

Then, we create the timeframes in `timeframes.txt`. First a weekday service from 3am to 6:30 pm that will be used for the pre-created Zone-based fares created in the previous section. The weekday evening service is created in two parts since it crosses midnight, from 6:30pm to midnight and from midnight to 3am. Finally create a weekend service for the entire length of the day.

`timeframes.txt`

| timeframe\_group\_id | start\_time | end\_time | service\_id |
| :---- | :---- | :---- | :---- |
| weekday\_daytime | 03:00:00 | 18:30:00 | weekday\_service |
| weekday\_evening | 18:30:00 | 24:00:00 | weekday\_service |
| weekday\_evening | 00:00:00 | 03:00:00 | weekday\_service |
| weekend |  |  | weekend\_service |

Note that the same timeframe\_group\_id `weekday_evening` is kept to avoid duplication of fare legs. For “weekend”, keep start\_time and end\_time empty which means that the timeframe is associated with the whole service (entire weekend).

### Add fare products and fare leg rules

  1. Create the fare products in fare\_products.txt and the fare leg rules in fare\_leg\_rules.txt.  
    For Translink’s case, there are two fares to add. A one-zone fare and a one-zone Sea Island fare. In this case, both fares already exist. (We will simplify them at a later stage.)  
  2. Restrict the previous fare legs to weekday daytime timeframes, and the new legs to weekday evening and weekend timeframes, This is done by referencing from\_timeframe\_group\_id and to\_timeframe\_group\_id in fare\_leg\_rules.txt. For Translink, we assume that only the leg’s start time matters in determining the fare (no further information was found)

In fare\_leg\_rules.txt below, flat\_fare\_leg was repeated and associated with skytrain\_seabus network twice, once for the weekday evening timeframe and once for the weekend timeframe. This allows the association of the one-zone fare to SkyTrain and Seabus on evenings and weekends.

Furthermore, note that flat\_fare\_sea\_island\_leg was created to associate the Sea Island SkyTrain legs that depart from sea\_island to any zone with a one-zone Sea Island fare (sea\_island\_1\_zone\_fare) during evenings and weekends.  
Note: to\_area\_id left empty with the existence of rule\_priority means that the destination zone (to\_area\_id) does not affect the leg matching

With `rule_priority=1` for Sea Island legs, they keep their priority in applying the additional 5$ fare. Since all fares are 1-zone fares outside of weekday daytime, the additional 5$ applies to the 1-zone fare and the new fare for trips originating from Sea Island is `sea_island_1_zone_fare` which has an amount of 5 \+ 3.20 \= 8.20$.

`fare_leg_rules.txt (full file)`	

| leg\_group\_id | network\_id | fare\_product\_id | from\_area\_id | to\_area\_id | from\_timeframe\_group\_id | to\_timeframe\_group\_id | rule\_priority |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat\_fare\_leg | bus | bus\_flat\_fare |  |  |  |  |  |
| ZN1\_ZN1 | skytrain\_seabus | 1\_zone\_fare | ZN1 | ZN1 | weekday\_daytime |  |  |
| ZN2\_ZN2 | skytrain\_seabus | 1\_zone\_fare | ZN2 | ZN2 | weekday\_daytime |  |  |
| ZN3\_ZN3 | skytrain\_seabus | 1\_zone\_fare | ZN3 | ZN3 | weekday\_daytime |  |  |
| ZN1\_ZN2 | skytrain\_seabus | 2\_zone\_fare | ZN1 | ZN2 | weekday\_daytime |  |  |
| ZN2\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN2 | ZN3 | weekday\_daytime |  |  |
| ZN1\_ZN2 | skytrain\_seabus | 2\_zone\_fare | ZN2 | ZN1 | weekday\_daytime |  |  |
| ZN2\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN3 | ZN2 | weekday\_daytime |  |  |
| ZN1\_ZN3 | skytrain\_seabus | 3\_zone\_fare | ZN1 | ZN3 | weekday\_daytime |  |  |
| ZN1\_ZN3 | skytrain\_seabus | 3\_zone\_fare | ZN3 | ZN1 | weekday\_daytime |  |  |
| sea\_island\_ZN1 | skytrain\_seabus | sea\_island\_2\_zone\_fare | sea\_island | ZN1 | weekday\_daytime |  | 1 |
| sea\_island\_ZN2 | skytrain\_seabus | sea\_island\_1\_zone\_fare | sea\_island | ZN2 | weekday\_daytime |  | 1 |
| sea\_island\_ZN3 | skytrain\_seabus | sea\_island\_2\_zone\_fare | sea\_island | ZN3 | weekday\_daytime |  | 1 |
| sea\_island\_sea\_island | skytrain\_seabus | sea\_island\_sea\_island\_fare | sea\_island | sea\_island |  |  | 2 |
| flat\_fare\_leg | skytrain\_seabus | 1\_zone\_fare |  |  | weekday\_evening |  |  |
| flat\_fare\_leg | skytrain\_seabus | 1\_zone\_fare |  |  | weekend |  |  |
| flat\_fare\_sea\_island\_leg | skytrain\_seabus | sea\_island\_1\_zone\_fare | sea\_island |  | weekday\_evening |  | 1 |
| flat\_fare\_sea\_island\_leg | skytrain\_seabus | sea\_island\_1\_zone\_fare | sea\_island |  | weekend |  | 1 |

### Simplify using rule\_priority

Since the evening/weekend fare is the same as a flat fare/one-zone fare, further simplification can be achieved using rule\_priority.

  1. Assign a higher priority to evening/weekend legs.  
  2. Remove the timeframe association to weekday daytime legs.

By setting a higher rule\_priority for the evening and weekend legs, and leaving the `rule_priority` field empty for the weekday daytime legs (which interprets it as 0), the evening and weekend legs are prioritized when they are in effect (in their timeframes). This will lead to the calculation of the correct fare.

- flat\_fare\_leg during evenings and weekends is assigned rule\_priority=1 so that it takes precedence over all other flat fare legs or zone-based legs. So when the fare is inside the timeframe weekday\_evening or weekend, the flat fare leg is selected on top of all other legs (excluding Sea Island) since it’s prioritized.  
- flat\_fare\_leg\_sea\_island during evenings and weekends is assigned rule\_priority=2 so that it is prioritized over other legs originating from Sea Island (whole rule\_priority is already 1 from the previous Zone-Based Fares section) during these timeframes.  
- For sea\_island\_sea\_island\_leg, the rule\_priority is increased to 3 so that it is prioritized over all other legs that match from\_area\_it=sea\_island and to\_area\_it=sea\_island at all times. This guarantees the free fare within Sea Island at all times.

Updated `fare_leg_rules.txt` (full file)

| leg\_group\_id | network\_id | fare\_product\_id | from\_area\_id | to\_area\_id | from\_timeframe\_group\_id | to\_timeframe\_group\_id | rule\_priority |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat\_fare\_leg | bus | bus\_flat\_fare |  |  |  |  |  |
| ZN1\_ZN1 | skytrain\_seabus | 1\_zone\_fare | ZN1 | ZN1 |  |  |  |
| ZN2\_ZN2 | skytrain\_seabus | 1\_zone\_fare | ZN2 | ZN2 |  |  |  |
| ZN3\_ZN3 | skytrain\_seabus | 1\_zone\_fare | ZN3 | ZN3 |  |  |  |
| ZN1\_ZN2 | skytrain\_seabus | 2\_zone\_fare | ZN1 | ZN2 |  |  |  |
| ZN2\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN2 | ZN3 |  |  |  |
| ZN1\_ZN2 | skytrain\_seabus | 2\_zone\_fare | ZN2 | ZN1 |  |  |  |
| ZN2\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN3 | ZN2 |  |  |  |
| ZN1\_ZN3 | skytrain\_seabus | 3\_zone\_fare | ZN1 | ZN3 |  |  |  |
| ZN1\_ZN3 | skytrain\_seabus | 3\_zone\_fare | ZN3 | ZN1 |  |  |  |
| sea\_island\_ZN1 | skytrain\_seabus | sea\_island\_2\_zone\_fare | sea\_island | ZN1 |  |  | 1 |
| sea\_island\_ZN2 | skytrain\_seabus | sea\_island\_1\_zone\_fare | sea\_island | ZN2 |  |  | 1 |
| sea\_island\_ZN3 | skytrain\_seabus | sea\_island\_2\_zone\_fare | sea\_island | ZN3 |  |  | 1 |
| sea\_island\_sea\_island | skytrain\_seabus | sea\_island\_sea\_island\_fare | sea\_island | sea\_island |  |  | 3 |
| flat\_fare\_leg | skytrain\_seabus | 1\_zone\_fare |  |  | weekday\_evening |  | 1 |
| flat\_fare\_leg | skytrain\_seabus | 1\_zone\_fare |  |  | weekend |  | 1 |
| flat\_fare\_sea\_island\_leg | skytrain\_seabus | sea\_island\_1\_zone\_fare | sea\_island |  | weekday\_evening |  | 2 |
| flat\_fare\_sea\_island\_leg | skytrain\_seabus | sea\_island\_1\_zone\_fare | sea\_island |  | weekend |  | 2 |