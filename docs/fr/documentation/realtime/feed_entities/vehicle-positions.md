# Positions des véhicules 
 
 La position du véhicule est utilisée pour fournir des informations générées automatiquement sur l’emplacement d’un véhicule, par exemple à partir d’un appareil GPS à bord. Un seul emplacement de véhicule devrait être prévu pour chaque véhicule capable de le fournir. 
 
 Le trajet que le véhicule effectue actuellement doit être indiqué via un [TripDescriptor](../../reference/#message-tripdescriptor). Vous pouvez également fournir un [VehicleDescriptor](../../reference/#message-vehicledescriptor), qui spécifie un véhicule physique précis sur lequel vous fournissez des mises à jour. La documentation est fournie ci-dessous. 
 
 Un **timestamp** indiquant l’heure à laquelle la lecture de position a été prise peut être fourni. Notez que ceci est différent de l’horodatage dans l’en-tête du flux, qui correspond à l’heure à laquelle ce message a été généré par le serveur. 
 
 **Le passage actuel** peut également être fourni (soit sous la forme d’un `stop_sequence` ou d’ un `stop_id`). Il s’agit d’une référence à l’arrêt vers lequel le véhicule est en route ou déjà arrêté. 
 
## Position 
 
 Position contient les données de localisation dans Vehicle Position. La latitude et la longitude sont obligatoires, les autres champs sont facultatifs. Ces types de données sont : 
 
 * **Latitude** - degrés Nord, dans le système de coordonnées WGS-84 
 * **Longitude** - degrés Est, dans le système de coordonnées WGS-84 
 * **Relèvement** - direction vers laquelle le véhicule fait face 
 * **Compteur kilométrique** - la distance parcourue par le véhicule 
 * **Vitesse** - vitesse momentanée mesurée par le véhicule, en mètres par seconde 
 
## CongestionLevel 
 
 La position du véhicule permet également à l’agence de préciser le niveau de congestion que connaît actuellement le véhicule. Les embouteillages peuvent être classés dans les catégories suivantes : 
 
 * Niveau de congestion inconnu 
 * Bon fonctionnement 
 * Stop and go 
 * Embouteillage 
 * Embouteillages sévères 
 
 Il appartient à l’agence de classer ce qui vous classez comme chaque type de congestion. Selon nous, les embouteillages sévères ne sont utilisés que dans les situations où la circulation est tellement encombrée que les gens abandonnent leur voiture. 
 
## OccupancyStatus 
 
 La position du véhicule permet également à l’agence de préciser le degré d’occupation des passagers du véhicule. Le statut d’occupation peut être classé dans les catégories suivantes : 
 
 * Vide 
 * Beaucoup de places disponibles 
 * Peu de places disponibles 
 * Places debout uniquement 
 * Places debout écrasées uniquement 
 * Plein 
 * Ne pas accepter passagers 
 
 Ce champ est encore **expérimental** et sujet à changement. Il pourrait être formellement adopté à l’avenir. 
 
## VehicleStopStatus 
 
 L’état d’arrêt du véhicule donne plus de sens à l’état d’un véhicule par rapport à un arrêt dont il s’approche ou auquel il se trouve actuellement. Il peut être défini sur n’importe laquelle de ces valeurs. 
 
 * **Arrivant à** - le véhicule est sur le point d’arriver à l’arrêt référencé 
 * **Arrêté à** - le véhicule est arrêté à l’arrêt référencé 
 * **En transit vers** - l’arrêt référencé est le prochain arrêt du véhicule- **par défaut** 
 
## VehicleDescriptor 
 
 VehicleDescriptor décrit un véhicule physique précis et peut contenir l’un des attributs suivants : 
 
 * **ID** - système interne d’identification du véhicule. Doit être unique au véhicule 
 * **Étiquette** - une étiquette visible par utilisateur- par exemple le nom d’un train 
 * **Plaque d’immatriculation** - la plaque d’immatriculation réelle du véhicule 
