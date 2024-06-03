# GTFS Realtime Changes

The GTFS Realtime Reference is not set in stone. Instead, it is an open specification developed and maintained by the community of transit agencies, developers, and other stakeholders who use GTFS Realtime. It is expected that this community of producers and consumers of GTFS Realtime data will have proposals for extending the spec to enable new capabilities.

To contribute to GTFS Realtime, read the [GTFS Realtime Amendment Process](../../../../community/governance/gtfs_realtime_amendment_process) and follow the discussions in the open <a href="https://github.com/google/transit/issues" target="_blank">issues</a> and <a href="https://github.com/google/transit/pulls" target="_blank">pull requests</a> on the GTFS Github repository (<a href="https://github.com/google/transit" target="_blank">google/transit</a>). ![](../../../assets/mark-github.svg)

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

## Recently Adopted Proposals &ensp;<img src="../../../../assets/pr-merged.svg" style="height:1em;"/>

Recently merged proposals that are now features of the [official GTFS Realtime reference](../../reference). See the complete [Revision History](/documentation/Realtime/change_history/revision_history) for more.


<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/403" class="no-icon" target="_blank">Add Trip-Modifications</a></h3>
        <p class="maintainer">#332 by <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> was merged on Mar 11, 2024</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds Trip modifications as an experimental feature which is used to describe detours, which affect a set of trips.</li>
            <li>A trip modification can cancel certain stops, adjust the timing for trips, provide a new shape that trips will take and provide the location of temporary stops along the way. </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/352" class="no-icon" target="_blank">Add DELETED enum to schedule_relationship</a></h3>
        <p class="maintainer">#332 by <a href="https://github.com/mads14" class="no-icon" target="_blank">mads14</a> was merged on Nov 30, 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adds a new experimental <code>DELETED</code> trip schedule_relationship enum</li>
            <li>This can be used to convey that a transit provider intends for a trip to entirely disappear from public-facing applications</li>
        </ul>
    </div>
</div>

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
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt: wheelchair access update</a></h3>
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

<div class="row"></div>
