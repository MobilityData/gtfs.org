---
draft: false
pin: false
date:
  created: 2025-01-31
title: GTFS Digest - January 2025 - A Vote on Rider Categories and a Proposal on Interoperable tripid see the light
description: The January GTFS Digest covers the ongoing vote on rider_categories.txt for GTFS-Fares v2, the adoption of agency_fare_url clarifications, and proposals like original_trip_id for trip referencing and boarding_permissions.txt for vehicle carriage rules. Discussions include GTFS Realtime versioning and best practices for unique IDs.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] January 2025 - A Vote on Rider Categories and a Proposal on Interoperable “trip_id”s see the light

The January GTFS Digest covers the ongoing vote on rider_categories.txt for GTFS-Fares v2, the adoption of agency_fare_url clarifications, and proposals like original_trip_id for trip referencing and boarding_permissions.txt for vehicle carriage rules. Discussions include GTFS Realtime versioning and best practices for unique IDs.

<!-- more -->

The GTFS Digest is a resource generated monthly by [MobilityData](https://mobilitydata.org/) providing an overview of developments on GTFS. 

We really value your feedback and would like to know how we did. We invite you to fill out [this form](https://forms.gle/GGefktvemnJD5Q9g8) and help us achieve the full potential of this tool. 


## 🏅 Contributor Shoutouts

**Harpreetkaur, Laurent, Stephanie Daniels, Wojciech, & Angela Teyvi**   
Thank you for joining the GTFS slack and contributing to the community with your valuable threads. 

**David1234**  
Shoutout for posting your first Pull Request on google/transit. We are looking forward to seeing how it develops! 

**Miklcct**  
We applaud you for sticking with your proposal after an unsuccessful vote. Advocating for a proposal can be tricky and building consensus takes lots of patience. 

## 🗳️ Currently Voting

[**[GTFS Fares v2] Add rider_categories.txt #511**](https://github.com/google/transit/pull/511)  
The rider_categories.txt file is part of the GTFS-Fares v2 proposal, aimed at modeling rider categories that are eligible for certain fares.

* *Voting ends on 2025-02-13 at 23:59:59 UTC.*

## 🚀 Recently Adopted

[**Clarify use of agency_fare_url #524**](https://github.com/google/transit/pull/524)  
This PR extends the definition of agency_fare_url to also include URL pages with fare information instead of just pages that allow purchasing tickets.

## 📂 Active Proposals

[**Enhancing GTFS Schedule and Realtime with original_trip_id #534**](https://github.com/google/transit/pull/534)  
Davidr1234 suggests adopting `original_trip_id` from the Google Transit extension in both GTFS Schedule and GTFS Realtime. This would allow for seamless referencing of trips between GTFS and other standards, such as SIRI and NeTEx, which have a similar concept.

[**Introduce boarding permissions to specify the carriage of vehicles at per-stop granularity #533**](https://github.com/google/transit/pull/533)  
Miklcct proposes a generic solution to specify whether any kinds of vehicles can be carried, boarded, or alighted on public transport services at a per-stop granularity. This is achieved by introducing a new file, boarding_permissions.txt, which is referenced from stop_times.txt.

[**Clarification on continuous pickup/dropoff value and field Type in booking_rules.txt #528**](https://github.com/google/transit/pull/528)  
This PR introduces clarifications specifically for demand-responsive transportation (DRT) services, allowing a value of 1 for continuous_pickup/continuous_drop_off when start_pickup_drop_off_window/end_pickup_drop_off_window are indicated. It also updates the data type of four fields in booking_rules.txt to a positive integer.

[**Addition of event_based_trips.txt to specification #527**](https://github.com/google/transit/pull/527)  
This PR builds on issue [#526](https://github.com/google/transit/issues/526), it suggests the addition of an event_based_trips.txt file to indicate to consumers and customers that applicable trips are post-event extras.

[**Add stops.stop_access field #515**](https://github.com/google/transit/pull/515)  
This PR adds a stop_access field in stops.txt to indicate how the stop is accessed for a particular station. Please refer to [this proposal](https://docs.google.com/document/d/1huTq9I6Bs38ZGtcG-7Cpns0kT1njV3PoUCjnjEE0Y1E/edit?tab=t.0#heading=h.4jjq7xol2izb) for details. Adding this field is also the first phase of our three-phase plan to improve station modeling.

[**Deprecate TripUpdate.schedule_relationship = ADDED, add TripUpdate.schedule_relationship = NEW / REPLACEMENT to specify new / replaced trips which do not run on a schedule from the GTFS static. #504**](https://github.com/google/transit/pull/504)  
The original proposal in this PR was changed after a vote failed. The updated proposal focuses on deprecating TripUpdate.schedule_relationship = ADDED in GTFS Realtime and replacing it with TripUpdate.schedule_relationship = NEW to indicate a completely new trip not found in GTFS Schedule, with the new value flagged as experimental. We invite as many people as possible to join the discussion to ensure the changes are thoroughly considered by the community before the next vote.

**Other open proposals:**

* [Stop Time Events in the past should be kept #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] Add nonconsecutive_transfer_allowed field and clarify fare_transfer_type #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set matching predicates #483](https://github.com/google/transit/pull/483)  
* [Clarification of CANCELED/SKIPPED TripUpdates VS NO_SERVICE Alerts #482](https://github.com/google/transit/pull/482)  
* [[GTFS-Fares v2] Fare product/media transfer behavior #423](https://github.com/google/transit/pull/423) 

## 🔥 Most Active Conversations

[**[Discussion] GTFS Realtime Versioning #530**](https://github.com/google/transit/issues/530)  
In recent discussions regarding GTFS Realtime, the community seems to have encountered difficulties in reaching consensus, leading to the topic of versioning being raised in the recent PR#504. To address this, we are opening this issue dedicated to discussing GTFS Realtime versioning.

[**Ad-hoc trips in GTFS-RT TripUpdates feed use of trip_id not found in GTFS-Static #529**](https://github.com/google/transit/issues/529)  
Mpaine-act is setting up a new GTFS-Realtime TripUpdates feed and seeks guidance on handling trips not found in GTFS-Static. The issue compares two approaches: using a negative (fake) trip_id for backward compatibility or omitting the trip_id entirely.

[**Add communication_period and impact_period to GTFS Service Alerts #521**](https://github.com/google/transit/issues/521)  
The GTFS Realtime Alert active_period field is ambiguous, as it could mean either the alert's display period or the disruption's duration. A proposal suggests adding communication_period for the alert's display and impact_period for the disruption timeframe to clarify its use.

[**Best Practices: Reasonable lengths in unique ids #518**](https://github.com/google/transit/issues/518)  
This issue proposes to introduce a best practice that sets a recommended character limit for any ID used in a GTFS feed, triggering a validator warning if a value exceeds 36 bytes.

[**Global trip id #462**](https://github.com/google/transit/issues/462)  
David from SKI+ proposes a new field "trip_global_id" in GTFS Schedule and Realtime for better integration with other standards like NeTEx and HRDF, addressing a need for a day-long valid trip identifier. This global ID would allow easier mapping of travel information across different data formats.

[**Proposed Best Practice: always including trip_id in TripDescriptor for SCHEDULED trips #465**](https://github.com/google/transit/issues/465)  
This proposal suggests mandating the use of `trip_id` in the TripDescriptor for SCHEDULED trips in GTFS Realtime to simplify data integration, as the alternative method using multiple identifiers often causes issues. 


### Slack conversations on #gtfs

Guillaume asked [if Google is using boarding areas](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736191393238099?thread_ts=1719341926.148069&cid=C3FFFKX9C)

Stephanie had a question about [best practices for GTFS calendars](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736198110045109)

Wojciech inquired about [cancelling scheduled trips in GTFS](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736511997339379)

Aaron asked about [the expectations around shape_dist _travelled amongst GTFS consumers](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736876535662269).

Angela requested a method to [produce GTFS by querying OSM](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1737478885517559)

Harpreetkaur seeked advice for [best practices regarding GTFS-RT TripUpdates for the last stop of a trip](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1737492251744489) 

### Slack conversations on #gtfs-realtime

Michael requested [a tool that combines multiple GTFS-RT feeds into a single feed](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1737552364940779).

Laurent asked for advice about [how to propagate delay in a trip that hasn’t started yet](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1737741170127629).

## 📅 Upcoming Events

[**GTFS-Fares v2 – Monthly meetings**](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-1230505989539?utm-campaign=social&utm-content=attendeeshare&utm-medium=discovery&utm-term=listing&utm-source=cp&aff=ebdsshcopyurl) | February 25, 2025 @ 11 am EST

Topics : GTFS-Fares v2 extension Working Group Meeting

## 💬 Join the GTFS Community

[**GitHub: google/transit**](https://github.com/google/transit): Share your ideas with the community! Join the official GTFS GitHub repository.

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): Get updates as soon as they happen, join the GTFS-changes google groups to get information about new pull requests and votes. 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Talk everything Realtime and stay up to date. This group is discussing the GTFS Realtime, asking questions, and proposing changes.

[**GTFS.org**](https://gtfs.org/): The official GTFS documentation website. Here you will find frequently updated resources for your GTFS needs. 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): Have a question about GTFS or need to connect with the community? Join in on GTFS slack conversations. This is a great place to have questions answered quickly by the over 1,300 mobility enthusiasts navigating our channels. 

**Thank you for reading this edition of the GTFS Digest! We look forward to bringing you the latest GTFS updates in 2025 and beyond.** 