#  Pathways
Pathways contains features that allow to model large transit stations, helping riders navigate from station entrances and exists to the location where they board or disambark from a transit vehicle. Some of these features make it possible to communicate a path's physical characteristics and estimated navigation time, and real-world wayfinding systems employed in stations.

## Location types

Location types are used to classify key areas within transit stations such as exits/entrances, nodes or boarding areas, as well as their relationship. Location types serve as a fundation for modeling transit stations using Pathways.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/schedule/reference/#stopstxt)|`location_type`, `parent_station` |

## Pathway connections

At its foundational level, Pathways offers basic functionality to connect key areas defined in Location types within a station. These connections form pathways, enabling users to obtain precise directions (e. g. from an entrance to the boarding area), which is particularly useful in navigating large and complex transit stations.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](/schedule/reference/#pathwaystxt)|`pathway_id`, `from_stop_id`, `to_stop_id`, `pathway_mode`, `is_bidirectional` |

## Pathways details

More details can be added to provide additional details regadring the physical characteristics of a station’s pathways, including length, width and slope (for ramps) or the number of stairs (for stairways). This helps riders anticipate the conditions and accessibility of the pathway they need to navigate.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](/schedule/reference/#pathwaystxt)|`max_slope`, `min_width`, `length`, `stair_count`|

## Levels

Levels can be used to list all different levels within a station, providing users with an additional layer of information to stations. This feature also enables the use of elevators in conjunction with the Pathways (Basic) feature.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[levels.txt](/schedule/reference/#levelstxt)|`level_id`, `level_index`, `level_name`|
|[stops.txt](/schedule/reference/#stopstxt)|`level_id`|

## In-station traversal time

In-station traversal time provides an additional level of detail to in-station directions, giving users an estimated time required to navigate stations, resulting in better travel directions and travel times.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](/schedule/reference/#pathwaystxt)|`traversal_time`|

## Pathways signs

Pathway signs can bridge the information displayed in trip planners with real-world signs. If this is represented in a feed, trip planners can provide directions such as 'follow signs to '. 

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](/schedule/reference/#pathwaystxt)|`signposted_as`, `reversed_signposted_as`|
