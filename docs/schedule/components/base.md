# Base component
The features included in this component provide the most basic and essential elements that a GTFS needs to represent a transit service. This includes entries for each individual trip, stop, arrival and departure times and service days among many other important pieces of information. Since all of the features included in the base component are essential to enable a working GTFS feed, all these features should be implemented together.

## Agency

<div class="grid" markdown>

This feature contains basic information regarding the agencies in charge of the transit service, including their name, website URL, and the language and timezone in which the service operates among other information. This allows to match specific services with their own corresponding agency.

| Files associated      | [Agency.txt](/schedule/reference/#agencytxt)                                                                                                     |
|-----------------------|----------------------------------------------------------------------------------------------------------------|
| **Fields associated** | agency_name<br>agency_url<br>agency_timezone<br>agency_lang<br>agency_phone<br>agency_fare_url<br>agency_email |

</div>

## Stops

<div class="grid" markdown>
This feature allows to represent the basic information elements used to identify where a transit service can be accessed, this could be a metro station or a bus stop. Geographical coordinates are used by this feature to locate the stop or station in a map, while defining a specific ID and name so that it could be identified easily, along with other complementary information.


| Files associated      | [stops.txt](/schedule/reference/#stopstxt)                                                                                                            |
|-----------------------|----------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | stop_id<br>stop_code<br>stop_name<br>stop_desc<br>stop_lat<br>stop_lon<br>stop_url<br>stop_timezone<br>platform_code |

</div>

## Routes

<div class="grid" markdown>
This feature helps define the elements that identify a transit route, including its name, description and the type of service that is being represented (such as a bus, a subway or metro, ferry, etc.).

| Files associated      | [routes.txt](/schedule/reference/#routestxt)                                                                                                                |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | route_id<br>agency_id<br>route_desc<br>route_type<br>route_url<br>route_sort_order<br>route_short_name<br>route_long_name |

</div>

## Stop Times

<div class="grid" markdown>
This feature is used to represent the arrival and departure times at each stop, allowing users to know precisely at what time the bus, train or ferry is arriving and departing a specific location.

| Files associated      | [stop_times.txt](/schedule/reference/#stop_timestxt)                                                                                                                            |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | trip_id<br>arrival_time<br>departure_time<br>stop_id<br>stop_sequence<br>pickup_type<br>drop_off_type<br>shape_dist_traveled<br>timepoint |

</div>

## Service dates

<div class="grid" markdown>
This feature helps create the structure required to schedule trips, as well as creating service exemptions such as holidays and other special services on specific dates.


| Files associated      | [calendar.txt](/schedule/reference/#calendartxt)                                                                                                       | [calendar_dates.txt](/schedule/reference/#calendar_datestxt)                   |
|-----------------------|--------------------------------------------------------------------------------------------------------------------|--------------------------------------|
| **Fields associated** | service_id<br>monday<br>tuesday<br>wednesday<br>thursday<br>friday<br>saturday<br>sunday<br>start_date<br>end_date | service_id<br>date<br>exception_type |

</div>

## Trips

<div class="grid" markdown>
This feature brings together the main elements of the Base component of GTFS, making it possible to model transit services, by creating individual trips and associating them with their corresponding routes, stops and service dates.


| Files associated      | [trips.txt](/schedule/reference/#tripstxt)                                       |
|-----------------------|----------------------------------------------------------------------------------|
| **Fields associated** | route_id<br>service_id<br>trip_id<br>trip_short_name<br>direction_id<br>block_id |

</div>