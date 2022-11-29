---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/fares-v2.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>


# Fares V2

<hr/>

Fares V2 est un projet d'extension GTFS qui vise à aborder les limitations de Fares V1. Ce projet d'extension est adopté par itérations, et les exemples ci-dessous montrent ce qui peut être modélisé en utilisant la partie de Fares V2 qui a été adoptée dans la spécification officielle. Voir plus d'informations sur le projet d'extension Fares V2 dans la section [Extensions](../../../extensions).

Dans l'intervalle, les producteurs peuvent mettre en œuvre Fares V2 parallèlement à Fares V1 dans le même ensemble de données, car il n'y a pas de conflit technique entre les deux. Les consommateurs auront le choix de la mise en œuvre à utiliser indépendamment de l'autre. Les consommateurs auront le choix de l'implémentation à consommer indépendamment de l'autre. Avec l'adoption et l'approbation suffisante de Fares V2, Fares V1 peut être déprécié dans le futur.

## Définir un tarif de transport en commun

Il y a plusieurs façons de payer les tarifs pour utiliser le système de transport TTC à Toronto. La TTC propose deux options de tarifs en fonction de la méthode de paiement. Un tarif adulte est de 3,20 CAD pour voyager si l'on utilise une carte PRESTO, tandis que le même tarif est de 3 ,25 CAD pour voyager si l'on paie en espèces.

Les billets ou tarifs de transport en commun peuvent être décrits à l'aide du fichier [fare_products.txt](../../reference/#fare_productstxt). Chaque entrée correspond à un tarif spécifique.

[**fare_products.txt**](../../reference/#fare_productstxt)

    fare_product_id,fare_product_name,amount,currency
    presto_fare,PRESTO Card Fare,3.2,CAD
    cash_fare,Cash Fare,3.25,CAD

[Exemple de source](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Décrire les lieux de service dans la même zone tarifaire.

Certains organismes de transport en commun appliquent une structure tarifaire basée sur les zones. Les zones tarifaires sont des zones géographiques divisées associées à des tarifs différents. Qu'ils se déplacent à l'intérieur d'une même zone ou d'une zone à l'autre, les usagers du transport en commun doivent connaître le bon tarif. Dans le système de la TTC de Toronto, il n'y a qu'une seule zone tarifaire. Les usagers du transport en commun doivent simplement payer le même tarif pour tout trip à l'intérieur des limites de la ville de Toronto, quel que soit le moyen de transport utilisé.

Les zones tarifaires peuvent être décrites à l'aide du fichier [stops_areas.txt](../../reference/#stops_areastxt), qui attribue les arrêts des [stops.txt](../../reference/#stopstxt) aux [areas.txt](../../reference/#areastxt).

Tout d'abord, identifiez la zone (zone tarifaire).

[**areas.txt**](../../reference/#areastxt)

    area_id,area_name
    ttc_service_area,TTC Fare Zone

Ensuite, à l'aide de l'`stop_id` du fichier [stops.txt](../../reference/#stopstxt), les arrêts sont regroupés dans la zone identifiée respective (zone tarifaire).

[**stops_areas.txt**](../../reference/#stops_areastxt)

    area_id,stop_id
    ttc_service_area,262
    ttc_service_area,263
    ttc_service_area,264
    ttc_service_area,265
    ttc_service_area,266
    …

[Exemple de source](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)

<hr/>

## Créer des règles pour les trajets à trajet unique

Dans le GTFS, un tronçon tarifaire correspond à un trip qu'un usager effectue sans passer d'un mode, d'un itinéraire, d'un réseau ou d'une agence à l'autre.Un tarif unique permet aux usagers de voyager à l'intérieur de n'importe quelle paire d'arrêts de bus, de stations de métro et d'arrêts de tramway au sein du réseau de la TTC.

Les groupes d'arrêts définissent les déplacements au sein d'un réseau d'une origine à une destination (ou un ensemble d'origines à un ensemble de destinations si les identifiants de zone correspondent à des arrêts groupés). Le fichier ci-dessous décrit deux règles pour voyager n'importe où dans le réseau de la TTC. La première règle correspond à un déplacement avec un tarif PRESTO et la seconde correspond à un déplacement avec un tarif en espèces.

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

    leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
    ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
    ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare

[Exemple de source](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Créer des règles pour les transferts

Les usagers qui utilisent leur carte PRESTO pour voyager dans la TTC disposent d'une fenêtre de transfert illimitée de 2 heures. Cela signifie qu'ils peuvent effectuer un nombre illimité de correspondances entre les bus, les métros et les tramways de l'agence pendant cette période de deux heures.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

    from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
    ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer

Le fichier ci-dessus représente cela en GTFS avec les champs suivants :

- Un transfert est possible vers et depuis des trajets payés par une carte PRESTO`(ttc_trip_presto`).
- Le `transfer_count` est fixé à `-1` car il n'y a pas de limite au nombre de transferts autorisés.
- La `duration_limit` est fixée à `7200` secondes, ce qui équivaut à 2 heures.
- La `duration_limit_type` est fixée à `3`, car les usagers doivent utiliser leur carte PRESTO dès qu'ils entrent dans la zone tarifaire ou dès qu'ils montent dans un bus ou un tramway. Cela correspond à la validation du tarif d'arrival du trajet en cours et à la validation du tarif d'arrival du trajet suivant.
- Le `fare_transfer_type` est fixé à `0`, car les usagers ne paient que le premier tarif. Il n'y a pas de frais de transfert ou de second tarif pour un transfert dans la fenêtre de 2 heures. Par conséquent, le coût peut être modélisé comme la somme du premier tarif et la somme des frais de transfert.
- Les frais de transfert sont fixés à zéro car ils sont gratuits dans le système TTC. Ceci est indiqué par le `fare_product_id=free_transfer`.

[Exemple de source](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)
