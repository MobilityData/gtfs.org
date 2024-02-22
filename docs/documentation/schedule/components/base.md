# Base
The following features provide the most basic and essential elements that a GTFS needs to represent a transit service. A GTFS consists of routes, each with associated trips. These trips visit one or more stops at specific times. Trips only contain time-of-day information, and the days on which they operate are determined by calendars.
All these features must be implemented together to enable a working GTFS feed.

## Agency

<div class="grid" markdown>

Agencies contain basic information about the agencies responsible for the transit service, such as their name, website URL, and the language and timezone in which the service operates. This allows to match specific services with their corresponding agency.

| Files associated      | [Agency.txt](/schedule/reference/#agencytxt)                                                                                                     |
|-----------------------|----------------------------------------------------------------------------------------------------------------|
| **Fields associated** | agency_name<br>agency_url<br>agency_timezone<br>agency_lang<br>agency_phone<br>agency_fare_url<br>agency_email |

</div>

## Stops

<div class="grid" markdown>
Stops represent the basic elements used to identify where a transit service picks up and drops off passengers. This could be a metro station or a bus stop. Each stop has, among other attributes, geographical coordinates to pinpoint its location on a map, and a name that matches the agency's rider-facing materials. Stops are associated to Trips using Stop Times. 
With GTFS, it is also possible to describe the interior of larger stations, such as a train station or bus depot, using Pathways (@TODO link). 


| Files associated      | [stops.txt](/schedule/reference/#stopstxt)                                                                                                            |
|-----------------------|----------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | stop_id<br>stop_code<br>stop_name<br>stop_desc<br>stop_lat<br>stop_lon<br>stop_url<br>stop_timezone<br>platform_code |

</div>

## Routes

<div class="grid" markdown>
A route is a group of trips under the same branding that are displayed to riders as a single service. Each route has, among other attributes, a name that matches the agency's rider-facing materials, and the type of service that is being represented (such as a bus, a subway or metro, ferry, etc.).

| Files associated      | [routes.txt](/schedule/reference/#routestxt)                                                                                                                |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | route_id<br>agency_id<br>route_desc<br>route_type<br>route_url<br>route_sort_order<br>route_short_name<br>route_long_name |

</div>

## Service dates

<div class="grid" markdown>
Service dates indicate the range of dates on which a service is running, as well as creating service exemptions such as holidays and other special services on specific dates.
It works by defining a start date and a finish date in `calendars.txt`, then a marker for each day of the week on which it operates. If there are single-day scheduling changes that occur during this period, then the `calendar_dates.txt` file can be used to override the schedule for each of these days.

| Files associated      | [calendar.txt](/schedule/reference/#calendartxt)                                                                                                       | [calendar_dates.txt](/schedule/reference/#calendar_datestxt)                   |
|-----------------------|--------------------------------------------------------------------------------------------------------------------|--------------------------------------|
| **Fields associated** | service_id<br>monday<br>tuesday<br>wednesday<br>thursday<br>friday<br>saturday<br>sunday<br>start_date<br>end_date | service_id<br>date<br>exception_type |

</div>

## Trips

<div class="grid" markdown>
Trips brings together Routes and Service dates to create journeys that can be taken by riders. Trips are associated to Stops using Stop Times.


| Files associated      | [trips.txt](/schedule/reference/#tripstxt)                                       |
|-----------------------|----------------------------------------------------------------------------------|
| **Fields associated** | route_id<br>service_id<br>trip_id<br>trip_short_name<br>direction_id<br>block_id |

</div>

## Stop Times

<div class="grid" markdown>
Stop times are used to represent the individual stop arrival and departure times for each trip, allowing riders to know precisely at what time the bus, train or ferry is arriving and departing a specific location. The `stop_times.txt` file is typically the largest in a GTFS feed. 
Certain services operate on regular a frequency (e. g. a subway line that runs every 5min) rather than having specific arrival and departure times. This can be modeled using Frequency-based sercices (@TODO link), and this can be modeled in conjunction with `stop_times.txt`.

| Files associated      | [stop_times.txt](/schedule/reference/#stop_timestxt)                                                                                                                            |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | trip_id<br>arrival_time<br>departure_time<br>stop_id<br>stop_sequence<br>pickup_type<br>drop_off_type<br>timepoint |

</div>

