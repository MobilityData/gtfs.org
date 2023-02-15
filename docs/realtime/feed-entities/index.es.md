# Entidades de alimentación

GTFS Realtime admite tres tipos distintos de datos en tiempo real, que pueden combinarse en un único feed en tiempo real. A continuación se ofrecen resúmenes, con la documentación completa en la sección correspondiente.

## Trip Updates

#### "El autobús X se retrasa 5 minutos"

Las trip updates representan las fluctuaciones del horario. Esperamos recibir actualizaciones de todos los viajes programados en tiempo real. Trip updates también pueden prever situaciones más complejas en las que los trayectos se cancelan, se añaden al horario o incluso se desvían.

[Más información sobre Trip Updates...](trip-updates.md)

## Service Alerts

#### "La estación Y está cerrada por obras"

Service alerts representan problemas de alto nivel con una entidad en particular y generalmente tienen la forma de una descripción textual de la interrupción.

Pueden representar problemas con

*   Estaciones
*   Líneas
*   Toda la red
*   etc.

Una service alert constará normalmente de un texto que describirá el problema, y también permitimos URLs para obtener más información, así como información más estructurada para ayudarnos a entender a quién afecta esta alerta de servicio.

[Más información sobre Service Alerts...](service-alerts.md)

## Vehicle Positions

#### "Este autobús se encuentra en la posición X a la hora Y"

La vehicle position representa una serie de datos básicos sobre un vehículo concreto en la red.

Los más importantes son la latitud y la longitud del vehículo, pero también podemos obtener datos sobre la velocidad actual y las lecturas del cuentakilómetros del vehículo.

[Más información sobre actualizaciones de Vehicle Positions...](vehicle-positions.md)

## Observación histórica sobre los tipos de alimentación

Las primeras versiones de la Especificación en GTFS Realtime requerían que cada feed contuviera sólo un tipo de entidades. En el repositorio GitHub [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py) de Bliksem Labs se encuentra una herramienta de ejemplo para convertir el esquema fusionado al esquema de fuentes por tipo.
