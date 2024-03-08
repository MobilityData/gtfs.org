# Software for Creating APIs

Software that you can set up to provide an API to transit and multimodal data.

- [GraphHopper Routing Engine](https://github.com/graphhopper/graphhopper/#public-transit) Open source routing engine for OpenStreetMap. Use it as Java library or server.
- [gtfs-server](https://github.com/denysvitali/gtfs-server) - A web server, written in Rust that uses PostGIS as a backend to serve GTFS data via a HTTP endpoint
- [hafas-rest-api](https://github.com/public-transport/hafas-rest-api) – Expose a [HAFAS](https://de.wikipedia.org/wiki/HAFAS) endpoint as a REST API.
- [Linked Connections](http://linkedconnections.org/) - An open-source, scalable intermodal route planning engine, which allows clients to execute the route planning algorithm (as opposed to the server). Uses GTFS data.
- [Mobroute](http://sr.ht/~mil/mobroute) - Mobroute is a general purpose FOSS public transportation router (e.g. trip planner) Go library and CLI that works by directly ingesting timetable (GTFS) data from transit agencies themselves (sourced from the [Mobility Database](https://database.mobilitydata.org/)). It can be used to quickly run & test routing requests based on GTFS data on your device (via its CLI) or it can be embedded as a library to add GTFS routing to existing navigation apps.
- [MOTIS](https://github.com/motis-project/motis) - Multi Objective Travel Information System, written in C++ and Java. Can consume schedule timetables in the GTFS or HAFAS format as well as real time information in the GTFS-RT (and RISML, a propriatary format at Deutsche Bahn) as input data. For pedestrian routing (handled by Per Pedes Routing) and car routing (handled by OSRM) OpenStreetMap data is used.
- [Navitia](https://github.com/hove-io/navitia) is the opensource engine behind the [Navitia.io](http://www.navitia.io/) live API.
- [OneBusAway](http://onebusaway.org/) - A Java app that consumes GTFS and GTFS-Realtime (along with [other formats](https://github.com/OneBusAway/onebusaway-application-modules/wiki/Real-Time-Data-Configuration-Guide)) and turns them into an easy to use [REST API](http://developer.onebusaway.org/modules/onebusaway-application-modules/current/api/where/index.html).
- [OpenTripPlanner](http://www.opentripplanner.org/) - An open source platform for multi-modal and multi-agency journey planning, as well as returning information about a multi-modal graph (using data sources such as GTFS and [OpenStreetMap](http://www.openstreetmap.org/)).
- [pyBikes](https://github.com/eskerda/pybikes) - Software powering [CityBikes](http://api.citybik.es) for worldwide bikeshare system info
- [TransitClock](https://thetransitclock.github.io/) - Java application that can consume raw vehicle positions and generate prediction times in formats such as GTFS-realtime.  Formerly known as "Transitime".
- [TransiCast](https://www.transicast.com/) - Provides public transportation data for North America in a single, integrated call and response format. The data is provided in stream-parsable XML and JSON formats.  Open-source on [Google Code](https://code.google.com/archive/p/rasa/).  Hosted version at www.transitcast.com [requires payment](http://www.transicast.com/coststructure.html).

