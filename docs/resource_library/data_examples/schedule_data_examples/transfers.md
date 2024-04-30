<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/continuous-stops.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Transfers

<hr>

## Block transfers

Block transfer, also called in-seat transfer, is available when a set of trips meets the following conditions:

1. The trips are consecutive.
2. The same vehicle operates both trips.
3. The trips are provisioned with the same `block_id` value in the [trips.txt](../../reference/#tripstxt) file in the transit feed.

### Use `block_id` to enable block transfers

Block transfers can be made between consecutive trips on different routes or on the same route if the route is a loop line. Use the `block_id` field to specify which trips are in one block and where in-seat transfers are an available option.

For example, consider the following [trips.txt](../../reference/#tripstxt) and [stop_times.txt](../../reference/#stoptimestxt) values:

[**trips.txt**](../../reference/#tripstxt)

| route_id | trip_id     | block_id  |
|----------|-------------|---|
| RouteA   | RouteATrip1 |  Block1 |
| RouteB   | RouteBTrip1 |  Block1 |

[**stop_times.txt**](../../reference/#stoptimestxt)

| trip_id | arrival_time     | departure_time | stop_id | stop_sequence |
|----------|-------------|---|----|-----|
| RouteATrip1  | 12:00:00|  12:01:00 | A | 1 |
| RouteATrip1  | 12:05:00|  12:06:00 | B | 2 | 
| RouteATrip1 | 12:15:00 | | C | 3|
| RouteBTrip1 | | 12:18:00 | C | 1 |
| RouteBTrip1 |12:22:00 | 12:23:00 | D | 2 |
| RouteBTrip1 |12:30:00 |  | E | 3 | 

In this example:

- A user who searches for a route from stop A to stop E is directed to embark at stop A at 12:00 on Route A and to stay on the vehicle when it reaches stop C after the end of `RouteATrip1`. This is because the same vehicle services `RouteBTrip1` for Route B.
- Passengers on `RouteATrip1` who want to continue on to a stop on `RouteBTrip1` can stay on the vehicle for this transfer.
- Passengers of other trips on other vehicles along these same routes don't have this option because they use different vehicles for each trip.

### Block transfer in a loop line 

In a loop line, the first stop and the last stop of a trip are the same and have the same `stop_id`. Provided that consecutive loop trips have the same `block_id`, block or in-seat transfer is enabled, which lets passengers of the first trip remain on the vehicle when it continues on the next loop.