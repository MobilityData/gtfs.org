# Entités de flux

GTFS Realtime supporte trois types distincts de données en temps réel, qui peuvent être combinés dans un seul flux en temps réel. Des résumés sont donnés ci-dessous, avec une documentation complète dans la section appropriée.

## Trip Updates

#### "Le bus X est retardé de 5 minutes"

Les trip updates représentent les fluctuations de l'horaire. Nous nous attendons à recevoir des trip updates pour tous les trajets que vous avez programmés et qui sont compatibles avec le temps réel. Ces mises à jour donnent une prévision d'arrivée ou de départ pour les arrêts le long de l'itinéraire. Les trip updates peuvent également prévoir des scénarios plus complexes où les trajets sont annulés, ajoutés au programme ou même réacheminés.

[En savoir plus sur les trip updates...](trip-updates.md)

## Service Alerts

#### "La station Y est fermée pour cause de travaux"

Les service alerts représentent des problèmes de plus haut niveau avec une entité particulière et sont généralement sous la forme d'une description textuelle de la perturbation.

Elles peuvent représenter des problèmes avec :

*   Stations
*   Lignes
*   L'ensemble du réseau
*   etc.

Une alerte de service se compose généralement d'un texte qui décrit le problème, et nous autorisons également les URL pour plus d'informations ainsi que des informations plus structurées pour nous aider à comprendre qui est concerné par cette alerte de service.

[En savoir plus sur les service alerts...](service-alerts.md)

## Vehicle Positions

#### "Ce bus est à la position X à l'heure Y"

La vehicle position représente quelques informations de base sur un véhicule particulier sur le réseau.

Les plus importantes sont la latitude et la longitude du véhicule, mais nous pouvons également recevoir des données sur la vitesse actuelle et les relevés du compteur kilométrique du véhicule.

[En savoir plus sur les mises à jour de Vehicle Position...](vehicle-positions.md)

## Remarque historique sur les types de flux

Les premières versions de la spécification en GTFS Realtime exigeaient que chaque flux ne contienne qu'un seul type d'entités. Un exemple d'outil pour convertir le schéma fusionné en schémafeed-per-type est situé dans le dépôt GitHub de Bliksem Labs [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py).
