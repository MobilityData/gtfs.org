# Lignes, arrêts et trajets

## Lignes 
 
 Les Lignes sont au cœur des opérations de transport en commun à itinéraire fixe car ils décrivent la portée géographique d’un réseau de transport en commun. Dans GTFS, la définition d’itinéraires est la première étape pour décrire les opérations d’une agence de transport en commun. 
 
 La première étape consiste à ajouter les informations sur l’agence comme indiqué dans le fichier [agency.txt](../../reference/#agencytxt) ci-dessous. Ce fichier contient des informations de haut niveau sur l’agence. 
 
 [**agency.txt**](../../reference/#agencytxt) 
 
```
agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000
```
 
 Calgary Transit exploite des services de TLR, de BRT, de bus réguliers, de transport adapté et de transport en commun à la demande dans Calgary, Alberta. Dans cet exemple, deux itinéraires sont définis, le premier est un bus et le second est un LRT. À l’aide du fichier [routes.txt](../../reference/#routestxt), chaque itinéraire se voit attribuer un identifiant unique, ainsi qu’un nom court ainsi qu’un nom long pour une lisibilité humaine. 
 
 [**routes.txt**](../../reference/#routestxt) 
 
```
agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff
```
 
 Le cinquième champ (`route_type`) permet de différencier les types de routes : 
 
 - Le premier est un bus, donc `route_type=3` 
 - Le second est un LRT, donc `route_type=0` 
 - Une liste complète des valeurs pour `route_type` peut être trouvée [ici](../../reference/#routestxt) 
 
 Les champs restants contiennent des informations supplémentaires, telles que ainsi qu’une URL spécifique à l’itinéraire ainsi que des couleurs spécifiques à l’agence pour représenter le service sur une carte. 

<hr> 
 
## Arrêts 
 
 Dans GTFS, les arrêts et les gares sont décrits à l’aide du fichier [stops.txt](../../reference/#stopstxt), ci-dessous, un arrêt de bus est défini dans le premier enregistrement et une station LRT est définie dans le deuxième enregistrement. 
 
 [**stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,1
```
 
 - `stop_id` est un identifiant unique
 - `stop_code` et `stop_name` contiennent généralement des informations destinées au passager
 - L’emplacement exact est fourni à l’aide de coordonnées (`stop_lat` et `stop_lon`) 
 - Le sixième champ (`location_type`) est utilisé pour différencier les arrêts de stations
 - La première entrée correspond à un arrêt de bus, donc `location_type=0` 
 - La deuxième entrée correspond à une station, donc `location_type=1` 
 - Une liste complète des valeurs pour `location_type ` peut être trouvée [ici](../../reference/#stopstxt). 

<hr> 
 
## Trajets 
 
 Après avoir décrit les itinéraires de l’agence, il est désormais possible de décrire les déplacements desservis par chaque itinéraire. 
 
 Tout d’abord, l’étendue du service doit être définie à l’aide de [calendar.txt](../../reference/#calendartxt). 
 
 [**calendar.txt**](../../reference/#calendartxt) 
 
```
service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
weekend_service,0,0,0,0,0,1,1,20220623,20220903
```
 
 Ici, un service qui fonctionne uniquement les samedis et dimanches est décrit, donc le les champs pour ces jours sont renseignés avec 1 et les champs pour les jours restants sont renseignés avec zéro. Ce service fonctionne du 23 juin 2022 au 3 septembre 2022, comme indiqué sous les champs `start_date` et `end_date`. 
 
 Dans cet exemple, le fichier [trips.txt](../../reference/#tripstxt) décrit 3 voyages de week-end desservis par l’itinéraire MAX Orange décrit ci-dessus. 
 
 [**trips.txt**](../../reference/#tripstxt) 
 
```
route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027
``` 
 
 - Le `route_id` de [routes.txt](../../reference/#routestxt) qui correspond à MAX Orange est répertorié 
 - Le `service_id` de [calendar.txt](../../reference/#calendartxt) qui correspond aux week-ends est répertorié 
 - Chaque enregistrement contient un identifiant unique pour chaque voyage. 
 Le texte du panneau de signalisation est fourni, ce qui est généralement affiché sur les panneaux à l’intérieur et à l’extérieur du bus
 - Le champ `direction_id` permet de distinguer les trajets du même itinéraire allant dans des directions différentes. Par exemple, faites la distinction entre les trajets entrants et les trajets aller, ou les trajets vers le sud et les trajets vers le nord. 
    - Dans ce cas, les trajets vers Saddletowne ont un `direction_id=0` et les trajets vers Brentwood ont un `direction_id=1`. Les valeurs dans direction_id n’ont aucune signification inhérente, elles sont uniquement utilisées pour attribuer un sens de déplacement par rapport à un autre
 - Le `shape_id` de [shapes.txt](../../reference/#shapestxt) qui correspond au La route MAX Orange vers Saddletowne est répertoriée pour le premier enregistrement et celle de la route MAX Orange vers Brentwood est répertoriée pour les deuxième et troisième enregistrements 
 
 
 Le `shape_id=3030026` correspond au MAX Orange vers Saddletowne. Le fichier ci-dessous comprend des informations sur les points qui délimitent le trajet, ainsi que la distance entre chaque point et le début du trajet. Avec ces informations, il est possible de tracer l’itinéraire sur une carte à des fins de planification de voyage. 
 
 [**shapes.txt**](../../reference/#shapestxt) 
 
```
shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
3030026,51.086506,-114.132259,10001,0.000
3030026,51.086558,-114.132371,10002,0.010
3030026,51.086781,-114.132865,10003,0.052
3030026,51.086938,-114.133179,10004,0.080
3030026,51.086953,-114.133205,10005,0.083
3030026,51.086968,-114.133224,10006,0.085
3030026,51.086992,-114.133249,10007,0.088
3030026,51.087029,-114.133275,10008,0.093
3030026,51.087057,-114.133286,10009,0.096
3030026,51.087278,-114.133356,10010,0.121
3030026,51.087036,-114.132864,10011,0.165
3030026,51.086990,-114.132766,10012,0.173
3030026,51.086937,-114.132663,10013,0.183
```
 
<hr> 
 
## Exceptions au service 
 
 Il est possible de définir des exceptions au service telles que des jours de service ajoutés (jours spéciaux) ou des jours de service supprimés (comme l’absence de service les jours fériés). 
 
 Par exemple, s’il n’y a pas de service programmé le dimanche 17 juillet 2022, cette date peut être supprimée de `weekend_service` dans [calendar.txt](../../reference/#calendartxt) en rompant le service en deux : 
 
| Service | Start | End |
| ----- | ----- | ----- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |
 
 Cependant, cela complique le fichier puisque `service_id` est cassé en deux et cette rupture se répercutera sur [trips.txt](../../reference/#tripstxt). Au lieu de cela, cela peut être fait de manière plus simple en utilisant [calendar_dates.txt](../../reference/#calendar_datestxt) comme indiqué ci-dessous : 
 
 [**calendar_dates.txt**](../../reference/#calendar_datestxt) 
 
```
service_id,date,exception_type
weekend_service,20220717,2
```
 
 - Le `service_id` `weekend_service` est répertorié 
 - La date du service supprimé ou ajouté est répertoriée sous `date` (17 juillet 2022) 
 - Le champ `exception_type` est défini sur 2, ce qui signifie que le service est supprimé pour ce jour 
 
 <sup>[Source de l'exemple](https:)</sup>