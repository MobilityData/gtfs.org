# Bonnes pratiques GTFS Realtime

## Introduction 
 
 Il s’agit de pratiques recommandées pour décrire les informations sur les transports publics en temps réel au format de données [GTFS Realtime](../reference). 
 
### Structure du document 
 
 Les pratiques Recommandé sont organisées en deux sections principales 
 
 * __[Recommandations pratiques organisées par message](#recommandations-pratiques-organisees-par-message) :__ Les recommandations sont organisés par message et champ dans le même ordre décrit dans la référence officielle GTFS Realtime. 
 * __[Recommandations pratiques organisées par cas](#recommandations-pratiques-organisees-par-cas-dutilisation) :__ Dans des cas particuliers, tels que le service basé sur les fréquences (par rapport au service basé sur les horaires), les pratiques peuvent devoir être appliqué à plusieurs messages et champs ainsi qu’aux données de planification GTFS correspondantes. Ces recommandations sont regroupées dans cette section. 
 
### Publication de flux et pratiques générales 
 
 * Les flux doivent être publiés sur une URL publique et permanente 
 * L’URL doit être directement accessible sans nécessiter de connexion pour accéder au flux. Si vous le souhaitez, des clés API peuvent être utilisées, mais l’enregistrement des clés API doit être automatisé et accessible à tous. 
 * Conserver des identifiants persistants (champs d’identification) dans un flux GTFS Realtime (par exemple, FeedEntity.id, VehicleDescriptor.id, CarriageDetails.id) à travers les itérations du flux. 
 * Les flux GTFS Realtime doivent être actualisés au moins une fois toutes les 30 secondes, ou chaque fois que les informations représentées dans le flux (position d’un véhicule) changent, selon la fréquence la plus élevée. Les VehiclePositions ont tendance à changer plus fréquemment que les autres entités de flux et doivent être mises à jour aussi fréquemment que possible. Si le contenu n’a pas changé, le flux doit être mis à jour avec un nouveau `FeedHeader.timestamp` indiquant que les informations sont toujours pertinentes à partir de cet horodatage. 
 * Les données d’un flux GTFS Realtime ne doivent pas dater de plus de 90 secondes pour les mises à jour de trajet et les positions des véhicules et de pas plus de 10 minutes pour les alertes de service. Par exemple, même si un producteur actualise continuellement l’horodatage `FeedHeader.timestamp` toutes les 30 secondes, l’âge des VehiclePositions dans ce flux ne doit pas dépasser 90 secondes. 
 * Le serveur hébergeant les données GTFS Realtime doit être fiable et renvoyer systématiquement des réponses codées en protobuf correctement formatées. Moins de 1 % des réponses doivent être invalides (erreurs de protobuf ou erreurs de récupération). 
 * Le serveur Web hébergeant les données GTFS Realtime doit être configuré pour signaler correctement la date de modification du fichier (voir HTTP/1.1- Demande de commentaires 2616, sous la section 14.29) afin que les consommateurs puissent exploiter l’en-tête HTTP `If-Modified-Since`. Cela permet aux producteurs et aux consommateurs d’économiser de la bande passante en évitant de transférer le contenu du flux qui n’a pas changé. 
 * Les flux doivent fournir par défaut un contenu de flux codé par tampon de protocole lorsqu’ils sont interrogés via une requête HTTP à l’URL donnée- les consommateurs ne devraient pas avoir besoin de définir des en-têtes d’acceptation HTTP spéciaux pour recevoir du contenu codé par tampon de protocole. 
 * En raison de la façon dont les tampons de protocole encodent les [valeurs facultatives](https:), avant de lire les données d’un flux GTFS Realtime, les consommateurs doivent vérifier la présence de valeurs en utilisant les méthodes `hasX()` générées par le tampon de protocole avant d’utiliser cette valeur et ne doit utiliser la valeur que si `hasX()` est vrai (où `X` est le nom du champ). Si `hasX()` renvoie `false`, la valeur par défaut de ce champ définie dans la valeur `gtfs-realtime.proto` doit être supposée. Si le application réutilisatrice utilise la valeur sans vérifier d’abord la méthode `hasX()`, il se peut qu’il lise des données par défaut qui n’ont pas été intentionnellement publiées par le producteur. 
 * Les flux doivent utiliser HTTPS au lieu de HTTP (sans cryptage) pour garantir l’intégrité du flux. 
 * Les flux doivent couvrir la grande majorité des déplacements inclus dans l’ensemble de données GTFS statique associé. En particulier, il devrait inclure des données sur les zones urbaines à forte densité et à fort trafic ainsi que sur les itinéraires très fréquentés.

## Recommandations pratiques organisées par message

### FeedHeader 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `gtfs_realtime_version` | La version actuelle est "2.0". Tous les flux GTFS Realtime doivent être « 2.0 » ou supérieur, car la première version de GTFS Realtime ne nécessitait pas tous les champs nécessaires pour représenter de manière adéquate diverses situations de transit. | 
 | `timestamp` | Cet horodatage ne doit pas diminuer entre deux itérations de flux séquentielles. | 
 | | Cette valeur d’horodatage doit toujours changer si le contenu du flux change- le contenu du flux ne doit pas changer sans mettre à jour l’en-tête `timestamp`.<br><br> *Erreurs courantes* : S’il existe plusieurs instances de flux GTFS Realtime derrière un équilibreur de charge, chaque instance peut extraire des informations de la source de données en temps réel et les publier légèrement de manière désynchronisée. Si un application réutilisatrice GTFS Realtime effectue deux requêtes consécutives et que chaque requête est traitée par une instance de flux GTFS Realtime différente, le même contenu de flux pourrait potentiellement être renvoyé au application réutilisatrice avec des horodatages différents.<br><br> *Solution possible* - Les producteurs doivent fournir un en-tête HTTP `Last-Modified` et les consommateurs doivent transmettre leur en-tête HTTP `If-Modified-Since` le plus récent pour éviter de recevoir des données obsolètes.<br><br> *Solution possible* - Si les en-têtes HTTP ne peuvent pas être utilisés, des options telles que les sessions persistantes peuvent être utilisées pour garantir que chaque application réutilisatrice est acheminé vers le même serveur producteur. | 
 
### FeedEntity 
 
 Toutes les entités ne doivent être supprimées d’un flux GTFS Realtime que lorsqu’elles ne sont plus pertinentes pour les utilisateurs. Les flux sont considérés comme apatrides, ce qui signifie que chaque flux reflète l’intégralité de l’état en temps réel du système de transport en commun. Si une entité est fournie dans une instance de flux mais supprimée lors d’une mise à jour de flux ultérieure, il convient de supposer qu’il n’existe aucune information en temps réel pour cette entité. 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `id` | Doit rester stable pendant toute la durée du voyage | 
 
### TripUpdate 
 
 Directives générales pour les annulations de voyage : 
 
 * Lors de l’annulation de voyages sur plusieurs jours, les producteurs doivent fournir des TripUpdates faisant référence aux `trip_ids` et aux `start_dates` donnés comme `CANCELED`. ainsi qu’une alerte avec `NO_SERVICE` faisant référence aux mêmes `trip_ids` et `TimeRange` qui peuvent être montrées aux passagers expliquant l’annulation (par exemple, un détour). 
 * Si aucun arrêt d’un voyage n’est visité, le voyage doit être `CANCELED` au lieu d’avoir toutes les `stop_time_updates` marquées comme `SKIPPED`. 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `trip` | Reportez-vous au [message TripDescriptor](#tripdescriptor). | 
 | | Si des flux `VehiclePosition` et `TripUpdate` distincts sont fournis, l’appariement des valeurs d’ID [TripDescriptor](#tripdescriptor) et [VehicleDescriptor](#vehicledescriptor) doit correspondre entre les deux flux.<br><br> Par exemple, une entité `VehiclePosition` a `vehicle_id:A` et `trip_id:4`, alors l’entité `TripUpdate` correspondante doit également avoir `vehicle_id:A` et `trip_id:4`. Si une entité `TripUpdate` a `trip_id:4` et un `vehicle_id` autre que 4, il s’agit d’une erreur. | 
 | `vehicle` | Reportez-vous au [message VehicleDescriptor](#vehicledescriptor). | 
 | | Si des flux `VehiclePosition` et `TripUpdate` distincts sont fournis, l’appariement des valeurs d’ID [TripDescriptor](#tripdescriptor) et [VehicleDescriptor](#vehicledescriptor) doit correspondre entre les deux flux.<br><br> Par exemple, une entité `VehiclePosition` a `vehicle_id:A` et `trip_id:4`, alors l’entité `TripUpdate` correspondante doit également avoir `vehicle_id:A` et `trip_id:4`. Si une entité `TripUpdate` a `trip_id:4` et un `vehicle_id` autre que 4, il s’agit d’une erreur. | 
 | `stop_time_update` | `stop_time_updates` pour un `trip_id` donné doit être strictement ordonné en augmentant `stop_sequence` et aucune `stop_sequence` ne doit être répétée. | 
 | | Pendant que le voyage est en cours, toutes les `TripUpdates` doivent inclure au moins une `stop_time_update` avec une heure d’arrivée ou de départ prévue dans le futur. Notez que la [spécification GTFS Realtime](../feed_entities/trip-updates/#stoptimeupdate) indique que les producteurs ne doivent pas abandonner un `StopTimeUpdate` passé s’il fait référence à un arrêt avec une heure d’arrivée prévue dans le futur pour le voyage donné. (c’est-à-dire que le véhicule a franchi l’arrêt plus tôt que prévu), sinon on conclura qu’il n’y a pas de mise à jour pour cet arrêt. | 
 | `timestamp` | Doit refléter l’heure à laquelle cette prévision pour ce voyage a été mise à jour. | 
 | `delay` | `TripUpdate.delay` doit représenter l’écart d’horaire, c’est-à-dire la valeur passée observée pour l’avance/le retard du véhicule par rapport à l’horaire. Les prévisions pour les arrêts futurs doivent être fournies via `StopTimeEvent.delay` ou `StopTimeEvent.time`. | 
 
### TripDescriptor 
 
 Si des flux distincts `VehiclePosition` et `TripUpdate` sont fournis, l’appariement des valeurs d’ID [TripDescriptor](#tripdescriptor) et [VehicleDescriptor](#vehicledescriptor) doit correspondre entre les deux flux. 
 
 Par exemple, une entité `VehiclePosition` a `vehicle_id:A` et `trip_id:4`, alors l’entité `TripUpdate` correspondante doit également avoir `vehicle_id:A` et `trip_id:4`. 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `schedule_relationship` | Le comportement des déplacements `ADDED` n’est pas spécifié et l’utilisation de cette énumération n’est pas recommandée. | 
 
 
### VehicleDescriptor 
 
 Si des flux distincts `VehiclePosition` et `TripUpdate` sont fournis, l’appariement des valeurs d’ID [TripDescriptor](#tripdescriptor) et [VehicleDescriptor](#vehicledescriptor) doit correspondre entre les deux.se nourrit. 
 
 Par exemple, une entité `VehiclePosition` a `vehicle_id:A` et `trip_id:4`, alors l’entité `TripUpdate` correspondante doit également avoir `vehicle_id:A` et `trip_id:4`. 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `id` | Doit identifier un véhicule de manière unique et stable sur toute la durée du voyage | 
 
### StopTimeUpdate 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `stop_sequence` | Fournissez `stop_sequence` chaque fois que possible, car il se résout sans ambiguïté en une heure d’arrêt GTFS dans `stop_times.txt` contrairement à `stop_id`, qui peut se produire plus d’une fois dans un trajet (par exemple, un itinéraire en boucle). | 
 | `arrival` | Les temps d’arrivée entre les arrêts séquentiels devraient augmenter- ils ne devraient pas être les mêmes ni diminuer. | 
 | | `time` d’arrivée (spécifiée dans [StopTimeEvent](#stoptimeevent)) doit être antérieure à l’ `time` de départ pour le même arrêt si une escale ou un temps d’arrêt est prévu- sinon, `time` d’arrivée doit être la même que celle de `time`. | 
 | `departure` | Les temps de départ entre les arrêts séquentiels devraient augmenter- ils ne devraient pas être les mêmes ni diminuer. | 
 | | `time` de départ (spécifiée dans [StopTimeEvent](#stoptimeevent)) doit être la même que l’ `time` d’arrivée pour le même arrêt si aucune escale ou temps d’arrêt n’est prévu- sinon, `time` de départ doit être après l’ `time`. | 
 
### StopTimeEvent 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `delay` | Si seul `delay` est fourni dans une `stop_time_update` `arrival` ou `departure` (et non `time`), alors le GTFS [`stop_times.txt`](../../schedule/reference/#stop_timestxt ) doit contenir `arrival_times` et/ou `departure_times` pour ces arrêts correspondants. Une valeur `delay` dans le flux en temps réel n’a de sens que si vous disposez d’une heure à laquelle l’ajouter dans le fichier GTFS `stop_times.txt`. | 
 
### VehiclePosition 
 
 Voici les champs recommandés qui devraient être inclus dans un flux VehiclePostions afin de fournir aux consommateurs des données de haute qualité (par exemple, pour générer des prédictions) 
 
 | Nom du champ | Remarques | 
 |---|---| 
 | `entity.id` | Doit rester stable pendant toute la durée du voyage 
 | `vehicle.timestamp` | Il est fortement recommandé de fournir l’horodatage auquel la position du véhicule a été mesurée. Dans le cas contraire, les consommateurs doivent utiliser l’horodatage du message, ce qui peut donner des résultats trompeurs pour les coureurs lorsque le dernier message a été mis à jour plus fréquemment que la position individuelle. 
 | `vehicle.vehicle.id` | Doit identifier un véhicule de manière unique et stable sur toute la durée du voyage | 
 
### Position 
 
 La position du véhicule doit être à moins de 200 mètres des données GTFS `shapes.txt` pour le trajet en cours, sauf s’il y a une alerte avec l’effet `DETOUR` pour ce `trip_id`. 
 
### Alerte 
 
 Directives générales pour les alertes : 
 
 * Lorsque `trip_id` et `start_time` sont dans l’intervalle `exact_time=1`, `start_time` doit être postérieur au début de la intervalle par un multiple exact de `headway_secs`. 
 * Lors de l’annulation de voyages sur plusieurs jours, les producteurs doivent fournir des TripUpdates faisant référence aux mêmes « `trip_ids` » et « `start_dates` » comme « `CANCELED` » ainsi qu’une alerte avec « `NO_SERVICE` » faisant référence aux mêmes « `trip_ids` » et « `TimeRange` » que peut être montré aux passagers pour expliquer l’annulation (par exemple, un détour). 
 * Si une alerte affecte tous les arrêts d’une ligne, utilisez une alerte basée sur la ligne au lieu d’une alerte basée sur l’arrêt. N’appliquez pas l’alerte à chaque arrêt de la ligne. 
 * Bien qu’il n’y ait pas de limite de caractères pour les alertes de service, les usagers des transports en commun consulteront souvent les alertes sur leurs appareils mobiles. Veuillez être concis. 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `description_text` | Utilisez des sauts de ligne pour faciliter la lecture de votre alerte de service. | 
 
## Recommandations pratiques organisées par cas d’utilisation

### Déplacements basés sur la fréquence 
 
 Un voyage basé sur la fréquence ne suit pas un horaire fixe mais tente de maintenir des avancées prédéterminées. Ces déplacements sont indiqués dans [Fréquence GTFS .txt](../../schedule/reference/#frequenciestxt) en définissant `exact_times=0` ou en omettant le champ `exact_times` (notez que les trajets `exact_times=1` sont * PAS* les trajets basés sur la fréquence- `frequencies.txt` avec `exact_times=1` est simplement utilisé comme méthode pratique pour stocker les trajets basés sur un horaire de manière plus compacte). Il existe plusieurs bonnes pratiques à garder à l’esprit lors de la création de flux GTFS Realtime pour les trajets basés sur la fréquence. 
 
 * Dans [TripUpdate. StopTimeUpdate](#stoptimeupdate), le [StopTimeEvent](#stoptimeevent) pour `arrival` et `departure` ne doit pas contenir `delay` car les trajets basés sur la fréquence ne suivent pas un horaire fixe. Au lieu de cela, `time` ​​doit être fourni pour indiquer les prévisions d’arrivée/départ. 
 
 * Comme l’exige la spécification, lors de la description `trip` » dans [TripUpdate](#tripupdate) ou [VehiclePosition](#vehicleposition) en utilisant [TripDescriptor](#tripdescriptor), tous les `trip_id`, `start_time` et `start_date` doivent être fournis. De plus, `schedule_relationship` doit être `UNSCHEDULED`. 
 (par exemple, voyages de renforcement). 
 
 
## À propos de ce document

### Objectifs 
 
 Les objectifs du maintien des bonnes pratiques GTFS Realtime sont les suivants : 
 
 * Améliorer l’expérience client de l’utilisateur final dans les applications de transports publics
 * Faciliter le déploiement et la mise à l’échelle des applications, des produits et des services par les développeurs de logiciels
 
### Comment proposer ou modifier les bonnes pratiques GTFS Realtime publiées 
 
 Les applications et pratiques GTFS évoluent, et ce document peut donc doivent être modifiés de temps en temps. Pour proposer un amendement à ce document, ouvrez une pull request [dans le répertoire GitHub GTFS Realtime Best Practices](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) et plaidez en faveur du changement. 
 
### Lien vers ce document 
 
 Veuillez créer un lien ici afin de fournir aux producteurs d’aliments pour animaux des conseils pour la formation correcte des données GTFS Realtime. Chaque recommandation individuelle a un lien d’ancrage. Cliquez sur la recommandation pour obtenir l’URL du lien d’ancrage dans la page. 
 
 Si une application consommant GTFS Realtime formule des exigences ou des recommandations concernant les pratiques de données GTFS Realtime qui ne sont pas décrites ici, il est recommandé de publier un document contenant ces exigences ou recommandations pour compléter ces bonnes pratiques communes. 


