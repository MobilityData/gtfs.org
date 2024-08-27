## Guía de migración: transición de viajes de AGREGADOS a DUPLICADOS (ADDED a DUPLICATED)

 El `DUPLICATED` de `trip.schedule_relationship` en GTFS Realtime representa un nuevo viaje que es igual a un viaje programado existente, excepto por la date y hora de inicio del servicio. 
 
 Esta guía de migración define cómo los productores y consumidores existentes que utilizaban la enumeración "`ADDED`" para representar viajes duplicados deben realizar la transición a la enumeración "`DUPLICATED`". El objetivo es minimizar las perturbaciones para los productores y consumidores durante la transición. 
 
 *Si usted es un productor o consumidor que **no** ha utilizado la enumeración `ADDED` para describir viajes duplicados, no es necesario realizar ninguna acción: puede producir/consumir viajes `DUPLICATED` sin producir/consumir ningúna entidad `ADDED`.* 
 
 Para obtener un historial completo de la enumeración `DUPLICATED`, consulte la propuesta [`DUPLICATED` en GitHub](https://github.com/google/transit/pull/221). 
 
### Uso de entidades AÑADIDAS y DUPLICADAS en el mismo feed

#### Productores 
 
 Si es un productor que ha estado utilizando la enumeración `ADDED` para viajes duplicados, para evitar interrupciones en Para los consumidores existentes, se recomienda que continúe produciendo entidades "`ADDED`" para estos viajes, pero también agregue entidades "`DUPLICATED`" para el mismo viaje. 
 
 Sin embargo, para evitar que los consumidores agreguen accidentalmente el mismo viaje dos veces, las entidades que hacen referencia al mismo viaje **deben** estar vinculadas utilizando el mismo `trip_id`. Puede vincular las dos entidades en **una** de dos maneras: 
 
 1. `viaje.trip_id` de ambas entidades **debe** ser el mismo, O 
 2. `trip.trip_id` del viaje `ADDED` **debe** ser el mismo que el viaje `DUPLICATED` `trip_properties.trip_id` 
 
 Aquí hay un ejemplo de la primera opción (1) para duplicar GTFS `d` 1`, con el `trip.trip_id` coincidente en las entidades `ADDED` y `DUPLICATED` : 
 
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

Aquí hay un ejemplo de la segunda opción (2) para duplicar GTFS `d` 1`, con el `trip.trip_id` del viaje `ADDED` que coincide con el viaje `DUPLICATED` `trip_properties.trip_id`: 

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


 Se sugiere que notifique a los consumidores existentes (por ejemplo, a través de una lista de correo de desarrolladores) que el uso de "`ADDED`" para viajes duplicados está obsoleto antes de una fecha límite establecida y que los consumidores deberían empezar a consumir los viajes "`DUPLICATED`". También se debe mencionar la estrategia anterior que se utiliza para hacer coincidir las entidades de viaje "`ADDED`" y "`DUPLICATED`" y se debe incluir un enlace a esta guía de migración. Después de que pase la fecha límite, puede eliminar las entidades "`ADDED`" de su feed y publicar solo las entidades "`DUPLICATED`" para viajes duplicados. 
 
#### Consumidores 
 
 Como se mencionó anteriormente, los productores pasarán de enumeraciones "`ADDED`" a "`DUPLICATED`" publicando inicialmente dos entidades para cada viaje duplicado, utilizando una de las dos opciones anteriores para hacer coincidir las identificaciones entre las entidades. 
 
 Por lo tanto, cuando un consumidor implementa soporte para viajes "`DUPLICATED`", es importante que los consumidores:

 1. Ignore cualquier viaje "`ADDED`" que tenga el mismo `trips.trip_id` como un viaje `DUPLICATED`. trip_id` 
 1. Ignore cualquier viaje `ADDED` que tenga el mismo `trips.trip_id` como un viaje `DUPLICATED` `trip_properties.trip_id`