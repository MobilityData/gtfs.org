#  Pathways
Pathways contains features that allow to model large transit stations, helping riders navigate from station entrances and exists to the location where they board or disambark from a transit vehicle. Some of these features make it possible to communicate a path's physical characteristics and estimated navigation time, and real-world wayfinding systems employed in stations.

## Location types

Location types are used to classify key areas within transit stations such as exits/entrances, nodes or boarding areas, as well as their relationship. Location types serve as a fundation for modeling transit stations using Pathways.

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/documentation/schedule/reference/#stopstxt)|`location_type`, `parent_station` |

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines multiple locations within a transit station in `stops.txt`: the parent station, representing the main location, and its child locations such as platforms, entrances/exists, and generic nodes.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id      | stop_name                                             | location_type | parent_station |
        |--------------|-------------------------------------------------------|---------------|----------------|
        | Station_A102 | Main Street station                                   |             1 |                |
        | A102_B01     | Main Street station - North Platform                  |             0 | Station_A102   |
        | A102_B02     | Main Street station - South Platform                  |             0 | Station_A102   |
        | A102_E01     | Main Street station - Entrance/Exit                   |             2 | Station_A102   |
        | A102_S01     | Main Street station - Top of entrance stairs          |             3 | Station_A102   |
        | A102_S02     | Main Street station - Bottom of entrance stairs       |             3 | Station_A102   |
        | A102_S03     | Main Street station - Top of north platform stairs    |             3 | Station_A102   |
        | A102_S04     | Main Street station - Bottom of north platform stairs |             3 | Station_A102   |
        | A102_S05     | Main Street station - Top of south platform stairs    |             3 | Station_A102   |
        | A102_S06     | Main Street station - Bottom of south platform stairs |             3 | Station_A102   |
        | A102_F01     | Main Street station - Paid side of fare gate          |             3 | Station_A102   |
        | A102_F02     | Main Street station - Unpaid side of fare gate        |             3 | Station_A102   |

## Pathway connections

At its foundational level, Pathways offers basic functionality to connect key areas defined in Location types within a station. These connections form pathways, enabling users to obtain precise directions (e. g. from an entrance to the boarding area), which is particularly useful in navigating large and complex transit stations.

**Pre-requirements**: 

- [Base features](/getting_started/features/base)
- [Location Types feature](/getting_started/features/pathways/#location-types)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](/documentation/schedule/reference/#pathwaystxt)|`pathway_id`, `from_stop_id`, `to_stop_id`, `pathway_mode`, `is_bidirectional` |

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines multiple connections (also referred to as pathways) between pre-established locations: walkways (`pathway_mode=1`), stairs (`pathway_mode=2`), and fare gate (`pathway_mode=6`). Bi-directionality is also specified.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | from_stop_id | to_stop_id | pathway_mode | is_bidirectional |
        |------------|--------------|------------|--------------|------------------|
        | MainSt-001 | A102_E01     | A102_S01   |            1 |                1 |
        | MainSt-002 | A102_S01     | A102_S02   |            2 |                1 |
        | MainSt-003 | A102_S02     | A102_F02   |            1 |                1 |
        | MainSt-004 | A102_F02     | A102_F01   |            6 |                1 |
        | MainSt-005 | A102_F01     | A102_S03   |            1 |                1 |
        | MainSt-006 | A102_S03     | A102_S04   |            2 |                1 |
        | MainSt-007 | A102_F01     | A102_S05   |            1 |                1 |
        | MainSt-008 | A102_S05     | A102_S06   |            2 |                1 |
        | MainSt-009 | A102_S04     | A102_B01   |            1 |                1 |
        | MainSt-010 | A102_S06     | A102_B02   |            1 |                1 |
       

## Pathways details

More details can be added to provide additional details regadring the physical characteristics of a station’s pathways, including length, width and slope (for ramps) or the number of stairs (for stairways). This helps riders anticipate the conditions and accessibility of the pathway they need to navigate.

**Pre-requirements**: 

- [Base features](/getting_started/features/base)
- [Pathway connections feature](/getting_started/features/pathways/#pathway-connections)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](/documentation/schedule/reference/#pathwaystxt)|`max_slope`, `min_width`, `length`, `stair_count`|

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines additional details to pre-established pathways including minimum width, step count for stairs and length and maximum slope for walkways.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | max_slope | min_width | length | stair_count |
        |------------|-----------|-----------|--------|-------------|
        | MainSt-001 |         0 |       4.3 |    3.6 |             |
        | MainSt-002 |           |       2.2 |        |          15 |
        | MainSt-003 |      0.06 |         4 |    3.1 |             |
        | MainSt-004 |           |       0.9 |    2.9 |             |
        | MainSt-005 |         0 |       3.5 |      5 |             |
        | MainSt-006 |           |       2.2 |        |          18 |
        | MainSt-007 |         0 |       3.5 |      5 |             |
        | MainSt-008 |           |       2.2 |        |          18 |
        | MainSt-009 |         0 |         6 |      2 |             |
        | MainSt-010 |         0 |         6 |      2 |             |
       

## Levels

Levels can be used to list all different levels within a station, providing users with an additional layer of information to stations. This feature also enables the use of elevators in conjunction with the Pathways connections feature.

**Pre-requirements**: 

- [Base features](/getting_started/features/base)
- [Location Types feature](/getting_started/features/pathways/#location-types)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[levels.txt](/documentation/schedule/reference/#levelstxt)|`level_id`, `level_index`, `level_name`|
|[stops.txt](/documentation/schedule/reference/#stopstxt)|`level_id`|

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample define a list of existing levels and assign them to pre-established locations.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | level_id          | level_index | level_name |
        |-------------------|-------------|------------|
        | level_0_street    |           0 | On street  |
        | level_-1_lobby    |          -1 | Lobby      |
        | level_-2_platform |          -2 | Platform   |


    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | stop_id      | level_id |
        |--------------|----------|
        | Station_A102 |          |
        | A102_B01     |       -2 |
        | A102_B02     |       -2 |
        | A102_E01     |        0 |
        | A102_S01     |        0 |
        | A102_S02     |       -1 |
        | A102_S03     |       -1 |
        | A102_S04     |       -2 |
        | A102_S05     |       -1 |
        | A102_S06     |       -2 |
        | A102_F01     |       -1 |
        | A102_F02     |       -1 |
       

## In-station traversal time

In-station traversal time provides an additional level of detail to in-station directions, giving users an estimated time required to navigate stations, resulting in better travel directions and travel times.

**Pre-requirements**: 

- [Base features](/getting_started/features/base)
- [Pathway connections feature](/getting_started/features/pathways/#pathway-connections)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](/documentation/schedule/reference/#pathwaystxt)|`traversal_time`|

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines additional details to pre-established pathways by specifying the estimated travel time in seconds to navigate each pathway.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | traversal_time |
        |------------|----------------|
        | MainSt-001 |              3 |
        | MainSt-002 |             20 |
        | MainSt-003 |              2 |
        | MainSt-004 |              2 |
        | MainSt-005 |              4 |
        | MainSt-006 |             25 |
        | MainSt-007 |              4 |
        | MainSt-008 |             25 |
        | MainSt-009 |              2 |
        | MainSt-010 |              2 |
       

## Pathways signs

Pathway signs can bridge the information displayed in trip planners with real-world signs. If this is represented in a feed, trip planners can provide directions such as 'follow signs to '. 

**Pre-requirements**: 

- [Base features](/getting_started/features/base)
- [Pathway connections feature](/getting_started/features/pathways/#pathway-connections)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](/documentation/schedule/reference/#pathwaystxt)|`signposted_as`, `reversed_signposted_as`|

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample specifies the navigation information associated with pre-established pathways, reflecting the text displayed on in-station physical signs. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | signposted_as    | reversed_signposted_as |
        |------------|------------------|------------------------|
        | MainSt-001 | to lobby         | Exit                   |
        | MainSt-002 |                  |                        |
        | MainSt-003 | To platforms     | Exit                   |
        | MainSt-004 |                  |                        |
        | MainSt-005 | Westbound trains | Exit                   |
        | MainSt-006 |                  |                        |
        | MainSt-007 | Eastbound trains | Exit                   |
        | MainSt-008 |                  |                        |
        | MainSt-009 | Westbound trains | To Lobby               |
        | MainSt-010 | Eastbound trains | To Lobby               |
       
