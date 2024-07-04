# Flexible Services
Flexible services, also called demand-responsibe services, are services that do not follow the common behavior of scheduled and/or fixed  service. 

## Continuous Stops

Continuous Stops is used when riders can be picked up and/or dropped off between scheduled stops. 
This can be specified either in `routes.txt`, indicating that riders can be picked up or dropped off at any point along the vehicle’s travel path for every trip of the route, or in `stop_times.txt` for a specific section of a route.  

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`continuous_pickup`, `continuous_drop_off` |
|[routes.txt](../../../documentation/schedule/reference/#routestxt)|`continuous_pickup`, `continuous_drop_off` |

**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows two ways of representing Continuous Stop. 
    </p>
    
    <p style="font-size:16px">
    The first sample shows that pickups and dropoffs are allowed at any point along route `RA`.
     </p>

    <p style="font-size:16px">
    The second sample shows that pickups and dropoffs are allowed between the third and fifth stops of trip `AWE1`, accomplished by assigning `continuous_pickup` and `continuous_drop_off` values to `stop_sequence=3` and `stop_sequence=4`.
    </p>

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | route_short_name | route_type | continuous_pickup | continuous_drop_off |
        |----------|------------------|------------|-------------------|---------------------|
        | RA       |               17 |          3 |                 0 |                   0 |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | continuous_pickup | continuous_drop_off |
        |---------|--------------|----------------|---------|---------------|-------------------|---------------------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |                   |                     |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |                   |                     |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |                 0 |                   0 |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 |                 0 |                   0 |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 |                   |                     |

##  Booking Rules

Booking rules can be used to enable users to reserve a trip on a demand-responsive service. These rules outline the necessary prerequisites for successful bookings and provide contact information where users can make trip reservations. This feature should be used in conjunction with [Predefined Routes With Deviation](#predefined-routes-with-deviation), [Zone-based Demand Responsive Services](#zone-based-demand-responsive-services) and [Fixed-Stops Demand Responsive Services](#fixed-stops-demand-responsive-services) features, if such services require booking.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[booking_rules.txt](../../../documentation/schedule/reference/#booking_rulestxt)|`booking_rule_id`, `booking_type`, `prior_notice_duration_min`, `prior_notice_duration_max`, `prior_notice_last_day`, `prior_notice_last_time`, `prior_notice_start_day`, `prior_notice_start_time`, `prior_notice_service_id`, `message`, `pickup_message`, `drop_off_message`, `phone_number`, `info_url`, `booking_url` |


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows two different set of booking rules, the first one for trips that must be booked at least one day in advance (before 1PM) and no more than 14 days prior, and a second one for trips that can be booked at least 45 minutes prior to the trip and no more than 5 hours before.

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#booking_rulestxt"><b>booking_rules.txt</b></a> <br>
        </p>

        | booking_rule_id | booking_type | prior_notice_duration_min | prior_notice_duration_max | prior_notice_last_day | prior_notice_last_time | prior_notice_start_day | prior_notice_start_time | prior_notice_service_id | message                                                                                                                                            | pickup_message | drop_off_message | phone_number   | info_url             | booking_url             |
        |-----------------|--------------|---------------------------|---------------------------|-----------------------|------------------------|------------------------|-------------------------|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|----------------|------------------|----------------|----------------------|-------------------------|
        | route_br_1818   |            2 |                           |                           |                     1 |                  13:00 |                     14 |                    9:00 |                         | To request a ride, call 123-111-2233 before 1pm at least one business day ahead of your trip. You can book trips up to 14 business days in advace. |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |
        | route_br_4545   |            1 |                        45 |                       300 |                       |                        |                        |                         |                         | To request a ride, use the official booking system in our website, trips must be booked at least 45 min in advance                                 |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |


## Predefined Routes With Deviation

Predefined Routes With Deviation can be used to model flexible services where vehicles can briefly deviate from a specific route to pick up users that booked a trip within a specific area along the route. This uses a combination of traditional stops (like a regular scheduled service) and zones using `locations.geojson`.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
|[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson)|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features:Properties`, `Features:Properties:Stop_name`, `Features:Properties:Stop_description`, `Features:Geometry`, `Features:Geometry:Type`, `Features:Geometry:Coordinates` |

**Prerequisites**:

- [Base features](../base)
- [Booking Rules](#booking-rules) if the service requires booking

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows a trip with three fixed stops that can also drop-off passengers anywhere within specific areas defined between the fixed stops.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | arrival_time | departure_time | stop_id | location_id           | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | shape_dist_traveled | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|--------------|----------------|---------|-----------------------|---------------|------------------------------|----------------------------|-------------|---------------|---------------------|------------------------|--------------------------|
        | 4545_001 |     10:00:00 |       10:00:00 | S50122  |                       |             1 |                              |                            |             |               |                   0 |                        |                          |
        | 4545_001 |              |                |         | zone_S50122_to_S50123 |             2 |                     10:00:00 |                   10:06:00 |           1 |             3 |                     | br_1234                | br_1234                  |
        | 4545_001 |     10:06:00 |       10:06:00 | S50123  |                       |             3 |                              |                            |             |               |                 983 |                        |                          |
        | 4545_001 |              |                |         | zone_S50123_to_S50124 |             4 |                     10:06:00 |                   10:15:00 |           1 |             3 |                     | br_1234                | br_1234                  |
        | 4545_001 |     10:15:00 |       10:15:00 | S50124  |                       |             5 |                              |                            |             |               |                2109 |                        |                          |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#locationsgeojson"><b>locations.geojson</b></a> <br>
        </p>

        ~~~
        {
          "type": "FeatureCollection",
          "features": [
            {
              "id": "zone_S50122_to_S50123",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplified, only presenting 3 coordinates here.
                "coordinates": [
                  [
                    [
                      -73.575952,
                      45.514974
                    ],
                    [
                      -73.577314,
                      45.513433
                    ],
                    [
                      -73.569794,
                      45.5098370
                    ]
                  ]
                ]
              },
              "properties": {}
            },
        {
              "id": "zone_S50123_to_S50124",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplified, only presenting 3 coordinates here.
                "coordinates": [
                  [
                    [
                      -73.561332,
                      45.5085599
                    ],
                    [
                     -73.5701298,
                      45.5124057
                    ],
                    [
                      -73.571302,
                      45.5105563
                    ]
                  ]
                ]
              },
              "properties": {}
            }
           ]
        } 
        ~~~

## Zone-based Demand Responsive Services

Zone-based Demand Responsive Services is used to model services that allow pick up and/or drop off at any location within a specific area for users that book a trip. These areas are defined using `locations.geojson` so it does not require the use of `stops.txt`, nor `stop_times.arrival_time` & `stop_times.departure_time`.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
|[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson)|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features:Properties`, `Features:Properties:Stop_name`, `Features:Properties:Stop_description`, `Features:Geometry`, `Features:Geometry:Type`, `Features:Geometry:Coordinates` |

**Prerequisites**:

- [Base features](../base)
- [Booking Rules](#booking-rules) if the service requires booking

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows a service that can pick-up and drop off pre-booked riders anywhere between a specific area between 9am and 6pm.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|-------------|---------------|------------------------------|----------------------------|-------------|---------------|------------------------|--------------------------|
        | 2708_001 | area_001    |             1 |                      9:00:00 |                   18:00:00 |           2 |             1 | br_3289                | br_3289                  |
        | 2708_001 | area_001    |             2 |                      9:00:00 |                   18:00:00 |           1 |             2 | br_3289                | br_3289                  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#locationsgeojson"><b>locations.geojson</b></a> <br>
        </p>

        ~~~
        {
          "type": "FeatureCollection",
          "features": [
            {
              "id": "area_001",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplified, only presenting 3 coordinates here.
                "coordinates": [
                  [
                    [
                      -73.644437,
                      45.5023960
                    ],
                    [
                      -73.641593,
                      45.5054392
                    ],
                    [
                      -73.636580,
                      45.5081683
                    ]
                  ]
                ]
              },
              "properties": {}
            }
          ]
        }
        ~~~

## Fixed-Stops Demand Responsive Services
Fixed-Stops Demand Responsive Services is used to model services that allow pick up and/or drop off at any location within a group of pre-defined stops for users that book a trip. These groups of stops are defined using `location_groups.txt` and `location_group_stops.txt`.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_group_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
|[location_groups.txt](../../../documentation/schedule/reference/#location_groupstxt)|`location_group_id`, `location_group_name`|
|[location_group_stops.txt](../../../documentation/schedule/reference/#location_group_stopstxt)|`location_group_id`, `stop_id`|

**Prerequisites**:

- [Base features](../base)
- [Booking Rules](#booking-rules) if the service requires booking

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows a service that can pick-up and drop off pre-booked riders at 4 different stops between 7am and 10am.

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#location_groupstxt"><b>location_groups.txt</b></a> <br>
        </p>

        | location_group_id | location_group_name           |
        |-------------------|-------------------------------|
        | r27_stops         | Yellow Borough Route 27 stops |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#location_group_stopstxt"><b>location_group_stops.txt</b></a> <br>
        </p>

        | location_group_id | stop_id |
        |-------------------|---------|
        | r27_stops         | syb029  |
        | r27_stops         | syb030  |
        | r27_stops         | syb031  |
        | r27_stops         | syb032  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | location_group_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|-------------------|---------------|------------------------------|----------------------------|-------------|---------------|------------------------|--------------------------|
        | 2714_002 | r27_stops         |             1 |                      7:00:00 |                   10:00:00 |           2 |             1 | br_5478                | br_5478                  |
        | 2714_002 | r27_stops         |             2 |                      7:00:00 |                   10:00:00 |           1 |             2 | br_5478                | br_5478                  |
