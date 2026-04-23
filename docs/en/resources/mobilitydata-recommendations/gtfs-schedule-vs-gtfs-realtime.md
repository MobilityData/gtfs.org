# Introduction

Currently, GTFS producers have options for conveying information about transit service changes or disruptions: GTFS Schedule, GTFS Realtime, or a combination of both. However, there is limited guidance on when to use each format and how they should work together. This lack of clarity can result in inconsistent implementations and confusion among GTFS consumers, ultimately affecting the quality of information available to transit riders.

This document provides guidance for using GTFS Schedule and GTFS Realtime effectively to communicate special services and/or service changes or adjustments. It aims to clarify the intended use cases for each feed, outline their complementary roles, and support the effective use of each standard in practice. By aligning GTFS producers and consumers on these practices, we hope to reduce interpretation ambiguity, simplify integration, and improve the quality and accuracy of information delivered to transit users.

## Overview of GTFS Schedule and GTFS Realtime

GTFS Schedule data serves as the foundation of any GTFS implementation. As the name implies, this dataset contains all scheduled services as they are planned to operate during the time period covered by the feed.

In contrast, GTFS Realtime provides dynamic updates to scheduled GTFS data through several types of feeds. The **Trip Updates** feed expresses delays, cancellations, and other schedule changes. The **Vehicle Positions** feed provides the real-time locations of vehicles in service while the **Service Alerts** feed communicates notices about disruptions, detours, or other important situations that should be conveyed to users. Finally, the experimental **Trip Modifications** feed enables agencies to adjust trips beyond the static schedule to reflect service changes.

These two components of GTFS are designed to coexist and complement each other, working together to give riders the most accurate and up-to-date view of a transit service, as it’s planned and as it’s actually operating.

As a general rule of thumb, **agencies should default to using GTFS Schedule as the primary and authoritative source of service information**. GTFS Realtime, while highly useful, is not intended to replace scheduled data, except in cases where actual service deviates from the plan.

Beyond reporting vehicle positions, GTFS Realtime should be used selectively and strategically: to report delays, cancellations, reroutes, or emergencies that occur too late to be reflected in the static feed. Its role is to update or enhance the scheduled data rather than override it. Over-reliance on Realtime data without maintaining an accurate and up-to-date schedule can create inconsistencies for consumers and lead to rider confusion.

In the following sections, we’ll explore how this general principle applies in specific scenarios, and provide more detailed guidance on when and how to use each data source effectively.

## Important Considerations

### Prioritize GTFS Schedule over GTFS Realtime

Above all, when publishing service information using GTFS, **the priority should be to plan and release updates through the GTFS Schedule feed** ensuring that GTFS consumers have sufficient time to process, validate, and distribute the updated information across their platforms.

When unexpected or short-notice changes occur, GTFS Realtime should be used to communicate disruptions, delays, or temporary service modifications. It serves as a dynamic supplement to the static schedule, ensuring riders receive timely updates when plans change unexpectedly.

From the official GTFS Schedule Reference:

> *“At any time, the published GTFS \[Schedule\] dataset should be valid for at least the next 7 days… If a service modification will go into effect in 7 days or fewer, this service change should be expressed through a GTFS Realtime feed (service advisories or trip updates) rather than static GTFS dataset.”*

It's also important to recognize that many transit agencies may lack the technical capacity or infrastructure to consistently produce high-quality GTFS Realtime feeds. This is another reason why GTFS Schedule should be prioritized whenever possible for both consumers and producers.

### Ensure a Smooth Data Handover

Any service change or disruption, even minor ones, can affect riders, especially in high-frequency or large-scale transit systems. Thus, the handover of GTFS data from producers to consumers is a critical step in ensuring that accurate information reaches end-users. Predictability, transparency, and regular maintenance are key to achieving this.

While producers and consumers should be able to communicate easily when issues arise, **reliance on ad-hoc communication should be minimized by establishing a consistent update cadence and predictable behaviors**. This helps consumers anticipate changes and maintain data accuracy.

Producers should also make use of existing GTFS features that support clear and transparent communication about the feed, such as `feed_info.txt`. Beyond that, maintaining a public changelog or issue tracker is recommended when possible, as this can help consumers track changes across releases and adapt their ingestion processes more efficiently.

### Allow Time for Data Propagation

When updating feeds, GTFS producers should consider that once new feed versions are released, GTFS consumers need time to ingest and process the new data. Depending on the size and complexity of the system, this can take anywhere from a few hours to a few days.

It is recommended that GTFS producers publish updated Schedule feeds well in advance of service changes taking effect, giving consumers ample time to perform quality checks and identify potential issues. This buffer period also allows consumers to contact the producer to report problems or implement workarounds if unexpected issues are detected, before the new service plan goes live.

Allowing time for data propagation requires producers and consumers working together to complete the release and ingestion process to ensure updated information is available to end-users **at least five (5) days before the new service plan takes effect**. With sufficient time, travellers benefit from the most accurate information.

## Schedule or Realtime?: When to Use Which

Determining when to rely primarily on GTFS Schedule versus GTFS Realtime is essential to ensure that service information is conveyed effectively to riders. While both formats serve complementary roles, their recommended use depends on the duration and nature of a service change or update. 

The table below provides general guidance to help agencies prioritize the use of GTFS Schedule or GTFS Realtime based on the type of situation.

|  | **Short-Term (Hours to Days)** | **Long-Term (Weeks to Months)** |
|---|---|---|
| Planned Services | *Use GTFS Schedule for*<br>- Holiday Schedules<br>- Special services during planned major events<br>- Temporary detour with advance notice<br>- Scheduled early closure | *Use GTFS Schedule for*<br>- Regular service<br>- Seasonal schedule changes<br>- Construction with known impacts<br>- Route redesign<br>- Service expansion or reduction |
| Unforseen Service Disruptions | *Use GTFS Realtime for*<br>- Trip cancellations due to vehicle breakdown<br>- Real-time delays<br>- Emergency detours<br>- Accidents<br>- Unexpected changes in demand | *Use a combination of both for*<br>- Prolonged strikes or demonstrations<br>- Infrastructure damage from natural disaster or other event<br>- Ongoing vehicle shortage<br>- Extended station closure after an incident |

Please note that this matrix is not a definitive or absolute guide. Service disruptions can be complex and nuanced. Flexibility is essential to respond appropriately to each situation. The primary goal is to provide accurate and timely information to riders so they can plan their trips effectively.

The sections that follow will elaborate on the recommended practices for both planned and unforeseen service updates.

## Planned Services: Short- and Long-Term

Transit agencies generally aim to offer regular, predictable schedules, carefully planning operations to maximize efficiency. While some of these plans may remain stable for a period of time, services are often adjusted or adapted for various reasons, including operational constraints, special events, or seasonal changes.

According to the official GTFS Schedule reference, a *“GTFS dataset should be valid for at least the next 7 days, and ideally for as long as the operator is confident that the schedule will continue to be operated.”* Even when no major service changes are required, producers are expected to perform **regular, periodic maintenance of their GTFS feeds** to ensure that the service schedules included in the feed remain accurate and up-to-date.

Since GTFS Schedule serves as the foundation of any GTFS implementation as it contains the essential planned elements of a transit system, including routes, trips, stops, and schedules, these updates should rely on GTFS Schedule to represent all planned services. Planned services include regular operations (e.g., weekday and weekend services),but also upcoming special services such as holiday timetables, seasonally adjusted schedules, and service changes for major planned events (e.g., sporting events or concerts).

Any planned service disruptions or operational modifications known in advance, such as temporary route changes, station closures, or trip cancellations, should also be incorporated into the Schedule feed **as early as possible**. Maintaining an up-to-date Schedule feed ensures that trip planners and other consumers can provide accurate information to users well ahead of time.

The following table summarizes the most common cases of planned services and provides some examples:

| **Use Case** | **Description** | **Examples** |
|---|---|---|
| Regular Services | Standard, recurring services that follow a consistent schedule. | - Weekday commuter service<br>- Weekend reduced frequency<br>- Night bus service |
| Special Services | Services scheduled for specific occasions or time periods, known in advance. | - Holiday schedules (e.g., Christmas, New Year's)<br>- Summer or winter timetables<br>- Special services for a major event (e.g., a sporting event or concert) |
| Planned Service Disruptions | Known changes to regular service due to maintenance or other pre-scheduled events. | - Temporary station closures<br>- Route detours for construction<br>- Scheduled trip cancellations due to maintenance |

The following practices are encouraged to create a reliable environment for regular feed updates for planned services.

## Complementary Use of GTFS Realtime for Planned Service Adjustments

While GTFS Schedule should remain the primary source for communicating planned service updates, GTFS Realtime Service Alerts complements it by notifying users of upcoming disruptions or adjustments.

For example, before the launch of a summer schedule or the temporary detour of a route due to major construction, a Service Alert can be published a few days in advance of the change (already reflected in the GTFS Schedule feed) to inform users and allow them to plan accordingly.

In most cases, Service Alerts for planned adjustments **should be published no more than seven (7) days before the changes take effect**. Support for this functionality may vary between different consumers. 

### Recommended Practices

* **Producers**  
  * **Establish a predictable update cadence for the Schedule feed:** The appropriate frequency depends on each agency’s operational context. Some agencies may update weekly or monthly, while others do so quarterly. A predictable cadence helps consumers anticipate changes and prepare for updates.  
  * **Publish updated Schedule feeds in advance:** Ideally, feeds should be published as soon as changes are known, but releasing updates **3-4 weeks** before service changes take effect is sufficient. When unexpected changes occur, producers should still aim to release an updated GTFS Schedule feed **at least seven (7) days** before the new service plan becomes effective.  If the service change is known in less time than that, changes should be reflected using the corresponding GTFS Realtime  
  * **Use `feed_info.txt` to communicate key feed details:** Include accurate contact information (`feed_contact_email`, `feed_publisher_name`, `feed_publisher_url`), `feed_start_date`, `feed_end_date`, and `feed_version`. This information helps consumers confirm they are using the most up-to-date data and contact producers if issues arise. Including `feed_version` in both Realtime and Schedule feeds provides additional certainty that the correct data is being ingested.  
* **Consumers**  
  * **Check for new feed versions daily:** Consumers are expected to ingest new data within **48 hours** of its release, ensuring that accurate service information is available to end users **at least five (5) days** before the changes take effect.

### Example 1: Service adjustment around a major concert

An important concert expected to draw big crowds is announced for **May 24**. The transit agency knows about the event six months in advance and plans to provide **extended evening service** on routes serving the venue. Since this is a planned adjustment, it must be reflected in the **GTFS Schedule feed** as part of its regular maintenance updates.

**Example 1 Timeline**

* **March 31 – Operational plan finalized**  
  * The agency becomes aware of the concert months in advance and identifies the need for additional service.  
  * The agency finalizes the full service plan for May, including the special event service on **March 31\.**


* **April 10 – Updated GTFS Schedule published**  
  * The team in charge of maintaining GTFS for the agency prepares the May dataset with the special trips and adjusted schedules.  
  * The updated Schedule feed is published in the agency’s open data portal on **April 10\.**  
    * This includes the service information for May and the reminder of April, combining the current schedule with the future one.


* **April 10-14 – Consumer ingestion**  
  * Trip-planning applications detect the update the day it is released.  
  * They ingest the feed, run quality checks, and begin displaying the updated May schedules to users by **April 14**.


* **May 22 – Realtime Service Alert added**  
  * To increase visibility of the upcoming change, the agency publishes a Service Alert on **May 22,** two days before the event.  
  * Trip-planning apps start displaying the alert within minutes.  
  * This alert complements the Schedule information already available.


* **May 25 – Service Alert removed**  
  * After the event, the agency removes the alert from the Realtime feed.  
  * Trip-planning apps stop showing it immediately.

### Example 2: Start of Summer Schedule

Ahead of the summer season, a transit agency plans a seasonal schedule that adjusts the frequencies on several bus routes and restores a seasonal beach shuttle. This seasonal plan will start on **June 1** and stay in place for almost 4 months. These are planned, recurring changes that must be reflected in the **GTFS Schedule** feed, as part of the agency’s regular update cycle. To help riders prepare for the transition, the agency also uses **GTFS Realtime Service Alerts** to highlight the upcoming changes shortly before it takes effect.

**Example 2 Timeline**

* **May 2 – Summer schedule finalized**  
  * The agency prepares its summer service plan months ahead, including frequency adjustments on several bus routes and the reintroduction of a seasonal beach shuttle.  
  * The updated schedule is finalized on **May 2.**


* **May 14 – Updated GTFS Schedule published**  
  * The team in charge of maintaining GTFS for the agency prepares the June dataset with the special trips and adjusted schedules.  
  * The June Schedule feed, containing the summer service changes effective June 1st and the remainder of the May services, is published on **May 14**.


* **May 14-18 – Consumer ingestion**  
  * Trip-planning applications detect the updated Schedule as soon as it is released.  
  * They ingest the feed, run their quality checks, and begin showing the June service changes to riders by **May 18**.


* **May 25 – Realtime Service Alert added**  
  * To increase visibility and remind riders of the upcoming summer schedule, the agency publishes a GTFS Realtime Service Alert on **May 25**, one week before the change takes effect.  
  * The alert description reads: *“Summer schedule begins June 1st. Please note that some services will change their usual frequency, and the seasonal beach shuttle will be in service. Please refer to our website for further details.”*  
  * Trip-planning apps start displaying the alert within minutes.


* **June 6 – Service Alert removed**  
  * The agency removes the alert from the Realtime feed on **June 6**, ensuring riders see it both before and immediately after the transition.  
  * Trip-planning apps stop showing it immediately.

## Unforeseen Short-Term Service Disruptions Recommendations

Even with careful planning, transit services are frequently affected by sudden events that disrupt operations for a brief period. Examples include vehicle breakdowns, minor accidents, temporary detours, emergency closures, or short-term spikes in demand.

Because these events occur with little or no warning, agencies must act quickly, often leaving GTFS data teams insufficient time to make changes to the Schedule feed. Attempting to encode these short-term adjustments in GTFS Schedule would be impractical and could introduce errors, as the temporary changes would need to be removed once normal service resumes.

GTFS Realtime is therefore the most effective method to communicate short-term disruptions. By supplementing the Schedule feed, Realtime updates allow agencies to communicate operational changes immediately while keeping the planned schedule intact. In some cases, Realtime updates may even temporarily override Schedule data, **but producers should minimize such occurrences**.

Realtime feeds support frequent updates, enabling consumer applications to ingest data continuously or at short intervals, ensuring that riders receive the most current information, helping them make informed decisions in real time.

As stated in the GTFS Schedule reference, *if an updated GTFS Schedule feed cannot be released at least seven (7) days before the service changes take effect, the changes should instead be communicated through GTFS Realtime*. When determining whether this timeframe can be met, producers should account for the full end-to-end process, including data preparation, internal validation, publication, and the time required for consumers to retrieve, process, and deploy the updated dataset in their applications.

GTFS Realtime is composed of four different entities that can be used to provide updates: **Service Alerts, Trip Updates, Vehicle Positions** and **Trip Modifications** (currently an experimental feature). These feed entities can be used alone or in combination to express service updates depending on the situation. For more information on the details concerning each entity please refer to the GTFS Realtime Reference.

### Recommended Practices

* **Producers:**  
  * **Ensure identifier consistency between Realtime and Schedule data:** Realtime entities that reference scheduled service (such as `trip_id`, `route_id`, or `stop_id`) must match the identifiers published in the corresponding GTFS Schedule feed. This ensures that consumers can correctly associate Realtime updates with scheduled service, improving data ingestion, reliability, and user-facing accuracy.  
  * **Include a clear reference to the correct Schedule feed version:** Producers should populate the `feed_version` field in GTFS Realtime (and in `feed_info.txt`) to indicate which GTFS Schedule dataset the Realtime feed is aligned with. This allows consumers to validate that the Realtime data is mapped to the appropriate version of the Schedule feed, reducing misalignment issues during periods of frequent updates or operational changes.  
  * **Avoid over-reliance on New or Replacement trips created in GTFS Realtime:** New or Replacement trip creation in GTFS Realtime should be used sparingly and only when operationally required (e.g., unscheduled extra service). Overreliance on Realtime-added trips can complicate ingestion for consumers, make service harder to predict, and lead to inconsistencies between planned and operated service. Whenever possible, prioritize the use of GTFS Schedule and/or Trip Modifications in Realtime.  
  * **Remove Realtime information when it is no longer valid:** Producers should ensure that outdated Realtime data (such as resolved service alerts, expired detours, or completed cancellations) is removed as soon as it no longer reflects current service. Timely removal prevents user confusion, reduces the risk of conflicts between Schedule and Realtime information, and helps consumers maintain an accurate representation of active service conditions.  
* **Consumers:**  
  * **Communicate detected data issues to producers proactively:** When problems arise, such as inconsistent calendars, missing geometry, persistent identifier conflicts, or unexpected trip behavior, consumers should follow established communication channels to notify producers promptly. Early feedback enables faster correction and benefits the broader data ecosystem.

### Example 3: Temporary Station Closure Due to Power Outage

On November 8, an unexpected power outage forces authorities to temporarily close an important station servicing the city’s Orange Subway Line. The outage is unexpected and requires immediate closure of the station until power is restored, but trains can still continue to operate normally in the rest of the system, only skipping the affected station. The disruption is expected to last around 1 hour, thus the agency relies entirely on **GTFS Realtime** to communicate the temporary service disruption.

**Example 3 Timeline**

* **November 8 (4:45 pm) – Power outage detected**  
  * Around 4:45 pm Oakwood Station is forced to close immediately due to the loss of power.


* **November 8 (5:15 pm) – GTFS Realtime feed update**  
  * The agency updates its **GTFS Realtime Service Alerts** feed to add an alert notifying riders that the station is temporarily closed and indicating the expected duration of the disruption.  
  * Simultaneously, the **GTFS Realtime Trip Updates** feed is used to mark the station as `skipped` in the affected trips, effectively communicating that the vehicles will not stop at Oakwood Station.  
  * Trip-planning applications ingest the Realtime feeds instantly and begin displaying the alert in the trip planner’s user interface as well as closing Oakwood Station for trip planning purposes.  
  * Riders are notified about the closure and can adjust their travel plans accordingly.


* **November 8 (6:05 pm) – Power restored and normal service resumes**  
  * Shortly after 6:00 pm power is restored and the station reopens.  
  * The transit agency removes the alert in the Service Alerts feed and the `skipped` status for the stop in Trip Updates.  
  * Trip-planning apps reflect the updated feeds in their apps, reenabling the stop for trip planning and removing the alert immediately.

### Example 4: Adjusted Bus Service Due to Emergency Road Closure

On the morning of June 12, a major water main break forces authorities to close a key intersection along Route 17, causing an unexpected disruption to the bus service. Because the repairs are expected to take a few days, the agency relies entirely on **GTFS Realtime** to inform users about the temporary disruption, the adjusted service, and the estimated timeline for when regular service will resume.

**Example 4 Timeline**

* **June 12 (9:30 am) – Emergency road closure detected**  
  * Trips using Route 17 are disrupted by a sudden water main break, forcing buses to detour via an alternative avenue, skipping three stops and causing delays.


* **June 12 (10:00 am) – GTFS Realtime feed update**  
  * The agency updates the **GTFS Realtime Service Alert** feed to add an alert stating that delays should be expected on Route 17 for the rest of the day.  
  * The **GTFS Realtime Trip Updates** feed is used to mark the three affected stops as `skipped` and to assign estimated delays to the corresponding trips for the day.  
  * Trip-planning applications ingest the Realtime feed immediately and begin displaying the alert in the trip planner’s user interface, as well as deactivating the three affected stops for trip-planning purposes.  
  * Riders are notified of the delays and the canceled stops and can adjust their travel plans accordingly.


* **June 12 (4:00 pm)  – Adjusted service plan finalized**  
  * The transit agency receives confirmation that repairs will be completed by June 14 before midnight, and that the intersection will reopen during the early hours of June 15.  
  * The agency prepares a temporary adjusted service plan for trips using Route 17 with a new detour and relocated stops, to take effect at the beginning of service the following day.


* **June 12 (7:00 pm)  – Second GTFS Realtime feed update**  
  * The transit agency updates the **GTFS Realtime Service Alerts** feed to remove the previous alert and replace it with a new one announcing that the temporary adjusted service will be in effect for the next two days.  
  * A new **GTFS Realtime Trip Updates** feed is prepared to communicate the details of the modified service (e.g., detour path, replacement stops, delays) for Route 17 trips over the next two days.  
  * Trip-planning applications begin showing the updated detour and relocated stops along with the new service alert immediately.


* **June 14 (11:00 pm)  – Repairs conclude, normal service resuming the next day**  
  * Around 10:30 pm on June 14, repair work on the water main is completed and the intersection is ready to be reopened in a few hours.  
  * The transit agency removes the corresponding alert and trip updates from the GTFS Realtime feed.  
  * Trip-planning applications reflect the updated feed, re-enabling regular service information from the GTFS Schedule and removing the service alert.

## Unforeseen Long-term Service Disruptions

Sometimes, unforeseen or sudden events can lead to medium- or long-term service disruptions, with a high degree of uncertainty about when regular operations will resume. Examples include natural disasters that prevent transit operations, prolonged strikes or demonstrations blocking certain routes, or structural damage that forces indefinite station closures.

When such disruptions occur, **producers should first communicate the impact through GTFS Realtime to ensure that users receive immediate and accurate information**. As more clarity emerges regarding the expected duration and operational implications, producers should establish a communication strategy for the remainder of the adjusted service period.

The appropriate approach will depend on the nature and duration of the disruption, as well as the agency’s data management capabilities. However, the following general guidance applies:

* **Agencies may choose between using GTFS Schedule and GTFS Realtime for disruptions lasting more than one week but less than one month.** This will depend on operational constraints, update workflows, and the frequency with which service patterns are expected to change. When GTFS Schedule updates are not feasible or practical, producers may continue to rely on GTFS Realtime to convey cancellations, added trips, adjusted patterns, or other service changes until a more stable service plan can be established.  
* When possible, **prioritize the use of GTFS Schedule to represent adjusted service if disruptions are expected to extend longer than one month**. GTFS Schedule offers a more reliable and durable representation of multi-week or multi-month service patterns. GTFS Realtime Service Alerts may still be used as a complementary channel to highlight ongoing impacts or provide additional context.

Producers and consumers should work together and continually reassess the situation as it evolves and update their communication strategy accordingly to maintain clarity, accuracy, and usability for riders.

### Recommended Practices

* **Producers:**  
  * **Maintain proactive and continuous communication with consumers:** During extended disruptions, the service plan may evolve frequently as operational conditions change. It is recommended that producers communicate expected timelines, planned data updates, and potential changes in strategy (e.g., switching from Realtime to Schedule) to ensure consumers can prepare for and ingest new data without delays.  
  * **Ensure a structured transition from Realtime to GTFS Schedule:** When the disruption reaches a level of stability that warrants a GTFS Schedule update, producers should clearly coordinate the transition ensuring that temporary Realtime messages and trip adjustments are removed or updated once the new Schedule feed becomes effective.  
  * **Avoid publishing Schedule feeds that cover only very short validity periods:** When GTFS Schedule is used to represent adjusted service, producers should avoid issuing multiple short-duration feeds (e.g., covering only a few weeks). Instead, Schedule updates should reflect service patterns with reasonably stable validity windows.  
  * **Use Realtime Service Alerts to supplement Schedule updates:** Even when an updated Schedule feed is published for a long-term disruption, Realtime can still provide valuable context, for example, highlighting affected stations, providing safety information, or noting expected fluctuations in operations.  
* **Consumers:**  
  * **Coordinate with producers to anticipate major updates or changes in communication strategy:** In special situations, Consumers should proactively engage with producers to understand expected timelines, planned publication dates, and any complexities that may affect ingestion or display. Early coordination reduces the risk of inconsistencies and ensures that rider-facing systems incorporate new information promptly and accurately.

### Example 5: Indefinite Station Closure Following Earthquake Damage

On August 17, a moderate earthquake causes structural damage to a city’s Central Station, one of the busiest stops on the metro system’s Red Line. The station is immediately closed for safety inspections, with no clear timeline for reopening. The transit agency initially relies on **GTFS Realtime** to notify riders of the closure and provide updates as the situation evolves.

**Example 5 Timeline**

* **August 17 – Earthquake and initial closure**  
  * The station is closed immediately due to structural damage.  
  * A **GTFS Realtime Service Alert** is published to inform riders that trips on the Red Line will not stop at Central Station, as it will remain closed until further notice.  
  * The **Trip Updates feed** is used to adjust affected trips by marking Central Station as `skipped` in a StopTimeUpdate.


* **August 17-31 – Realtime updates only**  
  * Given the uncertainty surrounding repairs, the agency continues to rely on Realtime to keep riders informed.  
  * The Service Alert is updated as new information becomes available, and the Trip Updates feed continues to be updated for all affected trips.  
  * Trip-planning apps display the updated alerts within minutes of their publication.


* **August 21 – Repair timeline confirmed**  
  * The agency receives confirmation that repairs will take at least two months to complete.  
  * The agency begins planning a modified service pattern without stops at Central Station.


* **August 23 – Updated GTFS Schedule published**  
  * The modified service pattern is included in the September-October GTFS Schedule feed, removing the stop from the `stop_times` file for Red Line trips.  
  * The updated Schedule feed is published by the agency on **August 23**.


* **August 25 –  Updated GTFS Schedule ingestion**  
  * Trip-planning applications detect the updated Schedule as soon as it is released.  
  * They ingest the feed, run quality checks, and begin showing the updated September service to riders by **August 25**, five (5) days before it becomes effective.


* **September 1 – Updated Service Alert**  
  * The agency stops using the Trip Updates feed to adjust affected trips, relying instead on the updated service data in the GTFS Schedule feed.  
  * The agency replaces the previous Service Alert with a new one communicating that the station will remain closed until at least **October 31**.  
  * Trip-planning apps begin displaying the updated alert within minutes.


* **October 20 – Station reopening date confirmed, Updated GTFS Schedule published**  
  * The agency confirms that the station will reopen on **November 1**, after repairs conclude during the last week of October.  
  * On **October 20**, the agency publishes the updated Schedule in the agency’s open data portal.  
    * This includes the service information for November and the reminder of October, combining the current schedule with the future one.


* **October 22 – Consumer ingestion**  
  * Trip-planning applications detect the update the day it is released.  
  * They ingest the feed, run quality checks, and begin displaying the updated November schedules to users by **October 22**.


* **October 22 – Realtime Service Alert added**  
  * To inform riders about the upcoming reopening, the agency publishes a Service Alert on **October 22**, one week before service resumes at the station.  
  * Trip-planning apps start displaying the alert within minutes.  
  * This alert complements the Schedule information already available.


* **November 3 – Service Alert removed**  
  * Two days after the reopening, the agency removes the alert from the Realtime feed.  
  * Trip-planning apps stop showing it immediately.

### Example 6: Unforeseen Long-term Service Disruption Due to Staff Strike

On **March 3**, a transit workers’ strike is announced, affecting subway, bus, and tram operations at specific times of day across the city. The agency initially does not know how long the strike will last, creating uncertainty for riders and requiring immediate, continuous communication. The agency relies on **GTFS Realtime** to communicate the impact while assessing potential medium-term service adjustments.

**Example 6 Timeline**

* **March 3 – Strike begins**  
  * All transit services are suspended during the first daily shutdown window (**10:00 am – 4:00 pm**) with service gradually resuming afterward.  
  * A **GTFS Realtime Service Alert** is published to notify riders of the disruption, including the expected shutdown window and limited operations.  
  * The **GTFS Realtime Trip Modifications** feed is used to cancel trips within the shutdown window and adjust operating trips.


* **March 3-10 – Realtime updates only**  
  * The agency provides daily Realtime updates for each day’s shutdown windows and modified schedules.  
  * **Service Alerts** are updated frequently as the strike evolves.  
  * **Trip Modifications** continue to reflect cancellations and adjusted service patterns.


* **March 10 – Expected strike duration confirmed**  
  * Negotiations indicate that the rolling shutdowns are expected to **continue for the rest of the month** if no agreement is reached beforehand.  
  * The agency begins planning a more stable temporary service plan to reduce operational uncertainty, including consistent daily shutdown windows and adjusted frequencies outside those periods.  
  * Given the fluidity of the situation and the possibility that the strike could end suddenly if an agreement is reached, the agency decides to continue relying on **GTFS Realtime** to communicate the adjusted service schedule until a stable pattern can be fully implemented.


* **March 11-23 – Realtime updates continue**  
  * The agency continues providing daily Realtime updates for each day’s shutdown windows, modified schedules.  
  * The use of **Service Alerts** remains in place to keep riders informed of disruptions.  
  * **Trip Modifications** continue to reflect cancellations and temporary service adjustments.


* **March 23 – End of strike**  
  * An agreement is reached between the agency and the workers’ union, effectively ending the strike and allowing regular service to resume the following day.  
  * The agency publishes an updated **Service Alert** notifying riders that normal service is expected to resume on March 24.  
  * Trip-planning apps start displaying the alert within minutes.


* **March 24 – Transition to regular service**  
  * **Trip Modifications** and previous **Service Alerts** are removed, relying on the **GTFS Schedule feed** to communicate standard service information.  
  * The agency publishes an updated **Service Alert** confirming that normal service is now in effect.  
  * Trip-planning apps display the alert within minutes.


* **March 26 – Service Alert removed**  
  * The agency removes the alert from the Realtime feed two days after regular service resumes.  
  * Trip-planning apps stop displaying it immediately.

Although service disruptions and operational changes are often difficult to predict, using GTFS Schedule and GTFS Realtime in a complementary way helps ensure that riders are not left navigating this uncertainty on their own. 

This document has outlined recommended practices for many of the most common scenarios transit agencies and data consumers encounter in day-to-day operations. However, real-world situations can be more complex and may require additional coordination and tailored approaches.

When questions remain, or when a situation falls outside the examples covered here, agencies and consumers are encouraged to engage with the broader GTFS community to seek guidance and share experiences. Learning from peers and discussing emerging use cases can help strengthen implementations and improve outcomes for both data providers and riders.