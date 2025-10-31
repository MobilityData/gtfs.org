---
draft: false
pin: false
date:
  created: 2025-10-30
title: GTFS Digest - October 2025 - Celebrating an Active Month for GTFS
description: The October 2025 GTFS Digest is here! This month was a particularly active one thanks to new faces and long-time contributors. Read on for the latest GTFS community news.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] October 2025 - Celebrating an Active Month for GTFS

This month, our contributors have been hard at work engaging with the spec. From refining details through small editorial changes to proposing new features to include brand logos, the community's creativity and collaboration have truly stood out.

<!-- more -->

The GTFS Digest is a resource distributed monthly by [MobilityData](https://mobilitydata.org/) providing an overview of developments on GTFS.

We really value your feedback and would like to know what you think of the new layout. We invite you to fill out [this form](https://forms.gle/GGefktvemnJD5Q9g8) and help us achieve the full potential of this tool.

## 🏅 Contributor Shoutouts

*Every month we highlight the contributions the GTFS community has made. This month we’d like to highlight the following contributions.*

| Contributor | Contribution |
| :---- | :---- |
| Dominik Skarżyński | A new contributor, opening a discussion about [non-overlapping duplicate service_ids in calendar.txt](https://github.com/google/transit/issues/584) |
| Felix Gündling | Opened an actively discussed [pull request about showing brand logos for transit agencies in apps.](https://github.com/google/transit/pull/585) |

## 🗳️ Currently Voting

There are no proposals currently in the voting process.

## 🚀 Recently Adopted

*This month, we’re celebrating the proposal that made it across the finish line. Check it out below.* 

| Proposal | Advocate | Description | Adoption Date |
| :---- | :---- | :---- | :---- |
| [[GTFS Fares v2] Semantics clarification #561](https://github.com/google/transit/pull/561) | Tzujenchanmbd (MobilityData) | Proposal to clarify semantics on GTFS Fares v2 files | October 14th, 2025 |

## 📂 Active Proposals

*These proposals are seeing a lot of discussion and could use your input!* 

| Proposal | Advocate | Description | Status |
| :---- | :---- | :---- | :---- |
| [Add images.txt + agency logo #585](https://github.com/google/transit/pull/585) | Felixguendling (Transitous) | This proposal adds a new `agency_brand_image_url` column to `agency.txt`, allowing brand logos to appear in trip planning applications. | Discussion Period |
| [Add new SPECIAL_EVENT Cause to GTFS-realtime Service Alerts #577](https://github.com/google/transit/pull/577) | Ckraatz (SimplifyTransit) | This proposal adds a new Cause called "Special Event" to GTFS-realtime Service Alerts applicable to disruptions such as parades, sporting events, concerts, etc. | Discussion Period |
| [Add addition best practice on hosting GTFS files #567](https://github.com/google/transit/pull/567) | doconnoronca (Transee) | This proposal introduces a best practice for hosting GTFS files, recommending that public web servers avoid blocking non-browser requests or limiting access by region, focusing instead on preventing abusive behavior. | Discussion Period |
| [[GTFS-Fares v2] Add Distance-Based Fares #556](https://github.com/google/transit/pull/556) | skalexch (MobilityData) | This PR adds a new functionality to allow the modelling of distance-based fare systems, by introducing multiple new fields on `fare_leg_rules.txt` and `stop_times.txt` as well as a new `fare_leg_distance_rules.txt` file. | Discussion Period |
| [[GTFS Fares v2] Add network sets and relax constraint on networks in fare_leg_join_rules.txt #578](https://github.com/google/transit/pull/578) | skalexch (MobilityData) | This proposal adds two new files: `network_sets.txt` network_set_elements.txt, while also relaxing some of the requirements for `fare_leg_join_rules.txt`. This would allow to match effective fare legs that span multiple networks. | Discussion Period |

### Other open proposals:

* [Add missing spaces #587](https://github.com/google/transit/pull/587)  
* [GTFS and GTFS-realtime decision process #579](https://github.com/google/transit/pull/579)  
* [Add trip_route_type into GTFS static #572](https://github.com/google/transit/pull/572)  
* [Add communication_period and impact_period #546](https://github.com/google/transit/pull/546)  
* [Enhancing GTFS Schedule and Realtime with original_trip_id #534](https://github.com/google/transit/pull/534)  
* [Introduce boarding permissions to specify the carriage of vehicles at per-stop granularity #533](https://github.com/google/transit/pull/533)  
* [Addition of event_based_trips.txt to specification #527](https://github.com/google/transit/pull/527)  
* [Stop Time Events in the past should be kept #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] Add nonconsecutive_transfer_allowed field and clarify fare_transfer_type #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set matching predicates #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] Fare product/media transfer behavior #423](https://github.com/google/transit/pull/423) 

## 🐙 Most Active Conversations on Github

*Github Issues is a great place to start a conversation, whether it’s about a new feature idea or a question about a spec. Below are this month’s most active conversations.*

| Conversation | Author | Description |
| :---- | :---- | :---- |
|  [Stop the Parasites: Protect Open Transit Data](https://github.com/google/transit/issues/586) | Stefan de Konink |  Discussion about licensing and use of GTFS regarding referral links added by vendors.  |
| [Proposal: Allow non-overlapping duplicate service_ids in calendar.txt](https://github.com/google/transit/issues/584) | Dominik Skarżyński | This proposal aims to reduce data duplication in GTFS by allowing multiple non-overlapping date ranges for the same service_id in calendar.txt. |

## 🔥 Most Active Conversations on Slack

*This month’s round-up of the most active discussions on the GTFS Slack channels.*

| Author | Description | Slack Channel |
| :---- | :---- | :---- |
| Gabriel Masiero | Asked about a [project on bus location in GTFS Realtime](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1761134635290789) | [#gtfs-realtime](https://mobilitydata-io.slack.com/archives/C3D321CKB) |
| Eva Leake | Asked about [implementing a "max distance" limitation for a trip](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1761232949894399). | [#gtfs-flex](https://mobilitydata-io.slack.com/archives/CSP7HDF37) |

## 📅 Upcoming Events

| Event | Date | Location |
| :---- | :---- | :---- |
| GTFS Fares V2 Working Group Meeting | Nov 25, 2025 | [Online](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-1230499460009) |

## 💬 Join the GTFS Community

<div class="grid cards" markdown>

- :simple-slack: Join [__Slack__](https://share.mobilitydata.org/slack) and introduce yourself to the community.

- :material-newspaper-variant: Subscribe to the [__GTFS Digest__](https://gtfs.org/blog/) for monthly updates about all things GTFS.

- :fontawesome-solid-user-group: Join [__GTFS Changes__](https://groups.google.com/g/gtfs-changes) Google Group to stay informed on development. 

- :simple-github: Visit [__GitHub__](https://github.com/google/transit) to post issues, participate in discussions around changes, and propose changes. 

</div>

**Thank you for reading this edition of the GTFS Digest! We look forward to bringing you the latest GTFS updates in 2025 and beyond.** 
