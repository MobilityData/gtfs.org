# Service Alerts

Las service alerts le permiten proporcionar actualizaciones siempre que haya interrupciones en la red. Por lo general, los retrasos y cancelaciones de viajes individuales deben comunicarse mediante [trip updates](trip-updates.md).

Tiene la opción de proporcionar lo siguiente

*   URL - enlace a su sitio web explicando más sobre la alerta
*   Header text - un resumen de la alerta
*   Description - una descripción completa de la alerta, que se mostrará siempre junto al encabezamiento (por lo que no deberá repetir esta información).

## TimeRange

La alerta se mostrará cuando proceda dentro del intervalo de tiempo indicado. Este intervalo debe abarcar todo el tiempo en que la alerta sea útil para el pasajero.

Si no se indica ninguna franja horaria, se mostrará la alerta mientras aparezca en el feed. Si se indican varios intervalos, se mostrará durante todos ellos.

## EntitySelector

El selector de entidad le permite especificar exactamente a qué partes de la red afecta esta alerta, de modo que podamos mostrar al usuario sólo las alertas más apropiadas. Puede incluir varios selectores de entidad para alertas que afecten a varias entidades.

Las entidades se seleccionan utilizando sus identificadores GTFS, y puede seleccionar cualquiera de las siguientes:

*   Agency - afecta a toda la red
*   Route - afecta a toda la ruta
*   Route type - afecta a cualquier ruta de este tipo. Por ejemplo, todos los metros.
*   Trip - afecta a un viaje concreto
*   Stop - afecta a una parada concreta

Puede incluir más de uno de los campos enumerados anteriormente en una `informed_entity`. Cuando se incluyen varios campos en una `informed_entity`, debe interpretarse que están unidos por el operador lógico `AND`. En otras palabras, la alerta sólo debe aplicarse en un contexto que reúna todos los campos proporcionados en una `informed_entity`. Por ejemplo, si `route_id:` `"1"` y `stop_id:` `"5"` están ambos incluidos en una `informed_entity`, entonces la alerta debe aplicarse sólo a la ruta 1 en la parada 5. NO debe aplicarse a ninguna otra parada de la ruta 1, y NO debe aplicarse a ninguna otra ruta en la parada 5.

Si desea representar una alerta que afecta a más de una entidad (por ejemplo, una alerta tanto para la ruta 1 como para la parada 5) , deberá añadir múltiples `informed_entity` a su `alert`, aplicándose cada una de ellas a la entidad afectada (por ejemplo, una `informed_entity` que incluya la ruta 1 y otra `informed_entity` que incluya la parada 5).

## Cause

¿Cuál es la causa de esta alerta? Puede especificar una de las siguientes:

*   Unknown cause
*   Other cause (no representada por ninguna de estas opciones)
*   Technical problem
*   Strike
*   Demonstration
*   Accident
*   Holiday
*   Weather
*   Maintenance
*   Construction
*   Police activity
*   Medical emergency

## Effect

¿Qué efecto tiene este problema en la entidad especificada? Puede especificar uno de los siguientes:

*   No service
*   Reduced service
*   Significant delays (los retrasos insignificantes sólo deben proporcionarse a través de [Trip updates](trip-updates.md)).
*   Detour
*   Additional service
*   Modified service: Las operaciones son diferentes de lo que el viajero esperaría normalmente. Un ejemplo es una alerta que recuerda a los usuarios que el horario de un próximo día festivo es diferente del servicio normal de ese día de la semana.
*   Stop moved
*   Other effect (no representado por ninguna de estas opciones)
*   Unknown effect
*   No effect: La alerta proporciona información a los usuarios, pero no afecta a las operaciones. Por ejemplo, anunciando reuniones públicas o solicitando opiniones mediante encuestas.
*   Accessibility issue: La alerta proporciona información sobre problemas de accesibilidad que afectan al acceso sin escalones. Por ejemplo, un ascensor fuera de servicio o rampas móviles.
