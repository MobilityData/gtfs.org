# Accessibility
GTFS contains multiple features intended to assist riders in navigating and accessing public transit services. Such features can communicate route names and colors consistent with the agency's rider-facing materials, indicate wheelchair accessibility for stops or entire trips, or ensure accurate information for riders using assistive technology.

## Wheelchair accessibility

<div class="grid" markdown>

Wheelchair accessibility fields make it possible to indicate if a stop and vehicle can accommodate users using wheelchairs, allowing them to plan their trips based on the most convenient option for their needs.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/schedule/reference/#stopstxt)|`wheelchair_boarding` |
|[trips.txt](/schedule/reference/#tripstxt)|`wheelchair_accessible`|

</div>

## Text-to-speech

<div class="grid" markdown>

Text-to-speech allows to provide the necessary inputs to convert text into audio, ensures that riders using assistive technology to read text aloud are getting the right stop names when using the transit service.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[stops.txt](/schedule/reference/#stopstxt)|`tts_stop_name` |

</div>

## Route Colors

<div class="grid" markdown>

Using route colors allows to accurately depict and communicate the color scheme assigned to specific routes by the agency’s design guidelines, this enables users to easily identify transit services by their official color.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[routes.txt](/schedule/reference/#routestxt)|`route_color`, `route_text_color` |

</div>

## Bike Allowed

<div class="grid" markdown>

Specifying bike allowance allows to indicate if vehicles serving specific trips are able to accommodate bicycles or not, helping users to plan and access services that enable them to make multimodal trips.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[trips.txt](/schedule/reference/#tripstxt)|`bikes_allowed` |

</div>

## Translations

<div class="grid" markdown>

Translations allows service information such as station names to be provided in multiple languages enabling travel planners to display the information in a specific language depending on the user’s language and location settings.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[translations.txt](/schedule/reference/#translationstxt)|`table_name`,`field_name`,`language`,`translation`,`record_id`,`record_sub_id`,`field_value` |

</div>

## Headsigns

<div class="grid" markdown>

Headsigns allows to communicate the signage used by vehicles indicating the trip’s destination, making it easier for users to identify the correct transit service. This feature supports headsign changes along a specific route.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[trips.txt](/schedule/reference/#tripstxt)|`trip_headsign` |
|[stop_times.txt](/schedule/reference/#stop_timestxt)|`stop_headsign`|

</div>
