# :material-cash: Tarifs 

 GTFS permet de modéliser avec précision une grande variété de structures tarifaires utilisées par différentes agences de transports en commun à travers le monde, telles que les tarifs basés sur la zone, la distance parcourue ou l’heure de la journée. GTFS Tarifs informe les passagers du prix applicable à leur voyage et des supports qu’ils peuvent utiliser pour payer. 
 
## Produits tarifaires 
 
 Produits tarifaires répertorie les types de billets ou de tarifs (c’est-à-dire tarif aller simple, abonnement mensuel, frais de transfert, etc.) proposés par une agence de transport en commun pour accéder à un service. Les Produits tarifaires servent de base à la modélisation de la structure tarifaire d’une agence et sont liés au service de transport en commun via les mécanismes décrits dans `fare_leg_rules.txt`. L’association des Produits tarifaires à diverses conditions de voyage, telles que les itinéraires, les zones et les horaires, détermine les coûts tarifaires pour les segments de voyage et les transferts individuels. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)| `fare_product_id`, `fare_product_name`, `amount`, `currency`, `fare_media_id` | 
 |[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `fare_product_id` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant présente un produit tarifaire simple (aller simple 2,75 USD). 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_productstxt"><b>fare_products.txt</b></a> <br>
        </p>

        | fare_product_id  | fare_product_name      | amount  | currency  |
        |------------------|--------------------    |---      |---        |
        | single_ride      | Single Ride Fare       |  2.75   | USD       |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | fare_product_id  |
        |------------------|
        | single_ride |
 
## Tarif Média 
 
 Tarif Média définit le média pris en charge qui peut être utilisé pour conserver et/ou valider un produit tarifaire. Il s’agit de contenants physiques ou virtuels comme un titre de transport papier, une carte de transport rechargeable ou encore le paiement sans contact avec une carte bancaire ou un smartphone. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[fare_media.txt](../../../documentation/schedule/reference/#fare_mediatxt)| `fare_media_id`, `fare_media_name`, `fare_media_type`| 
 |[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)| `fare_media_id` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 
??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre un extrait de différents Tarif Média dans la région de la baie de San Francisco. `Clipper` est décrit comme une carte de transport physique avec `fare_media_type=2`. `SFMTA Munimobile` est décrit comme une application mobile avec `fare_media_type=2`. L’argent liquide qui est remis directement au conducteur sans ticket est `fare_media_type=0`. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_mediatxt"><b>fare_media.txt</b></a> <br>
        </p>

        | fare_media_id | fare_media_name  | fare_media_type |
        |---------------|------------------|-----------------|
        | clipper       | Clipper          | 2               |
        | munimobile    | SFMTA MuniMobile | 4               |
        | cash          | Cash             | 0               |  

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_productstxt"><b>fare_products.txt</b></a> <br>
        </p>

        | fare_product_id  | fare_product_name      | amount  | currency  | fare_media_id |
        |------------------|--------------------    |---      |---        | ---           |
        | single_ride      | Single Ride Fare       |  2.75   | USD       | munimobile          |

## Tarifs Basés sur l’Itinéraire 
 
 Les Tarifs Basés sur l’Itinéraire sont utilisés pour attribuer différents tarifs à des groupes spécifiques d’itinéraires, tels que des tarifs spéciaux pour les services express ou des tarifs différenciés entre un bus rapide. Service de transport en commun par rapport aux services de bus traditionnels. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[routes.txt](../../../documentation/schedule/reference/#routestxt)| `network_id`| 
 |[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `fare_product_id`, `network_id`| 
 |[netowrks.txt](../../../documentation/schedule/reference/#networkstxt)| `network_id`, `network_name`| 
 |[route_networks.txt](../../../documentation/schedule/reference/#route_networkstxt)| `network_id`, `route_id` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Fonctionnalité Produits tarifaires](#produits-tarifaires) 
 
??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre un système qui classe les itinéraires en catégories express et locales, chacune associée à des produits tarifaires distincts.</p>

    <p style="font-size:16px"> **En utilisant `networks.txt` + `route_networks.txt`** </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#networkstxt"><b>networks.txt</b></a> <br>
        </p>

        | network_id | network_name    |
        |------------|-----------------|
        | express    | Express         |
        | local      | Local           |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#route_networkstxt"><b>route_networks.txt</b></a> <br>
        </p>

        | network_id | route_id |
        |------------|-----------|
        | express    | express_a |
        | express    | express_b |
        | local      | local_1   |
        | local      | local_2   |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | network_id | fare_product_id |
        |------------|-----------------|
        | express    | express_single_ride |
        | local      | local_single_ride   |

    <p style="font-size:16px"> **Ou en utilisant `routes.networks_id`** </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id   | network_id |
        |------------|------------|
        | express_a  | express    |
        | express_b  | express    |
        | local_1    | local      |
        | local_2    | local      |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | network_id | fare_product_id |
        |------------|-----------------|
        | express    | express_single_ride |
        | local      | local_single_ride   |

 
## Tarifs Basés sur le Temps 
 
 Les Tarifs Basés sur le Temps sont utilisés pour attribuer des tarifs pour une heure ou un jour de la semaine spécifique, tels que les tarifs de pointe et hors pointe et/ou tarifs week-end. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `fare_product_id`, `from_timeframe_group_id`, `to_timeframe_group_id`| 
 |[timeframes.txt](../../../documentation/schedule/reference/#timeframestxt)| `timeframe_group_id`, `start_time`, `end_time`, `service_id` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Fonctionnalité des Produits tarifaires](../fares/#produits-tarifaires) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant présente un système où les heures de pointe sont de 8h00 à 10h00 et les heures restantes sont hors pointe. </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#timeframestxt"><b>timeframes.txt</b></a> <br>
        </p>

        | timeframe_group_id | start_time | end_time | service_id |
        |--------------------|------------|----------|------------|
        | peak               | 8:00:00    | 10:00:00 | all_day    |
        | regular            | 0:00:00    | 08:00:00 | all_day    |
        | regular            | 10:00:00   | 24:00:00 | all_day    |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | from_timeframe_group_id | fare_product_id     |
        |-------------------------|---------------------|
        | peak                    | peak_single_ride    |
        | regular                 | regular_single_ride |
 
## Tarifs Basés sur les Zones 
 
 Les Tarifs Basés sur les Zones sur la zone sont utilisés pour représenter les systèmes basés sur la zone où un tarif spécifique s’applique lors du voyage d’une zone particulière à une autre. Une zone est définie par un groupe d’arrêts. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `fare_product_id`, `from_area_id`, `to_area_id`| 
 |[areas.txt](../../../documentation/schedule/reference/#areastxt)| `area_id`, `area_name`| 
 |[stop_areas.txt](../../../documentation/schedule/reference/#stop_areastxt)| `area_id`, `stop_id` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Fonctionnalité des Produits tarifaires](../fares/#produits-tarifaires) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre le tarif de la zone A à la zone B.</p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#areastxt"><b>areas.txt</b></a> <br>
        </p>

        | area_id | area_name |
        |---------|-----------|
        | zone_a  | Zone A    |
        | zone_b  | Zone B    |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_areastxt"><b>stop_areas.txt</b></a> <br>
        </p>

        | area_id | stop_id |
        |---------|---------|
        | zone_a  | stop_a  |
        | zone_a  | stop_b  |
        | zone_b  | stop_c  |
        | zone_b  | stop_d  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | from_area_id | to_area_id | fare_product_id |
        |--------------|------------|-----------------|
        | zone_a       | zone_b     | zone_a_b_single |

 
## Transferts Tarifaires
 
 Transferts Tarifaires est utilisé pour définir les règles applicables lors des transferts entre des tronçons (ou des segments de voyage individuels). Cela permet de modéliser le coût total d’un voyage à plusieurs étapes, en tenant compte des politiques de transfert spéciales, telles que les transferts gratuits pour une durée spécifique, ou en appliquant des réductions tarifaires en fonction des étapes déjà parcourues. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `leg_group_id`| 
 |[fare_transfer_rules.txt](../../../documentation/schedule/reference/#fare_transfer_rulestxt)| `from_leg_group_id`, `to_leg_group_id`, `transfer_count`, `duration_limit`, `duration_limit_type`, `fare_transfer_type`, `fare_product_id` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Fonctionnalité des Produits tarifaires](../fares/#produits-tarifaires) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant illustre que dans une fenêtre de 2 heures, des transferts gratuits illimités sont autorisés entre l’étape A au sein du système.</p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | leg_group_id  |
        |---------------|
        | a             |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_transfer_rulestxt"><b>fare_transfer_rules.txt</b></a> <br>
        </p>

        | from_leg_group_id | to_leg_group_id | transfer_count | duration_limit | duration_limit_type | fare_transfer_type | fare_product_id |
        |-------------------|-----------------|----------------|----------------|---------------------|--------------------|-----------------|
        | a                 | a               | -1             | 7200           | 1                   | 0                  | free_transfer   | 
 
## Tarifs v1 
 
 Tarifs v1 est une alternative héritée aux autres fonctionnalités Tarifs décrites ci-dessus. Il permet de modéliser les informations tarifaires de base telles que la tarification, les transferts de modes de paiement et les tarifs par zone à l’aide des fichiers `fare_rules.txt` et `fare_attributes.txt`. Bien que plus simple à produire, il est moins performant ou modélise des structures tarifaires plus complexes et peut être obsolète avec une approbation suffisante d’autres fonctionnalités tarifaires (qui font partie de ce qu’on appelle Tarifs v2). 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[stops.txt](../../../documentation/schedule/reference/#stopstxt)| `zone_id`| 
 |[fare_attributes.txt](../../../documentation/schedule/reference/#fare_attributestxt)| `fare_id` `price` `currency_type` `payment_method` `transfers` `agency_id` `transfer_duration`| 
 |[fare_rules.txt](../../../documentation/schedule/reference/#fare_rulestxt)| `fare_id` `route_id` `origin_id` `destination_id` `contains_id` | 
 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant illustre qu’un déplacement sur un réseau coûte 3,20 $ CAD en utilisant une carte prépayée, permettant des transferts gratuits dans une fenêtre de 2 heures.</p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_attributestxt"><b>fare_attributes.txt</b></a> <br>
        </p>

        | fare_id           | price | currency_type | payment_method | transfers | transfer_duration |
        |-------------------|-------|---------------|----------------|-----------|-------------------|
        | prepaid-card_fare | 3.2   | CAD           | 1              |           | 7200              |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_rulestxt"><b>fare_rules.txt</b></a> <br>
        </p>

        | fare_id           | route_id | origin_id       | destination_id  |
        |-------------------|----------|-----------------|-----------------|
        | prepaid-card_fare | line1    | subway_stations | subway_stations |
        | prepaid-card_fare | line2    | subway_stations | subway_stations |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name | stop_lat  | stop_lon   | zone_id         |
        |---------|-----------|-----------|------------|-----------------|
        | A       | stopA     | 43.670049 | -79.385389 | subway_stations |
        | B       | stopB     | 43.671049 | -79.386789 | subway_stations |


        | stop_id | stop_name | stop_lat  | stop_lon   | zone_id         |
        |---------|-----------|-----------|------------|-----------------|
        | A       | stopA     | 43.670049 | -79.385389 | subway_stations |
        | B       | stopB     | 43.671049 | -79.386789 | subway_stations |
