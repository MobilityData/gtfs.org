<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# GTFS-Fares v2

Fares v2 is a GTFS Schedule extension project that aims to address the limitations of <a href="/schedule/examples/fares-v1">Fares v1</a>.

The main concepts that Fares v2 plans to represent are

- Fare products (e.g tickets and passes)
- Rider categories (e.g seniors and children)
- Fare payment options (e.g bank card and credit card)
- Fare capping

These concepts will allow data producers to model zone-based, time-dependent, and inter-agency fares. This extension project is being adopted in iterations. 

Currently, the adopted base implementation of Fares v2 works for the following use cases:

- Defining a transit fare
- Describing service locations in the same fare zone
- Creating rules for single leg journeys
- Creating rules for transfers

You can see <a href="/schedule/examples/fares-v2" target="_blank">examples here</a> that show what can be modelled using the adopted Fares v2 base implementation.

Producers may implement Fares v2 in the same dataset with Fares v1, since there is no technical conflict between the two. Consumers can choose which version to use independent of the other. With adoption and sufficient endorsement of Fares v2, Fares v1 may be deprecated in the future.

<a class="button no-icon" href="https://share.mobilitydata.org/gtfs-fares-v2" target="_blank">See the full proposal</a>

## In Progress Fares v2 Work

The GTFS community is currently working on finalizing the <a href="https://share.mobilitydata.org/fare-containers-to-fare-payment-types-proposal" target="_blank">fare containers</a> proposal. 
    
Items currently in discussion include:

- Creating a fare containers file
- Aligning on what types should be included in the enumeration for fare container options

<a class="button no-icon" href=https://share.mobilitydata.org/slack>Join #gtfs-fares on Slack</a><a class="button no-icon" href=https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057>See the meeting schedule</a><a class="button no-icon" href=https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit>See meeting notes</a>


## First Adopters

🎉 Shoutout to Fares v2 first adopters! At least 1 data producer and 1 consumer must commit to implementing an experimental feature before a public vote is opened to add it to the official specification. These organizations invest a large amount of time and energy into experimental changes to make sure that GTFS continues to evolve.

For the adopted base implementation, first adopters were

- Producers: <a href="https://www.interline.io/" target="_blank">Interline</a>, <a href="https://www.mta.maryland.gov/developer-resources" target="_blank">Maryland Department of Transportation</a>, <a href="https://dot.ca.gov/cal-itp/cal-itp-gtfs" target="_blank">Cal-ITP</a>
- Consumer: <a href="https://transitapp.com/" target="_blank">Transit</a>

For the fare containers feature currently under discussion, first adopters are

- Producer: <a href="https://www.interline.io/" target="_blank">Interline</a>
- Consumer: <a href="https://www.apple.com/">Apple</a>, <a href="https://transitapp.com/" target="_blank">Transit</a>

<a class="button no-icon" href="https://docs.google.com/spreadsheets/d/1jpKjz6MbCD2XPhmIP11EDi-P2jMh7x2k-oHS-pLf2vI/edit?usp=sharing" target="_blank">See who’s using Fares v2 files and fields</a>

## Proposals Currently Under Discussion

Proposals are only available in English.

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:600px;"></iframe>

## History

- **2017**: Industry research and data modelling
- **October 2021**: <a href="https://github.com/google/transit/pull/286#issue-1026848880" target="_blank">Base implementation drafted and shared</a>
- **December 2021**: <a href="https://github.com/google/transit/pull/286#issuecomment-990258396" target="_blank">Open vote #1 → did not pass</a>
- **March 2022**: <a href="https://github.com/google/transit/pull/286#issuecomment-1080716109" target="_blank">Open vote #2 → did not pass</a>
- **May 2022**: <a href="https://github.com/google/transit/pull/286#issuecomment-1121392932" target="_blank">Open vote #3 → passed</a>
- **August 2022**: <a href="https://github.com/google/transit/issues/341" target="_blank">Community discussion on next phase of Fares v2 begins</a>
- **December 2022**: <a href="https://github.com/google/transit/issues/341#issuecomment-1339947915" target="_blank">Community identifies stack ranked order of features to prioritize iterations</a>
