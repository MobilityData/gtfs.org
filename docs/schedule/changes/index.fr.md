---
search:
  exclude: true
---

# Modifications du GTFS Schedule

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

La spécification GTFS n'est pas gravée dans la pierre. Il s'agit plutôt d'une spécification ouverte développée et maintenue par la communauté des agences de transport, des développeurs et des autres parties prenantes qui utilisent GTFS. On s'attend à ce que cette communauté de producteurs et de consommateurs de données GTFS ait des propositions pour étendre la spécification afin de permettre de nouvelles capacités.

Pour contribuer à GTFS, lisez le [processus de modification des spécifications](../process) et suivez les discussions dans les [questions](https://github.com/google/transit/issues) ouvertes et les [demandes de retrait](https://github.com/google/transit/pulls) sur le dépôt Github Transit de Google[(google/transit](https://github.com/google/transit)). ![](../../assets/mark-github.svg)

!!! note ""

    La spécification, la référence et la documentation officielles sont rédigées en anglais. Si une Translation dans une autre langue diffère de l'original anglais, c'est ce dernier qui prévaut. Toute communication est effectuée en anglais.


## Propositions actives![](../../assets/pr-active.svg)

<!--
Active proposals for new features in <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> <glossary variable="Schedule">Schedule</glossary></glossary>.  -->

Rejoignez les discussions sur [Github](https://github.com/google/transit/pulls)!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add <glossary variable="trip">trip</glossary>-to-<glossary variable="trip">trip</glossary> transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> <glossary variable="Schedule">Schedule</glossary></glossary>.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Propositions récemment fusionnées![](../../assets/pr-merged.svg)

Propositions récemment fusionnées qui sont maintenant des caractéristiques de la [spécification officielle du GTFS Schedule](../reference). Consultez l'[historique complet des révisions](../process#revision-history) pour en savoir plus.

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">Ajouter les transferts de trip avec l'option "in-seat".</a></h3>
        <p class="maintainer">#303 par <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> a été fusionné le 26 juin 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Ajoute de nouveaux <code>transfer_type</code>'s pour les transferts de trip à trip pour définir si un utilisateur peut faire un "transfert dans le siège" lorsque le même vehicle effectue deux voyages consécutifs et que l'utilisateur peut rester à bord.</li>
            <li>Permet de définir les cas où le transfert à la place de l'usager n'est pas autorisé mais où il peut relier deux trajets différents de manière opérationnelle.
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank">Implémentation de la base GTFS-Fares V2</a></h3>
        <p class="maintainer">#Le numéro 286 de <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> a été fusionné le mai 17, 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Tarifs et billets de transport en commun</li>
            <li>Modélisation des coûts pour les tarifs et les transferts complexes (transferts multi-réseaux, time et le nombre de passagers).</li>
            <li>Modèle permettant d'associer les arrêts aux zones tarifaires</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">Transferts de trip et d'itinéraire à itinéraire</a></h3>
        <p class="maintainer">#284 par <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> a été fusionné le 5 oct. 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Spécifier les règles pour les transferts entre paires d'arrêts, de trip ou de routes dans transfers.txt</li>
             <li>Classement de la spécificité des règles de transfert en fonction des différents arrangements de paires</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3>
        <p class="maintainer">#208 par <a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a> a été fusionné le mai 13, 2020</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Permet la prise en charge ou la dépose d'un passager n'importe où le long du trajet d'un vehicle.</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3>
        <p class="maintainer">#180 par <a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a> a été fusionné le Jan 9, 2020</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Traductions pour les champs de text, les URLs localisés et les informations de contact.</li>
        </ul>
    </div>
</div>

<div class="row"/>
