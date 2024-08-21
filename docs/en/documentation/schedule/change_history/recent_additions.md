# GTFS Schedule Changes

The GTFS Schedule Reference is not set in stone. Instead, it is an open specification developed and maintained by the community of transit agencies, developers, and other stakeholders who use GTFS. It is expected that this community of producers and consumers of GTFS data will have proposals for extending the spec to enable new capabilities.

To contribute to GTFS, read the [GTFS Schedule Amendment Process](../../../../community/governance/gtfs_schedule_amendment_process) and follow the discussions in the open <a href="https://github.com/google/transit/issues" target="_blank">issues</a> and <a href="https://github.com/google/transit/pulls" target="_blank">pull requests</a> on the GTFS Github repository (<a href="https://github.com/google/transit" target="_blank">google/transit</a>). ![](../../../assets/mark-github.svg)

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add trip-to-trip transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for GTFS Schedule.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Recently Adopted Proposals &ensp;<img src="../../../../assets/pr-merged.svg" style="height:1em;"/>

Recently merged proposals that are now features of the [official GTFS Schedule Reference](../../reference). See the complete [Revision History](../revision_history) for more.

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/433" class="no-icon" target="_blank">Adopt GTFS Flex</a></h3>
        <p class="maintainer">#433 by <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> was merged on Mar 19, 2024</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>The <a href="../../../../community/extensions/flex" class="no-icon" target="_blank">GTFS-Flex proposal</a> allows passengers to discover demand-responsive services on trip planners</li>
	    <li>Multiple files have been added to the specification, including locations.geojson which integrates GeoJson in GTFS  </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/405" class="no-icon" target="_blank">Add networks.txt & route_networks.txt</a></h3>
        <p class="maintainer">#406 by <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> was merged on Nov 28, 2023</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds two new files: <code>networks.txt</code> and <code>route_networks.txt</code> to build networks of routes that are associated to fares</li>
	    <li>Provides an alternative to <code>routes.network_id</code> so that schedule and fare files can be distinct</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/406" class="no-icon" target="_blank">Best Practices: Add Dataset Publishing guidelines<br>and Practice Recommendations for all files</a></h3>
        <p class="maintainer">#406 by <a href="https://github.com/Sergiodero" class="no-icon" target="_blank">Sergiodero</a> was merged on Nov 16, 2023</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds two sections of the GTFS Best Practices to the specification: Dataset Publishing guidelines and Practice Recommendations for all files</li>
            <li>Updates a reference to Google’s transitfeed tool merge function, so it references a list of merge tools instead</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/386" class="no-icon" target="_blank">Best practices: add recommended presence</a></h3>
        <p class="maintainer">#386 by <a href="https://github.com/emmambd" class="no-icon" target="_blank">emmambd</a> was merged on Aug 1, 2023</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds a new Recommended presence in the specification that conforms to RFC conventions</li>
            <li>Allows to clearly state that a field or file is not required, but adding it is a best practice that should be considered</li>
            <li>Updates information for multiple files and fields to reflect their recommended presence based on GTFS Best Practices</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/357" class="no-icon" target="_blank">Add variable fares by time or day</a></h3>
        <p class="maintainer">#357 by <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> was merged on Jul 27, 2023</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Time-variable fares is an important functionality developed as part of the <a href="../../../../community/extensions/fares-v2">GTFS Fares-v2 extension proposal</a></li>
            <li>Allows to represent fares differentiated based on the time of the day or the day of the week, such as peak and off-peak fares</li>
            <li>Adds a new file: <code>timeframes.txt</code>, to define moments in time where the fare applies</li>
            <li>Extends <code>fare_leg_rules.txt</code> with <code>from_timeframe_id</code>, and <code>to_timeframe_id</code> to specify that a fare leg rule applies only if the beginning or end of the leg is in a specified timeframe</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/355" class="no-icon" target="_blank">Add fare media</a></h3>
        <p class="maintainer">#355 by <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> was merged on Mar 14, 2023</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Fare Media is a key element on the <a href="../../../../community/extensions/fares-v2">GTFS Fares-v2 extension proposal</a></li>
            <li>It represents what a rider can use to validate their ride (e.g. a transit card, mobile app, or tap-to-pay using a contactless bank card)</li>
            <li>A fare product can be associated to a specific Fare Media (e.g. a monthly pass is only available on a transit card)</li>
            <li>The price of a fare product can be defined based on the Fare Media (e.g. the ticket is cheaper if bought via a mobile app)</li>
        </ul>
    </div>
</div>

<div class="row"></div>