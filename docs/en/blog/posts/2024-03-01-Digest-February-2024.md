---
draft: false
pin: false
date:
  created: 2024-03-01
title: GTFS Digest - February 2024
description: Read this month's digest and stay up to date on GTFS development.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] February 2024 - It’s time for the first vote of the year!
Governance enhancements, language code standards, carpooling lines, and real-time insights - Join the hottest discussions in the GTFS community!


<!-- more -->

The GTFS Digest is a resource generated monthly by [MobilityData](https://mobilitydata.org/) providing an overview of developments on GTFS. 

We really value your feedback and would like to know how we did. We invite you to fill out [this form](https://forms.gle/GGefktvemnJD5Q9g8) and help us achieve the full potential of this tool. 


## 🏅 Contributor Shoutouts

**AurelienC**

Posted their first issue on behalf of the French National Access Point on [Integration of carpooling lines](https://github.com/google/transit/issues/430). A well written and thought out issue! 

**Weston and Darwin**

Both of these active contributors took the extra steps to post their first PRs ([PR#432](https://github.com/google/transit/pull/432) & [PR#434](https://github.com/google/transit/pull/434)). Your contributions are always appreciated!

**Santiago Toso**

Joined the MobilityData slack and ignited multiple conversations. Glad to have you with us. 

**Kayla Firestack**

What a superstar! Kayla flagged an editorial error in [their first PR](https://github.com/google/transit/pull/431) and became the 40th unique PR author in google/transit!

**Juliet Eldred**

Thank you for pointing out an inconsistency in the GTFS documentation in your [first issue](https://github.com/google/transit/issues/435)! It’s contributions like yours that help us make the spec more accessible. 


## 📢 Announcements

**[GTFS/GBFS Communications Survey](https://form.typeform.com/to/cSlJFtVc)**

Help us shape the future by participating in our quick: GTFS/GBFS Community Survey!

If you can spare just 4 minutes, you can have a BIG impact on the future of GTFS/GBFS communities!


## 🗳️ Currently Voting

**[GTFS Trip-Modifications #403](https://github.com/google/transit/pull/403)**

Trip-Modifications are modifications done to a trip to modify its shape, remove stops that are not served, and potentially add temporary stops. [Trip-Modifications is mainly used for visualizing detours and updating realtime predictions.](https://blog.transitapp.com/how-transit-and-swiftly-put-bus-detours-on-the-map/)



* Voting for an experimental field ends on 2024-03-06 at 23:59:59 UTC. 


## 📂 Active Proposals

**[GTFS-Flex [voting ver.] #433 ](https://github.com/google/transit/pull/433)**

The GTFS-Flex proposal allows passengers to discover demand-responsive services on trip planners; it has undergone multiple discussions and is currently being reviewed by contributors. 



* This PR is the **"voting version" of PR#388**, with changes that align completely with the changes up to PR#388. The only difference is that this PR is based on the current spec, while PR#388 is based on the spec from July last year.
* Support resources from first adopters for voting will be released soon.

**[Add Feed Version and GTFS url to the GTFS real time FeedHeader #434](https://github.com/google/transit/pull/434)**

This Realtime proposal adds two new fields to the feed header to provide information on the GTFS schedule file to be used with the GTFS real time data: feed_version would match the feed_version in the feed_info.txt file of the GTFS, while GTFS_url would point to the url of the GTFS file. A producer willing to implement this change is required to move forward.

**[Clarify stops.zone_id conditional requirement for route-based fare_rules #432](https://github.com/google/transit/pull/432)** \
This proposal modifies the conditional requirement for stops.zone_id to allow for the scenario in which the stop is only assigned to trip_ids whose route_id is present in a fare_rules.txt record with only fare_id and route_id defined (route-based fares).


### Other open proposals

[[GTFS-Fares v2] Add rule_priority to fare_leg_rules.txt #418](https://github.com/google/transit/pull/418)

[[GTFS-Fares v2] Same fare product/media transfer behavior #423](https://github.com/google/transit/pull/423)<span style="text-decoration:underline;"> </span>

[[GTFS-Fares v2] Clarification: Fare product definition #426](https://github.com/google/transit/pull/426)



## 🔥 Most Active Conversations

**[[Governance] Phase 2: Enhancing Voting and Reviews #436](https://github.com/google/transit/issues/436)**

This GitHub Issue is part of the ongoing effort to enhance the GTFS Governance, particularly focusing on the Specification Amendment Process outlined in phase 2 of the [phasing plan](https://github.com/google/transit/issues/413) published in December 2023. Changes include:



* Adding an earlier voting stage
    * MobilityData proposes 2 alternatives to voting to be discussed
* Introducing majority voting for later voting stage
* Increasing voting requirements from 3 to 5 votes
* Formalizing review guidelines
* Formalizing steps before Pull Request
* Formalizing major roles and responsibilities

**[Clarification on language code data standards used in translations.txt #435](https://github.com/google/transit/issues/435)**

Juliet Eldred from Trillium brings up an inconsistency in the documentation with regards to code data standards used in translation and would like the community to help clarify where the source of truth lies. 

**[Integration of carpooling lines #430](https://github.com/google/transit/issues/430)**

Aurélien from the French National Access Point (NAP) has opened a GitHub Issue to discuss a potential proposal to model Carpooling lines behaving like bus lines: with precise stops and destinations, but in this case, driven by regular car drivers that can receive a money incentive from fares, or share their costs with passengers. Two different potential solutions are presented for discussion.

**[Slack conversation in #gtfs-realtime](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1706193156057089)**

Stefan Begerad asked the community for guidance on how long TripUpdate entities should stay available in the feed, with two specific cases in mind. The community referred to the specifications and provided some useful insights to help Stefan. 

**[Slack conversation in #gtfs-realtime (2)](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1708286157675929)**

Marcy seeks a reference table or chart on Realtime service alert variable presentation across trip planners. She also looks for best practices and further resources for understanding these variables. The community referred to documentations from Transit and Google as the closest resources

**[Slack conversation in #gtfs-realtime](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1707413698834939)**

Santiago Toso asks: “I was wondering if anyone knew if gtfs-rt data for CTA, Chicago is available?” The community responded with multiple links to valuable resources and Will Anderson from the CTA stepped forward and offered their assistance. 


## 📅 Upcoming Events

**[GTFS-Fares v2 Monthly Meeting ](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057)**| March 26, 2024 @ 11 am EDT

Topics : TBA

**[GTFS Governance - Enhancing Voting and Reviews](https://www.eventbrite.ca/e/gtfs-governance-enhancing-voting-and-reviews-11-am-edt-tickets-852341726047)** (1) | March 13, 2024 @ 11am EDT  

Topics: Overview & discussion of proposed changes

**[GTFS Governance - Enhancing Voting and Reviews](https://www.eventbrite.ca/e/gtfs-governance-enhancing-voting-and-reviews-8-pm-edt-tickets-852357152187)** (2) | March 13, 2024 @ 8pm EDT  

Topics: Overview & discussion of proposed changes


## 💬 Join the GTFS Community

**[GitHub: google/transit](https://github.com/google/transit)**: Share your ideas with the community! Join the official GTFS GitHub repository.

**[GTFS-changes](https://groups.google.com/g/gtfs-changes)**: Get updates as soon as they happen, join the GTFS-changes google groups to get information about new pull requests and votes. 

**[GTFS-realtime](https://groups.google.com/g/gtfs-realtime)**: Talk everything Realtime and stay up to date. This group is discussing the GTFS Realtime, asking questions, and proposing changes.

**[GTFS.org](https://gtfs.org/)**: The official GTFS documentation website. Here you will find frequently updated resources for your GTFS needs. 

**[MobilityData Slack](https://share.mobilitydata.org/slack)**: Have a question about GTFS or need to connect with the community? Join in on GTFS slack conversations. This is a great place to have questions answered quickly by the over 1,300 mobility enthusiasts navigating our channels. 

**Thank you for reading the third edition of the GTFS Digest! We look forward to bringing you the latest GTFS updates in 2024 and beyond. **