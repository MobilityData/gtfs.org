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
 
* **Causa desconocida**: Se utiliza cuando la causa de la interrupción no se conoce o no se ha determinado. Debe evitarse si se puede identificar razonablemente una causa más específica.
* **Otra causa**: Se utiliza para causas que no están representadas por ninguna de las opciones predefinidas.
* **Problema técnico**: Problemas relacionados con el mal funcionamiento de vehículos o de la infraestructura. Los ejemplos incluyen fallas mecánicas y errores en los sistemas de información.
* **Huelga**: Interrupciones del servicio causadas por una huelga laboral que involucra a la agencia de transporte o al operador.
* **Manifestación**: Interrupciones del servicio causadas por una manifestación, protesta o concentración pública.
* **Accidente**: Incidentes como colisiones o descarrilamientos que interrumpen los servicios.
* **Vacaciones**: Cualquier día festivo que pueda provocar un cambio en el servicio.
* **Clima**: Interrupciones causadas por condiciones meteorológicas como nieve, tormentas, inundaciones, etc.
* **Mantenimiento**: Mantenimiento planificado relacionado con los servicios. Los ejemplos incluyen el mantenimiento de vías, de ascensores y de vehículos.
* **Construcción**: Cualquier obra de construcción que afecte al servicio, independientemente de si está relacionada con los servicios o no. Los ejemplos incluyen la construcción de estaciones y las obras viales que afectan a las rutas de autobús.
* **Actividad policial**: Interrupciones debidas a actividades de las fuerzas del orden o a incidentes de seguridad. Los ejemplos incluyen investigaciones o amenazas de seguridad.
* **Emergencia médica**: Incidentes que involucran emergencias médicas de pasajeros o del personal. Los ejemplos incluyen un problema médico a bordo que obliga a detener un tren.
* **Evento especial**: Un evento especial único o recurrente, como un desfile, un festival, un espectáculo, un mercado de agricultores o un evento deportivo.
 
## Efecto 
 
 ¿Qué efecto tiene este problema en la entidad especificada? Puede especificar uno de los siguientes: 
 
* **Sin servicio**: No hay servicio de transporte para las entidades especificadas.
  * Para las agencias, ninguna de las rutas de la agencia está en funcionamiento.
  * Para las rutas, no se realizará ninguno de los viajes de la ruta.
  * Para los viajes, esos viajes específicos se cancelan.
  * Para las estaciones (`location_type` = 1) o paradas (`location_type` = 0), el pasajero no podrá subir ni bajar.
* **Servicio reducido**: Se reduce el número o la frecuencia de los viajes.
* **Retrasos significativos**: La ruta circulará con retraso de forma constante (los retrasos insignificantes solo deben proporcionarse a través de [Actualizaciones de viaje](trip-updates.md)).
* **Desvío**: La ruta cambia su trazado, lo que puede afectar la subida o bajada en algunas paradas.
* **Servicio adicional**: Se aumenta el número o la frecuencia de los viajes. Por ejemplo, circulan más autobuses para cubrir un evento especial.
* **Servicio modificado**: Las operaciones son diferentes a las que el pasajero normalmente esperaría. Un ejemplo es una alerta que recuerda a los pasajeros sobre un próximo horario festivo diferente al servicio normal ese día de la semana.
* **Parada movida**: La ubicación de una parada cambia de forma temporal o permanente (si se sabe que es permanente, asegúrese de que la nueva ubicación se refleje en los datos de horarios).
* **Otro efecto**: No está representado por ninguna de estas opciones.
* **Efecto desconocido**: Se utiliza para alertas cuyo efecto aún no se ha identificado. No utilice “Efecto desconocido” si el efecto de la alerta se conoce o se puede deducir del encabezado o de la descripción de la alerta.
* **Sin efecto**: La alerta proporciona información a los pasajeros pero no afecta las operaciones. Los ejemplos incluyen anunciar reuniones públicas y solicitar comentarios a través de encuestas. A menos que sea necesario, se recomienda no utilizar este efecto.
* **Problema de Accesibilidad**: La alerta proporciona información sobre problemas de accesibilidad que afectan el acceso sin escalones. Los ejemplos incluyen un ascensor fuera de servicio o rampas móviles, un autobús que no puede inclinarse (arrodillarse) o un servicio excepcional con trenes que tienen una gran separación respecto al andén.
