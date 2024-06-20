# Apps

Apps people use when taking transit.

## Web Apps (open source)
- [Instabus](http://instabus.org) - Realtime map of Austin's (CapMetro) public transit. Has no server/backend dependency at all and runs completely on GitHub pages.
- [OpenTripPlanner Client GWT](https://github.com/mecatran/OpenTripPlanner-client-gwt) - A Google Web Toolkit-based web interface for OpenTripPlanner
- [OpenTripPlanner.js](https://github.com/conveyal/otp.js) - A Javascript-based client for OpenTripPlanner (no longer under development)
- [OTP-UI React Component Library](https://github.com/opentripplanner/otp-ui) - React Javascript component library, which can be used to build trip planner webapps. See the [Storybook](http://www.opentripplanner.org/otp-ui) for a demo.
- [GTFS-realtime Alerts Producer Web Application](https://github.com/OneBusAway/onebusaway-service-alerts) - A Java-based web application for producing GTFS-realtime Service Alerts.
- [HRT BUS Web app](https://github.com/Code4HR/hrt-bus-api) - HRT Bus API publishes real time bus data from Hampton Roads Transit through an application programming interface for developers to make apps from it.
- [Transit-Map](https://github.com/vasile/transit-map) - Web app that animates vehicles (markers) on a map using the public transport timetables to interpolate their positions along the routes (polylines).
- [Transitive.js](https://github.com/conveyal/transitive.js) - Creates a customizable web map layer of transit routes using Leaflet or D3.
- [Google I/O Transport Tracker](https://github.com/googlemaps/transport-tracker) - Shows shuttle arrival times for Google I/O conference, based on the open-source [transport-tracker project](https://github.com/googlemaps/transport-tracker).  Note: To implement this yourself, you need a [Google Maps APIs Premium Plan license](https://developers.google.com/maps/pricing-and-plans/).
- [1-Click](http://camsys.software/products/1-click) - A virtual “trip aggregator” that assembles information on a wide variety of available modes: public transit, private, rail, rideshare, carpool, volunteer, paratransit, and walking and biking. Open-source [on GitHub](https://github.com/camsys/oneclick).
- [Bustime](https://busti.me) - Public transport real-time monitoring with WebSocket updates. Open-source [on GitHub](https://github.com/norn/bustime).
- [Transit Tracker](https://transittracker.ca/#/) - Realtime vehicle position for Greater Montreal & Toronto, Canada
- [GTFS Builder](http://nationalrtap.org/Web-Apps/GTFS-Builder) - A free web-based application to help you create GTFS files. Maintained by the National Rural Transit Assistance Program (RTAP).
- Dede - An independent and universal passenger information system (PIS) mapping realtime movement. A message feed with Vehicle Position entities in the GTFS-Realtime format or the [Dede app](https://github.com/dancesWithCycles/dede-android) can be used as data source.
- [MBTA tile-server](https://github.com/mbta/tile-server) - Scripts to create a Docker container that encapsulates all the elements necessary to develop map tiles for use on MBTA.com
- [Cadê Meu Busão](https://tarifazerobh.org/cade-meu-busao/) - Realtime tracking transit buses from Belo Horizonte, Brazil. Open-source on [GitHub](https://github.com/tarifazero/monitoramento).
- [Tiramisu Transit](https://github.com/CMU-RERC-APT/tiramisu3-pr) - An adaptive mobile transit app that shows real-time bus arrival information developed and deployed by Carnegie Mellon University. No longer maintained.

## Web Apps (closed source)
- [TransitScreen](http://transitscreen.com/) - Custom realtime displays of all local transportation choices
- [Citylines.co](https://www.citylines.co) - A collaborative platform for mapping transit systems, with an emphasis on their historical evolution.
- [Bikeshare Map](http://bikes.oobrien.com/) - Status of all worldwide bikeshare stations
- [Bongo](http://ebongo.org) - Real-time Transit Tracking for Iowa City, Coralville and the University of Iowa. Combines three disparate transit systems into one UI.
- [CityMapper Webapp](https://citymapper.com/nyc) - Really polished webapp with trip planner and route status for over 30 of cities.
- [YourStop](http://yourstop.info) - Mobile friendly web app which consumes GTFS feeds and displays both live and scheduled trips for stops. Launched with MBTA, YRT/Viva and Maryland MTA.
- [DC MetroHero](https://dcmetrohero.com) - Realtime vehicle position and arrivals and departure information for the Washington, D.C. region's WMATA Metrorail and Metrobus systems. WebApp, Android, and iOS apps avaliable.

## Native Apps (open source)

- OneBusAway Apps - [Android](https://play.google.com/store/apps/details?id=com.joulespersecond.seattlebusbot) [*(source code)*](https://github.com/OneBusAway/onebusaway-android), [Fire Phone](http://www.amazon.com/gp/mas/dl/android?p=com.joulespersecond.seattlebusbot) [*(source code)*](https://github.com/OneBusAway/onebusaway-android), [iOS](https://itunes.apple.com/us/app/onebusaway/id329380089)  [*(source code)*](https://github.com/OneBusAway/onebusaway-ios), [Windows Phone](https://www.microsoft.com/en-us/store/apps/onebusaway/9nblggh0cbd9) [*(source code)*](https://github.com/OneBusAway/onebusaway-windows-phone), [Windows 8](https://www.microsoft.com/en-us/store/apps/onebusaway/9wzdncrdm5pc) [*(source code)*](https://github.com/OneBusAway/onebusaway-windows8), [Google Glass GDK](https://github.com/OneBusAway/onebusaway-android/pull/219) [*(source code)*](https://github.com/OneBusAway/onebusaway-android/pull/219), [Alexa skill](https://www.amazon.com/OneBusAway/dp/B01ELVUYCW/) [*(source code)*](https://github.com/OneBusAway/onebusaway-alexa)
- [OpenTripPlanner Android](https://github.com/CUTR-at-USF/OpenTripPlanner-for-Android/wiki) - An Android app for [OpenTripPlanner](http://www.opentripplanner.org/)
- [OpenTripPlanner iOS](https://github.com/opentripplanner/OpenTripPlanner-iOS) - An iOS app for [OpenTripPlanner](http://www.opentripplanner.org/)
- [opentripplanner-client-library](https://github.com/CUTR-at-USF/opentripplanner-client-library) - A Kotlin Multiplatform library for making API requests and parsing responses from an OpenTripPlanner v2 server for trip plans, bike rental info, and server metadata for Android, iOS, and web.
- [Transito](http://git.sr.ht/~mil/transito) - FOSS data-provider-agnostic public transportation app that let's you route between locations using openly available public GTFS feeds (sourced from the [Mobility Database](https://database.mobilitydata.org/)). Utilizing the [Mobroute Go API](http://sr.ht/~mil/mobroute), the Transito app lets you performs routing calculations right on your phone. Cross-platform app currently supporting Android & Linux.
- [Transportr](https://github.com/grote/Transportr) An Android app that uses [public-transport-enabler](https://github.com/schildbach/public-transport-enabler) in order to connect to many different transport networks worldwide.
- [Offi Directions](https://gitlab.com/oeffi/oeffi) - An Android app that provides trip planning, schedules, live departure times, and disruption information for transport authorities in Europe and beyond.
- [Trufi App](https://github.com/trufi-association/trufi-app) - A cross-platform Flutter app that uses [OpenTripPlanner](http://www.opentripplanner.org/)
- [Dede App](https://github.com/dancesWithCycles/dede-android) - An app making any Android powered phone become an Automatic Vehicle Locating (AVL) device for the [Dede](https://dedriver.org) passenger information system (PIS).
- [MACS Transit Android App](https://github.com/yeSpud/MACSTransitApp) - A bus tracker app for Android devices for the MACS Transit system in Fairbanks, Alaska. Uses RouteMatch APIs.
- [Tiramisu Transit](https://github.com/CMU-RERC-APT/tiramisu3-pr#mobile-app-client) - An adaptive mobile transit app that shows real-time bus arrival information developed and deployed by Carnegie Mellon University. Written using Ionic framework. No longer maintained.

## Native Apps (closed source)

- [ally](http://www.allyapp.com/)
- [Transit](http://transitapp.com/)
- [CityMapper](https://citymapper.com/)
- [Moovit](http://moovitapp.com/)
- [TransLoc Rider](http://translocrider.com/) - Real-time transit maps for over 100 transit systems.
- [Transit Display](http://transitdisplay.com/) - Multimodal and real-time transit display software.
- [Ualabee](https://ualabee.com/company/) - Community driven trip planner with focus on user interaction, users can report anomalies, upload pictures, edit transit data and chat with other passengers.

