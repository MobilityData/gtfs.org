# Making your GTFS feed publicly available

## Benefits of Sharing your GTFS

GTFS data can be utilized in many ways, and publicly sharing your agency’s GTFS data provides many benefits to your riders and your agency as a whole. These include:

- Integrating your feed into mobile and web-based trip-planning applications, allowing riders to plan trips on your system
- Submitting your feed to a GTFS aggregator such as the Mobility Database, which provides a wider audience and more visibility for your agency
- Using tools that allow GTFS data to be visualized and analyzed in Geographic Information Systems (GIS) and other map-based analysis programs

### Trip Planning Apps

When your agency’s GTFS data is publicly shared, it can be utilized by a variety of trip-planning applications in addition to Google Maps. These can include other navigation apps such as Bing Maps, Apple Maps, as well as transit-specific platforms like Transit, Moovit, Transportr, and Citymapper. Additionally, access to open feed data enables developers to make apps that are geared toward particular regions or can have features that aren’t included in the standard trip planners such as: Vamos (San Joaquin & Stanislaus Counties, California), MetroHero (Washington D.C. area), Entur (Norway), and more.

### Feed Aggregators

Sharing your GTFS data also allows it to be indexed by GTFS feed aggregation platforms, which can include state- or region-level directories of GTFS feeds, as well as international feed aggregators like the [Mobility Database](https://database.mobilitydata.org/) and [Transitland](https://www.transit.land/) (see more feed aggregators [here](/resources/data). Being indexed on a feed aggregator increases your agency’s visibility and allows developers, researchers, and other interested parties to easily access your agency’s data for a variety of purposes, including the development of new applications.

### Integration with GIS, Analysis, and other Platforms and Tools

GTFS data can also be imported and used on a variety of geospatial analysis platforms. Geographic Information Systems (GIS) programs like Esri’s ArcGIS, as well as the open-source QGIS have their own plugins and extensions that can import and visualize GTFS stop and route data.

- Esri has a [wide variety of tools and plugins](https://esri.github.io/public-transit-tools/) that use GTFS data, including visualizing schedule data
- In QGIS, [GTFS-GO](https://plugins.qgis.org/plugins/GTFS-GO-master/) and [GTFS Loader](https://plugins.qgis.org/plugins/GTFS_Loader/) allow you to visualize routes + stops within the platform  
- [Additional analysis tools](https://gtfs.org/resources/gtfs/#gtfs-analysis-tools)

Other platforms allow you to visualize and analyze GTFS data in unique ways:

- [Conveyal](https://conveyal.com/) is an open-source program that allows users to import GTFS data to visualize schedules, routes, and patterns, and analyze the impacts of potential service changes. Users can also import and work with demographic data to carry out analyses on, for example, how different routes or schedules would affect access to jobs in a particular urban area.
- [GTFS to HTML](https://gtfstohtml.com/) is an open-source tool that enables the conversion of GTFS schedule data into HTML timetables. It allows agencies to automatically publish and update their schedules on their website in a format that can also be read by screen readers, making the data accessible to visually impaired people.

## Sharing your Data: Tips & Best Practices

### Create and Maintain a Permanent Fetch Link

A fetch link is a permanent URL at which your agency’s GTFS Schedule files are stored. Typically, it is hosted either on your agency’s website or by your vendor, if you contract with one for GTFS production. This is the way that trip planning apps like Google Maps access your data. Ideally, your GTFS Schedule files should be downloadable directly from this URL without requiring a login. However, if this is not feasible due to licensing restrictions, your agency can control access to the data by using and issuing API keys to users of the data.

### URL and File Names

Consistent fetch link and GTFS file names are crucial to ensuring access to your feed data. If your agency does not use consistent URLs and file names for its data, it means that trip planning apps, feed aggregators, and other users will not get the most accurate and up-to-date data, which will cause problems in the long run.

Once you have set a URL for your permanent fetch link, DO NOT CHANGE IT. This means that the URL name should stay consistent, even if the files themselves are updated. As such, keep your URLs as simple and generic as possible, and avoid using URLs that have dates or version numbers in them.

- **GOOD:** http://www.bart.gov/dev/schedules/google_transit.zip,
- **AVOID:** http://www.bart.gov/dev/schedules/google_transit_Fall_2021.zip

Likewise, keep the name of the ZIP folder containing the GTFS Schedule files consistent, even if you make any updates to the feed itself. For example, when you update a feed, you should not add any sort of date or version number to the ZIP folder name. If you would like to include data on the feed version or feed start and end dates in the feed, you can include it in the feed_info.txt file.

- **GOOD:** “YourAgency_gtfs.zip”, “google_transit.zip”, “gtfs.zip”,
- **AVOID:** “YourAgency_gtfs_092921.zip”, “YourAgency_Fall2021.zip”


### File Configuration and Integrity

Your GTFS is a zip file containing several interconnected text files (.txt). In order to ensure the format is correct, always do the following:

1. When opening a text file, make sure you keep the values as text. There are a lot of fields in a GTFS that applications like Excel will read incorrectly, or abbreviate.
2. The files are comma delimited, not tab delimited. This means each file contains records in rows, and the different fields are separated by commas.
3. Extra rows or columns will cause errors on consuming applications, so make sure there are no empty rows or columns when saving the file.
4. Do not discard any of the files in your GTFS - they work together and any missing files may cause errors with consuming applications.
5. When re-zipping the files, make sure to zip up the files, not a containing folder. You can be sure you have done this correctly by unzipping your file and immediately seeing the files in that folder, not another folder containing the files.


### Additional Considerations

If multiple agencies share the same stop with different names or codes, applications like Google Maps might need to pick one. To avoid confusion, coordinate with other agencies to agree on the names and codes. This minimizes conflicts between different GTFS datasets.

In the event you have multiple GTFS datasets available to you —usually the result of one being produced for public applications like Transit App, and another being produced for internal operational CAD/AVL systems— you may need to decide which one will be the published GTFS. It is recommended that you choose to promote the feed that contains the most rider-facing information. Whenever possible, seek to have your GTFS datasets match (same ids for things like stops and trips) so that internal ones do not conflict with public ones, and integrating other feeds like GTFS-RT is possible.

