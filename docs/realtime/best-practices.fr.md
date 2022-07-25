---
search:
  exclude: true
---

# Meilleures pratiques GTFS Realtime

## Introduction

Il s'agit de pratiques recommandées pour décrire les informations sur les transports publics en temps réel dans le format de données [GTFS Realtime](../reference).

### Structure du document

Les pratiques recommandées sont organisées en deux sections principales

* __[Recommandations de pratiques organisées par message](#practice-recommendations-organized-by-message)__: Les recommandations sont organisées par message et par champ dans le même ordre que celui décrit dans la référence officielle GTFS Realtime.
* __[Recommandations pratiques organisées par cas](#practice-recommendations-organized-by-use-case)__: Dans certains cas particuliers, tels que le service basé sur la fréquence (par opposition au service basé sur l'horaire), il peut être nécessaire d'appliquer les pratiques à plusieurs messages et champs ainsi qu'aux données GTFS Schedule Schedule correspondantes. Ces recommandations sont regroupées dans cette section.

### Publication des flux et pratiques générales

* Les flux doivent être publiés à une url publique et permanente.
* L'url doit être directement accessible sans qu'il soit nécessaire de se connecter pour accéder au flux. Si vous le souhaitez, vous pouvez utiliser des clés API, mais l'enregistrement des clés API doit être automatisé et accessible à tous.
* Maintenir des identifiants persistantsid champsid ) dans un flux GTFS Realtime (par exemple, `FeedEntity.id`, `VehicleDescriptor.id`, `CarriageDetails.id`) entre les itérations du flux.
* Les flux GTFS Realtime doivent être actualisés au moins une fois toutes les 30 secondes, ou lorsque les informations représentées dans le fluxPosition d'un vehicle) changent, selon la fréquence la plus élevée. Les VehiclePositions ont tendance à changer plus fréquemment que les autres entités de flux et doivent être actualisées aussi souvent que possible. Si le contenu n'a pas changé, le flux doit être mis à jour avec un nouveau `FeedHeader.timestamp` indiquant que les informations sont toujours pertinentes à partir de ce timestamp.
* Les données contenues dans un flux GTFS Realtime ne doivent pas être antérieures à 90 secondes pour les mises à jour des trip et les positions des vehicle, ni à 10 minutes pour les alertes de service. Par exemple, même si un producteur rafraîchit continuellement le `FeedHeader.timestamp` timestamp toutes les 30 secondes, l'âge des VehiclePositions dans ce flux ne doit pas être supérieur à 90 secondes.
* Le serveur hébergeant les données GTFS Realtime doit être fiable et renvoyer systématiquement des réponses codées protobuf valides. Moins de 1 % des réponses doivent être invalides (erreurs de protobuf ou erreurs d'extraction).
* Le serveur web qui héberge les données GTFS Realtime doit être configuré pour signaler correctement la date de modification du fichier (voir HTTP/1.1 - Request for Comments 2616, section 14.29) afin que les consommateurs puissent utiliser l'header HTTP `If-Modified-Since`. Cela permet aux producteurs et aux consommateurs d'économiser de la bande passante en évitant de transférer des contenus de flux qui n'ont pas été modifiés.
* Les flux devraient fournir un contenu de flux codé par tampon de protocole par défaut lorsqu'ils sont interrogés via une requête HTTP à l'url donnée - les consommateurs ne devraient pas avoir besoin de définir des en-têtes HTTP acceptés spéciaux pour recevoir un contenu codé par tampon de protocole.
* En raison de la façon dont les tampons de protocole codent les [valeurs facultatives](https://developers.google.com/protocol-buffers/docs/proto#optional), avant de lire les données d'un flux GTFS Realtime, les consommateurs doivent vérifier la présence de valeurs à l'aide des méthodes `hasX()` générées par le tampon de protocole avant d'utiliser cette valeur et ne doivent utiliser la valeur que si `hasX()` est vrai (où `X` est le nom du champ). Si `hasX()` renvoie `false`, la valeur par défaut pour ce champ définie dans la valeur `GTFS`.proto doit être prise en charge. Si le consommateur utilise la valeur sans vérifier au préalable la méthode `hasX()`, il peut lire des données par défaut qui n'ont pas été publiées intentionnellement par le producteur.
* Les flux doivent utiliser HTTPS au lieu de HTTP (sans cryptage) pour garantir l'intégrité des flux.
* Les flux doivent couvrir la grande majorité des voyages inclus dans l'ensemble de données statiques complémentaires GTFS. En particulier, ils doivent inclure des données sur les zones urbaines à forte densité et à fort trafic et sur les routes très fréquentées.

## Recommandations de pratiques organisées par message

### FeedHeader

| Nom du champ            | Recommandation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gtfs_realtime_version` | La version actuelle est "2.0".  Tous les flux GTFS Realtime devraient être "2.0" ou plus, car la première version de GTFS Realtime n'exigeait pas tous les champs nécessaires pour représenter correctement les diverses situations de transit.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `timestamp`             | Cet timestamp ne doit pas diminuer entre deux itérations séquentielles du flux.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|                         | Cette valeur d'timestamp doit toujours changer si le contenu du flux change - le contenu du flux ne doit pas changer sans mettre à jour l'header. `timestamp`.<br/><br/>*Erreurs courantes* - S'il y a plusieurs instances de flux GTFS Realtime derrière un équilibreur de charge, chaque instance peut extraire des informations de la source de données en temps réel et les publier aux consommateurs de manière légèrement désynchronisée. Si un consommateur GTFS Realtime fait deux demandes consécutives, et que chaque demande est servie par une instance de flux GTFS Realtime différente, le même contenu de flux peut potentiellement être renvoyé au consommateur avec des horodatages différents. <br/><br/>*Solution possible* - Les producteurs doivent fournir un en-tête `Last-Modified` et les consommateurs doivent transmettre leur header HTTP le plus récent. `If-Modified-Since` header éviter de recevoir des données périmées.<br/><br/>*Solution possible* - S'il n'est pas possible d'utiliser les en-têtes HTTP, des options telles que les sessions collantes peuvent être utilisées pour s'assurer que chaque consommateur est dirigé vers le même serveur producteur. |

### FeedEntity

Toutes les entités ne doivent être retirées d'un flux GTFS Realtime que lorsqu'elles ne sont plus pertinentes pour les utilisateurs. Les flux sont considérés comme apatrides, ce qui signifie que chaque flux reflète l'état complet du système de transittime. Si une entity est fournie dans une instance de flux mais qu'elle est abandonnée dans une mise à jour ultérieure du flux, il faut supposer qu'il n'y a pas d'informationtime pour cette entity.

| Nom du champ | Recommandation                                     |
| ------------ | -------------------------------------------------- |
| `id`         | Doit rester stable pendant toute la durée du trip  |

### TripUpdate

Directives générales pour les annulations de trip:

* Lors de l'annulation de trajets sur plusieurs jours, les producteurs doivent fournir des TripUpdates référençant les `trip_ids` et les `start_dates` donnés comme `CANCELED` ainsi qu'une Alert avec `NO_SERVICE` référençant les mêmes `trip_ids` et `TimeRange` qui peut être montrée aux coureurs expliquant l'annulation (par exemple, DETOUR).
* Si aucun arrêt d'un trip n'est visité, le trip doit être `CANCELED` au lieu d'avoir toutes les `mises à jour des heures d'arrêt` marquées comme `SKIPPED`.

| Nom du champ       | Recommandation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip`             | Se référer à [message TripDescriptor](#TripDescriptor).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
|                    | Si séparé `VehiclePosition` et `TripUpdate` sont fournis, [TripDescriptor](#TripDescriptor) et [VehicleDescriptor](#VehicleDescriptor) l'appariement des valeurs d'id doit correspondre entre les deux flux.<br/><br/>Par exemple, un `VehiclePosition` entity a `vehicle_id:A` et `trip_id:4`alors le correspondant `TripUpdate` l'entity devrait aussi avoir `vehicle_id:A` et `trip_id:4`. Si un `TripUpdate` l'entity a `trip_id:4` et tout `vehicle_id` autre que 4, il s'agit d'une erreur.                                                                                                                                            |
| `vehicle`          | Se référer à [message VehicleDescriptor](#VehicleDescriptor).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|                    | Si des `VehiclePosition` et `TripUpdate` des flux séparés sont fournis, [TripDescriptor](#TripDescriptor) et [VehicleDescriptor](#VehicleDescriptor) L'appariement des valeurs d'id doit correspondre entre les deux flux.<br/><br/>Par exemple, une `VehiclePosition` l'entity a `vehicle_id:A` et `trip_id:4`alors l'entité correspondante `TripUpdate` l'entity devrait aussi avoir `vehicle_id:A` et `trip_id:4`. S'il y en a `TripUpdate` l'entity a `trip_id:4` et n'importe quel `vehicle_id` autre que 4, il s'agit d'une erreur.                                                                                                    |
| `stop_time_update` | `stop_time_updates` pour un `trip_id` doit être strictement ordonné par ordre croissant `stop_sequence` et aucun `stop_sequence` ne doit être répété.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|                    | Pendant le trip, tous les messages `TripUpdates` devraient inclure au moins un `stop_time_update` avec une time arrival ou de departure prévue dans le futur. Notez que la [spécification GTFS Realtime](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates) dit que les producteurs ne devraient pas laisser tomber un `StopTimeUpdate` s'il se réfère à un arrêt avec une time arrival SCHEDULED dans le futur pour le trip donné (c'est-à-dire que le vehicle a passé l'arrêt avant l'heure prévue), car sinon il sera conclu qu'il n'y a pas de mise à jour pour cet arrêt. |
| `timestamp`        | Doit refléter l'time cette prédiction pour ce trip a été mise à jour.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `delay`            | `TripUpdate.delay` doit représenter l'écart par rapport au programme, c'est-à-dire la valeur passée observée de l'avance ou du retard du vehicle par rapport au programme. Les prédictions pour les arrêts futurs doivent être fournies par le biais de `StopTimeEvent.delay` ou `StopTimeEvent.time`.                                                                                                                                                                                                                                                                                                                                       |

### TripDescriptor

Si des flux séparés `VehiclePosition` et `TripUpdate` sont fournis, l'appariement des valeurs d id [TripDescriptor](#TripDescriptor) et [VehicleDescriptor](#VehicleDescriptor) doit correspondre entre les deux flux.

Par exemple, si une entity `VehiclePosition` possède un `Vehicle_id:A` et un `trip_id`:4, l'entity `TripUpdate` correspondante doit également posséder un `Vehicle_id:A` et un `trip_id`:4.

| Nom du champ            | Recommandation                                                                                                    |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `schedule_relationship` | Le comportement des `ADDED` trips n'est pas spécifié et l'utilisation de cette énumération n'est pas recommandée. |

### VehicleDescriptor

Si des flux `VehiclePosition` et `TripUpdate` distincts sont fournis, l'appariement des valeurs [TripDescriptor](#TripDescriptor) et [VehicleDescriptor](#VehicleDescriptor) id doit correspondre entre les deux flux.

Par exemple, si l'entity `VehiclePosition` possède `Vehicle_id:A` et `trip_id`:4, l'entity `TripUpdate` correspondante doit également posséder `Vehicle_id:A` et `trip_id`:4.

| Nom du champ | Recommandation                                                                          |
| ------------ | --------------------------------------------------------------------------------------- |
| `id`         | Devrait identifier un vehicle de façon unique et stable pendant toute la durée du trip. |

### StopTimeUpdate

| Nom du champ    | Recommandation                                                                                                                                                                                                                                                      |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `stop_sequence` | Fournir `stop_sequence` dans la mesure du possible, car il correspond sans ambiguïté à une time arrêt GTFS dans le format `stop_times.txt` contrairement à `stop_id`qui peut se produire plus d'une fois au cours d'un trip (par exemple, un itinéraire en boucle). |
| `arrival`       | les temps d'arrival entre des arrêts séquentiels doivent augmenter - ils ne doivent pas être identiques ou diminuer.                                                                                                                                                |
|                 | arrival `time` (spécifié en [StopTimeEvent](#StopTimeEvent)) doit être antérieure au departure `time` pour le même arrêt si une escale ou un time séjour est prévu. `time` doit être la même que le departure `time`.                                               |
| `departure`     | les heures dedeparture entre des arrêts séquentiels doivent augmenter - elles ne doivent pas être identiques ou diminuer.                                                                                                                                           |
|                 | Ledeparture `time` (spécifiée dans [StopTimeEvent](#StopTimeEvent)) doit être identique à l'arrival `time` pour le même arrêt s'il n'y a pas d'escale ou de time d'attente. `time` doit être postérieur à l'arrival `time` .                                        |

### StopTimeEvent

| Nom du champ | Recommandation                                                                                                                                                                                                                                                                                                                                                                                                              |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `delay`      | Si seulement `delay` est fourni dans un `stop_time_update` `arrival` ou `departure` (et non `time`), alors le GTFS [`stop_times.txt`](https://gtfs.org/reference/static#stopstxt) doit contenir `arrival_times` et/ou `departure_times` pour ces arrêts correspondants. A `delay` dans le flux en temps réel n'a aucun sens si vous ne disposez pas d'une time à laquelle l'ajouter dans le GTFS. `stop_times.txt` fichier. |

### VehiclePosition

Voici les champs qu'il est recommandé d'inclure dans un flux VehiclePostions pour fournir aux consommateurs des données de haute qualité (par exemple, pour générer des prédictions)

| Nom du champ         | Remarques                                                                                                                                                                                                                                                                                                          |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `entity.id`          | Devrait être maintenu stable pendant toute la durée du trip                                                                                                                                                                                                                                                        |
| `vehicle.timestamp`  | Il est fortement recommandé de fournir l'timestamp auquel la Position vehicle a été mesurée. Sinon, les consommateurs doivent utiliser l'timestamp message, ce qui peut donner des résultats trompeurs pour les usagers lorsque le dernier message a été mis à jour plus fréquemment que la Position individuelle. |
| `vehicle.vehicle.id` | Devrait identifier un vehicle de manière unique et stable pendant toute la durée du trip.                                                                                                                                                                                                                          |

### Position

La Position vehicle doit se situer à moins de 200 mètres des données GTFS `shapes.txt` pour le trip en cours, à moins qu'il n'y ait une Alert avec l'Effect `DETOUR` pour ce `trip_id`.

### Alert

Directives générales pour les alertes :

* Lorsque `trip_id` et `start_time` sont dans l'intervalle `exact_time=1`, `start_time` doit être postérieur au début de l'intervalle d'un multiple exact de `headway_secs`.
* En cas d'annulation de trajets sur plusieurs jours, les producteurs doivent fournir des TripUpdates référençant les `trip_ids` et les `start_dates` donnés comme `CANCELED` ainsi qu'une Alert avec `NO_SERVICE` référençant les mêmes `trip_ids` et `TimeRange` qui peut être montrée aux usagers pour expliquer l'annulation (par exemple, DETOUR).
* Si une Alert affecte tous les arrêts d'une ligne, utilisez une Alert basée sur la ligne plutôt qu'une Alert basée sur l'arrêt. N'appliquez pas l'Alert à chaque arrêt de la ligne.
* Bien qu'il n'y ait pas de limite de caractères pour les alertes de service, les usagers du transport en commun consultent souvent les alertes sur des appareils mobiles. Soyez concis.

| Nom du champ       | Recommandation                                                                  |
| ------------------ | ------------------------------------------------------------------------------- |
| `description_text` | Utilisez des sauts de ligne pour rendre votre Alert service plus facile à lire. |

## Recommandations pratiques classées par cas d'utilisation

### Trajets basés sur la fréquence

Un trip basé sur la fréquence ne suit pas un horaire fixe mais tente de maintenir des intervalles de passage prédéterminés. Ces trajets sont indiqués dans [GTFS frequency.txt](https://gtfs.org/reference/static/#frequenciestxt) en définissant `exact_times=0` ou en omettant le champ `exact_times` (notez que les trajets `exact_times=1` *ne* sont *PAS* des trajets basés sur la fréquence - `frequencies.txt` avec `exact_times=1` est simplement utilisé comme une méthode pratique pour stocker les trajets basés sur les horaires d'une manière plus compacte). Il existe plusieurs bonnes pratiques à garder à l'esprit lors de la construction de flux GTFS Realtime pour les trajets basés sur la fréquence.

* Dans [TripUpdate.StopTimeUpdate](#StopTimeUpdate), l'[StopTimeEvent](#StopTimeEvent) pour l'`arrival` et le `departure` ne doit pas contenir de `delay` car les trajets basés sur la fréquence ne suivent pas un horaire fixe. Au lieu de cela, l'`time` doit être fournie pour indiquer les prévisions d'arrival.

* Comme l'exige la spécification, lorsque vous décrivez un `trip` dans [TripUpdate](#TripUpdate) ou [VehiclePosition](#VehiclePosition) en utilisant [TripDescriptor](#TripDescriptor), vous devez fournir tous les éléments `trip_id`, `start_time` et `start_date`. De plus, `schedule_relationship` doit être `UNSCHEDULED`.

(par exemple, les trajets de renforcement).

## A propos de ce document

### Objectifs

Les objectifs du maintien des meilleures pratiques GTFS Realtime sont les suivants :

* Améliorer l'expérience de l'utilisateur final dans les applications de transport public.
* Faciliter le déploiement et la mise à l'échelle des applications, produits et services par les développeurs de logiciels.

### Comment proposer ou modifier les meilleures pratiques GTFS Realtime publiées.

Les applications et les pratiques GTFS évoluent, et il est donc possible que ce document doive être modifié de time en time. Pour proposer une modification de ce document, ouvrez une demande de retrait [dans le dépôt GitHub GTFS Realtime Best Practices](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) et préconisez le changement.

### Liens vers ce document

Veuillez établir un lien ici afin de fournir aux producteurs d'aliments pour animaux des conseils pour la formation correcte des données GTFS Realtime. Chaque recommandation individuelle a un lien d'ancrage. Cliquez sur la recommandation pour obtenir l'url du lien d'ancrage dans la page.

Si une application GTFS Realtime formule des exigences ou des recommandations concernant les pratiques en matière de données GTFS Realtime qui ne sont pas décrites ici, il est recommandé de publier un document contenant ces exigences ou recommandations pour compléter ces meilleures pratiques communes.
