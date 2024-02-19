# GTFS: Making Public Transit Data Universally Accessible

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/SDz2460AjNo?si=wFsaN4_Hr3ypxWdp" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

The General Transit Feed Specification (GTFS) is an [Open Standard](https://www.interoperablemobility.org/definitions/#open_standard) used to distribute relevant information about transit systems to riders. It allows public transit agencies to publish their transit data in a format that can be consumed by a wide variety of software applications. Today, the GTFS data format is used by thousands of public transport providers.

GTFS consists of two main parts: GTFS Schedule and GTFS Realtime. GTFS Schedule contains information about routes, schedules, fares, and geographic transit details, and it is presented in simple text files. This straightforward format allows for easy creation and maintenance without relying on complex or proprietary software.

GTFS Realtime contains trip updates, vehicle positions, and service alerts. It is based on Protocol Buffers, which are a language (and platform) neutral mechanism for serializing structured data.

GTFS is supported around the world and its use, importance, and scope has been increasing. It’s likely that an agency you know already uses GTFS to represent routes, schedule, stop locations, and other information, and that riders are already consuming it via various applications.

[Learn more about the history of GTFS](background.md)

## Why Use GTFS?

GTFS is used by over 10,000 transit agencies in over 100 countries. Most transit agencies have heard of GTFS, and it has quickly become an industry standard. Some agencies produce this data themselves, while others employ a vendor to create and maintain data for them. And because it is a simple, text-based Open Standard, many transit technology vendors can already read and write to GTFS files. By better understanding GTFS, agencies can make better choices when it comes to data. The choices agencies make in how to maintain and distribute GTFS can have a huge impact on service quality. 

### Open Data means more opportunity and choices

GTFS is an Open Standard. This means that agencies can make information available using any of the many tools which already support GTFS (including simple text editing using a text editor or a spreadsheet). Open standards lead to the creation of data that can be easily shared. A feed is simply the collection of text files that describe a service, hosted online at a permalink that’s publicly available. The same feed can be used by Google, Apple, Transit App, Open Trip Planner, and even apps created by riders. Anyone who wants to provide accurate and up-to-date transit information can use a GTFS feed to do so. 

Some riders like to use different apps depending on their needs—having GTFS lets riders choose what trip planning app suits them best. Some apps may be more accessible or better at providing information for riders with disabilities, some may be simpler and easier to use, and sometimes riders just want the newest app.

### GTFS can probably do more than you think

GTFS is most widely known for trip planning information, particularly in metro areas with fixed-route service. However, there are a variety of optional features above and beyond the basic GTFS Schedule specification that make GTFS more widely applicable, including Fares for showing fare costs and structures, Flex (in development) for demand-responsive transit options, such as dial-a-ride and paratransit services, and Pathways for displaying accessibility information that’s vital to riders using mobility devices or needing additional accommodations. GTFS Realtime builds upon GTFS Schedule and on-vehicle GPS systems to provide real-time updates on vehicle locations.

### GTFS is more than just trip planning

GTFS data is now being used by a variety of software applications for many different purposes, including data visualization and analysis tools for planning. Having up-to-date and high quality data provides accurate transit information not just to riders, but to planners and policymakers who are able to better understand how transit is being used in their communities. Beginning in 2023, the United States' Federal Transit Administration will require [transit agencies there to submit valid GTFS data](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications) with their annual National Transit Database report.

## How to create GTFS

A GTFS feed, which contains static transit information, is composed of a number of text (.txt) files that are contained in a single ZIP file. Each file describes a particular aspect of transit information: stops, routes, trips, fares, etc. For more information about each file, consult the GTFS reference. 

In order to create a GTFS feed follow the steps below.

1. Create all the required files described in the [GTFS Schedule](reference) reference. Create the optional files if their functionality is desired. 
1. Save all files in the .txt format. Field values should be comma delimited and each line should end with a line break. See the GTFS reference for detailed information on the file contents.
1. Zip all the text files together. The zipped file comprises a version of the feed.
1. Publish the feed by using one of the options below. 

### GTFS Schedule Validator

This free and open-source canonical GTFS Schedule validator is maintained by [MobilityData](https://mobilitydata.org) with the help of the GTFS community. Use it to evaluate your dataset against the official [GTFS Reference](reference.md) and [Best Practices](best-practices.md). It provides an easy-to-use validation report in an HTML format that can be opened in the browser and shared with other parties.

<!-- <img class="center" src="../../assets/validator_animation.gif" width="150"> -->
<br>

**Current version: 4.2** [(see the release notes)](https://github.com/MobilityData/gtfs-validator/releases/latest)

<hr>

### Usage

<div class="usage">
    <div class="usage-list">
        <ol>
            <li>Go to <a href="https://gtfs-validator.mobilitydata.org/">gtfs-validator.mobilitydata.org</a>. </li>
            <li>Load your GTFS dataset: you can select or drag & drop a ZIP file, or copy/paste a URL.</li>
            <li>When the validation is finished, an option to open the report will be provided.</li>
            <li>You will see if the validator found issues with the data, and links to our documentation for how to fix them. The URL of the validation report will work for 30 days and can be shared with others.</li>
        </ol>
    </div>
    <div class="usage-video">
        <video class="center" width="560" height="315" controls>
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4">
        </video>
    </div>
</div>

### Use This Validator as Part of Your Data Pipeline

To see more instructions on how to use this tool in your data pipeline, please visit the [GitHub repository](https://github.com/MobilityData/gtfs-validator).

### Community

This project is a community effort, and anyone interested in this project can join the community, participate in decision-making and help advance it in different ways. There are many different ways to contribute: sharing your idea for a new feature, reporting a problem, improving the documentation, teaching others how to use it, etc.

👀  [See who is using this validator](https://github.com/MobilityData/gtfs-validator/wiki/Organizations-using-this-GTFS-Validator).  
💬  Help us improve this tool by [sharing your feedback](https://forms.gle/bWrXGDCUqrGfRYCs8).  
🤝  Interested in contributing to this project? Please visit the [GitHub repository](https://github.com/MobilityData/gtfs-validator) and read our [contribution guidelines](https://github.com/MobilityData/gtfs-validator/blob/master/docs/CONTRIBUTING.md).

## What is High Quality GTFS?

High quality GTFS is complete, accurate, and up-to-date. This means that it represents how services are currently operating and provides as much information as possible.
For information on creating high quality data, see the [California Transit Data Guidelines](https://dot.ca.gov/cal-itp/california-transit-data-guidelines), the [GTFS Schedule Best Practices](https://gtfs.org/schedule/best-practices/) and the [GTFS Realtime Best Practices](https://gtfs.org/realtime/best-practices/).
For evaluating the quality of a dataset, see [Validate](https://gtfs.org/schedule/validate/) page.

### Complete Data

Quality GTFS includes important service details such as holiday and summer schedule changes, accurate stop locations, and names for routes and headsigns that match other rider-facing materials. Even if an agency works with a vendor to produce GTFS, it’s ultimately up to the agency to ensure that the information presented in print, on board, and online is consistent.

### Accurate Data

Accurate data is essential for providing transit riders with a reliable and user-friendly transportation experience. Errors in the data can block a portion or the totality of a dataset from being used. 

### Up to Date

Having out of date data is almost worse than no feed at all. It's not enough to simply publish information—it has to match what the rider sees and experiences. Some of the largest transit agencies update their GTFS weekly, or even daily, but most agencies will need to update their GTFS every few months, or a few times a year when service changes. This includes things like new routes or stops, timetable changes, or updates to fare structure.
 
Many agencies hire a vendor to create and manage their GTFS for them. Some vendors may be proactive in asking about service changes, but it’s important that agencies communicate with vendors about upcoming service changes. It’s possible to publish GTFS with service changes in advance, making sure the transition goes smoothly for everyone—agencies, vendors, trip planners, and riders!

## Making your GTFS Publicly Available

GTFS data can be utilized in many ways, and publicly sharing your agency’s GTFS data provides many benefits to your riders and your agency as a whole. These include: 

* Integrating your feed into mobile and web-based trip planning applications, allowing riders to plan trips on your system 
* Submitting your feed to a GTFS aggregator such as Transitland, which provides a wider audience and more visibility for your agency 
* Using tools that allow GTFS data to be visualized and analyzed in Geographic Information Systems (GIS) and other map-based analysis programs  

### Benefits to Sharing your GTFS

#### Trip Planning Apps

When your agency’s GTFS data is publicly shared, it can be utilized by a variety of trip planning applications in addition to Google Maps. These can include other navigation apps such as Bing Maps + Apple Maps, as well as transit-specific platforms like Transit, Moovit, Transportr, and Citymapper. Additionally, access to open feed data enables developers to make apps that are geared toward particular regions or can have features that aren’t included in the standard trip planners. Some examples include: 

* [Vamos](https://vamosmobileapp.com/) (*San Joaquin & Stanislaus Counties, California*) - Vamos is a mobile app that supports trip planning and fare payments for transit agencies in San Joaquin and Stanislaus Counties in California, including Altamont Commuter Express, San Joaquin RTD, and Stanislaus County RTA. Within the app, users can plan multi-agency trips and also buy passes from participating agencies. Coming updates to the app include fare payment  for all agencies in the trip planner, as well as support for GTFS extensions such as Fares V2, which will allow the app to support and display more complex fare structures, particularly on inter-agency trips.
* [MetroHero](https://dcmetrohero.com/dashboard) (*Washington D.C. area*) - MetroHero is a mobile app that uses WMATA’s GTFS-static and realtime feeds to allow you to visualize your commute in multiple ways. Users can view real-time vehicle locations, as well as station-level arrival times, service alerts, and  elevator or escalator outages. The app also allows for extensive analysis of current and historical agency data, even allowing users to carry out a “Live Performance Audit” of WMATA headway adherence at the stop level. 
* [Entur](https://entur.no/) (*Norway*) - Entur offers multi-modal travel planning for all of Norway, including bus, train, ferry, metro, plane, and e-scooter. Users can purchase tickets through the app and filter trip options by factors such as transport type, walking speed, and transition time between legs. Entur’s goal is to make it easy to choose public transportation in Norway.

#### Feed Aggregators

Sharing your GTFS data also allows it to be indexed by GTFS feed aggregation platforms, which can include state- or region-level directories of GTFS feeds, as well as international feed aggregators like [Transitland](https://www.transit.land/) and the [Mobility Database](https://database.mobilitydata.org/). Being indexed on a feed aggregator increases your agency’s visibility and allows developers, researchers, and other interested parties to easily access your agency’s data for a variety of purposes, including the development of new applications.

#### Integration with GIS, Analysis, and other Platforms and Tools

GTFS data can also be imported into and used in a variety of geospatial analysis platforms. Geographic Information Systems (GIS) programs like Esri’s ArcGIS, as well as the open-source QGIS have their own plugins and extensions that can import and visualize GTFS stop and route data:
* Esri has a [wide variety of tools and plugins](https://esri.github.io/public-transit-tools/) that use GTFS data, including visualizing schedule data
* In QGIS, [GTFS-GO](https://plugins.qgis.org/plugins/GTFS-GO-master/) and [GTFS Loader](https://plugins.qgis.org/plugins/GTFS_Loader/) allow you to visualize routes + stops within the platform  
* [Additional analysis tools](https://gtfs.org/resources/gtfs/#gtfs-analysis-tools)

Other platforms allow you to visualize and analyze GTFS data in unique ways:
* [Conveyal](https://conveyal.com/) is an open-source program that allows users to import GTFS data to visualize schedules, routes, and patterns, and analyze impacts of potential service changes. Users can also import and work with demographic data to carry out analyses on, for example, how different routes or schedules would affect access to jobs in a particular urban area.
* [GTFS to HTML](https://gtfstohtml.com/) is an open-source tool that enables the conversion of GTFS schedule data into HTML timetables. It allows agencies to automatically publish and update their schedules to their website in a format that can also be read by screen readers, making the data accessible to visually impaired people.

### Sharing your Data: Tips & Best Practices

#### Create and Maintain a Permanent Fetch Link

A fetch link is a permanent URL at which your agency’s static GTFS files are stored. Typically, it is hosted either on your agency’s website or by your vendor, if you contract with one for GTFS production. This is the way that trip planning apps like Google Maps access your data. Ideally, your static GTFS files should be downloadable directly from this URL without requiring a login. However, if this is not feasible due to licensing restrictions, your agency can control access to the data by using and issuing API keys to users of the data. If your agency does not currently host its static GTFS files on its website, contact your webmaster or IT specialist - they should be able to set up a simple hosting URL for you.

#### URL and File Names

Consistent fetch link and GTFS file names are crucial to ensuring access to your feed data. If your agency does not use consistent URLs and file names for its data, it means that trip planning apps, feed aggregators, and other users will not get the most accurate and up-to-date data, which will cause problems in the long run.   
   
Once you have set a URL for your permanent fetch link, **DO NOT CHANGE IT**. This means that the URL name should stay consistent, even if the files themselves are updated. As such, keep your URLs as simple and generic as possible, and avoid using URLs that have dates or version numbers in them.   
**GOOD:** http://www.bart.gov/dev/schedules/google_transit.zip,  
**AVOID**: http://www.bart.gov/dev/schedules/google_transit_Fall_2021.zip

Likewise, keep the name of the ZIP folder containing the GTFS static files consistent, even if you make any updates to the feed itself. For example, when you update a feed, you should not add any sort of date or version number to the ZIP folder name. If you would like to include data on the feed version or feed start and end dates in the feed, you can include it in the feed_info.txt file.  
**GOOD:** “YourAgency_gtfs.zip”, “google_transit.zip”, “gtfs.zip”   
**AVOID:** “YourAgency_gtfs_092921.zip”, “YourAgency_Fall2021.zip”

#### File Configuration and Integrity

Your GTFS is a zip file containing several interconnected text files (.txt). In order to ensure the format is correct, always do the following:

1. When opening a text file, make sure you keep the values as text. There are a lot of fields in a GTFS that applications like Excel will read incorrectly, or abbreviate. 
2. The files are comma delimited, not tab delimited. This means each file contains records in rows, and the different fields are separated by commas.
3. Extra rows or columns will cause errors on consuming applications, so make sure there are no empty rows or columns when saving the file.
4. Do not discard any of the files in your GTFS - they work together and any missing files may cause errors with consuming applications.
5. When re-zipping the files, make sure to zip up the files, not a containing folder. You can be sure you have done this correctly by unzipping your file and immediately seeing the files in that folder, not another folder containing the files.

#### Additional Considerations

GTFS is an open data specification, and the best practice is to ensure that when you organize your agency’s information into GTFS format,  it is made available for anyone wishing to use it. This means that it is also possible your agency’s data could be included in a different feed than the one you are maintaining.

The best way to ensure that your GTFS is the one that gets used by an application is to make that data publicly available. This ensures that if a conflict arises about the source of a feed, you can definitively point to your GTFS as the best one to use.

There are cases where an application, such as Google Maps, must select data from one GTFS source over another. One common example is a stop’s name and code—many agencies may share a single stop, each with their own name and code. Because only one name and code is shown on this application, the best way to ensure it matches what you wish riders to see is to coordinate your GTFS with other overlapping agencies. If all affected agencies agree upon the name and code, then the likelihood of conflicts between multiple GTFS datasets is minimized.

In the event you have multiple GTFS datasets available to you—usually the result of one being produced for public applications like Transit App, and another being produced for internal operational CAD/AVL systems— you may need to decide which one will be the published GTFS. It is recommended you choose to promote the feed  that contains the most rider-facing information. GTFS that contains internal/jargony names for routes or stops, lacks fare information, or contains stop locations placed to intersect with the path of travel of the bus (common for CAD/AVL systems) should not be considered for public use. Whenever possible, seek to have your GTFS datasets match (same ids for things like stops and trips) so that internal ones do not conflict with public ones, and integrating other feeds like GTFS-RT is possible.

### Resources and Further Reading

* [Best Practices for Publishing GTFS Data](https://gtfs.org/schedule/reference/#dataset-publishing-general-practices)
* [Applications and Uses for GTFS Data](http://gtfs.org/applications)
* [Principles of Open Data](https://project-open-data.cio.gov/principles/)
* [Cal-ITP - California Transit Data Guidelines](https://dot.ca.gov/cal-itp/california-minimum-general-transit-feed-specification-gtfs-guidelines)

## Example GTFS Feed

This example GTFS feed shows comma-delimited data samples for each file in a transit feed. The sample data files shown here aren't all related to each other. You can also [download a complete GTFS feed](https://github.com/google/transit/blob/master/gtfs/spec/en/examples/sample-feed-1.zip?raw=true) in final form to work with as well, or browse the individual files of that same feed online [here](https://github.com/google/transit/tree/master/gtfs/spec/en/examples/sample-feed-1).

### agency.txt

```
agency_id,agency_name,agency_url,agency_timezone,agency_phone,agency_lang
FunBus,The Fun Bus,https://www.thefunbus.org,America/Los_Angeles,(310) 555-0222,en
```

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
agency001,Transit Agency,https://www.transitcommuterbus.com/,PST,en
[...]
```

### stops.txt

```
stop_id,level_id,stop_name,stop_lat,stop_lon,location_type,parent_station
F12,,5 Av/53 St,40.760167,-73.975224,1,
E1,L0,5 Av/53 St SW,40.760474,-73.976099,2,F12
E2,L0,5 Av/53 St NE,40.76035,-73.97546,2,F12
E3,L0,5 Av/53 St SE,40.760212,-73.975512,2,F12
E4,L0,Madison/53 St NE,40.759612,-73.973731,2,F12
E5,L0,Madison/53 St SE,40.759491,-73.973820,2,F12
N1,L1,,,40.760457,-73.975912,3,F12
N2,L1,,40.760531,-73.976111,3,F12
N3,L1,,40.759746,-73.974203,3,F12
N4,L1,,40.759679,-73.974064,3,F12
F12S,,5 Av/53 St,40.760167,-73.975224,0,F12
B1,L2,,40.759746,-73.974203,4,F12S
B3,L2,,40.759828,-73.974442,4,F12S
F12N,,5 Av/53 St,40.760167,-73.975224,0,F12
B2,L3,,40.760457,-73.975912,4,F12N
B4,L3,,40.760375,-73.975729,4,F12N 
```
`location_type=` 0: platform; 1: station; 2: entrance/exit; 3: generic node; 4: boarding area.

### routes.txt

```
route_id,route_short_name,route_long_name,route_desc,route_type
A,17,Mission,"The ""A"" route travels from lower Mission to Downtown.",3
```

### trips.txt

```
route_id,service_id,trip_id,trip_headsign,block_id
A,WE,AWE1,Downtown,1
A,WE,AWE2,Downtown,2
```

### stop_times.txt

```
trip_id,arrival_time,departure_time,stop_id,stop_sequence,pickup_type,drop_off_type
AWE1,0:06:10,0:06:10,S1,1,0,0
AWE1,,,S2,2,1,3
AWE1,0:06:20,0:06:30,S3,3,0,0
AWE1,,,S5,4,0,0
AWE1,0:06:45,0:06:45,S6,5,0,0
AWD1,0:06:10,0:06:10,S1,1,0,0
AWD1,,,S2,2,0,0
AWD1,0:06:20,0:06:20,S3,3,0,0
AWD1,,,S4,4,0,0
AWD1,,,S5,5,0,0
AWD1,0:06:45,0:06:45,S6,6,0,0
```

### calendar.txt

```
service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
WE,0,0,0,0,0,1,1,20060701,20060731
WD,1,1,1,1,1,0,0,20060701,20060731
```

### calendar_dates.txt

This example shows service exceptions for the Independence Day holiday in 2006. On Monday July 3, 2006, regular weekday service (`service_id=WD`) is interrupted (`exception_type=2`). Instead, weekend service (`service_id=WE`) runs on that date (`exception_type=1`). The same change applies on Tuesday July 4, as well.

```
service_id,date,exception_type
WD,20060703,2
WE,20060703,1
WD,20060704,2
WE,20060704,1
```

### fare_attributes.txt

```
fare_id,price,currency_type,payment_method,transfers,transfer_duration
1,0.00,USD,0,0,0
2,0.50,USD,0,0,0
3,1.50,USD,0,0,0
4,2.00,USD,0,0,0
5,2.50,USD,0,0,0
```

### fare_rules.txt

```
fare_id,route_id,origin_id,destination_id,contains_id
a,TSW,1,1,
a,TSE,1,1,
a,GRT,1,1,
a,GRJ,1,1,
a,SVJ,1,1,
a,JSV,1,1,
a,GRT,2,4,
a,GRJ,4,2,
b,GRT,3,3,
c,GRT,,,6
```

### shapes.txt

```
shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
A_shp,37.61956,-122.48161,1,0
A_shp,37.64430,-122.41070,2,6.8310
A_shp,37.65863,-122.30839,3,15.8765
```

### frequencies.txt

```
trip_id,start_time,end_time,headway_secs
AWE1,05:30:00,06:30:00,300
AWE1,06:30:00,20:30:00,180
AWE1,20:30:00,28:00:00,420
```

### transfers.txt

```
from_stop_id,to_stop_id,transfer_type,min_transfer_time
S6,S7,2,300
S7,S6,3,
S23,S7,1,
```

### pathways.txt

```
pathway_id,from_stop_id,to_stop_id,pathway_mode,is_bidirectional
E1N1,E1,N1,2,1
E2N1,E2,N1,2,1
E3N1,E3,N1,2,1
N1-N2,N1,N2,6,1
N2-N1,N2,N1,7,1
N2N3,N2,N3,2,1
N2-B1,N2,B1,4,0
B1-N2,B1,N2,4,0
B1B2,B1,B2,2,1

B1B3,B1,B3,1,1
B2B4,B2,B4,1,1

E4N3,E4,N3,2,1
E5N3,E5,N3,2,1
N3-N4,N3,N4,6,1
N4-N3,N4,N3,7,1
N4B3,N4,B3,2,1
N4-B3,N4,B3,4,0
B3-N4,B3,N4,4,0
B3B4,B3,B4,2,1
```

### levels.txt

```
level_id,level_index,level_name,elevation
L0,0,Street,0
L1,-1,Mezzanine,-6
L2,-2,Southbound,-18
L3,-3,Northbound,-24
```

### translations.txt

```
table_name,field_name,language,translation,record_id
stops,stop_name,en,Tokyo Station,stopid000001
stops,stop_name,fr,Gare de Tokyo,stopid000001
stops,stop_name,zh,東京站,stopid000001
```

### attributions.txt

```
attribution_id,is_producer,is_operator,organization_name,agency_id
attribution001,1,0,Transit Feed Solutions USA,agency001
attribution002,0,1,Transit Bus Operations USA ,agency001
[...]
```