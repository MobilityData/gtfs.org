# General Transit Feed Specification (GTFS) 
 
 La General Transit Feed Specification (GTFS) est une [norme ouverte](https://www.interoperablemobility.org/definitions/#open_standard) utilisée pour diffuser des informations pertinentes sur les systèmes de transport en commun aux cavaliers. Il permet __agences de transport en commun__ de publier leurs données de transport en commun dans un format pouvant être utilisé par une grande variété d’applications logicielles. 
 
 GTFS se compose de deux parties principales : [GTFS Schedule](../schedule/reference) et [GTFS Realtime](../realtime/reference). 
 
## [GTFS Schedule](../schedule/reference) 
 
 GTFS Schedule est une spécification de flux qui définit un format commun pour les informations statiques sur les transports publics. Il est composé d’une collection de fichiers simples, principalement des fichiers texte (.txt) contenus dans un seul fichier ZIP. 
 
 Chaque fichier décrit un aspect particulier des informations de transport en commun telles que les arrêts, les itinéraires, les trajets, etc. Dans sa forme la plus basique, un ensemble de données GTFS Schedule est composé de 7 fichiers : `agency.txt`, `routes.txt`, `trips.txt`, `stops.txt`, `stop_times.txt`, `calendar.txt` et `calendar_dates.txt`. 
 
 Parallèlement à cet ensemble de fichiers de base, des fichiers supplémentaires (facultatifs) peuvent également être regroupés pour fournir des informations sur d’autres éléments de service, tels que les tarifs, les traductions, les transferts, les itinéraires en gare, etc. Il existe actuellement plus de 15 des fichiers facultatifs qui étendent les éléments de base de GTFS, notamment locations.geojson qui a introduit un nouveau format en plus des fichiers texte (.txt) qui peuvent être utilisés pour représenter des zones géographiques. 
 
 La source de vérité pour tous les fichiers de planification GTFS est la [Référence de planification GTFS] officielle (../schedule/reference), qui fournit des informations détaillées sur les exigences pour tous les éléments d’information de chaque fichier qui compose un ensemble de données de planification GTFS..
 
 
## [GTFS Realtime](../realtime/reference) 
 
 GTFS Realtime est une spécification de flux qui permet aux agences de transports publics de fournir des informations à jour sur les heures d’arrivée et de départ actuelles, les alertes de service et la position du véhicule, permettant aux utilisateurs de planifier en douceur leurs déplacements. 
 
 La spécification prend actuellement en charge les types d’informations suivants : 
 
 - Mises à jour des trajets- retards, annulations, itinéraires modifiés- Alertes de service- arrêt déplacé, événements imprévus affectant une gare, un itinéraire ou l’ensemble du réseau- Positions des véhicules- informations sur les véhicules, y compris l’emplacement et le niveau de congestion 
 
 Pour en savoir plus à leur sujet, visitez la section [Feed Entities](../realtime/feed_entities/overview). 
 
 GTFS Realtime a été conçu autour de la facilité de mise en œuvre, d’une bonne interopérabilité GTFS et d’une concentration sur l’information des passagers. Cela a été possible grâce à un partenariat entre les [initiales Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates) agences partenaires, un certain nombre de développeurs de transports en commun et Google. La spécification est publiée sous la [Licence Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). 
 
 Le format d’échange de données GTFS Realtime est basé sur [Protocol Buffers](https://developers.google.com/protocol-buffers/) qui est un mécanisme neutre en termes de langage et de plate-forme pour sérialiser des données structurées (pensez à XML, mais plus petit, plus rapide et plus simple). 
 
 De la même manière que le GTFS Schedule, la [référence GTFS Realtime](../realtime/reference) est la source de vérité qui établit les règles et les exigences pour tout flux GTFS Realtime, tandis que le [gtfs-realtime.proto](../realtime/proto) définit la hiérarchie des éléments et leurs définitions de type qui sont utilisés. 
