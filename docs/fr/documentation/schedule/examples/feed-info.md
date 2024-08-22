# Informations sur le flux

## Fournir des informations sur le jeu de données GTFS 
 
 En plus de fournir des informations sur les agences et leurs services, il est possible de fournir des informations sur le jeu de données GTFS à l’aide du fichier [feed_info.txt](../../reference/#feed_infotxt). Cela inclut : 
 
 - Détails de l’éditeur
 - Langue du flux
 - Validité du flux
 - Version 
 
 Vous trouverez ci-dessous un exemple de Transport for Cairio : 
 
 [**feed_info.txt**](../../reference/#feed_infotxt) 
 
```
feed_publisher_name,feed_publisher_url,feed_lang,feed_start_date,feed_end_date,feed_version
Transport for Cairo,http://transportforcairo.com/,en,20160101,20161201,0.5
```
 
 <sup>[Source de l'exemple](https://github.com/transportforcairo/Metro-GTFS/archive/master.zip#Metro-GTFS-master)</sup>