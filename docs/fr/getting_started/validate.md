# Évaluez la qualité de votre flux GTFS 

 Un GTFS de haute qualité est complet, précis et à jour. Cela signifie qu’il représente le fonctionnement actuel des services et fournit autant d’informations que possible. 
 
## Données complètes 
 
 Qualité GTFS comprend des détails de service importants tels que les changements d’horaires de vacances et d’été, les emplacements d’arrêt précis et les noms d’itinéraires et de panneaux qui correspondent à d’autres documents destinés aux passagers. Même si une agence travaille avec un fournisseur pour produire des GTFS, c’est en fin de compte à l’agence de s’assurer que les informations présentées sous forme imprimée, à bord et en ligne sont cohérentes. 
 
## Données précises 
 
 Des données précises sont essentielles pour offrir aux usagers des transports en commun une expérience de transport fiable et conviviale. Des erreurs dans les données peuvent bloquer l’utilisation d’une partie ou de la totalité d’un ensemble de données. 
 
## Données à jour 
 
 Des données obsolètes peuvent être plus problématiques que de ne pas avoir de flux disponible. Il ne suffit pas de simplement publier des informations : elles doivent correspondre à ce que le motard voit et expérimente. Certaines des plus grandes agences de transport mettent à jour leur GTFS chaque semaine, voire quotidiennement, mais la plupart des agences devront mettre à jour leur GTFS tous les quelques mois, ou quelques fois par an lorsque le service change. Cela inclut des éléments tels que de nouveaux itinéraires ou arrêts, des changements d’horaires ou des mises à jour de la structure tarifaire. 
 
 De nombreuses agences engagent un fournisseur pour créer et gérer leur GTFS pour elles. Certains fournisseurs peuvent être proactifs en posant des questions sur les modifications de service, mais il est important que les agences communiquent avec les fournisseurs sur les modifications de service à venir. Il est possible de publier GTFS avec les modifications de service à l’avance, garantissant ainsi que la transition se déroule sans problème pour tout le monde : agences, fournisseurs, planificateurs de voyage et passagers ! 
 
## Utilisation de validateurs officiels 
 
 Les validateurs GTFS officiels évaluent la qualité d’un ensemble de données par rapport à la spécification officielle, garantissant ainsi une compréhension commune au sein de l’industrie de ce qui constitue un ensemble de données de haute qualité. 
 
 Le [Canonical GTFS Schedule validateur](https://gtfs-validator.mobilitydata.org/)[^1] gratuit et open source maintenu par [MobilityData](https://mobilitydata.org/) garantit vos données GTFS sont conformes aux [Référence de planification GTFS](../../documentation/schedule/reference/) officielles et aux [Bonnes pratiques](../../documentation/schedule/schedule_best_practices). Il fournit un rapport facile à utiliser qui peut être partagé avec d’autres parties ainsi qu’une documentation complète. 

<div class="usage">
    <div class="usage-list">
        <ol>
            <li>Accédez à <a href="https://gtfs-validator.mobilitydata.org/">gtfs-validator.mobilitydata.org</a>. </li>
            <li>Chargez votre jeu de données GTFS : vous pouvez sélectionner ou glisser-déposer un fichier ZIP, ou copier/coller une URL.</li>
            <li>Une fois la validation terminée, une option pour ouvrir le rapport sera proposée.</li>
            <li>Vous verrez si le validateur a trouvé des problèmes avec les données et des liens vers notre documentation pour savoir comment les résoudre. L’URL du rapport de validation fonctionnera pendant 30 jours et pourra être partagée avec d’autres.</li>
        </ol>
    </div>
    <div class="usage-video">
        <video class="center" width="560" height="315" controls>
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4">
        </video>
    </div>
</div>

 
 De même, l’utilisation du canonique gratuit et open source [GTFS Realtime Validator](https:) garantit que vos données GTFS sont conformes à la [GTFS Realtime Reference](../../documentation/realtime/reference/) officielle et [Bonnes pratiques](../../documentation/realtime/realtime_best_practices). 
 
 Pour plus d’informations sur la création de données de haute qualité, consultez les [California Transit Data Lignes directrices](https://dot.ca.gov/cal-itp/california-transit-data-guidelines), les [GTFS Schedule Best Practices](../../documentation/schedule/schedule_best_practices) et les [meilleures pratiques GTFS en temps réel](../../documentation/realtime/realtime_best_practices). 
 
 [^1]: Pour voir plus d’instructions sur la façon d’utiliser cet outil dans votre pipeline de données et de contribuer à ce projet, veuillez visiter le [répertoire GitHub](https://github.com/MobilityData/gtfs-validator ). 
