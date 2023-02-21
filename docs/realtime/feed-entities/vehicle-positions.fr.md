# Vehicle Positions

Vehicle position est utilisée pour fournir des informations générées automatiquement sur l'emplacement d'un véhicule, par exemple à partir d'un dispositif GPS embarqué. Une seule position de véhicule doit être fournie pour chaque véhicule capable de la fournir.

Le trajet que le véhicule effectue actuellement doit être indiqué par un [TripDescriptor](../reference.md#message-tripdescriptor). Vous pouvez également fournir un [VehicleDescriptor](../reference.md#message-vehicledescriptor), qui spécifie un véhicule physique précis pour lequel vous fournissez des mises à jour. La documentation est fournie ci-dessous.

Un **timestamp ** indiquant l'heure à laquelle la position a été relevée peut être fourni. Notez que cet horodatage est différent de celui de l'en-tête du flux, qui correspond à l'heure à laquelle ce message a été généré par le serveur.

**Current passage** peut également être fourni (sous forme de `stop_sequence` ou de `stop_id`). Il s'agit d'une référence à l'arrêt vers lequel le véhicule est soit en route, soit déjà arrêté.

## Position

Position contient les données de localisation dans vehicle position. La latitude et la longitude sont obligatoires, les autres champs sont facultatifs. Ces types de données sont :

*   **Latitude** - degrés Nord, dans le système de coordonnées WGS-84.
*   **Longitude** - degrés Est, dans le système de coordonnées WGS-84.
*   **Bearing** - direction vers laquelle le véhicule est orienté
*   **Odometer** - la distance parcourue par le véhicule.
*   **Speed** - vitesse instantanée mesurée par le véhicule, en mètres par seconde.

## CongestionLevel

Vehicle position permet également à l'agence de spécifier le niveau de congestion auquel le véhicule est actuellement confronté. La congestion peut être classée dans les catégories suivantes :

*   Unknown congestion level
*   Running smoothly
*   Stop and go
*   Congestion
*   Severe congestion

Il appartient à l'agence de classer chaque type de congestion. Selon nos conseils, la congestion grave n'est utilisée que dans les situations où le trafic est tellement congestionné que les gens quittent leur voiture.

## OccupancyStatus

Vehicle position permet également à l'agence de préciser le degré d'occupation des passagers du véhicule. Le statut d'occupation peut être classé dans les catégories suivantes :

*   Empty
*   Many seats available
*   Few seats available
*   Standing room only
*   Crushed standing room only
*   Full
*   Not accepting passengers

Ce champ est encore **expérimental** et est susceptible d'être modifié. Il est possible qu'il soit officiellement adopté à l'avenir.

## VehicleStopStatus

Vehicle stop status donne plus de sens au statut d'un véhicule par rapport à un arrêt qu'il approche actuellement ou auquel il se trouve. Il peut être réglé sur l'une des valeurs suivantes.

*   **Incoming at** - le véhicule est sur le point d'arriver à l'arrêt référencé.
*   **Stopped at** - le véhicule est arrêté à l'arrêt référencé.
*   **In transit to** - l'arrêt référencé est le prochain arrêt du véhicule - **par défaut**.

## VehicleDescriptor

VehicleDescriptor décrit un véhicule physique précis et peut contenir l'un des attributs suivants :

*   **ID** - système interne d'identification du véhicule. Il doit être unique pour le véhicule.
*   **Label** - un label visible par l'utilisateur, par exemple le nom d'un train.
*   **License plate** - la plaque d'immatriculation réelle du véhicule.
