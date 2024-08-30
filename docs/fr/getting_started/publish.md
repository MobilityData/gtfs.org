# Rendre votre flux GTFS accessible au public

## Avantages du partage de votre GTFS 
 
 Les données GTFS peuvent être utilisées de nombreuses manières, et le partage public des données GTFS de votre agence offre de nombreux avantages à vos passagers et à votre agence dans son ensemble. Ceux-ci incluent : 
 
 - Intégrer votre flux dans des applications Web et mobiles de planification d'itinéraire, permettant aux passagers de planifier des voyages sur votre système
 - Soumettre votre flux à un agrégateur GTFS tel que la Mobility Database, qui fournit une audience et plus de visibilité pour votre agence
 - Utiliser des outils qui permettent de visualiser et d’analyser les données GTFS dans les systèmes d’information géographique (SIG) et d’autres programmes d’analyse cartographique
 
### Applications de planification de voyage 
 
 Quand les données GTFS de votre agence sont publiques, elles peuvent être utilisées par diverses applications de planification d'itinéraire en plus de Google Maps. Celles-ci peuvent inclure d’autres applications de navigation telles que Bing Maps, Apple Maps, ainsi que des plateformes spécifiques aux transports en commun comme Transit, Moovit, Transportr et Citymapper. De plus, l’accès aux données de flux ouvertes permet aux développeurs de créer des applications adaptées à des régions particulières ou pouvant comporter des fonctionnalités qui ne sont pas incluses dans les planificateurs de voyage standard, telles que : Vamos (comtés de San Joaquin et Stanislaus, Californie), MetroHero (région Washington DC), Entur (Norvège), et plus encore. 
 
### Agrégateurs de flux 
 
 Le partage de vos données GTFS permet également de les indexer par des plateformes d’agrégation de flux GTFS, qui peuvent inclure des répertoires de flux GTFS au niveau de l’État ou de la région, ainsi que par des agrégateurs de flux internationaux comme la [Mobility Database](https://database.mobilitydata.org/) et [Transitland](https://www.transit.land/) (voir plus d’agrégateurs de flux [ici](../../resources/data)). Être indexé sur un agrégateur de flux augmente la visibilité de votre agence et permet aux développeurs, chercheurs et autres parties intéressées d’accéder facilement aux données de votre agence à diverses fins, y compris le développement de nouvelles applications. 
 
### Intégration avec le SIG, l’analyse et d’autres plates-formes et outils 
 
 Les données GTFS peuvent également être importées et utilisées sur une variété de plates-formes d’analyse géospatiale. Les programmes de systèmes d’information géographique (SIG) comme ArcGIS d’Esri, ainsi que le QGIS open source, disposent de leurs propres plugins et extensions qui peuvent importer et visualiser les données d’arrêt et d’itinéraire GTFS. 
 
 - Esri dispose d’une [grande variété d’outils et de plugins](https://github.com/Esri/public-transit-tools) qui utilisent les données GTFS, y compris la visualisation des données d’horaire
 - Dans QGIS, [GTFS-GO](https://plugins.qgis.org/plugins/GTFS-GO-master/) et [GTFS Loader](https://plugins.qgis.org/plugins/GTFS_Loader/) permettent de visualiser les itinéraires + arrêts au sein de la plateforme
 - [Outils d’analyse supplémentaires](../../resources/agency-tools) 
 
 D’autres plateformes vous permettent de visualiser et d’analyser les données GTFS de manière unique : 
 
 - [Transmettre](https://conveyal.com/) est un programme open source qui permet aux utilisateurs d’importer des données GTFS pour visualiser les horaires, les itinéraires et les modèles, et analyser les impacts des modifications potentielles du service. Les utilisateurs peuvent également importer et utiliser des données démographiques pour effectuer des analyses, par exemple sur la manière dont différents itinéraires ou horaires affecteraient l’accès aux emplois dans une zone urbaine particulière. 
 - [GTFS to HTML](https://gtfstohtml.com/) est un outil open source qui permet la conversion des données de planification GTFS en horaires HTML. Il permet aux agences de publier et de mettre à jour automatiquement leurs plannings sur leur site Internet dans un format lisible également par des lecteurs d’écran, rendant les données accessibles aux personnes malvoyantes. 
 
## Partager vos données : conseils et bonnes pratiques

### Créer et maintenir un lien de récupération permanent 
 
 Un lien de récupération est une URL permanente sur laquelle les fichiers de planification GTFS de votre agence sont stockés. En règle générale, il est hébergé soit sur le site Web de votre agence, soit par votre fournisseur, si vous en avez un pour la production GTFS. C’est ainsi que les applications de planification d’itinéraire comme Google Maps accèdent à vos données. Idéalement, vos fichiers GTFS Schedule devraient être téléchargeables directement à partir de cette URL sans nécessiter de connexion. Toutefois, si cela n’est pas possible en raison de restrictions de licence, votre agence peut contrôler l’accès aux données en utilisant et en émettant des clés API aux utilisateurs des données. 
 
### URL et noms de fichiers 
 
 Un lien de récupération constant et des noms de fichiers GTFS sont essentiels pour garantir l’accès aux données de votre flux. Si votre agence n’utilise pas d’URL et de noms de fichiers constants pour ses données, cela signifie que les applications de planification d’itinéraire, les agrégateurs de flux et les autres utilisateurs n’obtiendront pas les données les plus précises et les plus à jour, ce qui entraînera des problèmes à long terme..
 
 Une fois que vous avez défini une URL pour votre lien de récupération permanent, NE LA MODIFIEZ PAS. Cela signifie que le nom de l’URL doit rester constant, même si les fichiers eux-mêmes sont mis à jour. En tant que tel, gardez vos URL aussi simples et génériques que possible, et évitez d’utiliser des URL contenant des dates ou des numéros de version. 
 
 - **BON :** http://www.bart.gov/dev/schedules/google_transit.zip, 
 - **ÉVITER :** http://www.bart.gov/dev/plannings/google_transit_Fall_2021.zip 
 
 De même, gardez le nom du dossier ZIP contenant les fichiers GTFS Schedule constant, même si vous effectuez des mises à jour du flux lui-même. Par exemple, lorsque vous mettez à jour un flux, vous ne devez ajouter aucune sorte de date ou de numéro de version au nom du dossier ZIP. Si vous souhaitez inclure des données sur la version du flux ou les dates de début et de fin du flux dans le flux, vous pouvez les inclure dans le fichier feed_info.txt. 
 
 - **BON :** « YourAgency_gtfs.zip », « google_transit.zip », « gtfs.zip », 
 - **ÉVITER :** « YourAgency_gtfs_092921.zip », « YourAgency_Fall2021.zip » 
 
### Configuration et intégrité des fichiers 
 
 Votre GTFS est un fichier zip contenant plusieurs fichiers texte interconnectés (.txt). Afin de vous assurer que le format est correct, procédez toujours comme suit : 
 
 1. Lors de l’ouverture d’un fichier texte, assurez-vous de conserver les valeurs sous forme de texte. Il existe de nombreux champs dans un GTFS que des applications comme Excel liront de manière incorrecte ou abrégeront. 
 2. Les fichiers sont délimités par des virgules et non par des tabulations. Cela signifie que chaque fichier contient des entrées en lignes et que les différents champs sont séparés par des virgules. 
 3. Les lignes ou colonnes supplémentaires entraîneront des erreurs lors de la consommation des applications, alors assurez-vous qu’il n’y a pas de lignes ou de colonnes vides lors de l’enregistrement du fichier. 
 4. Ne supprimez aucun des fichiers de votre GTFS : ils fonctionnent ensemble et tout fichier manquant peut provoquer des erreurs lors de la consommation des applications. 
 5. Lorsque vous recompressez les fichiers, assurez-vous de compresser les fichiers et non pas un dossier qui contiendrait les fichier. Vous pouvez être sûr que vous avez fait cela correctement en décompressant votre fichier et en voyant immédiatement les fichiers de ce dossier, et non un autre dossier contenant les fichiers. 
 
 
### Considérations supplémentaires 
 
 Si plusieurs agences partagent le même arrêt avec des noms ou des codes différents, des applications telles que Google Maps devront peut-être en choisir un. Pour éviter toute confusion, coordonnez-vous avec d’autres agences pour convenir des noms et des codes. Cela minimise les conflits entre les différents ensembles de données GTFS. 
 
 Dans le cas où vous disposez de plusieurs ensembles de données GTFS (généralement le résultat de la production d’un premier pour des applications publiques telles que Transit App et d’un autre pour les systèmes CAO/AVL opérationnels internes), vous devrez peut-être décider lequel sera être le GTFS publié. Il est recommandé de choisir de promouvoir le flux qui contient le plus d’informations destinées aux passagers. Dans la mesure du possible, essayez de faire correspondre vos ensembles de données GTFS (mêmes identifiants pour des éléments tels que les arrêts et les trajets) afin que les ensembles de données internes n’entrent pas en conflit avec les ensembles de données publics, et que l’intégration d’autres flux comme GTFS-RT soit possible. 
