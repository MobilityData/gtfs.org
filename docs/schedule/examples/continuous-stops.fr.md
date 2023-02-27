---
search:
  exclude: true
---

# Arrêts continus

<hr/>

## Prise en charge et dépose partout

L'agence de transport The Current (Rockingham, US-VT) applique une politique d'arrêts continus sur les lignes 2, 53 et 55. Un usager peut être pris en charge et déposé entre des arrêts programmés tout au long de la ligne, tant qu'il existe un endroit sûr pour l'arrêt du bus.

Le fichier [routes.txt](../../reference/#routestxt) est utilisé pour décrire ce service en utilisant les champs `continuous_pickup` et `continuous_drop_off`. La valeur `0` est attribuée à ces champs pour indiquer que les collectes et les déposes continues sont autorisées.

[**routes.txt**](../../reference/#routestxt)

    route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
    2,2,Bellows Falls In-Town,3,0,0
    53,53,Bellows Falls / Battleboro Commuter,3,0,0
    55,55,Bellows Falls / Springfield Shuttle,3,0,0

[Exemple de source](https://crtransit.org/bus-schedules/)

<hr/>

## Prise en charge et dépose sur une section du trajet

L'agence de transport Victor Valley Transit (Victorville, US-CA) applique une politique d'arrêts continus uniquement sur une partie de la ligne 22. Un usager peut monter et descendre du bus à n'importe quel endroit sûr de la zone tarifaire du comté uniquement. Les prises en charge et les déposes en continu ne sont pas possibles dans la zone tarifaire locale.

La zone tarifaire locale et la zone tarifaire départementale sont séparées par l'Air Expressway, comme le montre la figure ci-dessous. L'arrêt programmé National Trails Highway - Air Expressway est situé légèrement au nord de cette limite. Pour être précis, l'organisme de transport en commun peut ajouter un arrêt à l'intersection réelle de la ligne de bus avec la limite, à partir duquel la prise en charge et la dépose continues sont possibles. Cet arrêt peut rester imprévu.

![](../../assets/victor-valley-transit.svg)

Ce service est décrit à l'aide des fichiers [stops.txt](../../reference/#stopstxt) et [stop_times.txt](../../reference/#stoptimestxt):

- Le premier fichier définit les arrêts le long de l'itinéraire
- Le second fichier définit les règles de prise en charge et de dépose en continu entre les arrêts.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon
    A,Victoriaville Transfer Station,34.514356,-117.318323
    B,Dante St & Venus Ave,34.564499,-117.287097
    C,Victorville Transportation Center,34.538433,-117.294703
    X,Local/County Fare Boundary,34.566224,-117.318357
    D,National Trails Highway - Air Expressway,34.567536,-117.319716
    E,Oro Grande Post Office,34.599292,-117.334452
    F,Silver Lakes Market,34.744662,-117.335407

Dans [stop_times.txt](../../reference/#stoptimestxt), pour un trip donné :

- Un enregistrement avec `continuous_pickup=0` indique que les ramassages continus sont autorisés de cet arrêt jusqu'à l'arrêt suivant.
- Un enregistrement avec `continuous_pickup=1` indique que les ramassages continus sont interdits de cet arrêt jusqu'à l'arrêt suivant.

[**stop_times.txt**](../../reference/#stoptimestxt)

    trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
    22NB9AM,A,1,09:00:00,09:00:00,1,1,1
    22NB9AM,B,2,09:14:00,09:14:00,1,1,1
    22NB9AM,C,3,09:21:00,09:21:00,1,1,1
    22NB9AM,X,4,,,0,0,0
    22NB9AM,D,5,09:25:00,09:25:00,0,0,1
    22NB9AM,E,6,09:31:00,09:31:00,0,0,1
    22NB9AM,F,7,09:46:00,09:46:00,0,0,1

La même logique s'applique au champ `continuous_drop_off` mais pour le cas des drop offs.

Dans l'exemple ci-dessus, les arrêts A, B, C ont les champs continuous_pickup et `continuous_drop_off` à `1`, ce qui interdit les prises en charge et les déposes continues entre eux. Les arrêts `X`, `D`, `E` et `F` ont les champs `continuous_pickup` et `continuous_drop_off` à `0`, ce qui permet des prises en charge et des déposes continues entre eux.

[Exemple de source](https://vvta.org/routes/route-22/)
