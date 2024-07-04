# Base add-ons
These features expand the capabilities described in Base, serving to either enhance the comprehensiveness of a GTFS dataset to provide a better experience for riders, or facilitate collaboration between agencies, data vendors, and data re-users. These enhancements may entail introducing new fields within the files described in Base, or creating new files.

## Feed Information

Feed Information communicates important information about the feed, such as its validity (start and end date), the publishing organization, and contact information for inquiries regarding the GTFS dataset and data publishing practices.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[feed_info.txt](../../../documentation/schedule/reference/#feed_infotxt)|`feed_publisher_name`, `feed_publisher_url`, `feed_lang`, `default_lang`, `feed_start_date`, `feed_end_date`, `feed_version`, `feed_contact_email`, `feed_contact_url` |


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#feed_infotxt"><b>feed_info.txt</b></a> <br>
        </p>

        | feed_publisher_name	      | feed_publisher_url   | feed_lang | default_lang | feed_start_date | feed_end_date | feed_version | feed_contact_email | feed_contact_url             |
        |--------------------------|----------------------|-----------|--------------|-----------------|---------------|--------------|--------------------|------------------------------|
        | Greater Region Transport | https://www.gra1.org | en        | en           |        20240101 |      20241231 |          3.1 | support@gra1.org   | https://www.gra1.org/support |

## Shapes
Shapes can be defined and associated with trips, enabling trip planning applications to display trips on a map and inform riders of the distance they need to travel in a transit vehicle. The `shape_dist_traveled` fields are used to programmatically determine how much of a shape to draw when showing a map to riders.
When defining shapes, there is a balance between their level of detail (e.g. following the exact curvature of roads) and conveying only the necessary information efficiently.

|Files included                             |Fields included            |
|----------------------------------|-------------------|
|[shapes.txt](../../../documentation/schedule/reference/#shapestxt)                        |`shape_id`, `shape_pt_lat`, `shape_pt_lon`, `shape_pt_sequence`, `shape_dist_traveled`           |
|[trips.txt](../../../documentation/schedule/reference/#tripstxt)                         |`shape_id`           |
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)                    |`shape_dist_traveled`|


**Prerequisites**: 

- [Base features](../base)

??? note "Sample data"

    <p style="font-size:16px">
    The following sample shows a portion of a shape from the TriMet GTFS feed (download it <a     href="https://developer.trimet.org/GTFS.shtml">here</a>). <br><br>
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#shapestxt">shapes.txt</a> <br>
        </p>
    
        | shape_id | shape_pt_lat | shape_pt_lon | shape_pt_sequence | shape_dist_traveled |
        | --------- | ------------- | ------------- | ------------------ | ------------------- |
        | 558674     | 45.47623       | -122.721885    | 1                   | 0.0                  |
        | 558674     | 45.476235      | -122.72236     | 2                   | 121.9                |
        | 558674     | 45.476237      | -122.722523    | 3                   | 163.7                |
        | 558674     | 45.476242      | -122.723024    | 4                   | 292.2                |
        | 558674     | 45.476244      | -122.72316     | 5                    | 327.1               |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt">trips.txt</a> <br>
        </p>
        
        |trip_id |shape_id|
        |--------|--------|
        |13302375|558674  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt">stop_times.txt</a> <br>
        </p>
        
        |trip_id |stop_sequence|shape_dist_traveled|
        |--------|-------------|-------------------|
        |13302375|1            |0                  |
        |13302375|2            |461.7              |
        |13302375|3            |1245               |

## Route Colors

Using Route Colors allows to accurately depict and communicate the color scheme assigned to specific routes by the agency’s design guidelines. This enables users to easily identify transit services by their official color.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[routes.txt](../../../documentation/schedule/reference/#routestxt)|`route_color`, `route_text_color` |


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows that route `RA` is orange using a HEX color code `D95700`, and that text should be rendered black using a HEX color code `0`.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | agency_id | route_short_name | route_long_name    | route_type | route_color | route_text_color |
        |----------|-----------|------------------|--------------------|------------|-------------|------------------|
        | RA       | agency001 |               17 | Mission - Downtown |          3 | D95700      |                0 |

## Bike Allowed

Bike Allowed indicates if vehicles serving specific trips are able to accommodate bicycles or not, helping users to plan and access services that enable them to make multimodal trips.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[trips.txt](../../../documentation/schedule/reference/#tripstxt)|`bikes_allowed` |


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample specifies that the vehicle used in trip `AWE1` can accommodate at least one bicycle on board (`bikes_allowed=1`), and the vehicle used in trip `AWE2` cannot (`bikes_allowed=2`).
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | bikes_allowed |
        |----------|------------|---------|---------------|
        | RA       | WE         | AWE1    |             1 |
        | RA       | WE         | AWE2    |             2 |

## Headsigns

Headsigns allows to communicate the signage used by vehicles indicating the trip’s destination, making it easier for users to identify the correct transit service. This feature supports headsign changes along a specific route.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[trips.txt](../../../documentation/schedule/reference/#tripstxt)|`trip_headsign` |
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`stop_headsign`|

**Prerequisite**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    In the following sample, the first table specifies the headsigns to be used by trips `AWE1` and `AWE2`, and the second one indicates that `AWE1`’s headsign will be modified after stop `TAS004`, overriding the one specified in `trips.txt`.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | trip_headsign |
        |----------|------------|---------|---------------|
        | RA       | WE         | AWE1    | Downtown      |
        | RA       | WE         | AWE2    | Mission       |

    
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign          |
        |---------|--------------|----------------|---------|---------------|------------------------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |                        |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |                        |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |                        |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 | Downtown - Main Square |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 | Downtown - Main Square |

## Location types

Location Types are used to classify key areas within transit stations such as exits/entrances, nodes or boarding areas, as well as their relationship. Location types serve as a foundation for modeling transit stations using Pathways.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`location_type`, `parent_station` |


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows multiple locations within a transit station in `stops.txt`: the parent station, representing the main location, and its child locations such as platforms, entrances/exists, and generic nodes.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
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

## Frequency-based service

Frequency-based service can be used to model services that operate on a regular frequency, such as buses running every 10 minutes or subway services operating 2 minutes within specified time intervals.
When modeling a Frequency-based service, `stop_times.txt` contains the relative times between stops in order to determine the times to be displayed to riders. 

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[frequencies.txt](../../../documentation/schedule/reference/#frequenciestxt)|`trip_id`, `start_time`, `end_time`, `headway_secs`, `exact_times` |


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows two distinct trips: trip `AWE1` that runs every 30 min (`headway_secs=1800`), and trip `AWE2` that runs every 15min (`headway_secs=900`).  
    <p style="font-size:16px">
    The `exact_times` field indicates whether the schedule follows the precise start time entered in the 'start_time' field: 
    - Trip `AWE1` departs every 30min from 6:10am to 12:00pm.
    - trip `AW2` departs at 6:00am, 6:15am, 6:30am, and so on.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#frequenciestxt"><b>frequencies.txt</b></a> <br>
        </p>

        | trip_id | start_time | end_time | headway_secs | exact_times |
        ---------|------------|----------|--------------|-------------|
         AWE1    |    6:10:00 | 12:00:00 |         1800 |           0 |
         AWE2    |    6:00:00 | 19:50:00 |          900 |           1 |

## Transfers

Transfers provide details about transitions between different travel segments (or legs), enabling trip planners to determine the feasibility of journeys that include transfers. Specifying transfers does not imply passengers can't transfer elsewhere, it just shows whether certain transfers are not possible or require a minimum time to transfer.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[transfers.txt](../../../documentation/schedule/reference/#transferstxt)|`from_stop_id`, `to_stop_id`, `from_route_id`, `to_route_id`, `from_trip_id`, `to_trip_id`, `transfer_type`, `min_transfer_time` |


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows three different transfers: one between stops that requires a minimum transfer time of 5 minutes, one timed transfer point between two routes, and one in-seat transfer between two trips made by the same vehicle.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#transferstxt"><b>transfers.txt</b></a> <br>
        </p>

        | from_stop_id | to_stop_id | from_route_id | to_route_id | from_trip_id | to_trip_id | transfer_type | min_transfer_time |
        |--------------|------------|---------------|-------------|--------------|------------|---------------|-------------------|
        | s6           | s7         |               |             |              |            |             2 |               300 |
        |              |            |               |             | PL04-003     | DL57-008   |             4 |                   |
        |              |            | BR09          | CR01        | BR09-012     | CR01-005   |             1 |                   |

## Translations

Translations allows service information such as station names to be provided in multiple languages enabling travel planners to display the information in a specific language depending on the user’s language and location settings.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[translations.txt](../../../documentation/schedule/reference/#translationstxt)|`table_name`,`field_name`,`language`,`translation`,`record_id`,`record_sub_id`,`field_value` |


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows French and Spanish translations being provided for two fields used in `routes.txt`: `route_long_name` and `route_desc`.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#translationstxt"><b>translations.txt</b></a> <br>
        </p>

        | table_name | field_name      | language | translation                                           | record_id | record_sub_id | field_value |
        |------------|-----------------|----------|-------------------------------------------------------|-----------|---------------|-------------|
        | routes     | route_long_name | ES       | Mission - Centro                                      | RA        |               |             |
        | routes     | route_long_name | FR       | Mission - Centre ville                                | RA        |               |             |
        | routes     | route_desc      | ES       | La ruta "A" viaja desde Lower Mission hasta el centro | RA        |               |             |
        | routes     | route_desc      | FR       | La route « A » relie Lower Mission au centre-ville.   | RA        |               |             |

## Attributions

Attributions makes it possible to share additional details regarding the organizations involved in the creation of the dataset (producers, operators and/or authorities, etc.).

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[attributions.txt](../../../documentation/schedule/reference/#attributionstxt) |`attribution_id`, `agency_id`, `route_id`, `trip_id`, `organization_name`, `is_producer`, `is_operator`, `is_authority`, `attribution_url`, `attribution_email`, `attribution_phone` |


**Prerequisites**: 

- [Base features](../base)

??? note "Sample Data"

    <p style="font-size:16px"> 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#attributionstxt"><b>attributions.txt</b></a> <br>
        </p>

        | attribution_id | agency_id | route_id | trip_id | organization_name        | is_producer | is_operator | is_authority | attribution_url                  | attribution_email       | attribution_phone |
        |----------------|-----------|----------|---------|--------------------------|-------------|-------------|--------------|----------------------------------|-------------------------|      -------------------|
        | op01           | tb        |          |         | Transit Bus              |             |           1 |              | https://www.transitbus.org/fares | contact@transitbus.org  | (777)        555-7777    |
        | au01           | gra       |          |         | Greater Region Transport |           1 |             |            1 | https://www.gra1.org             | contact@gra1.org        | (555)        555-5555    |
        | op02           |           | rtd023   |         | Bus company A            |             |           1 |              | https://www.buscompanya.com      | contact@buscompanya.com | (333)        333-3333    |
        | op03           |           | rtd025   |         | Bus company B            |             |           1 |              | https://www.buscompanyb.com      | contact@buscompanyb.com | (888)        888-8888    |
