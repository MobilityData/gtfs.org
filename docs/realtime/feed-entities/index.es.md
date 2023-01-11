# Entidades de alimentación

GTFS Realtime admite tres tipos distintos de datos en tiempo real, que pueden combinarse en un único feed en tiempo real. A continuación se ofrecen resúmenes, con la documentación completa en la sección correspondiente.

## Actualizaciones de trayecto

#### "El autobús X se retrasa 5 minutos"

Las actualizaciones de trayecto representan las fluctuaciones del horario. Esperamos recibir actualizaciones de todos los viajes programados en tiempo real. Las actualizaciones de trayecto también pueden prever situaciones más complejas en las que los trayectos se cancelan, se añaden al horario o incluso se desvían.

[Más información sobre actualizaciones de viaje...](trip-updates.md)

## Alertas de servicio

#### "La estación Y está cerrada por obras"

Las alertas de servicio representan problemas de alto nivel con una entidad en particular y generalmente tienen la forma de una descripción textual de la interrupción.

Pueden representar problemas con

*   Estaciones
*   Líneas
*   Toda la red
*   etc.

Una alerta de servicio constará normalmente de un texto que describirá el problema, y también permitimos URLs para obtener más información, así como información más estructurada para ayudarnos a entender a quién afecta esta alerta de servicio.

[Más información sobre alertas de servicio...](service-alerts.md)

## Posición del vehículo

#### "Este autobús se encuentra en la posición X a la hora Y"

La posición de un vehículo representa una serie de datos básicos sobre un vehículo concreto en la red.

Los más importantes son la latitud y la longitud del vehículo, pero también podemos obtener datos sobre la velocidad actual y las lecturas del cuentakilómetros del vehículo.

[Más información sobre actualizaciones de posición de vehículos...](vehicle-positions.md)

## Observación histórica sobre los tipos de alimentación

Las primeras versiones de la Especificación en Tiempo Real GTFS requerían que cada feed contuviera sólo un tipo de entidades. En el repositorio GitHub [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py) de Bliksem Labs se encuentra una herramienta de ejemplo para convertir el esquema fusionado al esquema de fuentes por tipo.
