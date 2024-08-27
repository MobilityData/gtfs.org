# Fares v1 
 
 Composé de [fare_attributes.txt](../../reference/#fare_attributestxt) et [fare_rules.txt](../../reference/#fare_rulestxt), Fares v1 a historiquement été la méthode officielle pour décrire les informations tarifaires dans GTFS. Cependant, les deux fichiers sont limités dans l’étendue des facteurs qu’ils peuvent décrire efficacement et sont ambigus à mettre en œuvre. 
 [Fares v2](../../examples/fares-v2/) est un projet d’extension en cours de développement actif et vise à remédier aux limitations de Fares v1. 
 
## Définir les règles tarifaires d’une agence 
 
 Un trajet sur le réseau de métro de la Toronto Transit Commission coûte 3,20 $ CAD si les usagers paient avec la carte PRESTO. Les usagers peuvent également prendre un transfert vers d’autres lignes de métro, de tramway ou de bus exploitées par la TTC dans un délai de deux heures. 
 
 Ce service peut être représenté à l’aide des fichiers [fare_attributes.txt](../../reference/#fare_attributestxt), [fare_rules.txt](../../reference/#fare_rulestxt) et [transfers.txt](../../reference/#transferstxt). Le premier fichier, [fare_attributes.txt](../../reference/#fare_attributestxt) décrit les tarifs de l’agence, ci-dessous un exemple pour le tarif presto : 
 
 [**fare_attributes.txt**](../../reference/#fare_attributestxt) 
 
```
fare_id,price,currency_type,payment_method,transfers,transfer_duration
presto_fare,3.2,CAD,1,,7200
```

- Le prix du tarif est indiqué sous prix et `currency_type` 
 - Les usagers doivent payer leur titre de transport aux portiques de la station avant de monter dans le métro. Ceci est représenté par `payment_method=1` 
 - Le champ `transferts` est laissé vide pour représenter les transferts illimités
 - Le champ `transfer_duration` correspond à la fenêtre de transfert de 2 heures (en secondes) 
 
 Le deuxième fichier, [fare_rules.txt](../../reference/#fare_rulestxt) attribue des tarifs aux trajets en liant un tarif à un itinéraire ainsi qu’une origine/destination sur cet itinéraire. 
 
 Pour cela, deux lignes de métro sont définies ci-dessous dans [routes.txt](../../reference/#routestxt) : 
 
 [**routes.txt**](../../reference/#routestxt) 
 
```
agency_id,route_id,route_type
TTC,Line1,1
TTC,Line2,1
``` 
 
 Dans cet exemple, les transferts à La station Bloor-Yonge sont modélisés. Pour cela, cette station est modélisée comme deux arrêts distincts, le premier est la station Bloor qui est desservie par la ligne 1, et le second est la station Yonge, qui est desservie par la ligne 2. Les deux ont `zone_id=ttc_subway_stations` afin de regrouper toutes les stations de métro dans une zone tarifaire unique. 
 
 [**stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_name,stop_lat,stop_lon,zone_id
Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations
```
 
 Dans [fare_rules.txt](../../reference/#fare_rulestxt), le Le tarif PRESTO est associé à la fois aux lignes et aux stations de métro en utilisant les relations suivantes : 
 
 - Pour `fare_id=presto_fare`, les usagers peuvent voyager entre deux stations de la ligne 1 (`route_id=line1`) et `origin_id=ttc_subway_stations` et `destination_id=ttc_subway_stations`. 
 
 [**fare_rules.txt**](../../reference/#fare_rulestxt) 
 
```
fare_id,route_id,origin_id,destination_id
presto_fare,line1,ttc_subway_stations,ttc_subway_stations
presto_fare,line2,ttc_subway_stations,ttc_subway_stations
```
 
 Le troisième fichier, [transfers.txt](../../reference/#transferstxt) définit les points de transfert entre les différents itinéraires. Pour modéliser les transferts à la gare de Bloor-Yonge, deux entrées sont requises : 
 
 [**transfers.txt**](../../reference/#transferstxt) 
 
```
from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
Bloor,Yonge,line1,line2,0
Yonge,Bloor,line2,line1,0
```
 
 - La première entrée modélise les transferts de la ligne 1 à la ligne 2 en utilisant `from_route_id` et `to_route_id` de la station Bloor à la station Yonge
 - La deuxième entrée modélise les transferts de la ligne 2 à la ligne 1 en utilisant `from_route_id` et `to_route_id` de la station Yonge à la station Bloor
 - La valeur de `transfer_type` est `0` puisqu’il n’y a pas d’exigences ou de considérations spécifiques pour les transferts 
 
 <sup>[Source de l'exemple](https://www.ttc.ca/Fares-and-passes)</sup> 
