---
search:
  exclude: true
---

# Chemins d'accès

<hr/>

## Décrire l'emplacement des entrées et sorties de la station

Avec GTFS, il est possible de décrire précisément les stations en utilisant des informations sur les entrées et les intérieurs des stations. Cet exemple décrit des sections de la station Waterfront dans le centre-ville de Vancouver. La station fait partie du réseau Skytrain de la ville et est desservie par la Canada Line, l'Expo Line, le SeaBus et le West Coast Express. Trois entrées au niveau de la rue permettent aux usagers d'entrer et de sortir de la station. Le reste de la station est souterrain, avec un niveau de hall pour la validation des titres de transport et un niveau inférieur avec des quais.

Tout d'abord, l'emplacement de la station et ses entrées sont définis dans [stops.txt](../../reference/#pathwaystxt):

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

Dans le fichier ci-dessus, le premier enregistrement concerne l'emplacement de la station, d'où la valeur `1` dans le paramètre `location_type`. Les cinq autres enregistrements concernent les trois entrées de la station (cinq enregistrements sont nécessaires car l'entrée Granville comporte en fait trois entrées distinctes, un escalier, un escalier mécanique et un ascenseur). Ces cinq enregistrements sont définis comme des entrées puisque le `location_type` est défini sur `3`.

En outre, le `stop_id` de la station Waterfront est indiqué sous `parent_station` pour les entrées afin de les associer à la station. Les entrées accessibles ont la valeur `1` pour le paramètre `wheelchair_boarding` et la valeur `2` pour les entrées non accessibles.

## Décrire les escaliers et les escalators

L'entrée de la station Waterfront à Granville street a un ascenseur, un escalator et des escaliers, les entrées sont définies comme des noeuds ci-dessus dans [stops.txt](../../reference/#stopstxt). Pour connecter les entrées aux sections intérieures de la station, des noeuds supplémentaires doivent être créés dans le fichier [stops.txt](../../reference/#stopstxt) sous le `parent_station` de Waterfront Station. Dans le fichier [stops.txt](../../reference/#stopstxt) ci-dessous, des noeuds génériques`(location_type 3`) qui correspondent au bas de l'escalier et de l'escalator sont définis.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width="700px"/>

Ensuite, le fichier [pathways.txt](../../reference/#pathwaystxt) est utilisé pour relier les nœuds afin de créer des chemins, où le premier enregistrement relie les nœuds correspondant au haut et au bas de l'escalier. Le `pathway_mode` est défini sur `2` pour indiquer les escaliers, et le dernier champ décrit que les passagers peuvent aller dans les deux sens (vers le haut et vers le bas) sur les escaliers.

De même, le deuxième enregistrement décrit l'escalier mécanique`(pathway_mode` défini sur `4`). Comme les escaliers mécaniques ne peuvent se déplacer que dans une seule direction, le champ `is_bidirectional` est défini à `0`, et l'escalier mécanique se déplace donc dans un seul sens, du nœud `96` au `91` (vers le haut).

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## Décrire les ascenseurs et les voies d'accès

L'ascenseur de la rue Granville amène les passagers à une passerelle au niveau du hall, où end l'escalator et les escaliers. L'ascenseur au niveau de la surface est déjà défini comme une entrée de station au-dessus`stop_id` `92`). Par conséquent, la porte de l'ascenseur au niveau du hall doit également être définie.

De plus, comme le montre la figure ci-dessous, il existe une passerelle souterraine qui relie le bas de l'escalier, l'escalator et l'ascenseur de la rue Granville au bâtiment principal de la station. Par conséquent, deux nœuds supplémentaires sont créés pour définir les sections de la passerelle.

<img class="center" src="../../../assets/pathways-2.png" width="500px"/>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width="500px"/>

Enfin, les nœuds sont reliés entre eux pour définir le chemin souterrain, comme le montre le fichier [pathways.txt](../../reference/#pathwaystxt) ci-dessous :

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
