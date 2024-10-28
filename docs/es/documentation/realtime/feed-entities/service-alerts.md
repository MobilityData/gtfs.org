# Alertas de servicio (Service Alerts)

 Las alertas de servicio le permiten proporcionar actualizaciones cada vez que hay una interrupción en la red. Los retrasos y cancelaciones de viajes individuales generalmente deben comunicarse mediante [Actualizaciones de viaje](../trip-updates). 
 
 Tiene la opción de proporcionar lo siguiente: 
 
 * URL: enlace a su sitio que explica más sobre la alerta 
 * Texto del encabezado: un resumen de la alerta 
 * Descripción: una descripción completa de la alerta, que siempre se mostrará junto al encabezado (por lo que no se debe repetir esta información). 
 
## TimeRange 
 
 La alerta se mostrará cuando corresponda dentro del rango de tiempo dado. Este rango debe cubrir todo el tiempo que la alerta sea útil para que el pasajero la vea. 
 
 Si no se da tiempo, mostraremos la alerta mientras esté en el feed. Si se proporcionan varios rangos, los mostraremos en todos ellos. 
 
## EntitySelector 
 
 El selector de entidades le permite especificar exactamente a qué partes de la red afecta esta alerta, de modo que podamos mostrar solo las alertas más adecuadas al usuario. Puede incluir varios selectores de entidades para alertas que afecten a varias entidades. 
 
 Las entidades se seleccionan utilizando sus identificadores GTFS y puede seleccionar cualquiera de las siguientes opciones: 
 
 * Agencia : afecta a toda la red 
 * Ruta: afecta a toda la ruta 
 * Tipo de ruta: afecta a cualquier ruta de este tipo.por ejemplo, todos los metros. 
 * Viaje: afecta a un viaje en particular 
 * Parada: afecta a una parada en particular 
 
 Puede incluir más de uno de los campos enumerados anteriormente en una `informed_entity`. Cuando se incluyen varios campos en una `informed_entity`, se deben interpretar como si estuvieran unidos por el operador lógico `AND`. En otras palabras, la alerta solo debe aplicarse en un contexto que cumpla con todos los campos proporcionados en una "`informed_entity`". Por ejemplo, si `route_id: "1"` y `stop_id: "5"` están incluidos en una `informed_entity`, entonces la alerta debe aplicarse solo a la ruta 1 en la parada 5. NO debe aplicarse a ninguna otra parada.en la ruta 1, y NO debe aplicarse a ninguna otra ruta en la parada 5. 
 
 Si desea representar una alerta que afecte a más de una entidad (por ejemplo, una alerta tanto para la ruta 1 como para la parada 5), debe agregar varias `informed_entity` a su `alert`, y cada una de ellas se aplica a la entidad afectada (por ejemplo, una `informed_entity` que incluye la ruta 1 y otra `informed_entity` que incluye la parada 5). 
 
## Causa 
 
 ¿Cuál es la causa de esta alerta? Puede especificar una de las siguientes: 
 
 * Causa desconocida 
 * Otra causa (no representada por ninguna de estas opciones) 
 * Problema técnico 
 * Huelga 
 * Manifestación 
 * Accidente 
 * Vacaciones 
 * Clima 
 * Mantenimiento 
 * Construcción 
 * Actividad policial 
 * Emergencia médica
 
## Efecto 
 
 ¿Qué efecto tiene este problema en la entidad especificada? Puede especificar uno de los siguientes: 
 
 * Sin servicio 
 * Servicio reducido 
 * Retrasos significativos (los retrasos insignificantes solo deben proporcionarse a través de [Actualizaciones de viaje](../trip-updates)). 
 * Desvío 
 * Servicio adicional 
 * Servicio modificado: Las operaciones son diferentes a las que el pasajero normalmente esperaría. Un ejemplo es una alerta que recuerda a los pasajeros sobre un próximo horario festivo diferente al servicio normal ese día de la semana. 
 * Parada movida 
 * Otro efecto (no representado por ninguna de estas opciones) 
 * Efecto desconocido 
 * Sin efecto: La alerta proporciona información a los pasajeros pero no afecta las operaciones. Los ejemplos incluyen anunciar reuniones públicas y solicitar comentarios a través de encuestas. 
 * Problema de Accesibilidad : La alerta proporciona información sobre problemas de accesibilidad que afectan el acceso sin pasos. Los ejemplos incluyen un ascensor fuera de servicio o rampas móviles. 
