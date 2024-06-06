# Accessibility
The Accessibility features are intended to provide people with disabilities the information they need to access the service.

## Stops Wheelchair Accessibility

Stops Wheelchair Accessibility allows to indicate whether wheelchair boarding is possible from the specified location. In order to serve riders using wheelchairs, specifying that wheelchair boarding is possible is just as important as specifying that it isn't.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/documentation/schedule/reference/#stopstxt)|`wheelchair_boarding` |

**Prerequisites**:

- [Base features](/getting_started/features/base)
- [Location Types](/getting_started/features/base_add-ons/#location-types) when defining accessibility information for station locations such as entrances/exits or boarding areas.

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows wheelchair boarding is available at stop `TAS001` using `wheelchair_boarding=1`.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name  | stop_lat  | stop_lon   | location_type | wheelchair_boarding |
        |---------|------------|-----------|------------|---------------|---------------------|
        | TAS001  | 5 Av/53 St | 40.760167 | -73.975224 |               |                   1 |


## Trips Wheelchair Accessibility

Trips Wheelchair Accessibility make it possible to indicate if a vehicle can accommodate riders using wheelchairs. In order to serve riders using wheelchairs, specifying that a vehicle can accomodate riders using wheelchairs is just as important as specifying that a vehicle can't. Both the stop and trip must be wheelchair accessible for a passenger to be able to access a trip at the given stop.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[trips.txt](/documentation/schedule/reference/#tripstxt)|`wheelchair_accessible`|

**Prerequisites**: 

- [Base features](/getting_started/features/base)

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows that the vehicle used in trip `AWE1` is equipped to accommodate at least one wheelchair, and the vehicle used in trip `AWE2` is not.
    </p>
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

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/documentation/schedule/reference/#stopstxt)|`tts_stop_name` |

**Prerequisites**: 

- [Base features](/getting_started/features/base)

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
