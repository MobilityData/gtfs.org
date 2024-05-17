# GTFS: Making Public Transit Data Universally Accessible

## An open data standard for transit passenger information

The General Transit Feed Specification, also known as GTFS, is a standardized data format that provides a structure for public transit agencies to describe the details of their services such as schedules, stops, fares, etc.

It allows public transit agencies to publish their transit data in a format that can be consumed by a wide variety of software applications, most commonly trip planners. This means that users can easily get travel information to access public transit services by using their smartphones or similar devices.

<img class="center" width="560" height="100%" src="../../../assets/what_is_gtfs_001.png">

Today, GTFS is the go-to [Open Standard](https://www.interoperablemobility.org/definitions/#open_standard) for thousands of public transport providers worldwide. Some agencies produce this data themselves, while others employ a vendor to create and maintain data for them. 

## Support for static and dynamic data

GTFS consists of two main parts: [GTFS Schedule](/documentation/schedule/reference) and [GTFS Realtime](/documentation/realtime/reference).

<img class="center" width="560" height="100%" src="../../../assets/what_is_gtfs_002.png">

GTFS Schedule contains information about routes, schedules, fares, and geographic transit details among many other features, and it is presented in simple text files[^1]. This straightforward format allows for easy creation and maintenance without relying on complex or proprietary software.

GTFS Realtime contains trip updates, vehicle positions, and service alerts, using the [Protocol Buffers](https://developers.google.com/protocol-buffers/) format. This part of GTFS works in conjunction with GTFS Schedule in order to inform passengers of service disruptions and updated arrival times.

The GTFS Schedule and GTFS Realtime reference documentation is available in the [Technical Documentation section](/documentation/overview).

<iframe class="center" width="560" height="315" src="https://www.youtube-nocookie.com/embed/SDz2460AjNo?si=wFsaN4_Hr3ypxWdp" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

<a href="https://www.flaticon.com/authors/freepik" title="Icons by Freepik">Icons created by Freepik - Flaticon</a>

[^1]: In addition to text files, the [GeoJSON](https://geojson.org/) format is now also supported in GTFS to represent certain elements of Demand-responsive services.

