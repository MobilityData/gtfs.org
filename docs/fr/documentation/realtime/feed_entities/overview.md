# Entités de flux 
 
 GTFS Realtime prend en charge quatre types distincts de données en temps réel, qui peuvent être 
 combinées dans un seul flux en temps réel. Des résumés sont donnés ci-dessous, avec une documentation complète 
 donnée dans la section correspondante. 
 
## Mises à jour des trajets

#### "Le bus X est retardé de 5 minutes" 
 
 Les mises à jour des trajets représentent des fluctuations dans l’horaire. Nous nous attendons à recevoir 
 des mises à jour de voyage pour tous les voyages que vous avez programmés et qui sont compatibles en temps réel. Ces mises à jour 
 donneraient une arrivée ou un départ prévu pour les arrêts le long de l’itinéraire. 
 Les mises à jour des voyages peuvent également prévoir des scénarios plus complexes dans lesquels les voyages sont 
 annulés, ajoutés au calendrier ou même réacheminés. 
 
 [En savoir plus sur les mises à jour de voyage...](../trip-updates) 
 
## Alertes de service

#### "La gare Y est fermée en raison de travaux" 
 
 Les alertes de service représentent des problèmes de niveau supérieur avec une entité particulière et se présentent généralement 
 sous la forme d’une description textuelle de la perturbation. 
 
 Ils pourraient représenter des problèmes avec : 
 
 * Stations 
 * Lignes 
 * L’ensemble du réseau 
 * etc. 
 
 Une alerte de service consistera généralement en un texte qui décrira les 
 problème, et nous autorisons également les URL pour plus d’informations ainsi que des informations plus 
 structurées pour nous aider à comprendre qui est concerné par cette alerte de service. 
 
 [En savoir plus sur les alertes de service...](../service-alerts) 
 
## Positions des véhicules

#### "Ce bus est à la position X à l’instant Y" 
 La position 
 du véhicule représente quelques informations de base sur un véhicule 
 particulier sur le réseau. 
 
 Les plus importantes sont la latitude et la longitude auxquelles se trouve le véhicule, mais nous pouvons également 
 utiliser les données sur la vitesse actuelle et les relevés du compteur kilométrique du véhicule. 
 
 [En savoir plus sur les mises à jour de Position du véhicule...](../vehicle-positions) 
 
## Modifications de trajet

#### "Ces trajets sont affectés par un détour certains jours" 
 
 Les modifications de trajet permettent de décrire des détours qui affectent un ensemble de trajets. 
 
 Une modification de trajet peut annuler certains arrêts, ajuster le timing des trajets, 
 donner une nouvelle forme que prendront les trajets et fournir l’emplacement des 
 arrêts temporaires en cours de route. 
 
 [En savoir plus sur les modifications de voyage...](../trip-modifications) 
 
## Remarque historique sur les types de flux 
 
 Les premières versions de la spécification GTFS Realtime exigeaient que chaque flux ne contienne que des 
 un seul type d’entités. Un exemple d’outil pour convertir du schéma fusionné au schéma 
 flux par type se trouve dans Bliksem Labs [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py ) répertoire GitHub .