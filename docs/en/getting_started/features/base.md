# Base
The following features provide the most basic and essential elements that a GTFS needs to represent a transit service. A GTFS consists of routes, each with associated trips. These trips visit one or more stops at specific times. Trips only contain time-of-day information, and the days on which they operate are determined by calendars.
All these features must be implemented together to enable a working GTFS feed.

## Agency

Agencies contain basic information about the agencies responsible for the transit service, such as their name, website URL, and the language and timezone in which the service operates. This allows to match specific services with their corresponding agency.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[agency.txt](/documentation/schedule/reference/#agencytxt)|`agency_id`, `agency_name`, `agency_url`, `agency_timezone`, `agency_lang`, `agency_phone`, `agency_fare_url`, `agency_email` |

**Prerequisites**: 

- All other Base features

??? note "Sample Data"

    <p style="font-size:16px">
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#agencytxt"><b>agency.txt</b></a> <br>
        </p>

        | agency_id | agency_name | agency_url                 | agency_timezone     | agency_lang | agency_phone   | agency_fare_url                  | agency_email           |
        |-----------|-------------|----------------------------|---------------------|-------------|----------------|----------------------------------|------------------------|
        | tb        | Transit Bus | https://www.transitbus.org | America/Los_Angeles | EN          | (777) 555-7777 | https://www.transitbus.org/fares | contact@transitbus.org |



## Stops

Stops represent the basic elements used to identify where a transit service picks up and drops off passengers. This could be a metro station or a bus stop. Each stop has, among other attributes, geographical coordinates to pinpoint its location on a map, and a name that matches the agency's rider-facing materials. Stops are associated to Trips using Stop Times. 
With GTFS, it is also possible to describe the interior of larger stations, such as a train station or bus depot, using [Pathways](/getting_started/features/pathways).

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/documentation/schedule/reference/#stopstxt)|`stop_id`, `stop_code`, `stop_name`, `stop_desc`, `stop_lat`, `stop_lon`, `stop_url`, `stop_timezone`, `platform_code` |

**Prerequisites**: 

- All other Base features

??? note "Sample Data"

    <p style="font-size:16px">
    
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_code | stop_desc                                  | stop_name  | stop_lat  | stop_lon   | stop_url                                | stop_timezone | platform_code |
        |---------|-----------|--------------------------------------------|------------|-----------|------------|-----------------------------------------|---------------|---------------|
        | TAS001  | TAS001    | Southwest corner of 5 Avenue and 53 Street | 5 Av/53 St | 45.503568 | -73.587079 | https://www.transitbus.org/stops/TAS001 |               |               |


## Routes

A route is a group of trips under the same branding that are displayed to riders as a single service. Each route has, among other attributes, a name that matches the agency's rider-facing materials, and the type of service that is being represented (such as a bus, a subway or metro, ferry, etc.).

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[routes.txt](/documentation/schedule/reference/#routestxt)|`route_id`, `agency_id`, `route_desc`, `route_type`, `route_url`, `route_sort_order`, `route_short_name`, `route_long_name`|

**Prerequisites**: 

- All other Base features

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines a bus route (`route_type=3`).
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | agency_id | route_short_name | route_long_name    | route_desc                                            | route_type | route_url                            | route_sort_order |
        |----------|-----------|------------------|--------------------|-------------------------------------------------------|------------|--------------------------------------|------------------|
        | RA       | tb        |               17 | Mission - Downtown | The "A" route travels from lower Mission to Downtown. |          3 | https://www.transitbus.org/routes/ra |               12 |


## Service dates

Service dates indicate the range of dates on which a service is running, as well as creating service exemptions such as holidays and other special services on specific dates.
It works by defining a start date and a finish date in `calendars.txt`, then a marker for each day of the week on which it operates. If there are single-day scheduling changes that occur during this period, then the `calendar_dates.txt` file can be used to override the schedule for each of these days.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[calendar.txt](/documentation/schedule/reference/#calendartxt)|`service_id`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `start_date`, `end_date`|
|[calendar_dates.txt](/documentation/schedule/reference/#calendar_datestxt)|`service_id`, `date`, `exception_type`|

**Prerequisites**: 

- All other Base features

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines two services (weekday and weekend) for the month of July, 2024, including a special holiday service on July 4th, operating as a weekend service.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#calendartxt"><b>calendar.txt</b></a> <br>
        </p>

        | service_id | monday | tuesday | wednesday | thursday | friday | saturday | sunday | start_date | end_date |
        |------------|--------|---------|-----------|----------|--------|----------|--------|------------|----------|
        | WE         |      0 |       0 |         0 |        0 |      0 |        1 |      1 |   20240701 | 20240731 |
        | WD         |      1 |       1 |         1 |        1 |      1 |        0 |      0 |   20240701 | 20240731 |

    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#calendar_datestxt"><b>calendar_dates.txt</b></a> <br>
        </p>

        | service_id | date     | exception_type |
        |------------|----------|----------------|
        | WD         | 20240704 |              2 |
        | WE         | 20240704 |              1 |

## Trips

Trips brings together Routes and Service dates to create journeys that can be taken by riders. Trips are associated to Stops using Stop Times.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[trips.txt](/documentation/schedule/reference/#tripstxt)|`route_id`, `service_id`, `trip_id`, `trip_short_name`, `direction_id`, `block_id`|

**Prerequisites**: 

- All other Base features

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines two trips running in both directions for the RA route.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | trip_short_name | direction_id | block_id |
        |----------|------------|---------|-----------------|--------------|----------|
        | RA       | WE         | AWE1    |            3885 |            0 |        1 |
        | RA       | WE         | AWE2    |            3887 |            1 |        2 |

## Stop Times

Stop times are used to represent the individual stop arrival and departure times for each trip, allowing riders to know precisely at what time the bus, train or ferry is arriving and departing a specific location. The `stop_times.txt` file is typically the largest in a GTFS feed. 
Certain services operate on regular a frequency (e. g. a subway line that runs every 5min) rather than having specific arrival and departure times. This can be modeled using [Frequency-based services](/getting_started/features/base_add-ons/#frequency-based-service), and this can be modeled in conjunction with `stop_times.txt`.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stop_times.txt](/documentation/schedule/reference/#stop_timestxt)|`trip_id`, `arrival_time`, `departure_time`, `stop_id`, `stop_sequence`, `pickup_type`, `drop_off_type`, `timepoint` |

**Prerequisites**: 

- All other Base features

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines the schedule for a trip at 5 stops.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | pickup_type | drop_off_type | timepoint |
        |---------|--------------|----------------|---------|---------------|-------------|---------------|-----------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |           0 |             0 |         1 |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |           0 |             0 |         1 |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |           0 |             0 |         1 |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 |           0 |             0 |         1 |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 |           0 |             0 |         1 |
