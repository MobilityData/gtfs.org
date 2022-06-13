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

## Recently Merged Proposals &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Recently merged proposals that are now features of the [official GTFS Schedule specification](../reference). See the complete [Revision History](../process#revision-history) for more.

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

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/192" class="no-icon" target="_blank">GTFS-Attributions (core only)</a></h3>
        <p class="maintainer">#192 by <a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a> was merged on Dec 20, 2019</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Allows attributions by name of producers, operators, or authorities of a GTFS Schedule dataset per field, row, or value</li>
        </ul>
    </div>
</div>

<div class="row"></div>

## Active Proposals &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

Active proposals for new features in GTFS Schedule. Join the discussions on <a href="https://github.com/google/transit" target="_blank">Github</a>!

<div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add trip-to-trip transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/76" target="_blank">Add *_icon_url to facilitate icons on maps and itineraries</a></h3>
        <p class="maintainer">#76 opened on Sep 29, 2017 by <a class="no-icon" href="https://github.com/skinkie" target="_blank">skinkie</a></p>
    </div>
</div>
<div class="row"></div>

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for GTFS Schedule.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->