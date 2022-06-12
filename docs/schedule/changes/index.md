# GTFS Schedule Changes

<div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div>

The GTFS Specification is not set in stone. Instead, it is an open specification developed and maintained by the community of transit agencies, developers, and other stakeholders who use GTFS. It is expected that this community of producers and consumers of GTFS data will have proposals for extending the spec to enable new capabilities. To learn more, read the Specification Amendment Process.

<!-- 
### **Recently Merged Proposals** &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Recently merged proposals that are now part of the official specification.

<hr>

<div>
    <strong>GTFS-Fares v2 base implementation</strong>
    <p>London is the capital city of England.</p>
    <hr>
    <strong>GTFS-Fares v2 base implementation</strong>
    <p>London is the capital city of England.</p>
</div>

<hr> -->

## Active Proposals &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<table>
<tr>
<td class="title">
 <div>
    <h3><a></a></h3>
    <p><a></a></p>
    </div>
</td>
<td class="features">
    <ul>
    <li></li>
    <li></li>
    <li></li>
    </ul>
    </td>
</tr>
<tr>
<td class="title">
 <div>
    <h3><a></a></h3>
    <p><a></a></p>
    </div>
</td>
<td class="features">
    <ul>
    <li></li>
    <li></li>
    <li></li>
    </ul>
    </td>
</tr>
</table>

## Recently Merged Proposals &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Recently merged proposals that are now official features of GTFS Schedule. See the complete revision history here.

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

<!-- 
<div class="row">
    <div class="left">
    <h3>Lorem Ipsum</h3>
    <p class="maintainer">Maintained by <a>MobilityData</a></p>
    </div>
    <ul class="right">
    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
    </ul>
</div>
<div class="row">
    <div class="left">
    <h3>Lorem Ipsum</h3>
    <p class="maintainer">Maintained by <a>MobilityData</a></p>
    </div>
    <ul class="right">
    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
    </ul>
</div> -->


<!-- <style>
    .row {
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
    }

    .row > .left > h3 {
        vertical-align: top !important;
    }

    .maintainer {
        font-size: 0.75em;
        color:#717171;
        line-height: 0em;
    }
    .left {
        align: left;
        white-space: nowrap;
    }
    .right {
        font-size: 0.8em;
        padding-left: 100px !important;
        flex-wrap: wrap;
    }
    
</style> -->