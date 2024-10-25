# Modificaciones de viaje (Trip Modifications)

 Un message `TripModifications` identifica una lista de `trip_ids` similares del GTFS (CSV) que se ven afectados por modificaciones particulares, como un desvío. 
 
<br><br> **Precaución:**esta entidad aún es **experimental** y está sujeta a cambios. Es posible que se adopte formalmente en el futuro. 
 
## SLO: Objetivo de nivel de servicio 
 
 Se espera que la frecuencia de las actualizaciones de datos sea aproximadamente cada hora (~24 veces/día). El tiempo de ingestión puede depender del número total de viajes afectados. Se espera que los consumidores ingieran una única TripModification en 5 minutos y un feed con cientos de desvíos en 20 minutos. 
 
## TripModifications 
 
 Las `TripModifications` están vigentes en todos los servicios\_fechas enumerados, hasta que se eliminen del feed. En cualquier date de servicio determinada, un viaje NO DEBE asignarse a más de un objeto "`TripModifications`". 
 
 PUEDE haber múltiples `TripModifications` para un patrón de parada determinado. Puede ser conveniente dividir los viajes en múltiples modificaciones, por ejemplo, si el "retraso_modificación_propagada" cambia significativamente en el transcurso del desvío. 
 
 Los viajes creados a través de GTFS- TripModifications modifican y reemplazan cada `trip_id` especificado, y no crean una copia o recorrido adicional. Las modificaciones se aplican sobre la información del cronograma, como si se modificara un GTFS (CSV) estático. 
 
 Los horarios de parada programados de cada viaje de reemplazo se crean a partir de los del viaje afectado, realizando los cambios enumerados en modificaciones. `stop_sequence` para todos los horarios de parada se reemplazan por un nuevo valor de 1 a n an, comenzando con 1 en el primer stop_time y aumentando en 1 para cada parada en el viaje. Se debe proporcionar un message "`TripUpdate`" para publicar los horarios de llegada/salida en tiempo real para el viaje de reemplazo. 
 
 
## Enlace a TripUpdates 
 
 * DEBERÍA proporcionar un TripUpdate utilizando un `ModifiedTripSelector` dentro del `TripDescriptor` de TripUpdate. 
 * Cuando TripUpdate se refiere al viaje de reemplazo, el consumidor debe comportarse como si el GTFS estático hubiera sido modificado con las TripModifications (por ejemplo, `arrival_time`, `departure_time`, `stop_sequence`, `stop_id` en paradas de reemplazo). 
 * Al proporcionar un `ModifiedTripSelector`, los demás campos del `TripDescriptor` DEBE dejarse vacíos, para evitar confusión por parte de los consumidores que no buscan el valor de `ModifiedTripSelector`. 
 * Los feeds de TripUpdate que proporcionan actualizaciones con `ModifiedTripSelector` DEBERÍA incluir también un TripUpdate dirigido a clientes que no admiten TripModifications. En otras palabras, debería haber dos TripUpdates: una para clientes con viajes modificados (con `TripModifications`) y otra para clientes con el GTFS original sin modificar (sin `TripModifications`). 
 * Proporcionar un TripUpdate con un `ModifiedTripSelector` es la única forma de crear predicciones en paradas de reemplazo. 
 * Si no se encuentra ninguna TripUpdate, las TripUpdates para el `trip_id` original se aplicarán al viaje modificado. 
 * En este caso, la información GTFS estática utilizada debe ser del GTFS estático antes de aplicar cualquier TripModifications. 
 * Puede estar disponible información en tiempo real de las paradas comunes entre el viaje anterior y el nuevo viaje modificado; sin embargo, no habrá ETA disponible en las paradas de reemplazo. 
 
## Modification 
 
 Un message de `Modification` describe los cambios en cada viaje afectado comenzando en `start_stop_selector`. Puede haber cero, uno o más de un tiempo de parada reemplazado por una ` Modification`. Los tramos de las modificaciones no DEBE superponerse. Los tramos pueden no ser contiguos; en este caso las dos modificaciones DEBE fusionarse en una. Estos horarios de parada se reemplazan con un nuevo tiempo de parada para cada parada de reemplazo descrita en `replacement_stops`. 
 
 La secuencia de `paradas_de_reemplazo` puede tener una longitud arbitraria. Por ejemplo, 3 paradas podrían reemplazarse por 2, 4 o 0 paradas, según lo requiera la situación. 
 
 ![](/../assets/trip_modification.png) 
 
 _Un ejemplo que muestra el efecto de una modificación en un viaje en particular. Esta modificación también se puede aplicar a varios otros viajes._ 
 
 ![](/../assets/propagated_delay.png) 
 
 _Los retrasos de desvío propagados afectan a todas las paradas posteriores al final de una modificación. Si un viaje tiene múltiples modificaciones, los retrasos se acumulan._ 
 
## ReplacementStop 
 
 Cada message `ReplacementStop` define una parada que ahora será visitada por el viaje y, opcionalmente, especifica el tiempo de viaje estimado hasta el detener. El message `ReplacementStop` se utiliza para construir el `stop_time` programado para la parada. 
 
 Cuando se especifica `travel_time_to_stop`, el `arrival_time` se calcula a partir de una parada de referencia en el viaje original, más el desplazamiento en `travel_time_to_stop`. De lo contrario, el `arrival_time` se puede interpolar en función de la duración total de la modificación en el viaje original. 
 
 La `departure_time` siempre es igual a la `arrival_time`. 
 
 Los campos opcionales de [`stop_times.txt`](../../../schedule/reference/#stop_timestxt) en la especificación GTFS (CSV) están todos configurados en sus valores predeterminados. 
 
 ![](/../assets/first_stop_reference.png) 
 
 _Si una modificación afecta a la primera parada del viaje, esa parada también sirve como parada de referencia de la modificación._ 
