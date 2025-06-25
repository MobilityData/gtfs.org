---
draft: false
pin: false
date:
  created: 2025-01-07
title: GTFS Digest - December 2024 - 2 Votes and 1 Adoption to celebrate the Digest’s 1-year anniversary!
description: Let's celebrate the Digest's 1-year anniversary with 2 votes and an adoption to the specification. The community is currently voting on a proposal to clarify the use of agency_fare_url and a proposal that specifies the behavior of ADDED, and un-deprecate REPLACEMENT in TripUpdates. We also recommend that you take a look at the latest adoption that adds fare_leg_join_rules.txt to the specification.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] December 2024 - 2 Votes and 1 Adoption to celebrate the Digest’s 1-year anniversary!

Let's celebrate the Digest's 1-year anniversary with 2 votes and an adoption to the specification. The community is currently voting on a proposal to clarify the use of agency_fare_url and a proposal that specifies the behavior of ADDED, and un-deprecate REPLACEMENT in TripUpdates. We also recommend that you take a look at the latest adoption that adds fare_leg_join_rules.txt to the specification.

<!-- more -->

The GTFS Digest is a resource generated monthly by [MobilityData](https://mobilitydata.org/) providing an overview of developments on GTFS. 

We really value your feedback and would like to know how we did. We invite you to fill out [this form](https://forms.gle/GGefktvemnJD5Q9g8) and help us achieve the full potential of this tool. 

## 📢 Announcements

[**You’re invited to review the GTFS Governance Changes Proposal Document**](https://docs.google.com/document/d/1EyJFvgOXZ4Gq6d6GJ6Hibey8Gkwyh7M25ECGwarmsT8/edit?usp=sharing)  
Informed by discussions held during the Governance Working Group Meetings and the 2023 MobilityData Workshops, this document reflects the insights gathered from those sessions. We kindly request your review to support the publication of the PR planned for Q1 2025.

* *The review period ends on January 17, 2025*


## 🏅 Contributor Shoutouts

**Gcamp & Miklcct**   
Big kudos for opening a vote on their respective PR and contributing to advancing GTFS. 

**Jeffkessler-keolis**  
What a well written issue and on top of that, your first one! Well done!

## 🗳️ Currently Voting

[**Clarify use of agency_fare_url #524**](https://github.com/google/transit/pull/524)  
This PR extends the definition of agency_fare_url to also include URL pages with fare information instead of just pages that allow purchasing tickets.

* *The voting period ends on January 20th at 23:59:59 UTC.*

[**Specify the behaviour of TripUpdate.schedule_relationship = ADDED, and un-deprecate REPLACEMENT #504**](https://github.com/google/transit/pull/504)  
This PR specifies the behavior of ADDED, and un-deprecate REPLACEMENT, based on the implementation of OpenTripPlanner which specifies the whole journey to be added or replaced. Additional fields, such as headsigns, and pickup / drop-off types, are introduced as required to support the full specification of completely new trips.

* *The voting period ends on January 15 at 23:59:59 UTC.*

## 🚀 Recently Adopted

[**Add fare_leg_join_rules.txt #439**](https://github.com/google/transit/pull/439)  
This Pull Request introduces the concept of *Effective Fare Leg* in the term definitions, adds fare_leg_join_rules.txt to define effective fare leg, and updates the network_id, from_area_id, to_area_id, from_timeframe_group_id, and to_timeframe_group_id fields in fare_leg_rules.txt to align with this new approach.

* *This proposal is produced by Ito World and consumed by Google.* 

## 📂 Active Proposals

[**[GTFS Fares v2] Add rider_categories.txt #511**](https://github.com/google/transit/pull/511)  
The rider_categories.txt file is part of the GTFS-Fares v2 proposal, aimed at modeling rider categories that are eligible for certain fares.

[**Addition of event_based_trips.txt to specification #527**](https://github.com/google/transit/pull/527)
This PR builds on issue [#526](https://www.google.com/url?q=https://github.com/google/transit/issues/526&sa=D&source=docs&ust=1736197802148598&usg=AOvVaw05zhgBG-OjK_VKMYBNuHju), it suggests the addition of an event_based_trips.txt file to indicate to consumers and customers that applicable trips are post-event extras.


**Other open proposals:**

* [Stop Time Events in the past should be kept #502](https://github.com/google/transit/pull/502)  
* [Add stops.stop_access field #515](https://github.com/google/transit/pull/515)  
* [[GTFS Fares v2] Add nonconsecutive_transfer_allowed field and clarify fare_transfer_type #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set matching predicates #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] Fare product/media transfer behavior #423](https://github.com/google/transit/pull/423) 

## 🔥 Most Active Conversations

[**Add communication_period and impact_period to GTFS Service Alerts #521**](https://github.com/google/transit/issues/521)  
The GTFS Realtime Alert active_period field is ambiguous, as it could mean either the alert's display period or the disruption's duration. A proposal suggests adding communication_period for the alert's display and impact_period for the disruption timeframe to clarify its use.

[**Add a provision for event-based trips (to support modeling of trips departing "x minutes following an event") #526**](https://github.com/google/transit/issues/526)
This issue proposes a GTFS method to model event-based routes whose return trips depend on the end time of the events. It suggests the addition of an event_based_trips.txt file to indicate to consumers and customers that applicable trips are post-event extras, operating based on an expected event end time.

[**Best Practices: Reasonable lengths in unique ids #518**](https://github.com/google/transit/issues/518)  
This issue proposes to introduce a best practice that sets a recommended character limit for any ID used in a GTFS feed, triggering a validator warning if a value exceeds 36 bytes.

### Slack conversations on #gtfs

Leo looked for [an extension that defines ids outside of the GTFS dataset to link datasets together.](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1733497063149959)

Evan announced the finalization of the [Version 4 of the California Transit Data Guidelines.](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1733962711549929?thread_ts=1728590417.755079&cid=C3FFFKX9C)

Raffael asked about [best practices for parent_stations.](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1734526282094799)

Michael inquired about [apps that work offline using downloaded GTFS.](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1734569332694509)

Stephanie asks [about scheduling best practices](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736198110045109).

### Slack conversations on #gtfs-fares

Michael asked about [modeling split ticketing.](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1733233599140119)

Michael inquired about [fare modeling with station restrictions.](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1733258324963899)

Michael wanted to have more details on the [definition of intermediate zones for zonal fares.](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1733258582268919)

Guillaume checked [if anything was blocking the rider_categories PR.](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1734545159926479)

### Slack conversations on #gtfs-realtime

Michael asked about a [previous PR to revive the removed replacement trips.](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1733354282636069)

## 💬 Join the GTFS Community

[**GitHub: google/transit**](https://github.com/google/transit): Share your ideas with the community! Join the official GTFS GitHub repository.

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): Get updates as soon as they happen, join the GTFS-changes google groups to get information about new pull requests and votes. 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Talk everything Realtime and stay up to date. This group is discussing the GTFS Realtime, asking questions, and proposing changes.

[**GTFS.org**](https://gtfs.org/): The official GTFS documentation website. Here you will find frequently updated resources for your GTFS needs. 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): Have a question about GTFS or need to connect with the community? Join in on GTFS slack conversations. This is a great place to have questions answered quickly by the over 1,300 mobility enthusiasts navigating our channels. 

**Thank you for reading this edition of the GTFS Digest! We look forward to bringing you the latest GTFS updates in 2025 and beyond.** 