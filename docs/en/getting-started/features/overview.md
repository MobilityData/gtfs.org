# GTFS Schedule Features

As the GTFS Reference format evolves to meet the current needs of transit systems, its functions can become increasingly complex. The **GTFS Features** are intended to provide a clear and definitive explanation of functionalities enabled by the GTFS Reference format. This helps transit agencies, vendors, consumers and researchers understand the capabilities of GTFS and answer the question: **What can I do with GTFS?** 

The following groups of features explain the purpose of each feature as well as the files and fields associated with them, helping users to understand which data is needed to support a specific feature.

## Base
These essential features form the core of a GTFS feed. They are the minimal elements needed to represent a transit service.

<div class="grid cards" markdown>

- :material-subway-variant:{ .lg .middle } __Agency__

    Communicate details about the agencies responsible for the transit service.
    
    [:octicons-arrow-right-24: Learn more](../base/#agency)

- :material-subway-variant:{ .lg .middle } __Stops__

    Define the locations where a transit service picks up and drops off passengers.

    [:octicons-arrow-right-24: Learn more](../base/#stops)

- :material-subway-variant:{ .lg .middle }  __Routes__

    Define the elements of a transit route such as name and the type of service.

    [:octicons-arrow-right-24: Learn more](../base/#routes)

- :material-subway-variant:{ .lg .middle } __Service Dates__

    Create the structure to schedule trips and service exemptions.

    [:octicons-arrow-right-24: Learn more](../base/#service-dates)

- :material-subway-variant:{ .lg .middle } __Trips__

    Represent transit vehicles traveling along a defined route at scheduled times.

    [:octicons-arrow-right-24: Learn more](../base/#trips)

-   :material-subway-variant:{ .lg .middle } __Stop Times__

    Define the arrival and departure times of each trip for each stop.

    [:octicons-arrow-right-24: Learn more](../base/#stop-times)

</div>

## Base add-ons
These features enhance a GTFS dataset, improving rider experience and facilitating collaboration between agencies, vendors, and data re-users. They may involve adding new fields to existing files or creating new files.

<div class="grid cards" markdown>

- :material-plus-box-multiple-outline:{ .lg .middle } __Feed Information__

    Communicate important information about the feed itself.

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#feed-information)

- :material-plus-box-multiple-outline:{ .lg .middle } __Shapes__

    Define the geographic path followed by a vehicle along a trip.

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#shapes)

- :material-plus-box-multiple-outline:{ .lg .middle } __Route Colors__

    Accurately depict and communicate the color scheme assigned to specific routes.

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#route-colors)

- :material-plus-box-multiple-outline:{ .lg .middle } __Bike Allowed__

    Communicate if vehicles are able to accommodate bicycles or not.

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#bike-allowed)

- :material-plus-box-multiple-outline:{ .lg .middle } __Headsigns__

    Communicate the signage used by vehicles indicating the trip’s destination.

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#headsigns)

- :material-plus-box-multiple-outline:{ .lg .middle } __Location Types__

    Classify key areas within transit stations such as entrances and exits.

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#location-types)

- :material-plus-box-multiple-outline:{ .lg .middle } __Frequencies__

    Represent services that operate on a regular frequency or specific headways.                           

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#frequencies)

- :material-plus-box-multiple-outline:{ .lg .middle } __Transfers__

    Describe transfers allowed between different transit services.

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#transfers)

-   :material-plus-box-multiple-outline:{ .lg .middle } __Translations__

    Communicate service information in multiple languages.

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#translations)

- :material-plus-box-multiple-outline:{ .lg .middle } __Attributions__

    Communicate who was involved in the creation of the dataset.

    [:octicons-arrow-right-24: Learn more](../base_add-ons/#attributions)

</div>


## Accessibility
Accessibility features provide essential information for people with disabilities to access the service.

<div class="grid cards" markdown>

- :material-wheelchair:{ .lg .middle } __Stops Wheelchair Accessibility__

    Indicate whether wheelchair boarding is possible from a location.     

    [:octicons-arrow-right-24: Learn more](../accessibility/#stops-wheelchair-accessibility)

- :material-wheelchair:{ .lg .middle } __Trips Wheelchair Accessibility__

    Indicate if a vehicle can accommodate riders using wheelchairs.       

    [:octicons-arrow-right-24: Learn more](../accessibility/#trips-wheelchair-accessibility)

- :material-wheelchair:{ .lg .middle } __Text-to-Speech__

    Provide the necessary inputs to convert text for stop names into audio.

    [:octicons-arrow-right-24: Learn more](../accessibility/#text-to-speech)

</div>


## Fares
GTFS can model various fare structures, such as zone, distance, or time-of-day based fares. It informs riders of trip prices and payment methods.

<div class="grid cards" markdown>

-   :material-cash:{ .lg .middle } __Fare Products__

    Define the list of tickets or fares types available to users.

    [:octicons-arrow-right-24: Learn more](../fares/#fare-products)

-   :material-cash:{ .lg .middle } __Fare Media__

    Define the media that can be used to hold and/or validate a fare product.

    [:octicons-arrow-right-24: Learn more](../fares/#fare-media)

-   :material-cash:{ .lg .middle } __Rider Categories__

    Represent different categories of riders eligible for certain fares.

    [:octicons-arrow-right-24: Learn more](../fares/#rider-categories)

-   :material-cash:{ .lg .middle } __Route-Based Fares__

    Describe the rules used to apply different fares for specific groups of routes.

    [:octicons-arrow-right-24: Learn more](../fares/#route-based-fares)

-   :material-cash:{ .lg .middle } __Time-Based Fares__

    Describe fares differentiated by time of the day or the day of the week.

    [:octicons-arrow-right-24: Learn more](../fares/#time-based-fares)

-   :material-cash:{ .lg .middle } __Zone-Based Fares__

    Describe fares differentiated when traveling from one area to another.

    [:octicons-arrow-right-24: Learn more](../fares/#zone-based-fares)

-   :material-cash:{ .lg .middle } __Fare Transfers__

    Define fees applicable when transferring from one leg of the trip to another.

    [:octicons-arrow-right-24: Learn more](../fares/#fare-transfers)

-   :material-cash:{ .lg .middle } __Fares V1__

    Legacy feature that allows a simpler representation of fare information.

    [:octicons-arrow-right-24: Learn more](../fares/#fares-v1)

</div>


##  Pathways

Pathways features allows to model large transit stations, so that riders are guided from entrances to boarding areas. They provide path details, estimated navigation times, and wayfinding systems.

<div class="grid cards" markdown>

-   :material-escalator:{ .lg .middle } __Pathway Connections__

    Model paths connecting relevant points within a transit station.

    [:octicons-arrow-right-24: Learn more](../pathways/#pathway-connections)

-   :material-escalator:{ .lg .middle } __Pathway Details__

    Provide additional details regarding the physical characteristics of a pathway.

    [:octicons-arrow-right-24: Learn more](../pathways/#pathway-details)

-   :material-escalator:{ .lg .middle } __Levels__

    Describe and list all different levels within a transit station.

    [:octicons-arrow-right-24: Learn more](../pathways/#levels)

-   :material-escalator:{ .lg .middle } __In-Station Traversal Time__

    Communicate the estimated time to navigate paths within a transit station.

    [:octicons-arrow-right-24: Learn more](../pathways/#in-station-traversal-time)

-   :material-escalator:{ .lg .middle } __Pathway Signs__

    Communicate the in-station signage associated with a pathway.

    [:octicons-arrow-right-24: Learn more](../pathways/#pathway-signs)

</div>

## Flexible services
Flexible services, or demand-responsive services, that do not follow regular schedules or fixed routes.

<div class="grid cards" markdown>

- :material-transit-detour:{ .lg .middle } __Continuous Stops__

    Indicate if a user can be picked up and/or dropped off between stops.
    
    [:octicons-arrow-right-24: Learn more](../flexible_services/#continuous-stops)

- :material-transit-detour:{ .lg .middle } __Booking Rules__

    Indiate if users can reserve a trip on a demand-responsive service.            

    [:octicons-arrow-right-24: Learn more](../flexible_services/#booking-rules)

- :material-transit-detour:{ .lg .middle } __Predefined Routes with Deviation__

    Vehicles that can briefly deviate from a route to pick up or drop off.   

    [:octicons-arrow-right-24: Learn more](../flexible_services/#predefined-routes-with-deviation)

- :material-transit-detour:{ .lg .middle } __Zone-based Demand Responsive Services__

    Services that allow pick up/drop off at any location within a specific area.

    [:octicons-arrow-right-24: Learn more](../flexible_services/#zone-based-demand-responsive-services)

- :material-transit-detour:{ .lg .middle } __Fixed-Stops Demand Responsive Services__

    Services that allow pick up/drop off at any location within a group of stops.
   
    [:octicons-arrow-right-24: Learn more](../flexible_services/#fixed-stops-demand-responsive-services)

</div>
