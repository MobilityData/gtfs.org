<a class="pencil-link" href="https://github.com/CUTR-at-USF/awesome-transit/edit/master/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# GTFS

- [GTFS Spec](https://developers.google.com/transit/gtfs/) - Specification for the General Transit Data Feed, or GTFS. Also available in [Español](https://developers.google.com/transit/gtfs/?hl=es), [Français](https://developers.google.com/transit/gtfs/?hl=fr).
- [GTFS Best Practices](https://gtfs.org/best-practices/) - Best practices for producers of a GTFS feed.

## GTFS Libraries

Software that makes it easy to consume GTFS data in a variety of languages.

### C
- [CGTFS](https://github.com/rakhack/cgtfs) - C library for reading static GTFS feeds. Supports reading unpacked feeds into application memory or into SQLite databases.
- [RRRR Rapid Real-time Routing](https://github.com/bliksemlabs/rrrr) - RRRR (usually pronounced R4) is a C-language implementation of the RAPTOR public transit routing algorithm.

### C++
-  [just_gtfs](https://github.com/mapsme/just_gtfs) - C++17 header-only library for reading and writing GTFS (used in [MAPS.ME](https://github.com/mapsme/omim)). Main features: fast reading and writing of GTFS feeds, support for [extended GTFS route types](https://developers.google.com/transit/gtfs/reference/extended-route-types), simple working with GTFS Date and Time formats.

### C#
- [ESRI public-transit-tools](https://github.com/Esri/public-transit-tools) - Tools for working with public transit data in ArcGIS (license for ArcGIS required).
- [GTFS Feed Parser](https://github.com/OsmSharp/GTFS) - .Net/Mono implementation of a GTFS parser.

### Go
- [Go GTFS Parser](https://github.com/geops/gtfsparser) - A GTFS parsing library for Go.

### Java
- [OneBusAway GTFS Modules](https://github.com/OneBusAway/onebusaway-gtfs-modules/wiki) - A Java-based library for reading, writing, and transforming public transit data in the GTFS format, including database support.

### JavaScript
- [gtfs-sequelize](https://github.com/evansiroky/gtfs-sequelize) - Node.js library modeling the static GTFS using [sequelize.js](https://sequelizejs.com/).
- [gtfs-utils](https://github.com/public-transport/gtfs-utils) – Utilities to process GTFS data sets (e.g., "flattening" `calendar.txt` & `calendar_dates.txt`, computing arrival/departure times of trips).
- [gtfs-via-postgres](https://github.com/derhuerst/gtfs-via-postgres) – Yet another tool to process GTFS using PostgreSQL.
- [Node-GTFS](https://github.com/BlinkTagInc/node-gtfs) - Loads transit data from GTFS files, unzips it and stores it to a SQLite database. Provides some methods to query for agencies, routes, stops and times.

### PostgreSQL
- [gtfs-schema](https://github.com/tyleragreen/gtfs-schema) - PostgreSQL schema for GTFS feeds.
- [gtfs-via-postgres](https://github.com/derhuerst/gtfs-via-postgres) – Yet another tool to process GTFS using PostgreSQL.

### Python
- [combine_gtfs_feeds](https://github.com/psrc/combine_gtfs_feeds) - A Python tool to combine multiple gtfs feeds into one feed/dataset.
- [ESRI public-transit-tools](https://github.com/Esri/public-transit-tools) - Tools for working with public transit data in ArcGIS (license for ArcGIS required).
- [gtfsdb](https://github.com/OpenTransitTools/gtfsdb) - Python library for converting GTFS files into a relational database.
- [gtfslib-python](https://github.com/afimb/gtfslib-python) -  An open source library in python for reading GTFS files and computing various stats and indicators about Public Transport networks.
- [gtfsman](https://github.com/geops/gtfsman) - Repository-like tool in Python to manage and update a huge number of GTFS feeds.
- [gtfspy](https://github.com/CxAalto/gtfspy) - Public transport network analysis and travel time computations using Python3. Compatible with Postgres/PostGIS, Oracle, MySQL, and SQLite. Used by [gtfspy-webviz](https://github.com/CxAalto/gtfspy-webviz).
- [GTFS Kit](https://github.com/mrcagney/gtfs_kit) - A Python 3.6+ tool kit for analyzing General Transit Feed Specification (GTFS) data. Supersedes [GTFSTK](https://github.com/araichev/gtfstk).
- [GTFSTK](https://github.com/araichev/gtfstk) - A Python 3 toolkit for analyzing GTFS data in memory. Uses Pandas and Shapely for speed. Superseded by [GTFS Kit](https://github.com/mrcagney/gtfs_kit).
- [Make GTFS](https://github.com/mrcagney/make_gtfs) - A Python library to make GTFS feeds from basic route information.
- [Mapzen GTFS](https://github.com/transitland/mapzen-gtfs) - A Python GTFS library that supports reading individual GTFS tables, or constructing a graph to represent each agency in a feed.
- [multigtfs](https://github.com/tulsawebdevs/django-multi-gtfs) - A Django application to import and export GTFS.
- [partridge](https://github.com/remix/partridge) - A fast, forgiving Python GTFS reader built on pandas DataFrames.
- [transit_service_analyst](https://github.com/psrc/transit_service_analyst) - A Python library to support transit service analysis.

### R
- [trread](https://github.com/r-gtfs/trread) - A transit (GTFS) file reader for R. 

### Ruby
- [GTFS-viz](https://github.com/vasile/GTFS-viz) - Ruby script that converts a set of GTFS files into a SQLite database + GeoJSONs (needed by the [Transit Map](https://github.com/vasile/transit-map) web application)

## GTFS Converters

Converters from various static schedule formats to and from GTFS.

- [Chouette](https://www.chouette.mobi/) - Converts French-Transmodel, SIRI, NETeX. See Chouette.mobi website for more info.
- [extract-gtfs-pathways](https://github.com/derhuerst/extract-gtfs-pathways) – Command-line tool to extract pathways as GeoJSON from a GTFS dataset.
- [extract-gtfs-shapes](https://github.com/derhuerst/extract-gtfs-shapes) – Command-line tool to extract shapes as GeoJSON from a GTFS dataset.
- [GTFS-OSM-Sync](https://github.com/CUTR-at-USF/gtfs-osm-sync) - A Java tool for synchronizing data in GTFS format with [OpenStreetMap.org](https://www.openstreetmap.org/).
- [gtfs-service-area](https://github.com/cal-itp/gtfs-service-area) - Compute a transit service area from static GTFS. Results are output as single-layer .geojson files. Dockerized version of [gtfs-to-geojson](https://github.com/BlinkTagInc/gtfs-to-geojson).
- [GTFS-route-shapes](https://github.com/kotrc/GTFS-route-shapes) - A Python script to generate a single geoJSON shape for each transit route in a GTFS archive.
- [gtfs-to-geojson](https://github.com/BlinkTagInc/gtfs-to-geojson) - Javascript tool that converts transit data in GTFS shapes and stops into geoJSON. This is useful for creating maps of transit routes.
- [gtfs2gps](https://github.com/ipeaGIT/gtfs2gps) - An R package that converts public transportation data in GTFS format to GPS-like records in a `data.table`, where each row represents the timestamp of each vehicle at a given spatial resolution.
- [gtsf](https://github.com/r-gtfs/gtsf) - general transit (GTFS) simple (geographic) features (sf) in R. can be used to convert from GTFS to Shapefile, GeoJSON, and other formats through GDAL.
- [hafas-generate-gtfs](https://github.com/derhuerst/hafas-generate-gtfs) *(work-in-progress)* – A Javascript tool to generate GTFS dumps from HAFAS endpoints.
- [Hafas2GTFS](https://github.com/geops/hafas2gtfs) - Hafas2GTFS converter written in Python, optimized for SBB HAFAS feeds.
- [kml-to-gtfs-shapes](https://github.com/bdferris/kml-to-gtfs-shapes/tree/gh-pages) - Javascript tool to convert polylines from a KML file into a GTFS shapes.txt file. Hosted on GitHub [here](https://bdferris.github.io/kml-to-gtfs-shapes/).
- [NeTEx-to-GTFS Converter Java](https://github.com/entur/netex-gtfs-converter-java) - Converts NeTEX datasets into GTFS datasets. The input NeTEx datasets are required to follow the Nordic NeTEx Profile.
- [o2g](https://github.com/hiposfer/o2g) - A simple tool to extract GTFS feed from OpenStreetMap.
- [Open-Transport SYNTHESE Convertors](https://github.com/Open-Transport/synthese/wiki) - Converts French-Transmodel, SIRI, NETeX, HAFAS, HASTUS, VDV452, and more.
- [onebusaway-gtfs-to-barefoot](https://github.com/OneBusAway/onebusaway-gtfs-to-barefoot) - A Java tool to create a [Barefoot](https://github.com/bmwcarit/barefoot) mapfile from a GTFS file.
- [onebusaway-vdv-modules](https://github.com/OneBusAway/onebusaway-vdv-modules) - A Java library for working with transit data in the VDV format, including converting VDV-452 schedule data into GTFS.
- [osm2gtfs](https://github.com/grote/osm2gtfs) - Turn OpenStreetMap data and schedule information into GTFS.
- [transit_model](https://github.com/hove-io/transit_model) - A Rust library to convert to/from the following formats: GTFS, NTFS (for Navitia, see [Software for Creating APIs](#software-for-creating-apis)), TransXChange ([UK standard format](https://naptan.dft.gov.uk/transxchange/documentation.htm)), KV1 ([Netherland standard format](https://bison.connekt.nl/standaarden/)) or NeTEx ([European standard format](https://netex-cen.eu/)).
- [transloc-gtfs-rectifier](https://github.com/laidig/transloc-gtfs-rectifier) - Python application that attempts to assign GTFS stop_ids to [TransLoc](https://transloc.com/) IDs using [TransLoc's API](https://market.mashape.com/transloc/openapi-1-2) ([TransLoc](https://transloc.com/) doesn't provide GTFS `stop_ids` in their API).
- [Transmodel and IFF to GTFS](https://github.com/bliksemlabs/bliksemintegration) - Imports and syncs (Transmodel) BISON Koppelvlak1, IFF (a format written by HP/EDS, somewhat similiar to ATCO CIF) to import timetables of the railway networks. The internal pseudo-NETeX datastructure allows to export to GTFS and there are proof-of-concepts to export to other formats such as NETeX, GTFS and IFF.

## GTFS Data Collection and Maintenance Tools

- [bus-router](https://github.com/atlregional/bus-router) - Python script that generates missing shapes.txt for GTFS using routing from [Google Maps Directions API](https://developers.google.com/maps/documentation/directions/) or [OSRM](https://github.com/Project-OSRM/osrm-backend/wiki/Server-api).
- [gtfs-blocks-to-transfers](https://github.com/TransitApp/GTFS-blocks-to-transfers) - A Python tool to convert GTFS blocks, defined by setting [trip.block\_id](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#example-blocks-and-service-day) into a series of [trip-to-trip transfers (proposal)](https://github.com/google/transit/pull/303).
- [GTFS Editor](https://github.com/conveyal/gtfs-editor) - A (self-hosted) web-based GTFS editing framework. (Note: this project has been deprecated in favor of [IBI Data Tools](https://github.com/ibi-group/datatools-ui).)
- [GTFS Editor for Vagrant](https://github.com/laidig/vagrant-gtfs-editor) - Quickly set up the GTFS editor (above) using [Vagrant](https://www.vagrantup.com/)
- [static-GTFS-manager](https://github.com/WRI-Cities/static-GTFS-manager) - A (self-hosted) browser-based user interface for creating, editing, exporting static GTFS (see [related post](https://groups.google.com/forum/#!topic/transit-developers/GFz5rTJTB0I)).  Live demo [here](https://static-gtfs-manager.herokuapp.com/).
- [TransitWand](https://github.com/conveyal/transit-wand) - An open source web and mobile application for collecting transit data. Use it to create GTFS feeds, capture passenger counts or generate GIS datasets.
- [IBI Data Tools](https://github.com/ibi-group/datatools-ui) - A web application that handles GTFS editing, validating, quality checking, and deploying to OpenTripPlanner. (Combines and builds upon the functionality of the deprecated [Gtfs Data Manager](https://github.com/conveyal/gtfs-data-manager) and [GTFS Editor](https://github.com/conveyal/gtfs-editor).)
- [GTFS.html](https://gtfs.pleasantprogrammer.com) - An entirely browser-based tool to view GTFS feeds. Use it to view routes, stops, timetables, etc.
- [pfaedle](https://github.com/ad-freiburg/pfaedle) - Precise map-matching for GTFS using OpenStreetMap data
- [GTFS shape mapfit](https://github.com/HSLdevcom/gtfs_shape_mapfit) - Python tool that fits GTFS shape files and stops to a given OSM map file. Uses [pymapmatch](https://github.com/tru-hy/pymapmatch) for the matching.
- [GTFS Builder](https://nationalrtap.org/Web-Apps/GTFS-Builder) - A free web-based application to help you create GTFS files. Maintained by the National Rural Transit Assistance Program (RTAP).
- [gtfs-station-builder](https://github.com/kostjerry/gtfs-station-builder) - UI tool to help build the internal structure of stations (including pathways.txt)
- [GTFS Text-to-Speech Tester](https://github.com/BlinkTagInc/node-gtfs-tts) - A command-line tool that reads GTFS stop names out loud using Text-to-Speech to determine which need Text-to-Speech values for tts_stop_name in stops.txt. 

## GTFS Analysis Tools

- [transit_service_analyst](https://github.com/psrc/transit_service_analyst) - A Python library to support transit service analysis.
- [Peartree](https://github.com/kuanb/peartree) - A Python library for converting transit data into a directed graph for network analysis.
- [R5: Rapid Realistic Routing on Real-world and Reimagined networks](https://github.com/conveyal/r5) - A Java-based routing engine developed by Conveyal for multimodal (transit/bike/walk/car) networks. It currently plans many trips over a time window for scenario planning and analytics purposes. A related R wrapper package ([r5r](https://github.com/ipeaGIT/r5r/)) is developed independently by IPEA. See also the performance comparison from Higgins et al. (2022), linked below.
- [tidytransit](https://github.com/r-transit/tidytransit) - An R package to read GTFS data into tibbles and simple features dataframes to map transit stops and routes, calculate travel times and transit frequencies, and validate transit feeds.
- [transitr](https://github.com/tmelliott/transitr) - An R package for constructing and modelling a transit network in real time to obtain vehicle ETAs
- [Busbuzzard](https://github.com/bmander/busbuzzard) - Inference of probabilistic schedules from empirical data about transit vehicles.
- [ESRI ArcGIS Public Transit Tools (GTFS)](https://github.com/Esri/public-transit-tools) - Tools for working with public transit data in ArcGIS
- [GTFS-to-Chart](https://github.com/BlinkTagInc/gtfs-to-chart) - Creates stringline charts showing all vehicles on a transit route from GTFS data.

## GTFS Timetable Publishing Tools

- [GTFS-to-HTML](https://gtfstohtml.com) - Generate human-readable timetables in HTML or PDF format directly from GTFS. 
- [TimeTablePublisher (TTPUB)](https://github.com/OpenTransitTools/ttpub) - A web publishing system developed by TriMet that allows a transit agency to examine, modify, and transform raw scheduling data into easy-to-read timetables for customer information purposes

## GTFS Validators

- [Conveyal's gtfs-validator](https://github.com/conveyal/gtfs-validator) - A Java-based GTFS validator based on the OneBusAway GTFS Modules, runs in Java and is faster than the Google provided one.
- [Conveyal's gtfs-lib](https://github.com/conveyal/gtfs-lib/) - Conveyal's successor to their own [gtfs-validator](https://github.com/conveyal/gtfs-validator), a Java-based library for loading and saving GTFS feeds of arbitrary size with disk-backed storage.
- [Google's feedValidator](https://github.com/google/transitfeed/wiki/FeedValidator) - Google-supported Python-based GTFS validator.
- [GTFS Data Package Specification](https://github.com/Stephen-Gates/GTFS) - A [Data Package specification](https://specs.frictionlessdata.io/data-packages/) with validation accomplished with [Good Tables](https://goodtables.okfnlabs.org/). Includes a data package, schemas, tests, and uses South East Queensland GTFS data as an example.
- [GTFS Meta-Validator (hosted by Omni)](https://gtfsvalidator.omnimodal.io) - A web-based GTFS validator that runs both [the Google Python feedValidator](https://github.com/google/transitfeed/wiki/FeedValidator) and [Conveyal's gtfs-validator](https://github.com/conveyal/gtfs-validator) on uploaded GTFS files.
- [gtfstidy](https://github.com/patrickbr/gtfstidy) - A Go-based tool to tidy and validate GTFS feeds.
- [gtfs-validator-api](https://github.com/cal-itp/gtfs-validator-api) - This Python package is a thin wrapper around [MobilityData/gtfs-validator](https://github.com/MobilityData/gtfs-validator) that handles intermediate files produced and finds gtfs-validator's output file so it can be given a specific name or returned as a string.
- [GTFSVTOR](https://github.com/mecatran/gtfsvtor) - An open-source GTFS validator implemented in Java licensed under GPLv3 maintained by [Mecatran](https://www.mecatran.com/).
- [MobilityData's gtfs-validator](https://github.com/MobilityData/gtfs-validator) - A open-source GTFS validator canonically following the GTFS spec implemented in Java licensed under Apache v2.0 maintained by [MobilityData](https://mobilitydata.org/).
- [Reflect GTFS Validator (hosted by Foursquare ITP)](https://reflect.foursquareitp.com) - Transit schedule and GTFS validation platform by [Foursquare ITP](https://www.foursquareitp.com) that includes a free, web-based GTFS validator based on [gtfs-lib](https://github.com/conveyal/gtfs-lib/).
- [Transit App's gtfs-fares-v2-validator](https://github.com/TransitApp/gtfs-fares-v2-validator) - A Python tool that validators GTFS-Fares-v2 data based on the [draft specification](https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#).
- [Transport Validator](https://github.com/etalab/transport-validator/) - An open-source validator implemented in [Rust](https://www.rust-lang.org/). Used by the [French National Access Point](https://transport.data.gouv.fr/validation/).
