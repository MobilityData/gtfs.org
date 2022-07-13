# Mejores prácticas Realtime tiempo real deGTFS

## Introducción

Estas son las prácticas recomendadas para describir la información de transporte público Realtime en el formato de datos [GTFS Realtime](../reference).

### Estructura del documento

Las prácticas recomendadas están organizadas en dos secciones principales

* __Recomendaciones prácticas[organizadas por](#practice-recommendations-organized-by-message)__ mensaje: Las recomendaciones están organizadas por mensaje y campo en el mismo orden descrito en la referencia oficial de GTFS Realtime.
* __Recomendaciones prácticas organizadas por[casos](#practice-recommendations-organized-by-use-case)__: En casos particulares, como el servicio basado en la frecuencia (frente al servicio Schedule), puede ser necesario aplicar las prácticas en varios mensajes y campos, así como en los correspondientes datos del Schedule GTFS. Estas recomendaciones se consolidan en esta sección.

### Publicación de feeds y prácticas generales

* Los feeds deben publicarse en una URL pública y permanente
* La URL debe ser directamente accesible sin necesidad de iniciar sesión para acceder al feed. Si se desea, se pueden utilizar claves API, pero el registro de las claves API debe ser automático y estar disponible para todos.
* Mantener identificadores persistentes (campos id) dentro de un feed GTFS Realtime (por ejemplo, `FeedEntity.id`, `VehicleDescriptor.id`, `CarriageDetails.id`) a través de las iteraciones del feed.
* Los feeds deGTFS Realtime deben actualizarse al menos una vez cada 30 segundos, o siempre que la información representada en el feed (posición de un vehículo) cambie, lo que sea más frecuente. Las posiciones de los vehículos tienden a cambiar con más frecuencia que otras entidades de alimentación y deben actualizarse con la mayor frecuencia posible. Si el contenido no ha cambiado, el feed debe actualizarse con un nuevo `FeedHeader.timestamp` que refleje que la información sigue siendo relevante a partir de ese timestamp.
* Los datos de un feed GTFS Realtime no deben tener más de 90 segundos de antigüedad en el caso de las actualizaciones de trayectos y las posiciones de los vehículos, ni más de 10 minutos en el caso de las alertas de servicio. Por ejemplo, incluso si un productor está actualizando continuamente el sello de tiempo `FeedHeader.timestamp` cada 30 segundos, la edad de VehiclePositions dentro de ese feed no debe ser mayor de 90 segundos.
* El servidor que aloja los datos GTFS Realtime debe ser fiable y devolver sistemáticamente respuestas codificadas con protobuf válido. Menos del 1% de las respuestas deben ser inválidas (errores de protobuf o errores de obtención).
* El servidor web que aloja los datos GTFS Realtime debe estar configurado para informar correctamente de la fecha de modificación del archivo (véase HTTP/1.1 - Solicitud de comentarios 2616, en la sección 14.29) para que los consumidores puedan aprovechar la cabecera HTTP `If-Modified-Since`. Esto ahorra ancho de banda a productores y consumidores al evitar la transferencia de contenidos de feeds que no han cambiado.
* Los feeds deben proporcionar por defecto el contenido de los feeds codificado en el buffer de protocolo cuando se consultan a través de una petición HTTP en la URL dada - los consumidores no deben necesitar definir cabeceras especiales de aceptación HTTP para recibir el contenido codificado en el buffer de protocolo.
* Debido a la forma en que los búferes de protocolo codifican [los valores opcionales](https://developers.google.com/protocol-buffers/docs/proto#optional), antes de leer los datos de un feed GTFS Realtime los consumidores deben comprobar la presencia de valores utilizando los métodos `hasX(` ) generados por el búfer de protocolo antes de utilizar ese valor y sólo deben utilizar el valor si `hasX()` es verdadero (donde `X` es el nombre del campo). Si hasX( `)` devuelve `false`, se debe asumir el valor por defecto para ese campo definido en el valor `GTFS`.proto. Si el consumidor utiliza el valor sin comprobar primero el método hasX( `)`, puede estar leyendo datos por defecto que no fueron publicados intencionadamente por el productor.
* Los feeds deben utilizar HTTPS en lugar de HTTP (sin encriptación) para garantizar la integridad del feed.
* Los feeds deben cubrir la gran mayoría de los viajes incluidos en el conjunto de datos estáticos GTFS complementario. En particular, debe incluir datos de las zonas urbanas de alta densidad y tráfico y de las rutas más transitadas.

## Recomendaciones de prácticas organizadas por mensaje

### FeedHeader

| Nombre del campo        | Recomendación                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gtfs_realtime_version` | La versión actual es "2.0".  Todos los feeds de GTFS Realtime deberían ser "2.0" o superiores, ya que las primeras versiones de GTFS Realtime no requerían todos los campos necesarios para representar adecuadamente diversas situaciones de tránsito.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `timestamp`             | Esta marca de tiempo no debe disminuir entre dos iteraciones secuenciales de alimentación.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|                         | Este valor de la marca de tiempo debe cambiar siempre si el contenido de la alimentación cambia - el contenido de la alimentación no debe cambiar sin actualizar la cabecera `timestamp`.<br /><br />*Errores comunes* - Si hay varias instancias de la alimentación GTFS Realtime detrás de un equilibrador de carga, cada instancia puede estar extrayendo información de la fuente de datos Realtime y publicándola a los consumidores ligeramente desincronizada. Si un consumidor de GTFS Realtime realiza dos solicitudes consecutivas, y cada una de ellas es servida por una instancia de alimentación de GTFS Realtime diferente, el mismo contenido de alimentación podría ser devuelto al consumidor con diferentes marcas de tiempo.<br /><br />*Posible solución* - Los productores deben proporcionar una cabecera `Last-Modified` cabecera HTTP, y los consumidores deberían pasar su cabecera HTTP más reciente `If-Modified-Since` para evitar recibir datos obsoletos.<br /><br />*Posible solución* - Si no se pueden utilizar las cabeceras HTTP, se pueden utilizar opciones como las sesiones fijas para garantizar que cada consumidor se dirija al mismo servidor productor. |

### FeedEntity

Todas las entidades sólo deben ser eliminadas de un feed GTFS Realtime cuando ya no sean relevantes para los usuarios. Los feeds se consideran sin estado, lo que significa que cada feed refleja todo el estado en tiempo real del sistema de tránsito. Si una entidad se proporciona en una instancia de feed pero se elimina en una actualización de feed posterior, debe asumirse que no hay información en tiempo real para esa entidad.

| Nombre del campo | Recomendación                                          |
| ---------------- | ------------------------------------------------------ |
| `id`             | Debe mantenerse estable a lo largo de todo el trayecto |

### TripUpdate

Directrices generales para la cancelación de viajes:

* Cuando se cancelen viajes durante varios días, los productores deben proporcionar TripUpdates que hagan referencia a los `trip_ids` y `start_dates` dados como `CANCELADOS`, así como una Alerta con `NO_SERVICE` que haga referencia a los mismos `trip_ids` y `TimeRange` que pueda mostrarse a los viajeros explicando la cancelación (por ejemplo, desvío).
* Si no se va a visitar ninguna de las paradas de un trayecto, el trayecto debe ser `CANCELADO` en lugar de que todas las `actualizaciones de stop_time` se marquen como `SKIPPED`.

| Nombre del campo   | Recomendación                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip`             | Remitirse a [mensaje TripDescriptor](#TripDescriptor).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|                    | Si está separado `VehiclePosition` y `TripUpdate` se proporcionan alimentaciones separadas, [TripDescriptor](#TripDescriptor) y [VehicleDescriptor](#VehicleDescriptor) El emparejamiento de los valores de ID debe coincidir entre los dos feeds.<br /><br />Por ejemplo, un `VehiclePosition` entidad tiene `vehicle_id:A` y `trip_id:4`, entonces el correspondiente `TripUpdate` la entidad debe tener también `vehicle_id:A` y `trip_id:4`. Si cualquier `TripUpdate` la entidad tiene `trip_id:4` y cualquier `vehicle_id` que no sea 4, se trata de un error.                                                                                |
| `vehicle`          | Refiérase a [mensaje VehicleDescriptor](#VehicleDescriptor).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|                    | Si se proporcionan `VehiclePosition` y `TripUpdate` se proporcionan feeds, [TripDescriptor](#TripDescriptor) y [VehicleDescriptor](#VehicleDescriptor) El emparejamiento de los valores de identificación debe coincidir entre los dos feeds.<br /><br />Por ejemplo, una `VehiclePosition` entidad tiene `vehicle_id:A` y `trip_id:4`, entonces la correspondiente `TripUpdate` la entidad también debe tener `vehicle_id:A` y `trip_id:4`. Si hay `TripUpdate` entidad tiene `trip_id:4` y cualquiera `vehicle_id` distinto de 4, se trata de un error.                                                                                           |
| `stop_time_update` | `stop_time_updates` para un determinado `trip_id` debe estar estrictamente ordenado por el incremento de `stop_sequence` y no `stop_sequence` debe repetirse.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|                    | Mientras el viaje está en curso, todos los `TripUpdates` debe incluir al menos una `stop_time_update` con una hora de llegada o salida prevista en el futuro. Tenga en cuenta que la [especificaciónGTFS Realtime ](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates) dice que los productores no deben dejar caer un `StopTimeUpdate` si se refiere a una parada con una hora de llegada prevista en el futuro para el viaje en cuestión (es decir, el vehículo ha pasado por la parada antes de lo Schedule), ya que de lo contrario se concluirá que no hay actualización para esta parada. |
| `timestamp`        | Debe reflejar la hora en que se actualizó esta predicción para este viaje.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `delay`            | `TripUpdate.delay` debe representar la desviación Schedule horario, es decir, el valor pasado observado para el adelanto/retraso del Schedule del vehículo. Las predicciones para futuras paradas deberían proporcionarse a través de `StopTimeEvent.delay` o `StopTimeEvent.time`.                                                                                                                                                                                                                                                                                                                                                                 |

### TripDescriptor

Si se proporcionan fuentes separadas de `VehiclePosition` y `TripUpdate`, el emparejamiento de los valores de [TripDescriptor](#TripDescriptor) y [VehicleDescriptor](#VehicleDescriptor) ID debe coincidir entre las dos fuentes.

Por ejemplo, una entidad `VehiclePosition` tiene `vehicle_id:A` y `trip_id` `trip_id`:4, entonces la entidad `TripUpdate` correspondiente también debería tener `vehicle_id:A` y `trip_id`:4.

| Nombre del campo        | Recomendación                                                                                           |
| ----------------------- | ------------------------------------------------------------------------------------------------------- |
| `schedule_relationship` | El comportamiento de `ADDED` viajes no está especificado y no se recomienda el uso de esta enumeración. |

### VehicleDescriptor

Si se proporcionan fuentes separadas de `VehiclePosition` y `TripUpdate`, el emparejamiento de los valores de [TripDescriptor](#TripDescriptor) y [VehicleDescriptor](#VehicleDescriptor) ID debe coincidir entre las dos fuentes.

Por ejemplo, una entidad `VehiclePosition` tiene vehicle_id: `A` y `trip_id` `trip_id`:4, entonces la entidad `TripUpdate` correspondiente también debería tener `vehicle_id`:A y `trip_id`:4.

| Nombre del campo | Recomendación                                                                            |
| ---------------- | ---------------------------------------------------------------------------------------- |
| `id`             | Debe identificar un vehículo de forma única y estable durante toda la duración del viaje |

### StopTimeUpdate

| Nombre del campo | Recomendación                                                                                                                                                                                                                                                      |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `stop_sequence`  | Proporcionar `stop_sequence` siempre que sea posible, ya que resuelve de forma inequívoca una hora de parada GTFS en `stop_times.txt` a diferencia de `stop_id`que puede ocurrir más de una vez en un viaje (por ejemplo, la ruta en bucle).                       |
| `arrival`        | Los tiempos de llegada entre paradas secuenciales deben aumentar, no deben ser iguales ni disminuir.                                                                                                                                                               |
|                  | Llegada `time` (especificado en [StopTimeEvent](#StopTimeEvent)) debe ser anterior a la salida `time` para la misma parada si se prevé una escala o tiempo de permanencia - de lo contrario, la llegada `time` debe ser la misma que la salida `time`.             |
| `departure`      | Los tiempos de salida entre paradas secuenciales deben aumentar - no deben ser iguales ni disminuir.                                                                                                                                                               |
|                  | La salida `time` (especificada en [StopTimeEvent](#StopTimeEvent)) debe ser la misma que la de llegada `time` para la misma parada si no se espera una escala o tiempo de permanencia - de lo contrario, la salida `time` debe ser posterior a la llegada `time` . |

### StopTimeEvent

| Nombre del campo | Recomendación                                                                                                                                                                                                                                                                                                                                                                                                      |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `delay`          | Si sólo `delay` se proporciona en un `stop_time_update` `arrival` o `departure` (y no `time`), entonces el GTFS [`stop_times.txt`](https://gtfs.org/reference/static#stopstxt) debe contener `arrival_times` y/o `departure_times` para estos topes correspondientes. A `delay` en el feed de Realtime no tiene sentido a menos que tenga una hora de reloj a la que añadirlo en el GTFS `stop_times.txt` archivo. |

### Posición del vehículo

A continuación se indican los campos recomendados que deben incluirse en un feed de VehiclePostions para proporcionar a los consumidores datos de alta calidad (por ejemplo, para generar predicciones)

| Nombre del campo     | Notas                                                                                                                                                                                                                                                                                                                                       |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity.id`          | Debe mantenerse estable durante toda la duración del viaje                                                                                                                                                                                                                                                                                  |
| `vehicle.timestamp`  | Se recomienda encarecidamente proporcionar la marca de tiempo en la que se midió la posición del vehículo. De lo contrario, los consumidores deben utilizar la marca de tiempo del mensaje, lo que puede tener resultados engañosos para los ciclistas cuando el último mensaje se actualizó con más frecuencia que la posición individual. |
| `vehicle.vehicle.id` | Debe identificar un vehículo de forma única y estable durante toda la duración del viaje                                                                                                                                                                                                                                                    |

### Posición

La posición del vehículo debe estar dentro de los 200 metros de los datos GTFS `shapes.txt` para el viaje actual, a menos que haya una alerta con el efecto de `DETOUR` para este `trip_id`

### Alerta

Directrices generales para las alertas:

* Cuando `trip_id` y `start_time` están dentro del intervalo `exact_time=1`, `start_time` debe ser posterior al inicio del intervalo en un múltiplo exacto de `headway_secs`.
* Cuando se cancelen viajes durante varios días, los productores deben proporcionar TripUpdates que hagan referencia a los `trip_ids` y `start_dates` dados como `CANCELADOS`, así como una Alerta con `NO_SERVICE` que haga referencia a los mismos `trip_ids` y `TimeRange` que pueda mostrarse a los usuarios explicando la cancelación (por ejemplo, desvío).
* Si una alerta afecta a todas las paradas de una línea, utilice una alerta basada en la línea en lugar de una alerta basada en la parada. No aplique la alerta a todas las paradas de la línea.
* Aunque no hay límite de caracteres para las alertas de servicio, los usuarios del transporte público suelen ver las alertas en sus dispositivos móviles. Sea conciso.

| Nombre del campo   | Recomendación                                                                 |
| ------------------ | ----------------------------------------------------------------------------- |
| `description_text` | Utilice saltos de línea para que su alerta de servicio sea más fácil de leer. |

## Recomendaciones prácticas organizadas por caso de uso

### Viajes basados en la frecuencia

Un viaje basado en la frecuencia no sigue un Schedule fijo, sino que intenta mantener unas distancias predeterminadas. Estos viajes se indican en [GTFS.org/reference/static/#frequenciestxt">GTFS](<https://\<glossary variable=>) frequency.txt estableciendo `exact_times=0` u omitiendo el campo `exact_times` (tenga en cuenta que los viajes `con exact_times=1` *NO* son viajes basados en la frecuencia - `frequencies.txt` con `exact_times=1` se utiliza simplemente como método de conveniencia para almacenar los viajes Schedule el horario de una manera más compacta). Hay varias prácticas recomendadas que deben tenerse en cuenta al construir los suministros GTFS Realtime para los viajes basados en la frecuencia.

* En [TripUpdate.StopTimeUpdate](#StopTimeUpdate), el [StopTimeEvent](#StopTimeEvent) para la `llegada` y la `salida` no debe contener `retraso` porque los viajes basados en la frecuencia no siguen un Schedule fijo. En su lugar, se debe proporcionar la `hora` para indicar las predicciones de llegada/salida.

* Tal y como exige la especificación, cuando se describa el `viaje` en [TripUpdate](#TripUpdate) o [VehiclePosition](#VehiclePosition) utilizando [TripDescriptor](#TripDescriptor), deben proporcionarse todos los datos de `trip_id`, `start_time` y `start_date`. Además, `schedule_relationship` debe ser `UNSCHEDULED`.

(por ejemplo, viajes de refuerzo).

## Acerca de este documento

### Objetivos

Los objetivos de mantener las mejores prácticas de GTFS Realtime son:

* Mejorar la experiencia del usuario final en las aplicaciones de transporte público
* Facilitar a los desarrolladores de software el despliegue y la ampliación de aplicaciones, productos y servicios

### Cómo proponer o modificar las Mejores Prácticas GTFS Realtime Tiempo Real publicadas

Las aplicaciones y prácticasGTFS evolucionan, por lo que es posible que este documento deba modificarse de vez en cuando. Para proponer una enmienda a este documento, abra una solicitud de extracción [en el repositorio de GitHub](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) [GTFS](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) [GTFS](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) las mejores prácticas de [Realtime](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) [Realtime](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) real de GTFS y defienda el cambio.

### Enlaces a este documento

Enlazar aquí con el fin de proporcionar a los productores de piensos una orientación para la formación correcta de los datos de GTFS Realtime. Cada recomendación individual tiene un enlace de anclaje. Haga clic en la recomendación para obtener la URL del enlace de anclaje en la página.

Si una aplicación Realtime GTFS Realtime establece requisitos o recomendaciones para las prácticas de datos GTFS Realtime que no se describen aquí, se recomienda publicar un documento con esos requisitos o recomendaciones para complementar estas mejores prácticas comunes.
