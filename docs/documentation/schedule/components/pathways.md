#  Pathways
Pathways contains features that allow to model large transit stations, helping riders navigate from station entrances and exists to the location where they board or disambark from a transit vehicle. Some of these features make it possible to communicate a path's physical characteristics and estimated navigation time, and real-world wayfinding systems employed in stations.

## Location types

<div class="grid" markdown>

Location types are used to classify key areas within transit stations such as exits/entrances, nodes or boarding areas, as well as their relationship. Location types serve as a fundation for modeling transit stations using Pathways.

| Files associated      | [stops.txt](/schedule/reference/#stopstxt)                       |
|-----------------------|---------------------------------|
| **Fields associated** | location_type<br>parent_station |

</div>

## Pathway connections

<div class="grid" markdown>

At its foundational level, Pathways offers basic functionality to connect key areas defined in Location types within a station. These connections form pathways, enabling users to obtain precise directions (e. g. from an entrance to the boarding area), which is particularly useful in navigating large and complex transit stations.

| Files associated      | [pathways.txt](/schedule/reference/#pathwaystxt)                                                                 |
|-----------------------|------------------------------------------------------------------------------|
| **Fields associated** | pathway_id<br>from_stop_id<br>to_stop_id<br>pathway_mode<br>is_bidirectional |

</div>

## Pathways details

<div class="grid" markdown>

More details can be added to provide additional details regadring the physical characteristics of a station’s pathways, including length, width and slope (for ramps) or the number of stairs (for stairways). This helps riders anticipate the conditions and accessibility of the pathway they need to navigate.

| Files associated      | [pathways.txt](/schedule/reference/#pathwaystxt)                                    |
|-----------------------|-------------------------------------------------|
| **Fields associated** | max_slope<br>min_width<br>length<br>stair_count |

</div>

## Levels

<div class="grid" markdown>

Levels can be used to list all different levels within a station, providing users with an additional layer of information to stations. This feature also enables the use of elevators in conjunction with the Pathways (Basic) feature.

| Files associated      | [levels.txt](/schedule/reference/#levelstxt)                            | [stops.txt](/schedule/reference/#stopstxt) |
|-----------------------|---------------------------------------|-----------|
| **Fields associated** | level_id<br>level_index<br>level_name | level_id  |

</div>

## In-station traversal time

<div class="grid" markdown>

In-station traversal time provides an additional level of detail to in-station directions, giving users an estimated time required to navigate stations, resulting in better travel directions and travel times.

| Files associated      | [pathways.txt](/schedule/reference/#pathwaystxt)   |
|-----------------------|----------------|
| **Fields associated** | traversal_time |

</div>

## Pathways signs

<div class="grid" markdown>

Pathway signs can bridge the information displayed in trip planners with real-world signs. If this is represented in a feed, trip planners can provide directions such as 'follow signs to '. 

| Files associated      | [pathways.txt](/schedule/reference/#pathwaystxt)                            |
|-----------------------|-----------------------------------------|
| **Fields associated** | signposted_as<br>reversed_signposted_as |

</div>
