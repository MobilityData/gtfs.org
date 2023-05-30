# Transferts

<hr/>

## Transferts en bloc

Le transfert en bloc, également appelé transfert à la place, est possible lorsqu'un ensemble de trajets remplit les conditions suivantes :

1. Les trajets sont consécutifs.
2. Le même véhicule effectue les deux trajets.
3. Les trajets sont provisionnés avec la même valeur `block_id` dans le fichier [trips.txt](../../reference/#tripstxt) du flux de transit.

### Utiliser `block_id` pour activer les transferts en bloc

Les transferts de bloc peuvent être effectués entre des trajets consécutifs sur des itinéraires différents ou sur le même itinéraire s'il s'agit d'une ligne en boucle. Utilisez le champ `block_id` pour spécifier les trajets qui font partie d'un même bloc et pour lesquels les transferts à la place sont une option disponible.

Par exemple, considérons les valeurs [trips.txt](../../reference/#tripstxt) et [stop_times.txt](../../reference/#stoptimestxt) suivantes :

[**trips.txt**](../../reference/#tripstxt)

| route_id    | trip_id     | block_id |
| ----------- | ----------- |----------|
| RouteA | RouteATrip1 | Block1   |
| RouteB      | RouteBTrip1 | Block1   |

[**stop_times.txt**](../../reference/#stoptimestxt)

| trip_id     | arrival_time | departure_time | stop_id | stop_sequence |
| ----------- | --------------- | --------------- | ------- | ------------- |
| RouteATrip1 | 12:00:00        | 12:01:00        | A       | 1             |
| RouteATrip1 | 12:05:00        | 12:06:00        | B       | 2             |
| RouteATrip1 | 12:15:00        |                 | C       | 3             |
| RouteBTrip1 |                 | 12:18:00        | C       | 1             |
| RouteBTrip1 | 12:22:00        | 12:23:00        | D       | 2             |
| RouteBTrip1 | 12:30:00        |                 | E       | 3             |

Dans cet exemple :

- Un utilisateur qui recherche un itinéraire de l'arrêt A à l'arrêt E est invité à embarquer à l'arrêt A à 12h00 sur l'itinéraire A et à rester dans le véhicule lorsqu'il atteint l'arrêt C après la fin de `RouteATrip1`. Cela s'explique par le fait que le même véhicule dessert `RouteBTrip1` pour la ligne B.
- Les passagers de `RouteATrip1` qui souhaitent continuer jusqu'à un arrêt de`RouteBTrip1` peuvent rester dans le véhicule pour cette correspondance.
- Les passagers d'autres trajets sur d'autres véhicules le long de ces mêmes itinéraires n'ont pas cette possibilité car ils utilisent des véhicules différents pour chaque trajet.

### Transfert en bloc dans une ligne en boucle

Dans une ligne en boucle, le premier et le dernier arrêt d'un trajet sont les mêmes et ont le même `stop_id`. Si des trajets en boucle consécutifs ont le même `block_id`, le transfert de bloc ou de siège est activé, ce qui permet aux passagers du premier trajet de rester dans le véhicule lorsqu'il poursuit sa route sur la boucle suivante.
