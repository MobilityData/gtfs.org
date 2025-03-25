# Modeling Complex Fare Details

Fares v2 can also model additional fare scheme complexities.

| Complex fare detail | Definition | General example | Main files | Agency used as example |
| :---- | :---- | :---- | :---- | :---- |
| Fare product/fare media transfer mechanism | Whether a transfer requires having the same fare product/fare media in order to be permissible. Works in stored value systems. | Using a stored value card allows for a transfer, while using cash on the first leg cannot allow for stored value transfer in the second leg. | `fare_transfer_rules.txt` | SEPTA |
| Joining fare legs | Treating multiple legs as one leg for the purposes of matching. | Transferring between two legs at a station that doesn’t have turnstiles for another validation | `fare_leg_join_rules.txt` | SEPTA |
| Area sets | Groups of zones. This concepts allows for more complex zone structures to be modeled | The fare is determined by the zones that a vehicle passes. The zones might be unstructured. | `Area_sets.txt`, `fare_leg_rules.txt` | Metro Transit |
| Nonconsecutive transfers | Defined [above](?tab=t.0#heading=h.ghu596tn2vja)\* as setting transfer rule applicability to both consecutive and nonconsecutive legs. This allows the search for all possible combinations to find the optimal price. | The fare is determined by considered all the leg crossed and all the possible transfer combinations | `fare_transfer_rules.txt` | Translink ([above](?tab=t.0#heading=h.ghu596tn2vja)) Puget Sound agencies (King County Metro \- Sound Transit \- Community Transit) |

### Fare media transfer mechanism

*Example: SEPTA (Pennsylvania)*

Recall: SEPTA uses four fare media: 

- SEPTA Key (2 transfers covered)  
- Key Tix (1 transfer covered)  
- contactless (2 transfers covered)   
- cash (no transfers covered). 

The rider needs to use “SEPTA Key” or contactless in all 3 legs of a trip to guarantee 2 free transfers.

You need to restrict the possibility of two transfers only for journeys that use “SEPTA Key” or contactless. In this case, a fare product is defined that can be supported only by “SEPTA Key” and contactless.

First, create the fare media “SEPTA Key” and “cEMV”.  
`fare_media.txt`

| fare\_media\_id | fare\_media\_name | fare\_media\_type |
| :---- | :---- | :---- |
| septa\_key | SEPTA Key | 2 |
| contactless | cEMV | 3 |

Then, create the product associated with both of them.  
`fare_products.txt`

| fare\_product\_id | fare\_product\_name | amount | currency | fare\_media\_id |
| :---- | :---- | :---- | :---- | :---- |
| bus\_metro\_key\_contactless | Bus or Metro | 2.00 | USD | septa\_key |
| bus\_metro\_key\_contactless | Bus or Metro | 2.00 | USD | contactless |

Create the leg covered by the product.  
`fare_leg_rules.txt`

| leg\_group\_id | network\_id | fare\_product\_id |
| :---- | :---- | :---- |
| metro\_bus\_leg | metro\_bus | bus\_metro\_key\_contactless |

`network_id=metro_bus` needs to be created in `networks.txt` and associated to all bus and metro routes in `route_networks.txt`.

Then add `fare_product_behavior=0` to `fare_transfer_rules.txt`.

`fare_transfer_rules.txt`

| from\_leg\_group\_id | to\_leg\_group\_id | transfer\_count | duration\_limit | duration\_limit\_type | fare\_transfer\_type | fare\_product\_behavior |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| metro\_bus\_leg | metro\_bus\_leg | 2 | 7200 | 1 | 0 | 0 |

`fare_product_behavior=0` means that the same fare product needs to be used in both legs for the transfer to be valid (and allow for 2 transfers). The fare product in this case is `bus_metro_key_contactless`, which uses “SEPTA Key” or contactless payments.

### Joining fare legs

*Example: SEPTA (Pennsylvania)*

Recall: SEPTA allows a free interchange at three stations (15th St/City Hall, 13th St and Drexel Station at 30th St). At those stations, a rider can transfer from two metro legs without paying an additional fare.  
Essentially, you can consider two legs that transfer at one of those stations as one leg. This can be modeled in v2 using `fare_leg_join_rules.txt`.

The `stop_ids` of the stations in question are already defined in `stops.txt`

`stops.txt`

| stop\_id | stop\_name |
| :---- | :---- |
| 32141 | City Hall \- BSL |
| 32175 | 15th St \- MFL |
| 32176 | Drexel Station at 30th St |
| 21532 | Drexel Station at 30th St |
| … | … |

`fare_leg_join_rules.txt` is used to create entries that join legs that meet at the stop pairs defined above in `stops.txt`. Make sure to include the required `from_network_id` and `to_network_id` fields which reference the network of the legs (Subway/metro in this case).  
`fare_leg_join_rules.txt`

| from\_network\_id | to\_network\_id | from\_stop\_id | to\_stop\_id |
| :---- | :---- | :---- | :---- |
| metro | metro | 32141 | 32175 |
| metro | metro | 32175 | 32141 |
| metro | metro | 32176 | 21532 |
| metro | metro | … | … |

Make sure you write all the stop pairs that are linked freely (without a fare gate)..

### Area sets

*Example: Metro Transit (Minneapolis)*

Recall: Metro Transit has a reduced 0.50$ fare for trips taking place entirely within downtown Minneapolis. This can be modeled in different ways:

* If an entire route/routes have this fare across all stops (ie: the route/s travel entirely within downtown), then create a separate network for the appropriate routes and associate a fare leg with a reduced fare product of 0.50$.  
* If there are only a few stops within downtown, then associate these stops to an area. If you are sure that the downtown section of the route remains entirely within downtown (no popping in and out), then simply create a leg that travels from the downtown area to the downtown area and associate it with a reduced fare product of 0.50$.

This simple example can be modeled using area sets. First, create an area for downtown.

`areas.txt`

| area\_id | area\_name |
| :---- | :---- |
| downtown | Downtown Minneapolis |

Then associate all stops to `downtown` in `stop_areas.txt`.

Then, associate the `downtown` area to an area set.

`area_sets.txt`

| area\_set\_id | area\_id |
| :---- | :---- |
| downtown\_set | downtown |

Then, make sure that the downtown leg is entirely inside downtown.

`fare_leg_rules.txt`

| leg\_group\_id | fare\_product\_id | contains\_exactly\_area\_set\_id | rule\_priority |
| :---- | :---- | :---- | :---- |
| downtown\_leg | reduced\_downtown\_fare | downtown\_set | 1 |
| default\_leg\_peak | default\_fare\_peak |  |  |
| … | … |  |  |

`fare_products.txt`

| fare\_product\_id | fare\_product\_name | amount | currency |
| :---- | :---- | :---- | :---- |
| reduced\_downtown\_fare | Reduced Downtown Fare | 0.50 | USD |
| default\_fare\_peak | Default fare | 2.50 | USD |
| … | … | … | … |

Adding rule priority ensures that a leg that contains downtown and is contained by downtown is prioritized over other legs to provide the reduced fare.

This example is the simplest use of area sets. Other agencies like VRR (Verkehrsverbund Rhein-Ruhr), NJTransit, Ruter and Auckland Transport have more complicated blocks of zones that can be modelled using area sets.

### Nonconsecutive transfers

*Example: ORCA (Puget Sound)*

Recall: For ORCA

- ORCA is a card that allows for [seamless transfers for 2 hours](https://www.soundtransit.org/ride-with-us/know-before-you-go/transferring#:~:text=As%20long%20as%20you%20transfer,toward%20your%20ride%20on%20Link.) between multiple agencies operating in Puget Sound, including King County Metro or KCM (King County \- Seattle), Community Transit (Snohomish county) and Sound Transit (Puget Sound region).  
- A traveller using ORCA only pays the maximum leg fare of all legs considered in the whole journey.  
- The ORCA adult fare for a [King County Metro](https://kingcounty.gov/en/dept/metro/fares-and-payment/prices) bus ride is 2.75$.  
- The ORCA adult fare for the [1Line and 2Line light rail](https://www.soundtransit.org/ride-with-us/how-to-pay/fares) (Sound Transit) is 3$.  
- The ORCA adult fare for a [Community Transit](https://www.communitytransit.org/fares-and-passes) bus ride is 2.5$

Assume that you are using a consolidated GTFS for all the agencies in the region (which exists). The Fare Products and Fare Legs are modeled in the tables below.

`fare_products.txt`

| fare\_product\_id | fare\_product\_name | amount | currency | fare\_media\_id |
| :---- | :---- | :---- | :---- | :---- |
| kcm\_adult\_fare | King County Metro (KCM) adult fare | 2.75 | USD | orca\_card |
| light\_rail\_adult\_fare | Light rail adult fare | 3.00 | USD | orca\_card |
| community\_adult\_fare | Community Transit adult fare | 2.50 | USD | orca\_card |

`fare_leg_rules.txt` (with networks already created in `networks.txt` and `route_networks.txt`)

| leg\_group\_id | fare\_product\_id | network\_id |
| :---- | :---- | :---- |
| kcm\_leg | kcm\_adult\_fare | king\_county\_metro\_routes |
| light\_rail\_leg | light\_rail\_adult\_fare | 1\_line\_2\_line |
| community\_leg | community\_adult\_fare | community\_transit\_routes |

One of the possible ways to represent the max price strategy is to define inter-agency transfers where the transfer from a cheaper agency to a more expensive agency only costs the fare price between the agency fares. that discount the price difference when transferring between two agencies.

`fare_products.txt`

| fare\_product\_id | fare\_product\_name | amount | currency | fare\_media\_id |
| :---- | :---- | :---- | :---- | :---- |
| … | … | … | … | … |
| kcm\_to\_light\_rail | Transfer from KCM to Light Rail | 0.25 | USD | orca\_card |
| light\_rail\_to\_kcm | Transfer from Light Rail to KCM | 0 | USD | orca\_card |
| community\_to\_light\_rail | Transfer from Community Transit to Light Rail | 0.50 | USD | orca\_card |
| light\_rail\_to\_community | Transfer from Light Rail to Community Transit | 0 | USD | orca\_card |
| kcm\_to\_community | Transfer from KCM to Community Transit | 0 | USD | orca\_card |
| community\_to\_kcm | Transfer from Community Transit to KCM | 0.25 | USD | orca\_card |

In `fare_products.txt, amount = first agency fare - second agency fare` 

`fare_transfer_rules.txt`

| from\_leg\_group\_id | to\_leg\_group\_id | duration\_limit | duration\_limit\_type | fare\_transfer\_type | fare\_product\_id |
| :---- | :---- | :---- | :---- | :---- | :---- |
| kcm\_leg | light\_rail\_leg | 3600 | 1 | 0 | kcm\_to\_light\_rail |
| light\_rail\_leg | kcm\_leg | 3600 | 1 | 0 | light\_rail\_to\_kcm |
| community\_leg | light\_rail\_leg | 3600 | 1 | 0 | community\_to\_light\_rail |
| light\_rail\_leg | community\_leg | 3600 | 1 | 0 | light\_rail\_to\_community |
| kcm\_leg | community\_leg | 3600 | 1 | 0 | kcm\_to\_community |
| community\_leg | kcm\_leg | 3600 | 1 | 0 | community\_to\_kcm |

**Example 1:**

Suppose a rider took this journey:

KCM \-\> Community Transit \-\> Light\_Rail

If transfers are considered leg-by-leg, with fare\_transfer\_type=0 (A+AB transfer type\[link\* to documentation\]), the fare is:

2.75 (KCM fare) \+ 0 (KCM to Community) \+ 0.50 (Community to Light Rail) \= 3.25$

This is incorrect, the fare should be 3$ which is the price of the Light Rail. This issue is due to the fact that nonconsecutive transfers should also be counted when looking for an optimal price.

To solve this problem, introduce `nonconsecutive_transfers_allowed`  
`fare_transfer_rules.txt`

| from\_leg\_group\_id | to\_leg\_group\_id | duration\_limit | duration\_limit\_type | fare\_transfer\_type | fare\_product\_id | nonconsecutive\_transfers\_allowed |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| kcm\_leg | light\_rail\_leg | 3600 | 1 | 0 | kcm\_to\_light\_rail | 1 |
| light\_rail\_leg | kcm\_leg | 3600 | 1 | 0 | light\_rail\_to\_kcm | 1 |
| community\_leg | light\_rail\_leg | 3600 | 1 | 0 | community\_to\_light\_rail | 1 |
| light\_rail\_leg | community\_leg | 3600 | 1 | 0 | light\_rail\_to\_community | 1 |
| kcm\_leg | community\_leg | 3600 | 1 | 0 | kcm\_to\_community | 1 |
| community\_leg | kcm\_leg | 3600 | 1 | 0 | community\_to\_kcm | 1 |

With `nonconsecutive_transfers_allowed=1,` the transfer rule is applied to both consecutive and nonconsecutive legs. This allows Trip Planning applications (GTFS consumers) to list all possible combinations and then display the optimal (lowest) price to riders.

First combination is the regular consecutive transfer rule

2.75 (KCM fare) \+ 0 (KCM to Community) \+ 0.50 (Community to Light Rail) \= 3.25$

The second combination is 

2.75 (KCM fare) \+ 0 (KCM to Community) \+ 0.25 (KCM to Light Rail) \= 3$

The best price for the journey is 3$ which is the correct price\!

**Example 2:**

Let’s introduce another leg containing Sound Transit express buses, [priced at 3.25$](https://www.soundtransit.org/ride-with-us/how-to-pay/fares). The relevant leg, fare product, transfers (with `nonconsecutive_transfers_allowed=1`) and transfer fare products are introduced.  
Now there are four different services that the rider uses:

* King County Metro (KCM)  
* Sound Transit Express buses (ST Express)  
* Community Transit  
* Light Rail

Snippet of `fare_products.txt` for transfers from and to ST express buses.

| fare\_product\_id | fare\_product\_name | amount | currency | fare\_media\_id |
| :---- | :---- | :---- | :---- | :---- |
| … | … | … | … | … |
| sound\_express\_to\_kcm | … | 0 | USD | orca\_card |
| kcm\_to\_sound\_express | … | 0.5 | USD | orca\_card |
| sound\_express\_to\_light\_rail | … | 0 | USD | orca\_card |
| light\_rail\_to\_sound\_express | … | 0.25 | USD | orca\_card |
| sound\_express\_to\_community | … | 0 | USD | orca\_card |
| community\_to\_sound\_express | … | 0.75 | USD | orca\_card |

Journey: KCM \-\> Light Rail \-\> Community \-\> ST Express

First combination:

2.75 (KCM) \+ 0.25 (KCM to Light Rail) \+ 0 (Light Rail to Community) \+ 0.75 (Community to ST Express) \= 3.75$

Second combination:

2.75 (KCM) \+ 0.25 (KCM to Light Rail) \+ 0 (KCM to Community) \+ 0.5 (KCM to ST Express) \= 3.5$

Third combination:

2.75 (KCM) \+ 0.25 (KCM to Light Rail) \+ 0 (Light Rail to Community) \+ 0.25 (Light Rail to ST Express) \= 3.25$

Fourth combination:

2.75 (KCM) \+ 0.25 (KCM to Light Rail) \+ 0 (Light Rail to Community) \+ 0.75 (Community to ST Express) \= 3.75$

The lowest fare is 3.25$ which is the correct fare for this journey.