# Accessibility
GTFS contains multiple features intended to assist riders in navigating and accessing public transit services. Such features can communicate route names and colors consistent with the agency's rider-facing materials, indicate wheelchair accessibility for stops or entire trips, or ensure accurate information for riders using assistive technology.

## Wheelchair accessibility

Wheelchair accessibility fields make it possible to indicate if a stop and vehicle can accommodate users using wheelchairs, allowing them to plan their trips based on the most convenient option for their needs.

**Pre-requirements**: 

- [Base features](/getting_started/features/base)
- [Location Types feature](/getting_started/features/pathways/#location-types) when defining accessibility information for station locations such as entrances/exits or boarding areas.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/documentation/schedule/reference/#stopstxt)|`wheelchair_boarding` |
|[trips.txt](/documentation/schedule/reference/#tripstxt)|`wheelchair_accessible`|

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows wheelchair boarding is available at stop `TAS001` with  `wheelchair_boarding=1`.
    The vehicle used in trip `AWE1` is equipped to accommodate at least one wheelchair, and the vehicle used in trip `AWE2` is not.
    Both the stop and trip must be wheelchair accessible for a passenger to be able to access a trip at the given stop.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name  | stop_lat  | stop_lon   | location_type | wheelchair_boarding |
        |---------|------------|-----------|------------|---------------|---------------------|
        | TAS001  | 5 Av/53 St | 40.760167 | -73.975224 |               |                   1 |

    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | wheelchair_accessible |
        |----------|------------|---------|-----------------------|
        | RA       | WE         | AWE1    |                     1 |
        | RA       | WE         | AWE2    |                     2 |



## Text-to-speech

Text-to-speech allows to provide the necessary inputs to convert text into audio, ensures that riders using assistive technology to read text aloud are getting the right stop names when using the transit service.

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/documentation/schedule/reference/#stopstxt)|`tts_stop_name` |

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample provides a readable version of the stop name, allowing text-to-speech tools to read the name aloud.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name  | stop_lat    | stop_lon   | tts_stop_name            |
        |---------|------------|-------------|------------|--------------------------|
        | TAS001  | 5 Av/53 St | 45.5035680  | -73.587079 | 5th avenue and 53 street |

## Route Colors

Using route colors allows to accurately depict and communicate the color scheme assigned to specific routes by the agency’s design guidelines, this enables users to easily identify transit services by their official color.

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[routes.txt](/documentation/schedule/reference/#routestxt)|`route_color`, `route_text_color` |

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample assigns an orange color to route RA using the HEX color code `D95700`, and specifies that text should be rendered black using HEX color code `0`.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | agency_id | route_short_name | route_long_name    | route_type | route_color | route_text_color |
        |----------|-----------|------------------|--------------------|------------|-------------|------------------|
        | RA       | agency001 |               17 | Mission - Downtown |          3 | D95700      |                0 |

## Bike Allowed

Specifying bike allowance allows to indicate if vehicles serving specific trips are able to accommodate bicycles or not, helping users to plan and access services that enable them to make multimodal trips.

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[trips.txt](/documentation/schedule/reference/#tripstxt)|`bikes_allowed` |

??? note "Sample Data"
    <p style="font-size:16px">
    The following sample specifies that the vehicle used in trip `AWE1` can accommodate at least one bicycle on board, and the vehicle used in trip `AWE2` cannot.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | bikes_allowed |
        |----------|------------|---------|---------------|
        | RA       | WE         | AWE1    |             2 |
        | RA       | WE         | AWE2    |             2 |


## Translations

Translations allows service information such as station names to be provided in multiple languages enabling travel planners to display the information in a specific language depending on the user’s language and location settings.

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[translations.txt](/documentation/schedule/reference/#translationstxt)|`table_name`,`field_name`,`language`,`translation`,`record_id`,`record_sub_id`,`field_value` |

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample provides French and Spanish translations for two fields used in `routes.txt`: `route_long_name` and `route_desc`.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | table_name | field_name      | language | translation                                           | record_id | record_sub_id | field_value |
        |------------|-----------------|----------|-------------------------------------------------------|-----------|---------------|-------------|
        | routes     | route_long_name | ES       | Mission - Centro                                      | RA        |               |             |
        | routes     | route_long_name | FR       | Mission - Centre ville                                | RA        |               |             |
        | routes     | route_desc      | ES       | La ruta "A" viaja desde Lower Mission hasta el centro | RA        |               |             |
        | routes     | route_desc      | FR       | La route « A » relie Lower Mission au centre-ville.   | RA        |               |             |

## Headsigns

Headsigns allows to communicate the signage used by vehicles indicating the trip’s destination, making it easier for users to identify the correct transit service. This feature supports headsign changes along a specific route.

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[trips.txt](/documentation/schedule/reference/#tripstxt)|`trip_headsign` |
|[stop_times.txt](/documentation/schedule/reference/#stop_timestxt)|`stop_headsign`|


??? note "Sample Data"

    <p style="font-size:16px">
    In the following sample, the first table specify the headsigns to be used by trips `AWE1` and `AWE2`, and the second one indicates that `AWE1`’s headsign will be modified after stop `TAS004`, overriding the one specified in `trips.txt`.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | trip_headsign |
        |----------|------------|---------|---------------|
        | RA       | WE         | AWE1    | Downtown      |
        | RA       | WE         | AWE2    | Mission       |

    
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign          |
        |---------|--------------|----------------|---------|---------------|------------------------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |                        |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |                        |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |                        |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 | Downtown - Main Square |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 | Downtown - Main Square |
