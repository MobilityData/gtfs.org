## Guide de migration- Transition des trajets ADDED vers NEW ou DUPLICATED 
 
 La relation GTFS en temps réel `trip.schedule_relationship` de `NEW` représente un nouveau trajet qui s’exécute selon un horaire indépendant de tout trajet planifié existant.

 La `trip.schedule_relationship` en temps réel GTFS de `DUPLICATED` représente un nouveau voyage qui est identique à un voyage programmé existant, à l’exception de la date et de l’heure de début du service. 
 
 Ce guide de migration définit comment les producteurs et les consommateurs existants qui utilisaient l’énumération `ADDED` doivent passer à l’énumération `NEW` ou `DUPLICATED`. L’objectif est de minimiser les perturbations pour les producteurs et les consommateurs pendant la transition. 

 *Si vous êtes un producteur ou un application réutilisatrice qui n’a**pas**utilisé l’énumération `ADDED`, aucune action n’est requise- vous pouvez produire/consommer des trajets `NEW` et/ou `DUPLICATED` sans produire/consommer d’entités `ADDED` .* 

 Pour un historique complet de l’énumération `NEW`, consultez la [proposition `NEW` et `REPLACEMENT` sur GitHub](https://github.com/google/transit/pull/504). 
 
 Pour un historique complet de l’énumération `DUPLICATED`, voir la [proposition `DUPLICATED` sur GitHub](https://github.com/google/transit/pull/221). 

### Vers lequel migrer

Les énumérations `NEW` et `DUPLICATED` sont toutes deux utilisées pour spécifier un trajet qui n’était pas initialement prévu pour s’exécuter dans le GTFS statique.

Utilisez « NOUVEAU » si votre voyage ne peut pas être décrit à l’aide de voyages planifiés comme modèle. Par exemple, si le trajet s’arrête à des arrêts différents des trajets réguliers de l’itinéraire, ou si le trajet supplémentaire est une prise en charge uniquement au début de l’itinéraire malgré le fait que les trajets réguliers permettent à la fois la prise en charge et la dépose à tous les arrêts.

Utilisez `DUPLICATED` si votre trajet est une copie d’un trajet planifié, qui peut avoir lieu au même moment ou à des heures différentes du trajet initialement prévu.

### Utilisation des entités ADDED et NEW dans le même flux

Si vous êtes un producteur qui a utilisé l’énumération `ADDED` pour spécifier des trajets qui ne sont pas liés à l’horaire, pour éviter de perturber les consommateurs existants, il est recommandé de continuer à produire des droits `ADDED` pour ces trajets, mais également d’ajouter des droits `NEW` pour le même trajet.

Cependant, pour empêcher les consommateurs d’ajouter accidentellement le même trajet deux fois, les entités référençant le même trajet**doivent**être liées en utilisant les mêmes `trip_id`, `route_id` et `start_date`.
In de plus, le contenu de `stop_time_update` doit également être le même.

#### Producteurs

~~~
entity {
 id: "ei0"
 trip_update {
    trip: {
       trip_id: "1"//&lt;-- un trip_id non trouvé dans le GTFS statique
       route_id: "A"
      schedule_relationship: ADDED
      start_date: "20200821"//&lt;-- Nouvelle date de voyage 
      start_time: "11:30:00"//&lt;-- Nouvelle heure de voyage
    }
    stop_time_update {
...//La liste complète des points d’appel du voyage
    }
 }
}

entity {
 id: "ei10"
 trip_update {
    trip: {
       trip_id: "1"//&lt;-- Le même trip_id que ci-dessus
       route_id: "A"//&lt;-- Le même route_id que ci-dessus
      schedule_relationship: NEW
      start_date: "20200821"//&lt;-- La même date que ci-dessus
      start_time: "11:30:00"//&lt;-- La même heure que ci-dessus
    }
    stop_time_update {
...//&lt;-- Le même contenu que ci-dessus
    }
 }
}
~~~

Il est suggéré d’informer les consommateurs existants (par exemple, via une liste de diffusion de développeur·euse ) que l’utilisation de `ADDED` est en cours Les clients devraient désormais utiliser les « NOUVEAUX » voyages. La stratégie ci-dessus, utilisée pour associer les entités de voyage « `ADDED` » et « NOUVEAUX », doit également être mentionnée, et un lien vers ce guide de migration doit être inclus. Une fois le délai écoulé, vous pouvez supprimer les entités « NEW » de votre flux et publier uniquement les entités « NEW » pour les voyages nouvellement ajoutés.

#### Consommateurs

Comme mentionné ci-dessus, les producteurs passeront des énumérations « `ADDED` » à « NEW » en publiant initialement deux entités pour chaque nouveau voyage utilisant le même « `trip_id` ».

Par conséquent, lorsqu’un application réutilisatrice implémente la prise en charge des voyages « NEW », il est important que les consommateurs ignorent tous les voyages « `ADDED` » qui ont le même « `trip_id` » `trip_id` voyage « NEW ».
 

### Utilisation des entités ADDED et DUPLICATED dans le même flux

#### Producteurs 
 
 Si vous êtes un producteur qui a utilisé l’énumération `ADDED` pour des voyages en double, pour éviter toute interruption de consommateurs existants, il est recommandé de continuer à produire des entités `ADDED` pour ces voyages mais également d’ajouter des entités `DUPLICATED` pour le même voyage. 
 
 Cependant, pour éviter que les consommateurs ajoutent accidentellement deux fois le même voyage, les entités faisant référence au même voyage **doivent** être liées en utilisant le même `trip_id`. Vous pouvez relier les deux entités de **l’une** des deux manières suivantes : 
 
 1. `trip.trip_id` des deux entités **doit** être le même, OU 
 2. `trip.trip_id` du voyage `ADDED` **doit** être le même que le voyage `DUPLICATED` `trip_properties.trip_id` 
 
 Voici un exemple de la première option (1) pour dupliquer GTFS `trip_id 1`, avec le `trip.trip_id` correspondant dans les entités `ADDED` et `DUPLICATED`: 
 
~~~
entity {
  id: "ei0"
  trip_update {
    trip: {
      trip_id: "1" // <-- trip_id from static GTFS to copy
      schedule_relationship: ADDED
      start_date: "20200821" // <-- New trip date
      start_time: "11:30:00" // <-- New trip time
    }
    stop_time_update {
	...
    }
  }
}

entity {
  id: "ei10"
  trip_update {
    trip: {
      trip_id: "1" // <-- trip_id from static GTFS to copy
      schedule_relationship: DUPLICATED
    }
    trip_properties {
      trip_id: "NewTripId987" // <-- New trip_id unique to this trip
      start_date: "20200821"  // <-- New trip date
      start_time: "11:30:00"  // <-- New trip time
    }
    stop_time_update {
	...
    }
  }
}
~~~

 Voici un exemple de la deuxième option (2) pour dupliquer GTFS `trip_id 1`, avec le `trip.trip_id` du voyage `ADDED` correspondant au voyage `DUPLICATED` `trip_properties.trip_id` : 
 
~~~
entity {
  id: "ei0"
  trip_update {
    trip: {
      trip_id: "NewTripId987" // <-- New trip_id unique to this trip
      schedule_relationship: ADDED
      start_date: "20200821" // <-- New trip date
      start_time: "11:30:00" // <-- New trip time
    }
    stop_time_update {
	...
    }
  }
}

entity {
  id: "ei10"
  trip_update {
    trip: {
      trip_id: "1" // <-- trip_id from static GTFS to copy
      schedule_relationship: DUPLICATED
    }
    trip_properties {
      trip_id: "NewTripId987" // <-- Matches the ADDED trip.trip_id
      start_date: "20200821"  // <-- New trip date
      start_time: "11:30:00"  // <-- New trip time
    }
    stop_time_update {
	...
    }
  }
}
~~~
 
 Il est suggéré d’informer les consommateurs existants (par exemple, via une liste de diffusion de développeur·euse ) que l’utilisation de `ADDED` est obsolète avant une date limite définie et que les consommateurs doivent commencer à consommer les voyages `DUPLICATED` à la place. Français La stratégie ci-dessus utilisée pour faire correspondre les entités de voyage « `ADDED` » et « `DUPLICATED` » doit également être mentionnée et un lien vers ce guide de migration doit être inclus. Une fois le délai passé, vous pouvez supprimer les entités « `ADDED` » de votre flux et publier uniquement les entités « `DUPLICATED` » pour les voyages dupliqués.
 
#### Consommateurs 
 
 Comme mentionné ci-dessus, les producteurs passeront des énumérations `ADDED` à `DUPLICATED` en publiant initialement deux entités pour chaque voyage dupliqué, en utilisant l’une des deux options ci-dessus pour faire correspondre les identifiants entre les entités. 
 
 Par conséquent, lorsqu’un application réutilisatrice implémente la prise en charge des trajets `DUPLICATED`, il est important que les consommateurs : 
 
1. Ignorent tous les trajets `ADDED` qui ont le même `trip.trip_id` en tant que voyage `DUPLICATED` `trip.trip_id` 
1. Ignorez tous les voyages `ADDED` qui ont le même `trip.trip_id` en tant que voyage `DUPLICATED` `trip_properties.trip_id`