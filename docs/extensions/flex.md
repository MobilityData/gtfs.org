<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# GTFS-Flex

Flex is a GTFS Schedule extension project that aims to facilitate discoverability of Demand Responsive Transportation Services.

🤔 As many of you know, services like dial-a-ride are often brushed over by riders, who sometimes have no clue they even exist. This lack of accessibility is an issue for producers, consumers, and riders. Imagine a group of tourists arriving at your local airport and would like to reach a rural area that does not offer scheduled bus routes but only an on-demand bus service. The tourists check their preferred trip planner app and do not find a viable public transportation option; they end up renting a car. Being tourists, they missed all of your paper flyers posted along the hallway announcing the on-demand service. Not only is your service underutilized, but it lacks the discoverability to meet current and future rider demand. This is where GTFS-Flex comes in by providing that information to the rider allowing them to enjoy the services you worked hard to promote.

<img src="../../assets/flex-userjourney-resize.jpg" alt="GTFS-Flex User Journey">

🔮 MobilityData expects GTFS-Flex to open the door to deeper standardization of demand responsive transportation including expansion into transactional and real-time components using GTFS-OnDemand. We are preparing a suggested strategy to best handle the growing number of modes of transportation and complexity of concepts engaging in this area.

<a class="button no-icon" href="https://github.com/google/transit/issues/382" target="_blank">See the full proposal</a>

## WIP: Base Implementation
We have opened an issue to cover the base implementation of GTFS-Flex. Using this incremental approach should allow us to better establish a strong base for consensus.

🔭 Scope of GTFS-Flex: Base Implementation

Based on what has already been tested in the field, we see GTFS-Flex solving the following key use cases:

- Display available demand responsive transportation services for rider discovery
- Deviated bus routes
- Dial-a-ride (e.g Rufbus, On-call bus)
- Displaying contact information (phone number and/or website URL) for booking

<a class="button no-icon" href=https://share.mobilitydata.org/slack>Join #gtfs-flex on Slack</a><a class="button no-icon" href=https://groups.google.com/g/gtfs-changes>Join GTFS-Changes Google Group</a>

## Early Implementations

- [MNDoT Flex Pilot Project: Trillium, IBI, Transit, MNDoT, Cambridge Systematics, and Token Transit](https://blog.transitapp.com/case-study/mndot-gtfs-flex-bringing-rural-riders-into-the-fold/) 
- [Open Trip Planner](https://www.opentripplanner.org/)
- [Mobility on Demand Sandbox in Vermont](https://www.connectingcommuters.org/)
- [Tulare County Area Transit](https://ridetcat.org/)
- [Northwest Oregon Transit Alliance (NW Connector)](https://www.nworegontransit.org/)
- [Vamos Mobility App](https://vamosmobileapp.com/)
- [RTD Denver Flexride](https://www.rtd-denver.com/services/flexride)

Contact us to add your GTFS-Flex implementation to this page

<a class="button no-icon" href=https://share.mobilitydata.org/slack>Contact us</a>

## Adoption tracker
### Current

<iframe class="airtable-embed" src="https://airtable.com/embed/shrUPyCZWOWrvO2mX?backgroundColor=purple&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shrcac1fXUrMxfoDV" target="_blank">Request a change</a><a class="button no-icon" href="https://airtable.com/shrgnVR5Su9tkHvUv" target="_blank">Add your organization (consumers)</a><a class="button no-icon" href="https://airtable.com/shrsU4idBtcLuRuwZ" target="_blank">Add your organization (producers)</a>

### Future

<iframe class="airtable-embed" src="https://airtable.com/embed/shrMOvBrQCCyWPcAS?backgroundColor=purple" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shrr4FVw46i1vsOz7" target="_blank">Add your future plans</a>

## Flex Features Under Discussion

Section pending initial discussion

## History

- **2016**: <a href="https://github.com/MobilityData/gtfs-flex/tree/master" target="_blank">GTFS-Flex GitHub discussions begin</a>
- **November 2020**: <a href="https://github.com/MobilityData/gtfs-flex/tree/master" target="_blank">Repository up-to-date version of GTFS-Flex</a>
- **May 2023**: <a href="https://github.com/google/transit/issues/382" target="_blank">Work on GTFS-Flex: Base Implementation Begins</a>
