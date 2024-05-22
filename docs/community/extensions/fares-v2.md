# GTFS-Fares v2

Fares v2 is a GTFS Schedule extension project that aims to address the limitations of [Fares v1](../../../documentation/schedule/examples/fares-v1).

The main concepts that Fares v2 plans to represent are

- Fare products (e.g tickets and passes)
- Rider categories (e.g seniors and children)
- Fare media (e.g transit pass, paper tickets, contactless bank cards)
- Fare capping

These concepts will allow data producers to model zone-based, time-dependent, and inter-agency fares. This extension project is being adopted in iterations. 

You can see [examples here](../../../documentation/schedule/examples/fares-v2) that show what can be modelled using what has been officially adopted in GTFS.

Producers may implement Fares v2 in the same dataset with Fares v1, since there is no technical conflict between the two. Consumers can choose which version to use independent of the other. With adoption and sufficient endorsement of Fares v2, Fares v1 may be deprecated in the future.

<a class="button no-icon" href="https://share.mobilitydata.org/gtfs-fares-v2" target="_blank">See the full proposal</a>

## Participate in the conversation
You can stay up to date and join the discussions around Fares v2 by joining our Slack Chanel and the recurring working group meetings.

<a class="button no-icon" href=https://share.mobilitydata.org/slack>Join #gtfs-fares on Slack</a><a class="button no-icon" href=https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057>See the meeting schedule</a><a class="button no-icon" href=https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit>See meeting notes</a>


## First Adopters

🎉 Shoutout to Fares v2 first adopters! At least 1 data producer and 1 consumer must commit to implementing an experimental feature before a public vote is opened to add it to the official specification. These organizations invest a large amount of time and energy into experimental changes to make sure that GTFS continues to evolve.

- Producers: <a href="https://www.interline.io/" target="_blank">Interline</a>, <a href="https://www.mta.maryland.gov/developer-resources" target="_blank">Maryland Department of Transportation</a>, <a href="https://dot.ca.gov/cal-itp/cal-itp-gtfs" target="_blank">Cal-ITP</a>, <a href="https://trilliumtransit.com/" target="_blank">Trillium Solutions</a>, <a href="https://www.itoworld.com/" target="_blank">ITO World</a>, <a href="https://www.mbta.com/" target="_blank">MBTA</a>, <a href="http://www.pvta.com/" target="_blank">PVTA</a>
- Consumers: <a href="https://transitapp.com/" target="_blank">Transit</a>, <a href="https://www.apple.com/">Apple Maps</a>

## Adoption tracker
### Current

<iframe class="airtable-embed" src="https://airtable.com/embed/shrZzYzPYao7iExlW?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shr8aT0K9bpncmy0V" target="_blank">Request a change</a><a class="button no-icon" href="https://airtable.com/shr5B6Pl1r9KH9qMX" target="_blank">Add your organization (consumers)</a><a class="button no-icon" href="https://airtable.com/shrn0Afa3TPNkOAEh" target="_blank">Add your organization (producers)</a>

### Future
<iframe class="airtable-embed" src="https://airtable.com/embed/shrUrgZTO1noUF66R?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shrvnI40zuFXmDsQI" target="_blank">Add your future plans</a>

## Fares v2 Features Under Discussion

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px;"></iframe>

## History

- **2017**: Industry research and data modelling
- **October 2021**: <a href="https://github.com/google/transit/pull/286#issue-1026848880" target="_blank">Base implementation drafted and shared</a>
- **December 2021**: <a href="https://github.com/google/transit/pull/286#issuecomment-990258396" target="_blank">Open vote #1 → did not pass</a>
- **March 2022**: <a href="https://github.com/google/transit/pull/286#issuecomment-1080716109" target="_blank">Open vote #2 → did not pass</a>
- **May 2022**: <a href="https://github.com/google/transit/pull/286#issuecomment-1121392932" target="_blank">Open vote #3 → passed</a>
- **August 2022**: <a href="https://github.com/google/transit/issues/341" target="_blank">Community discussion on next phase of Fares v2 begins</a>
- **November 2022**: <a href="https://github.com/google/transit/pull/355" target="_blank">Fare media draft pull request opened for feedback</a>
- **December 2022**: <a href="https://github.com/google/transit/issues/341#issuecomment-1339947915" target="_blank">Community identifies stack ranked order of features to prioritize iterations</a>
- **March 2023**: <a href="https://github.com/google/transit/pull/355#issuecomment-1468326858" target="_blank">Fare media passes</a>
- **July 2023**: <a href="https://github.com/google/transit/pull/357#issuecomment-1653561813" target="_blank">Fares that vary by time/day passes</a>
- **November 2023**: <a href="https://github.com/google/transit/pull/405#issuecomment-1830665141" target="_blank">Dedicated files to define networks</a>
