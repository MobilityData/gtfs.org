---
search:
  exclude: true
---

# Itinéraires, arrêts et trajets

<hr/>

## Itinéraires

Les itinéraires sont au cœur des opérations de transport en commun à itinéraire fixe car ils décrivent la portée géographique d'un réseau de transport en commun. Dans GTFS, la définition des itinéraires est la première étape de la description des opérations d'une agence de transport.

La première étape consiste à ajouter les informations sur l'agence, comme indiqué dans le fichier [agency.txt](../../reference/#agencytxt) ci-dessous. Ce fichier contient des informations de haut niveau sur l'agence.

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
    CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000

Calgary Transit exploite le TLR, le BRT, le service de bus régulier, le transport adapté et le transport à la demande à Calgary, AB. Dans cet exemple, deux itinéraires sont définis, le premier est un bus et le second un LRT. À l'aide du fichier [routes.txt](../../reference/#routestxt), chaque itinéraire se voit attribuer un id unique, un nom court et un nom long pour faciliter la lecture.

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
    CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
    CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff

Le cinquième champ`route_type`) est utilisé pour différencier les types d'itinéraires :

- Le premier est un bus, donc `route_type=3`.
- Le second est un LRT, donc `route_type=0`.
- Une liste complète des valeurs pour `route_type` peut être trouvée [ici](../../reference/#routestxt).

Les champs restants contiennent des informations supplémentaires telles qu'une url spécifique à la ligne ainsi que des couleurs propres à l'agence pour représenter le service sur une carte.

<hr/>

## Arrêts

Dans GTFS, les arrêts et les stations sont décrits à l'aide du fichier [stops.txt](../../reference/#stopstxt), ci-dessous, un arrêt de bus est défini dans le premier enregistrement et une station LRT est définie dans le second enregistrement.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
    8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
    6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,0

- `stop_id` est un identifiant unique
- Les champs`stop_code` et `stop_name` contiennent généralement des informations destinées aux usagers.
- L'emplacement exact est fourni à l'aide de coordonnées`(stop_lat` et `stop_lon`)
- Le sixième champ`(location_type`) est utilisé pour différencier les arrêts des stations.
- Le premier enregistrement correspond à un arrêt de bus, donc `location_type=0`.
- Le deuxième enregistrement correspond à une station, donc `location_type=1`.
- Une liste complète des valeurs de ` location_type  `peut être trouvée [ici](../../reference/stopstxt).

<hr/>

## Trajets

Après avoir décrit les lignes de l'agence, il est maintenant possible de décrire les trajets qui sont desservis par chaque ligne.

Tout d'abord, la durée du service doit être définie à l'aide du [calendar.txt](../../reference/#calendartxt).

[**calendar.txt**](../../reference/#calendartxt)

    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    weekend_service,0,0,0,0,0,1,1,20220623,20220903

Ici, on décrit un service qui ne fonctionne que le samedi et le dimanche, les champs pour ces jours sont donc remplis avec 1, et les champs pour les autres jours sont remplis avec zéro. Ce service fonctionne du 23 juin 2022 au 3 septembre 2022, comme l'indiquent les champs `start_date` et `end_date`.

Dans cet exemple, le fichier [trips.txt](../../reference/#tripstxt) décrit 3 trajets de week-end qui sont desservis par la ligne MAX Orange décrite ci-dessus.

[**trips.txt**](../../reference/#tripstxt)

    route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
    303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
    303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
    303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027

- Le `route_id` [routes.txt](../../reference/#routestxt) qui correspond à MAX Orange est listé.
- Le `service_id` du fichier [calendar.txt](../../reference/#calendartxt) qui correspond aux week-ends est listé.
- Chaque enregistrement contient un id unique pour chaque trip

Le text l'indicatif est fourni, ce qui correspond à ce qui est généralement affiché sur les panneaux à l'intérieur et à l'extérieur du bus.

- Le champ `direction_id` permet de distinguer les trajets d'un même itinéraire allant dans des directions différentes. Par exemple, la distinction entre les trajets entrants et les trajets sortants - ou les trajets vers le sud et les trajets vers le nord.
  - Dans ce cas, les trajets vers Saddletowne ont une `direction_id=0` et les trajets vers Brentwood ont une `direction_id=1`. Les valeurs de direction_id n'ont pas de signification intrinsèque, elles sont uniquement utilisées pour attribuer une direction de déplacement par rapport à une autre.
- Le `shape_id` de [shapes.txt](../../reference/#shapestxt) qui correspond à la ligne MAX Orange vers Saddletowne est listé pour le premier enregistrement et celui de la ligne MAX Orange vers Brentwood est listé pour les deuxième et troisième enregistrements.

Le `shape_id=3030026` correspond au MAX Orange vers Saddletowne. Le fichier ci-dessous comprend des informations sur les points qui délimitent le parcours ainsi que la distance entre ces points. Grâce à ces informations, il est possible de tracer l'itinéraire sur une carte à des fins de planification des trip ou d'analyse.

[**shapes.txt**](../../reference/#shapestxt)

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

<hr/>

## Exceptions de service

Il est possible de définir des exceptions au service, telles que des jours de service ajoutés jours spéciaux) ou supprimés (par exemple, pas de service les jours fériés).

Par exemple, s'il n'y a pas de service programmé le dimanche 17 juillet 2022 - alors cette date peut être supprimée de `weekend_service` dans [calendar.txt](../../reference/#calendartxt) en divisant le service en deux :

| Service            | start      | end        |
| ------------------ | ---------- | ---------- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

Cependant, cela complique le fichier puisque `service_id` est cassé en deux et cette cassure se répercutera en cascade sur [trips.txt](../../reference/#tripstxt). Au lieu de cela, cela peut être fait d'une manière plus facile en utilisant [calendar_dates.txt](../../reference/#calendar_datestxt) comme indiqué ci-dessous :

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

    service_id,date,exception_type
    weekend_service,20220623,2

- Le `service_id` `weekend_service` est répertorié.
- La date du service supprimé ou ajouté est indiquée sous la rubrique `date` (17 juillet 2022).
- Le champ `exception_type` a la valeur 2, ce qui signifie que le service est supprimé pour ce jour.

[Exemple de source](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)
