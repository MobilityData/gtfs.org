# Mejores prácticas de GTFS Realtime

## Introducción 
 
 Estas son prácticas recomendadas para describir información de transporte público en tiempo real en el formato de datos [GTFS Realtime](../reference). 
 
### Estructura del documento 
 
 Las prácticas Recomendado están organizadas en dos secciones principales 
 
 * __[Recomendaciones de prácticas organizadas por mensaje](#recomendaciones-de-practicas-organizadas-por-mensaje):__ Las recomendaciones se organizado por message y campo en el mismo orden descrito en la referencia oficial de GTFS Realtime. 
 * __[Recomendaciones de prácticas organizadas por caso](#recomendaciones-de-practicas-organizadas-por-caso):__ En casos particulares, como el servicio basado en frecuencia (frente al servicio basado en horarios), es posible que sea necesario se aplicará en varios mensajes y campos, así como en los datos de programación GTFS correspondientes. Estas recomendaciones se consolidan en esta sección. 
 
### Publicación de feeds y prácticas generales 
 
 * Los feeds deben publicarse en una URL pública y permanente 
 * La URL debe ser accesible directamente sin necesidad de iniciar sesión para acceder al feed. Si lo desea, se pueden utilizar claves API, pero el registro de las claves API debe estar automatizado y disponible para todos. 
 * Mantener identificadores persistentes (campos de identificación) dentro de un feed GTFS Realtime (por ejemplo, FeedEntity.id, VehicleDescriptor.id, CarriageDetails.id) en todas las iteraciones del feed. 
 * Las transmisiones GTFS Realtime deben actualizarse al menos una vez cada 30 segundos, o cada vez que cambie la información representada en la transmisión (posición de un vehículo), lo que sea más frecuente. VehiclePositions tienden a cambiar con más frecuencia que otras entidades de alimentación y deben actualizarse con la mayor frecuencia posible. Si el contenido no ha cambiado, el feed debe actualizarse con un nuevo `FeedHeader.timestamp` que refleje que la información sigue siendo relevante a partir de esa marca de tiempo. 
 * Los datos dentro de una transmisión GTFS Realtime no deben tener más de 90 segundos para actualizaciones de viaje y posiciones de vehículos y no más de 10 minutos para alertas de servicio. Por ejemplo, incluso si un productor actualiza continuamente la marca de tiempo `FeedHeader.timestamp` cada 30 segundos, la antigüedad de VehiclePositions dentro de esa fuente no debe ser mayor a 90 segundos. 
 * El servidor que aloja datos GTFS Realtime debe ser confiable y devolver consistentemente respuestas codificadas en protobuf con un formato válido. Menos del 1% de las respuestas deben ser inválidas (errores de protobuf o errores de recuperación). 
 * El servidor web que aloja los datos GTFS Realtime debe configurarse para informar correctamente la date de modificación del archivo (consulte HTTP/1.1- Solicitud de comentarios 2616, en la Sección 14.29) para que los consumidores puedan aprovechar el encabezado HTTP `If-Modified-Since`. Esto ahorra ancho de banda a productores y consumidores al evitar la transferencia de contenidos de feeds que no han cambiado. 
 * Los feeds deben proporcionar contenido de feed codificado en búfer de protocolo de forma predeterminada cuando se consulta a través de una solicitud HTTP en la URL determinada; los consumidores no deberían necesitar definir encabezados de aceptación HTTP especiales para recibir contenido codificado en búfer de protocolo. 
 * Debido a cómo los buffers de protocolo codifican [valores opcionales](https://developers.google.com/protocol-buffers/docs/proto#optional), antes de leer datos de un feed GTFS Realtime, los consumidores deben verificar la presencia de valores que utilizan los métodos `hasX()` generados en el búfer del protocolo antes de usar ese valor y solo deben usar el valor si `hasX()` es verdadero (donde `X` es el nombre del campo). Si `hasX()` devuelve `false`, se debe asumir el valor predeterminado para ese campo definido en el valor `gtfs-realtime.proto`. Si el consumidor usa el valor sin verificar primero el método `hasX()`, es posible que esté leyendo datos predeterminados que no fueron publicados intencionalmente por el productor. 
 * Los feeds deben utilizar HTTPS en lugar de HTTP (sin cifrado) para garantizar la integridad del feed. 
 * Los feeds deben cubrir la gran mayoría de los viajes incluidos en el conjunto de datos GTFS estático complementario. En particular, debería incluir datos sobre áreas urbanas de alta densidad y mucho tráfico y rutas transitadas. 

## Recomendaciones de prácticas organizadas por mensaje

### FeedHeader 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | `gtfs_realtime_version` | La versión actual es "2.0". Todos los feeds de GTFS Realtime deben ser "2.0" o superior, ya que la versión anterior de GTFS Realtime no requería todos los campos necesarios para representar diversas situaciones de tránsito de manera adecuada. | 
 | `timestamp` | Esta marca de tiempo no debe disminuir entre dos iteraciones de alimentación secuenciales. | 
 | | Este valor de marca de tiempo siempre debe cambiar si el contenido del feed cambia; el contenido del feed no debe cambiar sin actualizar el encabezado `timestamp`.<br><br> *Errores comunes*: si hay varias instancias de feed GTFS Realtime detrás de un balanceador de carga, es posible que cada instancia extraiga información de la fuente de datos en tiempo real y la publique a los consumidores ligeramente desincronizada. Si un consumidor de GTFS Realtime realiza dos solicitudes consecutivas y cada solicitud es atendida por una instancia de feed de GTFS Realtime diferente, el mismo contenido del feed podría devolverse al consumidor con diferentes marcas de tiempo.<br><br> *Posible solución*: los productores deben proporcionar un encabezado HTTP "`Last-Modified`" y los consumidores deben pasar su encabezado HTTP "`If-Modified-Since`" más reciente para evitar recibir datos obsoletos.<br><br> *Posible solución*: si no se pueden utilizar encabezados HTTP, se pueden utilizar opciones como sesiones fijas para garantizar que cada consumidor se enrute al mismo servidor productor. | 
 
### FeedEntity 
 
 Todas las entidades solo deben eliminarse de un feed GTFS Realtime cuando ya no sean relevantes para los usuarios. Los feeds se consideran sin estado, lo que significa que cada feed refleja todo el estado en tiempo real del sistema de tránsito. Si una entidad se proporciona en una instancia de feed pero se elimina en una actualización de feed posterior, se debe asumir que no hay información en tiempo real para esa entidad. 

 | Nombre del campo | Recomendación | 
 |---|---| 
 | `id` | Debe mantenerse estable durante todo el viaje | 
 
### TripUpdate 
 
 Pautas generales para cancelaciones de viajes: 
 
 * Al cancelar viajes durante varios días, los productores deben proporcionar TripUpdates que hagan referencia a los `trip_ids` y `start_dates` dados como `CANCELED` así como una alerta con "`NO_SERVICE`" que hace referencia a los mismos "`trip_ids`" y "`TimeRange`" que se puede mostrar a los pasajeros explicando la cancelación (por ejemplo, desvío). 
 * Si no se visitarán paradas en un viaje, el viaje debe ser `CANCELED` en lugar de tener todas las `stop_time_updates` marcadas como `SKIPPED`. 

 | Nombre del campo | Recomendación | 
 |---|---| 
 | `trip` | Consulte [message TripDescriptor](#tripdescriptor). | 
 | | Si se proporcionan feeds `VehiclePosition` y `TripUpdate` separados, el emparejamiento de los valores de ID de [TripDescriptor](#tripdescriptor) y [VehicleDescriptor](#vehicledescriptor) debe coincidir entre los dos feeds.<br><br> Por ejemplo, una entidad `VehiclePosition` tiene `vehicle_id:A` y `trip_id:4`, entonces la entidad `TripUpdate` correspondiente también debería tener `vehicle_id:A` y `trip_id:4`. Si alguna entidad `TripUpdate` tiene `trip_id:4` y cualquier `vehicle_id` distinto de 4, esto es un error. | 
 | `vehicle` | Consulte [message VehicleDescriptor](#vehicledescriptor). | 
 | | Si se proporcionan feeds `VehiclePosition` y `TripUpdate` separados, el emparejamiento de los valores de ID de [TripDescriptor](#tripdescriptor) y [VehicleDescriptor](#vehicledescriptor) debe coincidir entre los dos feeds.<br><br> Por ejemplo, una entidad `VehiclePosition` tiene `vehicle_id:A` y `trip_id:4`, entonces la entidad `TripUpdate` correspondiente también debería tener `vehicle_id:A` y `trip_id:4`. Si alguna entidad `TripUpdate` tiene `trip_id:4` y cualquier `vehicle_id` distinto de 4, esto es un error. | 
 | `stop_time_update` | `stop_time_updates` para un `trip_id` determinado debe ordenarse estrictamente aumentando `stop_sequence` y no se debe repetir ningún `stop_sequence`. | 
 | | Mientras el viaje está en curso, todas las "`TripUpdates`" deben incluir al menos una "`stop_time_update`" con una hora prevista de llegada o salida en el futuro. Tenga en cuenta que la [especificación GTFS Realtime](../feed_entities/trip-updates/#stoptimeupdate) dice que los productores no deben descartar una `StopTimeUpdate` pasada si se refiere a una parada con una hora de llegada programada en el futuro para el viaje determinado. (es decir, el vehículo ha pasado la parada antes de lo previsto), ya que en caso contrario se concluirá que no hay actualización para esta parada. | 
 | `timestamp` | Debe reflejar la hora en que se actualizó esta predicción para este viaje. | 
 | `delay` | `TripUpdate.delay` debe representar la desviación del cronograma, es decir, el valor pasado observado de qué tan adelantado o atrasado está el vehículo con respecto al cronograma. Las predicciones para futuras paradas deben proporcionarse a través de `StopTimeEvent.delay` o `StopTimeEvent.time`. | 
 
### TripDescriptor 
 
 Si se proporcionan feeds separados `VehiclePosition` y `TripUpdate`, el emparejamiento de los valores de ID de [TripDescriptor](#tripdescriptor) y [VehicleDescriptor](#vehicledescriptor) debe coincidir entre los dos feeds. 
 
 Por ejemplo, una entidad `VehiclePosition` tiene `vehicle_id:A` y `trip_id:4`, entonces la entidad `TripUpdate` correspondiente también debe tener `vehicle_id:A` y `trip_id:4`. 

 | Nombre del campo | Recomendación | 
 |---|---| 
 | `schedule_relationship` | El comportamiento de los viajes "`ADDED`" no está especificado y no se recomienda el uso de esta enumeración. | 
 
 
### VehicleDescriptor 
 
 Si se proporcionan feeds separados de `VehiclePosition` y `TripUpdate`, el emparejamiento de valores de ID de [TripDescriptor](#tripdescriptor) y [VehicleDescriptor](#vehicledescriptor) debe coincidir entre los dos feeds. 
 
 Por ejemplo, una entidad `VehiclePosition` tiene `vehicle_id:A` y `trip_id:4`, entonces la entidad `TripUpdate` correspondiente también debe tener `vehicle_id:A` y `trip_id:4`. 

 | Nombre del campo | Recomendación | 
 |---|---| 
 | `id` | Debe identificar de forma única y estable un vehículo durante toda la duración del viaje | 
 
### StopTimeUpdate 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | `stop_sequence` | Proporcione `stop_sequence` siempre que sea posible, ya que se resuelve inequívocamente en una hora de parada GTFS en `stop_times.txt` a diferencia de `stop_id`, que puede ocurrir más de una vez en un viaje (por ejemplo, ruta circular). | 
 | `arrival` | Los tiempos de llegada entre paradas secuenciales deberían aumentar; no deberían ser iguales ni disminuir. | 
 | | La "`time`" de llegada (especificada en [StopTimeEvent](#stoptimeevent)) debe ser anterior a la "`time`" de salida para la misma parada si se espera una escala o un tiempo de permanencia; de lo contrario, la "`time`" de llegada debe ser la misma que la "`time`" de salida. | 
 | `departure` | Los tiempos de salida entre paradas secuenciales deberían aumentar, no deberían ser iguales ni disminuir. | 
 | | La "`time`" de salida (especificada en [StopTimeEvent](#stoptimeevent)) debe ser la misma que la "`time`" de llegada para la misma parada si no se espera ninguna escala o tiempo de permanencia; de lo contrario, la "`time`" de salida debe ser posterior a la "`time`" de llegada. | 
 
### StopTimeEvent 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | `delay` | Si solo se proporciona `delay` (y no `time`) en un `stop_time_update` `arrival` o `departure`, entonces el GTFS [`stop_times.txt`](../../schedule/reference/#stop_timestxt) debe contener `arrival_times` y/o `departure_times` para estas paradas correspondientes. Un valor de "`delay`" en el feed en tiempo real no tiene sentido a menos que tenga una hora de reloj para agregarlo en el archivo GTFS "`stop_times.txt`". | 
 
### VehiclePosition 
 
 A continuación se detallan los campos recomendados que deben incluirse en un feed de VehiclePostions para proporcionar a los consumidores datos de alta calidad (por ejemplo, para generar predicciones) 
 
 | Nombre del campo | Notas | 
 |---|---| 
 | `entity.id` | Debe mantenerse estable durante todo el viaje 
 | `vehicle.timestamp` | Se recomienda encarecidamente proporcionar la marca de tiempo en la que se midió la posición del vehículo. De lo contrario, los consumidores deben utilizar la marca de tiempo del message, lo que puede tener resultados engañosos para los pasajeros cuando el último message se actualizó con más frecuencia que la posición individual. 
 | `vehicle.vehicle.id` | Debe identificar de forma única y estable un vehículo durante toda la duración del viaje | 
 
### Position 
 
 La posición del vehículo debe estar dentro de los 200 metros de los datos `shapes.txt` de GTFS para el viaje actual, a menos que haya una alerta con el efecto de `DETOUR` para este `trip_id`. 
 
### Alerta 
 
 Pautas generales para alertas: 
 
 * Cuando `trip_id` y `start_time` están dentro del intervalo `exact_time=1`, `start_time` debe ser posterior al inicio del intervalo por un múltiplo exacto de `headway_secs`. 
 * Al cancelar viajes durante varios días, los productores deben proporcionar TripUpdates que hagan referencia a los `trip_ids` y `start_dates` dados como `CANCELED`, así como una alerta con `NO_SERVICE` que haga referencia a los mismos `trip_ids` y `TimeRange` que se puede mostrar a los pasajeros explicando la cancelación (por ejemplo, desvío). 
 * Si una alerta afecta a todas las paradas de una línea, utilice una alerta basada en línea en lugar de una alerta basada en paradas. No aplique la alerta en cada parada de la línea. 
 * Si bien no hay límite de caracteres para las alertas de servicio, los usuarios de transporte público a menudo verán las alertas en dispositivos móviles. Por favor sea conciso. 

 | Nombre del campo | Recomendación | 
 |---|---| 
 | `description_text` | Utilice saltos de línea para que su alerta de servicio sea más fácil de leer. | 
 
## Recomendaciones de prácticas organizadas por caso

### Viajes basados ​​en frecuencia 
 
 Un viaje basado en frecuencia no sigue un horario fijo sino que intenta mantener intervalos predeterminados. Estos viajes se indican en [frequencies.txt](../../schedule/reference/#frequenciestxt) configurando `exact_times=0` u omitiendo el campo `exact_times` (tenga en cuenta que los viajes `exact_times=1` son * NO* viajes basados ​​en frecuencia: `frequencies.txt` con `exact_times=1` se usa simplemente como un método conveniente para almacenar viajes basados ​​en horarios de una manera más compacta). Hay varias prácticas recomendadas que se deben tener en cuenta al crear feeds GTFS Realtime para viajes basados ​​en frecuencia. 
 
 * En [TripUpdate.StopTimeUpdate](#stoptimeupdate), el [StopTimeEvent](#stoptimeevent) para `arrival` y `departure` no debe contener `delay` porque los viajes basados ​​en frecuencia no siguen un horario fijo. En su lugar, se debe proporcionar "`time`" para indicar las predicciones de llegada/salida. 
 
 * Según lo requiere la especificación, al describir `trip` en [TripUpdate](#tripupdate) o [VehiclePosition](#vehicleposition) usando [TripDescriptor](#tripdescriptor), todos los `trip_id`, `start_time` y `start_date` se deben proporcionar. Además, `schedule_relationship` debe ser `UNSCHEDULED`. 
 (por ejemplo, viajes de refuerzo). 
 
 
## Acerca de este documento

### Objetivos 
 
 Los objetivos de mantener las mejores prácticas de GTFS Realtime son: 
 
 * Mejorar la experiencia del cliente final en aplicaciones de transporte público 
 * Facilitar a los desarrolladores de software la implementación y escalamiento de aplicaciones, productos y servicios
 
### Cómo proponer o modificar las mejores prácticas en GTFS Realtime publicadas 
 
 Las aplicaciones y prácticas de GTFS evolucionan, por lo que este documento puede deben modificarse de vez en cuando. Para proponer una enmienda a este documento, abra una solicitud de extracción [en el repositorio de GitHub de mejores prácticas en GTFS Realtime](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) y abogue por el cambio. 
 
### Enlace a este documento 
 
 Enlace aquí para proporcionar a los productores de piensos orientación para la formación correcta de datos GTFS Realtime. Cada recomendación individual tiene un enlace de anclaje. Haga clic en la recomendación para obtener la URL del enlace de anclaje en la página. 
 
 Si una aplicación que consume GTFS Realtime presenta requisitos o recomendaciones para las prácticas de datos de GTFS Realtime que no se describen aquí, se recomienda publicar un documento con esos requisitos o recomendaciones para complementar estas mejores prácticas comunes. 
 
 
