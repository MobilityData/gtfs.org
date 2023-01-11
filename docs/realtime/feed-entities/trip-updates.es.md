# Actualizaciones de trayecto

Las actualizaciones de viaje representan las fluctuaciones del horario. Es de esperar que se reciban actualizaciones de todos los viajes programados en tiempo real. Estas actualizaciones indican la hora prevista de llegada o salida de las paradas a lo largo de la ruta. Las actualizaciones de trayecto también pueden prever escenarios más complejos en los que los trayectos se cancelan o se añaden al horario, o incluso se desvían.

**Recordatorio:** En [GTFS](../../schedule/reference.md), un viaje es una secuencia de dos o más paradas que ocurren a una hora específica.

Debe haber **como máximo** una actualización de trayecto para cada trayecto programado. En caso de que no haya ninguna actualización de viaje para un viaje programado, se concluirá que no hay datos en tiempo real disponibles para el viaje. El consumidor de datos **no** debe suponer que el viaje se está realizando a tiempo.

Si un vehículo está sirviendo varios viajes dentro del mismo bloque (para más información sobre viajes y bloques, consulte [GTFS trips.txt](../../schedule/reference.md#tripstxt)):

*   el feed debe incluir un TripUpdate para el trip que está siendo servido por el vehicle. Se anima a los productores a incluir TripUpdates para uno o más viajes después del trip actual en el bloque de este vehicle si el productor confía en la calidad de las predicciones para estos trip futuros. La inclusión de múltiples TripUpdates para el mismo vehicle evita la aparición de predicciones para los pasajeros cuando el vehicle pasa de un trip a otro y también ofrece a los pasajeros un aviso anticipado de los retrasos que afectan a los viajes posteriores (por ejemplo, cuando el delay conocido supera los tiempos de escala previstos entre los viajes).
*   no se requiere que las entidades TripUpdate respectivas sean ADDED a la alimentación en el mismo orden en que están scheduled en el bloque. Por ejemplo, si hay viajes con `trip_ids` 1, 2 y 3 que pertenecen todos a un bloque, y el vehicle realiza el trip 1, luego trip 2 y luego el trip 3, las entidades `trip_update` pueden aparecer en cualquier orden - por ejemplo, se permite agregar el trip 2, luego el trip 1 y luego trip 3.

## StopTimeUpdate

Una actualización de viaje consiste en una o más actualizaciones de los tiempos de parada del vehículo, que se denominan [StopTimeUpdates](../reference.md#message-stoptimeupdate). Se pueden suministrar para tiempos de parada pasados y futuros. Está permitido, pero no es obligatorio, eliminar tiempos de parada pasados. Los productores no deben omitir un `StopTimeUpdate` pasado si se refiere a una parada con una hora de llegada programada en el futuro para el viaje dado (es decir, el vehículo ha pasado por la parada antes de lo previsto), ya que de lo contrario se concluirá que no hay actualización para esta parada.

Por ejemplo, si aparecen los siguientes datos en el feed GTFS-rt:

*   Parada 4 - Prevista a las 10:18am (programada a las 10:20am - 2 min antes)
*   Parada 5 - Prevista a las 10:30h (prevista a las 10:30h - puntual)

...la predicción para la Parada 4 no puede ser eliminada de la alimentación hasta las 10:21am, incluso si el autobús realmente pasa por la parada a las 10:18am. Si el `StopTimeUpdate` para la Parada 4 fue eliminado de la alimentación a las 10:18am o 10:19am, y la hora de llegada programada es 10:20am, entonces el consumidor debe asumir que no existe información en tiempo real para la Parada 4 en ese momento, y se deben utilizar los datos de horario de GTFS.

Cada [StopTimeUpdate](../reference.md#message-stoptimeupdate) se vincula a una parada. Normalmente, esto puede hacerse utilizando una stop_sequence GTFS o un stop_id GTFS. Sin embargo, en el caso de que esté proporcionando una actualización para un viaje sin un trip_id GTFS, debe especificar stop_id ya que stop_sequence no tiene valor. El stop_id debe seguir haciendo referencia a un stop_id en GTFS. Si el mismo stop_id es visitado más de una vez en un viaje, entonces stop_sequence debe ser proporcionado en todos los StopTimeUpdates para ese stop_id en ese viaje.

La actualización puede proporcionar una hora exacta de **llegada** y/o **salida** en una parada en [StopTimeUpdates](../reference.md#message-stoptimeupdate) utilizando [StopTimeEvent](../reference.md#message-stoptimeevent). Esto debe contener una **hora** absoluta o un **retraso** (es decir, un desplazamiento de la hora programada en segundos). El retraso sólo puede utilizarse en caso de que la actualización del viaje se refiera a un viaje GTFS programado, en contraposición a un viaje basado en la frecuencia. En este caso, el tiempo debe ser igual al tiempo programado + retraso. También puede especificar la **incertidumbre** de la predicción junto con [StopTimeEvent](../reference.md#message-stoptimeevent), que se trata con más detalle en la sección [Incertidumbre](#uncertainty) más adelante en la página.

Para cada [StopTimeUpdate](../reference.md#message-stoptimeupdate), se **programa** la relación de horario por defecto. (Tenga en cuenta que esto es diferente de la relación de programación para el viaje). Puede cambiarla a **omitida** si no se va a parar en la parada, o a **sin datos** si sólo tiene datos en tiempo real para parte del viaje.

**Las actualizaciones deben ordenarse por secuencia_parada** (o ID_parada en el orden en que aparecen en el viaje).

Si faltan una o más paradas a lo largo del viaje, el `delay` de la actualización (o, si sólo se proporciona la `time` en la actualización, un retraso calculado comparando la `time` con la hora del horario GTFS) se propaga a todas las paradas posteriores. Esto significa que la actualización de la hora de una parada determinada modificará todas las paradas posteriores en ausencia de cualquier otra información. Tenga en cuenta que las actualizaciones con una relación de horario de `SKIPPED` no detendrán la propagación del retraso, pero las actualizaciones con relaciones de horario de `SCHEDULED` (también el valor por defecto si no se proporciona la relación de horario) o `NO_DATA` sí lo harán.

**Ejemplo 1**

Para un viaje con 20 paradas, un [StopTimeUpdate](../reference.md#message-stoptimeupdate) con retraso de llegada y retraso de salida de 0[(StopTimeEvents](../reference.md#message-stoptimeevent)) para stop_sequence de la parada actual significa que el viaje está exactamente a tiempo.

**Ejemplo 2**

Para la misma instancia de viaje, se proporcionan tres [StopTimeUpdates](../reference.md#message-stoptimeupdate):

*   retardo de 300 segundos para stop_sequence 3
*   retardo de 60 segundos para stop_sequence 8
*   [ScheduleRelationship](../reference.md#enum-schedulerelationship) de `NO_DATA` para stop_sequence 10

Esto se interpretará como

*   stop_sequences 1,2 tienen retardo desconocido.
*   stop_sequences 3,4,5,6,7 tienen retardo de 300 segundos.
*   stop_sequences 8,9 tienen retardo de 60 segundos.
*   stop_sequences 10,..,20 tienen retraso desconocido.

## TripDescriptor

La información proporcionada por el TripDescriptor depende de la relación de horarios del viaje que esté actualizando. Hay una serie de opciones que puede configurar:

| _**Valor**_       | _**Comentario**_                                                                                                                                                                                                     |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Scheduled**    | Este viaje se está ejecutando de acuerdo con un horario GTFS, o está lo suficientemente cerca como para seguir asociado a él.                                                                                        |
| **Added**       | Este viaje no estaba programado y ha sido añadido. Por ejemplo, para hacer frente a la demanda o sustituir un vehículo averiado.                                                                                     |
| **Unscheduled** | Este viaje está en curso y nunca se ha asociado a un horario. Por ejemplo, si no hay horario y los autobuses circulan en un servicio de lanzadera.                                                                   |
| **Canceled**     | Este viaje estaba programado, pero se ha suprimido.                                                                                                                                                                  |
| **Duplicated**     | Este nuevo viaje es una copia de un viaje existente en GTFS estático excepto por la fecha y hora de inicio del servicio. El nuevo viaje se ejecutará en la fecha y hora de servicio especificadas en TripProperties. |

En la mayoría de los casos, deberá proporcionar el trip_id del viaje programado en GTFS al que se refiere esta actualización.

#### Sistemas con trip_ids repetidos

Para sistemas que utilizan trip_ids repetidos, por ejemplo viajes modelados utilizando frequencies.txt, es decir viajes basados en frecuencias, el trip_id no es en sí mismo un identificador único de un único viaje, ya que carece de un componente de tiempo específico. Para identificar unívocamente tales viajes dentro de unTripDescriptor, debe proporcionarse un triple de identificadores:

*   **trip_id**
*   **start_time**
*   **start_date**

start_time debe publicarse en primer lugar, y cualquier actualización posterior del feed debe utilizar esa misma start_time cuando se refiera al mismo viaje. StopTimeUpdate debe utilizarse para indicar ajustes; start_time no tiene por qué ser exactamente la hora de salida de la primera estación, aunque debe ser bastante cercana a esa hora.

Por ejemplo, digamos que decidimos a las 10:00, 25 de mayo de 2015, que un viaje con trip_id=T comenzará a start_time=10:10:00, y proporcionamos esta información en tiempo real a las 10:01. A las 10:05, de repente, sabemos que el viaje ha comenzado a las 10:00. A las 10:05 sabemos de repente que el viaje no comenzará a las 10:10, sino a las 10:13. En nuestro nuevo feed en tiempo real podemos seguir identificando este viaje como (T, 2015-05-25, 10:10:00) pero proporcionar una StopTimeUpdate con la salida de la primera parada a las 10:13:00.

#### Correspondencia de viajes alternativa

Los viajes que no se basan en la frecuencia también pueden identificarse de forma única mediante unTripDescriptor que incluya la combinación de:

*   **route_id**
*   **direction_id**
*   **start_time**
*   **start_date**

donde start_time es la hora de inicio programada tal y como se define en el horario estático, siempre que la combinación de ids proporcionada resuelva un viaje único.

## Incertidumbre

La incertidumbre se aplica tanto a la hora como al valor del retraso de un [StopTimeUpdate](../reference.md#message-stoptimeupdate). La incertidumbre especifica aproximadamente el error esperado en el retardo real como un número entero en segundos (pero tenga en cuenta que el significado estadístico preciso aún no está definido). Es posible que la incertidumbre sea 0, por ejemplo para trenes que se conducen bajo control de tiempo por ordenador.

Por ejemplo, un autobús de larga distancia que tenga un retraso estimado de 15 minutos y llegue a su próxima parada dentro de un margen de error de 4 minutos (es decir, +2 / -2 minutos) tendrá un valor de incertidumbre de 240.
