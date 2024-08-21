# Pathways et accessibilité physique

## Pourquoi afficher des informations sur Accessibilité ? 
 
 **Impact sur un pourcentage important de la population :** L’Organisation mondiale de la santé estime que [16 % des personnes dans le monde ont un handicap](https://www.who.int/news-room/fact-sheets/detail/disability-and-health) et que les personnes handicapées « trouvent un moyen de transport inaccessible et inabordable 15 fois plus difficilement que pour les personnes non handicapées ». Les personnes handicapées ont également [des taux plus élevés d’acquisition de nouveaux problèmes de santé](https://www.who.int/publications/i/item/9789240063600), en partie à cause d’un accès réduit aux soins et aux services. 
 
 **C’est important pour eux :** Les usagers ont besoin d’informations à jour et précises sur leurs options de transport en commun. De nombreuses agences utilisent déjà le General Transit Feed Specification (GTFS) pour représenter les informations sur les itinéraires, les horaires et l’emplacement des arrêts qui sont essentielles aux usagers pour planifier leurs déplacements et comprendre leurs options. Pour les usagers ayant des besoins d’accessibilité, connaître l’accessibilité d’un arrêt ou d’un véhicule est tout aussi important que connaître son emplacement. Ces passagers doivent connaître chaque étape de leur voyage pour s’assurer qu’ils ne se retrouvent pas bloqués quelque part ou qu’ils ne réalisent pas trop tard qu’ils ne pourront pas se rendre à leur dernier arrêt. 
 
 **Cela peut être la loi :** Selon votre emplacement, la loi locale ou nationale peut exiger que vous fournissiez l’égalité d’accès et d’opportunités aux personnes handicapées. Voici quelques sources que vous pourriez consulter : 
 
 * **États-Unis :** The [Americans and Disabilities Act (ADA)](https://www.ada.gov/topics/intro-to- ada/#public-transit) et [Section 504](https://www.dol.gov/agencies/oasam/centers-offices/civil-rights-center/statutes/section-504-rehabilitation-act-of-1973 ) de la loi sur la réhabilitation de 1973 
 * **Japon :** Loi du ministère japonais des Terres, des Infrastructures, des Transports et du Tourisme visant à promouvoir une mobilité et une Accessibilité faciles pour les personnes âgées et handicapées (« [Loi sans barrières](https://www.mlit.go.jp/sogoseisaku/barrierfree/index.html)") 
 * **Union européenne :** [Emploi, affaires sociales et inclusion](https://ec.europa.eu/social/main.jsp?catId=1485&amp;langId=en) 
 
## Liste de contrôle Accessibilité 
 
 Voici les étapes nécessaires pour ajouter des informations d’accessibilité à vos données. Les sections suivantes fournissent des informations plus détaillées sur chaque étape. 

* Étape 1 : Ajoutez des informations sur l’accessibilité en fauteuil roulant à `stops.txt` 
* Étape 2 : Ajoutez des informations sur l’accessibilité en fauteuil roulant à `trips.txt` 
* Étape 3 : Ajoutez des informations de navigation audio à `stops.txt` 
* Étape 4 : Ajoutez des informations d’accessibilité physique sur les stations de transport en commun avec GTFS Parcours

## Ajout de Accessibilité en fauteuil roulant dans GTFS 
 
 Vous connaissez peut-être déjà la structure de GTFS sous la forme d’une série de fichiers.txt. L’accessibilité en fauteuil roulant peut être affichée en mettant à jour deux champs : `wheelchair_boarding` dans `stops.txt` et `wheelchair_accessible` dans `trips.txt`. 
 
 **Accessibilité en fauteuil roulant dans le stops.txt** 
 Le champ `wheelchair_boarding` dans `stops.txt` permet d’indiquer si l’embarquement en fauteuil roulant est possible à partir de l’emplacement spécifié. 
 
 [Référence : stops.txt](../../reference/#stopstxt) 
 
 Lorsque ce champ est laissé vide, aucune information d’accessibilité n’est affichée. Cela laisse les passagers incertains quant à l’accessibilité et incapables de dire si l’embarquement en fauteuil roulant n’est réellement pas possible ou si l’information manque tout simplement. Même si l’embarquement pour fauteuils roulants n’est pas disponible, il est préférable de renseigner ces informations pour que les passagers soient clairs et leur permettent de planifier leur voyage avec des informations précises. 
 
 **Accessibilité en fauteuil roulant dans trips.txt** 
 Le champ `wheelchair_accessible` dans `trips.txt` permet d’indiquer si le véhicule utilisé pour un trajet spécifique peut accueillir un fauteuil roulant. 
 
 [Référence : trips.txt](../../reference/#tripstxt) 
 
 Comme `wheelchair_boarding`, lorsque ce champ est laissé vide, aucune information d’accessibilité n’est affichée. Même si le véhicule n’est pas accessible aux fauteuils roulants, il est toujours préférable de renseigner ces informations pour que les passagers soient clairs et leur permettent de planifier leur voyage avec des informations précises. 
 
## Ajout d’aides à la navigation audio 
 
 La synthèse vocale est un autre moyen d’augmenter l’accessibilité de votre GTFS. Des informations précises de synthèse vocale garantissent que les passagers utilisant une technologie d’assistance pour lire le texte à haute voix obtiennent les bonnes informations. Ces informations peuvent être incluses dans votre GTFS en mettant à jour `tts_stop_name` dans `stops.txt` pour correspondre à chaque `stop_name`. Chaque arrêt dans votre GTFS doit avoir une désambiguïsation de synthèse vocale qui épelle phonétiquement l’arrêt afin qu’il puisse être prononcé correctement. 
 
 [Exemples : Synthèse Vocale](../../examples/text-to-speech) 
 
 Bien que `tts_stop_name` soit actuellement le seul champ de synthèse vocale officiellement adopté dans le Spécification GTFS, d’autres champs ont été discutés et peuvent être ajoutés. Ceux-ci incluent `tts_agency_name`, `tts_route_short_name`, `tts_route_long_name`, `tts_trip_headsign`, `tts_trip_short_name` et `tts_stop_headsign`. 
 
 Les passagers devront utiliser une application prenant en charge la fonctionnalité de synthèse vocale, afin de bénéficier de ces informations. Certaines applications, telles que [NaviLensGo](https:), sont spécifiquement conçues pour aider les conducteurs malvoyants à naviguer dans les stations et à trouver le bon véhicule. 
 
## Ajout d’informations Accessibilité physique sur une station 
 
 GTFS-Pathways est un composant de GTFS qui représente les détails d’une station de transport en commun. Il permet aux usagers de comprendre s’ils seront en mesure d’effectuer le transfert requis dans une gare de transport en commun. 
 
 GTFS-Pathways ajoute les fichiers `pathways.txt` et `levels.txt` ainsi que le champ `location_type` dans `stops.txt` pour relier les informations décrites dans `pathways.txt`. 

<img class="center" src="../../../../assets/pathways-visual.jpg"> 
 
### Décrire l’emplacement des entrées et sorties des gares 
 
 Avec GTFS, il est possible de décrire avec précision les gares à l’aide d’informations sur les entrées et l’intérieur des gares. Cet exemple décrit des sections de la station Waterfront au centre-ville de Vancouver. La gare fait partie du réseau Skytrain de la ville et est desservie par la Canada Line, la Expo Line, le SeaBus et le West Coast Express. Trois entrées au niveau de la rue permettent aux usagers d’entrer et de sortir de la gare. Le reste de la gare est souterrain, avec un niveau hall pour la validation des tarifs et un niveau inférieur avec quais. 
 
 Dans un premier temps, l’emplacement de la gare et ses entrées sont définis dans [stops.txt](../../reference/#stopstxt) : 
 
 [** stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
12034,Waterfront Station,49.285687,-123.111773,1,,
90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2
```
 
 Dans le fichier ci-dessus, le premier enregistrement concerne l’emplacement de la station, par conséquent, le `location_type` est défini sur `1`. Les cinq autres concernent les trois entrées de la gare (cinq enregistrements sont nécessaires puisque l’entrée de Granville comporte en réalité trois entrées distinctes, un escalier, un escalier roulant et un ascenseur). Ces cinq enregistrements sont définis comme des entrées puisque le `location_type` est défini sur `2`. 
 
 De plus, le `stop_id` de la station Waterfront est répertorié sous `parent_station` pour les entrées afin de les associer à la station. Les entrées accessibles ont `wheelchair_boarding` défini sur `1` et celles non accessibles sont définies sur `2`. 
 
### Décrire les escaliers et les escaliers mécaniques 
 
 L’entrée de la station Waterfront à la rue Granville a un ascenseur, un escalator et des escaliers, les entrées sont définies comme les nœuds ci-dessus dans [stops.txt](../../reference/#stopstxt). Pour connecter les entrées aux sections intérieures de la station, des nœuds supplémentaires doivent être créés dans [stops.txt](../../reference/#stopstxt) sous le `parent_station` de Waterfront Station. Dans le fichier [stops.txt](../../reference/#stopstxt) ci-dessous, les nœuds génériques (`location_type 3`) qui correspondent au bas de l’escalier et de l’escalator sont définis. 
 
 [** stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
...
95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,
```
 
<img class="center" src="../../../../assets/pathways.png" width=700px> 
 
 Ensuite, le fichier [pathways.txt](../../reference/#pathwaystxt) est utilisé pour relier des nœuds pour créer des chemins, où le premier enregistrement relie les nœuds relatifs au haut et au bas de l’escalier. Le `pathway_mode` est défini sur `2` pour indiquer les escaliers, et le dernier champ décrit que les passagers peuvent aller dans les deux sens (monter et descendre) dans les escaliers. 
 
 De même, le deuxième enregistrement décrit l’escalier roulant (`pathway_mode` défini sur `4`). Étant donné que les escaliers mécaniques ne peuvent se déplacer que dans une seule direction, le champ `is_bidirectional` est défini sur `0`, donc l’escalier roulant se déplace dans un sens, du nœud `96` à `91` (vers le haut). 
 
 [** pathways.txt**](../../reference/#pathwaystxt) 
 
```
pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
stairsA,90,95,2,1
escalatorA,96,91,4,0
```
 
### Décrire les ascenseurs et les sentiers 
 
 L’ascenseur de la rue Granville amène les passagers vers un sentier au niveau du hall où l’escalier roulant et les escaliers se terminent. L’ascenseur au niveau de la surface est déjà défini comme une entrée de station au-dessus (`stop_id` `92`). Par conséquent, la porte de l’ascenseur au niveau du hall doit également être définie. 
 
 De plus, comme le montre la figure ci-dessous, il existe une passerelle souterraine qui relie le bas des escaliers, l’escalier roulant et l’ascenseur de la rue Granville au bâtiment principal de la gare. Par conséquent, deux nœuds supplémentaires sont créés pour définir les sections de passerelle. 

<img class="center" src="../../../../assets/pathways-2.png" width=500px>

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
…
97,Underground walkway turn,49.286253,-123.112660,3,12034,
98,Underground walkway end,49.286106,-123.112428,3,12034,
99,Elevator_concourse,49.285257,-123.114163,3,12034,
```
 
<img class="center" src="../../../../assets/pathways-3.png" width=500px>

Enfin, les nœuds sont connectés entre eux pour définir le chemin souterrain comme indiqué dans le fichier [pathways.txt](../../reference/#pathwaystxt) ci-dessous :

[**pathways.txt**](../../reference/#pathwaystxt)

```
pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
underground_walkway1,99,96,1,1
underground_walkway2,96,95,1,1
underground_walkway3,95,97,1,1
underground_walkway4,97,98,1,1
```
 
## Ajouts futurs à GTFS-Pathways 
 
 Tandis que la spécification de base de GTFS-Pathways a été complètement intégré dans GTFS, il est reconnu que des informations supplémentaires sur l’accessibilité pourraient être modélisées et seraient utiles aux usagers. Cela inclut des informations telles que les instructions de synthèse vocale, les informations sur l’assistance en fauteuil roulant, les rapports de panne d’équipement, les fermetures d’entrée ou de sortie prévues ou programmées et les pannes d’ascenseurs et d’escaliers mécaniques. Vous pouvez en savoir plus sur les parties restantes [dans ce document](http://bit.ly/gtfs-pathways).