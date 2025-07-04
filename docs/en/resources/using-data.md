# Using Data

## Consumer Apps

Apps people use when taking transit.

### Web Apps (open source)
- [Catenary Maps](https://catenarymaps.org) - Realtime and Schedule global public transport map and navigation software, written in Rust and Svelte.
- [Instabus](http://instabus.org) - Realtime map of Austin's (CapMetro) public transit. Has no server/backend dependency at all and runs completely on GitHub pages.
- [OpenTripPlanner Client GWT](https://github.com/mecatran/OpenTripPlanner-client-gwt) - A Google Web Toolkit-based web interface for OpenTripPlanner
- [OpenTripPlanner.js](https://github.com/conveyal/otp.js) - A Javascript-based client for OpenTripPlanner (no longer under development)
- [OTP-UI React Component Library](https://github.com/opentripplanner/otp-ui) - React Javascript component library, which can be used to build trip planner webapps. See the [Storybook](http://www.opentripplanner.org/otp-ui) for a demo.
- [GTFS-realtime Alerts Producer Web Application](https://github.com/OneBusAway/onebusaway-service-alerts) - A Java-based web application for producing GTFS-realtime Service Alerts.
- [HRT BUS Web app](https://github.com/Code4HR/hrt-bus-api) - HRT Bus API publishes real time bus data from Hampton Roads Transit through an application programming interface for developers to make apps from it.
- [Transit-Map](https://github.com/vasile/transit-map) - Web app that animates vehicles (markers) on a map using the public transport timetables to interpolate their positions along the routes (polylines).
- [Transitive.js](https://github.com/conveyal/transitive.js) - Creates a customizable web map layer of transit routes using Leaflet or D3.
- [Google I/O Transport Tracker](https://github.com/googlemaps/transport-tracker) - Shows shuttle arrival times for Google I/O conference, based on the open-source [transport-tracker project](https://github.com/googlemaps/transport-tracker).  Note: To implement this yourself, you need a [Google Maps APIs Premium Plan license](https://developers.google.com/maps/pricing-and-plans/).
- [1-Click]([http://camsys.software/products/1-click](https://github.com/camsys/oneclick)) - A virtual “trip aggregator” that assembles information on a wide variety of available modes: public transit, private, rail, rideshare, carpool, volunteer, paratransit, and walking and biking.
- [Bustime](https://busti.me) - Public transport real-time monitoring with WebSocket updates. Open-source [on GitHub](https://github.com/norn/bustime).
- [Transit Tracker](https://transittracker.ca/#/) - Realtime vehicle position for Greater Montreal & Toronto, Canada
- [GTFS Builder](http://nationalrtap.org/Web-Apps/GTFS-Builder) - A free web-based application to help you create GTFS files. Maintained by the National Rural Transit Assistance Program (RTAP).
- Dede - An independent and universal passenger information system (PIS) mapping realtime movement. A message feed with Vehicle Position entities in the GTFS-Realtime format or the [Dede app](https://github.com/dancesWithCycles/dede-android) can be used as data source.
- [MBTA tile-server](https://github.com/mbta/tile-server) - Scripts to create a Docker container that encapsulates all the elements necessary to develop map tiles for use on MBTA.com
- [Cadê Meu Busão](https://tarifazerobh.org/cade-meu-busao/) - Realtime tracking transit buses from Belo Horizonte, Brazil. Open-source on [GitHub](https://github.com/tarifazero/monitoramento).
- [Tiramisu Transit](https://github.com/CMU-RERC-APT/tiramisu3-pr) - An adaptive mobile transit app that shows real-time bus arrival information developed and deployed by Carnegie Mellon University. No longer maintained.

### Web Apps (closed source)
- [TransitScreen](http://transitscreen.com/) - Custom realtime displays of all local transportation choices
- [Citylines.co](https://www.citylines.co) - A collaborative platform for mapping transit systems, with an emphasis on their historical evolution.
- [Bikeshare Map](http://bikes.oobrien.com/) - Status of all worldwide bikeshare stations
- [Bongo](http://ebongo.org) - Real-time Transit Tracking for Iowa City, Coralville and the University of Iowa. Combines three disparate transit systems into one UI.
- [CityMapper Webapp](https://citymapper.com/nyc) - Really polished webapp with trip planner and route status for over 30 of cities.
- [TransSee](https://www.transsee.ca/) - Real-time transit predictions based on actual travel times, vehicle locations, schedules and maps. Premium gives you access to a detailed history of schedules, vehicle locations, stop arrivals, schedule adherance, charts and graphs. For an additional fee custom queries can be run on this data.
- [YourStop](http://yourstop.info) - Mobile friendly web app which consumes GTFS feeds and displays both live and scheduled trips for stops. Launched with MBTA, YRT/Viva and Maryland MTA.
- [DC MetroHero](https://dcmetrohero.net) - Realtime vehicle position and arrivals and departure information for the Washington, D.C. region's WMATA Metrorail and Metrobus systems. WebApp, Android, and iOS apps avaliable.

### Native Apps (open source)

- [KDE Itinerary](https://apps.kde.org/itinerary/) - App (Desktop and Android) for planning trips. It can find public transport routes, store them offline, add events to your trips, see the floor plan of train stations, and much more. [Souce Code](https://invent.kde.org/pim/itinerary), [GitHub](https://github.com/KDE/itinerary)
- [MACS Transit Android App](https://github.com/yeSpud/MACSTransitApp) - A bus tracker app for Android devices for the MACS Transit system in Fairbanks, Alaska. Uses RouteMatch APIs.
- [Next Train - Connecticut](https://github.com/data-creative/NextTrainCT) - A React-native mobile app for searching train schedules published by the Shore Line East transit agency in Connecticut. Relies on a deployment of the [Next Train API](https://github.com/data-creative/next-train-api).
- [Offi Directions](https://gitlab.com/oeffi/oeffi) - An Android app that provides trip planning, schedules, live departure times, and disruption information for transport authorities in Europe and beyond.
- OneBusAway Apps - [Android](https://play.google.com/store/apps/details?id=com.joulespersecond.seattlebusbot) [*(source code)*](https://github.com/OneBusAway/onebusaway-android), [Fire Phone](http://www.amazon.com/gp/mas/dl/android?p=com.joulespersecond.seattlebusbot) [*(source code)*](https://github.com/OneBusAway/onebusaway-android), [iOS](https://itunes.apple.com/us/app/onebusaway/id329380089)  [*(source code)*](https://github.com/OneBusAway/onebusaway-ios), [Windows Phone](https://www.microsoft.com/en-us/store/apps/onebusaway/9nblggh0cbd9) [*(source code)*](https://github.com/OneBusAway/onebusaway-windows-phone), [Google Glass GDK](https://github.com/OneBusAway/onebusaway-android/pull/219) [*(source code)*](https://github.com/OneBusAway/onebusaway-android/pull/219), [Alexa skill](https://www.amazon.com/OneBusAway/dp/B01ELVUYCW/) [*(source code)*](https://github.com/OneBusAway/onebusaway-alexa)
- [OpenTripPlanner Android](https://github.com/CUTR-at-USF/OpenTripPlanner-for-Android/wiki) - An Android app for [OpenTripPlanner](http://www.opentripplanner.org/)
- [OpenTripPlanner iOS](https://github.com/opentripplanner/OpenTripPlanner-iOS) - An iOS app for [OpenTripPlanner](http://www.opentripplanner.org/)
- [opentripplanner-client-library](https://github.com/CUTR-at-USF/opentripplanner-client-library) - A Kotlin Multiplatform library for making API requests and parsing responses from an OpenTripPlanner v2 server for trip plans, bike rental info, and server metadata for Android, iOS, and web.
- [Transito](http://git.sr.ht/~mil/transito) - FOSS data-provider-agnostic public transportation app that let's you route between locations using openly available public GTFS feeds (sourced from the [Mobility Database](https://database.mobilitydata.org/)). Utilizing the [Mobroute Go API](http://sr.ht/~mil/mobroute), the Transito app lets you performs routing calculations right on your phone. Cross-platform app currently supporting Android & Linux.
- [Tiramisu Transit](https://github.com/CMU-RERC-APT/tiramisu3-pr#mobile-app-client) - An adaptive mobile transit app that shows real-time bus arrival information developed and deployed by Carnegie Mellon University. Written using Ionic framework. No longer maintained.
- [Transportr](https://github.com/grote/Transportr) An Android app that uses [public-transport-enabler](https://github.com/schildbach/public-transport-enabler) in order to connect to many different transport networks worldwide.
- [Trufi App](https://github.com/trufi-association/trufi-app) - A cross-platform Flutter app that uses [OpenTripPlanner](http://www.opentripplanner.org/)

### Native Apps (closed source)

- [Transit](http://transitapp.com/)
- [CityMapper](https://citymapper.com/)
- [Moovit](http://moovitapp.com/)
- [Transit Display](http://transitdisplay.com/) - Multimodal and real-time transit display software.
- [Ualabee](https://ualabee.com/company/) - Community driven trip planner with focus on user interaction, users can report anomalies, upload pictures, edit transit data and chat with other passengers.
- [ÖPNV Navigator](https://navigatorapp.net/)
- [TripGo](https://tripgo.com/)

## Hardware

Experimental and production transit hardware.

- [Bus Tracking GPS](https://github.com/herrdragon/busTrackingGps) - Code for Miami prototype of a cheap open-source solution to track transit buses.
- [Train departure Display](https://github.com/chrisys/train-departure-display) - A replica, near real-time, miniature UK railway station train departure sign based upon a Raspberry Pi Zer0.

## SDKs
- [TripKit](https://github.com/alexander-albers/tripkit) - TripKit is a Swift-library to get data from public transport providers.
- [KPublicTransport](https://invent.kde.org/libraries/kpublictransport) - A C++ library for accessing realtime public transport data and for performing public transport journey queries.
- [SkedGo's TripKit SDKs](https://developer.tripgo.com) - Open source SDKs for Android, iOS and React for accessing [SkedGo](https://skedgo.com)'s TripGo API, including trip planning UI components.

## Visualizations

### GTFS Based Visualizations

- [All Transit](https://all-transit.com) - Interactive GTFS route and schedule animation (for U.S. cities) using Mapbox GL JS, Deck.gl and Transitland. Github repository [here](https://github.com/kylebarron/all-transit).
- [BusGraphs Access Analyzer](https://gitlab.com/publictransitanalytics-pub/readme) - Web application for measuring the access provided by real and hypothetical fixed-route public transit networks, and visualizing and decomposing this access in variety of ways.
- [fastest-bus-analysis-in-the-west](https://github.com/vta/fastest-bus-analysis-in-the-west) - A python Pandas script that combines Ridership/APC, Swiftly speed and dwell data, bus stop inventory, GTFS, and geospatial shapes to create a stop by stop, route by route, time grouping filterable dataset for cross-analyses.  The dataset is then visualized in [Tableau](https://public.tableau.com/profile/vivek7797#!/vizhome/stopsandspeedanalyses/Story1) to help VTA Planners find places to make bus and rail network faster and more reliable through speedups methods like stop consolidation and dedicated lanes.
- [gtfspy-webviz](https://github.com/CxAalto/gtfspy-webviz) - Web application for animation and visualization of GTFS data using [gtfspy](https://github.com/CxAalto/gtfspy).
- [gtfs-to-geojson](https://www.transit.chat/gtfs-to-geojson) - A simple online converter for gtfs to geojson with a list of feeds.
- [gtfs-visualizations](https://github.com/cmichi/gtfs-visualizations) - Open-source NodeJS application for visualizing the routes of GTFS datasets.
- [Mapnificent](https://www.mapnificent.net/) - Shows areas you can reach with public transport in a given time. Open-source [on GitHub](https://github.com/mapnificent/mapnificent), live at https://www.mapnificent.net/.
- [MIT COAXS](http://mittransportanalyst.github.io/) - Co-creative Planning of Transit Corridors using Accessibility-Based Stakeholder Engagement (shows route scenarios using [OpenTripPlanner Analyst](http://www.opentripplanner.org/analyst/)).
- [MOTIS](https://motis-project.de/) - Intermodal Mobility Information System including [visualization](https://europe.motis-project.de/)
- [MTA Frequency](http://www.tyleragreen.com/maps/new_york/) - Frequency visualization of subways and buses in New York City built using [Transitland](https://transit.land/).
- [SEPTA Rail OTP Report](https://apps.phor.net/septa/) - An online on-time performance reporing & drill down tool using GTFS.
- [Simple Transit Map]([https://transit.chat/simple-transit-map](https://github.com/ioTransit/simple-transit-map)) - An online example of how to host and update a webmap.
- [Simple Transit Site](https://transit.chat/simple-transit-site) - An online example of how to create a transit website all from your gtfs [on Github](https://github.com/ioTransit/simple-transit-site)
- [TNExT](https://github.com/ODOT-PTS/TNExT) - Transit Network Explorer Tool (TNExT) is a web-based software tool developed for the visualization, analysis, and reporting of regional and statewide transit networks in the state of Oregon.
- [Toronto Transit Explorer](https://github.com/sidewalklabs/totx) - A Java application that visualizes transit, biking and walking accessibility across the city of Toronto. Uses a modified version of [R5](https://github.com/conveyal/r5) for routing.
- [Transit Vis](https://github.com/zackAemmer/transit_vis) - A visualization tool to display performance metrics derived from the King County Metro GTFS-RT feed (OneBusAway API). Viewable [here](https://www.transitvis.com/). Used for [this paper](https://link.springer.com/article/10.1007/s12469-022-00291-7).
- [TransitFlow](https://github.com/transitland/transitland-processing-animation) Animate GTFS data around the world using Processing and Transitland.
- [TRAVIC Transit Visualization Client](http://tracker.geops.ch/) - Visualizes vehicles moving based on static GTFS data (and sometimes realtime data). Supports over 260 cities.  Github account for geOps organization is [here](https://github.com/geops).
- [Traze](https://traze.app/) by [Veridict](https://www.veridict.com) - Visualization of public transport vehicles from all over the world. Collaborate with other users to get real-time updates even when it is not available from the agency. Based on a number of sources, including GTFS and GTFS-RT. (Previously known as Livemap24). 
- [Visualizing MBTA Data](http://mbtaviz.github.io/) - Interactive graphs that show how people use Boston's subway system.
- [GTFS Viz 🚉](https://github.com/gabrielAHN/gtfs-viz) - A web app that visualizes GTFS Data on the browser at scale without a backend on the client side using [duckdb-wasm 🦆](https://duckdb.org/docs/api/wasm/overview.html).

### Transit Map Creation

- [Brand New Subway](https://jpwright.github.io/subway/) - An interactive transportation planning game that lets players alter the NYC subway system to their heart's content.
- [BENO Metro Mapm Creator](https://beno.uk/metromapcreator/#) - A very old fashioned but classic transit map creator.
- [Tennessine Metro Designer](https://tennessine.co.uk/metro/) - A modern and aesthetically pleasing transit map designer.
- [loom](https://github.com/ad-freiburg/loom) - Software suite for the automated generation of geographically correct or schematic transit maps.
- [Metro Map Maker](https://metromapmaker.com/)   - An open source and simple metro map maker software.
- [MetroDreamin'](https://metrodreamin.com/explore) - A modern, open source software that allows users to create, save, like, and share interactive transit maps with agents.
- [Rail Map Generators](https://wongchito.github.io/RailMapGenerator) - Tool for generating railway maps and information panels in the styles of various cities' public transportation systems.
- [MetroSets](https://metrosets.ac.tuwien.ac.at/) - A flexible web tool to visualize set systems using the metro map metaphor. Based on this [paper](https://www.computer.org/csdl/journal/tg/2021/02/09224192/1nV7Me0F3Lq)

#### General Drawing Applications for making transit visualizations
- [Adobe illustrator](https://www.adobe.com/ca/products/illustrator.html) - The industry-leading vector graphics software (requres membership plan).
- [Inkscape](https://inkscape.org/) - A free desgn tool similar to Adobe Illustrator.

#### General GIS Applications for making transit visualizations
 - [Felt](https://felt.com/) - An aestically pleasing Modern GIS software.
 - [Google Mymaps](https://www.google.ca/maps/about/mymaps/) - Create and share custom maps with Google My Maps.
 - [Google Earth](https://www.google.com/earth/about/) - Create and share custom maps with one of the the world's most detailed statelite applications.

### Transit Map Aggregation
 - [UrbanRail.Net](http://www.urbanrail.net/) - Worldwide reference map of urban rail transport (metros,trams,commuter rail) with detailed and up-to-date information.
 - [OpenRailwayMap](https://www.openrailwaymap.org/) - Worldwide map of railways using OpenStreetMap data.
 - [AllRailMap](https://www.allrailmap.com/) - Another worldwide map of railways using OpenStreetMap data.
 - [European Railway Atlas](https://europeanrailwayatlas.com/) -  A reference book of European railway maps that is available for purchase.
 - [Rail Transit Maps](http://www-personal.umich.edu/~yopopov/rrt/railroadmaps/) - A collection of railway maps covering Europe (especially Russia).
 - [Tramscale](https://alexander.co.tz/tramscale/) - Website outlining maps showing the scales of tram systems around the world.
 - [Timelines](https://alexander.co.tz/timelines/) - Compare the timelines of Rapid Transit Projects around the world.
 - [Metrolinemap](https://www.metrolinemap.com/) - Interactive Maps of the world's Metro systems.
 - [Metrocyclopaedia](https://blog.csaladen.es/metro/ ) - 3d maps of metro systems across the world (uses data from Metrolinemap).
 - [RailFansCanada](https://map.railfans.ca/) - Interactive System Map detailing the  the present and future of different urban rail systems in Canada.
 - [North American Transit](https://www.google.com/maps/d/u/0/viewer?mid=1GAXiiEp8a62LvZNDueYN76NPTCoUxvdx&ll=43.71257881237152%2C-79.385523993394&z=11) - Map of all Passenger Rail in North America including (intercity rail, metros, trams and tourist lines)
 - [Intercity Rail map](https://asm.transitdocs.com/) - Map of the real time location and schedule information for  Amtrak and Via trains
 - [Indian Railways Map](https://indiarailinfo.com/atlas) - Interactive Maps of the Indian Main rail network.
 - [National Rail Network Map](https://www.arcgis.com/apps/mapviewer/index.html?webmap=96ec03e4fc8546bd8a864e39a2c3fc41) - This map shows the extent and ownership of rail lines in the United States, including passenger and freight lines.
 - [Ferrocarta](https://ferrocarta.net/) - A series of maps covering all of the passenger rail networks in Brazil, Canada and France.
 - [Train Lookout](https://trainlookout.com/) - A tool to easily Log, map and share your journeys by train.
 - [Australian Rail Maps](http://www.railmaps.com.au/) -   Detailed Australian railway maps from the national, state and city levels.
 - [Steam Engine "IS"](https://parovoz.com/maps/supermap/) - Maps of railways in the USSR.
 - [Carto.Metro](https://cartometro.com/) - Detailed maps of metro and tram networks of global cities (especially in France).
 - [Railway Stations](https://map.railway-stations.org/) - Photos of Railway Stations across the world.
 - [INAT](https://www.inat.fr/maps/) - Aesthetically pleasing static maps of worldwide metros systems.
 - [Transit Maps](https://transitmap.net/) - Critiques and reviews of the design of transit maps from across the world.
 - [Transit Explorer](https://www.thetransportpolitic.com/transitexplorer/) - A map containing fixed-guideway transit around the world.
- [Britsh Railways](https://www.merrittcartographic.co.uk/british_railways.html) An interactive map of Great Britain's rail network.
- [TransitLand Map](https://www.transit.land/map)  - Worldwide map of transit services (which have a GTFS Feed).
 - [DB InfraGO](https://geovdbn.deutschebahn.com/pgv/public/map/isr.xhtml)  - Interactive Map of German Rail infrastructure.
 - [SNCF Carte interactive](https://www.sncf-reseau.com/fr/carte/carte-interactive-reseau-ferre-francais-0) - Interactive Map of French Rail infrastructure.
 - [Project Mapping](https://www.projectmapping.co.uk/index.html) - Schematic maps of UK and worldwide rail networks.
 - [China Railway Map](http://cnrail.geogv.org/enus/about) - An online Interactive map for the passenger railway transportation system of China, presenting station and rail information.
 - [Canadian Rail Atlas](https://rac.jmaponline.net/canadianrailatlas/) - a user-friendly, interactive map of Canada’s nearly 43,000-kilometre railway network.
 - [The Rail Map](https://www.therailmap.com/) - An Interactive Map with Train lines in North America using data from OpenStreetMap.
 - [JR pass](https://www.jrpass.com/map#) - Interactive Map of Mainline Rail in Japan.

## Agency Tools

Tools for transit agencies.  See also [GTFS Data Collection and Maintenance Tools](#gtfs-data-collection-and-maintenance-tools) for tools specific to GTFS.

- [Remix](http://getremix.com/) - A webapp that lets transit agencies easily plan routes.
- [Next Train API](https://github.com/data-creative/next-train-api) - Serves any GTFS feed as a JSON API. Transit agencies and developers alike can deploy the open source code to their own Heroku server.
- [AC Transit RestroomFinder](https://github.com/actransitorg/ACTransit.RestroomFinder) - Pinpoints the nearest authorized restroom for bus operator and field staff, using GPS and on-screen map.
- [AC Transit Training and Education Department (TED) application](https://github.com/actransitorg/ACTransit.Training) - This application supports the District's training operations for transportation and maintenance employees, primarily in the positions of Bus Operators and Heavy Duty Coach Mechanics (Apprentice and Journey), although the system supports new courses and apprenticeship programs.
- [AC Transit Customer Relations application (CusRel)](https://github.com/actransitorg/ACTransit.CusRel) - Public transit ticketing system for customer issues and feedback with: inter-departmental routing with notifications, department/person assigments, simple workflow, ticket searching, pre-canned reports, daily reminders and more.
- [PTV Lines](https://www.ptvgroup.com/en/products/ptv-lines) - A cloud-based public transport software for line planning and public transport service optimisation
- [TransAM]([http://camsys.software/products/transam](https://github.com/camsys/transam_core)) - An open-source asset management platform for public transportation agencies.
- [RidePilot](https://github.com/camsys/ridepilot) - An open-source Computer Aided Scheduling and Dispatch (CASD) software system to meet the needs of small scale human service transportation agencies.
- [TNExT](https://github.com/ODOT-PTS/TNExT) - Transit Network Explorer Tool (TNExT) is a web-based software tool developed for the visualization, analysis, and reporting of regional and statewide transit networks in the state of Oregon.
- Route Trends ([webapp](https://metrotransitmn.shinyapps.io/route-trends/), [GitHub](https://github.com/metrotransit/route-trends)) - An R Shiny app to ingest ridership time series, and return seasonal, trend, and residual components according to [STL methodology](https://otexts.com/fpp2/stl.html) and forecasts including uncertainty based on those components.  Sponsored by [Metro Transit](https://www.metrotransit.org/) (Minneapolis-St. Paul).
- [TBEST](https://tbest.org/) - TBEST (Transit Boardings Estimation and Simulation Tool) is an effort to develop a multi-faceted GIS-based modeling, planning and analysis tool which integrates socio-economic, land use, and transit network data into a platform for scenario-based transit ridership estimation and analysis. Funded by the Florida Department of Transportation. Free to use but not open-source.
- [RideSheet](https://docs.ridesheet.org) – A simple, spreadsheet-based tool for small demand-responsive transportation (DRT) services.
