# Extensions 
 
=== "GTFS Schedule" 
 
    Des fichiers et des champs supplémentaires peuvent être étendus aux ensembles de données GTFS Schedule pour répondre à une variété de besoins spécifiques des applications communiqués entre les agences de transport en commun et les fournisseurs de logiciels, même si ces champs ne sont pas dans la [spécification officielle](../../../documentation/schedule/reference). 
 
    Vous trouverez ci-dessous une liste des extensions de GTFS Schedule qui peuvent être implémentées. 
 
    !!! info "Rendre une extension officielle dans la spécification" 
 
        Les extensions peuvent devenir des propositions actives et par la suite [mergées](../../../documentation/schedule/change_history/recent_additions/) dans la spécification officielle via le [Processus de modification des spécifications](../../governance/gtfs_schedule_amendment_process/). 
 
    !!! note "Contribuer à cette liste" 
 
        Vous avez une extension que vous souhaitez partager avec la communauté GTFS ? Demandez l’ajout d’une extension à GTFS.org <a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">ici</a>. 

    <div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="http://bit.ly/gtfs-pathways" class="no-icon" target="_blank">GTFS-Pathways</a></h3> 
        <p class="maintainer"> Maintenu par <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Axé sur l’accessibilité pour les passages reliant les emplacements au sein des gares de transport en commun à des fins de planification d’itinéraire et d’orientation.</li> 
            <li> Bien que la spécification de base de GTFS-Pathways ait été entièrement intégrée dans GTFS, des informations supplémentaires telles que les instructions de synthèse vocale, les informations sur l’assistance en fauteuil roulant, les rapports de panne d’équipement, les fermetures d’entrée ou de sortie planifiées ou programmées et les pannes d’ascenseurs et d’escaliers mécaniques doivent être ajoutées.</li> 
        </ul> 
    </div> 
    </div> 

    <div class="row"> 
    <div class="leftcontainer"> 
        <a href="../fares-v2" class="no-icon" target="_blank"><h3 class="title"> GTFS-Fares v2</h3> 
        <p class="maintainer"> Maintenu par <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Permet aux applications de planification d’itinéraire d’afficher des informations sur les prix aux passagers.</li> 
            <li> Bien que l’implémentation de base de GTFS-Fares v2 ait récemment été votée pour être transférée dans GTFS, certaines fonctionnalités de cette extension qui restent encore incluent les tarifs zonaux/basés sur la distance, les catégories de passagers, le plafonnement et les plages tarifaires, les forfaits tarifaires et les conteneurs, tarification aux heures de pointe/vacances, séquences de transfert et comportement d’un itinéraire.</li> 
     </ul> 
    </div> 
    </div> 

    <div class="row"> 
    <div class="leftcontainer"> 
        <a href="../flex" class="no-icon" target="_blank"><h3 class="title"> GTFS-Flex</h3> 
        <p class="maintainer"> Maintenu par <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Étend GTFS en incluant des itinéraires fixes déviés et des fonctionnalités de service de transport à la demande dans sa modélisation de données qui ne suivent pas toujours la même chose pour les arrêts fixes.</li> 
            <li> La proposition est composée de 2 extensions : GTFS-FlexibleTrips, qui décrit le service lui-même et GTFS-BookingRules, qui fournit les informations de réservation de GTFS-FlexibleTrips.</li> 
        </ul> 
    </div> 
    </div> 

    <div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="http://bit.ly/gtfs-occupancies" class="no-icon" target="_blank">GTFS-Occupancies</a></h3> 
        <p class="maintainer"> Maintenu par <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Décrit l’encombrement des passagers d’un véhicule sur une base habituelle ou projetée.</li> 
        <li> Complète la disponibilité des informations sur l’encombrement décrites dans GTFS Realtime en proposant des prévisions statiques pour les trajets futurs basées sur les tendances précédentes, ce qui peut aider les passagers à planifier leurs déplacements en fonction de leurs préférences en matière d’encombrement et de leur confort.</li> 
        </ul> 
    </div> 
    </div> 

    <div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://developers.google.com/transit/gtfs/reference/gtfs-extensions" class="no-icon" target="_blank">Extensions Google Transit à GTFS</a></h3> 
        <p class="maintainer"> Maintenu par <a href="https://developers.google.com/transit" class="no-icon" target="_blank">Google</a></p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Fournit une prise en charge de la traduction, étend les types d’itinéraires, permet des règles de transfert plus détaillées et ajoute un certain nombre d’autres fonctions.</li> 
        </ul> 
    </div> 
    </div> 

    <div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://www.transitwiki.org/TransitWiki/index.php/File:GTFS%2B_Additional_Files_Format_Ver_1.7.pdf" class="no-icon" target="_blank">MTC GTFS+</a></h3> 
        <p class="maintainer"> Entretenu par <a href="https://mtc.ca.gov/" class="no-icon" target="_blank">MTC</a></p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Créé par la Commission métropolitaine des transports de la région de la baie de San Francisco. Ajoute des informations supplémentaires en temps réel, des directions, des catégories de passagers et plus encore.</li> 
        </ul> 
    </div> 
    </div> 

    <div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/mbta/gtfs-documentation/" class="no-icon" target="_blank">MBTA</a></h3> 
        <p class="maintainer"> Maintenu par <a href="https://www.mbta.com/" class="no-icon" target="_blank">MBTA</a></p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Ajoute des points de contrôle de suivi des performances de retard, des informations sur les stations et les installations et bien plus encore.</li> 
        </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">GTFS-Eligibilities</a></h3> 
        <p class="maintainer"> Maintenu par <a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">le ministère des Transports de l’Oregon</a></p> 
    </div> 
    <div class="featurelist"> 
        <p> GTFS-Eligibilities repose sur le concept selon lequel il devrait permettre aux systèmes fonctionnant sur la base de comptes utilisateur de comprendre si un voyage est éligible sur la base des informations sur les comptes utilisateur. Cela signifie que les champs proposés fournissent :</p> 
        <ul> 
            <li> Attributs courants associés aux comptes utilisateur tels que l’âge, le sexe, l’affiliation à une entreprise, les motifs du voyage et les niveaux d’assistance fournis.</li> 
        <li> Authentifications personnalisables des attributs et statuts définis localement. Des éligibilités personnalisées sont fournies, ainsi qu’un moyen de comprendre comment l’éligibilité personnalisée peut être authentifiée.</li> 
        </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">GTFS-Capabilities</a></h3> 
        <p class="maintainer"> Maintenu par <a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">le ministère des Transports de l’Oregon</a></p> 
    </div> 
    <div class="featurelist"> 
        <p> Décrit les capacités supplémentaires qu’un service peut être en mesure de fournir pour servir les personnes handicapées et celles qui disposent d’appareils de mobilité.</p> 
        <ul> 
            <li> Informations sur les services disponibles pour un passager par une personne, telle qu’un chauffeur ou une autre ressource humaine fournie par une agence.</li> 
            <li> Informations sur le véhicule, décrites par la spécification (encore étendue) <a href="https://docs.google.com/document/d/156RiBjI6FnWJvO8_XWX11Q9nLdOiBdS_rilA-oamlv8/edit#heading=h.tosuo6e9e0z7">GTFS-VehicleCategories</a>. Voir également le projet d’extension <a href="https://docs.google.com/document/d/1mcQ-oEaP5WiGh46DmUQqmeS-rQ5W96L-c3TRKinGS0g/edit#heading=h.oxdoxruczgni">des GTFS-seats</a> .</li> 
            <li> L’accent est mis sur la description des commodités du véhicule liées aux appareils de mobilité et sur la manière dont l’embarquement avec ces appareils affecte la capacité des autres passagers et appareils.</li> 
        </ul> 
    </div> 
    </div> 
    <div class="row"></div> 
 
=== "GTFS Realtime" 
 
    Des fichiers et des champs supplémentaires peuvent être étendus aux flux GTFS Realtime pour répondre à une variété de besoins spécifiques des applications communiqués entre les agences de transport en commun et les fournisseurs de logiciels, même si ces champs ne sont pas dans la [spécification officielle](../../../documentation/realtime/reference). 
 
    Vous trouverez ci-dessous une liste des extensions GTFS Realtime qui peuvent être implémentées. 
 
    !!! info "Rendre une extension officielle dans la spécification" 
 
        Les extensions peuvent devenir des propositions actives et par la suite [mergées](../../../documentation/realtime/change_history/recent_additions/) dans la spécification officielle via le [Processus de modification des spécifications](../../governance/gtfs_realtime_amendment_process/). 
 
    !!! note "Contribuer à cette liste" 
 
        Vous avez une extension que vous souhaitez partager avec la communauté GTFS ? Demandez l’ajout d’une extension à GTFS.org <a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">ici</a>. 

    <div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://docs.google.com/document/d/1qJOTe4m_a4dcJnvXYt4smYj4QQ1ejZ8CvLBYzDM5IyM/edit#bookmark=id.av58okxmwekh" class="no-icon" target="_blank">GTFS-PathwayUpdates</a></h3> 
        <p class="maintainer"> Maintenu par <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Décrire les changements apportés aux passages dans les gares en temps réel, tels que les temps d’arrêt des ascenseurs ou les passages fermés.</li> 
        </ul> 
    </div> 
    </div> 

    <div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/212" class="no-icon" target="_blank">GTFS-OccupancyStatus</a></h3> 
        <p class="maintainer"> Maintenu par <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Fournir des informations en temps réel sur l’encombrement des véhicules de transport en commun.</li> 
        </ul> 
    </div> 
    </div> 

    <div class="row"></div> 
 
 Pour plus d’informations, contactez [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) 
