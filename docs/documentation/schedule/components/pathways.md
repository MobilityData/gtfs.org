#  Pathways Component
The Pathways component contains features that allow to model in-station paths, helping users navigate transit stations from beginning to end and across multiple levels. Some of these features make it possible to communicate the physical characteristics of each individual section of a path, estimate the time required to navigate them and to match this navigation information with the real-world wayfinding systems used in stations.

## Location types

<div class="grid" markdown>

This feature is used to classify relevant places within transit stations such as exits/entrances and boarding areas. This can help users by making it easier to identify the right entrance, exit or platform.

| Files associated      | [stops.txt](/schedule/reference/#stopstxt)                       |
|-----------------------|---------------------------------|
| **Fields associated** | location_type<br>parent_station |

</div>

## Pathways

<div class="grid" markdown>

This feature provides the basic information elements that allow to model paths by connecting relevant points within a station. This can help users navigate large and complex stations by providing directions to connect from one point to the other within the station. To enable this feature, the Location Types feature must be implemented.

| Files associated      | [pathways.txt](/schedule/reference/#pathwaystxt)                                                                 |
|-----------------------|------------------------------------------------------------------------------|
| **Fields associated** | pathway_id<br>from_stop_id<br>to_stop_id<br>pathway_mode<br>is_bidirectional |

</div>

## Pathway details

<div class="grid" markdown>

This feature makes it possible to provide additional details about the physical characteristics of a station’s pathways, such as the length, width and slope if it’s a ramp or the number of stairs if it’s a stairway. This can help users anticipate the conditions of the in-station route that they need to navigate.

| Files associated      | [pathways.txt](/schedule/reference/#pathwaystxt)                                    |
|-----------------------|-------------------------------------------------|
| **Fields associated** | max_slope<br>min_width<br>length<br>stair_count |

</div>

## Levels

<div class="grid" markdown>

This feature allows to list all different levels within a station, providing users an additional layer of information to help them navigate stations. This feature also enables the use of elevators in conjunction with the Pathways (Basic) feature.

| Files associated      | [levels.txt](/schedule/reference/#levelstxt)                            | [stops.txt](/schedule/reference/#stopstxt) |
|-----------------------|---------------------------------------|-----------|
| **Fields associated** | level_id<br>level_index<br>level_name | level_id  |

</div>

## In-station traversal time

<div class="grid" markdown>

This feature helps provide an extra level of detail to in-station directions, helping users to get an estimation on the time required to navigate stations, making it possible to get more accurate travel directions and  travel times.

| Files associated      | [pathways.txt](/schedule/reference/#pathwaystxt)   |
|-----------------------|----------------|
| **Fields associated** | traversal_time |

</div>

## Pathways directions

<div class="grid" markdown>

This feature allows to bridge the information displayed in trip planners with real-world information elements such as signs, to facilitate in-station text directions. This can help users navigate transit stations more easily by directing them to follow specific signs within a station.

| Files associated      | [pathways.txt](/schedule/reference/#pathwaystxt)                            |
|-----------------------|-----------------------------------------|
| **Fields associated** | signposted_as<br>reversed_signposted_as |

</div>
