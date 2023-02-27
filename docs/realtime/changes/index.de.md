# GTFS Realtime Änderungen

Die GTFS-Realtime Spezifikation ist nicht in Stein gemeißelt. Vielmehr handelt es sich um eine offene Spezifikation, die von der Gemeinschaft der Verkehrsunternehmen, Entwickler und anderen Beteiligten, die GTFS Realtime nutzen, entwickelt und gepflegt wird. Es wird erwartet, dass diese Gemeinschaft von Produzenten und Konsumenten von GTFS Realtime Daten Vorschläge zur Erweiterung der Spezifikation machen wird, um neue Funktionen zu ermöglichen.

Wenn Sie einen Beitrag zu GTFS Realtime leisten möchten, lesen Sie den [Prozess zur Änderung der Spezifikation](../process) und verfolgen Sie die Diskussionen in den offenen [Fragen](https://github.com/google/transit/issues) und [Pull-Requests](https://github.com/google/transit/pulls) im Transit-Github-Repository von Google[(google/transit](https://github.com/google/transit)). ![](../../assets/mark-github.svg)

!!! note ""

    Die offizielle Spezifikation, Referenz und Dokumentation sind in englischer Sprache verfasst. Weicht eine Übersetzung in eine andere Sprache vom englischen Original ab, hat letztere Vorrang. Die gesamte Kommunikation erfolgt in englischer Sprache.

<!-- <br><div class="landing-page">
    <a class="button" href="../process">Prozess zur Änderung der Spezifikation</a><a class="button" href="../guiding-principles">Leitprinzipien</a><a class="button" href="../revision-history">Historie der Revision</a><a class="button" href="../extensions">Echtzeit-Erweiterungen</a>
</div> -->

## Laufende Änderungsvorschläge &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- Aktive Vorschläge für neue Funktionen in GTFS Realtime.  -->

Beteiligen Sie sich an den Diskussionen auf [Github](https://github.com/google/transit/pulls)!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Hinzufügen von cause_detail und effect_detail zu Alerts</a></h3>
        <p class="maintainer">#332 eröffnet am 31. Mai 2022 von <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">Derzeit gibt es keine aktiven Vorschläge für GTFS Realtime.</h3>
        <p class="prompt">Haben Sie einen Vorschlag? &ensp;➜&ensp; Öffnen Sie eine <a href="https://github.com/google/transit/pulls" target="_blank">Pull-Anfrage</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Kürzlich angenommene Vorschläge &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Kürzlich angenommene Vorschläge, die nun Bestandteil der [offiziellen GTFS Realtime-Spezifikation](../reference) sind. Weitere Informationen finden Sie in der vollständigen [Revisionshistorie](../process#revision-history).

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Hinzufügen von cause_detail und effect_detail zu Alerts (#332)</a></h3>
        <p class="maintainer">Die Änderungen von #332 aus <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> wurden am 26. Juni 2022 übernommen.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Fügt Beschreibungen zu Ursache und Wirkung von Alerts hinzu</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : Aktualisierung des Rollstuhlzugangs</a></h3>
        <p class="maintainer">Die Änderungen von #340 aus <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> wurden am 25. Juli 2022 übernommen.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Fügt Echtzeitinformationen über die Zugänglichkeit von Fahrten hinzu</li>
            <li>Überschreibt, falls vorhanden, <code>trips.wheelchair_accessible</code> im GTFS Schedule Dataset</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Feature/Bild in Warnungen</a></h3>
        <p class="maintainer">#283 von <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> wurde am 26. November 2021 eingefügt</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Fügt ein Feld für einen URL-Link zu einem Bild (z. B. ein Foto oder eine Karte) hinzu, das in Servicemeldungen von Apps angezeigt werden kann, um das Verständnis der Meldung zu verbessern.</li>
            <li>Folgende Änderungen wurden vorgenommen: Erzwungene Größenbeschränkung des Bildes, ein Bild pro Meldung und Sicherstellung, dass sich die URL ändert, wenn sich der Inhalt oder die Sprache der Bilder ändert</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">GTFS-NewShapes als experimentell hinzufügen</a></h3>
        <p class="maintainer">#272 von <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> wurde am 30. August 2021 eingefügt</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Möglichkeit, Routenformen in Echtzeit zu aktualisieren, um Umleitungen zu berücksichtigen</li>
            <li>Routenaktualisierungen werden entweder durch Verweis auf eine bestehende <code>shape_id</code> oder durch Definition einer neuen Form als kodierte Polylinie in Echtzeit reflektiert</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">Hinzufügen von departure_occupancy_status zu TripUpdate</a></h3>
        <p class="maintainer">Die Änderungen von #260 aus <a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a> wurden am 14. April 2021 übernommen.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Liefert die voraussichtliche Belegung von Transitfahrzeugen an zukünftigen Haltestellen auf der Grundlage aktueller oder historischer Daten</li>
        </ul>
    </div>
</div>

<div class="row"/>
