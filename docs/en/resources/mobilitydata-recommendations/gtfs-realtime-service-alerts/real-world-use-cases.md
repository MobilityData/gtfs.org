# Real-world use cases

In this section, we explore all possible use cases of Service Alerts in real life. For each use case, we include the best alert practices.

## Route Closure

Example of service change:

* Route is suspended for a certain period.

Effect:

* `NO_SERVICE`

Informed Entity:

* `route_id`  
* `direction_id` (if the route is not running along a direction).

Suggestions:

* Add an alert that clearly mentions:  
  * That there is a route closure (in the header).  
  * The name of the affected route (in the header).  
  * Direction of the affected route if applicable (in the header).  
  * The time period(s) that the service disruption spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).  
  * If there is any replacement service, include the information (in the description).

* If `tripUpdates` are provided, change `ScheduleRelationship` in the `TripDescriptor` of the affected trips to CANCELED if possible.  
* If there is any replacement service and it is possible to create, then you can either:  
  * Create it in the GTFS Schedule feed if the closure is planned or once it extends over time and you have more certainty around the closure.  
  * If that replacement service corresponds to a route in the GTFS and you cannot define the additional trips in the GTFS Schedule feed, then create it in `tripUpdates` with the `TripDescriptor \= NEW`.

!!! Note "Suggested template"

    Header: “ Service interrupted on route `{route name}`”

    Description: “Due to {cause}, service is suspended on route/line `{route name}` from`{start time}` to `{end time if applicable}`. Please use `{replacement suggestion}` instead.”

---

## Trip Cancellation

Example of service change:

* Specific trips are cancelled.

Effect:

* `NO_SERVICE`

Informed Entity:

* `route_id`  
* `direction_id` (if the route is not running along a direction).  
* `trip_id` using TripDescriptor.  
  * If the trips are frequency-based, add `start_time` and `start_date` under TripDescriptor to match to a single trip.

Suggestions:

* Add an alert that clearly mentions:  
  * That there is a trip cancellation (in the header).  
  * The name of the affected route (in the header).  
  * Direction of the affected route if applicable (in the header).  
  * Human-readable identifier of the cancelled trips if possible, such as the start time (in the description).  
  * If there is any replacement service, include the information (in the description).

* If `tripUpdates` are provided, change `ScheduleRelationship` in the `TripDescriptor` of the affected trips to CANCELED if possible.  
* If there is any replacement service and it is possible to create, then you can either:  
  * Create it in the GTFS Schedule feed if the closure is planned or once it extends over time and you have more certainty around the closure.  
  * If that replacement service corresponds to a route in the GTFS and you cannot define the additional trips in the GTFS Schedule feed, then create it in `tripUpdates` with the `TripDescriptor \= NEW`.

!!! Note "Suggested template"

    Header: “ Trips cancelled on route `{route name}`”

    Description: “Due to {cause}, a few trips are cancelled on `{direction}` route/line `{route name}`. The current trips are affected `{human-readable trip identifier, e.g. start time}`. Please use `{replacement suggestion}` instead.”

---

## Route segment closure

Example of service change:

* The bus does not run between two stops.

Effect:

* `NO_SERVICE`  
* You may also use `MODIFIED_SERVICE` when you expect consumers to use the alert to adjust journey suggestions or routing, and if you expect that setting an effect of `NO_SERVICE` could result in presenting inaccurate information to riders.

Informed Entity:

* `route_id`  
* `direction_id` (if the route is not running along a direction).  
* `stop_id`  
  * If the bus route is not running from `stop_A` to `stop_B`, include the`route_id`, `direction_id`, and all the `stop_ids` between `stop_A` and `stop_B` along the direction.  
  * Do not include the first and last stop of the segment in the informed entity if they are not affected by the disruption. Only include the stops of the segment that are actually closed.

Suggestions:

* Add an alert that clearly mentions:  
  * That there is a route segment closure (in the header).  
  * The name of the affected route (in the header).  
  * Direction (header) and the extremity stops of the affected segment (in the header and/or description).  
  * The time period(s) that the service disruption spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).  
  * If there is any replacement service, include the information (in the description).

* If `tripUpdates` are provided, change `ScheduleRelationship` in the `StopTimeUpdate` of affected `stop_times` of each relevant trip to SKIPPED if possible.  
* If there is any replacement service and it is possible to create, then you can either:  
  * Create it in the GTFS Schedule feed if the closure is planned or once it extends over time and you have more certainty around the closure.  
  * If that replacement service is operated by a pre-existing route and you cannot define it in the GTFS Schedule feed, then create it in `tripUpdates` with the `TripDescriptor \= NEW`.

!!! Note "Suggested template"

    Header: “No route `{route name}` service between `{start stop}` and `{end stop}`”

    Description: “Due to {cause}, route/line `{route name}` does not serve the stops between `{start stop}` and `{end stop}`, from`{start time}` to `{end time if applicable}`. Please use `{replacement suggestion}` instead.”

---

## Stop Closure

Example of service change:

* A stop is closed to pick-ups and drop-offs.  
* The platform of a station is closed to pick-ups and drop-offs.

Effect:

* `NO_SERVICE`

Informed Entity:

* `stop_id`

Suggestions:

* Add an alert that clearly mentions:  
  * That there is a stop closure (in the header).  
  * The name of the affected stop or platform (in the header).  
  * The time period(s) that the service disruption spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).

* If `tripUpdates` are provided, change ScheduleRelationship in the `StopTimeUpdate` of affected `stop_times` to SKIPPED if possible.  
* Remove the `stop_id` from the stop time entries in `[stop_times.txt](https://gtfs.org/documentation/schedule/reference/#stop_timestxt)` for trips that serve the closed stop. This is more important if the alert extends over time (weeks to months).  
* If it is certain that the stop is going to be permanently closed, remove it from the GTFS Schedule feed. Otherwise, you do not need to remove the stop from `[stops.txt](https://gtfs.org/documentation/schedule/reference/#stopstxt)`. 

!!! Note "Suggested template"

    Header: “Stop `{stop name and location}` is out of service”

    Description: “Due to {cause}, stop `{stop name and location}` will be out of service from`{start time}` to `{end time if applicable}`. Please use `{replacement stop}` instead.”

---

## Station Closure

Example of service change:

* A station is closed for construction, including all of its platforms, entrances and exits. The train will continue through it but will not be able to pick-up or drop-off passengers.

Effect:

* `NO_SERVICE`

Informed Entity:

* `stop_id` of the station.

Suggestions:

* Add an alert that clearly mentions:  
  * That there is a station closure (in the header).  
  * The name of the affected station (in the header).  
  * The time period(s) that the service disruption spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).

* If `tripUpdates` are provided, change `ScheduleRelationship` in the `StopTimeUpdate` of affected `stop_times` to SKIPPED if possible.  
* Remove the `stop_ids` of the station platforms from the stop time entries in `[stop_times.txt](https://gtfs.org/documentation/schedule/reference/#stop_timestxt)` for trips that serve the closed station. This is more important if the incident extends over time (weeks to months).  
* If it is certain that the station is going to be permanently closed, remove it and its child stops from the GTFS Schedule feed. Otherwise, you do not need to remove the station and its stops from `[stops.txt](https://gtfs.org/documentation/schedule/reference/#stopstxt)`.

!!! Note "Suggested template"

    Header: “Station `{station name}` is out of service”

    Description: “Due to {cause}, station `{station name}` will be out of service from`{start time}` to `{end time if applicable}`. Please use `{bus replacement service or nearest in-service station}` instead.”

---

## Detour

Example of service change:

* A bus route is deviated from its path, thereby moving the location of some stops.  
* An NYC subway line is rerouted via the tracks of another line.

Effect:

* `DETOUR`

Informed Entity:

* `route_id`  
* `direction_id` (direction of the detour).  
* Include `stop_id` (`stop_ids` of the stops inside the segment that is deviated from).  
* If only some trips are detoured during the incident, include `trip_id` if possible, using TripDescriptor .

Suggestions:

* Do not create a `DETOUR` alert if the detour does not move any stops and only changes the shape of a route. In that case, if the detour causes significant delays, treat the incident as a [`SIGNIFICANT_DELAYS` alert](#strong-delays).

* Add an alert that clearly mentions:  
  * That there is a detour (in the header).  
  * The name of the affected route (in the header).  
  * Direction (in the header)  
  * The time period(s) that the service disruption spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).  
  * If the detour changes the location of some stops, mention the affected stops or the start and end stops of the affected segment (in the header and/or description).  
  * If the detour only changes the shape of the route but keeps all stops in their original locations, mention that the no stop is affected (in the header and/or description).

* If `tripModifications` are provided, use `tripModifications` to indicate the `stop_ids` of the new stops and their new `stop_times` along with the propagated delay. Consult the [`tripModifications` reference](https://gtfs.org/documentation/realtime/feed-entities/trip-modifications/) for more information.  
* If the detour is planned, make sure it is reflected in the GTFS Schedule feed. If the detour is unplanned and it extends over time, consider adding it to the GTFS Schedule feed once you have more certainty around it.

!!! Note "Suggested template"

    Header: “Route `{route name}` is detoured between `{start stop}` and `{end stop}`”

    Description: “Due to `{cause}`, route/line `{route name}` is detoured. It will not serve the stops between `{start stop}` and `{end stop}` and will run through `{replacement streets/roads}` from`{start time}` to `{end time if applicable}`. Please use `{replacement stops}` instead.”

---

## Short Turn

Example of service change:

* A TTC streetcar performs a short turn, it turns back in the opposite direction before completing all of its stops to balance service.

Effect:

* `NO_SERVICE`  
* You may also use `MODIFIED_SERVICE` when you expect consumers to use the alert to adjust journey suggestions or routing, and when not doing so could result in presenting inaccurate information to riders.

Informed Entity:

* `route_id`  
* `direction_id` (direction of the route).  
* `trip_id` (using TripDescriptor) of the trip(s) where the short turn occurs.  
* `stop_id` (`stop_ids` that will be skipped due to the short turn)

Suggestions:

* Add an alert that clearly mentions:  
  * That there is a short turn (in the header).  
  * The name of the affected route (in the header).  
  * Direction (in the header).  
  * The time period(s) that the service disruption spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).  
  * The affected trip(s) (in the description).  
  * The stops that will be skipped due to the short turn (in the header and/or description).

* If `tripUpdates` are provided, change ScheduleRelationship in the `StopTimeUpdate` of affected `stop_times` to SKIPPED if possible.

!!! Note "Suggested template"

    Header: “Route `{route name}` is short turning before `{stop name}`”

    Description: “Route/line `{route name}` is short turning before `{stop name}`. It will not serve the stops between `{start stop}` and `{end stop}`. The affected trips are `{human-readable trip identifier. e.g. Trip start time}`”

---

## Stop Moved

Example of service change:

* Stop changes location temporarily due to construction.  
* Stop is moved permanently (the alert can remain for a while for informative reasons).

Effect:

* `STOP_MOVED`

Informed Entity:

* `stop_id` (of the stop that changed location).

Suggestions:

* Add an alert that clearly mentions:  
  * That the stop is moved (in the header).  
  * The name of the stop  (in the header).  
  * The new location of the stop (in the description).  
  * The time period(s) that the service change spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).

* The alert might exist even when the stop was changed in the GTFS Schedule feed. (Just for informative reasons; could lead to mismatch issues as no `stop_id` in GTFS).  
* If the alert is planned or extends over time (weeks to months), consider updating `stops.txt` and `[stop_times.txt](https://gtfs.org/documentation/schedule/reference/#stop_timestxt)` to reflect the new stop.

!!! Note "Suggested template"

    Header: “Stop `{stop name and location}` is moved”

    Description: “Due to {cause}, stop `{stop name and location}` is moved `{definitely or indefinitely until {end time if applicable}}` to  `{new location}`.”

---

## Light Delays

Example of service change:

* A bus route is experiencing small delays.

Suggestions:

* In `tripUpdates`, make sure that the `StopTimeUpdate` of affected `stop_times` is adjusted.  
* Insignificant delays should be in `tripUpdates`, do not create an alert.

  ---

## Strong Delays

Example of service change:

* A bus route is experiencing significant delays due to traffic.  
* A detour is causing significant delays for a route.

Effect:

* `SIGNIFICANT_DELAYS`

Informed Entity:

* `route_id`  
* `direction_id` (if route delays are only for one direction).

Suggestions:

* Add an alert that clearly mentions:  
  * That there are delays (in the header).  
  * The name of the affected route(s) (in the header and/or description).  
  * The time period(s) that the service disruption spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).

* If `tripUpdates` are provided, make sure that the `StopTimeUpdate` of affected `stop_times`  is adjusted.

!!! Note "Suggested template"

    Header: “ Delayed service on route `{route name}`”

    Description: “Due to {cause}, route/line `{route name}` is experiencing delays up to `{estimated current delay}`.”

---

## Special Schedule/Schedule Modification

Example of service change:

* Summer/winter schedule starts.  
* Special schedule for a short-term occasion where headways change.

Effect:

* `MODIFIED_SERVICE`

Informed Entity:

* `route_id` (if the modified service affects a route).  
* `direction_id` (if the modified service is along one direction only).

Suggestions:

* Add an alert that clearly mentions:  
  * That there is a special or modified service (in the header).  
  * The name(s) of the affected route(s) (in the header and/or description).  
  * The time period(s) that the service change spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).

!!! Note "Suggested template"

    Header: “ Schedule adjustment for `{route names} from `{start time}` to {end time if applicable}`”

    Description: “Due to {cause: new service, short term change}, service is adjusted for `{routes names}` from `{start time}` to {end time if applicable}. Please refer to our website `{URL (also included in the URL field)}` for further details.”

    Or

    Description: “Due to {cause: new service, short term change}, `{routes names}` will run on a `{special schedule: holiday, weekend, etc}` schedule from `{start time}` to {end time if applicable}. Please refer to our website `{URL (also included in the URL field)}` for further details.”

---

## Service Increase

Example of service change:

* Extra trains are running for a short term to cover a special occasion or an insufficient service.  
* Increased service schedule for a bus to cover trip cancellations of a train.

Effect:

* `ADDITIONAL_SERVICE`

Informed Entity:

* `route_id` (if the increased service affects a route).  
* `direction_id` (if the modified service is along one direction only).

Suggestions:

* Add an alert that clearly mentions:  
  * That the service is increased (in the header).  
  * The name(s) of the affected route(s) (in the header and/or description).  
  * The time period(s) that the service change spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).

* If the additional trips are not added in the GTFS Schedule feed:

  * If `tripUpdates` are provided, and if the service increase is unscheduled and you cannot add to a GTFS Schedule feed before 7 days of the service change: In `tripUpdates`, add the new trips with `ScheduleRelationship` in `TripDescriptor` set as `NEW`.  
  * Do not overrely on GTFS realtime TripUpdates for adding trips if you can do it in the GTFS Schedule feed.

!!! Note "Suggested template"

    Header: “ More trips running for `{route names}`”

    Description: “Due to `{cause: new service, short term change}`, more departures will run for `{routes names}` starting `{start time}` until `{end time if applicable}`. Please refer to our website `{URL (also included in the URL field)}` for further details.”

---

## Service Cuts

Example of service change:

* Reduced bus service for the short term.

Effect:

* `REDUCED_SERVICE`

Informed Entity:

* `route_id` (if the service cut affects a route).  
* `direction_id` (if the service cut is along one direction only).

Suggestions:

* Add an alert that clearly mentions:  
  * That the service is reduced (in the header).  
  * The name(s) of the affected route(s) (in the header and/or description).  
  * The time period(s) that the service change spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).

* If the removed trips are not removed in the GTFS Schedule feed:

  * If `tripUpdates` are provided, and if the service cut is unscheduled and you cannot remove them from a GTFS Schedule feed before 7 days of the service change: In `tripUpdates`, change `ScheduleRelationship` in `TripDescriptor` of the affected trips to CANCELED if possible.  
  * Do not overrely on GTFS realtime TripUpdates for removing trips if you can do it in the GTFS Schedule feed.

!!! Note "Suggested template"

    Header: “ Fewer trips running for `{route names}`”

    Description: “Due to {cause: new service, short term change}, fewer departures will run for `{routes names}` starting `{start time}` until {end time if applicable}. Please refer to our website `{URL (also included in the URL field)}` for further details.”

---

## Accessibility Issue

Example of service change:

* A station elevator is out of commission.  
* An accessibility ramp is blocked in a station.  
* The accessibility ramp of a bus is blocked.

Effect:

* `ACCESSIBILITY_ISSUE`

Informed Entity:

* `route_id`, `trip_id` (using TripDescriptor) and `direction_id` if needed (if the accessibility issue occurs on a route vehicle).  
* `stop_id` of the affected platforms and entrances/exits, and `direction_id` if needed.  
* The `stop_id` of the station is not required, as the station can be found using the GTFS Schedule feed.

Suggestions:

* Add an alert that clearly mentions:  
  * That there is an accessibility issue (in the header).  
  * The time period(s) that the service disruption spans (in the description, can be also additionally included in the header if it doesn’t make the header overlong).  
  * If the accessibility issue occurs on a vehicle  
    * Mention the name(s) of the affected route(s) (in the header and/or description).  
    * Mention the direction of the affected route(s) (in the header and/or description).  
    * Mention an identifier of the exact trip on which the accessibility issue occurs if applicable (in the description).  
  * If the accessibility issue occurs in a station  
    * Mention the name of the affected station (in the header and/or description).  
    * Mention the platforms to which the access will be affected (in the description).  
    * Mention the exact pathway (elevator, ramp, etc) that was affected (in the description).

!!! Note "Suggested template"

    Header: “`{station name}`: {pathway. e.g. Southbound platform elevator}` out of commission.”

    Description: “Due to `{cause: maintenance, mechanical error, etc}`, the `{pathway}` to the `{platform}` in `{station}` is not in service from `{start_time}` to `{end_time}`. Please use `{replacement pathway}` instead.”

!!! Note "Suggested template"

    Header: “ `{route names}`: The vehicle on {human-readable trip identifier. e.g. trip start time} is not accessible”

    Description: “Due to `{cause: e.g. mechanical error}`, the vehicle operating under `{route names}` on the trip `{human-readable trip identifier}` is not  accessible.”
