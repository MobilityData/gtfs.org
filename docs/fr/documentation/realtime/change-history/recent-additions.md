# Modifications GTFS Realtime 
 
 La référence GTFS Realtime n’est pas gravée dans le marbre. Il s’agit plutôt d’une spécification ouverte développée et maintenue par la communauté des agences de transport en commun, des développeurs et d’autres parties prenantes qui utilisent GTFS Realtime. On s’attend à ce que cette communauté de producteurs et de consommateurs de données GTFS Realtime ait des propositions pour étendre la spécification afin de permettre de nouvelles fonctionnalités. 
 
 Pour contribuer à GTFS Realtime, lisez le [GTFS Realtime Amendment Process](../../../../community/governance/gtfs_realtime_amendment_process) et suivez les discussions dans les <a href="https://github.com/google/transit/issues" target="_blank">issues</a> ouvertes et <a href="https://github.com/google/transit/pulls" target="_blank">les pull request</a> sur le répertoire GTFS Github ( <a href="https://github.com/google/transit" target="_blank">google/transit</a> ). ![](../../../assets/mark-github.svg) 
 
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
 
## Propositions récemment adoptées <img src="../../../../assets/pr-merged.svg" style="height:1em;"/> 
 
 Propositions récemment fusionnées qui sont désormais des fonctionnalités de la [référence officielle GTFS Realtime](../../reference). Voir l’[Historique des révisions complet](../revision_history) pour en savoir plus. 


<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/403" class="no-icon" target="_blank">Ajouter des modifications de voyage</a></h3> 
        <p class="maintainer">#332 par <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> a été fusionné le 11 mars 2024</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Ajoute des modifications de trajet en tant que fonctionnalité expérimentale utilisée pour décrire les détours qui affectent un ensemble de trajets.</li> 
            <li> Une modification de trajet peut annuler certains arrêts, ajuster le calendrier des déplacements, donner une nouvelle forme aux déplacements et fournir l’emplacement des arrêts temporaires en cours de route.</li> 
        </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/352" class="no-icon" target="_blank">Ajouter l’énumération DELETED à planning_relationship</a></h3> 
        <p class="maintainer">#332 par <a href="https://github.com/mads14" class="no-icon" target="_blank">mads14</a> a été fusionné le 30 novembre 2022</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Ajoute une nouvelle énumération expérimentale <code>DELETED</code> trip planning_relationship</li> 
            <li> Cela peut être utilisé pour indiquer qu’un fournisseur de transports en commun a l’intention de faire disparaître complètement un voyage des applications destinées au public.</li> 
        </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Ajoutez cause_detail et effect_detail aux alertes</a></h3> 
        <p class="maintainer">#332 par <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> a été fusionné le 26 juin 2022</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Ajoute des descriptions aux causes et aux effets des alertes</li> 
        </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : mise à jour de l’accès aux fauteuils roulants</a></h3> 
        <p class="maintainer">#340 de <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> a été fusionné le 25 juillet 2022</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Ajoute des informations en temps réel sur l’accessibilité du voyage</li> 
            <li> S’il est fourni, écrase <code>trips.wheelchair_accessible</code> dans l’ensemble de données GTFS Schedule</li> 
        </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Caractéristique/image dans les alertes</a></h3> 
        <p class="maintainer">#283 par <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> a été fusionné le 26 novembre 2021</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Ajoute un champ de lien URL à une image (ex.photo ou carte) à afficher dans les alertes de service des applications, afin d’améliorer la compréhension de l’alerte</li> 
            <li> Les changements incluent : l’application d’une limite de taille de l’image, une image par alerte et la garantie que l’URL change si le contenu ou la langue des images change</li> 
        </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">Ajouter GTFS-NewShapes comme expérimental</a></h3> 
        <p class="maintainer">#272 par <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> a été fusionné le 30 août 2021</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Possibilité de mettre à jour les formes d’itinéraire en temps réel pour refléter les détours</li> 
            <li> Les mises à jour d’itinéraire sont reflétées soit en référençant un <code>shape_id</code> existant, soit en définissant en temps réel une nouvelle forme sous forme de polyligne codée.</li> 
        </ul> 
    </div> 
</div> 

<div class="row"></div> 
