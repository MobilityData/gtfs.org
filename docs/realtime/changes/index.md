<a class="pencil-link" href="https://github.com/google/transit/edit/master/gtfs-realtime/CHANGES.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# GTFS Realtime Changes

The GTFS Realtime Specification is not set in stone. Instead, it is an open specification developed and maintained by the community of transit agencies, developers, and other stakeholders who use GTFS Realtime. It is expected that this community of producers and consumers of GTFS Realtime data will have proposals for extending the spec to enable new capabilities. To help manage that process, the following procedures and guidelines have been established.

The official specification, reference and documentation are written in English. If a translation to a different language differs from the English original, the latter takes precedence. All communication is performed in English.

<br><div class="landing-page">
    <a class="button" href="../process">Specification Amendment Process</a><a class="button" href="../guiding-principles">Guiding Principles</a><a class="button" href="../revision-history">Revision History</a><a class="button" href="../extensions">Realtime Extensions</a>
</div>

## Active Proposals &ensp;<img src="../assets/pr-active.svg" style="height:1em;"/>

## Recently Merged Proposals &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Recently merged proposals that are now official features of GTFS Realtime. See the complete revision history here.

<table>
<tr>
<td class="title">
 <div>
    <h3><a>GTFS-Fares v2 base implementation</a></h3>
    <p>#286 by <a>scmcca</a> was merged on May 17, 2022</p>
    </div>
</td>
<td class="features">
    <ul>
    <li>Transit fares and tickets</li>
    <li>Cost modelling for complex fares and transfers (multi-network, time-based, and count-based transfers)</li>
    <li>Model to associate stops to fare areas</li>
    </ul>
    </td>
</tr>
<tr>
<td class="title">
 <div>
    <h3><a>Trip-to-trip and route-to-route transfers</a></h3>
    <p>#284 by <a>scmcca</a> was merged on Oct 5, 2021</p>
    </div>
</td>
<td class="features">
    <ul>
    <li>Specify rules for transfers between stop, trip or route pairs in transfers.txt</li>
    <li>Ranked specificity of transfer rules based on different pair arrangements</li>
    </ul>
    </td>
</tr>
<tr>
<td class="title">
 <div>
    <h3><a>GTFS-ContinuousStops</a></h3>
    <p>#208 by <a>timMillet</a> was merged on May 13, 2020</p>
    </div>
</td>
<td class="features">
    <ul>
    <li>Allows rider pickup or dropoff anywhere along a vehicle’s travel path</li>
    </ul>
    </td>
</tr>
<tr>
<td class="title">
 <div>
    <h3><a>GTFS-Attributions (core only)</a></h3>
    <p>#192 by <a>timMillet</a> was merged on Dec 20, 2019</p>
    </div>
</td>
<td class="features">
    <ul>
    <li>Allows attributions by name of producers, operators, or authorities of a GTFS Schedule dataset per field, row, or value</li>
    </ul>
    </td>
</tr>
<tr>
<td class="title">
 <div>
    <h3><a>GTFS-Translations</a></h3>
    <p>#180 by <a>LeoFrachet</a> was merged on Jan 9, 2020</p>
    </div>
</td>
<td class="features">
    <ul>
    <li>Translations for text fields, localized URLs, and contact information</li>
    </ul>
    </td>
</tr>
</table>



<style>

    .title > div {
        /* padding-top: 0 !important; */
        margin-top: -25px !important;
    }

    .title > div > h3 > a , .title > div > h3 > a:hover {
        font-weight: bold !important;
        color: unset;
    }

    .title > div > p {
        font-size: 0.8em;
        color: #717171;
    }

    .features > ul > li {
        font-size: 0.9em;
    }

    .features > ul {
        padding-left: 40px !important;
        margin-top: 5px !important;
    }

    tr:hover {
        background-color: unset !important;
    }

</style>
