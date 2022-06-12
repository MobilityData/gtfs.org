<a href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/index.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.71 7.04c.39-.39.39-1.04 0-1.41l-2.34-2.34c-.37-.39-1.02-.39-1.41 0l-1.84 1.83 3.75 3.75M3 17.25V21h3.75L17.81 9.93l-3.75-3.75L3 17.25Z"></path></svg>
  </a>
  
# GTFS Schedule Overview

<div class="landing-page">
    <a class="button" href="reference">Reference</a><a class="button" href="best-practices">Best Practices</a><a class="button" href="examples">Examples</a><a class="button" href="changes">Changes</a>
</div>

## Getting Started

A GTFS feed, which contains static transit information, is composed of a number of text (.txt) files that are contained in a single ZIP file. Each file describes a particular aspect of transit information: stops, routes, trips, fares, etc. For more information about each file, consult the GTFS reference. 

In order to create a GTFS feed follow the steps below.

1. Create all the required files described in the [GTFS Schedule](reference) reference. Create the optional files if their functionality is desired. 
1. Save all files in the .txt format. Field values should be comma delimited and each line should end with a line break. See the GTFS reference for detailed information on the file contents.
1. Zip all the text files together. The zipped file comprises a version of the feed.
1. Publish the feed by using one of the options below. 

## Making a Transit Feed Publicly Available
<hr>

Datasets should be published at a public, permanent URL, including the zip file name. (e.g., www.agency.org/gtfs/gtfs.zip). Ideally, the URL should be directly downloadable without requiring login to access the file, to facilitate download by consuming software applications. While it is recommended (and the most common practice) to make a GTFS dataset openly downloadable, if a data provider does need to control access to GTFS for licensing or other reasons, it is recommended to control access to the GTFS dataset using API keys, which will facilitate automatic downloads.

The web-server hosting GTFS data should be configured to correctly report the file modification date (see HTTP/1.1 - Request for Comments 2616, under Section 14.29).

See “[Best Practices: Dataset Publishing](best-practices/#dataset-publishing-general-practices)” for further recommendations.

## Training
<hr>

The World Bank Open Learning Campus (OLC) offers a self-based online course called “[Introduction to the General Transit Feed Specification (GTFS) and Informal Transit System Mapping](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping)”. This course includes the following sections:

- What is GTFS? History & File Structure
- What is GTFS? Visualization & Community
- Setting up a GTFS Feed
- Introduction to GitHub & Open Source Tools
- Stories from the Field
- How to Map Transit Data
- How to Collect Data for a City’s First Feed
- App Survey
- GTFS-Realtime

See more [online courses](../resources/other/#on-line-courses).

## Getting Help & Community
<hr>

### Mailing Lists

There are a number of mailing lists that can be good resources when you have questions about public transit data, software, formats like GTFS and GTFS-realtime, and other issues:

* [GTFS Changes](https://groups.google.com/group/gtfs-changes): discussion of proposal for extending the GTFS specification.
* [GTFS Slack](https://gtfs.slack.com/): Slack "organization" at with channels devoted to GTFS topics. [Request an invite to gtfs.slack.com here](https://gtfs.herokuapp.com/).
* [Transit Developers](https://groups.google.com/group/transit-developers): general transit developer discussions. Many transit agencies also have their own developer mailing lists specific to the agency. For example:
  * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
  * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
  * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
  * [MassDOT](https://groups.google.com/group/massdotdevelopers)
  * [Atlanta, GA region](https://groups.google.com/forum/#!forum/atl-transit-developers)
  * [511 San Francisco Bay Area Developer Resources](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)
* Check with your local transit agency to see if they have a mailing list of their own.

See more [community resources](../resources/community).
