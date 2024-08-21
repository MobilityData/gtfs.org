# :material-plus-box-multiple-outline: Modules Complémentaires à Base 
 Ces fonctionnalités étendent les fonctionnalités décrites dans Base, servant soit à améliorer l’exhaustivité d’un ensemble de données GTFS pour offrir une meilleure expérience aux passagers, soit à faciliter la collaboration entre les agences., les fournisseurs de données et les réutilisateurs de données. Ces améliorations peuvent impliquer l’introduction de nouveaux champs dans les fichiers décrits dans Base ou la création de nouveaux fichiers. 
 
## Informations sur le Flux 
 
 Les Informations sur le Flux communiquent des informations importantes sur le flux, telles que sa validité ( date de début et de fin), l’organisation de publication et les informations de contact pour les demandes de renseignements concernant l’ensemble de données GTFS et les pratiques de publication de données. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[feed_info.txt](../../../documentation/schedule/reference/#feed_infotxt)| `feed_publisher_name`, `feed_publisher_url`, `feed_lang`, `default_lang`, `feed_start_date`, `feed_end_date`, `feed_version`, `feed_contact_email`, `feed_contact_url` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#feed_infotxt"><b>feed_info.txt</b></a> <br>
        </p>

        | feed_publisher_name	      | feed_publisher_url   | feed_lang | default_lang | feed_start_date | feed_end_date | feed_version | feed_contact_email | feed_contact_url             |
        |--------------------------|----------------------|-----------|--------------|-----------------|---------------|--------------|--------------------|------------------------------|
        | Greater Region Transport | https://www.gra1.org | en        | en           |        20240101 |      20241231 |          3.1 | support@gra1.org   | https://www.gra1.org/support |
 
## Tracé des lignes 
 Des Tracé des lignes peuvent être définies et associées à des trajets, permettant aux applications de planification d’itinéraire d’afficher les trajets sur une carte et d’informer les usagers de la distance qu’ils doivent parcourir dans un véhicule de transport en commun. Les champs `shape_dist_traveled` sont utilisés pour déterminer par programme la quantité de forme à dessiner lors de l’affichage d’une carte aux passagers. 
 Lors de la définition des Tracé des lignes, il existe un équilibre entre leur niveau de détail (par exemple suivre la courbure exacte des routes) et la transmission efficace uniquement des informations nécessaires. 
 
 |Fichiers inclus |Champs inclus | 
 |------------------------|-------------------| 
 |[shapes.txt](../../../documentation/schedule/reference/#shapestxt) | `shape_id`, `shape_pt_lat`, `shape_pt_lon`, `shape_pt_sequence`, `shape_dist_traveled` | 
 |[trips.txt](../../../documentation/schedule/reference/#tripstxt) | `shape_id` | 
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt) | `shape_dist_traveled` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre une partie d’une forme du flux TriMet GTFS (téléchargez-le <a     href="https://developer.trimet.org/GTFS.shtml">ici</a>). <br><br>
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#shapestxt">shapes.txt</a> <br>
        </p>
    
        | shape_id | shape_pt_lat | shape_pt_lon | shape_pt_sequence | shape_dist_traveled |
        | --------- | ------------- | ------------- | ------------------ | ------------------- |
        | 558674     | 45.47623       | -122.721885    | 1                   | 0.0                  |
        | 558674     | 45.476235      | -122.72236     | 2                   | 121.9                |
        | 558674     | 45.476237      | -122.722523    | 3                   | 163.7                |
        | 558674     | 45.476242      | -122.723024    | 4                   | 292.2                |
        | 558674     | 45.476244      | -122.72316     | 5                    | 327.1               |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt">trips.txt</a> <br>
        </p>
        
        |trip_id |shape_id|
        |--------|--------|
        |13302375|558674  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt">stop_times.txt</a> <br>
        </p>
        
        |trip_id |stop_sequence|shape_dist_traveled|
        |--------|-------------|-------------------|
        |13302375|1            |0                  |
        |13302375|2            |461.7              |
        |13302375|3            |1245               |
 
## Couleurs des lignes 
 
 L’utilisation des Couleurs des lignes permet de représenter et de communiquer avec précision la palette de couleurs attribuée à des itinéraires spécifiques par les directives de conception de l’agence. Cela permet aux utilisateurs d’identifier facilement les services de transport en commun par leur couleur officielle. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[routes.txt](../../../documentation/schedule/reference/#routestxt)| `route_color`, `route_text_color` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre que la route « RA » est orange en utilisant un code de couleur HEX « D95700 » et que le texte doit être rendu en noir en utilisant un code de couleur HEX « 0 ».
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | agency_id | route_short_name | route_long_name    | route_type | route_color | route_text_color |
        |----------|-----------|------------------|--------------------|------------|-------------|------------------|
        | RA       | agency001 |               17 | Mission - Downtown |          3 | D95700      |                0 | 

 
## Vélo Autorisé 
 
 Vélo Autorisé indique si les véhicules effectuant des déplacements spécifiques sont en mesure d’accueillir des vélos ou non, aidant ainsi les utilisateurs à planifier et à accéder aux services qui leur permettent d’effectuer des déplacements multimodaux. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[trips.txt](../../../documentation/schedule/reference/#tripstxt)| `bikes_allowed` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 
??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant précise que le véhicule utilisé dans le voyage ` AWE1` peut accueillir au moins un vélo à bord (`bikes_allowed=1`), et que le véhicule utilisé dans le voyage `AWE2` ne le peut pas (`bikes_allowed=2`).
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | bikes_allowed |
        |----------|------------|---------|---------------|
        | RA       | WE         | AWE1    |             1 |
        | RA       | WE         | AWE2    |             2 |
 
## Girouette 
 
 Girouette permet de communiquer la signalisation utilisée par les véhicules indiquant la destination du voyage, permettant ainsi aux utilisateurs d’identifier plus facilement le bon service de transport en commun. Cette fonctionnalité prend en charge les changements de phare le long d’un itinéraire spécifique. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[trips.txt](../../../documentation/schedule/reference/#tripstxt)| `trip_headsign` | 
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)| `stop_headsign` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    Dans l’exemple suivant, le premier tableau précise les enseignes à utiliser par les trajets `AWE1` et `AWE2`, et le second indique que l’enseigne de `AWE1` sera modifiée après l’arrêt `TAS004`, remplaçant celle spécifié dans `trips.txt`. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | trip_headsign |
        |----------|------------|---------|---------------|
        | RA       | WE         | AWE1    | Downtown      |
        | RA       | WE         | AWE2    | Mission       |

    
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign          |
        |---------|--------------|----------------|---------|---------------|------------------------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |                        |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |                        |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |                        |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 | Downtown - Main Square |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 | Downtown - Main Square |

 
## Types d’emplacement 
 
 Les Types d’emplacement sont utilisés pour classer les zones clés au sein des gares de transport en commun telles que les sorties/entrées, les nœuds ou les zones d’embarquement, ainsi que leurs relations. Les Types d’emplacement servent de base à la modélisation des gares de transport en commun à l’aide de Parcours. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[stops.txt](../../../documentation/schedule/reference/#stopstxt)| `location_type`, `parent_station` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre plusieurs emplacements au sein d’une station de transport en commun dans `stops.txt`: la station parent, représentant l’emplacement principal, et ses emplacements enfants tels que les quais, les entrées/existes et les nœuds génériques. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id      | stop_name                                             | location_type | parent_station |
        |--------------|-------------------------------------------------------|---------------|----------------|
        | Station_A102 | Main Street station                                   |             1 |                |
        | A102_B01     | Main Street station - North Platform                  |             0 | Station_A102   |
        | A102_B02     | Main Street station - South Platform                  |             0 | Station_A102   |
        | A102_E01     | Main Street station - Entrance/Exit                   |             2 | Station_A102   |
        | A102_S01     | Main Street station - Top of entrance stairs          |             3 | Station_A102   |
        | A102_S02     | Main Street station - Bottom of entrance stairs       |             3 | Station_A102   |
        | A102_S03     | Main Street station - Top of north platform stairs    |             3 | Station_A102   |
        | A102_S04     | Main Street station - Bottom of north platform stairs |             3 | Station_A102   |
        | A102_S05     | Main Street station - Top of south platform stairs    |             3 | Station_A102   |
        | A102_S06     | Main Street station - Bottom of south platform stairs |             3 | Station_A102   |
        | A102_F01     | Main Street station - Paid side of fare gate          |             3 | Station_A102   |
        | A102_F02     | Main Street station - Unpaid side of fare gate        |             3 | Station_A102   |

## Fréquences
 
 Le service basé sur la fréquence peut être utilisé pour modéliser des services qui fonctionnent sur une fréquence régulière, tels que des bus circulant toutes les 10 minutes ou des services de métro fonctionnant 2 minutes dans des intervalles de temps spécifiés. 
 Lors de la modélisation d’un service basé sur la fréquence, `stop_times.txt` contient les temps relatifs entre les arrêts afin de déterminer les temps à afficher aux passagers. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[frequencies.txt](../../../documentation/schedule/reference/#frequenciestxt)| `trip_id`, `start_time`, `end_time`, `headway_secs`, `exact_times` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 
??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre deux trajets distincts : le trajet ` AWE1` qui s’exécute toutes les 30 minutes (`headway_secs=1800`) et le trajet `AWE2` qui s’exécute toutes les 15 minutes (`headway_secs=900`).
    <p style="font-size:16px">
    Le champ `exact_times` indique si l’horaire suit l’heure de début précise saisie dans le champ ’start_time’ :
    <p style="font-size:16px"> 
    - Le trajet `AWE1` part toutes les 30 minutes de 6h10 à 12h00.
    <p style="font-size:16px">
    - le trajet  `AWE2` part à 6h00, 6h15, 6h30, etc.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#frequenciestxt"><b>frequencies.txt</b></a> <br>
        </p>

        | trip_id | start_time | end_time | headway_secs | exact_times |
        ---------|------------|----------|--------------|-------------|
         AWE1    |    6:10:00 | 12:00:00 |         1800 |           0 |
         AWE2    |    6:00:00 | 19:50:00 |          900 |           1 |
 
## Transferts 
 
 Les Transferts fournissent des détails sur les transitions entre différents segments (ou étapes) de voyage, permettant aux planificateurs de voyage de déterminer la faisabilité des voyages incluant des transferts. Spécifier les transferts n’implique pas que les passagers ne peuvent pas effectuer de transfert ailleurs, cela indique simplement si certains transferts ne sont pas possibles ou nécessitent un temps minimum de transfert. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[transfers.txt](../../../documentation/schedule/reference/#transferstxt)| `from_stop_id`, `to_stop_id`, `from_route_id`, `to_route_id`, `from_trip_id`, `to_trip_id`, `transfer_type`, `min_transfer_time` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 
??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre trois transferts différents : un entre les arrêts qui nécessite un temps de transfert minimum de 5 minutes, un point de transfert chronométré entre deux itinéraires et un transfert au siège entre deux trajets effectués par le même véhicule. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#transferstxt"><b>transfers.txt</b></a> <br>
        </p>

        | from_stop_id | to_stop_id | from_route_id | to_route_id | from_trip_id | to_trip_id | transfer_type | min_transfer_time |
        |--------------|------------|---------------|-------------|--------------|------------|---------------|-------------------|
        | s6           | s7         |               |             |              |            |             2 |               300 |
        |              |            |               |             | PL04-003     | DL57-008   |             4 |                   |
        |              |            | BR09          | CR01        | BR09-012     | CR01-005   |             1 |                   |

 
## Traductions 
 
 Les Traductions permettent de fournir des informations de service telles que les noms de stations dans plusieurs langues, permettant ainsi aux planificateurs de voyages d’afficher les informations dans une langue spécifique en fonction de la langue de l’utilisateur et des paramètres de localisation. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[translations.txt](../../../documentation/schedule/reference/#translationstxt)| `table_name`, `field_name`, `language`, `translation`, `record_id`, `record_sub_id`, `field_value` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 
??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre les traductions françaises et espagnoles fournies pour deux champs utilisés dans `routes.txt`: `route_long_name` et `route_desc`. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#translationstxt"><b>translations.txt</b></a> <br>
        </p>

        | table_name | field_name      | language | translation                                           | record_id | record_sub_id | field_value |
        |------------|-----------------|----------|-------------------------------------------------------|-----------|---------------|-------------|
        | routes     | route_long_name | ES       | Mission - Centro                                      | RA        |               |             |
        | routes     | route_long_name | FR       | Mission - Centre ville                                | RA        |               |             |
        | routes     | route_desc      | ES       | La ruta "A" viaja desde Lower Mission hasta el centro | RA        |               |             |
        | routes     | route_desc      | FR       | La route « A » relie Lower Mission au centre-ville.   | RA        |               |             |
 
## Attributions 
 
 Attributions permet de partager des détails supplémentaires concernant les organismes impliqués dans la création du jeu de données (producteurs, opérateurs et/ou autorités, etc.). 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[attributions.txt](../../../documentation/schedule/reference/#attributionstxt) | `attribution_id`, `agency_id`, `route_id`, `trip_id`, `organization_name`, `is_producer`, `is_operator`, `is_authority`, `attribution_url`, `attribution_email`, `attribution_phone` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 
??? note "Exemples de données"

    <p style="font-size:16px"> 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#attributionstxt"><b>attributions.txt</b></a> <br>
        </p>

        | attribution_id | agency_id | route_id | trip_id | organization_name        | is_producer | is_operator | is_authority | attribution_url                  | attribution_email       | attribution_phone |
        |----------------|-----------|----------|---------|--------------------------|-------------|-------------|--------------|----------------------------------|-------------------------|      -------------------|
        | op01           | tb        |          |         | Transit Bus              |             |           1 |              | https://www.transitbus.org/fares | contact@transitbus.org  | (777)        555-7777    |
        | au01           | gra       |          |         | Greater Region Transport |           1 |             |            1 | https://www.gra1.org             | contact@gra1.org        | (555)        555-5555    |
        | op02           |           | rtd023   |         | Bus company A            |             |           1 |              | https://www.buscompanya.com      | contact@buscompanya.com | (333)        333-3333    |
        | op03           |           | rtd025   |         | Bus company B            |             |           1 |              | https://www.buscompanyb.com      | contact@buscompanyb.com | (888)        888-8888    |
