---
search:
  exclude: true
---

# Fréquences

<hr/>

## Décrire un service basé sur la fréquence

La Société de Transport de Montréal exploite des services de transport en commun à Montréal et gère un service basé sur la fréquence pour ses lignes de métro. Par conséquent, au lieu de fournir un Schedule avec les heures d'arrival et de departure dans un jeu de données GTFS, le fichier [frequencies.txt](../../reference/#frequenciestxt) est utilisé pour décrire la fréquence du service tout au long de la durée du service.

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

Ci-dessus, un trip sur la ligne verte avec un `trip_id=22M-GLOBAUX-00-S_1_2` est utilisé comme exemple. Pour ce trip, le premier enregistrement indique qu'entre 16h01:25 et 16h19:25, les trains circulent toutes les 180 secondes (soit 3 minutes). De même, le deuxième enregistrement indique qu'entre 16:19:25 et 17:03:25, les trains circulent toutes les 165 secondes.

[Exemple de source](https://www.stm.info/en/about/developers)
