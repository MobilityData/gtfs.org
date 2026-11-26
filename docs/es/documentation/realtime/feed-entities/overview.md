# Entidades de feed 

 GTFS Realtime admite cuatro tipos distintos de datos en tiempo real, que se pueden 
 combinar en un único feed en tiempo real. A continuación se proporcionan resúmenes, con la documentación completa de los 
 en la sección correspondiente. 
 
## Trip Updates

#### "El autobús X tiene un retraso de 5 minutos" 
 
 Las actualizaciones de viaje representan fluctuaciones en el horario. Esperamos recibir 
 actualizaciones de viajes para todos los viajes que haya programado y que sean compatibles con tiempo real. Estas actualizaciones de 
 proporcionarían una llegada o salida prevista para las paradas a lo largo de la ruta. 
 Las actualizaciones de viajes también pueden proporcionar escenarios más complejos en los que los viajes 
 se cancelan, se agregan al cronograma o incluso se redireccionan. 
 
 Los productores MUST garantizar que las actualizaciones de viaje estén al día y sean precisas en relación con la situación en tiempo real de la red de transporte público.

[Más sobre Actualizaciones de Viaje...](../trip-updates) 
 
## Service Alerts

#### "La estación Y está cerrada debido a obras" 
 
 Las alertas de servicio representan problemas de nivel superior con una entidad particular y generalmente tienen la forma de una descripción textual de la interrupción. 
 
 Podrían representar problemas con: 
 
 * Estaciones 
 * Líneas 
 * Toda la red 
 * etc. 
 
 Una alerta de servicio normalmente consistirá en algún texto que describirá el 
 problema, y ​​también permitimos URL para obtener más información, así como más 
 información estructurada para ayudarnos a comprender a quién afecta esta alerta de servicio. 
 
 
#### Uso de las actualizaciones de viaje y las alertas de servicio

Si los productores proporcionan tanto actualizaciones de viaje como alertas de servicio, los productores SHOULD poder actualizar sus alertas de servicio de forma independiente de sus TripUpdates. Estos dos feeds no deberían depender completamente uno del otro.  

Los productores MUST garantizar también que no haya conflictos entre sus feeds de actualizaciones de viaje y de alertas de servicio.  

Algunos ejemplos de conflictos son:

* Una alerta de servicio informa del cierre de una parada mientras que las actualizaciones de viaje para esa parada no están establecidas en `SKIPPED`.  
* Una alerta de servicio informa del cierre de una ruta mientras que las actualizaciones de viaje de los viajes cancelados no están establecidas en `CANCELED`.  
* Una ruta está cerrada durante todo el día. El feed de actualizaciones de viaje cancela todos los viajes de esta ruta durante los próximos 90 minutos. Sin embargo, no se configuró ninguna alerta para informar de que la ruta sigue cerrada después de esos 90 minutos.

Los consumidores de datos MUST utilizar tanto las actualizaciones de viaje como las alertas de servicio para tomar decisiones de enrutamiento, como cancelar un viaje o cerrar una parada. Cuando utilicen alertas de servicio para tomar decisiones de enrutamiento, los consumidores MUST utilizar únicamente las alertas cuyo efecto esté establecido en `NO_SERVICE`.

Dado que las alertas con `NO_SERVICE` se utilizan para tomar decisiones de enrutamiento, los productores deben asegurarse de especificar las entidades informadas más granulares posibles. Esto se hace para evitar cerrar más servicios de transporte público de los que realmente están afectados.

[Más sobre Alertas de Servicio...](../service-alerts) 
 
## Vehicle Positions

#### "Este autobús está en la posición X en el momento Y" 
 La posición del vehículo 
 representa algunos datos básicos sobre un vehículo 
 particular en la red. 
 
 Lo más importante es la latitud y longitud en la que se encuentra el vehículo, pero también podemos 
 utilizar datos sobre la velocidad actual y las lecturas del odómetro del vehículo. 
 
 [Más sobre actualizaciones de Position del Vehículo...](../vehicle-positions) 
 
## Trip Modifications

#### "Estos viajes se ven afectados por un desvío en determinados días" 
 
 Las modificaciones de viaje se utilizan para describir desvíos que afectan a un conjunto de viajes. 
 
 Una modificación de viaje puede cancelar ciertas paradas, ajustar el calendario de los viajes, 
 proporcionar una nueva forma que tomarán los viajes y proporcionar la ubicación de 
 paradas temporales a lo largo del camino. 
 
 [Más sobre modificaciones de viaje...](../trip-modifications) 
 
## Observación histórica sobre los tipos de feeds 
 
 Las primeras versiones de GTFS Realtime Especificación requerían que cada feed solo contuviera 
 un solo tipo de entidades. Una herramienta de ejemplo para convertir del esquema combinado al esquema de alimentación por tipo 
 se encuentra en Bliksem Labs [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py ) Repositorio de GitHub.