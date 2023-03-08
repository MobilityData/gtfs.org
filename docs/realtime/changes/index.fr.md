# Changements dans GTFS Realtime

La spécification GTFS Realtime n'est pas gravée dans la pierre. Il s'agit plutôt d'une spécification ouverte développée et maintenue par la communauté des agences de transport, des développeurs et des autres parties prenantes qui utilisent GTFS Realtime. On s'attend à ce que cette communauté de producteurs et de consommateurs de données GTFS Realtime ait des propositions pour étendre la spécification afin de permettre de nouvelles capacités.

Pour contribuer à la [spécification](../process) GTFS Realtime, lisez le [processus de modification de la spécification](../process) et suivez les discussions dans les [problèmes](https://github.com/google/transit/issues) ouverts et les [demandes de retrait](https://github.com/google/transit/pulls) sur le dépôt Github Transit de Google[(google/transit](https://github.com/google/transit)). ![](../../assets/mark-github.svg)

!!! note ""

    La spécification, la référence et la documentation officielles sont rédigées en anglais. Si une traduction dans une autre langue diffère de l'original anglais, c'est ce dernier qui prévaut. Toute communication est effectuée en anglais.

<!-- <br><div class="landing-page">
    <a class="button" href="../process">Processus de modification des spécifications</a><a class="button" href="../guiding-principles">Principes directeurs</a><a class="button" href="../revision-history">Historique des révisions</a><a class="button" href="../extensions">Extensions enRealtime</a>
</div> -->

## Propositions actives &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- Propositions actives pour de nouvelles fonctionnalités dans GTFS Realtime.  -->

Rejoignez les discussions sur [Github](https://github.com/google/transit/pulls)!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Ajouter cause_detail et effect_detail aux alertes</a></h3>
        <p class="maintainer">#332 ouvert le Peut 31, 2022 par <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">Il n'y a actuellement aucune proposition active pour GTFS Realtime.</h3>
        <p class="prompt">Vous avez une proposition ? &ensp;➜&ensp; Ouvrir un <a href="https://github.com/google/transit/pulls" target="_blank">demande de retrait</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Propositions récemment fusionnées &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Propositions récemment fusionnées qui sont désormais des caractéristiques de la [spécification officielle GTFS Realtime](../reference). Voir [l'historique complet des révisions](../process#revision-history) pour en savoir plus.

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Ajouter cause_detail et effect_detail aux Alertes</a></h3>
        <p class="maintainer">#Le numéro 332 de <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> a été fusionné le 26 juin 2022.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Ajoute des descriptions aux causes et effets des alertes</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : mise à jour de l'accès aux fauteuils roulants</a></h3>
        <p class="maintainer">#Le n° 340 de <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> a été fusionné le 25 juil. 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Ajoute des informations en temps réel sur l'accessibilité des voyages</li>
            <li>Si fourni, écrase <code>trips.wheelchair_accessible</code> dans le jeu de données GTFS Schedule</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Fonctionnalité/image dans les alertes</a></h3>
        <p class="maintainer">#Le n°283 de <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> a été fusionné le 26 nov. 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Ajoute un champ pour un lien URL vers une image (ex. photo ou carte) à afficher dans les alertes de service des applications, afin d'améliorer la compréhension de l'alerte.</li>
            <li>Les changements comprennent : l'application d'une limite de taille de l'image, une image par alerte, et la garantie que l'URL change si le contenu ou la langue des images change.</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">Ajout de GTFS-NewShapes en tant qu'expérimental</a></h3>
        <p class="maintainer">#272 par <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> a été fusionné le 30 août 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Possibilité de mettre à jour les formes de l'itinéraire en temps réel pour refléter les détours.</li>
            <li>Les mises à jour d'itinéraires sont reflétées soit en référençant un <code>shape_id</code> existant, soit en définissant en temps réel une nouvelle forme sous forme de polyligne encodée.</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">Ajout de departure_ocupancy_status à TripUpdate.</a></h3>
        <p class="maintainer">#260 par <a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a> a été fusionné le 14 avr. 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Fournir l'occupation prévue des véhicules de transport en commun aux futurs arrêts en fonction des données actuelles ou historiques.</li>
        </ul>
    </div>
</div>

<div class="row"/>
