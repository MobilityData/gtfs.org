# Actualizaciones de viaje (Trip Updates)
 
 Las actualizaciones de viaje representan fluctuaciones en el horario. Esperamos recibir actualizaciones de viajes para todos los viajes que haya programado y que sean compatibles con tiempo real. Estas actualizaciones proporcionarían una hora prevista de llegada o salida para las paradas a lo largo de la ruta. Las actualizaciones de viajes también pueden proporcionar escenarios más complejos en los que los viajes se cancelan o se agregan al cronograma, o incluso se redireccionan. 
 
 **Recordatorio:** En [GTFS](../../../schedule/reference), un viaje es una secuencia de dos o más paradas que ocurren en un momento específico. 
 
 Debe haber **como máximo** una actualización de viaje por cada viaje programado. En caso de que no exista actualización de viaje para un viaje programado, se concluirá que no hay datos en tiempo real disponibles para el viaje. El consumidor de datos **no** debe asumir que el viaje se realiza a tiempo. 
 
 Si un vehículo realiza múltiples viajes dentro del mismo bloque (para obtener más información sobre viajes y bloques, consulte [GTFS trips.txt](../../../schedule/reference/#tripstxt) ): 
 
 * el feed debe incluir una TripUpdate para el viaje que actualmente realiza el vehículo. Se anima a los productores a incluir TripUpdates para uno o más viajes después del viaje actual en el bloque de este vehículo si el productor confía en la calidad de las predicciones para estos viajes futuros. Incluir múltiples TripUpdates para el mismo vehículo evita la predicción "pop-in" para los pasajeros a medida que el vehículo pasa de un viaje a otro y también les avisa con anticipación sobre los retrasos que afectan los viajes posteriores (por ejemplo, cuando el retraso conocido excede los tiempos de escala planificados entre viajes).
 * No es necesario agregar las respectivas entidades TripUpdate al feed en el mismo orden en que están programadas en el bloque. Por ejemplo, si hay viajes con `trip_ids` 1, 2 y 3 que pertenecen todos a un bloque, y el vehículo recorre el viaje 1, luego el viaje 2 y luego el viaje 3, las entidades `trip_update` pueden aparecer en cualquier orden. - por ejemplo, se permite agregar el viaje 2, luego el viaje 1 y luego el viaje 3. 
 
## StopTimeUpdate 
 
 Una actualización de viaje consta de una o más actualizaciones de los horarios de parada del vehículo, que se denominan [StopTimeUpdates](../../reference/#message-stoptimeupdate). Estos pueden suministrarse para horarios de parada pasados ​​y futuros. Se le permite, pero no es obligatorio, pasar de los horarios de parada. Los productores no deben eliminar un `StopTimeUpdate` pasado si se refiere a una parada con una hora de llegada programada en el futuro para el viaje dado (es decir, el vehículo ha pasado la parada antes de lo previsto), ya que de lo contrario se concluirá que no hay actualización para esta parada. 
 
 Por ejemplo, si los siguientes datos aparecen en el feed GTFS-rt: 
 
 * Parada 4: prevista para las 10:18 a.m. (programada para las 10:20 a.m., 2 minutos antes) 
 * Parada 5: prevista a las 10:30 a.m. (programado a las 10:30 a.m. – puntual) 
 
...la predicción para la parada 4 no se puede eliminar del feed hasta las 10:21 a.m., incluso si el autobús realmente pasa la parada a las 10:18 a.m. Si "`StopTimeUpdate`" para la parada 4 se eliminó del feed a las 10:18 a.m.o a las 10:19 a.m., y la hora de llegada programada es a las 10:20 a.m., entonces el consumidor debe asumir que no existe información en tiempo real para la parada 4 en ese momento., y se deben utilizar datos de programación de GTFS. 
 
 Cada [StopTimeUpdate](../../reference/#message-stoptimeupdate) está vinculado a una parada. Normalmente, esto se puede hacer utilizando GTFS stop_sequence o GTFS stop_id. Sin embargo, en el caso de que proporciones una actualización para un viaje sin un trip_id GTFS, debes especificar stop_id ya que stop_sequence no tiene valor. El stop_id aún debe hacer referencia a un stop_id en GTFS. Si se visita el mismo stop_id más de una vez en un viaje, entonces se debe proporcionar stop_sequence en todas las StopTimeUpdates para ese stop_id en ese viaje. 
 
 La actualización puede proporcionar una hora exacta para **arrival** y/o **departure** en una parada en [StopTimeUpdates](../../reference/#message-stoptimeupdate) usando [StopTimeEvent](../../reference/#message-stoptimeevent). Esto debe contener un **time** absoluto o un **delay** (es decir, un desplazamiento del tiempo programado en segundos). El retraso solo se puede utilizar en caso de que la actualización del viaje se refiera a un viaje GTFS programado, en lugar de un viaje basado en frecuencia. En este caso, el tiempo debe ser igual al tiempo programado + retraso. También puede especificar la **uncertainty** de la predicción junto con [StopTimeEvent](../../reference/#message-stoptimeevent), que se analiza con más detalle en la sección [Incertidumbre](#incertidumbre) más abajo página. 
 
 Para cada [StopTimeUpdate](../../reference/#message-stoptimeupdate), la relación de programación predeterminada es **programada**. (Tenga en cuenta que esto es diferente de la relación de programación del viaje). Puede cambiar esto a **omitido** si no se detendrá la parada, o **sin datos** si solo tiene datos en tiempo real para parte del viaje. 
 
 **Las actualizaciones deben ordenarse por stop_sequence** (o stop_ids en el orden en que ocurren en el viaje). 
 
 Si faltan una o más paradas a lo largo del viaje, el "`delay`" de la actualización (o, si solo se proporciona "`time`" en la actualización, un retraso calculado comparando el "`time`" con el tiempo programado GTFS) se propaga a todas las paradas posteriores. Esto significa que actualizar la hora de una parada determinada cambiará todas las paradas posteriores en ausencia de cualquier otra información. Tenga en cuenta que las actualizaciones con una relación de programación de "`SKIPPED`" no detendrán la propagación del retraso, pero las actualizaciones con relaciones de programación de "`SCHEDULED`" (también el valor predeterminado si no se proporciona la relación de programación) o "`NO_DATA`" sí lo harán. 
 
 **Ejemplo 1** 
 
 Para un viaje con 20 paradas, un [StopTimeUpdate](../../reference/#message-stoptimeupdate) con un retraso de llegada y un retraso de salida de 0 ([StopTimeEvents](../../reference/#message-stoptimeevent)) para stop_sequence de la parada actual significa que el viaje llega exactamente a tiempo. 
 
 **Ejemplo 2** 
 
 Para la misma instancia de viaje, se proporcionan tres [StopTimeUpdates](../../reference/#message-stoptimeupdate): 
 
 * retraso de 300 segundos para stop_sequence 3 
 * retraso de 60 segundos para stop_sequence 8 
 * [ScheduleRelationship](../../reference/#enum-schedulerelationship) de `NO_DATA` para stop_sequence 10 
 
 Esto se interpretará como: 
 
 * stop_sequences 1,2 tienen un retraso desconocido. 
 * stop_sequences 3,4,5,6,7 tienen un retraso de 300 segundos. 
 * stop_sequences 8,9 tienen un retraso de 60 segundos. 
 * stop_sequences 10,..,20 tienen un retraso desconocido. 
 
## TripDescriptor 
 
 La información proporcionada por el TripDescriptor depende de la relación de programación del viaje que esté actualizando. Hay varias opciones que puede configurar: 
 
 |_**Valor**_|_**Comentario**_| 
 |-----------|-------------| 
 | **Scheduled** | Este viaje se realiza según un cronograma GTFS o está lo suficientemente cerca como para seguir asociado a él. | 
 | **Added** | Este viaje no estaba programado y se ha agregado. Por ejemplo, para hacer frente a la demanda o sustituir un vehículo averiado. | 
 | **Unscheduled** | Este viaje está en ejecución y nunca está asociado con un cronograma. Por ejemplo, si no hay horario y los autobuses funcionan con un servicio de lanzadera. | 
 | **Canceled** | Este viaje estaba programado, pero ahora se eliminó. | 
 | **Duplicated** | Este nuevo viaje es una copia de un viaje existente en GTFS estático, excepto la date y hora de inicio del servicio. El nuevo viaje se ejecutará en la date y hora del servicio especificadas en TripProperties. | 
 
 En la mayoría de los casos, debes proporcionar el trip_id del viaje programado en GTFS al que se refiere esta actualización. 
 
#### Sistemas con trip_ids repetidos 
 
 Para sistemas que utilizan trip_ids repetidos, por ejemplo viajes modelados utilizando frequencies.txt, es decir, viajes basados ​​en frecuencia, trip_id no es en sí mismo un identificador único de un único viaje, ya que carece de un componente temporal específico 
. Para identificar de forma única dichos viajes dentro de un 
 TripDescriptor, se debe proporcionar un triple de identificadores: 
 
 * __trip_id__ 
 * __start_time__ 
 * __start_date__ 
 
 start_time debe publicarse primero, y cualquier actualización posterior del feed debe publicarse debe usar 
 esa misma hora de inicio cuando se refiere al mismo viaje. StopTimeUpdates 
 debe usarse para indicar ajustes; start_time no tiene que ser exactamente 
 la hora de salida desde la primera estación, aunque debería ser bastante cercana a 
 esa hora. 
 
 Por ejemplo, digamos que decidimos a las 10:00 del 25 de mayo de 2015 que un viaje con 
 trip_id=T comenzará a las 10:10:00 y proporcionamos esta información a través de 
 feed en tiempo real.a las 10:01. A las 10:05 de repente sabemos que el viaje no comenzará a las 10:10 sino a las 10:13. En nuestro nuevo feed en tiempo real todavía podemos identificar este viaje 
 como (T, 2015-05-25, 10:10:00) pero proporcionar una StopTimeUpdate con salida de la primera parada de 
 a las 10:13:00. 
 
#### Coincidencia de viaje alternativo 
 
 Los Viajes que no se basan en la frecuencia también pueden identificarse de forma única mediante un 
 TripDescriptor que incluye la combinación de: 
 
 * __route_id__ 
 * __direction_id__ 
 * __start_time__ 
 * __start_date__ 
 
 donde start_time es la hora de inicio programada según lo definido en el programa estático, siempre y cuando la combinación de identificadores proporcionados resuelva un viaje único. 
 
 
## Incertidumbre 
 
 La incertidumbre se aplica tanto al tiempo como al valor de retraso de un [StopTimeUpdate](../../reference/#message-stoptimeupdate). La incertidumbre especifica aproximadamente el error esperado en el retraso verdadero como un número entero en segundos (pero tenga en cuenta que el significado estadístico preciso aún no está definido). Es posible que la incertidumbre sea 0, por ejemplo, para trenes que circulan bajo control de sincronización por computadora. 
 
 Como ejemplo, un autobús de larga distancia que tiene un retraso estimado de 15 minutos al llegar a su siguiente parada dentro de una ventana de error de 4 minutos (es decir, +2/-2 minutos) tendrá un valor de incertidumbre de 240. 
