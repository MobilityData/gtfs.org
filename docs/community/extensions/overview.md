# Extensions

<!-- GTFS is a community driven data format. Users can propose and vote on changes. For detailed information see the [GTFS Schedule](../schedule/process) and [GTFS Realtime](../realtime/process) amendment process.

Extensions that are currently in development can be found on MobilityData's [roadmap](https://mobilitydata.org/roadmaps/#transit).

Extension proposals can be found in the following places:

- MobilityData maintains a [portal with a list of GTFS extension proposals](https://mobilitydata.org/roadmaps/#transit). The roadmap is based on their members' prioritization. You can contribute ideas or extensions via the portal.
- TransitWiki.org contains a [list GTFS extension projects](https://www.transitwiki.org/TransitWiki/index.php/General_Transit_Feed_Specification#GTFS_Extensions).

For more information, contact [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) -->

=== "GTFS Schedule"

    Additional files and fields can be extended onto GTFS Schedule datasets to accommodate a variety of application-specific needs communicated between transit agencies and software vendors, even if these fields are not in the [official specification](../../../documentation/schedule/reference). 
    
    Below is a list of GTFS Schedule extensions that may be implemented.
    
    !!! info "Making an extension official in the specification" 

        Extensions may become active proposals and subsequently [merged](../../../documentation/schedule/recent additions/#recently-merged-proposals) into the official specification via the [Specification Amendment Process](../../community/spec_amendment_process/gtfs_schedule_amendment_process.md).

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
            <a href="/../../../community/extensions/fares-v2" class="no-icon" target="_blank"><h3 class="title">GTFS-Fares v2</h3></a>
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
            <a href="/../../../community/extensions/flex" class="no-icon" target="_blank"><h3 class="title">GTFS-Flex</h3></a>
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

    Additional files and fields can be extended onto GTFS Realtime feeds to accommodate a variety of application-specific needs communicated between transit agencies and software vendors, even if these fields are not in the [official specification](../../../documentation/realtime/reference). 
    
    Below is a list of GTFS Realtime extensions that may be implemented.
    
    !!! info "Making an extension official in the specification" 
        
        Extensions may become active proposals and subsequently [merged](../../../documentation/realtime/recent additions/#recently-merged-proposals) into the official specification via the [Specification Amendment Process](../../community/spec_amendment_process/gtfs_realtime_amendment_process.md).
    
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

For more information, contact [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org)
