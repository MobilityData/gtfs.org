---
draft: false
pin: false
date:
  created: 2024-11-05
title: GTFS Digest - October 2024 - The Global GTFS Community united in Montreal 
description: Key updates from the October 2024 GTFS Digest include a vote on adding a `feed_version` field to GTFS Realtime feeds, the adoption of trip modification adjustments for Realtime, and ongoing proposals like enhancements to station modeling and rider categories in GTFS-Fares v2. Conversations across GTFS channels focused on implementation questions, validator updates, and evolving best practices. The 2024 International Mobility Data Summit in Montreal also brought together global GTFS community members for impactful exchanges and collaboration.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] October 2024 - The Global GTFS Community united in Montreal  

Key updates from the October 2024 GTFS Digest include a vote on adding a `feed_version` field to GTFS Realtime feeds, the adoption of trip modification adjustments for Realtime, and ongoing proposals like enhancements to station modeling and rider categories in GTFS-Fares v2. Conversations across GTFS channels focused on implementation questions, validator updates, and evolving best practices. The 2024 International Mobility Data Summit in Montreal also brought together global GTFS community members for impactful exchanges and collaboration.

<!-- more -->

The GTFS Digest is a resource generated monthly by [MobilityData](https://mobilitydata.org/) providing an overview of developments on GTFS. 

We really value your feedback and would like to know how we did. We invite you to fill out [this form](https://forms.gle/GGefktvemnJD5Q9g8) and help us achieve the full potential of this tool. 

## 📢 Announcements

[**The 2024 International MobilityData Summit was a success!**](https://mobilitydata.org/mobilitydata-strengthens-montreals-sustainable-mobility-ecosystem/)  
More than 180 participants from across the globe attended the 2024 International Mobility Data Summit in Montreal last week. Attendees proactively participated in panels and workshops proposed in the [GTFS Track](https://mobilitydata.org/the-2024-international-mobility-data-summit-new/) as well as took the opportunity to network and build solid foundations for long lasting relationships. 

## 🏅 Contributor Shoutouts

**Evan Siroki from Caltrans**  
Evan gave us a masterclass on how to draft issues this month 516 and 512 and he's also been super active on several slack channels. 🙇

**David Rudi from SKI+ (SBB)**  
Thank you being the first producer in PR #434! The community appreciates your dedication!

**Darwin O'Connor from Transee**   
You are inching closer to making PR #434 a reality and you also were the first consumer in the testing phase. Great work!

**Saipraneeth Devunuri from UIUC**  
Discovered the source of a problem with the validator and raised issue #1912! Awesome work! 

## 🗳️ Currently Voting

[**Add GTFS Feed Version to the GTFS real time FeedHeader #434**](https://github.com/google/transit/pull/434)  
This Realtime proposal adds a new field to the feed header to provide information on the GTFS schedule file to be used with the GTFS real time data: feed_version would match the feed_version in the feed_info.txt file of the GTFS

This proposal is produced by SKI+ (SBB) and consumed by TransSee. 

* *The voting period ends on November 16th at 23:59:59 UTC.*

## 🚀 Recently Adopted

[**Adjustment to trip modifications #497**](https://github.com/google/transit/pull/497)  
This PR clarifies the GTFS Realtime documentation regarding Trip Modifications, adding support for frequency based services, adding missing extensions fields in the .proto file and making documentation more comprehensive and consistent across different files.

## 📂 Active Proposals

[**[GTFS Fares v2] Add rider_categories.txt #511**](https://github.com/google/transit/pull/511)  
The rider_categories.txt file is part of the GTFS-Fares v2 proposal, aimed at modeling rider categories that are eligible for certain fares.

[**Add stops.stop_access field #515**](https://github.com/google/transit/pull/515)  
This PR adds a stop_access field in stops.txt to indicate how the stop is accessed for a particular station. Please refer to [this proposal](https://docs.google.com/document/d/1huTq9I6Bs38ZGtcG-7Cpns0kT1njV3PoUCjnjEE0Y1E/edit?tab=t.0#heading=h.4jjq7xol2izb) for details. Adding this field is also the first phase of our three-phase plan to improve station modeling.

[**Specify the behaviour of TripUpdate.schedule_relationship = ADDED, and un-deprecate REPLACEMENT #504**](https://github.com/google/transit/pull/504)  
This PR specifies the behavior of ADDED, and un-deprecate REPLACEMENT, based on the implementation of OpenTripPlanner which specifies the whole journey to be added or replaced. Additional fields, such as headsigns, and pickup / drop-off types, are introduced as required to support the full specification of completely new trips.

**Other open proposals:**

* [Stop Time Events in the past should be kept #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] Area Set matching predicates #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] Add fare_leg_join_rules.txt (first iteration) #439](https://github.com/google/transit/pull/439)  
* [Add Feed Version and GTFS url to the GTFS real time FeedHeader #434](https://github.com/google/transit/pull/434)  
* [[GTFS-Fares v2] Fare product/media transfer behavior #423](https://github.com/google/transit/pull/423) 

## 🔥 Most Active Conversations

[**Allow adding start and end dates to timeframes.txt #506**](https://github.com/google/transit/issues/506)  
Evan suggests we add start and end dates for special day fares changes. The suggestion was discussed in the October session for the GTFS-Fares v2 Working Group. For further information, please refer to the meeting notes [here](https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit?usp=sharing).

[**Within the spec documentation, explicitly call out that holiday information should be included #512**](https://github.com/google/transit/issues/512)  
This proposal seeks to clarify within the GTFS Specification narrative that holiday service known in advance and generally repeating each year should be an explicitly expected element of all GTFS Schedule feeds.

### Slack conversations on #gtfs

Walter Jenkins inquires about [implementing bike buses in GTFS for the city of St-Louis](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1725502423179069).

Evan Siroky asks for feedback regarding [Version 4 of California's Transit Data Guidelines](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1728590417755079).

Pablo B inquires about def[ining stops in a region with multiple agencies](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1729072406562529).

Alvaro T asks for tips about [modeling an international bus routes with transfer hubs and different boarding restrictions](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1730128316025739).

### Slack conversations on #gtfs-flex

Josh Drucker asks if [Flex should be built for paratransit as well](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1728316827975629).

Josh Drucker shared [a few questions regarding on-demand services](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1728931281007179).

### Slack conversations on #gtfs-validators

Evan Siroky inquires about [an edge case in fare_transfer_rules](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1728080625895539)

Jeff Maki is having [an issue with the GTFS validator](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1729270266359879) which was discussed with the community and raised by Praneeth as an issue to be addressed in the next validator release 7.0.

Pablo B asking about [best practices for GTFS publication](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1729589637103559).

## 📅 Upcoming Events

[**GTFS-Fares v2 – Monthly meetings**](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-769939809697) | November 26, 2024 @ 11 am EST

Topics : GTFS-Fares v2 extension Working Group Meeting

## 🛠️ Tools update

[**New GTFS Schedule Validator Release: Partial Support for Flex**](https://github.com/MobilityData/gtfs-validator/releases/tag/v6.0.0)  
The 6.0 GTFS Schedule Validator release has removed false positive notices for GTFS-Flex feeds, added a new error when text contains invalid characters, and updated validation rules for new spec clarifications on timepoints and translations. 

[Share your questions and feedback on the discussion thread here.](https://github.com/MobilityData/gtfs-validator/discussions/1909)

## 💬 Join the GTFS Community

[**GitHub: google/transit**](https://github.com/google/transit): Share your ideas with the community! Join the official GTFS GitHub repository.

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): Get updates as soon as they happen, join the GTFS-changes google groups to get information about new pull requests and votes. 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Talk everything Realtime and stay up to date. This group is discussing the GTFS Realtime, asking questions, and proposing changes.

[**GTFS.org**](https://gtfs.org/): The official GTFS documentation website. Here you will find frequently updated resources for your GTFS needs. 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): Have a question about GTFS or need to connect with the community? Join in on GTFS slack conversations. This is a great place to have questions answered quickly by the over 1,300 mobility enthusiasts navigating our channels. 

**Thank you for reading this edition of the GTFS Digest! We look forward to bringing you the latest GTFS updates in 2024 and beyond.** 