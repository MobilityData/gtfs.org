#  Pathways
Pathways features can model large transit stations, guiding riders from station entrances and exists to the location where they board or disambark from a transit vehicle. Some of these features make it possible to communicate a path's physical characteristics and estimated navigation time, and real-world wayfinding systems employed in stations.

## Pathway Connections

At its foundational level, Pathways offers basic functionality to connect key areas defined in Location types within a station. These connections form pathways, enabling users to obtain precise directions (e. g. from an entrance to the boarding area), which is particularly useful in navigating large and complex transit stations.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)|`pathway_id`, `from_stop_id`, `to_stop_id`, `pathway_mode`, `is_bidirectional` |

**Prerequisites**:

- [Base features](../base)
- [Location Types](../base_add-ons/#location-types)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines multiple connections (also referred to as pathways) between pre-established locations (defined as stops): walkways (`pathway_mode=1`), stairs (`pathway_mode=2`), and fare gate (`pathway_mode=6`). Bi-directionality is also specified.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
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
       

## Pathway Details

More details can be added regarding the physical characteristics of a station’s pathways, including length, width and slope (for ramps) or the number of stairs (for stairways). This helps riders anticipate the conditions and accessibility of the pathway they need to navigate.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)|`max_slope`, `min_width`, `length`, `stair_count`|

**Prerequisites**:

- [Base features](../base)
- [Pathway Connections](#pathway-connections)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample defines additional details to pre-established pathways including minimum width, step count for stairs and length and maximum slope for walkways.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
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

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[levels.txt](../../../documentation/schedule/reference/#levelstxt)|`level_id`, `level_index`, `level_name`|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`level_id`|

**Prerequisites**:

- [Base features](../base)
- [Location Types](../base_add-ons/#location-types)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows the different levels in a station. Locations (defined as stops) are then assigned to their corresponding level. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | level_id          | level_index | level_name |
        |-------------------|-------------|------------|
        | level_0_street    |           0 | On street  |
        | level_-1_lobby    |          -1 | Lobby      |
        | level_-2_platform |          -2 | Platform   |


    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
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
       

## In-station Traversal Time

In-station Traversal Time provides an additional level of detail to in-station directions, giving users an estimated time required to navigate stations, resulting in better travel directions and travel times.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)|`traversal_time`|

**Prerequisites**: 

- [Base features](../base)
- [Pathway Connections](#pathway-connections)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows estimated travel time (in seconds) needed to navigate each pathway.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
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
       

## Pathway Signs

Pathway Signs can bridge the information displayed in trip planners with real-world signs. If this is represented in a feed, trip planners can provide directions such as 'follow signs to '.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)|`signposted_as`, `reversed_signposted_as`|

**Prerequisites**:

- [Base features](../base)
- [Pathway Connections](#pathway-connections)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample specifies the navigation information associated with pre-established pathways, reflecting the text displayed on the station's physical signs. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
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
       
