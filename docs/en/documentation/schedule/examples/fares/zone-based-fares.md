# Zone-based Fares:

*Main files: fare\_leg\_rules.txt, areas.txt, stop\_areas.txt*

*Example: Translink (Vancouver)*

**Recall ([Fares v2 Features](?tab=t.0#heading=h.o1dhl0gqp9z8)):** Zone-Based Fares is used to represent zone-based fare schemes; where a specific fare applies when traveling from one particular zone to another zone. A zone is defined by an area or group of stops.

Recall: For Translink, buses use flat-rate fares. But SkyTrain and SeaBus use zone fares. Each stop is assigned to one of the three zones: ZN1, ZN2 and ZN3.

- A 1-zone fare is for legs within one zone only (ZN1 to ZN1, ZN2 to ZN2, ZN3 to ZN3)  
- A 2-zone fare is for legs that cross only two zones (ZN1 to ZN2, ZN2 to ZN3)  
- A 3-zone fare is for legs that cross all three zones (ZN1 to ZN3, passing through ZN2)

Additionally, there is an additional zone contained within ZN2 called Sea Island, containing **Vancouver Airport (YVR)**, **Sea Island Centre**, and **Templeton** stations. 

* Journeys that start from Sea Island charge an additional 5$ over journeys starting from ZN2.   
* Journeys that end in Sea Island charge the same amount as journeys ending in ZN2. Journeys that take place entirely within Sea Island are free.

Zone-based fares are modeled in two steps:

### Assign stops to zones

For routes operating under zone-based fares, each stop served by the route is located in a zone. Stops from stops.txt are assigned to their respective zones by using areas.txt and stop\_areas.txt.

1. areas.txt creates the zones by having  

   - area\_id: A unique identifier for the zone (ZN1, ZN2, ZN3)  
   - area\_name: The name of the zone (eg: The name of ZN1 can be “Zone 1: Vancouver”)  

2. stop\_areas.txt associates stops to zones by creating rows of  
   - stop\_id: the Foreign Key referencing the id of the stop from stops.txt  
   - Area\_id: the Foreign Key referencing the id of the zone from areas.txt  

[Consult the document](https://gtfs.org/documentation/schedule/reference/#areastxt) for more information on areas.

   

For Translink, the zones are created in areas.txt as 4 areas, one per each main zone and an additional one for Sea Island.

`areas.txt`

| area\_id | area\_name |
| :---- | :---- |
| ZN1 | Zone 1 \- Vancouver |
| ZN2 | Zone 2 \- Burnaby, Richmond and North Vancouver |
| ZN3 | Zone 3 \- Surrey and Coquitlam |
| sea\_island | Sea Island (Vancouver Airport YVR Airport, Sea Island Centre, Templeton) |

The stops within each zone are associated to the corresponding area in `stop_areas.txt`

`stop_areas.txt`

| stop\_id | area\_id |
| :---- | :---- |
| 8039 | ZN1 |
| 8066 | ZN2 |
| … | … |
| 99901 | ZN2 |
| 99902 | ZN2 |
| 99903 | ZN2 |
| 99901 | sea\_island |
| 99902 | sea\_island |
| 99903 | sea\_island |

This is a snapshot of  `stops.txt`:

`stops.txt`

| stop\_id | stop\_name |
| :---- | :---- |
| 8039 | Waterfront Station @ Platform 2 |
| 8066 | Edmonds Station @ Platform 1 |
| 99901 | YVR-Airport Station @ Canada Line |
| … | … |

The Sea Island stops (99901, 99902, 99903\) are associated with both ZN2 and sea\_island since they exist within both zones. Later in this section, rule\_priority will help differentiate between sea\_island and ZN2 legs.

### Create fare products

This is done in fare\_products.txt in a process similar to Route-Based Fares\[link\*\].  
Add each Fare Product in fare\_products.txt, where the amount corresponds to the cost of each fare:

* 3.20 CAD for a 1-zone fare (the journey takes place in one zone only  
* 4.65 CAD for a 2-zone fare (the journey crosses from one zone to another)  
* 6.35 CAD for a 3-zone fare (the journey crosses from zone 1, to zone 2, then to zone 3).  
* The fare products that are paid for journeys that start from Sea Island. Since Sea Island is inside Zone 2, the cost of these legs is the fare from zone 2 to the destination zone \+ 5 CAD additional fare (eg: for Sea Island to Zone 1, the cost is 2-zone fare cost \+ 5 CAD \= 4.65+5 \= 9.65 CAD.  
* The free fare product from Sea Island stops to Sea Island stops


Recall that the examples are shown only for *Contactless* fares. To support other fares and fare media, copy the fare\_products.txt rows then change with their amount and fare\_media\_id.

The fare products for SkyTrain and SeaBus are added to `fare_products.txt`  
`fare_products.txt`

| fare\_product\_id | fare\_product\_name | amount | currency | fare\_media\_id |
| :---- | :---- | :---- | :---- | :---- |
| bus\_flat\_fare | Bus Flat Fare | 3.20 | CAD | contactless |
| 1\_zone\_fare | 1-Zone Fare | 3.20 | CAD | contactless |
| 2\_zone\_fare | 2-Zone Fare | 4.65 | CAD | contactless |
| 3\_zone\_fare | 3-Zone Fare | 6.35 | CAD | contactless |
| sea\_island\_1\_zone\_fare | Sea Island travel \+ 1-zone Fare | 8.20 | CAD | contactless |
| sea\_island\_2\_zone\_fare | Sea Island travel \+ 2-zone fare | 9.65 | CAD | contactless |
| sea\_island\_sea\_island\_fare | Free fare inside Sea Island | 0 | CAD | contactless |

### Create networks

The relevant routes for this fare need to be grouped together under networks. The process is the same as with Route-Based fares\[link\*\]

1. A network is created for zone-based routes. In Vancouver’s case, it can have the network\_id “skytrain\_seabus”  
2. The route\_ids for the SkyTrain routes (Canada Line, Millennium Line, Expo Line) and for the SeaBus are associated to the network\_id “skytrain\_seabus” in route\_networks.txt or routes.txt

`Example with skytrain_seabus` is specified in `networks.txt` and associated with route\_ids in `route_networks.txt`.

`networks.txt`

| network\_id | network\_name |
| :---- | :---- |
| skytrain\_seabus | SkyTrain and SeaBus |

`route_networks.txt`

| route\_id | network\_id |
| :---- | :---- |
| 13686 | skytrain\_seabus |
| 30052 | skytrain\_seabus |
| … | … |

“13686” is the route\_id for the Canada Line, and so on…

### Create fare legs

After having created the areas, fare products and networks, associate them with legs. The legs are created like with Route-Based fares\[link\*\]. Each leg is then matched to a fare product to provide its cost.

1. Add the leg\_group\_id, its network\_id and its fare\_product\_id,  
2. Add from\_area\_id and to\_area\_id tp specify the zones that the leg departs from and arrives to.  
   Eg: ZN1\_ZN1 is the leg that remains within Zone 1 because from\_area\_id=ZN1 and to\_area\_id=ZN1. ZN1\_ZN1 is associated with the 1\_zone\_fare fare\_product.  
3. Create fare leg entries for both directions. Note that ZN1\_ZN2 is listed twice in the example below. It is first associated with (from\_area\_id=ZN1, to\_area\_id=ZN2), then with (from\_area\_id=ZN2, to\_area\_id=ZN1).

The first example does not contain Sea Island legs which will be dealt with in the next paragraph. The relevant fare legs are added to to `fare_leg_rules.txt` as:

`fare_leg_rules.txt`

| leg\_group\_id | network\_id | fare\_product\_id | from\_area\_id | to\_area\_id |
| :---- | :---- | :---- | :---- | :---- |
| … | … | … |  |  |
| ZN1\_ZN1 | skytrain\_seabus | 1\_zone\_fare | ZN1 | ZN1 |
| ZN2\_ZN2 | skytrain\_seabus | 1\_zone\_fare | ZN2 | ZN2 |
| ZN3\_ZN3 | skytrain\_seabus | 1\_zone\_fare | ZN3 | ZN3 |
| ZN1\_ZN2 | skytrain\_seabus | 2\_zone\_fare | ZN1 | ZN2 |
| ZN1\_ZN2 | skytrain\_seabus | 2\_zone\_fare | ZN2 | ZN1 |
| ZN2\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN2 | ZN3 |
| ZN2\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN3 | ZN2 |
| ZN1\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN1 | ZN3 |
| ZN1\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN3 | ZN1 |

### Rule priority for legs

To represent Sea Island legs, another matching rule should be introduced. Since Sea Island exists inside Zone 2, if a leg starts from Sea Island and ends in Zone 2, is it a “Sea Island to Zone 2” leg or a “Zone 2 to Zone 2” leg, or a “Sea Island to Sea Island leg”? In fact, the leg will be matched to all 3 possibilities, which will cause ambiguity.  

To resolve this ambiguity, the field rule\_priority is introduced. `rule_priority` defines the order of priority in which matching rules are applied to legs, allowing the rules with higher values of priority to take precedence over other rules with lower or empty values for `rule_priority`.

1. Add rule\_priority as a field  

2. Add the legs that start from Sea Island.  

   - The legs sea\_island\_ZN1 and sea\_island\_ZN3 both cost 5 CAD \+ a 2-zone fare.  
   - The leg sea\_island\_ZN1 costs 5 CAD \+ a 1-zone fare.  
   - The leg sea\_island\_sea\_island is free.  
   
3. Set the values for rule\_priority accordingly.  

   - sea\_island\_sea\_island has the highest priority (rule\_priority=2). This ensures that if the origin stop and destination stop of a leg are in sea\_island (inside Zone 2), the prioritized leg is sea\_island\_sea\_island  
   - The legs that start from Sea Island and end somewhere else (Zone 1, Zone 3, Zone 2 outside of Sea Island) have rule\_priority=1  
   - The remaining legs have the lowest priority: rule\_priority=0 (or empty)

`fare_leg_rules.txt`

| leg\_group\_id | network\_id | fare\_product\_id | from\_area\_id | to\_area\_id | rule\_priority |
| :---- | :---- | :---- | :---- | :---- | :---- |
| … | … | … |  |  |  |
| sea\_island\_ZN1 | skytrain\_seabus | sea\_island\_2\_zone\_fare | sea\_island | ZN1 | 1 |
| sea\_island\_ZN2 | skytrain\_seabus | sea\_island\_1\_zone\_fare | sea\_island | ZN2 | 1 |
| sea\_island\_ZN3 | skytrain\_seabus | sea\_island\_2\_zone\_fare | sea\_island | ZN3 | 1 |
| sea\_island\_sea\_island | skytrain\_seabus | sea\_island\_sea\_island\_fare | sea\_island | sea\_island | 2 |
| ZN1\_ZN1 | skytrain\_seabus | 1\_zone\_fare | ZN1 | ZN1 |  |
| ZN2\_ZN2 | skytrain\_seabus | 1\_zone\_fare | ZN2 | ZN2 |  |
| ZN3\_ZN3 | skytrain\_seabus | 1\_zone\_fare | ZN3 | ZN3 |  |
| ZN1\_ZN2 | skytrain\_seabus | 2\_zone\_fare | ZN1 | ZN2 |  |
| ZN1\_ZN2 | skytrain\_seabus | 2\_zone\_fare | ZN2 | ZN1 |  |
| ZN2\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN2 | ZN3 |  |
| ZN2\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN3 | ZN2 |  |
| ZN1\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN1 | ZN3 |  |
| ZN1\_ZN3 | skytrain\_seabus | 2\_zone\_fare | ZN3 | ZN1 |  |