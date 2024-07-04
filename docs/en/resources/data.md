# Data

Places to access collections of GTFS and other transit and multimodal data

## 3rd party GTFS URL directories
- [~~GTFS Data Exchange~~ (Deprecated)](http://www.gtfs-data-exchange.com/agencies) - Formerly the definitive directory of GTFS feed URLs. Shutdown in 2016. But 93 GB of data from 2008 to 2016 is available upon request.
- [~~OpenMobilityData~~ (Deprecated)](https://openmobilitydata.org/) - List of GTFS and [GTFS-RT](https://openmobilitydata.org/search?q=gtfsrt) feeds. [Archives and validates](https://openmobilitydata.org/p/capital-metro/24) the GTFS feeds and allows you to preview both [GTFS](https://openmobilitydata.org/p/capital-metro/24/latest) and [GTFS-RT](https://openmobilitydata.org/p/capital-metro/495) through the browser. Formerly TransitFeeds.com. [MobilityData announced](https://database.mobilitydata.org/#h.u71vp6xgkckf) it is end-of-life as of early 2022 with a shutdown date to be determined.
- [The Mobility Database](https://database.mobilitydata.org/) - JSON and CSV files [on GitHub](https://github.com/MobilityData/mobility-database-catalogs) that is a repository of 1300+ mobility datasets across the world. Contains contents of OpenMobilityData/TransitFeeds.com.
- [TransitData.io](https://transitdata.io/) - A list of GTFS data in parts of Latin America. Must contact website maintainers directly to access feeds, as they're not publicly available.
- [Transitland](https://transit.land/) - Community editable list of many transit agency GTFS datasets. Also provides an API to access the data as JSON/GeoJSON and a playground to try out the data.

## Transit agency data archives
- [CapMetrics](https://github.com/scascketta/CapMetrics) - Historical vehicle locations for Austin's transit agency (CapMetro). Data is collected by [capmetricsd](https://github.com/scascketta/capmetricsd), a Go daemon.

## National government datasets
- [National Transit Database (USA)](https://www.transit.dot.gov/ntd) - Information and statistics on the transit systems of the United States, run by the Federal Transit Administration.
- [transport.data.gouv (France)](https://transport.data.gouv.fr/) - Data platform for the French transport ecosystem.
- [European long-distance transport operators (EU) *(Unofficial)*](https://github.com/public-transport/european-transport-operators) - Unofficial list of available API endpoints, GTFS feeds and client libraries

## Proprietary (non-standard) vendor APIs
- [Transport API](https://www.transportapi.com/) - REST API for aggregated transit data for the United Kingdom.  Fee-based access.
- [~~TransLoc OpenAPI~~](https://market.mashape.com/transloc/openapi-1-2) - REST API for real-time vehicle, route, stop, and arrival data for over 60 transit systems in the United States that have purchased TransLoc's AVL hardware and software.
- [NextBus API](http://www.nextbus.com/xmlFeedDocs/NextBusXMLFeed.pdf) - REST API for real-time vehicle, route, stop, and arrival data for agencies that have puchased NextBus's hardware and/or software.
- [Navitia.io](http://www.navitia.io/) - REST API for journey planning, stop schedules, isochrones and lot more on US and EU. [Navitia](https://github.com/hove-io/navitia) is the opensource engine behind the live API.
- [CityBikes](http://api.citybik.es) - REST API for aggregated bikeshare data from around the world. Powered by [pyBikes](https://github.com/eskerda/pybikes).
- [HAFAS](https://de.wikipedia.org/wiki/HAFAS) – Propriety public transport management software by [HaCon](https://www.hacon.de) ([list of endpoints](https://gist.github.com/derhuerst/2b7ed83bfa5f115125a5))
- [Citymapper API](https://docs.external.citymapper.com/api/) - REST API for transit journey planning, realtime transit data and walk, cycle, scooter travel times.

## Crowdsourced transit data
- [Citylines.co](https://www.citylines.co) - A collaborative platform for mapping transit systems, with an emphasis on their historical evolution. The data can be downloaded as GeoJSON or CSV from [citylines.co/data](https://www.citylines.co/data).
- [OpenStreetMap (OSM)](https://www.openstreetmap.org) - The collaborative platform for mapping the world, including transport, transit, and routing data.
- [GTFS-Hub](https://github.com/mfdz/gtfs-hub) - Community tested, probably quality/content enhanced, partially merged or filtered GTFS-feeds of (currently German) transport agencies. Maintained by [MITFAHR|DE|ZENTRALE](https://github.com/mfdz).

## Sample GTFS and GTFS Realtime datasets used for software testing
- [sample-gtfs-feed](https://github.com/public-transport/sample-gtfs-feed) - An imaginary GTFS data set used for testing.
- [transitfeed unit tests](https://github.com/google/transitfeed/tree/master/tests/data) - Test data created for the original Google [Python GTFS validator](https://github.com/google/transitfeed/wiki/FeedValidator).
- [Transitland GTFS and GTFS Realtime unit tests](https://github.com/interline-io/transitland-lib) - For testing the [transitland-lib](https://github.com/interline-io/transitland-lib) library that handles GTFS and GTFS Realtime parsing and validation for Transitland:
    - [GTFS - "bad entities" at the single row level](https://github.com/interline-io/transitland-lib/tree/master/test/data/bad-entities)
    - [GTFS - validation errors that that involve entities in one or more files](https://github.com/interline-io/transitland-lib/tree/master/test/data/validator/errors)
    - [GTFS - best practices](https://github.com/interline-io/transitland-lib/tree/master/test/data/validator/best-practices)
    - [~~GTFS Realtime - JSON test cases that are turned into PB contents~~](https://github.com/interline-io/transitland-server/tree/main/test/data/rt)
- [gtfs-realtime-validator unit tests](https://github.com/MobilityData/gtfs-realtime-validator/tree/master/gtfs-realtime-validator-lib/src/test/) - Some [GTFS datasets (zip files)](https://github.com/MobilityData/gtfs-realtime-validator/tree/master/gtfs-realtime-validator-lib/src/test/resources) are included and a large number of GTFS RT messages are defined [programmatically in Java](https://github.com/MobilityData/gtfs-realtime-validator/tree/master/gtfs-realtime-validator-lib/src/test/java/edu/usf/cutr/gtfsrtvalidator/lib/test/rules) via the gtfs-realtime-bindings library.
- [OpenTripPlanner unit tests](https://github.com/opentripplanner/OpenTripPlanner/tree/dev-2.x/src/test) - Some [GTFS datasets](https://github.com/opentripplanner/OpenTripPlanner/tree/dev-2.x/src/test/resources/gtfs) are defined for the unit tests ([GtfsTest](https://github.com/opentripplanner/OpenTripPlanner/blob/dev-2.x/src/test/java/org/opentripplanner/GtfsTest.java) and [mmri folder](https://github.com/opentripplanner/OpenTripPlanner/tree/dev-2.x/src/test/java/org/opentripplanner/mmri)).

