---
draft: false
pin: false
date:
  created: 2025-03-06
title: GTFS Digest - February 2025 - Rider Categories, Adopted!
description: This month’s update highlights the adoption of rider_categories.txt in GTFS-Fares v2, a clarification on continuous pickup/dropoff rules for demand-responsive transit currently up for a vote, and new discussions shaping the specification. The community is debating whether a null fare_media_id should act as a wildcard for transfer rules, whether the StopTimeEvent timestamp should shift from int64 to uint64, and why GTFS field names use singular forms even for multi-value relationships. 
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] February 2025 - Rider Categories, Adopted!

This month’s update highlights the adoption of rider_categories.txt in GTFS-Fares v2, a clarification on continuous pickup/dropoff rules for demand-responsive transit currently up for a vote, and new discussions shaping the specification. The community is debating whether a null fare_media_id should act as a wildcard for transfer rules, whether the StopTimeEvent timestamp should shift from int64 to uint64, and why GTFS field names use singular forms even for multi-value relationships. 

<!-- more -->

The GTFS Digest is a resource generated monthly by [MobilityData](https://mobilitydata.org/) providing an overview of developments on GTFS. 

We really value your feedback and would like to know how we did. We invite you to fill out [this form](https://forms.gle/GGefktvemnJD5Q9g8) and help us achieve the full potential of this tool. 


## 🏅 Contributor Shoutouts

**Max Buchholz**  
Posted his [first PR](https://github.com/google/transit/pull/541) fixing some typos in the proto file for GTFS Realtime. Thanks for your contribution! 

**Felix Gündling & Scott Berkley**  
Welcome to the GTFS community and thank you for sharing your questions and insights about GTFS Fares.

**Wojciech Kulesza**  
Thanks for taking such a big interest in Fares and joining the Working Group Meeting.

**Jerome Le Lan & lolpro11**  
Shoutout for posting your first issues on the GTFS Github Repo. Your contributions are appreciated! 

## 🗳️ Currently Voting

[**Clarification on continuous pickup/dropoff value and field Type in booking_rules.txt #528**](https://github.com/google/transit/pull/528)  
This PR introduces clarifications specifically for demand-responsive transportation (DRT) services, allowing a value of 1 for continuous_pickup/continuous_drop_off when start_pickup_drop_off_window/end_pickup_drop_off_window are indicated. It also updates the data type of four fields in booking_rules.txt to a positive integer.

## 🚀 Recently Adopted

[**[GTFS Fares v2] Add rider_categories.txt #511**](https://github.com/google/transit/pull/511)  
The rider_categories.txt file is part of the GTFS-Fares v2 proposal, aimed at modeling rider categories that are eligible for certain fares.

## 📂 Active Proposals

[**Fix typos in gtfs-realtime.proto #541**](https://github.com/google/transit/pull/541)  
1Maxnet1 flagged and suggested fixes for a few typos in the Proto file for Realtime. This is a documentation maintenance change that could benefit from review by other community members before merging. 

[**Enhancing GTFS Schedule and Realtime with original_trip_id #534**](https://github.com/google/transit/pull/534)  
Davidr1234 suggests adopting `original_trip_id` from the Google Transit extension in both GTFS Schedule and GTFS Realtime. This would allow for seamless referencing of trips between GTFS and other standards, such as SIRI and NeTEx, which have a similar concept.

[**Add stops.stop_access field #515**](https://github.com/google/transit/pull/515)  
This PR adds a stop_access field in stops.txt to indicate how the stop is accessed for a particular station. Please refer to [this proposal](https://docs.google.com/document/d/1huTq9I6Bs38ZGtcG-7Cpns0kT1njV3PoUCjnjEE0Y1E/edit?tab=t.0#heading=h.4jjq7xol2izb) for details. Adding this field is also the first phase of our three-phase plan to improve station modeling.

[**Deprecate TripUpdate.schedule_relationship = ADDED, add TripUpdate.schedule_relationship = NEW / REPLACEMENT to specify new / replaced trips which do not run on a schedule from the GTFS static. #504**](https://github.com/google/transit/pull/504)  
The original proposal in this PR was changed after a vote failed. The updated proposal focuses on deprecating TripUpdate.schedule_relationship = ADDED in GTFS Realtime and replacing it with TripUpdate.schedule_relationship = NEW to indicate a completely new trip not found in GTFS Schedule, with the new value flagged as experimental. We invite as many people as possible to join the discussion to ensure the changes are thoroughly considered by the community before the next vote.

**Other open proposals:**

* [Introduce boarding permissions to specify the carriage of vehicles at per-stop granularity #533](https://github.com/google/transit/pull/533)  
* [Addition of event_based_trips.txt to specification #527](https://github.com/google/transit/pull/527)  
* [Stop Time Events in the past should be kept #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] Add nonconsecutive_transfer_allowed field and clarify fare_transfer_type #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set matching predicates #483](https://github.com/google/transit/pull/483)  
* [Clarification of CANCELED/SKIPPED TripUpdates VS NO_SERVICE Alerts #482](https://github.com/google/transit/pull/482)  
* [[GTFS-Fares v2] Fare product/media transfer behavior #423](https://github.com/google/transit/pull/423) 

## 🔥 Most Active Conversations

[**fare_media_id for fare_transfer_rules: Wildcard or Explicit Enumeration? #538**](https://github.com/google/transit/issues/538)   
Jerome seeks clarification on whether a null fare_media_id acts as a wildcard in fare_products, allowing a free transfer across all fare media, or if explicit duplication is required for each fare medium.

[**GTFS Realtime Stop Time Updates Timestamp type #537**](https://github.com/google/transit/issues/537)  
lolpro11 questions whether the time field in StopTimeEvent, currently an int64, should be transitioned to uint64 for consistency with other GTFS Realtime timestamp fields. 

[**Pluralized field names? #536**](https://github.com/google/transit/issues/536)  
Nina questions why fields with a "Many" cardinality in GTFS are given singular rather than pluralized names. A response explains that since each row in a CSV contains only a single foreign key reference, the column name applies to the individual row rather than representing a collection.

[**Best Practices: Reasonable lengths in unique ids #518**](https://github.com/google/transit/issues/518)   
Stefan proposes to introduce a best practice that sets a recommended character limit for any ID used in a GTFS feed, triggering a validator warning if a value exceeds 36 bytes.

[**Integration of carpooling lines #430**](https://github.com/google/transit/issues/430)   
Aurélien from the French National Access Point (NAP) has opened a GitHub Issue to discuss a potential proposal to model Carpooling lines behaving like bus lines: with precise stops and destinations, but in this case, driven by regular car drivers that can receive a money incentive from fares, or share their costs with passengers. Two different potential solutions are presented for discussion.

### Slack conversations on #gtfs

Holger shared an [upcoming presentation at OpenTransportMeetup](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1738683307201049)

Matthew inquired about [the inclusion of GTFS and GTFS-RT in the Google Maps Transit Layer](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1738781861988599)

Antoine voiced a [debate regarding the association of service_id and route_id](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1739215527531599)

Emma looked for [software vendors producing GTFS-Pathways data](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1740067288244449)

Weston asked about [the impact of including frequency based services in Google Maps](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1741026771607149)

### Slack conversations on #gtfs-realtime

Paul asked for [consumers’ opinions regarding GTFS-RT matching](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1738939691099549)

Usamam looked for [user friendly tools to store GTFS-RT data](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1739988659801339)

### Slack conversations on #gtfs-flex

Isabelle shared a question on [whether Flex can be used for carpooling](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1739462251045339)

### Slack conversations on #gtfs-fares

Wojciech requested [further details on distance-based fares](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740055815487029)

Felix asked multiple questions regarding [fare_leg_rules.txt](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740687333979029), [fare_transfer_rules.txt](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740744467147399), [fare_leg_join_rules.txt](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740743816951809) and [timeframes.txt](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740387033618589) that were relevant in implementing Fares v2.

Weston followed up on a [distance-based fares question from the Fares Working Group Meeting](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740509127859989)

## 📅 Upcoming Events

[**GTFS-Fares v2 – Monthly meetings**](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-1230505989539?utm-campaign=social&utm-content=attendeeshare&utm-medium=discovery&utm-term=listing&utm-source=cp&aff=ebdsshcopyurl) | March 25, 2025 @ 11 am EST

Topics : GTFS-Fares v2 extension Working Group Meeting

## 💬 Join the GTFS Community

[**GitHub: google/transit**](https://github.com/google/transit): Share your ideas with the community! Join the official GTFS GitHub repository.

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): Get updates as soon as they happen, join the GTFS-changes google groups to get information about new pull requests and votes. 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Talk everything Realtime and stay up to date. This group is discussing the GTFS Realtime, asking questions, and proposing changes.

[**GTFS.org**](https://gtfs.org/): The official GTFS documentation website. Here you will find frequently updated resources for your GTFS needs. 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): Have a question about GTFS or need to connect with the community? Join in on GTFS slack conversations. This is a great place to have questions answered quickly by the over 1,300 mobility enthusiasts navigating our channels. 

**Thank you for reading this edition of the GTFS Digest! We look forward to bringing you the latest GTFS updates in 2025 and beyond.** 