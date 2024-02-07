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

## Recently Merged Proposals &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Recently merged proposals that are now features of the [official GTFS Schedule specification](../reference). See the complete [Revision History](../process#revision-history) for more.

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

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">Trip-to-trip and route-to-route transfers</a></h3>
        <p class="maintainer">#284 by <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> was merged on Oct 5, 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Specify rules for transfers between stop, trip or route pairs in transfers.txt</li>
             <li>Ranked specificity of transfer rules based on different pair arrangements</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3>
        <p class="maintainer">#208 by <a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a> was merged on May 13, 2020</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Allows rider pickup or dropoff anywhere along a vehicle’s travel path</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3>
        <p class="maintainer">#180 by <a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a> was merged on Jan 9, 2020</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Translations for text fields, localized URLs, and contact information</li>
        </ul>
    </div>
</div>

<div class="row"></div>
