# General Transit Feed Specification (GTFS)

The General Transit Feed Specification (GTFS) is an [Open Standard](https://www.interoperablemobility.org/definitions/#open_standard) used to distribute relevant information about transit systems to riders. It allows public transit agencies to publish their transit data in a format that can be consumed by a wide variety of software applications.

GTFS consists of two main parts: [GTFS Schedule](./schedule/reference.md) and [GTFS Realtime](./Realtime/reference.md).

## GTFS Schedule

GTFS Schedule is a feed specification that defines a common format for static public transportation information. It is composed of a number of text (.txt) files that are contained in a single ZIP file. Each file describes a particular aspect of transit information: stops, routes, trips, fares, etc.

<div class="landing-page">
    <a class="button" href="./schedule/components/overview/">Features</a><a class="button" href="./schedule/reference.md">Reference</a><a class="button" href="./schedule/GTFS%20schedule%20best%20Practices.md">Best Practices</a><a class="button" href="./schedule/recent%20additions/">Recent additions</a>
</div>

## GTFS Realtime

GTFS Realtime is a feed specification that allows public transportation agencies to provide up-to-date information about current arrival and departure times, service alerts, and vehicle position, allowing users to smoothly plan their trips.

<div class="landing-page">
    <a class="button" href="./Realtime/overview/">Overview</a><a class="button" href="./Realtime/reference/">Reference</a><a class="button" href="./Realtime/best%20practices/">Best Practices</a><a class="button" href="./Realtime/feed_entities/overview/">Feed entity</a><a class="button" href="./Realtime/proto/">Protobuf</a><a class="button" href="./Realtime/recent%20additions/">Recent additions</a>
</div>