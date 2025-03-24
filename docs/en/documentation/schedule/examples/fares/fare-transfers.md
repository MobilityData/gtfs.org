# Fare Transfers

*Main files: fare\_leg\_rules.txt, fare\_transfer\_rules.txt*

*Example: Translink (Vancouver)*

**Recall ([Fares v2 Features](?tab=t.0#heading=h.o1dhl0gqp9z8)):** Fare Transfers is used to define rules applicable when transferring between legs. The total cost of the journey will be determined by taking into account the fare products for the legs and the fare products for the transfers between them.

Recall: For Translink,

* Transfers are possible for 90mn after the validation of the fare. Transferring between buses during this period is free. Transferring within the same fare zone number supported by the fare is also free.  
* Transferring to a higher number of fare zones only deducts the difference between the fares. This is called an AddFare.

Fare transfers are modeled as follows:

### Create transfer fare products

These fare products represent what the transfers cost.  
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

### Create the transfers

Transfers exist in fare\_transfer\_rules.txt.

   1. Assign values to from\_leg\_group\_id and to\_leg\_group\_id. These are foreign keys referencing leg\_group\_id from fare\_leg\_rules.txt. They reference respectively the start leg of the transfer and the end leg of the transfer  
   2. Set  duration\_limit to the number of seconds for which the transfer remains valid.  
      In Translink’s case it’s 5400 seconds, which is equivalent to 90 minutes. If there is no time limit on transfers, do not add duration\_limit.  
   3. If you have set duration\_limit, you have to include duration\_limit\_type, which describes how to calculate the bounds of duration\_limit.   
      In Translink’s case, The duration\_limit\_type is set to 1 since the transfer time starts when the rider departs on any route in the flat\_fare\_leg fare leg and ends when they depart on a different fare leg.  
   4. Set fare\_transfer\_type to explain how the fare is calculated.  
      In Translink’s case, the fare\_transfer\_type is set to 0\. This is also called an A \+ AB transfer, where the rider pays the first leg fare (A) plus a transfer fare to B (AB).  
   5. If you have a limit on the number of transfers, set transfer\_count. This field is required for transfers where from\_leg\_group\_id=to\_leg\_group\_id and forbidden otherwise. In this case, transfer\_count is set to \-1 since there is no limit on the number of transfers permitted.  

[Consult the documentation](https://gtfs.org/documentation/schedule/reference/#fare_transfer_rulestxt) to learn more about the different values for transfer rules.

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

### Enable Nonconsecutive Transfers

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

The second possibility gives the lowest possible (and correct) fare for the eligible fare product*.  
To enable nonconsecutive transfers, set `nonconsecutive_transfers_allowed=1` in `fare_transfer_rules.txt` which. This allows the search for all possible combinations to find the optimal price.

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