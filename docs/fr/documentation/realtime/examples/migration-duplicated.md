## Guide de migration- Transition des voyages AJOUTÉS aux voyages DUPLICATED 
 
 La `trip.schedule_relationship` en temps réel GTFS de `DUPLICATED` représente un nouveau voyage qui est identique à un voyage programmé existant, à l’exception de la date et de l’heure de début du service. 
 
 Ce guide de migration définit comment les producteurs et consommateurs existants qui utilisaient l’énumération `ADDED` pour représenter les voyages dupliqués doivent passer à l’énumération `DUPLICATED`. L’objectif est de minimiser les perturbations pour les producteurs et les consommateurs pendant la transition. 
 
 *Si vous êtes un producteur ou un application réutilisatrice qui n’a **pas** utilisé l’énumération `ADDED` pour décrire les voyages en double, aucune action n’est requise- vous pouvez produire/consommer des voyages `DUPLICATED` sans produire/consommer aucun `ADDED`. Entités ADDED` .* 
 
 Pour un historique complet de l’énumération `DUPLICATED`, voir la [proposition `DUPLICATED` sur GitHub](https://github.com/google/transit/pull/221). 
 
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
 
 Il est suggéré d’informer les consommateurs existants (par exemple, via une liste de diffusion de développeur·euse ) que l’utilisation de `ADDED` pour les voyages en double est obsolète avant une date limite définie et que les consommateurs devraient plutôt commencer à consommer les voyages `DUPLICATED`. La stratégie ci-dessus utilisée pour faire correspondre les entités de voyage `ADDED` et `DUPLICATED` doit également être mentionnée et un lien vers ce guide de migration doit être inclus. Une fois la date limite passée, vous pouvez supprimer les entités `ADDED` de votre flux et publier uniquement les entités `DUPLICATED` pour les voyages en double. 
 
#### Consommateurs 
 
 Comme mentionné ci-dessus, les producteurs passeront des énumérations `ADDED` à `DUPLICATED` en publiant initialement deux entités pour chaque voyage dupliqué, en utilisant l’une des deux options ci-dessus pour faire correspondre les identifiants entre les entités. 
 
 Par conséquent, lorsqu’un application réutilisatrice implémente la prise en charge des trajets `DUPLICATED`, il est important que les consommateurs : 
 
1. Ignorent tous les trajets `ADDED` qui ont le même `trip.trip_id` en tant que voyage `DUPLICATED` `trip.trip_id` 
1. Ignorez tous les voyages `ADDED` qui ont le même `trip.trip_id` en tant que voyage `DUPLICATED` `trip_properties.trip_id`