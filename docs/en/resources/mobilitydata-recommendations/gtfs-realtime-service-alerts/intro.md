# GTFS-Realtime Service Alerts Guidance: Introduction

[GTFS-Realtime Service Alerts](https://gtfs.org/documentation/realtime/reference/#message-alert) allow their producer to provide updates whenever there is disruption on the network. Service Alerts can be used to express multiple types of service disruptions, incidents and information, including:

* Closed routes and route segments.  
* Closed stops and stations.  
* Detours.  
* Severe delays in service.  
* Accessibility issues (eg: elevator not working).  
* General announcements about service.

Service Alerts can be used by multiple consumers:

* Trip planner apps (e.g. Google Maps, Transit, Apple Maps, Citymapper, Moovit).  
* Transit information websites  
* Digital signage (bus stops, displays, etc.)  
* Information channels (email, SMS, etc.)

Service Alerts are used to communicate to riders that real-time incidents and disruptions are happening in a transit system either currently or in the future. Trip planners can also choose to not suggest the disrupted services based on the Alert.

The screenshots below show possible trip planner behaviours based on GTFS-RT Service Alerts. In practice, alerts are used by trip planners :

* Inform riders about service changes and disruptions.  
* Influence journey suggestions to remove irrelevant and disrupted routes and stops.

<p align="center">
  <img src="../../../../assets/rt_alerts_guide_transit_screenshot.png" width="27%" height="400">
  <img src="../../../../assets/rt_alerts_guide_citymapper_screenshot.png" width="27.5%" height="400">
  <img src="../../../../assets/rt_alerts_guide_citymapper_screenshot_2.png" width="26%" height="400">
</p>
<p align="center"><em>Screenshots from TransitApp (left) and Citymapper (middle and right), employing Service Alerts.</em></p>

For more information, please refer to:

* [The GTFS-Realtime Service Alerts reference page](https://gtfs.org/documentation/realtime/reference/).  
* [The Service Alerts entity page](https://gtfs.org/documentation/realtime/feed-entities/service-alerts/).

To validate your GTFS-Realtime Service Alerts feed, please refer to the [GTFS Realtime Validator](https://github.com/MobilityData/gtfs-realtime-validator).

This document details some recommendations on how to use Service Alerts to the best of their abilities to provide alerts.

1) We will attach each possible use case to its appropriate service alert setup.  
2) We will explore the potential good and bad uses of certain fields.  
3) We will go through some real life examples of Service Alerts, will evaluate them, and will suggest improvements to them.
