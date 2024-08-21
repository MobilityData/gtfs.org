# GTFS Schedule

### Historique des révisions

#### Août 2024
* Modifier la présence de stops.txt en raison des services à la demande. Voir [discussion](https://github.com/google/transit/pull/472).
* Clarifier l'utilisation prévue du timepoint dans stop_times.txt. Voir [discussion](https://github.com/google/transit/pull/474).
* Ajout que les Girouettes sont recommandés. Voir [discussion](https://github.com/google/transit/pull/485).

#### Juillet 2024
* Mettre à jour l'exigence pour feed_info.txt. Voir [discussion](https://github.com/google/transit/pull/460).
* Ajout que shapes.txt doit être inclus. Voir [discussion](https://github.com/google/transit/pull/470).

#### Mai 2024 
 * Ajout du champ `rule_priority` dans `fare_leg_rules.txt`. Voir [discussion](https://github.com/google/transit/pull/418). 
 * Clarifier la présence de `stops.zone_id`. Voir [discussion](https://github.com/google/transit/pull/432). 
 
#### Avril 2024 
 * Clarifier la définition du produit tarifaire. Voir [discussion](https://github.com/google/transit/pull/426). 
 
#### Mars 2024 
 * Ajout de GTFS Flex. Voir [discussion](https://github.com/google/transit/pull/433). 
 
#### Novembre 2023 
 * Bonnes pratiques : ajoutez des directives de publication d’ensembles de données et des bonnes pratiques pour tous les fichiers. Voir [discussion](https://github.com/google/transit/pull/406). 
 * Ajoutez les networks.txt et route_networks.txt. Voir [discussion](https://github.com/google/transit/pull/405). 
 
#### Août 2023 
 * Ajouter fare_media_type= 1. Voir [discussion](https:). 
 
#### Juillet 2023 
 * Interdire les sous-dossiers dans les fichiers GTFS. Voir [discussion](https://github.com/google/transit/pull/379). 
 * Ajout de tarifs variables selon l’heure ou le jour. Voir [discussion](https://github.com/google/transit/pull/357). 
 * Clarifiez le fuseau horaire implicite dans stop_times.txt. Voir [discussion](https://github.com/google/transit/pull/378). 
 * Spécifier les horaires d’arrêts shape_dist_traveled ne doit pas dépasser la distance maximale de la forme du trajet. Voir [discussion](https://github.com/google/transit/pull/380). 
 * Bonnes pratiques : ajouter une présence recommandée. Voir [discussion](https://github.com/google/transit/pull/386). 
 
#### 14 mars 2023 
 
 * Ajout du support tarifaire. Voir [discussion](https://github.com/google/transit/pull/355). 
 
#### 26 juillet 2022 
 
 * Ajout des transferts aller-retour avec option au siège. Voir [discussion](https://github.com/google/transit/pull/303). 
 
#### 17 mai 2022 
 
 * Implémentation de base GTFS-Fares v2. Voir [discussion](https://github.com/google/transit/pull/286). 
 
#### 22 octobre 2021 
 
 * Ajout des champs d’identification principale et étrangère. Voir [discussion](https://github.com/google/transit/pull/278). 
 
#### 05 octobre 2021 
 
 * Ajout des transferts de trajet à trajet et d’itinéraire à itinéraire. Voir [discussion](https://github.com/google/transit/pull/284). 
 
#### 15 septembre 2021 
 
 * Les barrières tarifaires (pathway_mode=6) sont autorisées à être bidirectionnelles. Voir [discussion](https://github.com/google/transit/pull/276). 
 
#### 13 septembre 2021 
 
 * Mise à jour des bonnes pratiques `stop_name`. Voir [discussion](https://github.com/google/transit/pull/282). 
 
#### 27 août 2021 
 
 * Mise à jour de GTFS Schedule vers [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119). Voir [discussion](https://github.com/google/transit/pull/277). 
 
#### 4 janvier 2021 
 
 * Description clarifiée de `stop_times.stop_id`. Voir [discussion](https://github.com/google/transit/pull/258). 
 * Signes de champ positifs et non nuls définis. Voir [discussion](https://github.com/google/transit/pull/251). 
 
#### 2 octobre 2020 
 
 * Modification du type de champ `frequencies.headway_secs` d’un entier non négatif à un entier positif. Voir [discussion](https://github.com/google/transit/pull/249). 
 
#### 25 mai 2020 
 
 * Définition de `pathways.txt`, `levels.txt` et `attributions.txt` comme tables traduisibles. Ajout de recommandations pour la traduction des valeurs `signposted_as` multilingues. Voir [discussion](https://github.com/google/transit/pull/220). 
 
#### 13 mai 2020 
 
 * Ajout de `continuous_pickup` et `continuous_drop_off` à `routes.txt` et `stop_times.txt`. Modification de `shape_id` de "Optionnel" à " Requis sous condition ". Voir [discussion](https://github.com/google/transit/pull/208). 
 
#### 24 mars 2020 
 
 * Définition du champ de synthèse vocale et ajout de `tts_stop_name` à `stops.txt`. Voir [discussion](https://github.com/google/transit/pull/49). 
 
#### 5 février 2020 
 
 * Ajout du trolleybus et du monorail `route_types`. Voir [discussion](https://github.com/google/transit/pull/174). 
 
#### 9 janvier 2020 
 
 * Ajout de `translations.txt`. Voir [discussion](https://github.com/google/transit/pull/180). 
 
#### 26 décembre 2019 
 
 * Mise à jour des définitions du téléphérique et du téléphérique dans `route_type`. Voir [discussion](https://github.com/google/transit/pull/186). 
 
#### 20 décembre 2019 
 
 * Ajout de `attributions.txt`. Voir [discussion](https://github.com/google/transit/pull/192). 
 
#### 26 août 2019 
 
 * Spécifié que `stop_lat` et `stop_lon` soient positionnés là où les passagers attendent de monter à bord du véhicule. Voir [discussion](https://github.com/google/transit/pull/179). 
 
#### 9 juillet 2019 
 
 * Ajout des bonnes pratiques en matière d’heures d’arrivée et de départ. Voir [discussion](https://github.com/google/transit/pull/165). 
 * Ajout des bonnes pratiques de headsign. Voir [discussion](https://github.com/google/transit/pull/167). 
 * Ajout des bonnes pratiques `stop_id`. Voir [discussion](https://github.com/google/transit/pull/169). 
 
#### 25 juin 2019 
 
 * Relation clarifiée entre les points de forme et les arrêts. Voir [discussion](https://github.com/google/transit/pull/39). 
 
#### 4 avril 2019 
 
 * Ajout du champ `platform_code` dans `stops.txt`. Voir [discussion](https://github.com/google/transit/pull/146). 
 
#### 27 mars 2019 
 
 * Ajout de `pathways.txt` et `levels.txt`. Voir [discussion](https://github.com/google/transit/pull/143). 
 
#### 6 février 2019 
 
 * Modifications éditoriales et de formatage pour plus de clarté. Voir [discussion](https://github.com/google/transit/pull/120). 
 
#### 2 octobre 2018 
 
 * Types de champs factorisés. Voir [discussion](https://github.com/google/transit/pull/104). 
 
#### 14 septembre 2018 
 
 * Ajout du concept « Requis sous condition ». Voir [discussion](https://github.com/google/transit/pull/100). 
 
#### 4 septembre 2018 
 
 * Unification des définitions de `agency_lang` et `feed_lang`. Voir [discussion](https://github.com/google/transit/pull/98). 
 
#### 27 août 2018 
 
 * Mise à jour de `CHANGES.md` et date de la dernière révision. Voir [discussion](https://github.com/google/transit/pull/99). 
 
#### 22 août 2018 
 
 * Ajout des champs `feed_contact_email` et `feed_contact_url` dans le fichier `feed_info.txt`. Voir [discussion](https://github.com/google/transit/pull/31). 
 
#### 11 décembre 2017 
 
 * Ajout de `route_sort_order` à `routes.txt`. Voir [discussion](https://github.com/google/transit/pull/83). 
 
#### 15 mars 2017 
 
 * Clarification que le vote d’un proposant ne compte pas dans le total. Voir [discussion](https://github.com/google/transit/pull/50). 
 * Spécifié qu’avant de demander un vote, au moins un producteur GTFS et un application réutilisatrice GTFS doivent mettre en œuvre le changement proposé. Voir [discussion](https://github.com/google/transit/pull/46). 
 
#### 7 février 2017 
 
 * Relation clarifiée entre `block_id` et `service_id`. Voir [discussion](https://github.com/google/transit/pull/44). 
 * Clarification que le service basé sur la fréquence commence au départ du véhicule. Voir [discussion](https://github.com/google/transit/pull/42). 
 * Descriptions clarifiées de `stop_id` et `stop_code`. Voir [discussion](https://github.com/google/transit/pull/40). 
 
#### 11 décembre 2017 
 
 * Ajout du champ `route_sort_order` dans le fichier `routes.txt`. Voir [discussion](https://github.com/google/transit/pull/83). 
 
#### 27 novembre 2016 
 
 * Ajout de l’entrée de la gare en tant que `stops.location_type`. Voir [discussion](https://github.com/google/transit/pull/30). 
 
#### 2 septembre 2016 
 
 * Documentation mise à jour pour ajouter `agency_id` sous `fare_attributes.txt`. Voir [discussion](https://github.com/google/transit/pull/27). 
 
#### 16 mars 2016 
 
 * Transition de la documentation GTFS vers Github sur https://github.com/google/transit
 
#### 3 février 2016

 * Ajout de `agency_email` à la proposition `agency.txt` pour spécifier : [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA) 
 
#### 2 février 2015 
 
 * Ajout de la proposition stop_times.txt ’timepoint’ à la spécification : [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah- J9JP2rJY) 
 
#### 17 février 2014 
 
 * Ajout de la proposition trips.txt ’bikes_allowed’ à la spécification : [discussion](https://groups.google.com/forum/?fromgroups#! topic/gtfs-changes/rEiSeKNc4cs) 
 
#### 15 octobre 2012 
 
 Ajout de la proposition trips.txt ’wheelchair_accessible’ à la spécification : [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4) 
 
#### 20 juin 2012 
 
 * Ajout de la proposition ’wheelchair_boarding’ à la spécification : [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4) 
 
#### 2 février 2012 
 
 * Ajout de la proposition ’stop_timezone’ à la spécification : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4) 
 
#### 18 janvier 2012 
 
 * Migration de la documentation de l’ancien code.google.com vers son nouvel emplacement chez les développeurs.google.com. 
 
#### 26 septembre 2011 
 
 * Ajout de la proposition ’feed_info’ à la spécification : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw ) 
 
#### 6 septembre 2011 
 
 * Ajout de la proposition ’agency_fare_url’ à la spécification : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE) 
 * Ajout de la proposition ’exact_times’ à la spécification : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs) 
 
#### 30 mars 2009 
 
 * Une nouvelle section sur la mise à disposition publique d’un flux de transit. Cela n’a pas été discuté auparavant au sein du groupe, car il ne s’agissait pas strictement d’un changement dans la façon dont les données sont interprétées ou écrites. Cependant, certains membres de Google ont pensé qu’il serait instructif d’inclure une discussion sur les utilisations de GTFS par des tiers, car il existe un nombre croissant d’applications pouvant utiliser des données au format GTFS. 
 * Clarifications du format CSV : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk). 
 * Conseils supplémentaires sur la façon de choisir des couleurs contrastées dans les descriptions des champs route_color et route_text_color. 
 * trip_short_name, tel que proposé et testé dans ces fils de discussion : a et b. 
 * Un correctif pour une erreur mineure dans les exemples de données inclus à la fin du document (donnant à l’arrêt S7 la station_parent S8). 
 * Ajout des informations "agency_lang" aux exemples de données à la fin du document, comme suggéré par Marcy pendant la période de commentaires : [discussion](https://groups.google.com/forum/#!topic/gtfs- changements/5qP1kDUFqx0). 
 * Mise à jour du lien vers le flux GTFS d’OCTA dans la barre latérale 
 * Voir [résumé original](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw). 
 
#### 26 février 2009 
 
 * Suppression de la plupart des instructions de soumission de flux spécifiques à Google, car de nombreuses autres applications consomment des données GTFS à ce stade. 
 * Correction d’un lien rompu dans la barre latérale vers le flux public d’Orange County OCTA. 
 
#### 7 août 2008 
 
 * Restauration du champ stop_url, qui a été accidentellement omis dans la version du 6 août 
 * Ajout de l’agence_phone aux exemples de données 
 * Ajout d’une mention de l’accord d’utilisation des données lors de la soumission d’un flux à Google
 
#### 6 août 2008 
 
 * Ajout du fichier transfers.txt, permettant aux éditeurs de flux de fournir des conseils sur le comportement de transfert préféré ([proposition originale](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw)) 
 * Ajout des champs location_type et parent_station à stops.txt, permettant de regrouper les points d’arrêt en stations ([proposition originale](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw)) 
 * Ajout du champ Agency_phone pour fournir le numéro de téléphone vocal d’une agence ([proposition originale](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA)) 
 * Ajout de la section "Tester vos flux" mentionnant les outils de test open source 
 * Ajout de précisions sur le format CSV, age_timezone, age_lang, route_color, route_text_color, Arrival_time, Depart_time, calendar.txt par rapport à calendar_dates.txt, tarifs et frequencies.txt 
 * Ajout d’un lien vers le document d’historique du flux et correction de certains liens de flux publics 
 * Mise à jour d’exemples d’images pour décrire l’interface utilisateur actuelle de Google Maps 
 * Mise à jour/corrigé exemples de données dans le document
 
#### 29 février 2008 
 
 * Ajout du champ stop_code dans stops.txt pour permettre la spécification des codes d’arrêt face au passager ([proposition originale](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc)) 
 * Clarification des descriptions de route_short_name et route_long_name dans routes.txt 
 * Clarification des descriptions de Arrival_time et depart_time dans stop_times.txt 
 * Correction de fautes de frappe dans la section Exemples de données
 
#### 20 novembre 2007 
 
 * Description clarifiée du block_id 
 * Modification de la langue pour minimiser l’importance de Google Transit (puisque les applications non Google utilisent GTFS et Transit l’itinéraire est désormais une fonctionnalité intégrée de Google Maps), et pour corriger diverses fautes de frappe 
 * Mise à jour d’exemples de captures d’écran pour refléter la présentation des champs GTFS dans l’interface utilisateur actuelle de Google Maps 
 * Mise à jour de l’adresse e-mail de contact Google pour les fournisseurs de données de transit 
 * Formatage mis à jour
 
#### 5 octobre 2007 
 
 * Modification de stop_sequence et shape_pt_sequence pour permettre l’augmentation des entiers non négatifs 
 * Descriptions clarifiées et correction des fautes de frappe
 
#### Mai 31, 2007 
 
 * Style de page mis à jour, rendu HTML plus propre et plus accessible 
 * Ajout de liens vers des exemples de flux publics et d’autres sites utiles 
 * Suppression d’exemples des descriptions de champs individuels
 
#### 9 avril, 2007 
 
 * Ajout d’une section sur [soumettre un flux](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle). 
 * Ajout du [Exemple de flux Agence de transport en commun](https://developers.google.com/transit/gtfs/examples/gtfs-feed). 
 * Ajout d’une note selon laquelle calendar.txt peut être omis si toutes les dates de service sont définies dans calendar_dates.txt. 
 * Le champ Agency_id est devenu facultatif dans les flux ne contenant qu’une seule agence. Cela permet aux flux existants sans Agency_id de rester valides. 
 * Ajout d’une spécification plus complète de Agency_url, stop_url et route_url, ainsi que d’exemples de valeurs supplémentaires pour ces champs. 
 * Ajout de 6 (Gondole) et 7 (Funiculaire) comme valeurs route_type valides. 
 
#### 8 mars 2007 
 
 * Modification mineure pour déplacer le champ stop_url de stop_times.txt, où il a été incorrectement spécifié dans la mise à jour du 28 février, vers stops.txt, à sa place. 
 
#### 5 mars 2007 
 
 * Modification mineure pour clarifier la description du champ route_long_name. 
 
#### 28 février 2007 
 
 * Ajout du frequencies.txt pour la prise en charge des horaires basés sur l’avancement. 
 * Plusieurs agences sont désormais autorisées dans le même flux. Également ajouté un nouveau champ Agency_id dans les agences.txt et routes.txt qui vous permet de spécifier quel itinéraire est exploité par quelle agence. 
 * Ajout d’URL par itinéraire et par arrêt. 
 * Ajout du champ direction_id dans trips.txt. 
 * Prise en charge des changements de headsign à mi-parcours avec l’ajout du champ stop_headsign dans stop_times.txt. 
 * Prise en charge des couleurs de route avec ajout de route_color et route_text_color facultatifs dans routes.txt. 
 * Suppression de la possibilité de spécifier les arrêts à l’aide d’adresses postales. La version précédente de la spécification vous permettait de donner l’emplacement d’un arrêt de transport en commun en utilisant une adresse postale dans les champs stop_street, stop_city, stop_region, stop_postcode et stop_country. Désormais, les emplacements des arrêts doivent être indiqués en utilisant stop_lat pour la latitude et stop_lon pour la longitude, qui sont plus utiles pour la plupart des applications. 
 * Ajout du type de véhicule du téléphérique pour le champ route_type dans routes.txt. 
 * Voir le résumé original [article du blog Headway](http://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/) des modifications. 
 
#### 29 novembre 2006 
 
 * Ajout de la prise en charge des informations sur la forme du trajet via shapes.txt 
 * Clarification de la définition de stop_sequence 
 * Marqué pickup_type et drop_off_type facultatifs
 
#### 31 octobre 2006 
 
 * Ajout de la prise en charge des informations tarifaires 
 * Dates supprimées des noms de fichiers individuels 
 * Modification des définitions de valeur route_type 
 * Autorisation de publier plusieurs fichiers de flux en même temps, à condition que car leurs périodes de service ne se chevauchaient pas 
 * Correction de block_id dans trips.txt afin qu’il soit correctement marqué Optionnel 
 * A noté que les en-têtes de colonnes doivent être inclus
 
#### 29 septembre 2006 
 
 * Modification mineure pour corriger quelques erreurs dans les exemples. 
 
#### 25 septembre 2006 
 
 * Version initiale.