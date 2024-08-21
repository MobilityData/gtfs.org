# Mejores prácticas de GTFS Schedule 
 
 Estas son prácticas recomendadas para describir los servicios de transporte público en la [General Transit Feed Specification (GTFS)](../reference). Estas prácticas se han sintetizado a partir de la experiencia de los miembros del [grupo de trabajo de Mejores Prácticas GTFS](#grupo-de-trabajo-de-mejores-practicas-del-gtfs) y de las [recomendaciones de prácticas GTFS específicas de la aplicación](http://www.transitwiki.org/TransitWiki/index.php/Best_practices_for_creating_GTFS). 
 
 Para obtener más información, consulte las [Preguntas frecuentes](#preguntas-frecuentes-faq). 
 
## Estructura del documento 
 
 Las prácticas se organizan en cuatro secciones principales: 
 
 * __[Publicación de conjuntos de datos y prácticas generales](#publicacion-de-conjuntos-de-datos-y-practicas-generales):__ Estas prácticas se relacionan con estructura general del conjunto de datos GTFS y a la manera en que se publican los conjuntos de datos GTFS. 
 * __[Recomendaciones de prácticas organizadas por archivo](#recomendaciones-de-practicas-organizadas-por-archivo):__ Las recomendaciones están organizadas por archivo y campo en el GTFS para facilitar el mapeo de las prácticas con la referencia oficial del GTFS. 
 * __[Recomendaciones de prácticas organizadas por caso](#recomendaciones-practicas-organizadas-por-caso):__ En casos particulares, como rutas de bucle, es posible que sea necesario aplicar prácticas en varios archivos y campos. Estas recomendaciones se consolidan en esta sección. 
 
## Publicación de conjuntos de datos y prácticas generales 
 
 * Los conjuntos de datos deben publicarse en una URL pública y permanente, incluido el nombre del archivo zip. (por ejemplo, www.agency.org/gtfs/gtfs.zip). Idealmente, la URL debería poder descargarse directamente sin necesidad de iniciar sesión para acceder al archivo, para facilitar la descarga mediante el consumo de aplicaciones de software. Si bien se recomienda (y es la práctica más común) hacer que un conjunto de datos GTFS se pueda descargar abiertamente, si un proveedor de datos necesita controlar el acceso a GTFS por motivos de licencia u otros motivos, se recomienda controlar el acceso al conjunto de datos GTFS mediante claves API. lo que facilitará las descargas automáticas. 
 * Los datos GTFS se publican en iteraciones para que un único archivo en una ubicación estable siempre contenga la descripción oficial más reciente del servicio para una agencia (o agencias) de tránsito. 
 * Mantener identificadores persistentes (campos de identificación) para `stop_id`, `route_id` y `agency_id` en todas las iteraciones de datos siempre que sea posible. 
 * Un conjunto de datos GTFS debe contener el servicio actual y el próximo (a veces denominado conjunto de datos "fusionado"). La [función de combinación](https://github.com/google/transitfeed/wiki/Merge) se puede utilizar para crear un conjunto de datos combinados a partir de dos feeds GTFS diferentes. 
    * En cualquier momento, el conjunto de datos GTFS publicado debe ser válido durante al menos los próximos 7 días e, idealmente, mientras el operador confíe en que el horario seguirá funcionando. 
    * Si es posible, el conjunto de datos GTFS debe cubrir al menos los próximos 30 días de servicio. 
 * Eliminar servicios antiguos (calendarios caducados) del feed. 
 * Si una modificación del servicio entrará en vigor en 7 días o menos, exprese este cambio de servicio a través de un feed [GTFS-realtime](../../realtime/reference) (avisos de servicio o actualizaciones de viaje) en lugar de estático Conjunto de datos GTFS. 
 * El servidor web que aloja los datos GTFS debe configurarse para informar correctamente la date de modificación del archivo (consulte [HTTP/1.1- Solicitud de comentarios 2616](https://tools.ietf.org/html/rfc2616#section-14.29 ), en virtud del artículo 14.29). 
 
## Recomendaciones de prácticas organizadas por archivo 
 
 Esta sección muestra prácticas organizadas por archivo y campo, alineadas con la [referencia GTFS](../reference). 
 
### Todos los archivos 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | Caso Mixto | Todas las cadenas de texto orientadas al cliente (incluidos nombres de paradas, nombres de rutas y letreros) deben usar mayúsculas y minúsculas (no TODO EN MAYÚSCULAS), siguiendo las convenciones locales para el uso de mayúsculas en nombres de lugares en pantallas capaces de mostrar caracteres en minúscula. | 
 | | Ejemplos: | 
 | | Plaza Churchill de Brighton | 
 | | Villiers-sur-Marne | 
 | | Calle del mercado | 
 | Abreviaturas | Evite el uso de abreviaturas en todo el feed para nombres y otros textos (por ejemplo, St.para Calle) a menos que una ubicación se llame por su nombre abreviado (por ejemplo, “Aeropuerto JFK”). Las abreviaturas pueden resultar problemáticas para la accesibilidad mediante software lector de pantalla e interfaces de usuario de voz. Se puede diseñar software de consumo para convertir de forma fiable palabras completas en abreviaturas para su visualización, pero la conversión de abreviaturas a palabras completas conlleva un mayor riesgo de error. | 
 
### agency.txt 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | `agency_phone` | Debe incluirse a menos que no exista dicho teléfono de atención al cliente. | 
 | `agency_email` | Debe incluirse a menos que no exista dicho correo electrónico de servicio al cliente. | 
 | `agency_fare_url` | Debe incluirse a menos que la agencia sea totalmente gratuita. | 
 
 __Ejemplos:__ 
 
 - Los servicios de autobús están a cargo de varias pequeñas agencias de autobuses. Pero hay una gran agencia que es responsable de la programación y emisión de billetes y, desde la perspectiva del usuario, responsable de los servicios de autobús. La única gran agencia debe definirse como agencia dentro del feed. Incluso si los datos se dividen internamente entre diferentes operadores de autobuses pequeños, solo debería haber una agencia definida en el feed. 
 
 - El proveedor de alimentación gestiona el portal de venta de entradas, pero existen diferentes agencias que realmente operan los servicios y que los usuarios conocen como responsables. Las agencias que realmente operan los servicios deben definirse como agencias dentro del feed. 
 
### stops.txt 
 
| Nombre del campo | Recomendación | 
|---|---| 
| `stop_name` | Cuando no haya un nombre de parada publicado, siga convenciones consistentes de nomenclatura de paradas en todo el feed. | | 
| | De forma predeterminada, `stop_name` no debe contener palabras genéricas o redundantes como "Estación" o "Parada", pero se permiten algunos casos extremos.<ul><li> Cuando en realidad es parte del nombre (Union Station, Central Station<li> Cuando el `stop_name` es demasiado genérico (por ejemplo, si es el nombre de la ciudad). “Estación”, “Terminal” u otras palabras aclaran el significado.</ul> | 
| `stop_lat` y `stop_lon` | Las ubicaciones de las paradas deben ser lo más precisas posible. Las ubicaciones de las paradas deben tener un error de __no más__ de cuatro metros en comparación con la posición de parada real. | 
| | Las ubicaciones de las paradas deben ubicarse muy cerca del derecho de paso de los peatones donde abordará un pasajero (es decir, del lado correcto de la calle). | 
| | Si la ubicación de una parada se comparte entre fuentes de datos separadas (es decir, dos agencias usan exactamente la misma parada/instalación de embarque), indique que la parada se comparte usando exactamente el mismo `stop_lat` y `stop_lon` para ambas paradas. | 
| `parent_station` y `location_type` | Muchas estaciones o terminales tienen múltiples instalaciones de embarque (según el modo, pueden denominarse bahía de autobuses, plataforma, muelle, puerta u otro término). En tales casos, los productores de piensos deben describir las estaciones, las instalaciones de alojamiento (también llamadas paradas para niños) y su relación.<ul><li> La estación o terminal debe definirse como un registro en `stops.txt` con `location_type = 1`.</li><li> Cada instalación de embarque debe definirse como una parada con `location_type = 0`. El campo "`parent_station`" debe hacer referencia al "`stop_id`" de la estación en la que se encuentra el centro de embarque.</li></ul> | 
| | Al nombrar la estación y las paradas infantiles, establezca nombres que los pasajeros reconozcan bien y que puedan ayudarlos a identificar la estación y las instalaciones de embarque (bahía de autobuses, andén, muelle, puerta, etc.). <table class='example'><thead><tr><th>Nombre de la Parent Station</th><th> Nombre de Child Stop</th></tr></thead><tbody><tr><td>Chicago Union Station</td><td>Chicago Union Station Platform 19</td></tr><tr><td>San Francisco Ferry Building Terminal</td><td>San Francisco Ferry Building Terminal Gate E</td></tr><tr><td>Downtown Transit Center</td><td>Downtown Transit Center Bay B</td></tr></tbody></table> |
 
### routes.txt 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | `route_long_name` | La definición de la referencia de especificación: <q>este nombre es generalmente más descriptivo que <code>route_short_name</code> y a menudo incluirá el destino o la parada de la ruta. Se debe especificar al menos uno de <code>route_short_name</code> o <code>route_long_name</code>, o potencialmente ambos, si corresponde. Si la ruta no tiene un nombre largo, especifique un <code>route_short_name</code> y utilice una string vacía como valor para este campo.</q><br> A continuación se muestran ejemplos de tipos de nombres largos:<table class='example'><thead><tr><th colspan='3'>Primary Travel Path or Corridor</th></tr><tr><th>Nombre de Ruta</th><th>Forma</th><th>Agencia</th></tr></thead><tbody><tr><td><a href='https://www.sfmta.com/getting-around/transit/routes-stops/n-judah'>“N”/“Judah”</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='https://www.sfmta.com/'>Muni</a>, en San Francisco</td></tr><tr><td><a href='https://trimet.org/schedules/r006.htm'>“6“/“ML King Jr Blvd“</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='https://trimet.org/'>TriMet</a>, en Portland, Or.</td></tr><tr><td><a href='http://www.ratp.fr/informer/pdf/orienter/f_plan.php?nompdf=m6'>“6”/“Nation - Étoile”</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='http://www.ratp.fr/'>RATP</a>, en Paris France.</td></tr><tr><td><a href='http://www.bvg.de/images/content/linienverlaeufe/LinienverlaufU2.pdf'>“U2”-“Pankow – Ruhleben”</a></td><td><code>route_short_name</code>-<br><code>route_long_name</code></td><td><a href='http://www.bvg.de/'>BVG</a>, en Berlin, Germany</td></tr></tbody></table><table class='example'><thead><tr><th>Descripción del servicio</th></tr></thead><tbody><tr><td><a href='https://128bc.org/schedules/rev-bus-hartwell-area/'>“Hartwell Area Shuttle“</a></td></tr></tbody></table>  
 | | `route_long_name` no debe contener `route_short_name`. | 
 | | Incluya la designación completa, incluida una identidad de servicio, al completar `route_long_name`. Ejemplos:<table class='example'><thead><tr><th>Identidad del servicio</th><th>Recomendación</th><th>Ejemplos</th></tr></thead><tbody><tr><td>"MAX Light Rail"<br>TriMet, en Portland, Oregon</td><td>El `route_long_name` debe incluir la marca (MAX) y la designación de ruta específica.</td><td>"MAX Red Line" "MAX Blue Line"</td></tr><tr><td>"Rapid Ride"<br>ABQ Ride, en Albuquerque, New Mexico</td><td>El `route_long_name` debe incluir la marca (Rapid Ride) y la designación de la ruta específica</td><td>"Rapid Ride Red Line"<br>"Rapid Ride Blue Line"</td></tr></tbody></table>
 | `route_id` | Todos los viajes en una ruta determinada deben hacer referencia al mismo `route_id`.<li> Las diferentes direcciones de una ruta no deben separarse en diferentes valores de "`route_id`" .</li><li> Los diferentes tramos de operación de una ruta no deben separarse en diferentes valores de `route_id`. es decir, no cree registros diferentes en `routes.txt` para los servicios “Downtown AM” y “Downtown PM”).</li> | 
 | | Si un grupo de rutas incluye ramas con nombres distintos (por ejemplo, 1A y 1B), siga las recomendaciones en el caso de ruta [rama](#ramas) para determinar `route_short_name` y `route_long_name`. | 
 | `route_color` y `route_text_color` | Debe ser coherente con la señalización y la información del cliente impresa y en línea (y, por tanto, no incluirse si no existen en otros lugares). | 
 
### trips.txt 
 
 * __Ver caso especial para rutas circulares:__ Las rutas circulares son casos en los que los viajes comienzan y terminan en la misma parada, a diferencia de las rutas lineales, que tienen dos terminales distintos. Las rutas circulares deben describirse siguiendo prácticas específicas. [Ver caso de rutas circulares.](#rutas-circulares) 
 * __Ver caso especial para rutas en lazo:__ Las rutas en bucle son un híbrido de geometrías lineales y en bucle, en las que los vehículos viajan en un bucle solo durante una parte de la ruta. Las rutas de lazo deben describirse siguiendo prácticas específicas. [Ver caso de ruta lazo.](#rutas-lazo) 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | `trip_headsign` | No proporcione nombres de rutas (que coincidan con `route_short_name` y `route_long_name`) en los campos `trip_headsign` o `stop_headsign`. | 
 | | Debe contener destino, dirección y/u otro texto de designación de viaje que se muestra en el letrero del vehículo y que puede usarse para distinguir entre viajes en una ruta. La coherencia con la información de dirección que se muestra en el vehículo es el objetivo principal y primordial para determinar las señales de cabeza proporcionadas en los conjuntos de datos GTFS. Sólo se debe incluir otra información si no compromete este objetivo principal. Si los letreros cambian durante un viaje, anule `trip_headsign` con `stop_times.stop_headsign`. A continuación se presentan recomendaciones para algunos casos posibles: | 
 | |<table class="example"><thead><tr><th> Descripción de la ruta</th><th> Recomendación</th></tr></thead><tbody><tr><td> 2A. Solo destino</td><td> Proporcione el destino final.por ejemplo, "Centro de tránsito", "Centro de la ciudad de Portland" o "Playa Jantzen"></td></tr><tr><td> 2B. Destinos con waypoints</td><td> &lt;destino> vía &lt;waypoint> “Highgate vía Charing Cross”. Si los puntos de referencia se eliminan de la visualización de señales de cabeza para los pasajeros después de que el vehículo pase esos puntos de ruta, use <code>stop_times.stop_headsign</code> para configurar una señal de cabeza actualizada.></td></tr><tr><td> 2C. Nombre del lugar regional con paradas locales</td><td> Si habrá varias paradas dentro de la ciudad o distrito de destino, use <code>stop_times.stop_headsign</code> una vez que llegue a la ciudad de destino.></td></tr><tr><td> 2D. Sólo dirección</td><td> Indique el uso de términos como “Hacia el norte”, “Entrante”, “En el sentido de las agujas del reloj” o direcciones similares.></td></tr><tr><td> 2E. Dirección con destino</td><td> &lt;dirección> a &lt;nombre de la terminal>, por ejemplo, “en dirección sur a San José”></td></tr><tr><td> 2F. Dirección con destino y waypoints.</td><td> &lt;dirección> vía &lt;waypoint> hasta &lt;destino> (“En dirección norte vía Charing Cross hasta Highgate”).></td></tr></tbody></table> | 
 | | No comience un letrero con las palabras "Para" o "Hacia". | 
 | `direction_id` | Utilice los valores 0 y 1 de forma coherente en todo el conjunto de datos.es decir<ul><li> Si 1 = Saliente por la ruta Roja, entonces 1 = Saliente por la ruta Verde</li><li> Si 1 = Hacia el norte en la Ruta X, entonces 1 = Hacia el norte en la Ruta Y</li><li> Si 1 = en el sentido de las agujas del reloj en la Ruta X, entonces 1 = en el sentido de las agujas del reloj en la Ruta Y</li></ul> | 
 | `bikes_allowed` | Para los viajes en ferry, sea explícito acerca de si se permiten (o no) las bicicletas, ya que evitar los viajes en ferry debido a la falta de datos generalmente genera grandes desvíos. | 
 
### stop_times.txt 
 
 Rutas circulares: las rutas circulares requieren consideraciones especiales sobre `stop_times`. (Ver: [Caso de ruta de bucle](#rutas-circulares)) 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | `pickup_type` y `drop_off_type` | Los viajes sin ingresos (sin salida) que no brindan servicio de pasajeros deben marcarse con el valor `pickup_type` y `drop_off_type` de `1` para todas las filas de `stop_times`. 
 | | En viajes de ingresos, los “puntos de sincronización” internos para monitorear el desempeño operativo y otros lugares, como garajes donde un pasajero no puede abordar, deben marcarse con `pickup_type = 1` (no hay recogida disponible) y `drop_off_type = 1` (no hay entrega disponible). | 
 | `arrival_time` y `departure_time` | Los campos `arrival_time` y `departure_time` deben especificar valores de tiempo siempre que sea posible, incluidos tiempos estimados o interpolados no vinculantes entre puntos de tiempo. | 
 | `stop_headsign` | En general, los valores de las señales de cabeza también deben corresponder a las señales de las estaciones.<br><br> En los casos siguientes, “en dirección sur” engañaría a los clientes porque no se utiliza en las señales de la estación. 
 | |<table class="example"><thead><tr><th colspan="2"> En Nueva York, para los 2 que van hacia el sur:</th></tr><tr><th> Para filas <code>stop_times.txt</code> :</th><th> Utilice el valor <code>stop_headsign</code> :</th></tr></thead><tbody><tr><td> Hasta llegar a Manhattan</td><td> <code>Manhattan &amp; Brooklyn</code></td></tr><tr><td> Hasta llegar al centro</td><td> <code>Downtown &amp; Brooklyn</code></td></tr><tr><td> Hasta llegar a Brooklyn</td><td> <code>Brooklyn</code></td></tr><tr><td> Una vez que se llega a Brooklyn</td><td> <code>Brooklyn (New Lots Av)</code></td></tr></tbody></table> | 
 | |<table class="example"><thead><tr><th colspan="2"> En Boston, para la Línea Roja en dirección sur, para el ramal Braintree:</th></tr><tr><th> Para filas <code>stop_times.txt</code> :</th><th> Utilice el valor <code>stop_headsign</code> :</th></tr></thead><tbody><tr><td> Hasta llegar al centro</td><td> <code>Inbound to Braintree</code></td></tr><tr><td> Una vez que se llega al centro</td><td> <code>Braintree</code></td></tr><tr><td> Después del centro</td><td> <code>Outbound to Braintree</code></td></tr></tbody></table> | 
 
### calendar.txt 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | Todos los campos | Incluir un campo `calendar.service_name` también puede aumentar la legibilidad humana de GTFS, aunque esto no está adoptado en la especificación. | 
 
### calendar_dates.txt 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | Todos los campos | Incluir un campo `calendar.service_name` también puede aumentar la legibilidad humana de GTFS, aunque esto no está adoptado en la especificación.| 
 
### fare_attributes.txt 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | | Si no se puede modelar con precisión un sistema de tarifas, evite mayores confusiones y déjelo en blanco. | 
 | | Incluya tarifas (`fare_attributes.txt` y `fare_rules.txt`) y modele con la mayor precisión posible. En casos extremos en los que las tarifas no se pueden modelar con precisión, la tarifa debe representarse como más cara en lugar de menos costosa para que los clientes no intenten abordar con una tarifa insuficiente. Si la gran mayoría de las tarifas no se pueden modelar correctamente, no incluya información de tarifas en el feed. | 
 
### fare_rules.txt 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | Todos los campos | Si no se puede modelar con precisión un sistema de tarifas, evite mayores confusiones y déjelo en blanco. | 
 | | Incluya tarifas (`fare_attributes.txt` y `fare_rules.txt`) y modele con la mayor precisión posible. En casos extremos en los que las tarifas no se pueden modelar con precisión, la tarifa debe representarse como más cara en lugar de menos costosa para que los clientes no intenten abordar con una tarifa insuficiente. Si la gran mayoría de las tarifas no se pueden modelar correctamente, no incluya información de tarifas en el feed. | 
 
### shapes.txt 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | Todos los campos | Idealmente, para alineaciones que son compartidas (es decir, en el caso en que las Rutas 1 y 2 operan en el mismo segmento de carretera o vía), entonces la parte compartida de la alineación debería coincidir exactamente. Esto ayuda a facilitar la cartografía de tránsito de alta calidad.<!-- (77) --> 
 | | Las alineaciones deben seguir la línea central del derecho de vía por el que circula el vehículo. Esta podría ser la línea central de la calle si no hay carriles designados, o la línea central del lado de la carretera que viaja en la dirección en que se mueve el vehículo.<br><br> Las alineaciones no deben “desviarse” hacia una parada en la acera, una plataforma o un lugar de embarque. | 
 | `shape_dist_traveled` | El campo `shape_dist_traveled` permite a la agencia especificar exactamente cómo las paradas en el archivo `stop_times.txt` encajan en su forma respectiva. Un valor común para usar en el campo `shape_dist_traveled` es la distancia desde el principio de la forma recorrida por el vehículo (piense en algo así como la lectura de un odómetro).<li> Las alineaciones de ruta (en `shapes.txt`) deben estar dentro de los 100 metros de las paradas a las que sirve un viaje.</li><li> Simplifique las alineaciones para que <code>shapes.txt</code> no contenga puntos extraños (es decir, elimine puntos adicionales en segmentos de línea recta; consulte la discusión sobre el problema de simplificación de líneas).</li> 
 
### frequencies.txt 
 
 | Nombre del campo | Recomendación | 
 |---|---| 
 | Todos los campos | Los horarios de parada reales se ignoran para los viajes a los que hace referencia `frequencies.txt`; sólo los intervalos de tiempo de viaje entre paradas son significativos para los viajes basados ​​en la frecuencia. Para mayor claridad y legibilidad humana, se recomienda que la primera hora de parada de un viaje al que se hace referencia en `frequencies.txt` comience a las 00:00:00 (primer valor de `arrival_time` de 00:00:00). | 
 | `block_id` | Se puede proporcionar para viajes basados ​​en frecuencia. | 
 
### transfers.txt 
 
 `transfers.transfer_type` puede ser uno de los cuatro valores [definidos en el GTFS](../reference/#transferstxt). Estas definiciones de "`transfer_type`" se citan de la Especificación GTFS a continuación, _en cursiva_, con recomendaciones prácticas adicionales. 

 | Nombre del campo | Recomendación | 
 |---|---| 
 | `transfer_type` | <q>0 o (vacío): Este es un punto de transferencia recomendado entre rutas.</q><br> Si hay múltiples oportunidades de transferencia que incluyen una opción superior (es decir, un centro de tránsito con servicios adicionales o una estación con plataformas/plataformas de embarque adyacentes o conectadas), especifique un punto de transferencia recomendado. | 
 | | <q>1: Este es un punto de transferencia cronometrado entre dos rutas. Se espera que el vehículo que sale espere al que llega, con tiempo suficiente para que un pasajero haga transbordo entre rutas.</q><br> Este tipo de transferencia anula un intervalo requerido para realizar transferencias de manera confiable. Por ejemplo, Google Maps supone que los pasajeros necesitan 3 minutos para realizar un transbordo de forma segura. Otras aplicaciones pueden asumir otros valores predeterminados. | 
 | | <q>2: Este traslado requiere un tiempo mínimo entre la llegada y la salida para garantizar una conexión. El tiempo necesario para la transferencia se especifica en <code>min_transfer_time</code> .</q><br> Especifique el tiempo mínimo de traslado si hay obstrucciones u otros factores que aumentan el tiempo de viaje entre paradas. | 
 | | <q>3: Los Transferencias entre rutas no son posibles en esta ubicación.</q><br> Especifique este valor si los traslados no son posibles debido a barreras físicas, o si se vuelven inseguros o complicados por cruces de carreteras difíciles o espacios en la red peatonal. | 
 | | Si se permiten transferencias en el asiento (en bloque) entre viajes, entonces la última parada del viaje de llegada debe ser la misma que la primera parada del viaje de salida. | 
 
 
## Recomendaciones prácticas organizadas por caso 
 
 Esta sección cubre casos particulares con implicaciones en todos los archivos y campos. 
 
### Rutas circulares 
 
 En las rutas circulares, los viajes de los vehículos comienzan y terminan en el mismo lugar (a veces, un centro de tránsito o transferencia). Los vehículos suelen funcionar de forma continua y permiten que los pasajeros permanezcan a bordo mientras el vehículo continúa su recorrido. 
 
 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/loop-route.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;"> 
 
 Por lo tanto, deben aplicarse las recomendaciones Cartel de destino para mostrar a los conductores la dirección en la que circula el vehículo. 
 
 Para indicar el cambio de dirección de viaje, proporcione `stop_headsigns` en el archivo `stop_times.txt`. `stop_headsign` describe la dirección de los viajes que salen de la parada para la que está definido. Agregar `stop_headsigns` a cada parada de un viaje le permite cambiar la información de las señales de cabeza a lo largo del viaje. 
 
 No defina un único viaje circular en el archivo stop_times.txt para una ruta que opera entre dos puntos finales (como cuando el mismo autobús va y viene). En su lugar, divida el viaje en dos direcciones de viaje separadas. 
 
 __Ejemplos de modelado de viajes circulares:__ 
 
 - Viaje circular con letrero cambiante para cada parada 
 
 | trip_id | hora_llegada | hora_salida | parada_id | stop_sequence | stop_headsign | 
 |---------|--------------|----------------|---------|---------------|---------------| 
 | viaje_1 | 06:10:00 | 06:10:00 | parada_A | 1 | "B" | 
 | viaje_1 | 06:15:00 | 06:15:00 | parada_B | 2 | "C" | 
 | viaje_1 | 06:20:00 | 06:20:00 | parada_C | 3 | "D" | 
 | viaje_1 | 06:25:00 | 06:25:00 | parada_D | 4 | "E" | 
 | viaje_1 | 06:30:00 | 06:30:00 | parada_E | 5 | "A" | 
 | viaje_1 | 06:35:00 | 06:35:00 | parada_A | 6 | "" | 
 
 - Viaje circular con dos carteles 
 
 | trip_id | hora_llegada | hora_salida | parada_id | stop_sequence | stop_headsign | 
 |---------|--------------|----------------|---------|---------------|---------------| 
 | viaje_1 | 06:10:00 | 06:10:00 | parada_A | 1 | "saliente" | 
 | viaje_1 | 06:15:00 | 06:15:00 | parada_B | 2 | "saliente" | 
 | viaje_1 | 06:20:00 | 06:20:00 | parada_C | 3 | "saliente" | 
 | viaje_1 | 06:25:00 | 06:25:00 | parada_D | 4 | "entrante" | 
 | viaje_1 | 06:30:00 | 06:30:00 | parada_E | 5 | "entrante" | 
 | viaje_1 | 06:35:00 | 06:35:00 | parada_F | 6 | "entrante" | 
 | viaje_1 | 06:40:00 | 06:40:00 | parada_A | 7 | "" | 

 | Nombre del campo | Recomendación | 
 |---|---| 
 | `trips.trip_id`. trip_id `| Modele el recorrido completo de ida y vuelta del circuito con un solo viaje. | 
 | `stop_times.stop_id` | Incluya la primera/última parada dos veces en `stop_times.txt` para el viaje que es un bucle. Ejemplo a continuación. A menudo, una ruta circular puede incluir el primer y último viaje que no recorre todo el circuito. Incluya estos viajes también.<table class="example"><thead><tr><th> <code>trip_id</code></th><th> <code>stop_id</code></th><th> <code>stop_sequence</code></th></tr></thead><tbody><tr><td> 9000</td><td> 101</td><td> 1</td></tr><tr><td> 9000</td><td> 102</td><td> 2</td></tr><tr><td> 9000</td><td> 103</td><td> 3</td></tr><tr><td> 9000</td><td> 101</td><td> 4</td></tr></tbody></table> | 
 | `trips.direction_id` | Si el bucle opera en direcciones opuestas (es decir, en sentido horario y antihorario), designe `direction_id` como `0` o `1`. | 
 | `trips.block_id` | Indica viajes de bucle continuo con el mismo `block_id`. | 
 
### Rutas lazo 
 
 Las rutas Lasso combinan aspectos de una ruta circular y una ruta direccional. 
 
 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/lasso-route.svg" width=140px style="display: block; margin-left: auto; margin-right: auto;"> 

 | Ejemplos: | 
 |--------| 
 | Rutas del metro ([Chicago](https://www.transitchicago.com/assets/1/6/ctamap_Lsystem.pdf)) | 
 | Rutas de autobús de los suburbios al centro ([St. Albert](https://stalbert.ca/uploads/PDF-infosheets/RideGuide-201-207_Revised_Oct_2017.pdf) o [Edmonton](http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf)) | 
 | CTA Brown Line ([Sitio web de CTA](http://www.transitchicago.com/brownline/) y [TransitFeeds](https://transitfeeds.com/p/chicago-transit-authority/165/latest/route/Brn )) | 

 | Nombre del campo | Recomendación | 
 |---|---| 
 | `trips.trip_id` | La extensión total de un “viaje de ida y vuelta en vehículo” (ver ilustración [arriba](#rutas-lazo)) consiste en el viaje de A a B, a B y de regreso a A. Un viaje de ida y vuelta en vehículo completo puede expresarse mediante:<li> Un valor/registro __single__ `trip_id` en `trips.txt`</li><li> __Múltiples__ valores/registros `trip_id` en `trips.txt`, con el viaje continuo indicado por `block_id`.</li> | 
 | `stop_times.stop_headsign` | Las paradas del tramo AB se recorrerán en ambos sentidos. `stop_headsign` facilita distinguir la dirección del viaje. Por lo tanto, se recomienda proporcionar `stop_headsign` para estos viajes.example_table:<table class="example"><thead><tr><th> Ejemplos:</th></tr></thead><tbody><tr><td> "A vía B"</td></tr><tr><td> "A"</td></tr></tbody></table><table class="example"><thead><tr><th> <a href="http://www.transitchicago.com/purpleline/">Línea Púrpura</a> de la Autoridad de Tránsito de Chicago</th></tr></thead><tbody><tr><td> "Hacia el sur hasta el circuito"</td></tr><tr><td> "En dirección norte por Loop"</td></tr><tr><td> "Hacia el norte hasta Linden"</td></tr></tbody></table><table class="example"><thead><tr><th> Líneas de autobuses del servicio de tránsito de Edmonton, aquí <a href="http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf">las 39</a></th></tr></thead><tbody><tr><td> "Rutherford"</td></tr><tr><td> "Parque del Siglo"</td></tr></tbody></table> 
 | `trip.trip_headsign` | El encabezado del viaje debe ser una descripción global del viaje, como se muestra en los horarios. Podría ser “Linden to Linden vía Loop” (ejemplo de Chicago) o “A a A vía B” (ejemplo genérico). | 
 
### Ramas 
 
 Algunas rutas pueden incluir ramales. La alineación y las paradas se comparten entre estas ramas, pero cada una también sirve a distintas paradas y secciones de alineación. La relación entre ramales puede indicarse mediante el nombre de la ruta, los letreros y el nombre corto del viaje utilizando las pautas adicionales a continuación. 
 
 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/branching.svg" width=250px style="display: block; margin-left: auto; margin-right: auto;"> 

 | Nombre del campo | Recomendación | 
 |---|---| 
 | Todos los campos | Al nombrar rutas secundarias, se recomienda seguir otros materiales de información para pasajeros. A continuación se muestran descripciones y ejemplos de dos casos: | 
 | | Si los horarios y la señalización en la calle representan dos rutas con nombres distintos (por ejemplo, 1A y 1B), preséntelas como tales en el GTFS, utilizando el `route_short_name` y/o campos `route_long_name`. Ejemplo: GoDurham Transit [rutas 2, 2A y 2B](https://gotriangle.org/sites/default/files/brochure/godurham-route2-2a-2b_1.pdf) comparten una alineación común en la mayor parte de la ruta, pero varían en varios aspectos diferentes.<ul><li> La ruta 2 es el servicio principal y funciona la mayor parte de las horas.</li><li> La Ruta 2 incluye un desvío en las noches, domingos y feriados de Main Street.</li><li> Las Rutas 2A y 2B operan durante el día de lunes a sábado.</li><li> La ruta 2B ofrece paradas adicionales en una desviación del camino de alineación compartido.</li></ul> | 
 | | Si la información proporcionada por la agencia describe las ramas como la misma ruta con el mismo nombre, utilice los campos `trips.trip_headsign`, `stop_times.stop_headsign` y/o `trips.trip_short_name`. Ejemplo: GoTriangle [ruta 300](https://gotriangle.org/sites/default/files/route_300_v.1.19.pdf) viaja a diferentes ubicaciones según la hora del día. Durante las horas pico de tránsito, se agregan tramos adicionales a la ruta estándar para acomodar a los trabajadores que entran y salen de la ciudad. | 
 
## Preguntas frecuentes (FAQ) 
 
### ¿Por qué son importantes estas mejores prácticas de GTFS? 
 
 Los objetivos de las Mejores Prácticas GTFS son: 
 
 * Mejorar la experiencia del cliente final en aplicaciones de transporte público 
 * Apoyar una amplia interoperabilidad de datos para facilitar a los desarrolladores de software implementar y escalar aplicaciones, productos, y servicios 
 * Facilitar el uso de GTFS en varias categorías de aplicaciones (más allá de su enfoque original en la planificación de viaje) 
 
 Sin mejores prácticas de GTFS coordinadas, varias aplicaciones que consumen GTFS pueden establecer requisitos y expectativas de manera no coordinada, lo que conduce a requisitos divergentes y conjuntos de datos específicos de aplicaciones y a una menor interoperabilidad. Antes de la publicación de las Mejores Prácticas, había una mayor ambigüedad y desacuerdo sobre lo que constituyen datos GTFS correctamente formados. 
 
### ¿Cómo se desarrollaron? ¿Quién los desarrolló? 
 
 Estas mejores prácticas fueron desarrolladas por un grupo de trabajo de 17 organizaciones involucradas en GTFS, incluidos proveedores de aplicaciones y consumidores de datos, proveedores de transporte y consultores con amplia participación en GTFS. El grupo de trabajo fue convocado y facilitado por [Rocky Mountain Institute](https://rmi.org/our-work/transportation/mobility-data/). 
 
 Los miembros del Grupo de Trabajo votaron sobre cada Mejor Práctica. La mayoría de las Mejores Prácticas fueron aprobadas por votación unánime. En una minoría de casos, las Mejores Prácticas fueron aprobadas por una gran mayoría de organizaciones. 
 
### ¿Por qué no simplemente cambiar la referencia GTFS? 
 
 ¡Buena pregunta! El proceso de examinar la Especificación, el uso de datos y las necesidades de hecho desencadenó algunos cambios en la Especificación (consulte [Pull Requests cerradas en GitHub](https://github.com/google/transit/pulls?q=is%3Apr+is%3Aclosed)). 
 Las modificaciones de las referencias a las especificaciones están sujetas a un mayor nivel de escrutinio y comentarios que las Mejores Prácticas. Ciertas prácticas recomendadas se están fusionando en la especificación según su nivel de adopción y consenso de la comunidad. Con el tiempo, todas las mejores prácticas de GTFS podrían pasar a formar parte de la referencia principal de GTFS. 
 
### ¿Cómo comprobar la conformidad con estas mejores prácticas? 
 
 El Validador de Programación Canonical GTFS verifica el cumplimiento de estas Mejores Prácticas. Puede encontrar más información sobre esta herramienta de validación en la [página de validación](../../../getting_started/validate). 
 
### Represento a una agencia de tránsito. ¿Qué pasos puedo tomar para que nuestros proveedores de servicios de software y vendedores sigan estas mejores prácticas? 
 
 Consulte estas Mejores Prácticas con su proveedor o proveedor de servicios de software. Recomendamos hacer referencia a la URL de mejores prácticas de GTFS, así como a la referencia de especificaciones principales en la adquisición de software de producción de GTFS. 
 
### ¿Qué debo hacer si noto que un feed de datos GTFS no cumple con estas mejores prácticas? 
 
 Identifique el contacto para el feed, utilizando los campos propuestos [feed_contact_email o feed_contact_url](https://github.com/google/transit/pull/31/files) en *feed_info.txt* si existen, o buscar información de contacto en el sitio web de la agencia de transporte o del productor de piensos. Al comunicar el problema al productor de piensos, enlace a la mejor práctica GTFS específica que se esté analizando. (Ver ["Vincular a este documento"](#vincular-a-este-documento)). 
 
### ¿Cómo me involucro? 
 
 Correo electrónico [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org). 
 
## Acerca de este documento### Objetivos 
 
 Los objetivos de mantener las Mejores Prácticas GTFS son: 
 
 * Apoyar una mayor interoperabilidad de los datos de tránsito 
 * Mejorar al cliente usuario final experiencia en aplicaciones de transporte público 
 * Facilitar a los desarrolladores de software la implementación y escalamiento de aplicaciones, productos y servicios 
 * Facilitar el uso de GTFS en varias categorías de aplicaciones (más allá de su enfoque original en la planificación de viaje) 
 
# Cómo proponer o modificar las mejores prácticas GTFS publicadas 
 
 Las mejores prácticas están en proceso de fusionarse en la especificación. Si desea sugerir una nueva práctica recomendada, vaya al [repositorio GitHub de referencia GTFS](https://github.com/google/transit/) para abrir un problema o crear un PR, o comuníquese con [specifications@ mobiledata.org](mailto:specificaciones@mobilitydata.org). 
 
### Vincular a este documento 
 
 Enlace aquí para proporcionar a los productores de piensos orientación para la formación correcta de los datos GTFS. Cada recomendación individual tiene un enlace de anclaje. Haga clic en la recomendación para obtener la URL del enlace de anclaje en la página. 
 
 Si una aplicación que consume GTFS presenta requisitos o recomendaciones para prácticas de datos GTFS que no se describen aquí, se recomienda publicar un documento con esos requisitos o recomendaciones para complementar estas mejores prácticas comunes. 
 
### Grupo de trabajo de mejores prácticas del GTFS 
 
 El Grupo de trabajo de mejores prácticas del GTFS fue convocado por el [Rocky Mountain Institute](http://rmi.org/) en 2016-17 y está formado por proveedores de transporte público, desarrolladores de aplicaciones que consumen GTFS, consultores y organizaciones académicas para definir prácticas y expectativas comunes para los datos GTFS. 
 Los miembros de este grupo de trabajo incluyeron: 
 
 * [Cambridge Systematics](https://www.camsys.com/) 
 * [Capital Metro](https://www.capmetro.org/)  
 * [Centro de Investigación del Transporte Urbano de la Universidad del Sur de Florida](https://www.cutr.usf.edu/) 
 * [Conveyal](http://conveyal.com/) 
 * [Google](https://www.google.com/) 
 * [IBI Group](http://www.ibigroup.com/) 
 * [Mapzen](https://mapzen.com/) 
 * [Microsoft](https://www.microsoft.com/) 
 * [Moovel](https://www.moovel.com/) 
 * [Departamento de Transporte de Oregon](http://www.oregon.gov/odot/) 
 * [Rápidamente](https://goswift.ly/) 
 * [Tránsito](https://transitapp.com/) 
 * [Trillium](http://trilliumtransit.com/) 
 * [TriMet](https://trimet.org/) 
 * [Banco Mundial](http://www.worldbank.org/) 
 
 Hoy en día, este documento es mantenido por [MobilityData](https://mobilitydata.org/). 
 