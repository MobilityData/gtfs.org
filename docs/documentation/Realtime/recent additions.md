<a class="pencil-link" href="https://github.com/google/transit/edit/master/gtfs-realtime/CHANGES.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# GTFS Realtime Changes

The GTFS Realtime Specification is not set in stone. Instead, it is an open specification developed and maintained by the community of transit agencies, developers, and other stakeholders who use GTFS Realtime. It is expected that this community of producers and consumers of GTFS Realtime data will have proposals for extending the spec to enable new capabilities.

To contribute to GTFS Realtime, read the [Specification Amendment Process](../process) and follow the discussions in the open <a href="https://github.com/google/transit/issues" target="_blank">issues</a> and <a href="https://github.com/google/transit/pulls" target="_blank">pull requests</a> on Google's Transit Github repository (<a href="https://github.com/google/transit" target="_blank">google/transit</a>). ![](../../assets/mark-github.svg)


!!! note ""

	The official specification, reference and documentation are written in English. If a translation to a different language differs from the English original, the latter takes precedence. All communication is performed in English.

<!-- <br><div class="landing-page">
    <a class="button" href="../process">Specification Amendment Process</a><a class="button" href="../guiding-principles">Guiding Principles</a><a class="button" href="../revision-history">Revision History</a><a class="button" href="../extensions">Realtime Extensions</a>
</div> -->

## Active Proposals &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- Active proposals for new features in GTFS Realtime.  -->

Join the discussions on <a href="https://github.com/google/transit/pulls" target="_blank">Github</a> !

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Add cause_detail and effect_detail to Alerts</a></h3>
        <p class="maintainer">#332 opened on May 31, 2022 by <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for GTFS Realtime.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Recently Merged Proposals &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Recently merged proposals that are now features of the [official GTFS Realtime specification](../reference). See the complete [Revision History](../process#revision-history) for more.


<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Add cause_detail and effect_detail to Alerts</a></h3>
        <p class="maintainer">#332 by <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> was merged on Jun 26, 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds descriptions to cause and effects of Alerts</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : wheelchair access update</a></h3>
        <p class="maintainer">#340 by <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> was merged on Jul 25, 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds realtime information on trip accessibility</li>
            <li>If provided, overwrites <code>trips.wheelchair_accessible</code> in the GTFS Schedule dataset</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Feature/image in alerts</a></h3>
        <p class="maintainer">#283 by <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> was merged on Nov 26, 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds a field of a URL link to an image (ex. photo or map) to be displayed in apps’ service alerts, in order to enhance comprehension of the alert</li>
            <li>Changes include: enforced size limit of image, one image per alert, and ensuring URL changes if the content or language of the images changes</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">Add GTFS-NewShapes as experimental</a></h3>
        <p class="maintainer">#272 by <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> was merged on Aug 30, 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Ability to update route shapes in real time to reflect detours</li>
            <li>Route updates are either reflected by referencing an existing <code>shape_id</code> or by defining in real time a new shape as an encoded polyline</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">Add departure_occupancy_status to TripUpdate</a></h3>
        <p class="maintainer">#260 by <a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a> was merged on Apr 14, 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Provide the predicted occupancy of transit vehicles at future stops based on current or historical data</li>
        </ul>
    </div>
</div>

<div class="row"></div>