# Producing Data

## GTFS

- [GTFS.org](https://gtfs.org) official documentation site for the General Transit Feed Specification.

### GTFS Courses

- [MobilityData - "Understanding GTFS: An intro and overivew](https://www.youtube.com/watch?v=SDz2460AjNo) - Video provides an overview of of the General Transit Feed Specification (GTFS) and why it is useful for transit agencies, riders, and policymakers. 
- [World Bank - "Intro. to GTFS" online course](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping) - A free, online, self-paced course for learning about GTFS and GTFS-realtime.
- [Open Transit Data Toolkit](http://transitdatatoolkit.com/) - A series of lessons to help people utilize open transit data.
- [ArcGIS - Introduction to GTFS](https://www.youtube.com/watch?v=8OQKHhu1VgQ&t=148s)
- [GTFS-books](https://github.com/MobilityData/GTFS-books) - Comprehensive guides to GTFS and GTFS Realtime. These books were written by [Quentin Zervaas](https://github.com/HendX), and have been donated to [MobilityData](https://mobilitydata.org/) and made open access.
- [MBTA GTFS Onboarding](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb) - An interactive tutorial created by MBTA for GTFS static. A [stand-alone Docker image](https://github.com/mbta/gtfs_onboarding) is available on GitHub as well as a [hosted/no-install version](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb) of the Jupyter notebook.
- [Planetizen "Building a Transit Map Web App" course](https://courses.planetizen.com/course/building-transit-map-app) - A video tutorial on setting up your own web-based mapping application, with no coding experience required. 

### GTFS Consumer App Guidance

- [Google Transit Developers](https://developers.google.com/transit/gtfs/) - Additional Google-specific documentation of GTFS.
- [Transit app Guidelines for Producing GTFS Static Data](https://resources.transitapp.com/article/458-guidelines-for-producing-gtfs-static-data-for-transit) - Additional Transit app-specific documentation of GTFS.
- [Bing Maps Transit - Add your transit data to Bing Maps](https://www.bing.com/maps/transitcontentproviders) - Additional Bing-specific documentation of GTFS.
- [Yandex Maps - Transport integration](https://yandex.ru/support/m-maps/transport.html?lang=en#connect-display) - Additional Yandex-specific documentation of GTFS.

### GTFS Libraries

Software that makes it easy to consume GTFS data in a variety of languages.

#### C
- [CGTFS](https://github.com/rakhack/cgtfs) - C library for reading static GTFS feeds. Supports reading unpacked feeds into application memory or into SQLite databases.
- [RRRR Rapid Real-time Routing](https://github.com/bliksemlabs/rrrr) - RRRR (usually pronounced R4) is a C-language implementation of the RAPTOR public transit routing algorithm.

#### C++
-  [just_gtfs](https://github.com/mesozoic-drones/just_gtfs) - C++17 header-only library for reading and writing GTFS (used in [Valhalla](https://github.com/valhalla/valhalla)). Main features: fast reading and writing of GTFS feeds, support for [extended GTFS route types](https://developers.google.com/transit/gtfs/reference/extended-route-types), simple working with GTFS Date and Time formats.

#### C#
- [ESRI public-transit-tools](https://github.com/Esri/public-transit-tools) - Tools for working with public transit data in ArcGIS (license for ArcGIS required).
- [GTFS Feed Parser](https://github.com/OsmSharp/GTFS) - .Net/Mono implementation of a GTFS parser.

#### Go
- [Go GTFS Parser](https://github.com/geops/gtfsparser) - A GTFS parsing library for Go.

#### Java
- [OneBusAway GTFS Modules](https://github.com/OneBusAway/onebusaway-gtfs-modules/wiki) - A Java-based library for reading, writing, and transforming public transit data in the GTFS format, including database support.

#### JavaScript
- [gtfs-sequelize](https://github.com/evansiroky/gtfs-sequelize) - Node.js library modeling the static GTFS using sequelize.js.
- [gtfs-utils](https://github.com/public-transport/gtfs-utils) – Utilities to process GTFS data sets (e.g., "flattening" `calendar.txt` & `calendar_dates.txt`, computing arrival/departure times of trips).
- [gtfs-via-postgres](https://github.com/derhuerst/gtfs-via-postgres) – Yet another tool to process GTFS using PostgreSQL.
- [Node-GTFS](https://github.com/BlinkTagInc/node-gtfs) - Loads transit data from GTFS files, unzips it and stores it to a SQLite database. Provides some methods to query for agencies, routes, stops and times.

#### PostgreSQL
- [gtfs-schema](https://github.com/tyleragreen/gtfs-schema) - PostgreSQL schema for GTFS feeds.
- [gtfs-via-postgres](https://github.com/derhuerst/gtfs-via-postgres) – Yet another tool to process GTFS using PostgreSQL.

#### Python
- [ESRI public-transit-tools](https://github.com/Esri/public-transit-tools) - Tools for working with public transit data in ArcGIS (license for ArcGIS required).
- [gtfsdb](https://github.com/OpenTransitTools/gtfsdb) - Python library for converting GTFS files into a relational database.
- [gtfs_functions](https://github.com/Bondify/gtfs_functions) - Python package with useful functions to create geo-spatial visualizations from GTFS feeds.
- [gtfs-segments](https://github.com/UTEL-UIUC/gtfs_segments) - Python package that represents GTFS data for buses in a concise tabular manner using segments.
- [gtfslib-python](https://github.com/afimb/gtfslib-python) -  An open source library in python for reading GTFS files and computing various stats and indicators about Public Transport networks.
- [gtfsman](https://github.com/geops/gtfsman) - Repository-like tool in Python to manage and update a huge number of GTFS feeds.
- [gtfspy](https://github.com/CxAalto/gtfspy) - Public transport network analysis and travel time computations using Python3. Compatible with Postgres/PostGIS, Oracle, MySQL, and SQLite. Used by [gtfspy-webviz](https://github.com/CxAalto/gtfspy-webviz).
- [GTFS Kit](https://github.com/mrcagney/gtfs_kit) - A Python 3.8+ tool kit for analyzing General Transit Feed Specification (GTFS) data. Supersedes GTFSTK.
- [Make GTFS](https://github.com/mrcagney/make_gtfs) - A Python library to make GTFS feeds from basic route information.
- [Mapzen GTFS](https://github.com/transitland/mapzen-gtfs) - A Python GTFS library that supports reading individual GTFS tables, or constructing a graph to represent each agency in a feed.
- [multigtfs](https://github.com/tulsawebdevs/django-multi-gtfs) - A Django application to import and export GTFS.
- [partridge](https://github.com/remix/partridge) - A fast, forgiving Python GTFS reader built on pandas DataFrames.
- [transit_service_analyst](https://github.com/psrc/transit_service_analyst) - A Python library to support transit service analysis.
- [TransitGPT](https://github.com/UTEL-UIUC/TransitGPT) - TransitGPT is a Generative AI-powered chatbot that enables transit enthusiasts to access and analyze General Transit Feed Specification (GTFS) data through natural language instructions.

#### R
- [r-transit](https://github.com/r-transit) - Collection of tools for GTFS in R.
- [gtfsio](https://github.com/r-transit/gtfsio) - Fast and flexible functions to read and write GTFS in R.
- [tidytransit](https://github.com/r-transit/tidytransit) - Use tidytransit to map transit stops and routes, calculate travel times and transit frequencies, and validate transit feeds. tidytransit reads the General Transit Feed Specification into tidyverse and simple features data frames.

#### Ruby
- [GTFS-viz](https://github.com/vasile/GTFS-viz) - Ruby script that converts a set of GTFS files into a SQLite database + GeoJSONs (needed by the [Transit Map](https://github.com/vasile/transit-map) web application)

#### Rust
- [gtfs-structure](https://github.com/rust-transit/gtfs-structure) - This crates provides GTFS structures and helpers to read GTFS archives.

### GTFS Converters

Converters from various static schedule formats to and from GTFS.

- [Chouette](https://enroute.atlassian.net/wiki/spaces/PUBLIC/pages/539426886/Chouette+Convert) - Converts between French-Transmodel [NeTEX](https://transmodel-cen.eu/index.php/netex/) and GTFS.
- [extract-gtfs-pathways](https://github.com/derhuerst/extract-gtfs-pathways) – Command-line tool to extract pathways as GeoJSON from a GTFS dataset.
- [extract-gtfs-shapes](https://github.com/derhuerst/extract-gtfs-shapes) – Command-line tool to extract shapes as GeoJSON from a GTFS dataset.
- [GTFS-OSM-Sync](https://github.com/CUTR-at-USF/gtfs-osm-sync) - A Java tool for synchronizing data in GTFS format with [OpenStreetMap.org](http://www.openstreetmap.org/).
- [gtfs-parser](https://github.com/ioTransit/gtfs-parser) - The GTFS-PARSER library is a library to allow javascript to parse gtfs and create geojson on client or server.
- [gtfs-service-area](https://github.com/cal-itp/gtfs-service-area) - Compute a transit service area from static GTFS. Results are output as single-layer .geojson files. Dockerized version of [gtfs-to-geojson](https://github.com/BlinkTagInc/gtfs-to-geojson).
- [GTFS-route-shapes](https://github.com/kotrc/GTFS-route-shapes) - A Python script to generate a single geoJSON shape for each transit route in a GTFS archive.
- [gtfs-to-geojson](https://github.com/BlinkTagInc/gtfs-to-geojson) - Javascript tool that converts transit data in GTFS shapes and stops into geoJSON. This is useful for creating maps of transit routes.
- [gtfs2gps](https://github.com/ipeaGIT/gtfs2gps) - An R package that converts public transportation data in GTFS format to GPS-like records in a `data.table`, where each row represents the timestamp of each vehicle at a given spatial resolution.
- [gtfs2emis](https://github.com/ipeaGIT/gtfs2emis) - An R package to estimate the emission levels of public transport vehicles based on General Transit Feed Specification (GTFS) data.
- [gtsf](https://github.com/r-gtfs/gtsf) - general transit (GTFS) simple (geographic) features (sf) in R. can be used to convert from GTFS to Shapefile, GeoJSON, and other formats through GDAL.
- [hafas-generate-gtfs](https://github.com/derhuerst/hafas-generate-gtfs) *(work-in-progress)* – A Javascript tool to generate GTFS dumps from HAFAS endpoints.
- [Hafas2GTFS](https://github.com/geops/hafas2gtfs) - Hafas2GTFS converter written in Python, optimized for SBB HAFAS feeds.
- [kml-to-gtfs-shapes](https://github.com/bdferris/kml-to-gtfs-shapes/tree/gh-pages) - Javascript tool to convert polylines from a KML file into a GTFS shapes.txt file. Hosted on GitHub [here](http://bdferris.github.io/kml-to-gtfs-shapes/).
- [NeTEx-to-GTFS Converter Java](https://github.com/entur/netex-gtfs-converter-java) - Converts NeTEX datasets into GTFS datasets. The input NeTEx datasets are required to follow the Nordic NeTEx Profile.
- [o2g](https://github.com/hiposfer/o2g) - A simple tool to extract GTFS feed from OpenStreetMap.
- [Open-Transport SYNTHESE Convertors](https://github.com/Open-Transport/synthese/wiki) - Converts French-Transmodel, SIRI, NETeX, HAFAS, HASTUS, VDV452, and more.
- [onebusaway-gtfs-to-barefoot](https://github.com/OneBusAway/onebusaway-gtfs-to-barefoot) - A Java tool to create a [Barefoot](https://github.com/bmwcarit/barefoot) mapfile from a GTFS file.
- [onebusaway-vdv-modules](https://github.com/OneBusAway/onebusaway-vdv-modules) - A Java library for working with transit data in the VDV format, including converting VDV-452 schedule data into GTFS.
- [osm2gtfs](https://github.com/grote/osm2gtfs) - Turn OpenStreetMap data and schedule information into GTFS.
- [transit_model](https://github.com/hove-io/transit_model) - A Rust library to convert to/from the following formats: GTFS, NTFS (for Navitia, see [Software for Creating APIs](#software-for-creating-apis)), TransXChange (UK specification), KV1 (NL specification), NeTEx (EU specification).
- [transloc-gtfs-rectifier](https://github.com/laidig/transloc-gtfs-rectifier) - Python application that attempts to assign GTFS stop_ids to [TransLoc](http://transloc.com/) IDs using [TransLoc's API](https://market.mashape.com/transloc/openapi-1-2) ([TransLoc](http://transloc.com/) doesn't provide GTFS `stop_ids` in their API).
- [Transmodel and IFF to GTFS](https://github.com/bliksemlabs/bliksemintegration) - Imports and syncs (Transmodel) BISON Koppelvlak1, IFF (a format written by HP/EDS, somewhat similiar to ATCO CIF) to import timetables of the railway networks. The internal pseudo-NETeX datastructure allows to export to GTFS and there are proof-of-concepts to export to other formats such as NETeX, GTFS and IFF.
- [Transporter-Project transxchange-to-gtfs](https://github.com/Transporter-Project/transxchange-to-gtfs) TransXChange to GTFS converter written in Objective-C.
- [TXC TransXChange publisher (UK Department for Transport)](https://www.gov.uk/government/publications/transxchange-publisher) - The TXC TransXChange publisher is a standalone software tool that can be used to publish TransXChange compliant XML documents in a format that’s easy to read and print.
- [UK2GTFS](https://itsleeds.github.io/UK2GTFS/) - R package that converts UK format TransXchange (bus, metro, tram, ferry) and CIF (rail) timetables to GTFS.

### GTFS Data Collection and Maintenance Tools

- [AddTransit](https://addtransit.com/gtfs-transit-file.php) - SaaS (Software as a Service) platform to create, edit and publish schedules in GTFS format.
- [bus-router](https://github.com/atlregional/bus-router) - Python script that generates missing shapes.txt for GTFS using routing from [Google Maps Directions API](https://developers.google.com/maps/documentation/directions/) or [OSRM](https://github.com/Project-OSRM/osrm-backend/wiki/Server-api).
- [gtfs-blocks-to-transfers](https://github.com/TransitApp/GTFS-blocks-to-transfers) - A Python tool to convert GTFS blocks, defined by setting [trip.block\_id](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#example-blocks-and-service-day) into a series of [trip-to-trip transfers (proposal)](https://github.com/google/transit/pull/303).
- [GTFS Diff](https://transport.data.gouv.fr/tools/gtfs_diff) - GTFS Diff is a specification created by transport.data.gouv.fr and aims at providing a simple and unified way to express differences between GTFS files.
- [GTFS Editor](https://github.com/conveyal/gtfs-editor) - A (self-hosted) web-based GTFS editing framework. (Note: this project has been deprecated in favor of [IBI Data Tools](https://github.com/ibi-group/datatools-ui).)
- [GTFS Editor for Vagrant](https://github.com/laidig/vagrant-gtfs-editor) - Quickly set up the GTFS editor (above) using [Vagrant](https://www.vagrantup.com/)
- [static-GTFS-manager](https://github.com/WRI-Cities/static-GTFS-manager) - A (self-hosted) browser-based user interface for creating, editing, exporting static GTFS (see [related post](https://groups.google.com/forum/#!topic/transit-developers/GFz5rTJTB0I)). 
- [TransitWand](https://github.com/conveyal/transit-wand) - An open source web and mobile application for collecting transit data. Use it to create GTFS feeds, capture passenger counts or generate GIS datasets.
- [IBI Data Tools](https://github.com/ibi-group/datatools-ui) - A web application that handles GTFS editing, validating, quality checking, and deploying to OpenTripPlanner. (Combines and builds upon the functionality of the deprecated [Gtfs Data Manager](https://github.com/conveyal/gtfs-data-manager) and [GTFS Editor](https://github.com/conveyal/gtfs-editor).)
- [IBI Data Tools Infra](https://github.com/cal-itp/ibi-datatools-infra) - A tool to quickly setup and run a local instance of the above IBI Data Tools project.  
- [GTFS.html](https://gtfs.pleasantprogrammer.com) - An entirely browser-based tool to view GTFS feeds. Use it to view routes, stops, timetables, etc.
- [pfaedle](https://github.com/ad-freiburg/pfaedle) - Precise map-matching for GTFS using OpenStreetMap data
- [GTFS shape mapfit](https://github.com/HSLdevcom/gtfs_shape_mapfit) - Python tool that fits GTFS shape files and stops to a given OSM map file. Uses [pymapmatch](https://github.com/tru-hy/pymapmatch) for the matching.
- [GTFS Builder](http://nationalrtap.org/Web-Apps/GTFS-Builder) - A free web-based application to help you create GTFS files. Maintained by the National Rural Transit Assistance Program (RTAP).
- [gtfs-station-builder](https://github.com/kostjerry/gtfs-station-builder) - UI tool to help build the internal structure of stations (including pathways.txt)
- [GTFS Text-to-Speech Tester](https://github.com/BlinkTagInc/node-gtfs-tts) - A command-line tool that reads GTFS stop names out loud using Text-to-Speech to determine which need Text-to-Speech values for tts_stop_name in stops.txt.
- [Spare GTFS-Flex Builder](https://sparelabs.com/en/spare-gtfs-flex-builder) - A free tool that helps transit agencies easily create, manage, and export their transportation data in GTFS-Flex format. 
- [Swiftly](https://goswift.ly/) - Tool generate realtime transit data.
- [Chouette SaaS](https://bitbucket.org/enroute-mobi/chouette-core) - Tool to generate GTFS Schedule data
- [Ara SaaS](https://bitbucket.org/enroute-mobi/ara) - Tool to generate GTFS Realtime data.
- [Amarillo](https://github.com/mfdz/amarillo) - Aggregates and enhances carpooling-offers and publishes them as GTFS(-RT)

### GTFS Merge Tools
- [combine_gtfs_feeds](https://github.com/psrc/combine_gtfs_feeds) - A Python tool to combine multiple gtfs feeds into one feed/dataset.
- [GTFS Kit](https://github.com/mrcagney/gtfs_kit) - A Python 3.8+ tool kit for analyzing and merging General Transit Feed Specification (GTFS) data. [Info on how to aggregate and clean feeds provided here](https://mrcagney.github.io/gtfs_kit_docs/index.html#module-gtfs_kit.cleaners).
- [Transitfeed merge function](https://github.com/google/transitfeed/wiki/Merge) - A Python library with a function to merge two different GTFS feeds.
- [gtfsmerge](https://github.com/now8-org/gtfsmerge) - A Python Script to merge GTFS ZIP archives into one.

### GTFS Analysis Tools

- [GTFS Kit](https://github.com/mrcagney/gtfs_kit) - A Python 3.6+ tool kit for analyzing General Transit Feed Specification (GTFS) data. Supersedes [GTFSTK](https://github.com/araichev/gtfstk).
- [gtfstools](https://github.com/ipeaGIT/gtfstools) - A set of convenient tools for editing and analysing transit feeds in GTFS format in R.
- [transit_service_analyst](https://github.com/psrc/transit_service_analyst) - A Python library to support transit service analysis.
- [Peartree](https://github.com/kuanb/peartree) - A Python library for converting transit data into a directed graph for network analysis.
- [R5: Rapid Realistic Routing on Real-world and Reimagined networks](https://github.com/conveyal/r5) - A Java-based routing engine developed by Conveyal for multimodal (transit/bike/walk/car) networks. It currently plans many trips over a time window for scenario planning and analytics purposes. A related R wrapper package ([r5r](https://github.com/ipeaGIT/r5r/)) is developed independently by IPEA. See also the performance comparison from Higgins et al. (2022), linked below.
- [tidytransit](https://github.com/r-transit/tidytransit) - An R package to read GTFS data into tibbles and simple features dataframes to map transit stops and routes, calculate travel times and transit frequencies, and validate transit feeds.
- [transitr](https://github.com/tmelliott/transitr) - An R package for constructing and modelling a transit network in real time to obtain vehicle ETAs
- [transit-intensity](https://github.com/ioTransit/transit-intensity) - A simple project for measuring transit intensity written in Go.
- [Busbuzzard](https://github.com/bmander/busbuzzard) - Inference of probabilistic schedules from empirical data about transit vehicles.
- [ESRI ArcGIS Public Transit Tools (GTFS)](https://github.com/Esri/public-transit-tools) - Tools for working with public transit data in ArcGIS
- [GTFS-to-Chart](https://github.com/BlinkTagInc/gtfs-to-chart) - Creates stringline charts showing all vehicles on a transit route from GTFS data.
- [GTFS Display](https://codeberg.org/dancingCycle/gtfs-display) - Analyse, monitor and maintain GTFS data ([Example instances](https://www.swingbe.de/activity/gtfs-display/)).
- [PTNA](https://wiki.openstreetmap.org/wiki/Public_Transport_Network_Analysis) - Public Transit Nework Analysis is a open source system for finding and aggregating information about public transportation lines mapped in OSM.

### GTFS Timetable Publishing Tools

- [GTFS-to-HTML](https://gtfstohtml.com) - Generate human-readable timetables in HTML or PDF format directly from GTFS.
- [Timetable Kit](https://github.com/neroden/timetable_kit) - An open source Python 3.10 module and scripts depending on [GTFS Kit](https://github.com/mrcagney/gtfs_kit), designed to create complex printed/PDF timetables with flexible layouts. Currently only working out of the box for Amtrak's GTFS, but under active development. 
- [TimeTablePublisher (TTPUB)](https://github.com/OpenTransitTools/ttpub) - A web publishing system developed by TriMet that allows a transit agency to examine, modify, and transform raw scheduling data into easy-to-read timetables for customer information purposes

### GTFS Validators

- [Conveyal's gtfs-validator](https://github.com/conveyal/gtfs-validator) - A Java-based GTFS validator based on the OneBusAway GTFS Modules, runs in Java and is faster than the Google provided one.
- [Conveyal's gtfs-lib](https://github.com/conveyal/gtfs-lib/) - Conveyal's successor to their own [gtfs-validator](https://github.com/conveyal/gtfs-validator), a Java-based library for loading and saving GTFS feeds of arbitrary size with disk-backed storage.
- [Google's feedValidator](https://github.com/google/transitfeed/wiki/FeedValidator) - Google-supported Python-based GTFS validator.
- [GTFS Data Package Specification](https://github.com/Stephen-Gates/GTFS) - A Data Package specification with validation accomplished with Good Tables. Includes a data package, schemas, tests, and uses South East Queensland GTFS data as an example.
- [gtfstidy](https://github.com/patrickbr/gtfstidy) - A Go-based tool to tidy and validate GTFS feeds.
- [gtfsclean](https://github.com/public-transport/gtfsclean) - A tool for checking, sanitizing, and minimizing GTFS feeds. Fork of gtfstidy, with some additional fixes that haven't been merged upstream yet.
- [gtfs-validator-api](https://github.com/cal-itp/gtfs-validator-api) - This Python package is a thin wrapper around [MobilityData/gtfs-validator](https://github.com/MobilityData/gtfs-validator) that handles intermediate files produced and finds gtfs-validator's output file so it can be given a specific name or returned as a string.
- [GTFSVTOR](https://github.com/mecatran/gtfsvtor) - An open-source GTFS validator implemented in Java licensed under GPLv3 maintained by [Mecatran](https://www.mecatran.com/).
- [MobilityData's gtfs-validator](https://github.com/MobilityData/gtfs-validator) - A open-source GTFS validator canonically following the GTFS spec implemented in Java licensed under Apache v2.0 maintained by [MobilityData](https://mobilitydata.org/).
- [Reflect GTFS Validator (hosted by Foursquare ITP)](https://reflect.foursquareitp.com) - Transit schedule and GTFS validation platform by [Foursquare ITP](https://www.foursquareitp.com) that includes a free, web-based GTFS validator based on [gtfs-lib](https://github.com/conveyal/gtfs-lib/).
- [Transit App's gtfs-fares-v2-validator](https://github.com/TransitApp/gtfs-fares-v2-validator) - A Python tool that validators GTFS-Fares-v2 data based on the [draft specification](https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#).
- [Transport Validator](https://github.com/etalab/transport-validator/) - An open-source validator implemented in [Rust](https://www.rust-lang.org/). Used by the [French National Access Point](https://transport.data.gouv.fr/validation/).
- [gtfs-accessiblity-validator](https://github.com/BlinkTagInc/gtfs-accessibility-validator) - Validates the presence of accessiblity-related fields and files in a GTFS file. Can be a command line tool or node.js package.


## GTFS Realtime

- [GTFS-realtime documentation](https://github.com/google/transit/tree/master/gtfs-realtime).
- [GTFS-realtime Autodoc](https://laidig.github.io/gtfs-rt-autodoc/index.html) - Automatically generated documentation for GTFS-realtime, generated from the official [GTFS-realtime protocol buffer specification](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) and including some extensions.

### GTFS Realtime Libraries & Demo Apps

- [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) - The official bindings for Java, .NET, Node.js, Python, and Ruby generated from the official [GTFS-realtime protocol buffer specification](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto).
- [gtfs-rt](https://crates.io/crates/gtfs-rt) - Rust crate to read, write, and manipulate GTFS-Realtime data
- [GTFS-realtime Exporter](https://github.com/OneBusAway/onebusaway-gtfs-realtime-exporter/wiki) - A Java-based tool that assists in producing and sharing a GTFS-relatime feed.
- [GTFS-realtime Alerts Producer Demo](https://github.com/OneBusAway/onebusaway-gtfs-realtime-alerts-producer-demo/wiki) - A Java-based demo project for producing GTFS-realtime Service Alerts.
- [GTFS-realtime Alerts Producer Web Application](https://github.com/OneBusAway/onebusaway-service-alerts) - A Java-based web application for producing GTFS-realtime Service Alerts.
- [GTFS-realtime TripUpdates & VehiclePositions Producer Demo](https://github.com/OneBusAway/onebusaway-gtfs-realtime-trip-updates-producer-demo/wiki) - A Java-based demo project for producing GTFS-realtime TripUpdates (estimated arrivals) and Vehicle Positions.
- [GTFS-realtime Vehicle Positions Consumer/Visualizer Demo](https://github.com/OneBusAway/onebusaway-gtfs-realtime-visualizer) - A Java-based demo project for consuming a GTFS-realtime Vehicle Positions feed and displaying this info on a map.

### GTFS Realtime Validators

- [gtfs-realtime-validator](https://github.com/MobilityData/gtfs-realtime-validator) - A GTFS Realtime validation tool originally developed by the [Center for Urban Transportation Research](https://www.cutr.usf.edu/) at the University of South Florida and now maintained by [MobilityData](https://mobilitydata.org/).

### GTFS Realtime (and Other Real-time API) Archival Tools

- [GTFS-realtime to SQL](https://github.com/OpenMobilityData/GtfsRealTimeToSql) - Parses a GTFS-RealTime feed into an SQL database (used in [OpenMobilityData.org](https://openmobilitydata.org))
- [gtfsrdb](https://github.com/CUTR-at-USF/gtfsrdb) - A Python tool that supports reading and archiving GTFS-realtime feeds into a database
- [retro-gtfs](https://github.com/SAUSy-Lab/retro-gtfs) - A Python application that collects real-time data from the Nextbus API and archives it into the GTFS format (i.e., retrospective GTFS).
- [Transi](https://gitlab.com/cutr-at-usf/transi) - A Cloud-native GTFS-RT/GTFS archiving system.
- [GTFS-Realtime-Capsule](https://github.com/tsdataclinic/gtfs-realtime-capsule) - A command-line tool that scrapes, normalizes, and archives real-time public transit data.
- [gtfsdb_realtime](https://github.com/OpenTransitTools/gtfsdb_realtime) - Real-time GTFS database loader and ORM library

### GTFS Realtime Convertors

- [SIRI to GTFS-realtime](https://github.com/OneBusAway/onebusaway-gtfs-realtime-from-siri-cli) - A Java-based command-line utility to convert from the [SIRI format](https://www.siri.org.uk/) to GTFS-realtime
- [OrbCAD SQL Server to GTFS-realtime](https://github.com/CUTR-at-USF/HART-GTFS-realtimeGenerator/) - A Java-based command-line utility that extracts vehicle positions and trip updates information from an OrbCAD SQL Server and exports them to the GTFS-realtime TripUpdates and VehiclePositions formats.
- [NextBus API to GTFS-realtime](https://github.com/OneBusAway/onebusaway-gtfs-realtime-from-nextbus-cli/wiki) - A Java-based command-line utility to convert from the [NextBus API format](http://www.nextbus.com/xmlFeedDocs/NextBusXMLFeed.pdf) to GTFS-realtime.  Note that NextBus now directly offers a GTFS-realtime API for their products.  See [Cubic site](http://nextbus.cubic.com/Products/Real-Time-Rider-Information) and [this FAQ](https://medium.com/omnimodal/want-more-riders-open-up-your-nextbus-api-with-gtfs-realtime-7387c80f31e1#.pkuzizhl5).
- [Syncromatics API to GTFS-realtime](https://github.com/CUTR-at-USF/bullrunner-gtfs-realtime-generator) - A Java-based command-line utility to convert from the [Syncromatics API](http://www.syncromatics.com/) format to GTFS-realtime TripUpdates and VehiclePositons.
- [KV6,15,17, and ARNU to GTFS-realtime](https://github.com/bliksemlabs/bliksemintegration-realtime) - Java-based tool to process incoming KV6,15,17 and ARNU and match them to static transit data present in a RID integration database. It then proceeds to export this data as ARNU RITinfo, GTFS(realtime) and KV78turbo
- [WMATA BusPositions API to GTFS-realtime](https://github.com/kurtraschke/wmata-gtfsrealtime) - Java-based tool to convert from WMATA's [BusPositions API](https://developer.wmata.com/docs/services/54763629281d83086473f231/operations/5476362a281d830c946a3d68) and Alert RSS feeds from [MetroAlerts](http://www.wmata.com/rider_tools/metro_service_status/rail_bus.cfm?) to GTFS-realtime TripUpdates, VehiclePositions, and Alerts feeds.
- [SEPTA API to GTFS-realtime](https://github.com/kurtraschke/septa-gtfsrealtime) - Java-based tool to convert [SEPTA's](http://www.septa.org/) [real-time bus and rail data](http://www3.septa.org/hackathon/) to GTFS-realtime
- [CTA API to GTFS-realtime](https://github.com/kurtraschke/ctatt-gtfsrealtime) - Java-based tool to convert [CTA's](http://www.transitchicago.com/) [Train Tracker data](http://www.transitchicago.com/developers/traintracker.aspx) to GTFS-realtime.
- [Detroit DOT to GTFS-realtime](https://github.com/prashtx/ddot-avl) - Extract real-time info from [DDOT's](http://www.detroitmi.gov/How-Do-I/Locate-Transportation/Bus-Schedules) TransitMaster installation (database) and convert to GTFS-realtime
- [Live Transit Event Trigger](https://github.com/ipublic/live_transit_event_trigger) - Extracts data from [Ride On's](http://www.montgomerycountymd.gov/dot-transit/) OrbCAD database and export as GTFS-realtime.
- [SoundTransit to GTFS-realtime](https://github.com/bdferris/onebusaway-sound-transit-realtime) - Convert text file feed from [Sound Transit](http://www.soundtransit.org/) to GTFS-realtime
- [Civic Transit](https://github.com/jestin/CivicTransit) - Screen-scrapes [KCATA’s](http://www.kcata.org/) TransitMaster WebWatch installation to produce a GTFS-realtime feed.
- [GTFS-realtime VehiclePositions to GTFS-realtime TripUpdates (TransitClock)](https://thetransitclock.github.io/) - Java application that can consume raw vehicle positions and generate prediction times in formats such as GTFS-realtime.  Formerly known as "Transitime".
- [gtfs-realtime-translators](https://github.com/Intersection/gtfs-realtime-translators) - A Python-based tool to translate custom arrival API formats to GTFS-realtime.  As of July 2019 it supports LA Metro and SEPTA.
- [Transloc API to GTFS-realtime](https://github.com/jonathonwpowell/transloc-to-gtfs-real-time) - A Node.js based tool to convert the Transloc API to GTFS-realtime.
- [hafas-gtfs-rt-feed](https://github.com/derhuerst/hafas-gtfs-rt-feed) – A Javascript tool to generate a GTFS Realtime feed from a HAFAS endpoint.
- [GTFS-realtime to SIRI-Lite](https://github.com/etalab/transpo-rt/) - A [Rust](https://www.rust-lang.org/) webserver to convert multiple GTFS-RT feeds to a SIRI-Lite API.

### GTFS Realtime Utilities

- [bus_kalman](https://github.com/cmoscardi/bus_kalman) - A Kalman Filter used to interpolate bus travel times using NYC MTA real-time data.
- [Concentrate](https://github.com/mbta/concentrate) - Combines realtime transit information from multiple sources into single output files. Maintained by [
Massachusetts Bay Transportation Authority (MBTA)](https://github.com/mbta).
- [gtfs-realtime-test-service](https://github.com/CUTR-at-USF/gtfs-realtime-test-service) - A tool for mocking GTFS-realtime feed content (e.g., for use in testing a GTFS-realtime consuming application).
- [GTFS-realtime Munin Plugin](https://github.com/OneBusAway/onebusaway-gtfs-realtime-munin-plugin) - Provides a [Munin](http://munin-monitoring.org/) plugin for logging information about a GTFS-realtime feed.
- [GTFS-realtime Nagio Plugin](https://github.com/OneBusAway/onebusaway-gtfs-realtime-nagios-plugin) - Provides a [Nagios](https://www.nagios.org/) plugin for monitoring a GTFS-realtime feed
- [GTFS-realtime Printer](https://github.com/laidig/gtfs-rt-printer) - Java-based utility to print out information from a GTFS-realtime file or URL.
- [gtfs-rt-admin](https://github.com/conveyal/gtfs-rt-admin) - An admin tool for managing GTFS-RT service alerts (JavaScript and Java).
- [gtfs-rt-differential-to-full-dataset](https://github.com/derhuerst/gtfs-rt-differential-to-full-dataset) – Javascript tool to transform a continuous GTFS Realtime stream of `DIFFERENTIAL` incrementality data into a `FULL_DATASET` dump.
- [gtfs-rt-dump](https://github.com/kurtraschke/gtfs-rt-dump) - Converts protocol buffer format to plain text for easy viewing of a GTFS-realtime feed in plain text (for debugging purposes)
- [gtfs-rt-inspector](https://public-transport.github.io/gtfs-rt-inspector/) – Web app to inspect & analyze any (CORS-enabled) GTFS Realtime feed. Open-source on [GitHub](https://github.com/public-transport/gtfs-rt-inspector).
- [GTFS Data Pipeline for TfNSW Bus Datasets](https://github.com/teckkean/GTFS-Data-Pipeline-TfNSW-Bus) - A data pipeline developed for the TfNSW's GTFS Static and Realtime datasets. The datasets generated using the pipeline have been used to validate the performance of TfNSW's Transit Signal Priority Request via Public Transport Information and Priority System (PTIPS).
- [manual-gtfsrt](https://github.com/pailakka/manual-gtfsrt) - A Go-based tool that serves a GTFS-RT feed created from editable JSON.
- [print-gtfs-rt-cli](https://github.com/derhuerst/print-gtfs-rt-cli) – Javascript tool to read a GTFS Realtime feed from stdin, print human-readable or as JSON.
- [transitcast](https://github.com/OpenTransitTools/transitcast) - Uses GTFS and GTFS-RT vehicle position feed generating an estimated transition time it takes for each vehicle to move from scheduled stop to scheduled stop recording these an "observed_stop_time" table. These records can later be used to train a machine learning model to make vehicle travel predictions. Created by TriMet as part of [an FTA IMI project](https://trimet.org/imi/program.htm).
- [transit-feed-quality-calculator](https://github.com/CUTR-at-USF/transit-feed-quality-calculator) - A Java project that uses the [gtfs-realtime-validator](https://github.com/CUTR-at-USF/gtfs-realtime-validator) to assess the quality of a large number of transit feeds, fetching the feed URLs from a global directory ([TransitFeeds.com/OpenMobilityData.org](https://openmobilitydata.org/)).
- [Transit Network Model](https://github.com/tmelliott/TransitNetworkModel) - A tool to generate predictions using GTFS-realtime VehiclePositions, a particle filter, and a Kalman Filter. 
- [GTFS Realtime Display](https://codeberg.org/dancingCycle/gtfs-rt-display) - Analyse, monitor and maintain GTFS Realtime data. [Example instances](https://www.swingbe.de/activity/gtfs-rt-display/)
- [GTFS Realtime Prediction Accuracy metrics](https://docs.google.com/document/d/1-AOtPaEViMcY6B5uTAYj7oVkwry3LfAQJg3ihSRTVoU/edit#heading=h.j27shba7rlk6) - Useful Performance Metrics for GTFS-Realtime.

## SIRI

- [SIRI API](https://github.com/OneBusAway/onebusaway/wiki/SIRI-Resources) - Java classes generated from the v1.0 and v1.3 [SIRI](https://www.siri.org.uk/) schemas.
- [SIRI 2.0 API](https://github.com/laidig/siri-20-java) - Java classes generated from the v2.0 [SIRI](https://www.siri.org.uk/) schemas.
- [SIRI to GTFS-realtime](https://github.com/OneBusAway/onebusaway-gtfs-realtime-from-siri-cli/wiki) - A Java-based command-line utility to convert from the [SIRI format](https://www.siri.org.uk/) to GTFS-realtime.
- [SIRI 2.0 Autodoc](https://laidig.github.io/siri-20-java/doc/) - Automatically generated documentation from the (incredibly well) annotated SIRI 2.0 Schema Definition.
- [King County Metro Legacy AVL to SIRI](https://github.com/bdferris/onebusaway-king-county-metro/tree/master/onebusaway-king-county-metro-legacy-avl-to-siri) - Java-based tool to convert [King County Metro's](http://metro.kingcounty.gov/) Legacy AVL format to SIRI.
- [SIRI REST Client](https://github.com/CUTR-at-USF/SiriRestClient/wiki) - An open-source Android library for interacting with the RESTful SIRI interface for real-time transit data, such as that currently being used by the [MTA Bus Time API](http://bustime.mta.info/wiki/Developers/SIRIIntro).
- [SIRI 1.3 POJOs (Android-compatible)](https://github.com/CUTR-at-USF/onebusaway-siri-api-v13-pojos/wiki) - Android-compatible Plain Old Java Objects (POJOSs) used for data binding (deserliazing XML/JSON) responses for SIRI v1.3 APIs.  Used by the [SIRI REST Client](https://github.com/CUTR-at-USF/SiriRestClient/wiki).
- [pysiri2validator](https://github.com/laidig/pysiri2validator) - Simple validator for SIRI 2.0 written in Python 3.
- [Edwig](https://github.com/af83/edwig) - A golang server for real-time public transport data exchange, using the SIRI protocol.
- [BISON](https://bison.dova.nu/standaarden/nederlands-siri-profiel) - Netherlands implementation of SIRI.

## Other multimodal data formats

### Widely adopted
- [APDS](https://www.allianceforparkingdatastandards.org/) - Alliance for Parking Data Standards: formed by the [International Parking Institute (IPI)](https://www.parking.org/), the [British Parking Association (BPA)](http://www.britishparking.co.uk/), and the [European Parking Association (EPA)](http://www.europeanparking.eu/). APDS is a not-for-profit organization with the mission to develop, promote, manage, and maintain a uniform global standard that will allow organizations to share parking data across platforms worldwide.
- [DATEX](https://datex2.eu/) - EU data standard for road traffic and travel information.
- [GBFS](https://gbfs.org/) - General Bikeshare Feed Specification: open data standard for real-time information about bikeshare, scootershare, mopedshare, and carshare.
    - [gbfs R package](https://github.com/simonpcouch/gbfs) - Functions to interface with GBFS feeds in R, allowing users to save and accumulate tidy .rds datasets for specified cities/bikeshare programs.
- [MDS](https://github.com/openmobilityfoundation/mobility-data-specification) - Mobility Data Specification: A format to implement realtime data sharing, measurement and regulation for municipalities and mobility as a service providers. It is meant to ensure that governments have the ability to enforce, evaluate and manage providers. Maintained by the [Open Mobility Foundation](https://www.openmobilityfoundation.org/).
- [NeTex](http://netex-cen.eu/) - A general purpose XML format designed for the exchange of complex static transport data among distributed systems managed by the [CEN standards process](https://www.cencenelec.eu/european-standardization/european-standards/).
- [TODS](https://ods.calitp.org/) - Transit Operational Data Standard: standard format for representing transit schedules used by drivers, dispatchers, and planners to carry out transit operations. 
- [TOMP](https://github.com/TOMP-WG/TOMP-API) - Transport Operator Mobility-as-a-service Provider API: API standard for use by transport operators and mobility-as-a-service providers for operator discovery, trip planning, end user interaction, booking, and payment.

### Pilot or development stage
- [CurbLR](https://github.com/curblr/curblr-spec) - A specification for curb regulations.
- [Dyno-Demand](https://github.com/osplanning-data-standards/dyno-demand) - A GTFS-based travel demand data format focusing on individual passenger *demand* suitable for dynamic network modeling developed by San Francisco County Transportation Authority, LMZ LLC, and UrbanLabs LLC.
- [Dyno-Path](https://github.com/osplanning-data-standards/dyno-path) - (Under development - see [this post](https://github.com/osplanning-data-standards/GTFS-PLUS/pull/52#issuecomment-331231000)) Data for individual passenger *trajectories*.
- [GTFS-plus](https://github.com/osplanning-data-standards/GTFS-PLUS) - A GTFS-based transit network format for *vehicle and capacity data* suitable for dynamic transit modeling developed by Puget Sound Regional Council, UrbanLabs LLC, LMZ LLC, and San Francisco County Transportation Authority.
- [GTFS-ride](https://github.com/ODOT-PTS/GTFS-ride) - An open, fixed-route transit ridership data standard developed through a partnership between the Oregon Department of Transportation and Oregon State University.
- [GTFS-stat](https://github.com/osplanning-data-standards/GTFS-STAT) - An extension to a GTFS transit network with additional files that contain performance data developed by UrbanLabs LLC and San Francisco County Transportation Authority.
- [GMNS](https://github.com/zephyr-data-specs/GMNS) - General Modeling Network Specification: A format for sharing routable road network files designed to be used in multi-modal static and dynamic transportation planning and operations models. Volpe/FHWA partnership with Zephyr Foundation.
- [GTNS](https://zephyrtransport.org/trb17projects/7-general-travel-network-specification/) - General Travel Network Specification: A planned data specification for sharing travel demand model networks.
- [IXSI](https://github.com/RWTH-i5-IDSG/ixsi) -  interface for exchanging information between a travel information system and a sharing system (carshare, bikeshare).
- [MTLFS](https://github.com/vta/Managed-and-Tolled-Lanes-Feed-Specification) - Managed and Tolled Lanes Feed Specification: Proposal for a schema that comprise the Managed and Tolled Lanes Tolling Feed Specification (MTLFS) and defines the fields used in all of those files developed by [Santa Clara Valley Transportation Authority](http://www.vta.org/).
- [MaaS API](https://github.com/maasglobal/maas-tsp-api/blob/master/specs/Booking.md) - A set of open documents and test suite that defines a MaaS-compatible API.
- [NCHRP 08-119 Developing Data Standards and Guidance for Transportation Planning and Traffic Operations - Phase 1 (Anticipated)](http://apps.trb.org/cmsfeed/TRBNetProjectDisplay.asp?ProjectID=4543) - The objective of this research is to develop standards and/or guidance to be used and adopted by the transportation community in collecting, managing, and sharing static and real-time data for transportation planning and operations.
- [OMX: The Open Matrix data file format](https://github.com/osPlanning/omx) - A structured collection of two-dimensional array objects and associated metadata, for possible use in the transportation modeling industry.
- [OJP](https://github.com/VDVde/OJP) - Open Journey Planner.
- [OSDM](https://github.com/UnionInternationalCheminsdeFer/OSDM) - Open Sales and Distribution Model: Aims to substantially simplify the booking process for customers of rail trips and to lower complexity and distribution costs for distributors and railway carriers. Contains a specification of an offline model and on-line API. Maintained by the [International Union of Railways (UIC)](https://github.com/UnionInternationalCheminsdeFer).
- [SAE Shared and Digital Mobility Committee](http://articles.sae.org/15799/) - Appears to be working on a data standard for car share and transportation network companies (TNCs) / rideshare.
- [shared-row](https://github.com/d-wasserman/shared-row) - A specification for right-of-way (ROW) for a SharedStreets Reference.
- [TCRP G-16 Development of Transactional Data Specifications for Demand-Responsive Transportation (In progress)](http://apps.trb.org/cmsfeed/TRBNetProjectDisplay.asp?ProjectID=4120) - The objective of this research is to develop technical specifications for transactional data for entities involved in the provision of demand-responsive transportation.  Expected completion date is late 2018.
- [TIDES](https://github.com/TIDES-transit/TIDES) -  Transit ITS Data Exchange Specification (TIDES) is a proposed effort to create standard data structures, APIs, and data management tools for historical transit ITS data including AVL, APC and AFC Data.

## Software for Creating APIs

Software that you can set up to provide an API to transit and multimodal data.

- [GraphHopper Routing Engine](https://github.com/graphhopper/graphhopper/#public-transit) Open source routing engine for OpenStreetMap. Use it as Java library or server.
- [gtfs-server](https://github.com/denysvitali/gtfs-server) - A web server, written in Rust that uses PostGIS as a backend to serve GTFS data via a HTTP endpoint
- [hafas-rest-api](https://github.com/public-transport/hafas-rest-api) – Expose a [HAFAS](https://de.wikipedia.org/wiki/HAFAS) endpoint as a REST API.
- [Linked Connections](http://linkedconnections.org/) - An open-source, scalable intermodal route planning engine, which allows clients to execute the route planning algorithm (as opposed to the server). Uses GTFS data.
- [Mobroute](http://sr.ht/~mil/mobroute) - Mobroute is a general purpose FOSS public transportation router (e.g. trip planner) Go library and CLI that works by directly ingesting timetable (GTFS) data from transit agencies themselves (sourced from the [Mobility Database](https://database.mobilitydata.org/)). It can be used to quickly run & test routing requests based on GTFS data on your device (via its CLI) or it can be embedded as a library to add GTFS routing to existing navigation apps.
- [MOTIS](https://github.com/motis-project/motis) - Multi Objective Travel Information System, written in C++ and Java. Can consume schedule timetables in the GTFS or HAFAS format as well as real time information in the GTFS-RT (and RISML, a propriatary format at Deutsche Bahn) as input data. For pedestrian routing (handled by Per Pedes Routing) and car routing (handled by OSRM) OpenStreetMap data is used.
- [Navitia](https://github.com/hove-io/navitia) is the opensource engine behind the [Navitia.io](http://www.navitia.io/) live API.
- [OneBusAway](http://onebusaway.org/) - A Java app that consumes GTFS and GTFS-Realtime (along with [other formats](https://github.com/OneBusAway/onebusaway-application-modules/wiki/Real-Time-Data-Configuration-Guide)) and turns them into an easy to use REST API.
- [OpenTripPlanner](http://www.opentripplanner.org/) - An open source platform for multi-modal and multi-agency journey planning, as well as returning information about a multi-modal graph (using data sources such as GTFS and [OpenStreetMap](http://www.openstreetmap.org/)).
- [pyBikes](https://github.com/eskerda/pybikes) - Software powering [CityBikes](http://api.citybik.es) for worldwide bikeshare system info
- [Simple Transit Api](https://github.com/ioTransit/simple-transit-api) - A simple way to get started with a GTFS api in Golang.
- [TransitClock](https://thetransitclock.github.io/) - Java application that can consume raw vehicle positions and generate prediction times in formats such as GTFS-realtime.  Formerly known as "Transitime".
- [Transitous](https://transitous.org) - Community-run free and open public transport routing service.