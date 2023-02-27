<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/routes-stops-trips.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Routes, stops, and trips

<hr>

## Routes 

Routes are at the core of fixed route transit operations as they describe the geographic reach of a transit network. In GTFS, defining routes is the first step to describing the operations of a transit agency. 

The first step is to add the agency information as shown in the file [agency.txt](../../reference/#agencytxt) below. This file contains high level information about the agency. 

[**agency.txt**](../../reference/#agencytxt)

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000
```

Calgary Transit operates LRT, BRT, regular bus service, paratransit, and on-demand transit in Calgary, AB. In this example, two routes are defined, the first is a bus and the second is an LRT. Using the file [routes.txt](../../reference/#routestxt), each route is assigned a unique ID, and a short name as well as a long name for human readability.

[**routes.txt**](../../reference/#routestxt)

```
agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff
```

The fifth field (`route_type`) is used to differentiate the types of routes:

- The first is a bus, hence `route_type=3`
- The second is an LRT, hence `route_type=0`
- A complete list of values for `route_type` can be found [here](../../reference/#routestxt)

The remaining fields contain additional information such as a URL specific to the route as well as agency-specific colors to represent the service on a map.

<hr>

## Stops

In GTFS, stops and stations are described using the file [stops.txt](../../reference/#stopstxt), below, a bus stop is defined in the first record and an LRT station is defined in the second record. 

[**stops.txt**](../../reference/#stopstxt) 

```
stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,1
```

- `stop_id` is a unique identifier
- `stop_code` and `stop_name` typically contain rider-facing information
- The exact location is provided using coordinates (`stop_lat` and `stop_lon`)
- The sixth field (`location_type`) is used to differentiate stops from stations
- The first record corresponds to a bus stop, hence `location_type=0`
- The second record corresponds to station, hence `location_type=1`
- A complete list of values for `location_type `can be found [here](../../reference/stopstxt)

<hr>

## Trips

After describing the agency’s routes, it is now possible to describe the trips that are served by each route. 

First, the span of service needs to be defined using [calendar.txt](../../reference/#calendartxt).

[**calendar.txt**](../../reference/#calendartxt) 

```
service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
weekend_service,0,0,0,0,0,1,1,20220623,20220903
```

Here, a service that runs on Saturdays and Sundays only is being described, so the fields for those days are populated with 1, and the fields for the remaining days are populated with zero. This service runs from June 23 2022 until September 3 2022 as shown under the fields `start_date` and `end_date`. 

In this example, the file [trips.txt](../../reference/#tripstxt) describes 3 weekend trips that are served by the MAX Orange route that was described above.

[**trips.txt**](../../reference/#tripstxt) 

```
route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027
```

- The `route_id` from [routes.txt](../../reference/#routestxt) that corresponds to MAX Orange is listed
- The `service_id` from [calendar.txt](../../reference/#calendartxt) that corresponds to weekends is listed
- Each records contains a unique ID for each trip
The headsign text is provided, which is what is typically displayed on signs inside and outside the the bus
- The field `direction_id` allows for a distinction between trips of the same route going in different directions. For example, distinguishing between inbound trips and outbound trips - or southbound trips and northbound trips. 
    - In this case, trips towards Saddletowne have a `direction_id=0` and trips towards Brentwood have a `direction_id=1`. The values in direction_id have no inherent meaning, they are only used to assign one direction of travel versus another
- The `shape_id` from [shapes.txt](../../reference/#shapestxt) that corresponds to the MAX Orange route towards Saddletowne is listed for the first record and the one for MAX Orange route towards Brentwood is listed for the second and third records


The `shape_id=3030026` corresponds to the MAX Orange towards Saddletowne. The file below includes information on the points that outline the route as well as the distance between those points. With this information, it is possible to plot the route on a map for trip planning or analytics purposes.

[**shapes.txt**](../../reference/#shapestxt) 

```
shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
3030026,51.086506,-114.132259,10001,0.000
3030026,51.086558,-114.132371,10002,0.010
3030026,51.086781,-114.132865,10003,0.052
3030026,51.086938,-114.133179,10004,0.080
3030026,51.086953,-114.133205,10005,0.083
3030026,51.086968,-114.133224,10006,0.085
3030026,51.086992,-114.133249,10007,0.088
3030026,51.087029,-114.133275,10008,0.093
3030026,51.087057,-114.133286,10009,0.096
3030026,51.087278,-114.133356,10010,0.121
3030026,51.087036,-114.132864,10011,0.165
3030026,51.086990,-114.132766,10012,0.173
3030026,51.086937,-114.132663,10013,0.183
```

<hr>

## Service exceptions

It is possible to define exceptions to the service such as added service days (special days) or removed service days (such as no service on holidays).

For example, if there is no scheduled service on Sunday July 17, 2022 - then that date can be removed from `weekend_service` in [calendar.txt](../../reference/#calendartxt) by breaking the service in two:

| Service | Start | End |
| ----- | ----- | ----- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

However, this complicates the file since `service_id` is broken in two and this break will cascade to [trips.txt](../../reference/#tripstxt). Instead, this can be done in an easier way using [calendar_dates.txt](../../reference/#calendar_datestxt) as shown below:

[**calendar_dates.txt**](../../reference/#calendar_datestxt) 

```
service_id,date,exception_type
weekend_service,20220623,2
```

- The `service_id` `weekend_service` is listed 
- The date of the removed or added service is listed under `date` (July 17 2022) 
- The field `exception_type` is set to 2, which means that service is removed for this day 

<sup>[Example source](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)</sup>