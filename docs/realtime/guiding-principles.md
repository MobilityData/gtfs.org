# Guiding Principles
In order to preserve the original vision of GTFS Realtime, a number of guiding principles have been established to take into consideration when extending the spec:

<br>**Feeds should be efficient to produce and consume in realtime.**

Realtime information is a continuous, dynamic stream of data that necessarily requires efficient processing. We chose Protocol Buffers as the basis for the specification because they offer a good trade-off in terms of ease of use for developers and in terms of efficiency for transmitting data. Unlike GTFS, we do not imagine many agencies will be editing GTFS Realtime feeds by hand. The choice of Protocol Buffers reflects the conclusion that most GTFS Realtime feeds will be produced and consumed programmatically.

<br>**The spec is about passenger information.**

Like GTFS before it, GTFS Realtime is primarily concerned with passenger information. That is, the spec should include information that can help power tools for riders, first and foremost. There is potentially a large amount of operations-oriented information that transit agencies might want to transmit internally between systems. GTFS Realtime is not intended for that purpose and there are potentially other operations-oriented data-standards that may be more appropriate.

<br>**Changes to the spec should be backwards-compatible.**

When adding features to the specification, we want to avoid making changes that will make existing feeds invalid. We don't want to create more work for existing feed publishers until they want to add capabilities to their feeds. Also, whenever possible, we want existing parsers to be able to continue to read the older parts of newer feeds. The conventions for extending Protocol Buffers will enforce backwards-compatibility to a certain extent. However, we wish to avoid semantic changes to existing fields that might break backwards-compatibility as well.

<br>**Speculative features are discouraged.**

Every new feature adds complexity to creating and reading of feeds. Therefore, we want to take care to only add features that we know to be useful. Ideally, any proposal will have been tested by generating data for a real transit system that uses the new feature and writing software to read and display it.
