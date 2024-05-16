# Continuous stops

## Pickup and drop off everywhere

The transit agency The Current (Rockingham, US-VT) applies a continuous-stop policy on routes 2, 53, and 55. A rider may be picked up and dropped off between scheduled stops all along the route, as long as there is a safe place for the bus to stop. 

The file [routes.txt](../../reference/#routestxt) is used to describe this service using the fields `continuous_pickup` and `continuous_drop_off`. The fields are set to `0` to indicate that continuous pickups and dropoffs are permitted. 

[**routes.txt**](../../reference/#routestxt)

```
route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
2,2,Bellows Falls In-Town,3,0,0
53,53,Bellows Falls / Battleboro Commuter,3,0,0
55,55,Bellows Falls / Springfield Shuttle,3,0,0
```

<sup>[Example source](https://crtransit.org/bus-schedules/)</sup>

<hr>
 
## Pickup and drop off on a section of the route

The transit agency Victor Valley Transit (Victorville, US-CA) applies a continuous-stop policy only on a part of route 22. A rider may board and get off the bus in any safe location within the County Fare zone only. Continuous pickups and drop offs are not possible within the Local Fare zone.
 
The Local Fare zone and the County Fare zone are separated by the Air Expressway as shown in the figure below. The scheduled stop National Trails Highway - Air Expressway is located slightly north of this boundary. To be accurate, the transit agency can add a stop at the actual intersection of the bus route with the boundary, from which the continuous pickup and drop-off is available. This stop may remain unscheduled. 

![](../../assets/victor-valley-transit.svg)

This is described using the files [stop.txt](../../reference/#stopstxt) and [stop_times.txt](../../reference/#stop_timestxt):

- The first file defines the stops along the route
- The second file defines the continuous pickup and drop off rules between the stops.

[**stop.txt**](../../reference/#stopstxt)

```
stop_id,stop_name,stop_lat,stop_lon
A,Victoriaville Transfer Station,34.514356,-117.318323
B,Dante St & Venus Ave,34.564499,-117.287097
C,Victorville Transportation Center,34.538433,-117.294703
X,Local/County Fare Boundary,34.566224,-117.318357
D,National Trails Highway - Air Expressway,34.567536,-117.319716
E,Oro Grande Post Office,34.599292,-117.334452
F,Silver Lakes Market,34.744662,-117.335407
```
 
In [stop_times.txt](../../reference/#stop_timestxt), for a given trip:

- A record with `continuous_pickup=0` indicates that continuous pickups are permitted from that stop until the next stop
- A record with `continuous_pickup=1` indicates that continuous pickups are forbidden from that stop until the next stop

[**stop_times.txt**](../../reference/#stop_timestxt)

```
trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
22NB9AM,A,1,09:00:00,09:00:00,1,1,1
22NB9AM,B,2,09:14:00,09:14:00,1,1,1
22NB9AM,C,3,09:21:00,09:21:00,1,1,1
22NB9AM,X,4,,,0,0,0
22NB9AM,D,5,09:25:00,09:25:00,0,0,1
22NB9AM,E,6,09:31:00,09:31:00,0,0,1
22NB9AM,F,7,09:46:00,09:46:00,0,0,1
```

The same logic applies for the field `continuous_drop_off` but for the case of drop offs. 

In the example above, the stops A, B, C have continuous_pickup and `continuous_drop_off` set to `1`, which forbid continuous pickups and drop offs between them. The stops `X`, `D`, `E`, and `F` have the fields `continuous_pickup` and `continuous_drop_off` set to `0`, which permits continuous pickups and drop offs between them.

<sup>[Example source](https://vvta.org/routes/route-22/)</sup>