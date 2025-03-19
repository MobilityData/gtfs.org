# Time-based fares

## Main files: fare\_leg\_rules.txt, areas.txt, stop\_areas.txt Example: Translink (Vancouver)

**Recall ([Fares v2 Features](?tab=t.0#heading=h.o1dhl0gqp9z8)):** Time-Based Fares assigns different fares to journeys based on different times of the day of different weekdays. This fare feature models peak/off-peak fares and fare updates for special occasions.

Recall: Translink offers reduced fares during the evening (6:30pm to 3am) and on weekends. All SkyTrain and Seabus fares become a one zone fare (3.20$). Travel from Sea Island during the evening and weekends costs 8.20$ (the 5$ surcharge \+ one zone fare of 3.20$).

This can be modeled using the file `timeframes.txt`. The cheaper time-based fares (fare products and fare leg rules) will be added to all the fare products that were created in the previous sections (section. [Route-Based fares](?tab=t.0#heading=h.47j0ltwx34j3), section. [Zone-Based fares](?tab=t.0#heading=h.6a6lgwt3uh85)).

Time-Based fares are created as follows:

1. **Create timeframes**

	In timeframes.txt, add the different timeframes that allow the modeling of the fare rules

1. Timeframe\_group\_id: Unique id for the timeframe  
2. start\_time: When the timeframe for the special fare starts  
3. end\_time: when the timeframe for the special fare ends.  
4. service\_id: A foreign key referencing a service\_id from calendar.txt or calendar\_dates.txt. This allows the Time-based fare to be matched to a service day or a range of service days.  
5. [Consult the documentation](https://gtfs.org/documentation/schedule/reference/#timeframestxt) to read more about timeframe.txt and how to set it up.  
6. Note:  
   1. end\_time is not included in the timeframe. Eg: If end\_time=12:00:00, then the timeframe ends at 11:59:59.  
   2. start\_time and end\_time values over 24:00:00 are forbidden. If a timeframe spans across midnight, then it should be split at midnight into two timeframe rows. They can have the same timeframe\_group\_id

First, we have to restrict all of the available zone fares to daytime (3am to 6:30pm) and weekdays only.

First, the weekday and weekend services are separately created in `calendar.txt`

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

2\. **Add the fare products and fare leg rules associated with the Time-based fares**

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

	3\. **Simplify using rule\_priority**

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

### 

7) ### Fare Transfers

## Main files: fare\_leg\_rules.txt, fare\_transfer\_rules.txt Example: Translink (Vancouver)

**Recall ([Fares v2 Features](?tab=t.0#heading=h.o1dhl0gqp9z8)):** Fare Transfers is used to define rules applicable when transferring between legs. The total cost of the journey will be determined by taking into account the fare products for the legs and the fare products for the transfers between them.

Recall: For Translink,

* Transfers are possible for 90mn after the validation of the fare. Transferring between buses during this period is free. Transferring within the same fare zone number supported by the fare is also free.  
* Transferring to a higher number of fare zones only deducts the difference between the fares. This is called an AddFare.

Fare transfers are modeled as follows:

1. **Create the fare products for the transfers.** These fare products represent what the transfers cost.  
   In Translink’s case, when transferring under a certain time window (90min) from a 1-zone leg (eg: Zone 1 to Zone 1), to a 2-zone leg (Zone 1 to Zone 2), the difference between the legs is paid. So the rider pays an additional 2\_zone\_fare \- 1\_zone\_fare \= 4.65 \- 3.20 \= 1.45 CAD  
   1. Create the fare products that represent the costs for transferring to a more expensive leg.  
   2. Do not create fare products for free transfers (eg: transferring from 1-zone leg to 1-zone leg, transferring from 3-zone leg to 1-zone leg, etc)

`fare_products.txt`

| fare\_product\_id | fare\_product\_name | amount | currency | fare\_media\_id |
| :---- | :---- | :---- | :---- | :---- |
| … | … | … | … | … |
| 1\_zone\_to\_2\_zone\_upgrade | AddFare 1 zone  to 2 zones upgrade | 1,45 | CAD | contactless |
| 2\_zone\_to\_3\_zone\_upgrade | AddFare 2 zones  to 3 zones upgrade | 1.70 | CAD | contactless |
| 1\_zone\_to\_3\_zone\_upgrade | AddFare 1 zone  to 3 zones upgrade | 3.15 | CAD | contactless |

2. **Create the transfers.**  
   Transfers exist in fare\_transfer\_rules.txt.  
   1. Assign values to from\_leg\_group\_id and to\_leg\_group\_id. These are foreign keys referencing leg\_group\_id from fare\_leg\_rules.txt. They reference respectively the start leg of the transfer and the end leg of the transfer  
   2. Set  duration\_limit to the number of seconds for which the transfer remains valid.  
      In Translink’s case it’s 5400 seconds, which is equivalent to 90 minutes. If there is no time limit on transfers, do not add duration\_limit.  
   3. If you have set duration\_limit, you have to include duration\_limit\_type, which describes how to calculate the bounds of duration\_limit.   
      In Translink’s case, The duration\_limit\_type is set to 1 since the transfer time starts when the rider departs on any route in the flat\_fare\_leg fare leg and ends when they depart on a different fare leg.  
   4. Set fare\_transfer\_type to explain how the fare is calculated.  
      In Translink’s case, the fare\_transfer\_type is set to 0\. This is also called an A \+ AB transfer, where the rider pays the first leg fare (A) plus a transfer fare to B (AB).  
   5. If you have a limit on the number of transfers, set transfer\_count. This field is required for transfers where from\_leg\_group\_id=to\_leg\_group\_id and forbidden otherwise. In this case, transfer\_count is set to \-1 since there is no limit on the number of transfers permitted.  
   6. [Consult the documentation](https://gtfs.org/documentation/schedule/reference/#fare_transfer_rulestxt) to learn more about the different values for transfer rules.

`fare_transfer_rules.txt`

| from\_leg\_group\_id | from\_leg\_group\_id | duration\_limit | duration\_limit\_type | fare\_transfer\_type | fare\_product\_id |
| :---- | :---- | :---- | :---- | :---- | :---- |
| flat\_fare\_leg | flat\_fare\_leg | 5400 | 1 | 0 |  |
| ZN1\_ZN1 | flat\_fare\_leg | 5400 | 1 | 0 |  |
| flat\_fare\_leg | ZN1\_ZN1 | 5400 | 1 | 0 |  |
| ZN1\_ZN2 | flat\_fare\_leg | 5400 | 1 | 0 |  |
| flat\_fare\_leg | ZN1\_ZN2 | 5400 | 1 | 0 | 1\_zone\_to\_2\_zone\_upgrade |
| ZN2\_ZN2 | flat\_fare\_leg | 5400 | 1 | 0 |  |
| flat\_fare\_leg | ZN2\_ZN2 | 5400 | 1 | 0 |  |
| … | … | … | … | … | … |
| ZN1\_ZN1 | ZN1\_ZN2 | 5400 | 1 | 0 | 1\_zone\_to\_2\_zone\_upgrade |
| ZN1\_ZN1 | ZN1\_ZN3 | 5400 | 1 | 0 | 1\_zone\_to\_3\_zone\_upgrade |
| ZN1\_ZN2 | ZN2\_ZN2 | 5400 | 1 | 0 |  |
| ZN1\_ZN2 | ZN1\_ZN2 | 5400 | 1 | 0 |  |
| ZN1\_ZN2 | ZN2\_ZN3 | 5400 | 1 | 0 | 2\_zone\_to\_3\_zone\_upgrade |
| … | … | … | … | … | … |

3. **Enable Nonconsecutive Transfers**  
   This step is required for some cases. In certain fare structures, nonconsecutive transfers have to be taken into account. The first leg of a journey can influence a third or fourth leg of a journey.  
   Recall: Translink has a validity window of 90min. Eg: If a rider starts a journey from Zone 1 to Zone 2 (2-zone fare paid), then goes from Zone 2 to Zone 2 (0 transfer fee paid), then finally from Zone 2 back to Zone 1, the rider only pays the first 2-zone fare.  
   Example:  
   How much does the following 80min journey cost?   
   **Leg1**: from Lonsdale Quay (Zone 2\) to Waterfront Station (Zone 1\) using the Seabus: a 2-zone fare  
   **Leg2**: from Waterfront Station (Zone 1\) to Commercial-Broadway Station (Zone 1\) using SkyTrain: a 1-zone fare  
   **Leg3**: from Commercial-Broadway Station (Zone 1\) to Lake City Way Station (Zone 2\) using SkyTrain: a 2-zone fare  
   Under Translink, this journey should cost only one 2-zone fare (4.65 CAD).  
   If nonconsecutive transfers are not enabled, the final fare will be:  
   Leg 1 (2-zone fare) \+ transfer from Leg 1 (2-zone fare) to Leg 2 (1-zone fare) \+ transfer from Leg 2 (1-zone fare) to Leg 3 (2-zone fare) \= 4.65$ \+ 0$ \+ 1.65$ \= 6.30$  
   This is incorrect. Therefore, nonconsecutive transfers have to be enabled in order to show all the fare possibilities. Nonconsecutive transfers apply the transfer rule to both consecutive and nonconsecutive legs.  
   With nonconsecutive transfers, another fare possibility arises:  
   Leg 1 (2-zone fare) \+ transfer from Leg 1 (2-zone fare) to Leg 2 (1-zone leg) \+ transfer from *Leg 1 (2-zone fare*) to Leg 3 (2-zone fare) \= 4.65$ \+ 0$ \+ 0$ \= 4.65$  
   The second possibility gives the lowest possible (and correct) fare.  
1. To enable nonconsecutive transfers, set `nonconsecutive_transfers_allowed=1` in `fare_transfer_rules.txt` which. This allows the search for all possible combinations to find the optimal price.

`fare_transfer_rules.txt`

| from\_leg\_group\_id | from\_leg\_group\_id | duration\_limit | duration\_limit\_type | fare\_transfer\_type | fare\_product\_id | nonconsecutive\_transfers\_allowed |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat\_fare\_leg | flat\_fare\_leg | 5400 | 1 | 0 |  | 1 |
| ZN1\_ZN1 | flat\_fare\_leg | 5400 | 1 | 0 |  | 1 |
| flat\_fare\_leg | ZN1\_ZN1 | 5400 | 1 | 0 |  | 1 |
| ZN1\_ZN2 | flat\_fare\_leg | 5400 | 1 | 0 |  | 1 |
| flat\_fare\_leg | ZN1\_ZN2 | 5400 | 1 | 0 | 1\_zone\_to\_2\_zone\_upgrade | 1 |
| ZN2\_ZN2 | flat\_fare\_leg | 5400 | 1 | 0 |  | 1 |
| flat\_fare\_leg | ZN2\_ZN2 | 5400 | 1 | 0 |  | 1 |
| … | … | … | … | … | … | 1 |
| ZN1\_ZN1 | ZN1\_ZN2 | 5400 | 1 | 0 | 1\_zone\_to\_2\_zone\_upgrade | 1 |
| ZN1\_ZN1 | ZN1\_ZN3 | 5400 | 1 | 0 | 1\_zone\_to\_3\_zone\_upgrade | 1 |
| ZN1\_ZN2 | ZN2\_ZN2 | 5400 | 1 | 0 |  | 1 |
| ZN1\_ZN2 | ZN1\_ZN2 | 5400 | 1 | 0 |  | 1 |
| ZN1\_ZN2 | ZN2\_ZN3 | 5400 | 1 | 0 | 2\_zone\_to\_3\_zone\_upgrade | 1 |
| … | … | … | … | … | … | 1 |
