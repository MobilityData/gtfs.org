# :material-escalator: Parcours 
 
 Les fonctionnalités de Parcours peuvent modéliser de grandes gares de transport en commun, guidant les usagers depuis les entrées des gares et existent jusqu’à l’endroit où ils montent ou descendent d’un véhicule de transport en commun. Certaines de ces fonctionnalités permettent de communiquer les caractéristiques physiques d’un chemin et le temps de navigation estimé, ainsi que les systèmes d’orientation du monde réel utilisés dans les gares. 
 
## Connexions du Parcours 
 
 À son niveau fondamental, Parcours offre des fonctionnalités de base pour connecter les zones clés définies dans les Types d’emplacement au sein d’une station. Ces connexions forment des parcours, permettant aux utilisateurs d’obtenir des directions précises (par exemple depuis l’entrée vers la zone d’embarquement), ce qui est particulièrement utile pour naviguer dans des gares de transport en commun vastes et complexes. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `pathway_id`, `from_stop_id`, `to_stop_id`, `pathway_mode`, `is_bidirectional` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Types d’emplacement](../base_add-ons/#types-demplacement) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant définit plusieurs connexions (également appelées chemins) entre des emplacements préétablis (définis comme des arrêts) : passerelles (`pathway_mode=1`), escaliers (`pathway_mode=2`) et barrière tarifaire (`pathway_mode=6`). La bidirectionnalité est également spécifiée. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | from_stop_id | to_stop_id | pathway_mode | is_bidirectional |
        |------------|--------------|------------|--------------|------------------|
        | MainSt-001 | A102_E01     | A102_S01   |            1 |                1 |
        | MainSt-002 | A102_S01     | A102_S02   |            2 |                1 |
        | MainSt-003 | A102_S02     | A102_F02   |            1 |                1 |
        | MainSt-004 | A102_F02     | A102_F01   |            6 |                1 |
        | MainSt-005 | A102_F01     | A102_S03   |            1 |                1 |
        | MainSt-006 | A102_S03     | A102_S04   |            2 |                1 |
        | MainSt-007 | A102_F01     | A102_S05   |            1 |                1 |
        | MainSt-008 | A102_S05     | A102_S06   |            2 |                1 |
        | MainSt-009 | A102_S04     | A102_B01   |            1 |                1 |
        | MainSt-010 | A102_S06     | A102_B02   |            1 |                1 |

 
 
## Détails du Parcours 
 
 Plus de détails peuvent être ajoutés concernant les caractéristiques physiques des chemins d’une station, notamment la longueur, la largeur et la pente (pour les rampes) ou le nombre d’escaliers (pour les escaliers). Cela aide les cyclistes à anticiper les conditions et l’accessibilité du sentier qu’ils doivent emprunter. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `max_slope`, `min_width`, `length`, `stair_count` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Connexions du Parcours](#connexions-du-parcours) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant définit des détails supplémentaires sur les sentiers préétablis, notamment la largeur minimale, le nombre de marches pour les escaliers et la longueur et la pente maximale pour les passerelles. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | max_slope | min_width | length | stair_count |
        |------------|-----------|-----------|--------|-------------|
        | MainSt-001 |         0 |       4.3 |    3.6 |             |
        | MainSt-002 |           |       2.2 |        |          15 |
        | MainSt-003 |      0.06 |         4 |    3.1 |             |
        | MainSt-004 |           |       0.9 |    2.9 |             |
        | MainSt-005 |         0 |       3.5 |      5 |             |
        | MainSt-006 |           |       2.2 |        |          18 |
        | MainSt-007 |         0 |       3.5 |      5 |             |
        | MainSt-008 |           |       2.2 |        |          18 |
        | MainSt-009 |         0 |         6 |      2 |             |
        | MainSt-010 |         0 |         6 |      2 |             |

 
## Niveaux 
 
 Les Niveaux peuvent être utilisés pour répertorier tous les différents niveaux au sein d’une station, fournissant aux utilisateurs une couche d’informations supplémentaire sur les stations. Cette fonctionnalité permet également d’utiliser des ascenseurs en conjonction avec la fonctionnalité de connexions Parcours. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[levels.txt](../../../documentation/schedule/reference/#levelstxt)| `level_id`, `level_index`, `level_name`| 
 |[stops.txt](../../../documentation/schedule/reference/#stopstxt)| `level_id` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Types d’emplacement](../base_add-ons/#types-demplacement) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre les différents niveaux d’une station. Les emplacements (définis comme des arrêts) sont ensuite attribués à leur niveau correspondant. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | level_id          | level_index | level_name |
        |-------------------|-------------|------------|
        | level_0_street    |           0 | On street  |
        | level_-1_lobby    |          -1 | Lobby      |
        | level_-2_platform |          -2 | Platform   |


    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | stop_id      | level_id |
        |--------------|----------|
        | Station_A102 |          |
        | A102_B01     |       -2 |
        | A102_B02     |       -2 |
        | A102_E01     |        0 |
        | A102_S01     |        0 |
        | A102_S02     |       -1 |
        | A102_S03     |       -1 |
        | A102_S04     |       -2 |
        | A102_S05     |       -1 |
        | A102_S06     |       -2 |
        | A102_F01     |       -1 |
        | A102_F02     |       -1 |
 
## Temps de Parcours en Station
 
 Le temps de parcours en gare fournit un niveau de détail supplémentaire aux directions en gare, donnant aux utilisateurs une estimation du temps nécessaire pour naviguer dans les gares, ce qui se traduit par de meilleurs itinéraires de déplacement et les temps de trajet. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `traversal_time` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Connexions du Parcours](#connexions-du-parcours) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre le temps de trajet estimé (en secondes) nécessaire pour parcourir chaque chemin. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | traversal_time |
        |------------|----------------|
        | MainSt-001 |              3 |
        | MainSt-002 |             20 |
        | MainSt-003 |              2 |
        | MainSt-004 |              2 |
        | MainSt-005 |              4 |
        | MainSt-006 |             25 |
        | MainSt-007 |              4 |
        | MainSt-008 |             25 |
        | MainSt-009 |              2 |
        | MainSt-010 |              2 | 
 
## Signalisation du Parcours 
 
 Les Signalisation du Parcours peuvent relier les informations affichées dans les planificateurs de voyage avec des panneaux du monde réel. Si cela est représenté dans un flux, les planificateurs de voyage peuvent fournir des instructions telles que « suivre les panneaux vers ». 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `signposted_as`, `reversed_signposted_as` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Connexions du Parcours](#connexions-du-parcours) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant précise les informations de navigation associées aux itinéraires préétablis, reflétant le texte affiché sur la signalisation physique de la station. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | signposted_as    | reversed_signposted_as |
        |------------|------------------|------------------------|
        | MainSt-001 | to lobby         | Exit                   |
        | MainSt-002 |                  |                        |
        | MainSt-003 | To platforms     | Exit                   |
        | MainSt-004 |                  |                        |
        | MainSt-005 | Westbound trains | Exit                   |
        | MainSt-006 |                  |                        |
        | MainSt-007 | Eastbound trains | Exit                   |
        | MainSt-008 |                  |                        |
        | MainSt-009 | Westbound trains | To Lobby               |
        | MainSt-010 | Eastbound trains | To Lobby               |


