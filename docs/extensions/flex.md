<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# GTFS-Flex

Flex is a GTFS Schedule extension project that aims to facilitate discoverability of Demand Responsive Transportation Services.

🤔 As many of you know, services like paratransit and on-demand rides are often brushed over by riders, who sometimes have no clue they even exist. This lack of accessibility is an issue for producers, consumers, and riders. Imagine a group of tourists arriving at your local airport and would like to reach a rural area that does not offer scheduled bus routes but only an on-demand bus service. The tourists check their preferred trip planner app and do not find a viable public transportation option; they end up renting a car. Being tourists, they missed all of your paper flyers posted along the hallway announcing the on-demand service. Not only is your service underutilized, but it lacks the discoverability to meet current and future rider demand. This is where GTFS-Flex comes in by providing that information to the rider allowing them to enjoy the services you worked hard to promote.


<a class="button no-icon" href="https://share.mobilitydata.org/gtfs-fares-v2" target="_blank">See the full proposal</a>

## In Progress Fares v2 Work2

<a href="https://github.com/google/transit/pull/355#issuecomment-1468326858" target="_blank">The fare media (formerly fare containers) proposal has passed</a> and been officially adopted in the spec!

The Fares v2 working meetings will now focus on <a href="https://github.com/google/transit/pull/357">modelling and adopting time variable fares.</a>

<a class="button no-icon" href=https://share.mobilitydata.org/slack>Join #gtfs-fares on Slack</a><a class="button no-icon" href=https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057>See the meeting schedule</a><a class="button no-icon" href=https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit>See meeting notes</a>


## First Adopters

🎉 Shoutout to Fares v2 first adopters! At least 1 data producer and 1 consumer must commit to implementing an experimental feature before a public vote is opened to add it to the official specification. These organizations invest a large amount of time and energy into experimental changes to make sure that GTFS continues to evolve.

For the adopted base implementation, first adopters were

- Producers: <a href="https://www.interline.io/" target="_blank">Interline</a>, <a href="https://www.mta.maryland.gov/developer-resources" target="_blank">Maryland Department of Transportation</a>, <a href="https://dot.ca.gov/cal-itp/cal-itp-gtfs" target="_blank">Cal-ITP</a>
- Consumer: <a href="https://transitapp.com/" target="_blank">Transit</a>

For the fare media feature currently under discussion, first adopters are

- Producer: <a href="https://www.interline.io/" target="_blank">Interline</a>, [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Consumer: <a href="https://www.apple.com/">Apple</a>

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
- **March 2023**: <a href="https://github.com/google/transit/pull/355#issuecomment-1468326858" target="_blank">Fare media vote passes</a>
