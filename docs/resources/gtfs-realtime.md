# GTFS Realtime

- [GTFS-realtime documentation](https://github.com/google/transit/tree/master/gtfs-realtime). Also available in [Español](https://github.com/google/transit/tree/master/gtfs-realtime/spec/es).
- [GTFS-realtime Autodoc](https://laidig.github.io/gtfs-rt-autodoc/index.html) - Automatically generated documentation for GTFS-realtime, generated from the official [GTFS-realtime protocol buffer specification](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) and including some extensions.

## GTFS Realtime Libraries & Demo Apps

- [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) - The official bindings for Java, .NET, Node.js, Python, and Ruby generated from the official [GTFS-realtime protocol buffer specification](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto).
- [GTFS-realtime Exporter](https://github.com/OneBusAway/onebusaway-gtfs-realtime-exporter/wiki) - A Java-based tool that assists in producing and sharing a GTFS-relatime feed.
- [GTFS-realtime Alerts Producer Demo](https://github.com/OneBusAway/onebusaway-gtfs-realtime-alerts-producer-demo/wiki) - A Java-based demo project for producing GTFS-realtime Service Alerts.
- [GTFS-realtime Alerts Producer Web Application](https://github.com/OneBusAway/onebusaway-service-alerts) - A Java-based web application for producing GTFS-realtime Service Alerts.
- [GTFS-realtime TripUpdates & VehiclePositions Producer Demo](https://github.com/OneBusAway/onebusaway-gtfs-realtime-trip-updates-producer-demo/wiki) - A Java-based demo project for producing GTFS-realtime TripUpdates (estimated arrivals) and Vehicle Positions.
- [GTFS-realtime Vehicle Positions Consumer/Visualizer Demo](https://github.com/OneBusAway/onebusaway-gtfs-realtime-visualizer) - A Java-based demo project for consuming a GTFS-realtime Vehicle Positions feed and displaying this info on a map.

## GTFS Realtime Validators

- [gtfs-realtime-validator](https://github.com/MobilityData/gtfs-realtime-validator) - A GTFS Realtime validation tool originally developed by the [Center for Urban Transportation Research](https://www.cutr.usf.edu/) at the [University of South Florida](https://www.usf.edu/) and now maintained by [MobilityData](https://mobilitydata.org/).

## GTFS Realtime (and Other Real-time API) Archival Tools

- [GTFS-realtime to SQL](https://github.com/OpenMobilityData/GtfsRealTimeToSql) - Parses a GTFS-RealTime feed into an SQL database (used in [OpenMobilityData.org](https://openmobilitydata.org))
- [gtfsrdb](https://github.com/CUTR-at-USF/gtfsrdb) - A Python tool that supports reading and archiving GTFS-realtime feeds into a database
- [retro-gtfs](https://github.com/SAUSy-Lab/retro-gtfs) - A Python application that collects real-time data from the Nextbus API and archives it into the GTFS format (i.e., retrospective GTFS).

## GTFS Realtime Convertors

- [SIRI to GTFS-realtime](https://github.com/OneBusAway/onebusaway-gtfs-realtime-from-siri-cli/wiki) - A Java-based command-line utility to convert from the [SIRI format](https://www.siri.org.uk/) to GTFS-realtime
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
- [GTFS-realtime VehiclePositions to GTFS-realtime TripUpdates (TransitClock)](http://thetransitclock.org) - Java application that can consume raw vehicle positions and generate prediction times in formats such as GTFS-realtime.  Formerly known as "Transitime".
- [gtfs-realtime-translators](https://github.com/Intersection/gtfs-realtime-translators) - A Python-based tool to translate custom arrival API formats to GTFS-realtime.  As of July 2019 it supports LA Metro and SEPTA.
- [Transloc API to GTFS-realtime](https://github.com/jonathonwpowell/transloc-to-gtfs-real-time) - A Node.js based tool to convert the Transloc API to GTFS-realtime.
- [hafas-gtfs-rt-feed](https://github.com/derhuerst/hafas-gtfs-rt-feed) – A Javascript tool to generate a GTFS Realtime feed from a HAFAS endpoint.
- [GTFS-realtime to SIRI-Lite](https://github.com/etalab/transpo-rt/) - A [Rust](https://www.rust-lang.org/) webserver to convert multiple GTFS-RT feeds to a SIRI-Lite API.

## GTFS Realtime Utilities

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
- [GTFS Realtime Display](https://git.wtf-eg.de/dancesWithCycles/gtfs-rt-display) - Analyse, monitor and maintain GTFS Realtime data. [Example instances](https://www.swingbe.de/activity/gtfs-rt-display/)

