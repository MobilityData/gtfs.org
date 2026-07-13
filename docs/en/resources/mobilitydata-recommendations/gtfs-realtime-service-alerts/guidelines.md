# Guidelines

In this section, we suggest general practices regarding the use of the Service Alerts feed.

## General Guidelines

* It is possible to include multiple affected services (routes, stops, etc) per alert if the affected services are part of the same incident and under the same effect (e.g. the same \`NO\_SERVICE\` alert for multiple routes closed due to the same event, or the same STOP\_MOVED alert for multiple stops moved in bulk due to the same construction). This helps consolidate information for riders under the same alert.  
* Although \`communication\_period\`, \`impact\_period\`, \`cause\` and \`effect\` are not required fields, it is recommended to include these fields in all alerts to provide as much information about the alert as possible.  
* If more details exist, such as further information about the cause of the alert or the extent of the effect, it is possible to elaborate on them using \`cause\_detail\` and \`effect\_detail\` (Note: \`cause\_detail\` and \`effect\_detail\` are experimental fields).  
* If a web page with details of the alert exists, such as detailed graphics of detours, it can be included in the \`url\` field.  
* If a service disruption is known in advance, add it to the feed prior to its start time.  
* If an alert is still not in effect yet, consider adding a note in the header. e.g. Add “Upcoming: “ to the header. Remember to update the Header so it is always accurate at the time a rider sees it.  
* Once the \`communication\_period\` (or \`active\_period\`) of the alert has passed, remove the alert from the feed. It is possible to have an alert with a \`NO\_EFFECT\` effect that informs the rider that the incident ended. This is not necessary.

## Cause & Effect

* \`Cause\` and \`effect\` should not be empty, even if that information is included in the header or description of the alert.  
* When possible, include a specific effect. Try to minimize the number of unknown or generic effects (\`UNKNOWN\_EFFECT\`, \`OTHER\_EFFECT\`). This allows trip planners to extract the nature of the service disruption without having to analyze the header or description.

## Communication\_period and impact\_period (previously active\_period)

!!! Note

    Prior to \`communication\_period\` and \`impact\_period\`, time periods for alerts were described using \`active\_period\`, which was deprecated in [PR\#546](https://github.com/google/transit/pull/546) to resolve the uncertainty around its use.  
    Producers can still create \`active\_period\` and consumers can still use it with the same general guidelines mentioned below for \`communication\_period\` and \`impact\_period\`. However, it is recommended to use \`communication\_period\` and \`impact\_period\` to make sure that the display time of the alert is distinct from when it comes into effect.  
    A migration guide from \`active\_period\` to \`communication\_period\` and \`impact\_period\` can be found in the spec examples [here](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/examples/migration-active-period.md).

* The communication period is the time when the alert should be shown to the user strictly for informative reasons.  
* The impact period is the time when the services are actually affected by the alert on the ground.  
* If the end time of the alert is known, include it in the impact period and . Otherwise, leave the end time empty and make sure to include it once it is known.  
* If the alert is recurrent, create multiple time intervals.  
* Always make sure that each impact period is contained within at least one communication period to make sure that the alert is communicated to riders during any time the service disruption is in effect. 

## Informed\_entity

* If an incident occurs, first consider setting an alert with the most granular entity possible, and then assess whether additional alerts at higher level entities are necessary.  
  * e.g. A station serving multiple metro routes is closed for one metro route only due to maintenance. Only the platforms serving that specific route are closed.  
    * Start by creating a \`NO\_SERVICE\` alert where the \`informed\_entity\` includes the \`stop\_id\` for the metro’s platform, as well as the \`route\_id\` of the metro.  
    * Then you might be able to create additional alerts with other effects. E.g. For the same example above, you can create an additional \`MODIFIED\_SERVICE\` or \`OTHER\_EFFECT\` alert that informs the riders about the maintenance, and includes the station’s \`stop\_id\` in \`informed\_entity\`.

* **If you do not specify the most granular entity, be careful with the effect of the alert and do not set it to \`NO\_SERVICE\`. This is because many consumers might actually use the \`NO\_SERVICE\` alert to not suggest the affected services, which will lead to incorrect journey suggestions for users.**  
  * e.g. A stop serving multiple routes is skipped by only one of the routes. If you only specify the \`stop\_id\` in \`informed\_entity\` without including \`route\_id\`, then do not set \`NO\_SERVICE\` as the effect. This is because certain consumers might decide to close the stop for all routes based on the information provided in \`informed\_entity\`. You can set an effect such as \`MODIFIED\_SERVICE\`.

* Make sure the informed entities are as granular as possible  
  * If the alert is for the whole agency, include \`agency\_id\`.  
  * If the alert is for certain routes, include \`route\_id\`.  
  * If the alert is along certain directions, include \`direction\_id\`.  
  * If the alert is for certain stops, include \`stop\_id\`.  
  * If the alert is along certain directions, and the stop it affects serves multiple directions in the GTFS, include both \`stop\_id\` and \`direction\_id\`.  
  * If the alert is for certain trips, include \`trip\_id\` using [TripDescriptor](https://gtfs.org/documentation/realtime/reference/#message-tripdescriptor).

!!! Note

    Currently, \`direction\_id\` is still an experimental field.

* Do not include \`route\_ids\` for routes whose service period starts after the alert’s \`impact\_period\`/\`active\_period\` or ends before the alert’s \`impact\_period\`/\`active\_period\`.

A decision tree containing major use cases of Service Alerts and the corresponding \`informed\_entity\` is represented in the [following link](https://www.canva.com/design/DAGvUIUG_YQ/ZKD9-siMHNn4lV0qkCzw6g/edit?utm_content=DAGvUIUG_YQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton) (**planned to be an embedding\***)

!!! Note

    Informed Entity can be expanded in the future to allow for the inclusion of other entities such as \`pathway\_id\`. This expansion is subject to ongoing community discussions mainly in the [transit repo](https://github.com/google/transit), or from conversations that start in [working groups](https://community.mobilitydata.org/working-groups#events) and lead to proposals in the transit repo.

## Header\_text

* Keep the header as short as possible, while conveying the message.  
* Mention the effect in the header in a straightforward way.  
* It is possible to add the time period and the cause of the alert in the header if they do not make the header too long.  
* Do not list multiple alerts in the header text.  
* While HTML and Markdown characters and tags are UTF-8, it is discouraged to use those characters in the header text, as the spec currently defines the header text as plain text.  
* Similarly, do not include language codes such as “en-html”, since it is not BCP-47.  
* Examples of headers:  
  * ✅”Interrupted Service” (*Can be improved*)  
  * ✅”Blue Line: No service between Snowdon and Acadie”  
  * ✅”Orbit Earth Detour between Rio Salado Pkwy./Packard Dr. and Tempe Transportation Center \- Reggae Festival”  
  * ❌”No service for Subway Line A, buses running for Subway Line K” *(multiple alerts).*

## Description\_text

* Do not list multiple alerts in the same alert description.  
* While HTML and Markdown characters and tags are UTF-8, it is discouraged to use those characters in the description text, as the spec currently defines the description text as plain text.  
* Similarly, do not include language codes such as “en-html”, since it is not BCP-47.  
* Keep the description short enough but as detailed as possible.

Good example (Halifax Transit)

```
"descriptionText": {
 "translation": [
   { 
     "text": "Stop Closure Notice:\r\nRoute: 4 Universities Inbound\r\nLocation: Robie St Before Cedar St (8196)\r\nCause:  Stop Closed Construction\r\n\r\nAffected Stops:\r\nRobie St Before Cedar St (8196)",
     "language": "en"
   }
 ] 
} 
```

Bad example (MBTA): The alert mentions all needed information in the header and leaves only the direction for the description.

```
"headerText": {
 "translation": [
   { 
     `"text": "Haverhill Line Train 1231 (10:25 am from North Station) is operating 10-20 minutes behind schedule between North Station and Reading due to a signal issue.",
     "language": "en"
   }
 ]
},
"descriptionText": {
 "translation": [
   {
     "text": "Affected direction: Outbound",
     "language": "en"
   }
 ]
}
```

## URL

* Make sure the URL directs to a page that details the alert or contains information directly related to it. E.g. The URL directs to a page containing illustrations of a detour or a moved stop.  
* ِAvoid generic URLs or URLs that direct to pages where the user has to navigate further to find details about the alert.

## Image (experimental*)

* The image field contains a URL that links to an image that further details the alert. Examples include: Shape of a detour along a map, new location of a moved stop, etc.  
* The image must not contain too much text.  
* The image should not contain new textual information that is not mentioned in the alert header or description.

## Prioritization against GTFS Schedule

* If the service disruption is planned, try to incorporate the service change in the [GTFS Schedule feed](https://gtfs.org/documentation/schedule/reference/) (eg: remove a closed stop from \`[stop\_times.txt](https://gtfs.org/documentation/schedule/reference/#stop_timestxt)\` for the corresponding trip until the stop is back in service). You can still use GTFS Realtime Service Alerts as a complement to notify users of upcoming disruptions or adjustments.  
* If the alert is the result of an unplanned short-term event (usually lasting less than one week), you do not need to make adjustments to the corresponding GTFS Schedule.  
* If the unplanned alert continues over a longer period of time, continue using GTFS Realtime Service Alerts and consider incorporating the service change in the GTFS Schedule feed if the event is expected to last over one month.

For more detailed information regarding the tradeoff between GTFS Schedule and GTFS-RT, visit the **[Realtime vs Schedule Best Practices document](../../../resources/mobilitydata-recommendations/gtfs-schedule-vs-gtfs-realtime.md)**.

## Handling suspicious and ambiguous alerts

Some alerts are ambiguous or incomplete, examples of these alerts include:

* An alert with no \`impact\_period\`/ \`active\_period\` when the service disruption has a start time and/or a foreseeable end time.  
* A \`NO\_SERVICE\` alert with the no informed entity or with the whole \`agency\_id\` as an informed entity.  
* A \`NO\_SERVICE\` alert describing a segment closure but the informed entities include only the \`route\_id\`.  
* A \`NO\_SERVICE\` alert describing a platform closure but the \`stop\_id\` for the entire station is provided.  
* A \`NO\_SERVICE\` alert describing some cancelled trips but the informed entities contain the \`route\_id\` only.  
* A \`DETOUR\` alert with changed stop locations and whose informed entities contain only the \`route\_id\`.

Such cases indicate incomplete information which hinder the consumer’s interpretation of the data.

* Producers are encouraged to refrain from practices that lead to incomplete or ambiguous interpretations and to include informed entities and active periods that are as granular as possible.  
* If a producer does not include the most granular informed entities in an alert, they are encouraged to not use \`NO\_SERVICE\` as an effect. **This is because some consumers decide to use alerts with \`NO\_SERVICE\` to affect their routing suggestions. This practice, coupled with non-detailed informed entities, can result in false service closures.**  
* Consumers are encouraged to be very careful if they decide to use Service Alerts to impact journey planning. If a consumer uses alerts to affect their routing, they should monitor the alerts’ descriptions and contact the agency if an alert contains incomplete information.  
* **If a consumer chooses to use Service Alerts to affect routing, using alert effects other than \`NO\_SERVICE\` to affect routing is strongly discouraged, as it carries significant risk and can lead to unintended consequences.**  
* Producers are encouraged to implement [TripModifications](https://gtfs.org/documentation/realtime/feed-entities/trip-modifications/) and include all detours there.