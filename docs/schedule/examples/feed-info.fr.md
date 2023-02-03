---
search:
  exclude: true
---

# Informations sur les flux

<hr/>

## Fournir des informations sur le jeu de données GTFS

En plus de fournir des informations sur les agences et leurs services, il est possible de fournir des informations sur le jeu de données GTFS en utilisant le fichier [feed_info.txt](../../reference/#feed_infotxt). Cela comprend :

- Détails de l'éditeur
- langue du flux
- Validité du flux
- Version

Vous trouverez ci-dessous un exemple de Transport for Cairio :

[**feed_info.txt**](../../reference/#feed_infotxt)

    feed_publisher_name,feed_publisher_url,feed_lang,feed_start_date,feed_end_date,feed_version
    Transport for Cairo,http://transportforcairo.com/,en,20160101,20161201,0.5

[Exemple de source](https://github.com/transportforcairo/Metro-GTFS/archive/master.zip#Metro-GTFS-master)
