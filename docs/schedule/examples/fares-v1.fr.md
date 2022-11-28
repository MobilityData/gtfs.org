---
search:
  exclude: true
---

<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/fares-v1.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Fares V1

<hr/>

Composé de [fare_attributes.txt](../../reference/#fare_attributestxt) et [fare_rules.txt](../../reference/#fare_rulestxt), Fares V1 a historiquement été la méthode officielle pour décrire les informations tarifaires dans GTFS. Cependant, les deux fichiers sont limités dans l'étendue des facteurs qu'ils peuvent décrire efficacement, et sont ambigus à mettre en œuvre.[Fares V2](../../examples/fares-v2/) est un projet d'extension en cours de développement actif, et il vise à aborder les limitations de Fares V1.

## Définir les règles tarifaires d'une agence

Un trip sur le réseau de métro de la Toronto Transit Commission coûte 3,20 dollars canadiens si l'usager paie avec la carte PRESTO. Les usagers peuvent également effectuer des transferts vers d'autres lignes de métro, de tramway ou de bus exploitées par la TTC dans un délai de deux heures.

Ce service peut être représenté à l'aide des fichiers [fare_attributes.txt](../../reference/#fare_attributestxt), [fare_rules.txt](../../reference/#fare_rulestxt) et [transfers.txt](../../reference/#transferstxt). Le premier fichier, [fare_attributes.txt](../../reference/#fare_attributestxt) décrit les tarifs de l'agence, ci-dessous un exemple pour le tarif presto :

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- Le prix du billet est indiqué dans les rubriques prix et `currency_type`.
- Les usagers doivent payer leur tarif aux portes de la station avant de monter dans le métro. Ceci est représenté par `payment_method=1`.
- Le champ transferts est laissé vide pour représenter les transferts illimités.
- Le champ `transfer_duration` correspond à la fenêtre de transfert de 2 heures (en secondes).

Le second fichier, [fare_rules.txt](../../reference/#fare_rulestxt), attribue les tarifs aux trajets en liant un tarif à une ligne ainsi qu'à une origine/destination sur cette ligne.

Pour cela, deux lignes de métro sont définies ci-dessous dans [routes.txt](../../reference/#routestxt):

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

Dans cet exemple, les transferts à la station Bloor-Yonge sont modélisés. Pour cela, cette station est modélisée comme deux arrêts distincts, le premier est la station Bloor qui est desservie par la ligne 1, et le second est la station Yonge, qui est desservie par la ligne 2. Les deux ont `zone_id=ttc_subway_stations` afin de regrouper toutes les stations de métro dans une seule zone tarifaire.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

Dans [fare_rules.txt](../../reference/#fare_rulestxt), le tarif PRESTO est associé aux deux lignes de métro et aux stations en utilisant les relations suivantes :

- Pour `fare_id=presto_fare`, les usagers peuvent voyager entre deux stations quelconques de la ligne 1`(route_id=line1`) et `origin_id=ttc_subway_stations` et `destination_id=ttc_subway_stations`.

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

Le troisième fichier, [transfers.txt](../../reference/#transferstxt), définit les points de correspondance entre les différents itinéraires. Pour modéliser les transferts à la station Bloor-Yonge, deux entrées sont obligatoires :

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- La première modélise les transferts de la ligne 1 à la ligne 2 en utilisant `from_route_id` et `to_route_id` de la station Bloor à la station Yonge.
- La seconde modélise les transferts de la ligne 2 à la ligne 1 en utilisant les paramètres `from_route_id` et `to_route_id` de la station Yonge à la station Bloor.
- La valeur de `transfer_type` est `0` car il n'y a pas d'exigences ou de considérations spécifiques pour les transferts.

[Exemple de source](https://www.ttc.ca/Fares-and-passes)
