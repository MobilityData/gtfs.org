# General Transit Feed Specification (GTFS)

The General Transit Feed Specification (GTFS) is an [Open Standard](https://www.interoperablemobility.org/definitions/#open_standard) used to distribute relevant information about transit systems to riders. It allows public transit agencies to publish their transit data in a format that can be consumed by a wide variety of software applications.

GTFS consists of two main parts: [GTFS Schedule](../schedule/reference) and [GTFS Realtime](../Realtime/reference).

## [GTFS Schedule](../schedule/reference)

GTFS Schedule is a feed specification that defines a common format for static public transportation information. It is composed of a collection of simple files, mostly text files (.txt) that are contained in a single ZIP file. 

Each file describes a particular aspect of transit information such as stops, routes, trips, etc. At its most basic form, a GTFS Schedule dataset is composed of 7 files: `agency.txt`, `routes.txt`, `trips.txt`, `stops.txt`, `stop_times.txt`, `calendar.txt` and `calendar_dates.txt`.

Along with this basic set of files, additional (optional) files can also be grouped to provide information of other service elements, such as fares, translations, transfers, in-station pathways, etc. Currently there are more than 15 optional files that extend the basic elements of GTFS, including locations.geojson which introduced a new format besides text files (.txt) which can be used to represent geographical areas. 

The source of truth for all GTFS Schedule files is the official [GTFS Schedule Reference](../schedule/reference), which provides detailed information on the requirements for all information elements in each file that composes a GTFS Schedule dataset.


## [GTFS Realtime](../Realtime/reference)

GTFS Realtime is a feed specification that allows public transportation agencies to provide up-to-date information about current arrival and departure times, service alerts, and vehicle position, allowing users to smoothly plan their trips.

The specification currently supports the following types of information:

- Trip updates - delays, cancellations, changed routes
- Service alerts - stop moved, unforeseen events affecting a station, route or the entire network
- Vehicle positions - information about the vehicles including location and congestion level

To learn more about them visit the [Feed Entities](../Realtime/feed_entities/overview) section.

GTFS Realtime was designed around ease of implementation, good GTFS interoperability and a focus on passenger information. This was possible through a partnership of the [initial Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates) partner agencies, a number of transit developers and Google. The specification is published under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html).

The GTFS Realtime data exchange format is based on [Protocol Buffers](https://developers.google.com/protocol-buffers/) which is a language- and platform-neutral mechanism for serializing structured data (think XML, but smaller, faster, and simpler). 

Similarly to GTFS Schedule, the [GTFS Realtime Reference](../Realtime/reference) is the source of truth that establishes the rules and requirements for any GTFS Realtime feed, while the [gtfs-realtime.proto](../Realtime/proto) file defines the hierarchy of elements and their type definitions that are used.
