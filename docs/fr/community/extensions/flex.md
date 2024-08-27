# GTFS-Flex 
 
 GTFS Flex est un projet d’extension du GTFS Schedule qui vise à faciliter la découvrabilité des services de transport à la demande. 
 
 Pour l’essentiel, il a été adopté dans GTFS en mars 2024. Quelques exemples peuvent être trouvés sur [cette page](../../../documentation/schedule/examples/flex) montrant ce qui peut être modélisé en utilisant la partie officiellement adoptée de GTFS Flex. 
 
 🤔 Les services comme Dial-a-Ride sont souvent ignorés par les passagers, qui n’ont parfois même aucune idée de leur existence. Ce manque d’accessibilité est un problème pour les agences de transport en commun, les planificateurs d’itinéraire et les usagers. Imaginez un groupe de touristes arrivant à votre aéroport local et souhaitant rejoindre une zone rurale qui n’offre qu’un service de bus à la demande. Les touristes consultent leur application de planification d'itinéraires préférée et ne trouvent pas d’option de transport public viable. Ils finissent par louer une voiture. En tant que touristes, ils manquent tous vos dépliants papier affichés dans le couloir annonçant le service à la demande. Non seulement votre service est sous-utilisé, mais il ne dispose pas non plus de la visibilité nécessaire pour répondre à la demande actuelle et future des passagers. C’est là qu’intervient GTFS-Flex. GTFS-Flex aide les passagers à découvrir votre service, afin qu’ils profitent des services que vous avez travaillé dur pour promouvoir. 

<img src="../../../assets/flex-userjourney-resize.jpg" alt="Parcours utilisateur GTFS-Flex"> 
 
 🔮 MobilityData s’attend à ce que GTFS-Flex ouvre la porte à une standardisation plus approfondie du transport réactif à la demande, y compris une expansion dans les composants transactionnels et en temps réel utilisant GTFS-OnDemand. Nous préparons une proposition de stratégie pour gérer au mieux le nombre croissant de modes de transport et la complexité des concepts dans ce domaine. 
 
 [Voir la proposition complète](https://github.com/MobilityData/gtfs-flex){ .md-button .md-button--primary } 
 
## Dernière pull request 
L’extension décrit les services qui fonctionnent selon un horaire, mais incluent également une ou plusieurs fonctionnalités flexibles, telles que : 
 
 - **Service Dial-a-Ride** : le véhicule dessert une zone où les prises en charge et les retours sont autorisés pendant certaines heures de service. 
 - **Service de déviation d’itinéraire** : le véhicule dessert un itinéraire fixe et un ensemble d’arrêts ordonnés, et peut faire un détour pour prendre ou déposer un passager entre les arrêts. 
 - **Service point à zone** : le passager peut embarquer à un arrêt fixe comme une gare, puis descendre n’importe où dans une zone, ou vice versa. Les départs de certains endroits sont programmés ou synchronisés avec d’autres services. 
 - **Point de déviation ou service de point de contrôle** : le passager peut embarquer à un arrêt fixe, puis descendre n’importe où parmi une liste d’arrêts non ordonnée, ou l’inverse. Le chauffeur dessert uniquement les arrêts pour lesquels une demande est faite. 
 
 Pour plus d’informations, veuillez consulter [proposition originale](https://github.com/MobilityData/gtfs-flex/blob/master/spec/reference.md) et [issue#382](https://github.com/google/transit/issues/382)(fermé depuis que nous avons modifié la portée). 
 
 Lors de la réunion de travail du 28 juin, il y a eu un accord au sein de la communauté du groupe pour poursuivre une itération qui couvre tous les domaines actuellement produits et consommés. Par conséquent, tous les champs qui apparaissent comme « **en discussion** » dans le [traqueur d’adoption](#suivi-des-adoptions) sont inclus dans cette pull request. 
 
 Les changements dans cette pull request sont : 
 
- Modifier le fichier : 
    - Modifier `stop_areas.txt` pour permettre le regroupement d’emplacements et/ou d’arrêts GeoJSON qui permettent de spécifier des groupes prédéterminés de ces fonctionnalités sur lignes individuelles de `stop_times.txt`. 
    - Modifier `stop_times.txt` pour clarifier les éléments de la spécification actuelle nécessaires pour informer les consommateurs de données sur la façon d’interpréter les fichiers et champs ajoutés et étendus
- Étendre le fichier : 
    - Étendre `stop_times.txt` avec `start_pickup_drop_off_window` et `end_pickup_drop_off_window` pour définir l’heure à laquelle le service de transport à la demande devient disponible/se termine dans un emplacement GeoJSON, une zone d’arrêt ou un arrêt. 
    - Étendre `stop_times.txt` avec `pickup_booking_rule_id` et `drop_off_booking_rule_id` pour définir des liens vers les règles de réservation
- Ajouter un nouveau fichier : 
    - `locations.geojson`, pour définir des zones (`Polygon` ou `Multipolygon`) où les passagers peuvent demander une prise en charge ou un retour. 
    - `booking_rules.txt`, pour définir les règles de réservation qui fournissent aux passagers des informations sur la manière de demander un service. 
 
 Voici un [exemple de données](https://docs.google.com/spreadsheets/d/1w5EHuHfxvejqApJFHA1Z0K2KytD9zahwbf8zyRlP_Ls/edit#gid=1451132209) pour [RufBus](https://uvg-online.com/rufbus-angermuende/) à Angermünde et Gartzer, Allemagne. L’image ci-dessous est un exemple illustrant la façon dont les données pourraient être présentées dans un planificateur de voyage : 
 
 <img src="https://github.com/google/transit/assets/126435471/c986f79a-0164-4e38-a552-7e37405fe133" width="180" height="400"> 
 
 Visitez la page Pull Request pour lire la description complète et contribuer à la conversation. 
 
 [Voir la Pull Request](https://github.com/google/transit/pull/388){ .md-button .md-button--primary } 
 
 [Rejoindre #gtfs-flex sur Slack](https://share.mobilitydata.org/slack){ .md-button .md-button--primary } 
 
## Premières mises en œuvre
- [Projet pilote MDoT Flex : Trillium, IBI, Transit, MNDoT, Cambridge Systematics et Token Transit](https://blog.transitapp.com/case-study/mndot-gtfs-flex-bringing-rural-riders-into-the-fold/) 
 - [Open Trip Planner](https://www.opentripplanner.org/) 
 - [Mobility on Demand Sandbox in Vermont](https://www.connectingcommuters.org/) 
 - [Tulare County Area Transit](https://ridetcat.org/) 
 - [Northwest Oregon Transit Alliance (NW Connector)](https://nwconnector.org/other-services/) 
 - [Vamos Mobility App](https://vamosmobileapp.com/) 
 - [RTD Denver Flexride](https://www.rtd-denver.com/services/flexride) 
 - [Projet OTP DRT de transport en commun du Nebraska : Trillium, Olsson, Cambridge Systematics et TransitPlus](https://trips.nebraskatransit.com/#/) 
 
 Contactez-nous pour ajouter votre implémentation GTFS-Flex à cette page 
 
 <a class="md-button md-button--primary" href=mailto:specification@mobilitydata.org >Contactez-nous</a> 
 
## Suivi des adoptions
### Actuel 

 <iframe class="airtable-embed" src="https://airtable.com/embed/shrUPyCZWOWrvO2mX?backgroundColor=purple&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid#ccc;"></iframe> 
 
 [Demandez une modification](https://airtable.com/shrcac1fXUrMxfoDV){ .md-button .md-button--primary } 
 [Ajoutez votre organisation (consommateurs)](https://airtable.com/shrgnVR5Su9tkHvUv){ .md-button .md-button--primary } 
 [Ajoutez votre organisation (producteurs)](https://airtable.com/shrsU4idBtcLuRuwZ){ .md-button .md-button--primary } 
 
## Historique
- **2013** : Proposition originale écrite par Brian Ferris (Google) 
 - **2016** : <a href="https://github.com/MobilityData/gtfs-flex/tree/master" target="_blank">Début des discussions GTFS-Flex GitHub</a> 
 - **2017** : <a href="https://www.oregon.gov/odot/RPTD/RPTD%20Document%20Library/GTFS-Flex-N-CATT.pdf" target="_blank">Programme sandbox Mobility on Demand (MOD) (FTA, Vermont DOT, OTP)</a> 
 - **2018** : MobilityData devient steward GTFS-Flex et propose GTFS-Flex v2
 - **Novembre 2020** : Répertoire de la version à jour de GTFS-Flex et OTP2 ingère les données GTFS-Flex v2
 - **Mai 2022** : Début du pilote MnDoT (Cambridge Systematics, MNDoT, Token Transit, Transit, Trillium (OptiBus)). 
 - **Mai 2023** : <a href="https://github.com/google/transit/issues/382" target="_blank">Travaux sur GTFS-Flex : Début de la découverte du service</a> 
 - **Juin 2023** : <a href="https://mobilitydata.org/recap-mobilitydata-working-meeting-gtfs-flex-service-discovery/" target="_blank">Réunion de travail conceptuelle sur GTFS-Flex</a> 
 - **Juillet 2023** : <a href="https://github.com/google/transit/pull/388" target="_blank">Publication de la Pull Request#388</a> 
 - **Août et septembre 2023** : <a href="https://github.com/google/transit/pull/388" target="_blank">Discussions « GeoJSON dans GTFS ? »</a> 
 - **Mars 2024** : <a href="https://github.com/google/transit/pull/433" target="_blank">GTFS Flex a été officiellement adopté</a> 
