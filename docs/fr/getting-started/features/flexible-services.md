# :material-transit-detour: Services flexibles 

 Les services flexibles, également appelés services à la demande, sont des services qui ne suivent pas le comportement habituel d’un service régulier et/ou fixe. 
 
## Arrêts Continus 
 
 Les arrêts continus sont utilisés lorsque les passagers peuvent être récupérés et/ou déposés entre des arrêts programmés. 
 Cela peut être spécifié soit dans `routes.txt`, indiquant que les passagers peuvent être pris en charge ou déposés à tout moment le long du trajet du véhicule pour chaque trajet de l’itinéraire, soit dans `stop_times.txt` pour une section spécifique d’un itinéraire. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)| `continuous_pickup`, `continuous_drop_off` | 
 |[routes.txt](../../../documentation/schedule/reference/#routestxt)| `continuous_pickup`, `continuous_drop_off` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre deux manières de représenter l’arrêt continu.
    </p>
    
    <p style="font-size:16px">
    Le premier échantillon montre que les ramassages et les débarquements sont autorisés à tout moment le long de l’itinéraire `RA`. 
     </p>

    <p style="font-size:16px">
    Le deuxième exemple montre que les prises en charge et les déposes sont autorisées entre le troisième et le cinquième arrêt du trajet ` AWE1`, accomplies en attribuant les valeurs `continuous_pickup` et `continuous_drop_off` à `stop_sequence=3` et `stop_sequence=4`. 
    </p>

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | route_short_name | route_type | continuous_pickup | continuous_drop_off |
        |----------|------------------|------------|-------------------|---------------------|
        | RA       |               17 |          3 |                 0 |                   0 |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | continuous_pickup | continuous_drop_off |
        |---------|--------------|----------------|---------|---------------|-------------------|---------------------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |                   |                     |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |                   |                     |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |                 0 |                   0 |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 |                 0 |                   0 |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 |                   |                     |
 
## Règles de réservation 
 
 Les règles de réservation peuvent être utilisées pour permettre aux utilisateurs de réserver un voyage sur un service répondant à la demande. Ces règles décrivent les conditions préalables nécessaires à une réservation réussie et fournissent des informations de contact auprès desquelles les utilisateurs peuvent effectuer des réservations de voyage. Cette fonctionnalité doit être utilisée conjointement avec [Lignes prédéfinis avec déviation](#itineraires-predefinis-avec-detours), [Services à la demande basés sur la zone](#services-a-la-demande-bases-sur-les-zones) et [arrêts fixes fonctionnalités à la Services à la Demande avec arrêts fixes](#services-a-la-demande-avec-arrets-fixes), si ces services nécessitent une réservation. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[booking_rules.txt](../../../documentation/schedule/reference/#booking_rulestxt)|`booking_rule_id`, `booking_type`, `prior_notice_duration_min`, `prior_notice_duration_max`, `prior_notice_last_day`, `prior_notice_last_time`, `prior_notice_start_day`, `prior_notice_start_time`, `prior_notice_service_id`, `message`, `pickup_message`, `drop_off_message`, `phone_number`, `info_url`, `booking_url` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre deux ensembles différents de règles de réservation, le premier pour les voyages qui doivent être réservés au moins un jour à l’avance (avant 13 heures) et pas plus de 14 jours avant, et un second pour les voyages qui peuvent être réservés.au moins 45 minutes avant le voyage et pas plus de 5 heures avant. 

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#booking_rulestxt"><b>booking_rules.txt</b></a> <br>
        </p>

        | booking_rule_id | booking_type | prior_notice_duration_min | prior_notice_duration_max | prior_notice_last_day | prior_notice_last_time | prior_notice_start_day | prior_notice_start_time | prior_notice_service_id | message                                                                                                                                            | pickup_message | drop_off_message | phone_number   | info_url             | booking_url             |
        |-----------------|--------------|---------------------------|---------------------------|-----------------------|------------------------|------------------------|-------------------------|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|----------------|------------------|----------------|----------------------|-------------------------|
        | route_br_1818   |            2 |                           |                           |                     1 |                  13:00 |                     14 |                    9:00 |                         | To request a ride, call 123-111-2233 before 1pm at least one business day ahead of your trip. You can book trips up to 14 business days in advace. |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |
        | route_br_4545   |            1 |                        45 |                       300 |                       |                        |                        |                         |                         | To request a ride, use the official booking system in our website, trips must be booked at least 45 min in advance                                 |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |
 
 
## Itinéraires Prédéfinis avec Détours
 
 Les Lignes prédéfinis avec déviation peuvent être utilisés pour modéliser des services flexibles où les véhicules peuvent s’écarter brièvement d’un itinéraire spécifique pour récupérer les utilisateurs qui ont réservé un voyage dans une zone spécifique le long de la itinéraire. Cela utilise une combinaison d’arrêts traditionnels (comme un service programmé régulier) et de zones utilisant `locations.geojson`. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)| `location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`| 
 |[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson )|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features :Propriétés`, `Fonctions:Propriétés:Nom_arrêt`, `Fonctions:Propriétés:Description_arrêt`, `Fonctions:Géométrie`, `Fonctions:Géométrie:Type`, `Fonctions:Géométrie:Coordonnées` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Règles de réservation](#regles-de-reservation) si le service nécessite une réservation 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre un voyage avec trois arrêts fixes qui peuvent également déposer des passagers n’importe où dans des zones spécifiques définies entre les arrêts fixes. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | arrival_time | departure_time | stop_id | location_id           | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | shape_dist_traveled | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|--------------|----------------|---------|-----------------------|---------------|------------------------------|----------------------------|-------------|---------------|---------------------|------------------------|--------------------------|
        | 4545_001 |     10:00:00 |       10:00:00 | S50122  |                       |             1 |                              |                            |             |               |                   0 |                        |                          |
        | 4545_001 |              |                |         | zone_S50122_to_S50123 |             2 |                     10:00:00 |                   10:06:00 |           1 |             3 |                     | br_1234                | br_1234                  |
        | 4545_001 |     10:06:00 |       10:06:00 | S50123  |                       |             3 |                              |                            |             |               |                 983 |                        |                          |
        | 4545_001 |              |                |         | zone_S50123_to_S50124 |             4 |                     10:06:00 |                   10:15:00 |           1 |             3 |                     | br_1234                | br_1234                  |
        | 4545_001 |     10:15:00 |       10:15:00 | S50124  |                       |             5 |                              |                            |             |               |                2109 |                        |                          |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#locationsgeojson"><b>locations.geojson</b></a> <br>
        </p>

        ~~~
        {
          "type": "FeatureCollection",
          "features": [
            {
              "id": "zone_S50122_to_S50123",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplifié, ne présentant ici que 3 coordonnées. 
                "coordinates": [
                  [
                    [
                      -73.575952,
                      45.514974
                    ],
                    [
                      -73.577314,
                      45.513433
                    ],
                    [
                      -73.569794,
                      45.5098370
                    ]
                  ]
                ]
              },
              "properties": {}
            },
        {
              "id": "zone_S50123_to_S50124",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplifié, ne présentant ici que 3 coordonnées. 
                "coordinates": [
                  [
                    [
                      -73.561332,
                      45.5085599
                    ],
                    [
                     -73.5701298,
                      45.5124057
                    ],
                    [
                      -73.571302,
                      45.5105563
                    ]
                  ]
                ]
              },
              "properties": {}
            }
           ]
        } 
        ~~~
 
## Services à la Demande Basés sur les Zones 
 
 Les services à la demande basés sur une zone sont utilisés pour modéliser des services qui permettent une prise en charge et/ou un retour à n’importe quel endroit dans une zone spécifique pour les utilisateurs qui réservent un voyage. Ces zones sont définies à l’aide de `locations.geojson`, elles ne nécessitent donc pas l’utilisation de `stops.txt`, ni de `stop_times.arrival_time` et `stop_times.departure_time`. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)| `location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`| 
 |[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson )|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features :Propriétés`, `Fonctions:Propriétés:Nom_arrêt`, `Fonctions:Propriétés:Description_arrêt`, `Fonctions:Géométrie`, `Fonctions:Géométrie:Type`, `Fonctions:Géométrie:Coordonnées` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Règles de réservation](#regles-de-reservation) si le service nécessite une réservation 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre un service qui peut prendre en charge et déposer des passagers pré-réservés n’importe où entre une zone spécifique entre 9h et 18h. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|-------------|---------------|------------------------------|----------------------------|-------------|---------------|------------------------|--------------------------|
        | 2708_001 | area_001    |             1 |                      9:00:00 |                   18:00:00 |           2 |             1 | br_3289                | br_3289                  |
        | 2708_001 | area_001    |             2 |                      9:00:00 |                   18:00:00 |           1 |             2 | br_3289                | br_3289                  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#locationsgeojson"><b>locations.geojson</b></a> <br>
        </p>

        ~~~
        {
          "type": "FeatureCollection",
          "features": [
            {
              "id": "area_001",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplifié, ne présentant ici que 3 coordonnées. 
                "coordinates": [
                  [
                    [
                      -73.644437,
                      45.5023960
                    ],
                    [
                      -73.641593,
                      45.5054392
                    ],
                    [
                      -73.636580,
                      45.5081683
                    ]
                  ]
                ]
              },
              "properties": {}
            }
          ]
        }
        ~~~
 
## Services à la Demande avec arrêts fixes 
 Les Services à la Demande avec arrêts fixes sont utilisés pour modéliser des services qui permettent de prendre en charge et/ou de déposer à n’importe quel endroit au sein d’un groupe d’arrêts prédéfinis pour les utilisateurs qui réservent un voyage. Ces groupes d’arrêts sont définis à l’aide de `location_groups.txt` et `location_group_stops.txt`. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)| `location_group_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`| 
 |[location_groups.txt](../../../documentation/schedule/reference/#location_groupstxt)| `location_group_id`, `location_group_name`| 
 |[location_group_stops.txt](../../../documentation/schedule/reference/#location_group_stopstxt)| `location_group_id`, `stop_id` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Règles de réservation](#regles-de-reservation) si le service nécessite une réservation 
 
??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre un service qui peut prendre et déposer des passagers pré-réservés à 4 arrêts différents entre 7h et 10h. 

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#location_groupstxt"><b>location_groups.txt</b></a> <br>
        </p>

        | location_group_id | location_group_name           |
        |-------------------|-------------------------------|
        | r27_stops         | Yellow Borough Route 27 stops |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#location_group_stopstxt"><b>location_group_stops.txt</b></a> <br>
        </p>

        | location_group_id | stop_id |
        |-------------------|---------|
        | r27_stops         | syb029  |
        | r27_stops         | syb030  |
        | r27_stops         | syb031  |
        | r27_stops         | syb032  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | location_group_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|-------------------|---------------|------------------------------|----------------------------|-------------|---------------|------------------------|--------------------------|
        | 2714_002 | r27_stops         |             1 |                      7:00:00 |                   10:00:00 |           2 |             1 | br_5478                | br_5478                  |
        | 2714_002 | r27_stops         |             2 |                      7:00:00 |                   10:00:00 |           1 |             2 | br_5478                | br_5478                  |
