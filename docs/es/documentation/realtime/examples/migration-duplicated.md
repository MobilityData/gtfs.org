## Guía de migración: transición de viajes de AGREGADOS a NUEVOS o DUPLICADOS (ADDED a NEW o DUPLICATED)

El `trip.schedule_relationship` en tiempo real GTFS de `NEW` representa un nuevo viaje que se ejecuta según un horario independiente de cualquier viaje programado existente.
 
El `DUPLICATED` de `trip.schedule_relationship` en GTFS Realtime representa un nuevo viaje que es igual a un viaje programado existente, excepto por la date y hora de inicio del servicio. 
 
Esta guía de migración define cómo los productores y consumidores que usaban la enumeración `ADDED` deben realizar la transición a las enumeraciones `NEW` o `DUPLICATED`. El objetivo es minimizar las interrupciones para los productores y consumidores durante la transición. 

*Si usted es un productor o consumidor que **no** ha usado la enumeración `ADDED`, no se requiere ninguna acción: puede producir/consumir viajes `NEW` y/o `DUPLICATED` sin producir/consumir ninguna entidad `ADDED` .* 

Para obtener un historial completo de la enumeración `NEW`, consulte la [propuesta `NEW` y `REPLACEMENT` en GitHub](https://github.com/google/transit/pull/504).
 
Para obtener un historial completo de la enumeración `DUPLICATED`, consulte la propuesta [`DUPLICATED` en GitHub](https://github.com/google/transit/pull/221). 

### A cuál migrar

Tanto la enumeración `NEW` como la `DUPLICATED` se usan para especificar un viaje que no estaba originalmente programado para ejecutarse en la estática GTFS.

Usar `NEW` si su viaje no puede describirse utilizando ningún viaje programado como plantilla. Por ejemplo, si el viaje hace escala en paradas diferentes a las de los viajes regulares de la ruta, o si el viaje adicional es de recogida solo al inicio de la ruta a pesar de que los viajes regulares permiten tanto la recogida como el descenso en todas las paradas.

Use `DUPLICATED` si su viaje es una copia de un viaje programado, que puede ejecutarse al mismo tiempo o en horarios diferentes que el viaje programado original.

### Uso de entidades ADDED y NEW en el mismo feed

Si usted es un productor que ha estado usando la enumeración `ADDED` para especificar viajes que no están relacionados con el cronograma, para evitar interrupciones a los consumidores existentes, se recomienda que continúe produciendo derechos `ADDED` para estos viajes pero que también agregue derechos `NEW` para el mismo viaje.

Sin embargo, para evitar que los consumidores agreguen accidentalmente el mismo viaje dos veces, las entidades que hacen referencia al mismo viaje **deben** estar vinculadas usando los mismos `trip_id`, `route_id` y `start_date`, el contenido de `stop_time_update` también debe ser el mismo.

#### Productores

~~~
entidad {
 id: "ei0"
 trip_update {
    trip: {
       trip_id: "1"//&lt;-- no se encontró un trip_id en el GTFS estático
       route_id: "A"
      schedule_relationship: AÑADIDO
      start_date: "20200821"//&lt;-- Nueva date de viaje 
      start_time: "11:30:00"//&lt;-- Nueva hora de viaje
    }
    stop_time_update {
...//La lista completa de los puntos de llamada del viaje
    }
 }
}

entidad {
 id: "ei10"
 trip_update {
    trip: {
       trip_id: "1"//&lt;-- El mismo trip_id que el anterior
       route_id: "A"//&lt;-- El mismo route_id que el anterior
      schedule_relationship: NEW
      start_date: "20200821"//&lt;-- La misma date que la anterior
      start_time: "11:30:00"//&lt;-- La misma hora que la anterior
    }
    stop_time_update {
...//&lt;-- El mismo contenido que el anterior
    }
 }
}
~~~

Se sugiere que notifique a los consumidores existentes (por ejemplo, a través de una lista de correo para desarrolladores) que el uso de `ADDED` se considerará obsoleto en una fecha límite y los consumidores deberían comenzar a consumir los viajes "NUEVOS". También se debe mencionar la estrategia anterior que se utiliza para vincular las entidades de viaje `ADDED` y `NEW`, e incluir un enlace a esta guía de migración. Después de que pase la fecha límite, puede eliminar las entidades "`NEW`" de su feed y publicar solo las entidades "`NEW`" para los viajes recientemente agregados.

#### Consumidores

Como se mencionó anteriormente, los productores harán la transición de enumeraciones `ADDED` a "`NEW`" publicando inicialmente dos entidades para cada nuevo viaje usando el mismo `trip_id` lo tanto, cuando un consumidor implementa soporte para viajes `NUEVOS`, es importante que los consumidores ignoren cualquier viaje `ADDED` que tenga el mismo `trip_id` que un viaje "`NEW`" `trip_id`
 
### Uso de entidades AÑADIDAS y DUPLICADAS en el mismo feed

#### Productores 
 
Si es un productor que ha estado utilizando la enumeración `ADDED` para viajes duplicados, para evitar interrupciones en Para los consumidores existentes, se recomienda que continúe produciendo entidades "`ADDED`" para estos viajes, pero también agregue entidades "`DUPLICATED`" para el mismo viaje. 
 
Sin embargo, para evitar que los consumidores agreguen accidentalmente el mismo viaje dos veces, las entidades que hacen referencia al mismo viaje **deben** estar vinculadas utilizando el mismo `trip_id`. Puede vincular las dos entidades en **una** de dos maneras: 

 1. `viaje.trip_id` de ambas entidades **debe** ser el mismo, O 
 2. `trip.trip_id` del viaje `ADDED` **debe** ser el mismo que el viaje `DUPLICATED` `trip_properties.trip_id` 

Aquí hay un ejemplo de la primera opción (1) para duplicar GTFS `trip_id=1`, con el `trip.trip_id` coincidente en las entidades `ADDED` y `DUPLICATED` : 
 
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


Se recomienda notificar a los consumidores actuales (por ejemplo, a través de una lista de correo para desarrolladores) que el uso de `ADDED` quedará obsoleto a partir de una fecha límite y que, en su lugar, los usuarios deberían empezar a consumir los viajes `DUPLICATED`. También se debe mencionar la estrategia anterior que se utiliza para vincular las entidades de viaje `ADDED` y `DUPLICATED`, e incluir un enlace a esta guía de migración. Después de que pase la fecha límite, puede eliminar las entidades `ADDED` de su feed y publicar solo las entidades `DUPLICATED` para los viajes duplicados.
 
#### Consumidores 
 
Como se mencionó anteriormente, los productores pasarán de enumeraciones "`ADDED`" a "`DUPLICATED`" publicando inicialmente dos entidades para cada viaje duplicado, utilizando una de las dos opciones anteriores para hacer coincidir las identificaciones entre las entidades. 
 
Por lo tanto, cuando un consumidor implementa soporte para viajes "`DUPLICATED`", es importante que los consumidores:

 1. Ignore cualquier viaje "`ADDED`" que tenga el mismo `trips.trip_id` como un viaje `DUPLICATED`. trip_id` 
 2. Ignore cualquier viaje `ADDED` que tenga el mismo `trips.trip_id` como un viaje `DUPLICATED` `trip_properties.trip_id`