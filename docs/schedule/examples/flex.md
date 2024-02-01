<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/flex.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Flex

<hr>

Flex is a GTFS extension project that aims to facilitate discoverability of Demand Responsive Transportation Services.

The following example demonstrates how to model different demand responsive service use cases using Flex. **Please note that the following examples are not necessarily an accurate or complete representation of the agencies’ services.**

## On-demand services within a single zone
Demand-repsonsive services can operate within a specific zone, allowing riders to book pickups at any point A within the zone and drop-offs at any point B within the same zone. An example of this is the [Heartland Express Transit](https://www.co.brown.mn.us/heartland-express-transit?view=category&id=56) service in Minnesota, USA.

### Define trips
Heartland Express service hours are as follow:
- Weekdays:
  - 8:00 AM - 5:00 PM
  - 6:15 AM – 5:45 PM (New Ulm Only)
- Sunday: 8:00 AM - Noon (New Ulm Only)

The New Ulm city zone is included within the Brown County zone. To avoid the "zone overlap constraint" issue, Heartland Express can be defined with four trips:
- Service in New Ulm from 6:15 AM to 8:00 AM on weekdays.
- County-wide service from 8:00 AM to 5:00 PM on weekdays.
- Service in New Ulm from 5:00 PM to 5:45 PM on weekdays.
- Service in New Ulm from 8:00 AM to 12:00 PM on Sundays.
  
[**trips.txt**](../../reference/#tripstxt)
route_id | service_id | trip_id
-- | -- | -- 
74362 | c_67295_b_77497_d_31 | t_5374945_b_77497_tn_0
74362 | c_67295_b_77497_d_31 | t_5374946_b_77497_tn_0
74362 | c_67295_b_77497_d_31 | t_5374944_b_77497_tn_0
74362 | c_67295_b_77497_d_64 | t_5374947_b_77497_tn_0

`service_id = c_67295_b_77497_d_31` refers to weekdays, `service_id = c_67295_b_77497_d_64` refers to Sunday.

### Define zones (GeoJSON locations)
Using locations.geojson to define the operational zone of Heartland Express service, separate zones must be defined for Brown County and New Ulm City. Below is a simplified GeoJSON defining the zone of Brown County:
```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "id": "area_708",
      "type": "Feature",
      "geometry": {
        "type": "Polygon",
        # Simplified, only presenting 3 coordinates here.
        "coordinates": [
          [
            [
              -94.7805702,
              44.4560958
            ],
            [
              -94.7805608,
              44.4559928
            ],
            [
              -94.7805218,
              44.4559649
            ]
          ]
        ]
      },
      "properties": {}
    }
  ]
```

### Define booking rules
Here are booking rules that apply to all Heartland Express services:
- Ride requests should be made between 8 AM and 3 PM weekdays. 
- Rides must be requested one business day prior to day of the ride. 
- Ride requests can be made up to 14 days in advance.

Using `booking_type = 2` indicates that the service requires up to prior day(s) booking. `prior_notice_last_day = 1` and `prior_notice_start_day = 14` indicate  indicate that the service can be booked as early as 14 days in advance and as late as the day before.

[**booking_rules.txt**](../../reference/#booking_rulestxt)
booking_rule_id | booking_type | prior_notice_start_day | prior_notice_start_time | prior_notice_last_day | prior_notice_last_time | message | phone_number | info_url
-- | -- | -- | -- | -- | -- | -- | -- | --
booking_route_74362 | 2 | 14 | 8:00:00 | 1 | 15:00:00 | Brown County Heartland Express provides door-to-door on-demand transportation. To request a ride, call 1-507-359-2717 or 1-800-707-2717 by 3pm at least one business day ahead of your trip. | (507) 359-2717 | https://www.co.brown.mn.us/heartland-express-transit

### Define stop_times
- The operating hours are defined using the `start_pickup_drop_off_window` and `end_pickup_drop_off_window` fields.
- Travel within the same zone requires two records in stop_times.txt with the same `location_id`.
  - The first record with `pickup_type = 2` and `drop_off_type = 1` indicates that booking boarding is allowed in the zone.
  - The second record with `pickup_type = 1` and `drop_off_type = 2` indicates that booking alighting is allowed in the zone.
 
[**stop_times.txt**](../../reference/#stop_timestxt)
trip_id | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | --
t_5374944_b_77497_tn_0 | area_715 | 1 | 06:15:00 | 08:00:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374944_b_77497_tn_0 | area_715 | 2 | 06:15:00 | 08:00:00 | 1 | 2 | booking_route_74362 | booking_route_74362
t_5374945_b_77497_tn_0 | area_708 | 1 | 08:00:00 | 17:00:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374945_b_77497_tn_0 | area_708 | 2 | 08:00:00 | 17:00:00 | 1 | 2 | booking_route_74362 | booking_route_74362
t_5374946_b_77497_tn_0 | area_715 | 1 | 17:00:00 | 17:45:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374946_b_77497_tn_0 | area_715 | 2 | 17:00:00 | 17:45:00 | 1 | 2 | booking_route_74362 | booking_route_74362
t_5374947_b_77497_tn_0 | area_715 | 1 | 08:00:00 | 12:00:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374947_b_77497_tn_0 | area_715 | 2 | 08:00:00 | 12:45:00 | 1 | 2 | booking_route_74362 | booking_route_74362

`area_715` refers to New Ulm City zone, `area_708` refers to Bronw County zone. 

## On-demand services between multiple zones

## On-demand services where riders must board and alight at specific locations
In certain demand-responsive services, riders are unable to specify boarding and alighting at any location within a zone. Instead, riders can only book to board and alight at specific designated stops(collection points/ virtual stops). An example of this is the [RufBus service](https://uvg-online.com/rufbus-angermuende/) in Angermünde and Gartz, Germany:

### Define trips
Route 476 offers on-demand services between each stop in the Angermünde region, including two trips(services): one for weekdays and the other for weekends. 

[**trips.txt**](../../reference/#tripstxt)
route_id | service_id | trip_id 
-- | -- | -- 
476 | on_demand_weekdays | 476_weekdays 
476 | on_demand_weekends | 476_weekends 

### Define location groups
As riders can book services between each stop, to avoid defining all stop-to-stop combinations in stop_times.txt, the appropriate approach is to define these stops as a location group using location_groups.txt and location_group_stops.txt.

[**location_groups.txt**](../../reference/#location_groupstxt)
location_group_id | location_group_name 
-- | -- 
476_stops | durch den RufBus 476 bedientes Gebiet im Raum Angermünde

[**location_group_stops.txt**](../../reference/#location_group_stopstxt)
location_group_id | stop_id 
-- | -- 
476_stops | de:12073:900340004::1
476_stops | de:12073:900340004::2
476_stops | de:12073:900340004::3
476_stops | de:12073:900340004::4
476_stops | de:12073:900340100::1
476_stops | de:12073:900340100::2
476_stops | ...

### Define booking rules
- The 476 route service requires booking at least one hour in advance. Using `booking_type = 1` indicates that the service requires up to same-day booking with advance notice. The `prior_notice_duration_min = 60` indicates a requirement for booking at least 60 minutes in advance.
- There are slight differences between weekday and weekend bookings, so separate booking rules can be defined for weekday and holiday services. More details can be provided in the `message` field.
- Information and booking page links can be provided in the `info_url` and `booking_url` fields.

[**booking_rules.txt**](../../reference/#booking_rulestxt)
booking_rule_id | booking_type | prior_notice_duration_min | message | phone_number | info_url | booking_url
-- | -- | -- | -- | -- | -- | --
flächenrufbus_angermünde_weekdays | 1 | 60 | Anmeldung mind. 60min vorher erforderlich, per Anruf zwischen 08:00 und 24:00 möglich, oder online rund um die Uhr | +49 3332 442 755 | https://uvg-online.com/rufbus-angermuende/ | https://uvg.tdimo.net/bapp/#/astBuchungenView
flächenrufbus_angermünde_weekends | 1 | 60 | 1€ Komfortzuschlag pro Person; Anmeldung mind. 60min vorher erforderlich, per Anruf zwischen 08:00 und 24:00 möglich, oder online rund um die Uhr | +49 3332 442 755 | https://uvg-online.com/rufbus-angermuende/ | https://uvg.tdimo.net/bapp/#/astBuchungenView

### Define stop_times
- The 476 route operates from 5:30 PM to 10:00 PM on weekdays and from 8:00 AM to 10:00 PM on weekends. The operating hours are defined using the `start_pickup_drop_off_window` and `end_pickup_drop_off_window` fields.
- Travel within the same location group requires two records in stop_times.txt with the same `location_group_id`.
  - The first record with `pickup_type = 2` and `drop_off_type = 1` indicates that booking boarding is allowed at the location group.
  - The second record with `pickup_type = 1` and `drop_off_type = 2` indicates that booking alighting is allowed at the location group.

[**stop_times.txt**](../../reference/#stop_timestxt)
trip_id | location_group_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | --
476_weekdays | 476_stops | 1 | 17:30:00 | 22:00:00 | 2 | 1 | flächenrufbus_angermünde_weekdays | flächenrufbus_angermünde_weekdays
476_weekdays | 476_stops | 2 | 17:30:00 | 22:00:00 | 1 | 2 | flächenrufbus_angermünde_weekdays | flächenrufbus_angermünde_weekdays
476_weekends | 476_stops | 1 | 08:00:00 | 22:00:00 | 2 | 1 | flächenrufbus-angermünde_weekdays | flächenrufbus-angermünde_weekends
476_weekends | 476_stops | 2 | 08:00:00 | 22:00:00 | 1 | 2 | flächenrufbus-angermünde_weekdays | flächenrufbus-angermünde_weekends

## Deviated route

## Routing behavior

### Ignoring intermediate stop_times records with pickup/drop-off Windows
When providing routing or travel time between the origin and destination, data consumers should ignore intermediate stop_times.txt records that have `start_pickup_drop_off_window` and `end_pickup_drop_off_window` defined. For example:
trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | Zone1 | 1 | 2 | 1 | 08:00:00 | 18:00:00
tripA | Zone2 | 2 | 1 | 2 | 08:00:00 | 14:00:00
tripA | Zone3 | 3 | 1 | 2 | 10:00:00 | 18:00:00

Consumers should not take Zone2 into consideration when providing routing or travel time for a trip from Zone1 to Zone3.

### Zone overlap constraint
Simultaneous overlap of locations.geojson `id` geometry, `start/end_pickup_drop_off_window` time, and `pickup_type` or `drop_off_type` between two or more stop_times records with the same `trip_id` is forbidden.

For example:
(Where `northportland` refers to a zone within `portland`)

**Forbidden**
trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | northportland | 2 | 2 | 1 | 10:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00

**Allowed**
trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | northportland | 2 | 2 | 1 | 12:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00

or

trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | northportland | 2 | 1 | 2 | 10:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00

or

trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | gresham | 2 | 2 | 1 | 10:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00

<hr>
