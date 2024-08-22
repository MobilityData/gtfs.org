# GTFS Realtime

### Historique des révisions

#### Mars 2024 
 
 * Modifications de voyage adoptées. Voir [discussion](https://github.com/google/transit/pull/403). 
 
#### Novembre 2022 
 
 * Ajout de la prise en charge des voyages SUPPRIMES. Voir [discussion](https://github.com/google/transit/pull/352). 
 
#### Juillet 2022 
 
 * Ajoutez cause_detail et effect_detail. Voir [discussion](https://github.com/google/transit/pull/332) 
 * Ajout de la possibilité de spécifier une valeur accessible en fauteuil roulant dans un TripUpdate. VehicleDescriptor. Voir [discussion](https://github.com/google/transit/pull/340). 
 
#### Septembre 2021 
 
 * Fonctionnalité/image dans les alertes. Voir [discussion](https://github.com/google/transit/pull/283). 
 
#### Août 2021 
 
 * Ajouter GTFS-NewShapes comme expérimental. Voir [discussion](https://github.com/google/transit/pull/272). 
 
#### Avril 2021 
 
 * Ajoutez exit_occupancy_status à TripUpdate. Voir [discussion](https://github.com/google/transit/pull/260). 
 
#### Février 2021 
 
 * Clarification des descriptions d’occupation GTFS Realtime. Voir [discussion](https://github.com/google/transit/pull/259). 
 
#### Septembre 2020 
 
 * Prise en charge de l’encombrement de plusieurs voitures. Voir [discussion](https://github.com/google/transit/pull/237). 
 
#### Avril 2020 
 
 * Prise en charge des affectations d’arrêt. Voir [discussion](https://github.com/google/transit/pull/219). 
 
#### Juillet 2020 
 
 * Prise en charge des voyages DUPLIQUÉS. Voir [discussion](https://github.com/google/transit/pull/221). 
 * Alerte tts_header_text, tts_description_text n’est plus expérimental. Voir [discussion](https://github.com/google/transit/pull/229). 
 * Étiquetez les trajets GTFS-RT ADDED comme n’étant pas entièrement spécifiés. Voir [discussion](https://github.com/google/transit/pull/230). 
 
#### Avril 2020 
 
 * Marquer SeverityLevel comme final. Voir [discussion](https://github.com/google/transit/pull/214). 
 * Ajoutez occupation_percentage. Voir [discussion](https://github.com/google/transit/pull/213). 
 
#### 12 mars 2020 
 
 * Il est recommandé de fournir des prévisions TripUpdate pour le prochain voyage en bloc. Voir [discussion](https://github.com/google/transit/pull/206). 
 
#### Août 2019 
 
 * Documenter que les trip_updates ne doivent pas nécessairement se produire dans le flux en ordre de bloc. Voir [discussion](https://github.com/google/transit/pull/176). 
 * Ajouter StopTimeUpdate. Valeur UNSCHEDULED de ScheduleRelationship. Voir [discussion](https://github.com/google/transit/pull/173). 
 
#### Mai 2019 
 
 * Ajouter un effet d’alerte de problème d’accessibilité. Voir [discussion](https://github.com/google/transit/pull/164). 
 
#### Février 2019 
 
 * Ajout de l’option d’effet NO_EFFECT pour l’alerte de service GTFS Realtime. Voir [discussion](https://github.com/google/transit/pull/137). 
 * Ajouter un nouveau champ facultatif SeverityLevel au flux d’alertes de service. Voir [discussion](https://github.com/google/transit/pull/136). 
 * Ajoutez de nouveaux champs facultatifs pour la fonctionnalité de Synthèse Vocale dans le flux d’alertes de service. Voir [discussion](https://github.com/google/transit/pull/135). 
 
#### Avril 2018 
 
 * Supprimer l’exigence d’arrivée ET de départ stop_time_update pour les voyages PROGRAMMÉS. Voir [discussion](https://github.com/google/transit/pull/165). 
 
#### Août 2017 
 
 * Définir la cardinalité sémantique pour les champs GTFS-temps réel. Voir [discussion](https://github.com/google/transit/pull/64). 
 
#### 30 janvier 2015 
 
 * Ajout de l’espace de noms d’extension Protocol Buffer à tous les messages GTFS Realtime restants qui n’en avaient pas déjà un (tels que `FeedMessage` et `FeedEntity`). 
 
#### 28 janvier 2015 
 
 * Ajout du champ expérimental `delay` à `TripUpdate` ([discussion](https://groups.google.com/forum/#!topic/gtfs- temps réel/NsTIRQdMNN8)). 
 
#### 16 janvier 2015 
 
 * Mise à jour de la description de `TripDescriptor.start_time`. 
 
#### 8 janvier 2015 
 
 * Énumération expérimentale définie `OccupancyStatus`. 
 * Ajout du champ expérimental `occupancy_status` à `VehiclePosition` ([discussion](https://groups.google.com/forum/#!topic/gtfs-realtime/_HtNTGp5LxM)). 
 
#### 22 mai 2014 
 
 * Description mise à jour de l’énumération `ScheduleRelationship` dans le message `StopTimeUpdate` ([discussion](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)). 
 * Suppression du REMPLACEMENT des valeurs d’énumération `ScheduleRelationship` dans le message `TripDescriptor` ([discussion](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)). 
 
#### 12 octobre 2012 
 
 * Ajout du champ d’horodatage au message `TripUpdate`. 
 
#### 30 mai 2012 
 
 * Ajout de détails spécifiques sur les extensions à la spécification. 
 
#### 30 novembre 2011 
 
 * Ajout de l’espace de noms d’extension Protocol Buffer aux principaux messages GTFS Realtime pour faciliter l’écriture d’extensions dans la spécification. 
 
#### 25 octobre 2011 
 
 * Documentation mise à jour pour clarifier que `alert`, `header_text` et `description_text` sont tous deux des valeurs en texte brut. 
 
#### 20 août 2011 
 
 * Documentation mise à jour pour clarifier la sémantique du message `TimeRange`. 
 
#### 22 août 2011 
 
 * Version initiale.