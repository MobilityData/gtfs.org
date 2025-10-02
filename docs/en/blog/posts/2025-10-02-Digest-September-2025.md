---
draft: false
pin: false
date:
  created: 2025-10-02
title: GTFS Digest - September 2025 - New cEMV Field Adopted
description: The September 2025 GTFS Digest is here! This month, the GTFS community voted on a few proposals, two of which have been adopted into the specification, such as a new cEMV field.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] September 2025 - New cEMV Field Adopted

This month, the GTFS community voted on a few proposals, two of which have been adopted into the specification, such as a new cEMV field to easily indicate when contactless payment is accepted. More discussions concerning a `SPECIAL_EVENT` field in GTFS-Realtime, network sets in Fares V2, and best practices for hosting GTFS files continue on, so make sure to join in!

<!-- more -->

The GTFS Digest is a resource distributed monthly by [MobilityData](https://mobilitydata.org/) providing an overview of developments on GTFS.

We really value your feedback and would like to know what you think of the new layout. We invite you to fill out [this form](https://forms.gle/GGefktvemnJD5Q9g8) and help us achieve the full potential of this tool.

## 🏅 Contributor Shoutouts

*Every month we highlight the contributions the GTFS community has made. This month we’d like to highlight the following contributions.*

| Contributor | Contribution |
| :---- | :---- |
| **Sierra W.** | First contribution on the GTFS-Fares channel |
| **Masahiro Bessho, Matt Caywood, Masahiko Fukuda, Masaki Ito, M1LL3RD, BKK-Budapest** | Casting their first vote on a PR |
| **ODPT** | First producer and first vote on PR# 545 |

## 🗳️ Currently Voting

*Below is a list of proposals that are currently being voted on. We invite you to take a look and participate in the voting process.*

| Proposal | Advocate | Description | Voting Deadline |
| :---- | :---- | :---- | :---- |
| [[GTFS Fares v2] Semantics clarification #561](https://github.com/google/transit/pull/561) | Tzujenchanmbd (MobilityData) | Proposal to clarify semantics on GTFS Fares v2 files | October, 6th |

## 🚀 Recently Adopted

*This month, we’re celebrating the proposals that made it across the finish line. Check them out below.* 

| Proposal | Advocate | Description | Adoption Date |
| :---- | :---- | :---- | :---- |
| [Add `cemv_support` field in `agency.txt` and `routes.txt` #545](https://github.com/google/transit/pull/545) | Sergiodero (MobilityData) | This PR introduces a new cemv_support field in `agency.txt` and routes.txt to indicate if riders can use contactless Europay, Mastercard, and Visa to access a transit service under a specific agency or route | Vote closed on September 29th |
| [Add `stops.stop_access` field #515](https://github.com/google/transit/pull/515) | tzujenchanmbd (MobilityData) | This PR adds a `stop_access` field in `stops.txt` to indicate how the stop is accessed for a particular station. Please refer to [this proposal](https://docs.google.com/document/d/1huTq9I6Bs38ZGtcG-7Cpns0kT1njV3PoUCjnjEE0Y1E/edit?tab=t.0#heading=h.4jjq7xol2izb) for details.  | Vote closed on  September 22nd |

## 📂 Active Proposals

*These proposals are seeing a lot of discussion and could use your input!* 

| Proposal | Advocate | Description | Status |
| :---- | :---- | :---- | :---- |
| [[GTFS Fares v2] Update forbidden for `network_id` in `routes.txt` if `networks.txt` exists too #581](https://github.com/google/transit/pull/581) | Skalexch (MobilityData) | This PR adds networks.txt to files that forbid the existence of `network_id` in `routes.txt` | Discussion Period |
| [GTFS and GTFS-realtime decision process #579](https://github.com/google/transit/pull/579)  | Ckraatz (SimplifyTransit) | This PR aims to modify the governance process for GTFS Schedule and Realtime. | Discussion Period |
| [Add network sets and relax constraint on networks in `fare_leg_join_rules.txt` #578](https://github.com/google/transit/pull/578) | Skalexch (MobilityData) | This proposal adds two new files: `network_sets.txt` and `network_set_elements.txt`, while also relaxing some of the requirements for `fare_leg_join_rules.txt`. This would allow to match effective fare legs that span multiple networks. | Discussion Period |
| [Add `communication_period` and `impact_period` #546](https://github.com/google/transit/pull/546) | Skalexch (MobilityData) | This PR clarifies and disambiguates the GTFS Realtime Alert spec's `active_period` field by introducing two new fields: `communication_period` and `impact_period`. The discussion focuses on use cases and exclusions. |  |
| [Add new `SPECIAL_EVENT` Cause to GTFS-realtime Service Alerts #577](https://github.com/google/transit/pull/577) | Ckraatz (SimplifyTransit) | This proposal adds a new Cause called "Special Event" to GTFS-realtime Service Alerts applicable to disruptions such as parades, sporting events, concerts, etc. | Discussion Period |
| [add `trip_route_type` into `trips.txt` GTFS static #572](https://github.com/google/transit/pull/572) | miklcct(Jnction) | This proposal adds a new optional field, called `trip_route_type`, into `trips.txt`. | Discussion Period  |
| [Add addition best practice on hosting GTFS files #567](https://github.com/google/transit/pull/567) | doconnoronca (Transee) | This proposal introduces a best practice for hosting GTFS files, recommending that public web servers avoid blocking non-browser requests or limiting access by region, focusing instead on preventing abusive behavior. | Discussion Period |

### Other open proposals:

* [[GTFS-Fares v2] Add Distance-Based Fares #556](https://github.com/google/transit/pull/556)  
* [Fix typos in gtfs-realtime.proto #541](https://github.com/google/transit/pull/541)  
* [Enhancing GTFS Schedule and Realtime with original_trip_id #534](https://github.com/google/transit/pull/534)  
* [Introduce boarding permissions to specify the carriage of vehicles at per-stop granularity #533](https://github.com/google/transit/pull/533)  
* [Addition of event_based_trips.txt to specification #527](https://github.com/google/transit/pull/527)  
* [Stop Time Events in the past should be kept #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] Add `nonconsecutive_transfer_allowed` field and clarify `fare_transfer_type` #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set matching predicates #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] Fare product/media transfer behavior #423](https://github.com/google/transit/pull/423) 

## 🐙 Most Active Conversations on Github

*Github Issues is a great place to start a conversation, whether it’s about a new feature idea or a question about a spec. Below are this month’s most active conversations.*

| Conversation | Author | Description |
| :---- | :---- | :---- |
| [Add Cause and DayTimePeriod to GTFS-TripModifications #580](https://github.com/google/transit/issues/580) | **Ckraatz (Simplify Trannsit)** | This discussion centers around the possibility of adding new information elements to Trip Modifications, to communicate the cause of the modification and the days and time periods when the modification will take place. |

## 🔥 Most Active Conversations on Slack

*This month’s round-up of the most active discussions on the GTFS Slack channels.*

| Author | Description | Slack Channel |
| :---- | :---- | :---- |
| Stephen Miller | Looked for [volunteers to interview agencies about GTFS](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1758013110596709) | #gtfs |
| Leonard Ehrenfried | Asked about [the interpretation of a case including network_id and from/to_area_id](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1759135967840069) | #gtfs-fares |
| Lars Persson | Asked for [advice regarding creating an app using Transit data](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1759224364887579) | #gtfs-realtime |

## 📅 Upcoming Events

| Event | Date | Location |
| :---- | :---- | :---- |
| GTFS Fares V2 Working Group Meeting | Oct 28, 2025 | [Online](https://mobilitydata.org/event/specifications-discussions-gtfs-fares-v2-monthly-meeting-8/2025-10-28/) |
 

## 💬 Join the GTFS Community

<div class="grid cards" markdown>

- :simple-slack: Join [__Slack__](https://share.mobilitydata.org/slack) and introduce yourself to the community.

- :material-newspaper-variant: Subscribe to the [__GTFS Digest__](https://gtfs.org/blog/) for monthly updates about all things GTFS.

- :fontawesome-solid-user-group: Join [__GTFS Changes__](https://groups.google.com/g/gtfs-changes) Google Group to stay informed on development. 

- :simple-github: Visit [__GitHub__](https://github.com/google/transit) to post issues, participate in discussions around changes, and, propose changes. 

</div>

**Thank you for reading this edition of the GTFS Digest! We look forward to bringing you the latest GTFS updates in 2025 and beyond.** 
