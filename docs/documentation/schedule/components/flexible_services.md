# Flexible services
Flexible services, also called demand-responsibe services, are services that do not follow the common behavior of scheduled and/or fixed  service. 

## Continuous stops

<div class="grid" markdown>

Continuous Stops is used when riders can be picked up and/or dropped off between scheduled stops all along the route or on specific sections of it. This is defined in `routes.txt`, indicating that the rider can be picked up of dropped off the transit vehicle at any point along the vehicle’s travel path, on every trip of the route.

| Files associated      | [stop_times.txt](/schedule/reference/#stop_timestxt)                           | [routes.txt](/schedule/reference/#routestxt)                               |
|-----------------------|------------------------------------------|------------------------------------------|
| **Fields associated** | continuous_pickup<br>continuous_drop_off | continuous_pickup<br>continuous_drop_off |

</div>