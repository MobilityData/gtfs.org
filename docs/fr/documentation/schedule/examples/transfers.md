# Transferts

## Transferts en bloc 
 
 Le transfert en bloc, également appelé transfert au siège, est disponible lorsqu’un ensemble de trajets remplit les conditions suivantes : 
 
 1. Les trajets sont consécutifs. 
 2. Le même véhicule effectue les deux déplacements. 
 3. Les voyages sont fournis avec la même valeur `block_id` dans le fichier [trips.txt](../../reference/#tripstxt) dans le flux de transit. 
 
### Utilisez `block_id` pour activer les transferts en bloc 
 
 Les transferts en bloc peuvent être effectués entre des trajets consécutifs sur des itinéraires différents ou sur le même itinéraire si l’itinéraire est une ligne en boucle. Utilisez le champ `block_id` pour spécifier quels voyages se font dans un bloc et où les transferts à bord sont une option disponible. 
 
 Par exemple, considérons les valeurs suivantes [trips.txt](../../reference/#tripstxt) et [stop_times.txt](../../reference/#stop_timestxt): 
 
 [** trips.txt**](../../reference/#tripstxt) 
 
| route_id | trip_id     | block_id  |
|----------|-------------|---|
| RouteA   | RouteATrip1 |  Block1 |
| RouteB   | RouteBTrip1 |  Block1 |
 
 [** stop_times.txt**](../../reference/#stop_timestxt) 
 
| trip_id | arrival_time     | departure_time | stop_id | stop_sequence |
|----------|-------------|---|----|-----|
| RouteATrip1  | 12:00:00|  12:01:00 | A | 1 |
| RouteATrip1  | 12:05:00|  12:06:00 | B | 2 | 
| RouteATrip1 | 12:15:00 | | C | 3|
| RouteBTrip1 | | 12:18:00 | C | 1 |
| RouteBTrip1 |12:22:00 | 12:23:00 | D | 2 |
| RouteBTrip1 |12:30:00 |  | E | 3 | 
 
 Dans cet exemple : 
 
 - Un utilisateur qui recherche un itinéraire de l’arrêt A à l’arrêt E est invité à embarquer à l’arrêt A à 12h00 sur l’itinéraire A et à rester sur le véhicule lorsqu’il atteint l’arrêt. C après la fin de `RouteATrip1`. En effet, le même véhicule dessert `RouteBTrip1` pour la route B. 
 - Les passagers de `RouteATrip1` qui souhaitent continuer jusqu’à un arrêt sur `RouteBTrip1` peuvent rester dans le véhicule pour ce transfert. 
 - Les passagers d’autres voyages effectués à bord d’autres véhicules sur ces mêmes itinéraires n’ont pas cette possibilité car ils utilisent des véhicules différents pour chaque voyage. 
 
### Bloc-transfert dans une ligne en boucle 
 
 Dans une ligne en boucle, le premier arrêt et le dernier arrêt d’un trajet sont identiques et ont le même `stop_id`. À condition que les trajets en boucle consécutifs aient le même `block_id`, le transfert en bloc ou dans le siège est activé, ce qui permet aux passagers du premier trajet de rester dans le véhicule lorsqu’il continue sur la boucle suivante.