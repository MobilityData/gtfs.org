# Creating a GTFS dataset

## Overview of a GTFS feed
All GTFS feeds start with a dataset in the GTFS Reference format, which is a series of CSV files saved with a .txt file extension[^1]. At its most basic implementation, a GTFS dataset typically starts with seven base files, combined into a .zip file which is hosted on a stable and public URL: this is the GTFS feed.

<img class="center" width="560" height="100%" src="../../../assets/create_001.png">

Each file consists of a list of multiple records (lines of data) with several information fields. For example, each line listed in [routes.txt](../../documentation/schedule/reference/#routestxt) represents a public transport route and its fields describe multiple elements of that route, like its name, description, operating agency, etc.

<img class="center" width="560" height="100%" src="../../../assets/create_002.png">

The base files for a GTFS dataset can be described as follows: A GTFS schedule dataset has one or more routes ([routes.txt](../../documentation/schedule/reference/#routestxt)), each route has one or more trips ([trips.txt](../../documentation/schedule/reference/#tripstxt)), each trip visits a series of stops ([stops.txt](../../documentation/schedule/reference/#stopstxt)) at specified times ([stop_times.txt](../../documentation/schedule/reference/#stop_timestxt)). Trips and stop times only contain time of day information; the calendar is used to determine on which days a given trip runs ([calendar.txt](../../documentation/schedule/reference/#calendartxt) and [calendar_dates.txt](../../documentation/schedule/reference/#calendar_datestxt)). Additionally, multiple agencies ([agency.txt](../../documentation/schedule/reference/#agencytxt)) can operate multiple routes. These files are linked to each other with fields that are cross-referenced between them.

<img class="center" width="560" height="100%" src="../../../assets/create_003.png">

Once these files have been set up to create a basic GTFS dataset,  additional (optional) files can be added to enable other functionalities or specific needs between transit agencies and vendors. Some examples of these files include: 

- [shapes.txt](../../documentation/schedule/reference/#shapestxt) which allows to graphically represent a trip’s path, 
- [pathways.txt](../../documentation/schedule/reference/#pathwaystxt) which provides information that makes it possible to generate directions to help users navigate stations, 
- [frequencies.txt](../../documentation/schedule/reference/#frequenciestxt) which provides an alternative way to specify stop times. 

For more information on all the GTFS functionalities that can be enabled, see the [“What can GTFS do?”](../features/overview/) section. 

A GTFS Schedule dataset can be complemented with realtime information like vehicle positions and service updates. To do this, a GTFS Realtime feed needs to be created separately from the existing GTFS Schedule dataset. 

A GTFS Realtime feed consists of a regular binary file served via HTTP and updated frequently, any type of webserver can host and serve the file. The GTFS Realtime data exchange format is based on [Protocol Buffers](https://developers.google.com/protocol-buffers/), a language- and platform-neutral mechanism for serializing structured data. GTFS Realtime can provide three types of information: Trip updates, Service alerts and Vehicle positions, these can be combined depending on the service information that needs to be communicated.

Because GTFS Realtime allows to present the actual status of a fleet, the feed needs to be updated regularly - preferably whenever new data comes in from the service’s Automatic Vehicle Location system. Combined, GTFS Schedule dataset and a GTFS Realtime feed enable consuming applications to provide accurate and up-to-date information to riders. For more more information consult the Technical Documentation.

## Producing your first GTFS feed?

If you are an agency looking to produce your first GTFS feed, the first thing you need to do is read the existing documentation.

Begin by exploring the capabilities of GTFS in the ["What can GTFS do?"](../features/overview) section and determining the different features of your transit service that you want to represent using the GTFS format. For a more in-depth exploration, the official reference documentation for [GTFS Schedule](../../documentation/schedule/reference) and [GTFS Realtime](../../documentation/realtime/reference) offers detailed guidance on modeling these features and ensuring compliance.

Next, collect all the required data from your system. This includes information for all stops, routes, timetables, fares, etc., as many of these details will be the inputs that will populate the GTFS dataset.

Depending on the size and complexity of your system, you have the option to either create the data in-house or bring an external GTFS vendor to transform the data into the GTFS format. 

In some cases, small agencies with a handful of routes create the data themselves using commonly available software like spreadsheets and text editors. 

When dealing with a larger system scope, most agencies acquire specialized GTFS management software from specialized vendors, but some might opt for developing their own internal tools. Finally, when the system characteristics prove to be challenging for agencies to write datasets on their own, GTFS production can be outsourced entirely to companies specializing in producing GTFS data.

<a href="https://www.flaticon.com/authors/freepik" title="Icons by Freepik">Icons created by Freepik - Flaticon</a>

[^1]: In addition to text files, the [GeoJSON](https://geojson.org/) format is now also supported in GTFS to represent certain elements of Demand-responsive services.
