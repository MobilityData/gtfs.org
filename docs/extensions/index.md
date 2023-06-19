<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

<style>
  .md-nav .md-nav--secondary {
      display: none !important;
    }
</style>
  
# Extensions

<!-- GTFS is a community driven data format. Users can propose and vote on changes. For detailed information see the [GTFS Schedule](../schedule/process) and [GTFS Realtime](../realtime/process) amendment process.

Extensions that are currently in development can be found on MobilityData's [roadmap](https://mobilitydata.org/roadmaps/#transit).

Extension proposals can be found in the following places:

- MobilityData maintains a [portal with a list of GTFS extension proposals](https://mobilitydata.org/roadmaps/#transit). The roadmap is based on their members' prioritization. You can contribute ideas or extensions via the portal.
- TransitWiki.org contains a [list GTFS extension projects](https://www.transitwiki.org/TransitWiki/index.php/General_Transit_Feed_Specification#GTFS_Extensions).

For more information, contact [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) -->

=== "GTFS Schedule"

    Additional files and fields can be extended onto GTFS Schedule datasets to accommodate a variety of application-specific needs communicated between transit agencies and software vendors, even if these fields are not in the [official specification](../schedule/reference). 
    
    Below is a list of GTFS Schedule extensions that may be implemented. ➕
    
    !!! info "Making an extension official in the specification" 

        Extensions may become [active proposals](../schedule/changes/#active-proposals) and subsequently [merged](../schedule/changes/#recently-merged-proposals) into the official specification via the [Specification Amendment Process](../schedule/process).

    !!! note "Contributing to this list"

        Have an extension you want to share with the GTFS community? Request to add an extension to GTFS.org <a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">here</a>.

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="http://bit.ly/gtfs-pathways" class="no-icon" target="_blank">GTFS-Pathways</a></h3>
            <p class="maintainer">Maintained by <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Accessibility-focused for pathways linking together locations within transit stations for route planning and wayfinding.</li>
            <li>While the core specification of GTFS-Pathways has been completely integrated into GTFS, additional information such as text-to-speech instructions, wheelchair assistance information, equipment-failure reporting, planned or scheduled entrance or exit closures, and elevator and escalator outages need to be added.</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <a href="fares-v2" class="no-icon" target="_blank"><h3 class="title">GTFS-Fares v2</h3></a>
            <p class="maintainer">Maintained by <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Enables trip planning apps to display pricing information to riders.</li>
            <li>While the base implementation of GTFS-Fares v2 has recently been voted to pass into GTFS, some features and functionalities of this extension that are still remaining include zonal/distance-based fares, rider categories, fare capping and ranges, fare bundles passes and containers, rush hour/holiday pricing, transfer sequences, and one route behaviour.</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <a href="flex" class="no-icon" target="_blank"><h3 class="title">GTFS-Flex</h3></a>
            <p class="maintainer">Maintained by <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Extends GTFS by including deviated fixed routes and on-demand transportation service features in its data modeling that do not always follow the same for fixed stops.</li>
            <li>The proposal is composed of 2 extensions: GTFS-FlexibleTrips, which describes the service itself and GTFS-BookingRules, which provides the booking information of GTFS-FlexibleTrips.</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="http://bit.ly/gtfs-occupancies" class="no-icon" target="_blank">GTFS-Occupancies</a></h3>
            <p class="maintainer">Maintained by <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Describes a vehicle’s passenger crowdedness on a usual or projected basis.</li>
            <li>Supplements the availability of crowdedness information described in GTFS Realtime by offering static predictions for future trips based on previous trends, which can assist riders plan trips based on their crowdedness preferences and comfortability.</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://developers.google.com/transit/gtfs/reference/gtfs-extensions" class="no-icon" target="_blank">Google Transit Extensions to GTFS</a></h3>
            <p class="maintainer">Maintained by <a href="https://developers.google.com/transit" class="no-icon" target="_blank">Google</a></p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Provides translation support, extends route types, allows for more detailed transfer rules and adds a number of other functions.</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://www.transitwiki.org/TransitWiki/index.php/File:GTFS%2B_Additional_Files_Format_Ver_1.7.pdf" class="no-icon" target="_blank">MTC GTFS+</a></h3>
            <p class="maintainer">Maintained by <a href="https://mtc.ca.gov/" class="no-icon" target="_blank">MTC</a></p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Created by the San Francisco Bay Area Metropolitan Transportation Commission. Adds additional real time information, directions, rider categories and more.</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://github.com/mbta/gtfs-documentation/" class="no-icon" target="_blank">MBTA</a></h3>
            <p class="maintainer">Maintained by <a href="https://www.mbta.com/" class="no-icon" target="_blank">MBTA</a></p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds on-time performance tracking checkpoints, station and facility information and more.</li>
        </ul>
    </div>
    </div>
    <div class="row">
        <div class="leftcontainer">
                <h3 class="title"><a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">GTFS-Eligibilities</a></h3>
                <p class="maintainer">Maintained by <a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">the Oregon Department of Transportation</a></p>
        </div>
        <div class="featurelist">
            <p>GTFS-eligibilities is formed around the concept that it should provide a manner for systems operating based on user accounts to understand whether a trip is eligible based on user account information. This means the fields proposed provide:</p>
            <ul>
                <li>Common attributes associated with user accounts such as age, gender, company affiliation, trip purposes, and assistance levels provided.</li>
                <li>Customizable authentications of locally-defined attributes and statuses. Custom eligibilities are provided, as well as a way to understand how the custom eligibility can be authenticated.</li>
            </ul>
        </div>
    </div>
     <div class="row">
        <div class="leftcontainer">
                <h3 class="title"><a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">GTFS-Capabilities</a></h3>
                <p class="maintainer">Maintained by <a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">the Oregon Department of Transportation</a></p>
        </div>
        <div class="featurelist">
            <p>Describes the additional capabilities that a service may be able to provide to serve people with disabilities and those who have mobility devices.</p>
            <ul>
                <li>Information about services available to a rider from a person, such as a driver or other agency-provided human resource.</li>
                <li>Vehicle information, described by the (further extended) <a href="https://docs.google.com/document/d/156RiBjI6FnWJvO8_XWX11Q9nLdOiBdS_rilA-oamlv8/edit#heading=h.tosuo6e9e0z7">GTFS-VehicleCategories</a> specification. See also the <a href="https://docs.google.com/document/d/1mcQ-oEaP5WiGh46DmUQqmeS-rQ5W96L-c3TRKinGS0g/edit#heading=h.oxdoxruczgni">GTFS-seats</a> draft extension.</li>
                <li>A focus on describing vehicle amenities related to mobility devices, and how boarding with those devices affects capacity for other riders and devices.</li>
            </ul>
        </div>
    </div>
    <div class="row"></div>

=== "GTFS Realtime"

    Additional files and fields can be extended onto GTFS Realtime feeds to accommodate a variety of application-specific needs communicated between transit agencies and software vendors, even if these fields are not in the [official specification](../realtime/reference). 
    
    Below is a list of GTFS Realtime extensions that may be implemented. ➕
    
    !!! info "Making an extension official in the specification" 
        
        Extensions may become [active proposals](../realtime/changes/#active-proposals) and subsequently [merged](../realtime/changes/#recently-merged-proposals) into the official specification via the [Specification Amendment Process](../realtime/process).
    
    !!! note "Contributing to this list"

        Have an extension you want to share with the GTFS community? Request to add an extension to GTFS.org <a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">here</a>.

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://docs.google.com/document/d/1qJOTe4m_a4dcJnvXYt4smYj4QQ1ejZ8CvLBYzDM5IyM/edit#bookmark=id.av58okxmwekh" class="no-icon" target="_blank">GTFS-PathwayUpdates</a></h3>
            <p class="maintainer">Maintained by <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Describe changes to station pathways in real time such as elevator downtime or closed pathways.</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://github.com/google/transit/pull/212" class="no-icon" target="_blank">GTFS-OccupancyStatus</a></h3>
            <p class="maintainer">Maintained by <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Provide information in real time on the crowding of transit vehicles.</li>
        </ul>
    </div>
    </div>

    <div class="row"></div>

    ## Protobuf Extensions
    
    To allow producers to add custom information to a GTFS Realtime feed, we will take advantage of the [Extensions feature of Protocol Buffers](https://developers.google.com/protocol-buffers/docs/proto#extensions). Extensions allow us to define a namespace in a Protocol Buffer message where third-party developers can define additional fields without the need to modify the original proto definition.

    When possible we should avoid extensions and add fields useful to many agencies to the main specification to avoid fragmentation and extra work for consumers to support various extensions to the spec.  Before requesting an extension id, producers should propose adding the field to the specification (see [Adding new fields to GTFS Realtime](../realtime/process)).

    The extension IDs within the range 9000-9999 are reserved for private use by GTFS-rt producers. These IDs should only be used to convey information internally to your organization. Extensions in this range **must not** be used in public feeds. 

    To create a new extension, we will assign a producer the next available extension id, picked incrementally from a list of numbers starting at 1000 and going up and documented in the Extension Registry section found below.

    These assigned extension ids corresponds to the tag ids available in the "extension" namespace for each GTFS Realtime message definition. Now that the developer has an assigned extension id, they will use that id when extending any and all GTFS Realtime messages. Even if the developer only plans to extend a single message, the assigned extension id will be reserved for ALL messages.

    For a developer extending the spec, instead of adding a single field like a "string" or "int32" with their extension id, the preferred model is to define a new message like "MyTripDescriptorExtension", extend the underlying GTFS Realtime message with your new message, and then put all your new fields in there. This has the nice property that you can manage fields within your extension message however you want, without needing to reserve a new extension id from the master list.

    ```protobuf
    message MyTripDescriptorExtension {
      optional string some_string = 1;
      optional bool some_bool = 2;
      ...
    }
    extend transit_realtime.TripDescriptor {
      optional MyTripDescriptorExtension my_trip_descriptor = YOUR_EXTENSION_ID;
    }
    ```

    When creating extensions, developers should follow the [Protocol Buffers Language Guide](https://developers.google.com/protocol-buffers/docs/proto). A common mistake is re-using an extension field number. In the [Assigning Field Numbers section](https://developers.google.com/protocol-buffers/docs/proto#assigning-field-numbers), the Language Guide says:

    > Each field in the message definition has a unique number. These numbers are used to identify your fields in the message binary format, and should not be changed once your message type is in use.

    For example, in the first example `some_string` was assigned field number `1`. When the developer no longer wishes to use `some_string`, or when `some_string` has been adopted in the official GTFS Realtime spec and there is no need for the extension, the developer cannot re-use field number `1` for a new field. Instead, the developer should deprecate the field and use a new number for the new field:
    ```protobuf
    message MyTripDescriptorExtension {
      optional string some_string = 1 [deprecated=true];
      optional bool some_bool = 2;
      optional string some_new_string = 3;
      ...
    }
    ```

    ### Extension Registry

    |Extension ID|Developer|Contact|Details|
    |------------|---------|-------|-------|
    |1000|OneBusAway|[onebusaway-developers](https://groups.google.com/group/onebusaway-developers)|https://github.com/OneBusAway/onebusaway/wiki/GTFS-Realtime-Resources|
    |1001|New York City MTA|[mtadeveloperresources](https://groups.google.com/group/mtadeveloperresources)|https://mta.info/developers/|
    |1002|Google|[transit-realtime-partner-support@google.com](mailto:transit-realtime-partner-support@google.com)|Google Maps Live Transit Updates|
    |1003|OVapi|gtfs-rt at ovapi.nl|https://gtfs.ovapi.nl|
    |1004|Metra|[William Ashbaugh <w.l.ashbaugh@gmail.com>](mailto:w.l.ashbaugh@gmail.com)|
    |1005|Metro-North Railroad|[John Larsen](mailto:mnrappdev@mnr.org)|
    |1006|realCity|[David Varga](mailto:transit@realcity.io)|https://realcity.io|
    |1007|Transport for NSW|[timetable@transport.nsw.gov.au](mailto:timetable@transport.nsw.gov.au)|[Group discussion](https://groups.google.com/forum/#!msg/gtfs-realtime/WYwIs4Hd_E0/PbkMnELUAwAJ)|
    |1008|SEPTA - Southeastern Pennsylvania Transportation Authority|[Gregory Apessos](mailto:GApessos@septa.org)|https://github.com/septadev|
    |1009|Swiftly|[mike@goswift.ly](mailto:mike@goswift.ly)|[Group Discussion](https://groups.google.com/forum/#!msg/gtfs-realtime/mmnZV6L-2ls/wVWdknhLBwAJ)|
    |1010|IBI Group|[Ritesh Warade](mailto:transitrealtime@ibigroup.com)|[GitHub proposal for new timestamps in Service Alerts](https://github.com/google/transit/pull/134)|
    |1013|MITFAHR\|DE\|ZENTRALE (MFDZ)|[Holger Bruch](mailto:holger.bruch@mfdz.de)|[Group discussion](https://groups.google.com/g/gtfs-realtime/c/IxYh-beoNoo)|
    |9000-9999|RESERVED - INTERNAL USE ONLY|[GTFS Community](https://groups.google.com/forum/#!forum/gtfs-realtime)|[Group discussion](https://github.com/google/transit/pull/178/)|

For more information, contact [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org)
