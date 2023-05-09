<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/index.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# GTFS: Making Public Transit Data Universally Accessible 

<div class="landing-page">
    <a class="button" href="schedule">GTFS Schedule</a><a class="button" href="realtime">GTFS Realtime</a><a class="button" href="resources">Resources</a><a class="button" href="extensions">Extensions</a>
</div>

The General Transit Feed Specification (GTFS) is an [Open Standard](https://www.interoperablemobility.org/definitions/#open_standard) used to distribute relevant information about transit systems to riders. It allows public transit agencies to publish their transit data in a format that can be consumed by a wide variety of software applications. Today, the GTFS data format is used by thousands of public transport providers.

GTFS is simple. Information about routes, schedules, and fares are represented in basic text files, which means it can be created and maintained without the use of complicated or proprietary software. It is split into a schedule component that contains schedule, fare, and geographic transit information and a real-time component that contains arrival predictions, vehicle positions and service advisories.

GTFS is supported around the world and its use, importance, and scope has been increasing. It’s likely that an agency you know already uses GTFS to represent your routes, schedule, stop locations, and other information, and that riders are already consuming it via various applications.

[Learn more about the history of GTFS](background.md)

## Why Use GTFS?

GTFS is used by over 10,000 transit agencies in over 100 countries. Most transit agencies have heard of GTFS, and it has quickly become an industry standard. Some agencies produce this data themselves, while others employ a vendor to create and maintain data for them. And because it is a simple, text-based Open Standard, many transit technology vendors can already read and write to GTFS files. By better understanding GTFS, you can make better choices when it comes to your data. The choices you make in how you maintain and distribute your GTFS can have a huge impact on the quality of service you’re able to provide.

### Open Data means more opportunity and choices

GTFS is an Open Standard. This means that you can make information available using any of the many tools which already support GTFS (including simple text editing using a text editor or a spreadsheet). Open standards lead to the creation of data that can be easily shared. A feed is simply the collection of text files that describe your service, hosted online at a permalink that’s publicly available. The same feed can be used by Google, Apple, Transit App, Open Trip Planner, and even apps created by riders. Anyone who wants to provide accurate and up-to-date transit information can use your GTFS to do so. 

Some riders like to use different apps depending on their needs—having GTFS lets riders choose what trip planning app suits them best. Some apps may be more accessible or better at providing information for riders with disabilities, some may be simpler and easier to use, and sometimes riders just want the newest app.

### GTFS can probably do more than you think

GTFS is most widely known for trip planning information, particularly in metro areas with fixed-route service. However, there are a variety of optional features above and beyond the basic GTFS Schedule specification that make GTFS more widely applicable, including Fares for showing fare costs and structures, Flex (in development) for demand-responsive transit options, such as dial-a-ride and paratransit services, and Pathways for displaying accessibility information that’s vital to riders using mobility devices or needing additional accommodations. GTFS Realtime builds upon GTFS Schedule and on-vehicle GPS systems to provide real-time updates on vehicle locations.

### GTFS is more than just trip planning

GTFS data is now being used by a variety of software applications for many different purposes, including data visualization and analysis tools for planning. Having up-to-date and high quality data provides accurate transit information not just to riders, but to planners and policymakers who are able to better understand how transit is being used in their communities. Beginning in 2023, the Federal Transit Administration finalized its reporting changes to use GTFS as the mechanism to report geographic service area coverage to the National Transit Database (NTD). This means that [transit agencies must submit valid GTFS data](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications) with their annual NTD report along with their other reporting submissions.

## What is High Quality GTFS?

High quality GTFS is complete, accurate, and up-to-date. This means that it represents how services are currently operating and provides as much information as possible.

### Complete Data

Quality GTFS includes important service details such as holiday and summer schedule changes, accurate stop locations, and names for routes and headsigns that match your other rider-facing materials. Even if an agency works with a vendor to produce GTFS, it’s ultimately up to your agency to ensure that the information you present in print, on board, and online is consistent.

For information on creating high quality data, see the [California Transit Data Guidelines](https://dot.ca.gov/cal-itp/california-transit-data-guidelines) and the [GTFS Best Practices](https://gtfs.org/schedule/best-practices/)

### Up to Date

Having out of date data is almost worse than no feed at all. It's not enough to simply publish information—it has to match what the rider sees and experiences. Some of the largest transit agencies update their GTFS weekly, or even daily, but most agencies will need to update their GTFS every few months, or a few times a year when service changes. This includes things like new routes or stops, timetable changes, or updates to fare structure.
 
Many agencies hire a vendor to create and manage their GTFS for them. Some vendors may be proactive in asking about service changes, but it’s important that agencies communicate with vendors about upcoming service changes. It’s possible to publish GTFS with service changes in advance, making sure the transition goes smoothly for everyone—agencies, vendors, trip planners, and riders!
