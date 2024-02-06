# GTFS Components

As the GTFS Specification grows and adapts to the current needs of transit systems to accurately and effectively communicate service information, the functions of the specification can become increasingly complex. **GTFS Components** are intended to offer a clear and definitive definition of functionalities that are enabled by the GTFS Schedule specification, helping transit agencies, vendors, consumers and researchers to answer the question: **What can I do with GTFS?** 

The following groups of features, called Components, explain the purpose of each feature as well as the files and fields associated with them, helping users to understand which data is needed in order to support a specific feature.


## Base Component
The features included in this component provide the most basic and essential elements that a GTFS needs to represent a transit service. This includes entries for each individual trip, stop, arrival and departure times and service days among many other important pieces of information. Since all of the features included in the base component are essential to enable a working GTFS feed, all these features should be implemented together.

<div class="grid cards" markdown>

-   :material-subway-variant:{ .lg .middle } __Agency__

    Communicate details about the agencies in charge of the transit service
    
    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/base/#agency)

-   :material-subway-variant:{ .lg .middle } __Stops__

    Define the locations where a transit service can be accessed 

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/base/#stops)

-   :material-subway-variant:{ .lg .middle }  __Routes__

    Define the elements of a transit route such as name and the type of service

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/base/#routes)

-   :material-subway-variant:{ .lg .middle } __Stop Times__

    Define the arrival and departure times of each trip for each stop 

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/base/#stop-times)

-   :material-subway-variant:{ .lg .middle } __Service Dates__

    Create the structure to schedule trips and service exemptions 

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/base/#service-dates)

-   :material-subway-variant:{ .lg .middle } __Trips__

    Represent transit vehicles traveling along a defined route at scheduled times

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/base/#trips)

</div>


## Accessibility Component
The Accessibility Component of GTFS contains multiple functionalities to provide information that helps end users navigate and access public transit services. Some of these features can be used to communicate the name and color of a route, making it easier to identify; confirming whether or not a trip and a station are wheelchair accessible, helping users choose the most adequate route; and providing translations in multiple languages, among other things.

<div class="grid cards" markdown>

-   :material-subway-variant:{ .lg .middle } __Text-to-speech__

    Provide the necessary inputs to convert text for stop names into audio

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/accesibility/#text-to-speech)


-   :material-subway-variant:{ .lg .middle } __Wheelchair accessibility__

    Indicate if a stop and/or vehicle can accommodate users using wheelchairs

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/accesibility/#wheelchair-accessibility)

-   :material-subway-variant:{ .lg .middle } __Route Colors__

    Accurately depict and communicate the color scheme assigned to specific routes

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/accesibility/#route-colors)

-   :material-subway-variant:{ .lg .middle } __Bike Allowed__

    Communicate if vehicles are able to accommodate bicycles or not

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/accesibility/#bike-allowed)

-   :material-subway-variant:{ .lg .middle } __Translations__

    Communicate service information in multiple languages

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/accesibility/#translations)

-   :material-subway-variant:{ .lg .middle } __Headsigns__

    Communicate the signage used by vehicles indicating the trip’s destination

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/accesibility/#headsigns)

</div>


## Fares Component
The Fares component includes multiple features that allow to precisely describe a wide variety of pricing structures and payment methods used by different transit agencies around the world, such as zone-based fares and reloadable prepaid cards. This helps users know the correct price applicable to their trip.

<div class="grid cards" markdown>

-   :material-subway-variant:{ .lg .middle } __Fare Products__

    List the types of tickets or fares that available to users

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/fares/#fare-products)
    

-   :material-subway-variant:{ .lg .middle } __Fare Media__

    Define the media that can be used to hold and/or validate a fare product

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/fares/#fare-media)

-   :material-subway-variant:{ .lg .middle } __Route-Based Fares__

    Describe the rules used to apply different fares for specific groups of routes

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/fares/#route-based-fares)

-   :material-subway-variant:{ .lg .middle } __Time-Based Fares__

    Describe fares differentiated by time of the day or the day of the week

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/fares/#time-based-fares)

-   :material-subway-variant:{ .lg .middle } __Zone-Based Fares__

    Describe fares differentiated when traveling from one area to another

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/fares/#zone-based-fares)

-   :material-subway-variant:{ .lg .middle } __Transfer Fares__

    Define fees applicable when transferring from one leg of the trip to another

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/fares/#transfer-fares)

-   :material-subway-variant:{ .lg .middle } __Fares V1__

    Legacy Fares Feature that allows to model simpler fare information 

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/fares/#fares-v1)

</div>


##  Pathways Component
The Pathways component contains features that allow to model in-station paths, helping users navigate transit stations from beginning to end and across multiple levels. Some of these features make it possible to communicate the physical characteristics of each individual section of a path, estimate the time required to navigate them and to match this navigation information with the real-world wayfinding systems used in stations.

<div class="grid cards" markdown>

-   :material-subway-variant:{ .lg .middle } __Location types__

    Classify specific locations within transit stations
    
    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/pathways/#location-types)    

-   :material-subway-variant:{ .lg .middle } __Pathways__

    Model paths connecting relevant points within a station

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/pathways/#pathways-basic)

-   :material-subway-variant:{ .lg .middle } __Pathway details__

    Provide additional details for stations' pathways

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/pathways/#pathways-extra)

-   :material-subway-variant:{ .lg .middle } __Levels__

    Describe and list all different levels within a station

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/pathways/#levels)

-   :material-subway-variant:{ .lg .middle } __In-station traversal time__

    Communicate the estimated time to navigate paths within a station

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/pathways/#in-station-traversal-time)

-   :material-subway-variant:{ .lg .middle } __Pathways directions__

    Communicate the in station signage associated with a pathway

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/pathways/#pathways-directions)

</div>


## Metadata Component
The Metadata Component contains features that allow to provide further information regarding the producer of the GTFS feed and the feed itself, this includes the names of the organizations as well as contact information.

<div class="grid cards" markdown>

-   :material-subway-variant:{ .lg .middle } __Feed Information__

    Communicate information regarding the feed itself

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/metadata/#feed-information)
    

-   :material-subway-variant:{ .lg .middle } __Attributions__

    Communicate who was involved in the creation of the dataset

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/metadata/#attributions)

</div>


## Flexible services Component
This component contains features that make it possible to communicate service information for flexible services with special operations that might not follow the common behavior of scheduled and/or fixed  services.


<div class="grid cards" markdown>

-   :material-subway-variant:{ .lg .middle } __Continuous stops__

    Indicate if a user can be picked up and/or dropped off between stops
    
    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/flexible_services/#continuous-stops)
    
</div>



## Shapes Component
The Shapes component and feature allows to communicate the path that a vehicle follows along a route. Among other things, this can help trip planners to display the route of a trip so that users can know if the route of a service goes to their destination.


<div class="grid cards" markdown>

-   :material-subway-variant:{ .lg .middle } __Shapes__

    Define the geographic path followed by a vehicle along a trip
    
    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/shapes)
    
</div>



## Transfers Component
The transfers component and feature allow to describe transfers between different public transit services. This gives transit agencies the ability to clearly define the applicable rules for each transfer scenario, so that travelers can know if it’s possible to connect trips.

<div class="grid cards" markdown>

-   :material-subway-variant:{ .lg .middle } __Transfers__

    Describe transfers allowed between different transit services

    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/transfers)
    
</div>




## Frequency-based services Component
The frequencies component and feature can be used to represent frequency-based trips (e.g. a bus trips running every 10 minutes, a subway or metro service running every 2 minutes), this can be a useful alternative to providing specific timetables, acting as an alternative to some of the information included in the stop times Feature of the Base Component. 

<div class="grid cards" markdown>

-   :material-subway-variant:{ .lg .middle } __Frequencies__

    Represent stop times based on headways or frequencies
    
    [:octicons-arrow-right-24: Learn more about this feature](/schedule/components/frequency_based_services)
    
</div>

