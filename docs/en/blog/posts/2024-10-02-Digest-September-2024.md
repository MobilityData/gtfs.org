---
draft: false
pin: false
date:
  created: 2024-10-02
title: GTFS Digest - September 2024 - Loads of new conversations
description: The September 2024 GTFS Digest highlights recent contributions, including adopted proposals on validity rules for polygons and clarifications for from/to\_stop\_id in transfers.txt. It also features active proposals like adjustments to trip modifications and updates to nonconsecutive transfers in GTFS-Fares v2. This edition showcases a surge of new conversations, sparking discussions on HTTPS best practices, route deviation, and more.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] September 2024 - Loads of new conversations 

The September 2024 GTFS Digest highlights recent contributions, including adopted proposals on validity rules for polygons and clarifications for from/to_stop_id in transfers.txt. It also features active proposals like adjustments to trip modifications and updates to nonconsecutive transfers in GTFS-Fares v2. This edition showcases a surge of new conversations, sparking discussions on HTTPS best practices, route deviation, and more.

<!-- more -->

## 🏅 Contributor Shoutouts

**Uriel Fojas**  
Thanks for taking the time to post your first Slack thread!

**Evan Siroki, Stefan de Konink, & Weston Shippy**  
Shoutout for continuously supporting the development of GTFS by contributing 2 new issues each this past month!

**Philip Cline**  
You sparked a great conversation on GTFS merge tooling! Hope this leads to something.

## 🚀 Recently Adopted

[**Add validity rules for polygons in locations.geojson #476**](https://github.com/google/transit/pull/476)  
This PR proposes to refer to the OpenGIS Simple Features Specification, section 6.1.11 to improve the validity rules for flex polygons, instead  of describing all the ways in which polygons can be invalid in GTFS.

[**[Clarification] from/to_stop_id & from/to_trip_id description in transfers.txt #455**](https://github.com/google/transit/pull/455)  
This PR clarifies the description of from/to_stop_id and from/to_trip_id in transfers.txt without changing the original semantics.

## 📂 Active Proposals

[**Adjustment to trip modifications #497**](https://github.com/google/transit/pull/497)  
This PR clarifies the GTFS Realtime documentation regarding Trip Modifications, adding support for frequency based services, adding missing extensions fields in the .proto file and making documentation more comprehensive and consistent across different files.

[**[GTFS Fares v2] Add nonconsecutive_transfer_allowed field and clarify fare_transfer_type #498**](https://github.com/google/transit/pull/498)  
This PR add nonconsecutive-transfer-allowed field in fare_transfer_rules.txt to indicate whether the transfer rule is allowed to apply to non-consecutive transfers, also clarifies fare_transfer_type description for journeys with multiple transfers

[**Stop Time Events in the past should be kept #502**](https://github.com/google/transit/pull/502)  
This PR changes the description in StopTimeUpdates from "allowing" the retention of past stop times to "recommending" the retention.

[**Specify the behaviour of TripUpdate.schedule_relationship = ADDED, and un-deprecate REPLACEMENT #504**](https://github.com/google/transit/pull/504)  
This PR specifies the behavior of ADDED, and un-deprecate REPLACEMENT, based on the implementation of OpenTripPlanner which specifies the whole journey to be added or replaced. Additional fields, such as headsigns, and pickup / drop-off types, are introduced as required to support the full specification of completely new trips.

**Other open proposals:**

* [[GTFS Fares v2] Area Set matching predicates #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] Add fare_leg_join_rules.txt (first iteration) #439](https://github.com/google/transit/pull/439)  
* [Add Feed Version and GTFS url to the GTFS real time FeedHeader #434](https://github.com/google/transit/pull/434)  
* [[GTFS-Fares v2] Fare product/media transfer behavior #423](https://github.com/google/transit/pull/423) 

## 🔥 Most Active Conversations

[**Adding a best practice to use HTTPS... or at least have good SSL health? #496**](https://github.com/google/transit/issues/496)  
Evan suggests adding a best practice that recommends using HTTPS with good health of the SSL certificates.

[**Is the current solution for Route Deviation provided by Flex sufficient? #499**](https://github.com/google/transit/issues/499)  
Weston proposes a method for modeling deviated routes directly in the stop_times.txt without creating any polygon data.

[**transfer_type = 1 #500**](https://github.com/google/transit/issues/500)  
Stefan points out a potential clarification to the description of transfer_type = 1 in transfers.txt, and asks for use cases that might be missing with this approach.

[**Allow adding start and end dates to timeframes.txt #506**](https://github.com/google/transit/issues/506)  
Evan suggests adding columns start_date and end_date to timeframes.txt in order to model temporary fare policies such as a free fare weekend.

[**How is continuous_pickup/continuous_drop_off forbid language interpreted? Should it be adjusted to explicitly allow values of 1? #507**](https://github.com/google/transit/issues/507)  
Weston suggests clarifying the use of continuous_pickup/continuous_drop_off in stop_times.txt when modeling demand responsive services that use stop_times.end_pickup_drop_off_window, so that producers are able to specify that continuous pick-up or drop off is not allowed.

[**Missing functionality to define "conceptual grouping of stops/stations" in existing GTFS #438**](https://github.com/google/transit/issues/438)  
MobilityData proposes a [3-phase plan](https://github.com/google/transit/issues/438#issuecomment-2289511429) to improve station modeling, and would love to see any feedback on the plan. If there are no major objections, we will proceed with the first phase soon.

[**Add cars_allowed field to trips.txt #466**](https://github.com/google/transit/issues/466)  
Recent comments leaned towards using boarding_permissions.txt instead of adding cars_allowed to trips.txt, while also noting that the convenience of knowing whether cars are permitted to board and alight at each stop, could justify the need for special handling.
 

### Slack conversations on #gtfs

Walter Jenkins inquires about [**implementing bike buses in GTFS for the city of St-Loui**s](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1725502423179069)

Philip Cline asks: [**What do agencies use to merge GTFS feeds for a service change without losing timepoints or changing block IDs by default?**](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1726493345923399)

Uriel Fojas could use some advice on: [**a project to centralize stop amenity data at the state-level for statewide planning.**](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1726786680320179)

Josh Druker asks: [**Are there any thoughts on how to switch service from normal service to emergency/reduced level service (for stuff like weather emergencies)?**](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1726925502813659)


### Slack conversations on #gtfs-fares

Evan Siroki mentions: [**I'd like to add in some exceptions to be able to model a "FARE FREE week", but it looks like there would be a need to create a new service_id for this and thus interfere with files outside the Fares v2 realm.**](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1727195591059179)

### Slack conversations on #gtfs-flex

Daniel Michalov asks: [**Are there any other factors that might be limiting the maximum length of flex trips in OTP?**](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1725553302355079)

Marcy Jaffe asks: [**For an agency with valid GTFS-schedule, when they also generate a new route with GTFS-Flex (thank you, Spare Labs) will they need to merge the two datasets to one ? Do you have a tutorial on which data elements must match?**](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1725714575720539)

Fabian Braun asks: [**Do we know what Google’s plans are concerning GTFS-Flex? Has there been any public announcement that I missed?**](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1726481999646599)


## 📅 Upcoming Events

[**GTFS-Fares v2 – Monthly meetings**](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-769939809697) | October 22, 2024 @ 11 am EDT

Topics : GTFS-Fares v2 extension Working Group Meeting

## 💬 Join the GTFS Community

[**GitHub: google/transit**](https://github.com/google/transit): Share your ideas with the community! Join the official GTFS GitHub repository.

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): Get updates as soon as they happen, join the GTFS-changes google groups to get information about new pull requests and votes. 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Talk everything Realtime and stay up to date. This group is discussing the GTFS Realtime, asking questions, and proposing changes.

[**GTFS.org**](https://gtfs.org/): The official GTFS documentation website. Here you will find frequently updated resources for your GTFS needs. 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): Have a question about GTFS or need to connect with the community? Join in on GTFS slack conversations. This is a great place to have questions answered quickly by the over 1,300 mobility enthusiasts navigating our channels. 

**Thank you for reading this edition of the GTFS Digest! We look forward to bringing you the latest GTFS updates in 2024 and beyond.** 
