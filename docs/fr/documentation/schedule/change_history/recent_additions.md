# Modifications de GTFS Schedule 
 
 La référence de GTFS Schedule n’est pas gravée dans le marbre. Il s’agit plutôt d’une spécification ouverte développée et maintenue par la communauté des agences de transport en commun, des développeurs et d’autres parties prenantes qui utilisent GTFS. On s’attend à ce que cette communauté de producteurs et de consommateurs de données GTFS ait des propositions pour étendre la spécification afin de permettre de nouvelles capacités. 
 
 Pour contribuer au GTFS, lisez le [Processus de modification de GTFS Schedule](../../../../community/governance/gtfs_schedule_amendment_process) et suivez les discussions dans les <a href="https://github.com/google/transit/issues" target="_blank">issues</a> ouvertes et <a href="https://github.com/google/transit/pulls" target="_blank">les pull request</a> sur le GTFS répertoire Github ( <a href="https://github.com/google/transit" target="_blank">google/transit</a> ). ![](../../../assets/mark-github.svg) 
 
 <!-- <div class="row"> 
     <div class="active-container"> 
         <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add trip-to-trip transfers with in-seat option</a></h3> 
         <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p> 
     </div> 
 </div> 
 <div class="row"></div> --> 

 <!-- <div class="row no-active"> 
     <div class="no-active-container"> 
         <h3 class="title">There are currently no active proposals for GTFS Schedule.</h3> 
         <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p> 
     </div> 
 </div> 
 <div class="row"></div> --> 
 
## Propositions récemment adoptées <img src="../../../../assets/pr-merged.svg" style="height:1em;"/> 
 
 Propositions récemment fusionnées qui font désormais fonctionnalités de la [référence officielle de GTFS Schedule](../../reference). Consultez l’[Historique des révisions](../revision_history) complet pour en savoir plus. 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/433" class="no-icon" target="_blank">Adoptez GTFS Flex</a></h3> 
        <p class="maintainer">#433 par <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> a été fusionné le 19 mars 2024</p> 
</div> 
<div class="featurelist"> 
    <ul> 
        <li> La <a href="../../../../community/extensions/flex" class="no-icon" target="_blank">proposition GTFS-Flex</a> permet aux passagers de découvrir des services adaptés à la demande sur les planificateurs de voyage</li> 
    <li> Plusieurs fichiers ont été ajoutés à la spécification, notamment locations.geojson qui intègre GeoJson dans GTFS</li> 
    </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/405" class="no-icon" target="_blank">Ajoutez les networks.txt et route_networks.txt</a></h3> 
        <p class="maintainer">#406 de <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> a été fusionné le 28 novembre 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Ajoute deux nouveaux fichiers : <code>networks.txt</code> et <code>route_networks.txt</code> pour créer des réseaux d’itinéraires associés aux tarifs.</li> 
        <li> Fournit une alternative à <code>routes.network_id</code> afin que les fichiers d’horaires et de tarifs puissent être distincts</li> 
        </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/406" class="no-icon" target="_blank">Bonnes pratiques : ajouter des directives de publication d’ensembles de données<br> et bonnes pratiques pour tous les dossiers</a></h3> 
        <p class="maintainer"> Le n°406 de <a href="https://github.com/Sergiodero" class="no-icon" target="_blank">Sergiodero</a> a été fusionné le 16 novembre 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Ajoute deux sections des bonnes pratiques GTFS à la spécification : directives de publication d’ensembles de données et bonnes pratiques pour tous les fichiers.</li> 
            <li> Met à jour une référence à la fonction de fusion de l’outil transitfeed de Google, de sorte qu’il référence une liste d’outils de fusion à la place</li> 
        </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/386" class="no-icon" target="_blank">Bonnes pratiques : ajouter une présence recommandée</a></h3> 
        <p class="maintainer">#386 par <a href="https://github.com/emmambd" class="no-icon" target="_blank">emmambd</a> a été fusionné le 1er août 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Ajoute une nouvelle présence Recommandé dans la spécification qui est conforme aux conventions RFC</li> 
            <li> Permet d’indiquer clairement qu’un champ ou un fichier n’est pas obligatoire, mais l’ajouter est une bonne pratique à considérer</li> 
            <li> Met à jour les informations de plusieurs fichiers et champs pour refléter leur présence recommandée en fonction des bonnes pratiques GTFS.</li> 
        </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/357" class="no-icon" target="_blank">Ajoutez des tarifs variables par heure ou par jour</a></h3> 
        <p class="maintainer">#357 par <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> a été fusionné le 27 juillet 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Les tarifs variables dans le temps sont une fonctionnalité importante développée dans le cadre de la <a href="../../../../community/extensions/fares-v2">proposition d’extension GTFS-Fares v2.</a></li> 
            <li> Permet de représenter des tarifs différenciés en fonction de l’heure de la journée ou du jour de la semaine, tels que les tarifs pointes et heures creuses.</li> 
            <li> Ajoute un nouveau fichier : <code>timeframes.txt</code>, pour définir les moments dans le temps où le tarif s’applique</li> 
            <li> Étend <code>fare_leg_rules.txt</code> avec <code>from_timeframe_id</code> et <code>to_timeframe_id</code> pour spécifier qu’une règle de segment tarifaire s’applique uniquement si le début ou la fin du segment se situe dans une période spécifiée.</li> 
        </ul> 
    </div> 
</div> 

<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/355" class="no-icon" target="_blank">Ajouter un support tarifaire</a></h3> 
        <p class="maintainer">#355 par <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> a été fusionné le 14 mars 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Tarif Média est un élément clé de la <a href="../../../../community/extensions/fares-v2">proposition d’extension GTFS-Fares v2</a></li> 
            <li> Il représente ce qu’un passager peut utiliser pour valider son trajet (par exemple, une carte de transport en commun, une application mobile ou un paiement sans contact à l’aide d’une carte bancaire sans contact).</li> 
            <li> Un produit tarifaire peut être associé à un Tarif Média spécifique (par exemple, un abonnement mensuel n’est disponible que sur une carte de transport)</li> 
            <li> Le prix d’un produit tarifaire peut être défini en fonction du Tarif Média (par exemple, le billet est moins cher s’il est acheté via une application mobile)</li> 
        </ul> 
    </div> 
</div> 

<div class="row"></div>