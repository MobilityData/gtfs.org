# GTFS Realtime#

## Historial de revisiones

#### Marzo 2024 
 
 * Modificaciones de viaje adoptadas. Consulte la [discusión](https://github.com/google/transit/pull/403). 
 
#### Noviembre 2022 
 
 * Se agregó soporte para viajes DELETED. Consulte la [discusión](https://github.com/google/transit/pull/352). 
 
#### Julio 2022 
 
 * Añadir cause_detail y effect_detail. Ver [discusión](https://github.com/google/transit/pull/332) 
 * Se agregó la capacidad de especificar un valor accesible para sillas de ruedas en un TripUpdate. VehicleDescriptor. Consulte la [discusión](https://github.com/google/transit/pull/340). 
 
#### Septiembre 2021 
 
 * Característica/imagen en alertas. Consulte la [discusión](https://github.com/google/transit/pull/283). 
 
#### Agosto de 2021 
 
 * Agregar GTFS-NewShapes como experimental. Consulte la [discusión](https://github.com/google/transit/pull/272). 
 
#### Abril de 2021 
 
 * Agregar return_occupancy_status a TripUpdate. Consulte la [discusión](https://github.com/google/transit/pull/260). 
 
#### Febrero 2021 
 
 * Aclaración de las descripciones de ocupación de GTFS Realtime. Consulte la [discusión](https://github.com/google/transit/pull/259). 
 
#### Septiembre 2020 
 
 * Soporta aglomeración de varios autos. Consulte la [discusión](https://github.com/google/transit/pull/237). 
 
#### Abril 2020 
 
 *Asignaciones de parada de soporte. Consulte la [discusión](https://github.com/google/transit/pull/219). 
 
#### Julio 2020 
 
 * Soporta viajes DUPLICADOS. Consulte la [discusión](https://github.com/google/transit/pull/221). 
 * Alerta tts_header_text, tts_description_text ya no es experimental. Consulte la [discusión](https://github.com/google/transit/pull/229). 
 * Etiquete los viajes GTFS-RT AGREGADOS como no completamente especificados. Consulte la [discusión](https://github.com/google/transit/pull/230). 
 
#### Abril 2020 
 
 * Marcar SeverityLevel como final. Consulte la [discusión](https://github.com/google/transit/pull/214). 
 * Agregar porcentaje_ocupación. Consulte la [discusión](https://github.com/google/transit/pull/213). 
 
#### 12 de marzo de 2020 
 
 *Recomendar proporcionar predicciones de TripUpdate para el próximo viaje en bloque. Consulte la [discusión](https://github.com/google/transit/pull/206). 
 
#### Agosto de 2019 
 
 * Documente que no es necesario que las actualizaciones de viaje se produzcan en el feed en orden de bloques. Consulte la [discusión](https://github.com/google/transit/pull/176). 
 * Agregar StopTimeUpdate. Valor NO PROGRAMADO de ScheduleRelationship. Consulte la [discusión](https://github.com/google/transit/pull/173). 
 
#### Mayo de 2019 
 
 * Agregar efecto de alerta de problema de accesibilidad. Consulte la [discusión](https://github.com/google/transit/pull/164). 
 
#### Febrero de 2019 
 
 * Agregar opción de efecto NO_EFFECT para alerta de servicio GTFS en tiempo real. Consulte la [discusión](https://github.com/google/transit/pull/137). 
 * Agregar un nuevo campo opcional SeverityLevel al feed de alertas de servicio. Consulte la [discusión](https://github.com/google/transit/pull/136). 
 * Agregar nuevos campos opcionales para la funcionalidad de Texto a Voz en el feed de alertas de servicio. Consulte la [discusión](https://github.com/google/transit/pull/135). 
 
#### Abril 2018 
 
 * Elimina requisito de stop_time_update llegada Y salida para viajes PROGRAMADOS. Consulte la [discusión](https://github.com/google/transit/pull/165). 
 
#### Agosto de 2017 
 
 * Definir cardinalidad semántica para campos GTFS en tiempo real. Consulte la [discusión](https://github.com/google/transit/pull/64). 
 
#### 30 de enero de 2015 
 
 * Se agregó el espacio de nombres de extensión Protocol Buffer a todos los mensajes GTFS en tiempo real restantes que aún no tenían uno (como `FeedMessage` y `FeedEntity`). 
 
#### 28 de enero de 2015 
 
 * Se agregó el campo experimental `delay` a `TripUpdate` ([discusión](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8)). 
 
#### 16 de enero de 2015 
 
 * Actualizar descripción de `TripDescriptor.start_time`. 
 
#### 8 de enero de 2015 
 
 * Enum experimental definido `OccupancyStatus`. 
 * Se agregó el campo experimental `occupancy_status` a `VehiclePosition` ([discusión](https://groups.google.com/forum/#!topic/gtfs-realtime/_HtNTGp5LxM)). 
 
#### 22 de mayo de 2014 
 
 * Descripción actualizada de la enumeración `ScheduleRelationship` en el message `StopTimeUpdate` ([discusión](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)). 
 * Se eliminó el REEMPLAZO de los valores de enumeración `ScheduleRelationship` en el message `TripDescriptor` ([discusión](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)). 
 
#### 12 de octubre de 2012 
 
 * Se agregó el campo de marca de tiempo al message `TripUpdate`. 
 
#### 30 de mayo de 2012 
 
 * Se agregaron detalles específicos sobre Extensiones a la especificación. 
 
#### 30 de noviembre de 2011 
 
 * Se agregó el espacio de nombres de extensión Protocol Buffer a los mensajes clave GTFS en tiempo real para facilitar la escritura de extensiones en la especificación. 
 
#### 25 de octubre de 2011 
 
 * Documentación actualizada para aclarar que `alert`, `header_text` y `description_text` son valores de texto sin formato. 
 
#### 20 de agosto de 2011 
 
 * Documentación actualizada para aclarar la semántica del message `TimeRange`. 
 
#### 22 de agosto de 2011 
 
 * Versión inicial.