---
draft: false
pin: false
date:
  created: 2024-12-03
title: GTFS Digest - November 2024 - Governance Proposal and Rider Categories - Your Input Needed
description: November’s highlights include the Governance Changes Proposal, a new GTFS Realtime feature linking feed versions to schedules, and voting on fare leg join rules. Active proposals and discussions tackled rider categories, flexible pathways, and demand-based frequencies,
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] November 2024 - Governance Proposal and Rider Categories: Your Input Needed

November’s highlights include the Governance Changes Proposal, a new GTFS Realtime feature linking feed versions to schedules, and voting on fare leg join rules. Active proposals and discussions tackled Fares rider categories, flexible pathways, and demand-based frequencies,

<!-- more -->

The GTFS Digest is a resource generated monthly by [MobilityData](https://mobilitydata.org/) providing an overview of developments on GTFS. 

We really value your feedback and would like to know how we did. We invite you to fill out [this form](https://forms.gle/GGefktvemnJD5Q9g8) and help us achieve the full potential of this tool. 

## 📢 Announcements

[**You’re invited to review the GTFS Governance Changes Proposal Document**](https://docs.google.com/document/d/1EyJFvgOXZ4Gq6d6GJ6Hibey8Gkwyh7M25ECGwarmsT8/edit?usp=sharing)  
Informed by discussions held during the Governance Working Group Meetings and the 2023 MobilityData Workshops, this document reflects the insights gathered from those sessions. We kindly request your review to support the publication of the PR planned for Q1 2025.

## 🏅 Contributor Shoutouts

**Saipraneeth Devunuri (University of Illinois Urbana-Champaign)**  
Saipraneeth’s [research](https://findingspress.org/article/116694-a-survey-of-errors-in-gtfs-static-feeds-from-the-united-states) used MobilityData’s GTFS validator to create a survey of errors in GTFS feeds from the United States.

**miklcct**   
Opened 3 issues in November on Shapes and Pathways! 

**Konstantinos**  
Contributed on Slack for the first time and shared his [use case about Ferries](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1732189321118949) in Greece.  

**Steven White**   
Lengthy answers on GitHub ([#514](https://github.com/google/transit/issues/514) & [#482](https://github.com/google/transit/pull/482#issuecomment-2498646379)) and Slack helping community member 

## 🗳️ Currently Voting

[**Add fare_leg_join_rules.txt #439**](https://github.com/google/transit/pull/439)  
This Pull Request introduces the concept of *Effective Fare Leg* in the term definitions, adds fare_leg_join_rules.txt to define effective fare leg, and updates the network_id, from_area_id, to_area_id, from_timeframe_group_id, and to_timeframe_group_id fields in fare_leg_rules.txt to align with this new approach.

This proposal is produced by Ito World and consumed by Google. 

* *The voting period ends on December 3rd at 23:59:59 UTC.*

## 🚀 Recently Adopted

[**Add GTFS Feed Version to the GTFS real time FeedHeader #434**](https://github.com/google/transit/pull/434)  
This Realtime proposal adds a new field to the feed header to provide information on the GTFS schedule file to be used with the GTFS real time data: feed_version would match the feed_version in the feed_info.txt file of the GTFS

## 📂 Active Proposals

[**[GTFS Fares v2] Add rider_categories.txt #511**](https://github.com/google/transit/pull/511)  
The rider_categories.txt file is part of the GTFS-Fares v2 proposal, aimed at modeling rider categories that are eligible for certain fares.

[**Add stops.stop_access field #515**](https://github.com/google/transit/pull/515)  
This PR adds a stop_access field in stops.txt to indicate how the stop is accessed for a particular station. Please refer to [this proposal](https://docs.google.com/document/d/1huTq9I6Bs38ZGtcG-7Cpns0kT1njV3PoUCjnjEE0Y1E/edit?tab=t.0#heading=h.4jjq7xol2izb) for details. Adding this field is also the first phase of our three-phase plan to improve station modeling.

**Other open proposals:**

* [Stop Time Events in the past should be kept #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] Add nonconsecutive_transfer_allowed field and clarify fare_transfer_type #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set matching predicates #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] Fare product/media transfer behavior #423](https://github.com/google/transit/pull/423) 

## 🔥 Most Active Conversations

[Add communication_period and impact_period to GTFS Service Alerts #521](https://github.com/google/transit/issues/521)  
The GTFS Realtime Alert active_period field is ambiguous, as it could mean either the alert's display period or the disruption's duration. A proposal suggests adding communication_period for the alert's display and impact_period for the disruption timeframe to clarify its use.

[Frequencies.txt primary key: add end_time, headway_secs & exact_times? #514](https://github.com/google/transit/issues/514)  
This issue proposes the extension of the primary key of frequencies.txt to cover trips with overlapping time windows and different headway_secs (such as additional bus services during rush hour) or different exact_times.

[Specifying wheelchair_boarding for a platform which isn't accessible from outside, but accessible for interchange purpose #516](https://github.com/google/transit/issues/516)  
This issue proposes a wheelchair_accessible field in pathways.txt to be able to explicitly state if a pathway is accessible and thus identify wheelchair accessible routes within stations.

[Drop the requirement of no locked platforms in pathways.txt #517](https://github.com/google/transit/issues/517)  
This issue proposes to make requirements for pathways more flexible by removing the requirement of every platform to be connected to at least one entrance/exit via a chain of pathways.

[Best Practices: Reasonable lengths in unique ids #518](https://github.com/google/transit/issues/518)  
This issue proposes to introduce a best practice that sets a recommended character limit for any ID used in a GTFS feed, triggering a validator warning if a value exceeds 36 bytes.

[Add license information in the GTFS feed #519](https://github.com/google/transit/issues/519)  
License information can make the process of ingesting a GTFS feed quicker by providing a direct access to the legal obligations and restrictions by the producer of the GTFS.

[Specify features such as tunnel in shapes.txt #520](https://github.com/google/transit/issues/520)  
This issue proposes a new field in shapes.txt to specify en-route features, such as tunnels. Answers from different contributors have pointed out multiple options to represent this in GTFS.

[Add demand based frequency to the exact_times field of frequencies.txt #522](https://github.com/google/transit/issues/522)  
This issue uses examples like Cairo micro-buses to propose the addition of a new option for exact_times to designate trips that will depart based on factors including passenger demand

[Define "header.incrementality: DIFFERENTIAL" consumer/producer behavior #84](https://github.com/google/transit/issues/84)  
This revived issue focuses on clarifying the roles of CANCELED/SKIPPED in TripUpdates and NO_SERVICE in Alerts. Latest discussions focused on ensuring CANCELED impacts routing while NO_SERVICE informs riders of disruptions..

### Slack conversations on #gtfs

Weston inquired about [the use of timepoint for static trip planning](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1731105469421269)

Konstantinos needed help [adding a fare URL to the agency.txt file](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1732189321118949)

Elias shared a [GTFS-powered research](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1732119975757499) on Statistics Canada

### Slack conversations on #gtfs-flex

Matthew asked for tips to [generate GTFS-Flex from Via fee](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1730991630563329)ds, and inquired about the existence of [validators for GTFS-Flex](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1731012710942629)

### Slack conversations on #gtfs-validators

Jeff asked whether the [GTFS validator is fully aware of the Flex format](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1730911388951229)

Krysttian [shared Praneeth’s article](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1730988293903099) which used the GTFS Validator to create a survey of errors

### Slack conversations on #gtfs-fares

Evan shared a funny [good dog-bad dog fare policy](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1731565332639069)

Daniel asked for advice on [how to handle a fare attribute without a fare rule attached](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1732231109425179)

### Slack conversations on #gtfs-realtime

Graeme was looking for a [GTFS-Realtime source from pacebus](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1732734051456289)

Holger had a few [GTFS-Realtime best practice questions and suggestions](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1732871254059609)

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