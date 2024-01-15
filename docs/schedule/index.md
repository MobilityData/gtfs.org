<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/index.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# GTFS Schedule Overview

<div class="landing-page">
    <a class="button" href="reference">Reference</a><a class="button" href="best-practices">Best Practices</a><a class="button" href="examples">Examples</a><a class="button" href="changes">Changes</a><a class="button" href="validate">Validate</a><a class="button" href="publishing">Publish</a>
</div>

## Getting Started

A GTFS feed, which contains static transit information, is composed of a number of text (.txt) files that are contained in a single ZIP file. Each file describes a particular aspect of transit information: stops, routes, trips, fares, etc. For more information about each file, consult the GTFS reference. 

In order to create a GTFS feed follow the steps below.

1. Create all the required files described in the [GTFS Schedule](reference) reference. Create the optional files if their functionality is desired. 
1. Save all files in the .txt format. Field values should be comma delimited and each line should end with a line break. See the GTFS reference for detailed information on the file contents.
1. Zip all the text files together. The zipped file comprises a version of the feed.
1. Make the feed publicly available. See [Publishing and Sharing your GTFS](publishing/) for more info.

## Training & Resources
<hr>

**Technical details about GTFS, what it is, and how to create and maintain data:**

- [GTFS Introductory video](https://share.mobilitydata.org/GTFS-intro)
- [Data examples with various features](https://gtfs.org/schedule/examples/)
- [World Bank "Intro to GTFS" online course](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping)
- [MBTA GTFS Onboarding](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb)

**View example feeds:**

- [GTFS Mobility Database](https://database.mobilitydata.org/) 
- [Transitland](https://www.transit.land/)

See more [data sources](../resources/data).

**For free tools and instructional materials:**

- [MobilityData GTFS Schedule Validator](https://gtfs-validator.mobilitydata.org/) 
- [NRTAP GTFS Builder](https://www.nationalrtap.org/Technology-Tools/GTFS-Builder/Support)
- [Arcadis IBI Data Tools](https://www.ibigroup.com/ibi-products/transit-data-tools/)

See more [free tools](../resources/gtfs).

**For ideas on vendors who offer GTFS services:**

- [Center for Urban Transportation Research, University of South Florida List of GTFS Vendors](https://docs.google.com/spreadsheets/u/1/d/1Gc9mu4BIYC8ORpv2IbbVnT3q8VQ3xkeY7Hz068vT_GQ/pubhtml)

See more [online courses](../resources/other/#on-line-courses).

## Getting Help & Community
<hr>

### Mailing Lists

There are a number of mailing lists that can be good resources when you have questions about public transit data, software, formats like GTFS and GTFS-realtime, and other issues:

* [GTFS Digest](https://groups.google.com/g/gtfs-digest): generated monthly providing an overview of developments on GTFS.
* [GTFS Changes](https://groups.google.com/group/gtfs-changes): discussion of proposal for extending the GTFS specification, as outlined in the [GTFS Changes document](https://github.com/google/transit/blob/master/gtfs/CHANGES.md).
* [GTFS Realtime](https://groups.google.com/group/gtfs-realtime): discussion of the [GTFS-realtime specification](https://github.com/google/transit/tree/master/gtfs-realtime).
* [MobilityData Slack](https://mobilitydata-io.slack.com/): Slack "organization" at with channels devoted to GTFS topics. [Request an invite to mobilitydata-io.slack.com here](https://share.mobilitydata.org/slack).
* [transitfeed](https://groups.google.com/group/transitfeed): discussion of the open-source [transitfeed](https://groups.google.com/group/transitfeed) project, as well of discussion of the GTFS specification and associated tools.
* [transit-developers](https://groups.google.com/group/transit-developers): general transit developer discussions. Many transit agencies also have their own developer mailing lists specific to the agency. For example:
    * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
    * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
    * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
    * [MassDOT](https://groups.google.com/group/massdotdevelopers)
    * [Atlanta, GA region](https://groups.google.com/forum/#!forum/atl-transit-developers)
    * [511 San Francisco Bay Area Developer Resources](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)

Check with your local transit agency to see if they have a mailing list of their own.

See more [community resources](../resources/community).
