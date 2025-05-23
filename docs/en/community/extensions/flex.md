# GTFS-Flex

GTFS Flex is a GTFS Schedule extension project that aims to facilitate the discoverability of Demand Responsive Transportation Services. 

For the major part, it has been adopted in GTFS in Match 2024. Some examples can be found on [this page](../../../documentation/schedule/examples/flex) showing what can be modeled using the officially adopted part of GTFS Flex.

🤔 Services like dial-a-ride are often brushed over by riders, who sometimes have no clue they even exist. This lack of accessibility is an issue for transit agencies, trip planners, and riders. Imagine a group of tourists arriving at your local airport who would like to reach a rural area that only offers an on-demand bus service. The tourists check their preferred trip planner app and do not find a viable public transportation option. They end up renting a car. Being tourists, they miss all of your paper flyers posted along the hallway announcing the on-demand service. Not only is your service underused, but it lacks the discoverability to meet current and future rider demand. This is where GTFS-Flex comes in. GTFS-Flex helps riders discover your service, so they enjoy the services you worked hard to promote.

<img src="../../../assets/flex-userjourney-resize.jpg" alt="GTFS-Flex User Journey">

🔮 MobilityData expects GTFS-Flex to open the door to deeper standardization of demand responsive transportation, including expansion into transactional and real-time components using GTFS-OnDemand. We are preparing a suggested strategy to best handle the growing number of modes of transportation and complexity of concepts in this area.

[See the full proposal](https://github.com/MobilityData/gtfs-flex){ .md-button .md-button--primary }

## Latest Pull Request
This extension describes services that operate according to a schedule, but also include one or more flexible features, such as:

- **Dial-a-ride service**: the vehicle serves a zone where pickups and drop offs are allowed during certain service hours.
- **Route deviation services**: the vehicle serves a fixed route and ordered set of stops, and may detour to pick up or drop off a passenger between stops.
- **Point-to-zone service**: the rider can board at a fixed stop such as a train station, and then alight anywhere within an area, or vice versa. Departures from some locations are scheduled or timed with other services.
- **Point deviation or checkpoint service**: the rider can board at a fixed stop, and then alight anywhere among an unordered list of stops, or the opposite. The driver only serves stops at which a request is made.

For more information please see [original proposal](https://github.com/MobilityData/gtfs-flex/blob/master/spec/reference.md) and [issue#382](https://github.com/google/transit/issues/382)(closed since we changed the scope).

In the working meeting on June 28th, there was an agreement among the group community to pursue an iteration that covers all fields currently produced and consumed. Therefore, all fields that appear as “**in discussion**” in the [adoption tracker](#adoption-tracker) are included in this PR.

The changes in this PR are:

- Modify file:
    - Modify `stop_areas.txt` to allow grouping of GeoJSON locations and/or stops which allow predetermined groups of these features to be specified on individual rows of `stop_times.txt`.
    - Modify `stop_times.txt` to clarify elements of the current specification necessary to inform data consumers of how to interpret the added and extended files and fields 
- Extend file:
    - Extend `stop_times.txt` with `start_pickup_drop_off_window` and `end_pickup_drop_off_window` to define the time that demand responsive transportation service becomes available/ends in a GeoJSON location, stop area or stop.
    - Extend `stop_times.txt` with `pickup_booking_rule_id` and `drop_off_booking_rule_id` to define links to booking rules
- Add new file:
    - `locations.geojson`, to define zones (`Polygon` or `Multipolygon`) where riders can request either pickup or drop off.
    - `booking_rules.txt`, to define the booking rules that provide riders information about how to request service.

Here is a [data example](https://docs.google.com/spreadsheets/d/1w5EHuHfxvejqApJFHA1Z0K2KytD9zahwbf8zyRlP_Ls/edit#gid=1451132209) for [RufBus](https://uvg-online.com/rufbus-angermuende/) in Angermünde and Gartzer, Germany. The image below is an example illustrating how the data could be presented in a trip planner:

<img src="https://github.com/google/transit/assets/126435471/c986f79a-0164-4e38-a552-7e37405fe133" width="180" height="400">

Visit the Pull Request page to read the full post and contribute to the conversation. 

[See the Pull Request](https://github.com/google/transit/pull/388){ .md-button .md-button--primary }

[Join #gtfs-flex on Slack](https://share.mobilitydata.org/slack){ .md-button .md-button--primary }

## Early Implementations

The following are some examples of early implementation of GTFS-Flex. To find current implementations, please visit the [Mobility Database](https://mobilitydatabase.org/).

- [MNDoT Flex Pilot Project: Trillium, IBI, Transit, MNDoT, Cambridge Systematics, and Token Transit](https://blog.transitapp.com/case-study/mndot-gtfs-flex-bringing-rural-riders-into-the-fold/) 
- [Open Trip Planner](https://www.opentripplanner.org/)
- [Mobility on Demand Sandbox in Vermont](https://www.connectingcommuters.org/)
- [Tulare County Area Transit](https://gotcrta.org/)
- [Northwest Oregon Transit Alliance (NW Connector)](https://nwconnector.org/other-services/)
- [Vamos Mobility App](https://vamosmobileapp.com/)
- [RTD Denver Flexride](https://www.rtd-denver.com/services/flexride)
- [Nebraska Public Transit DRT OTP Project: Trillium, Olsson, Cambridge Systematics, and TransitPlus](https://trips.nebraskatransit.com/#/)
- [One-Call/One-Click project: Find a Ride's Trip planner](https://www.findaride.org/tripplanner)

Contact us to add your GTFS-Flex implementation to this page

<a class="md-button md-button--primary" href=mailto:specification@mobilitydata.org >Contact us</a>

## Adoption tracker
### Current

<iframe class="airtable-embed" src="https://airtable.com/embed/appopXWyO2ne6THIw/shrUPyCZWOWrvO2mX?backgroundColor=purple" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

[Request a change](https://airtable.com/shrcac1fXUrMxfoDV){ .md-button .md-button--primary }
[Add your organization (consumers)](https://airtable.com/shrgnVR5Su9tkHvUv){ .md-button .md-button--primary }
[Add your organization (producers)](https://airtable.com/shrsU4idBtcLuRuwZ){ .md-button .md-button--primary }

## History

- **2013**: Original proposal written by Brian Ferris (Google)
- **2016**: <a href="https://github.com/MobilityData/gtfs-flex/tree/master" target="_blank">GTFS-Flex GitHub discussions begin</a>
- **2017**: <a href="https://www.oregon.gov/odot/RPTD/RPTD%20Document%20Library/GTFS-Flex-N-CATT.pdf" target="_blank">Mobility on Demand (MOD) sandbox program (FTA, Vermont DOT, OTP)</a>
- **2018**: MobilityData becomes GTFS-Flex steward and proposes GTFS-Flex v2
- **November 2020**: Repository up-to-date version of GTFS-Flex and OTP2 ingests GTFS-Flex v2 data
- **May 2022**: Start of MnDoT pilot (Cambridge Systematics, MNDoT, Token Transit, Transit, Trillium (OptiBus)).  
- **May 2023**: <a href="https://github.com/google/transit/issues/382" target="_blank">Work on GTFS-Flex: Service Discovery Begins</a>
- **June 2023**:  <a href="https://mobilitydata.org/recap-mobilitydata-working-meeting-gtfs-flex-service-discovery/" target="_blank">Held Conceptual Working Meeting on GTFS-Flex</a>
- **July 2023**: <a href="https://github.com/google/transit/pull/388" target="_blank">Published Pull Request #388</a>
- **August and September 2023**: <a href="https://github.com/google/transit/pull/388" target="_blank">Held "GeoJSON in GTFS?" discussions</a>
- **March 2024**: <a href="https://github.com/google/transit/pull/433" target="_blank">GTFS Flex was officially adopted</a>
