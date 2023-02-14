---
search:
  exclude: true
---
# GTFS Schedule Änderungen

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

Die GTFS ist nicht in Stein gemeißelt. Vielmehr handelt es sich um eine offene Spezifikation, die von der Gemeinschaft der Verkehrsunternehmen, Entwickler und anderen Beteiligten, die GTFS verwenden, entwickelt und gepflegt wird. Es wird erwartet, dass diese Gemeinschaft von Produzenten und Nutzern von GTFS Vorschläge zur Erweiterung der Spezifikation unterbreiten wird, um neue Funktionen zu ermöglichen.

Um zu GTFS beizutragen, lesen Sie den [Specification Amendment Process](../process) und verfolgen Sie die Diskussionen in den offenen [Fragen](https://github.com/google/transit/issues) und [Pull-Anforderungen](https://github.com/google/transit/pulls) auf Googles Transit Github Repository[(google/transit](https://github.com/google/transit)). ![](../../assets/mark-github.svg)

!!!note ""

    Die offizielle Spezifikation, Referenz und Dokumentation sind in englischer Sprache verfasst. Weicht eine Übersetzung in eine andere Sprache vom englischen Original ab, hat letztere Vorrang. Die gesamte Kommunikation erfolgt in englischer Sprache.


## Aktive Proposals &ensp; <img src="../../assets/pr-active.svg" style="height:1em;"/>

<!--
Active proposals for new features in <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.  -->

Beteiligen Sie sich an den Diskussionen auf [Github](https://github.com/google/transit/pulls)!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add <glossary variable="trip">trip</glossary>-to-<glossary variable="trip">trip</glossary> transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull-anfrage</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Kürzlich zusammengefasste Vorschläge &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Kürzlich zusammengeführte Vorschläge, die nun Bestandteil der [offiziellen GTFS Schedule](../reference) sind. Siehe die vollständige [Revisionshistorie](../process#revision-history) für weitere Informationen.

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">Hinzufügen von trip mit Sitzplatzoption</a></h3>
        <p class="maintainer">#303 von <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> wurde zusammengeführt am 26. Juni 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Fügt neue <code>transfer_type</code>'s für trip hinzu, um zu definieren, ob ein Benutzer einen "Übertragung im Sitz" durchführen kann, wenn dasselbe vehicle zwei aufeinanderfolgende Fahrten durchführt und der Benutzer an Bord bleiben kann</li>
            <li>Es kann definiert werden, wann Transfers auf dem Sitzplatz nicht erlaubt sind, aber zwei verschiedene Fahrten betrieblich miteinander verbunden werden können.
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank">GTFS Fares V2 Basis-Implementierung</a></h3>
        <p class="maintainer">#286 von <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> wurde am 17. Mai 2022 zusammengeführt</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Transit-Tarife und Fahrkarten</li>
            <li>Kostenmodellierung für komplexe Tarife und Transfers (netzübergreifende, time und zählbasierte Transfers)</li>
            <li>Modell zur Zuordnung von Haltestellen zu Tarifgebieten</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">trip und Strecke-zu-Strecke-Transfers</a></h3>
        <p class="maintainer">#284 von <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> wurde am 5. Oktober 2021 zusammengeführt</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Spezifizieren Sie Regeln für Transfers zwischen Haltestellen-, trip oder Routenpaaren in transfers.txt</li>
             <li>Gestufte Spezifität der Transferregeln basierend auf verschiedenen Paaranordnungen</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3>
        <p class="maintainer">#208 von <a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a> wurde am 13. Mai 2020 eingefügt.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Erlaubt das Aufnehmen oder Absetzen von Fahrgästen an jeder beliebigen Stelle entlang des Fahrweges eines vehicle</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3>
        <p class="maintainer">#180 von <a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a> wurde zusammengeführt am 9. Januar 2020</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Übersetzungen für text, lokalisierte URLs und Kontaktinformationen</li>
        </ul>
    </div>
</div>

<div class="row"/>
