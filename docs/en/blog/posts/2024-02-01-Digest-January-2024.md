---
draft: false
pin: false
date:
  created: 2024-02-01
title: GTFS Digest - January 2024
description: Read this month's digest and stay up to date on GTFS development.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---

# [GTFS Digest] January 2024 - Start the year in the know.
Migration of pending Best Practices to GTFS spec for improved visibility and community discussion on valuable improvements. Join discussions on GTFS Governance improvements, short-term service modifications, the use of GTFS-realtime, and the adoption of an Entity-Relationship Model (ERD). 


<!-- more -->

The GTFS Digest is a resource generated monthly by [MobilityData](https://mobilitydata.org/) providing an overview of developments on GTFS. 

We really value your feedback and would like to know how we did. We invite you to fill out [this form](https://forms.gle/GGefktvemnJD5Q9g8) and help us achieve the full potential of this tool. 


## 🏅 Contributor Shoutouts

**Martijn Vanallemeersch**

Joined slack and brought up a[ lively conversation on train weakening](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1704902620455499) on their first day. 

**Marcy Jaffe**

As always, thank you for looking out for the smaller transit agencies out there and for sharing [some important points about the GTFS validator.](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1703074450467169) 

**doconnoronca**

Thanks for [asking for clarifications on short term service modifications](https://github.com/google/transit/issues/425), you sparked some valuable interactions. 


## 📢 Announcements

**[Migration of Outstanding Best Practices issues and PRs #421](https://github.com/google/transit/issues/421) **

As part of the GTFS Best Practices migration to the specification, MobilityData has transferred all outstanding issues and PRs to the GTFS specification repository. [Issue #421](https://github.com/google/transit/issues/421) provides a detailed explanation of the migration process and the proposed next steps. With this, we’re hoping to bring more visibility to pending Best Practices suggestions and to restart the discussion around them, so that any improvement that the community finds valuable can be carried forward.


## 📂 Active Proposals

**[GTFS-Flex #388](https://github.com/google/transit/pull/388)** 

The GTFS-Flex proposal allows passengers to discover demand-responsive services on trip planners; it has undergone multiple discussions and is currently being reviewed by contributors. 



* Most recent GTFS-Flex Working Group Meeting held on January 17, 2024:
    * Consensus on adding normalization of location_groups in a separate file
    * Consensus on File name:
        * locations.geojson - keep this name
        * Existing location_groups.txt → location_group_stops.txt
        * New normalized file → location_groups.txt

**[GTFS Trip-Modifications #403](https://github.com/google/transit/pull/403) **

Trip-Modifications are modifications done to a trip to modify its shape, remove stops that are not served, and potentially add temporary stops. [Trip-Modifications is mainly used for visualizing detours and updating realtime predictions.](https://blog.transitapp.com/how-transit-and-swiftly-put-bus-detours-on-the-map/)

First meeting held on January 10, 2024. Items discussed:



* GTFS-TripModifications vs GTFS-NewTrips
    * There’s been a consensus that the size benefits from TripModifications were big enough that we should go forward with that solution.
* Keeping a stop sequence only selector for stops or make a change to allow selection of stops with stop ids
    * There was agreement that the usefulness (and ease of production) of using stop_id is strong enough that we should make the change. Transit is going to work on a concrete proposal.

**[[GTFS-Fares v2] Add rule_priority to fare_leg_rules.txt #418](https://github.com/google/transit/pull/418)**

The rule_priority field defines the order of priority in which matching rules are applied to legs, allowing certain rules to take precedence over others. Its presence acts as a trigger, shifting the empty semantics from "anything except" to “doesn’t affect matching”.

**[[GTFS-Fares v2] Same fare product/media transfer behavior](https://github.com/google/transit/pull/423)** \
A mechanism to differentiate whether specific transfer rules between two legs require the use of the same fare product/media. This mechanism can distinguish between a 'ticket-based system' (i.e., a product similar to a pass) and a 'stored-value system' (i.e., a general pay-as-you-go product). \



## 🔥 Most Active Conversations

**[Modifications to the GTFS Governance: Phasing Plan #413](https://github.com/google/transit/issues/413)**

MobilityData suggests refinements to improve both the formal amendment process and informal aspects of GTFS governance. Included in the issue are common community-identified problems and a proposed phased plan.


* Phase 1 is done: 
    * [Addition of Issue templates on GitHub](https://github.com/google/transit/pull/417)
    * [Release of GTFS Digest](https://github.com/google/transit/issues/419)
    * [Modification of labels on GitHub](https://github.com/google/transit/labels) 
* Phase 2 is in progress: 
    * Voting proposal in development

**[Use Entity-Relationship Model as Definitive Reference #415](https://github.com/google/transit/issues/415) **

Most discussions involve how the data is formatted, rather than explaining the structure itself. The suggestion is to have a clear and formal model that everyone can refer to, making discussions easier and avoiding confusion. The idea is to use tools like dbdiagram.io to visually represent and formalize the GTFS data model.

**[Why is it recommeded that short term service modifications are excluded from GTFS? #425](https://github.com/google/transit/issues/425)**

The discussion is about why GTFS suggests using GTFS-realtime for service changes within a week. Contributors mention the buffer gives consumers time to digest the feed, helping them ensure data quality, fix errors, and showing new schedules on time. They also discuss managing many GTFS-realtime updates.

**[Slack conversation in #gtfs](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1704902620455499)**

In this discussion, Martijn asks the community for ideas on how to model some common practices in the rail industry: Train dividing, weakening and joining. Used mostly for regional or inter-urban travel, these practices consist of train cars being separated and/or coupled to serve different destinations.

**[Slack conversation in #gtfs-realtime](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1704895869851189) **

Joel needs your help to answer: “Is SKIPPED stop update from a previous stop supposed to be propagated to next stops if those stops have no updates in the data?”

**[Slack conversation in #gtfs](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1705020453309289) **

Evan asks the following question: “For people who produce/consume feeds with frequencies.txt that specifically follow the Frequency-based service (exact_times=0), how strictly does everyone interpret the following wording?”


## 📅 Upcoming Events

**[GTFS-Fares v2 Monthly Meeting ](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057)**| January 23, 2024 @ 11 am EST

Topics : Review Backlog & One route behavior 


## Join the GTFS Community

**[GitHub: google/transit](https://github.com/google/transit)**: Share your ideas with the community! Join the official GTFS GitHub repository.

**[GTFS-changes](https://groups.google.com/g/gtfs-changes)**: Get updates as soon as they happen, join the GTFS-changes google groups to get information about new pull requests and votes. 

**[GTFS-realtime](https://groups.google.com/g/gtfs-realtime)**: Talk everything Realtime and stay up to date. This group is discussing the GTFS Realtime, asking questions, and proposing changes.

**[GTFS.org](https://gtfs.org/)**: The official GTFS documentation website. Here you will find frequently updated resources for your GTFS needs. 

**[MobilityData Slack](https://share.mobilitydata.org/slack)**: Have a question about GTFS or need to connect with the community? Join in on GTFS slack conversations. This is a great place to have questions answered quickly by the over 1,300 mobility enthusiasts navigating our channels. 

**Thank you for reading the second edition of the GTFS Digest! We look forward to bringing you the latest GTFS updates in 2024 and beyond. **
