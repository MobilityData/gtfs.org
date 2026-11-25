# Station-stop-entrance

## Summary 

The goal of this document is to provide practical guidance on how to model real-world transit infrastructure using GTFS. Through concrete examples, we illustrate the intentional use of `stops.txt` to:

* Represent entrances, platforms, and complex stations using a hierarchical structure through the `stops.location_type` and `stops.parent_station` fields
* Determine appropriate modelling of entrances as the boundary between the street network and in-station space, establishing a foundation for consistent GTFS Pathways modelling
* Handle edge cases and operational realities not directly addressed by the specification

While the GTFS specification provides the technical foundation, this guidance addresses ambiguities and gray areas that may arise during implementation. By aligning on consistent modelling practices, GTFS producers can improve data quality across systems and provide a better, more reliable experience for riders everywhere.
