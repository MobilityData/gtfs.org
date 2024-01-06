<a class="pencil-link" href="https://github.com/google/transit/edit/master/gtfs/CHANGES.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# GTFS Schedule Changes

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

The GTFS Specification is not set in stone. Instead, it is an open specification developed and maintained by the community of transit agencies, developers, and other stakeholders who use GTFS. It is expected that this community of producers and consumers of GTFS data will have proposals for extending the spec to enable new capabilities.

To contribute to GTFS, read the [Specification Amendment Process](../process) and follow the discussions in the open <a href="https://github.com/google/transit/issues" target="_blank">issues</a> and <a href="https://github.com/google/transit/pulls" target="_blank">pull requests</a> on Google's Transit Github repository (<a href="https://github.com/google/transit" target="_blank">google/transit</a>). ![](../../assets/mark-github.svg)

!!! note ""

	The official specification, reference and documentation are written in English. If a translation to a different language differs from the English original, the latter takes precedence. All communication is performed in English.

## Active Proposals &ensp; <img src="../../assets/pr-active.svg" style="height:1em;"/>
<!-- 
Active proposals for new features in GTFS Schedule.  -->

Join the discussions on <a href="https://github.com/google/transit/pulls" target="_blank">Github</a> !

## Recently Merged Proposals &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Recently merged proposals that are now features of the [official GTFS Schedule specification](../reference). See the complete [Revision History](../process#revision-history) for more.

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
        <h3 class="title"><a href="https://github.com/google/transit/pull/406" class="no-icon" target="_blank">Best Practices: Add Dataset Publishing guidelines and Practice Recommendations for all files</a></h3>
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
            <li>Time-variable fares is an important functionality developed as part of the <a href="../../extensions/fares-v2">GTFS Fares-v2 extension proposal</a></li>
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
            <li>Fare Media is a key element on the <a href="../../extensions/fares-v2">GTFS Fares-v2 extension proposal</a></li>
            <li>It represents what a rider can use to validate their ride (e.g. a transit card, mobile app, or tap-to-pay using a contactless bank card)</li>
            <li>A fare product can be associated to a specific Fare Media (e.g. a monthly pass is only available on a transit card)</li>
            <li>The price of a fare product can be defined based on the Fare Media (e.g. the ticket is cheaper if bought via a mobile app)</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">Add trip-to-trip transfers with in-seat option</a></h3>
        <p class="maintainer">#303 by <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> was merged on Jun 26, 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds new <code>transfer_type</code>`s for trip to trip transfers to define if a user can do an "in seat transfer" when the same vehicle is operating two consecutive trips and the user can stay onboard</li>
            <li>Can define when in-seat transfers aren't allowed but can link together two different trips operationally
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank">GTFS-Fares v2 base implementation</a></h3>
        <p class="maintainer">#286 by <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> was merged on May 17, 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Transit fares and tickets</li>
            <li>Cost modelling for complex fares and transfers (multi-network, time-based, and count-based transfers)</li>
            <li>Model to associate stops to fare areas</li>
        </ul>
    </div>
</div>

<div class="row"></div>
