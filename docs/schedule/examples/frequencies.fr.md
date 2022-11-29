---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/frequencies.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
</a>

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
