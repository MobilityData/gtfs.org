# Base
The following features provide the most basic and essential elements that a GTFS needs to represent a transit service. A GTFS consists of routes, each with associated trips. These trips visit one or more stops at specific times. Trips only contain time-of-day information, and the days on which they operate are determined by calendars.
All these features must be implemented together to enable a working GTFS feed.

## Agency

Agencies contain basic information about the agencies responsible for the transit service, such as their name, website URL, and the language and timezone in which the service operates. This allows to match specific services with their corresponding agency.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[agency.txt](/schedule/reference/#agencytxt)|`agency_id`, `agency_name`, `agency_url`, `agency_timezone`, `agency_lang`, `agency_phone`, `agency_fare_url`, `agency_email` |

## Stops

Stops represent the basic elements used to identify where a transit service picks up and drops off passengers. This could be a metro station or a bus stop. Each stop has, among other attributes, geographical coordinates to pinpoint its location on a map, and a name that matches the agency's rider-facing materials. Stops are associated to Trips using Stop Times. 
With GTFS, it is also possible to describe the interior of larger stations, such as a train station or bus depot, using Pathways (@TODO link). 

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/schedule/reference/#stopstxt)|`stop_id`, `stop_code`, `stop_name`, `stop_desc`, `stop_lat`, `stop_lon`, `stop_url`, `stop_timezone`, `platform_code` |

## Routes

A route is a group of trips under the same branding that are displayed to riders as a single service. Each route has, among other attributes, a name that matches the agency's rider-facing materials, and the type of service that is being represented (such as a bus, a subway or metro, ferry, etc.).

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[routes.txt](/schedule/reference/#routestxt)|`route_id`, `agency_id`, `route_desc`, `route_type`, `route_url`, `route_sort_order`, `route_short_name`, `route_long_name`|

## Service dates

Service dates indicate the range of dates on which a service is running, as well as creating service exemptions such as holidays and other special services on specific dates.
It works by defining a start date and a finish date in `calendars.txt`, then a marker for each day of the week on which it operates. If there are single-day scheduling changes that occur during this period, then the `calendar_dates.txt` file can be used to override the schedule for each of these days.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[calendar.txt](/schedule/reference/#calendartxt)|`service_id`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `start_date`, `end_date`|
|[calendar_dates.txt](/schedule/reference/#calendar_datestxt)|`service_id`, `date`, `exception_type`|

## Trips

Trips brings together Routes and Service dates to create journeys that can be taken by riders. Trips are associated to Stops using Stop Times.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[trips.txt](/schedule/reference/#tripstxt)|`route_id`, `service_id`, `trip_id`, `trip_short_name`, `direction_id`, `block_id`|

## Stop Times

Stop times are used to represent the individual stop arrival and departure times for each trip, allowing riders to know precisely at what time the bus, train or ferry is arriving and departing a specific location. The `stop_times.txt` file is typically the largest in a GTFS feed. 
Certain services operate on regular a frequency (e. g. a subway line that runs every 5min) rather than having specific arrival and departure times. This can be modeled using Frequency-based sercices (@TODO link), and this can be modeled in conjunction with `stop_times.txt`.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stop_times.txt](/schedule/reference/#stop_timestxt)|`trip_id`, `arrival_time`, `departure_time`, `stop_id`, `stop_sequence`, `pickup_type`, `drop_off_type`, `` |

