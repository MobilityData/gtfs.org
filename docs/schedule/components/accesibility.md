# Accessibility Component
The Accessibility Component of GTFS contains multiple functionalities to provide information that helps end users navigate and access public transit services. Some of these features can be used to communicate the name and color of a route, making it easier to identify; confirming whether or not a trip and a station are wheelchair accessible, helping users choose the most adequate route; and providing translations in multiple languages, among other things.

## Text-to-speech

<div class="grid" markdown>

This feature allows to provide the necessary inputs to convert text into audio, making it possible to communicate transit information, such as stop names, in a more inclusive format.

| Files associated      | [stops.txt](/schedule/reference/#stopstxt)     |
|-----------------------|---------------|
| **Fields associated** | tts_stop_name |

</div>

## Wheelchair accessibility

<div class="grid" markdown>

This feature makes it possible to indicate if a stop and/or vehicle can accommodate users using wheelchairs, allowing them to plan their trips based on the most convenient option for their needs.

| Files associated      | [stops.txt](/schedule/reference/#stopstxt)           | [trips.txt](/schedule/reference/#tripstxt)             |
|-----------------------|---------------------|-----------------------|
| **Fields associated** | wheelchair_boarding | wheelchair_accessible |

</div>

## Route Colors

<div class="grid" markdown>

This feature allows to accurately depict and communicate the color scheme assigned to specific routes by the agency’s design guidelines, this enables users to easily identify transit services by their official color.

| Files associated      | [routes.txt](/schedule/reference/#routestxt)                       |
|-----------------------|---------------------------------|
| **Fields associated** | route_color<br>route_text_color |

</div>

## Bike Allowed

<div class="grid" markdown>

This feature allows to indicate if vehicles providing service on a specific trip are able to accommodate bicycles or not, helping users to plan and access services that enable them to make multimodal trips.

| Files associated      | [trips.txt](/schedule/reference/#tripstxt)      |
|-----------------------|---------------|
| **Fields associated** | bikes_allowed |

</div>

## Translations

<div class="grid" markdown>

This feature allows service information such as station names to be provided in multiple languages enabling travel planners to display the information in a specific language depending on the user’s language and location settings.

| Files associated      | [translations.txt](/schedule/reference/#translationstxt)                                                                                  |
|-----------------------|--------------------------------------------------------------------------------------------------|
| **Fields associated** | table_name<br>field_name<br>language<br>translation<br>record_id<br>record_sub_id<br>field_value |

</div>

## Headsigns

<div class="grid" markdown>

This feature allows to communicate the signage used by vehicles indicating the trip’s destination, making it easier for users to identify the correct transit service. This feature supports headsign changes along a specific route.

| Files associated      | [trips.txt](/schedule/reference/#tripstxt)      | [stop_times.txt](/schedule/reference/#stop_timestxt)  |
|-----------------------|---------------|----------------|
| **Fields associated** | trip_headsign | stop_headsign  |

</div>