# Fréquences

## Décrire un service basé sur des fréquences de passage
 
 La Société de Transport de Montréal exploite des services de transport en commun à Montréal et exploite un service basé sur des fréquences de passage pour ses lignes de métro. Par conséquent, au lieu de fournir un horaire avec les heures d’arrivée et de départ dans un ensemble de données GTFS, le fichier [frequencies.txt](../../reference/#frequenciestxt) est utilisé pour décrire la fréquence du service tout au long de la durée du service. La répétition d’un trajet ne fonctionne que dans les cas où le timing entre les arrêts reste cohérent pour tous les arrêts. Lors de la modélisation d’un service basé sur la fréquence, stop_times.txt (@TODO link) contient les temps relatifs entre les arrêts afin de déterminer les temps à afficher aux passagers. 
 
 [**frequencies.txt**](../../reference/#frequenciestxt) 
 
```
trip_id,start_time,end_time,headway_secs
22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165
``` 
 
 Ci-dessus, un trajet sur la ligne Verte avec un `trip_id=22M-GLOBAUX-00-S_1_2` est utilisé à titre d’exemple. Pour ce trajet, le premier enregistrement indique qu’entre 16 h 01 min 25 s et 16 h 19 min 25 s, les trains circulent toutes les 180 secondes (ou 3 minutes). De même, le deuxième enregistrement indique qu’entre 16 h 19 min 25 s et 17 h 03 min 25 s, les trains circulent toutes les 165 secondes. 
 
 
 
 <sup>[Source de l'exemple](https://www.stm.info/en/about/developers)</sup>