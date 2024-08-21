# GTFS Realtime 

 La especificación GTFS Realtime no está escrita en piedra. Más bien, es una especificación abierta desarrollada y mantenida por la comunidad de agencias de transporte, desarrolladores y otras partes interesadas que utilizan GTFS Realtime. Se espera que esta comunidad de productores y consumidores de datos GTFS Realtime tenga propuestas para ampliar la especificación para habilitar nuevas capacidades. Para ayudar a gestionar ese proceso, se han establecido los siguientes procedimientos y pautas. 
 
!!! note "" 
 
    La especificación oficial, la referencia y la documentación están escritas en inglés. Si una traducción a un idioma diferente difiere del original en inglés, este último tiene prioridad. Toda la comunicación se realiza en inglés. 
 
# Agregar nuevos campos a GTFS Realtime 
 
 Cuando un productor o consumidor esté interesado en agregar un nuevo campo a la especificación GTFS Realtime, debe abrir una nueva edición en el [repositorio GitHub de GTFS Realtime](https://github.com/google/transit) que describe el campo propuesto y anuncia este nuevo campo (incluido un enlace al problema) en la [lista de correo GTFS Realtime](https://groups.google.com/forum/#! foro/gtfs-realtime). 
 
## Campos *experimentales* 
 1. Si la comunidad puede llegar a un consenso (a) de que el campo propuesto parece útil y (b) sobre el tipo de campo (`optional` vs `repeated`, `string` vs `int` vs `bool` ), luego se asignará un número de campo en el message GTFS Realtime y se hará una nota en el [archivo.proto](../../../documentation/realtime/proto/) y documentación de que este es un campo *experimental* que puede cambiar en el futuro. 
    - El consenso se alcanza mediante un proceso de discusión y votación que es el mismo que el siguiente [Proceso de modificación de la especificación](#proceso-de-modificacion-de-la-especificacion), pero en lugar de consentimiento unánime, solo se requiere el 80 % de los votos a favor para la aprobación. 
    - Los productores y consumidores de GTFS Realtime que deseen utilizar el nuevo campo *experimental* volverán a generar su biblioteca utilizando el archivo.proto con el nuevo campo (por ejemplo, Google actualizará la [biblioteca gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings)), y comience a completar y analizar el campo con datos en vivo. 
    - Una vez que estemos satisfechos de que el campo *experimental* vale la pena y que tanto los productores como los consumidores están utilizando el campo, seguiremos a continuación el [Proceso de modificación de la especificación](#proceso-de-modificacion-de-la-especificacion) para agregar oficialmente el campo a la especificación. 
    - Si el campo *experimental* no se adopta a través del [Proceso de modificación de la especificación](#proceso-de-modificacion-de-la-especificacion) dentro de los 2 años de haber sido aprobado como campo *experimental*, quedará obsoleto agregando `[deprecated=true]` junto al valor del campo en el archivo [.proto file](../../../documentation/realtime/proto/). Al utilizar `[deprecated=true]` (en lugar de `RESERVED`), los productores y consumidores que ya han adoptado el campo no tienen que eliminarlo de su uso. Además, el campo puede dejar de estar obsoleto en el futuro si se aprueba en una votación posterior después del [Proceso de modificación de la especificación](#proceso-de-modificacion-de-la-especificacion) (por ejemplo, cuando productores y/o consumidores adicionales comiencen a usar el campo). 
 
 1. Si el nuevo campo se considera específico de un solo productor o hay disputa sobre el tipo de datos, entonces asignaremos una [extensión personalizada](#extensiones) al productor para que pueda usar el campo en su propia alimentación. Cuando sea posible, debemos evitar extensiones y agregar campos útiles para muchas agencias a la especificación principal para evitar la fragmentación y el trabajo adicional de los consumidores para admitir varias extensiones de la especificación. 
 
## Proceso de modificación de la especificación 
 1. Crear una rama git con actualización de todas las partes relevantes de los archivos de definición, especificación y documentación del protocolo (excepto las traducciones). 
 1. Cree una Pull Request en https://github.com/google/transit. La Pull Request debe contener una descripción extensa del cambio. El creador de la Pull Request se convierte en el _promotor_. 
 1. Una vez registrada la Pull Request, ésta debe ser anunciada por su promotor en la [lista de correo de GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime). Una vez anunciada, la Pull Request se considera una propuesta. 
    - Dado que el promotor es un colaborador, debe firmar el [Acuerdo de licencia de colaborador](https://github.com/google/transit/blob/master/CONTRIBUTING.md) antes de que se pueda aceptar la Pull Request. 
 1. La discusión de la propuesta sigue a continuación. Los comentarios de las Pull Requests deben utilizarse como único foro de discusión. 
    - La discusión dura el tiempo que el promotor considere necesario, pero debe ser de al menos 7 días naturales. 
    - El promotor es responsable de la actualización oportuna de la propuesta (es decir, Pull Request) en función de los comentarios que acepta. 
    - En cualquier momento el promotor puede reclamar el abandono de la propuesta. 
 1. El promotor puede solicitar una votación sobre una versión de la propuesta en cualquier momento después del intervalo inicial de siete días requerido para la discusión. 
    - Antes de convocar a votación, al menos un productor de GTFS en tiempo real y un consumidor de GTFS en tiempo real deben implementar el cambio propuesto. Se espera que los productores de GTFS en tiempo real incluyan el cambio en un feed GTFS en tiempo real de cara al público y proporcionen un enlace a esos datos dentro de los comentarios de la Pull Request, y que los consumidores de GTFS en tiempo real proporcionen un enlace.en los comentarios de la Pull Request a una aplicación que utiliza el cambio de una manera no trivial (es decir, admite una funcionalidad nueva o mejorada). 
    - Al convocar una votación, el promotor debe indicar claramente si la votación es para la adopción oficial del campo en la especificación o para un campo experimental. 
 1. La votación tiene una duración mínima suficiente para cubrir siete días naturales completos y cinco días hábiles suizos completos. La votación finaliza a las 23:59:59 UTC. 
    - El promotor deberá anunciar la hora concreta de finalización al inicio de la votación. 
    - Durante el período de votación sólo se permiten cambios editoriales en la propuesta (errores tipográficos, la redacción puede cambiar siempre que no cambie el significado). 
    - Cualquiera puede votar sí/no en forma de comentario a la Pull Request, y los votos se pueden cambiar hasta el final del período de votación. 
 Si un elector cambia su voto, se recomienda hacerlo actualizando el comentario de voto original tachando el voto y escribiendo el nuevo voto. 
    - No se consideran los votos antes del inicio del período de votación. 
    - La apertura y el cierre de las votaciones deben anunciarse en la [lista de correo GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime). 
 1. La propuesta se acepta si hay consenso unánime con al menos 3 votos. 
    - El voto del promotor no cuenta para el total de 3 votos. Por ejemplo, si el promotor X crea una Pull Request y vota sí, y los Usuarios Y y Z votan sí, esto se cuenta como 2 votos afirmativos en total. 
    - Los votos en contra deberán estar motivados e idealmente proporcionar información procesable. 
    - Si la votación fracasa, el promotor podrá optar por continuar trabajando en la propuesta o abandonarla. 
 Cualquiera de las decisiones del promotor debe anunciarse en la [lista de correo de GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime). 
    - Si el promotor continúa trabajando en la propuesta, se podrá convocar una nueva votación en cualquier momento. 
 1. Cualquier pull request que permanezca inactiva durante 30 días naturales será cerrado. Cuando se cierra una Pull Request, la propuesta correspondiente se considera abandonada. El promotor puede reabrir la Pull Request en cualquier momento si desea continuar o mantener la conversación. 
: tenga en cuenta que el promotor puede optar por implementar la función como una [extensión personalizada](#extensiones) en lugar de parte de la especificación oficial. 
 1. Si se acepta la propuesta: 
    - Google se compromete a fusionar la versión votada de la Pull Request (siempre que los contribuyentes hayan firmado el [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md)) y realizar la Pull Request dentro de los 5 días hábiles. 
: Google se compromete a actualizar oportunamente el repositorio [https://github.com/google/gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings). Se compromete con enlaces gtfs-realtime-bindings que son el resultado de una propuesta; debe hacer referencia a la Pull Request de la propuesta. 
    - Las Traducciones no deben incluirse en la Pull Request original. 
 Google es responsable de actualizar eventualmente las traducciones relevantes a los idiomas admitidos, pero las solicitudes de traducción pura de la comunidad son bienvenidas y se aceptarán tan pronto como se aborden todos los comentarios editoriales. 
 
## Principios rectores 
 Para preservar la visión original de GTFS Realtime, se han establecido una serie de principios rectores que se deben tener en cuenta al ampliar la especificación: 
 
 **Los feeds deben ser eficientes para producir y consumir en tiempo real.** 
 
 La información en tiempo real es un flujo continuo y dinámico de datos que necesariamente requiere un procesamiento eficiente. Elegimos Protocol Buffers como base para la especificación porque ofrecen un buen equilibrio en términos de facilidad de uso para los desarrolladores y en términos de eficiencia para la transmisión de datos. A diferencia de GTFS, no imaginamos que muchas agencias editarán manualmente los feeds de GTFS Realtime. La elección de Protocol Buffers refleja la conclusión de que la mayoría de los feeds GTFS Realtime se producirán y consumirán mediante programación. 
 
 **La especificación trata sobre información de los pasajeros.** 
 
 Al igual que GTFS antes, GTFS Realtime se ocupa principalmente de la información de los pasajeros. Es decir, la especificación debe incluir información que pueda ayudar a los conductores a utilizar herramientas eléctricas, ante todo. Existe potencialmente una gran cantidad de información orientada a las operaciones que las agencias de tránsito podrían querer transmitir internamente entre sistemas. GTFS Realtime no está diseñado para ese propósito y existen potencialmente otros estándares de datos orientados a operaciones que pueden ser más apropiados. 
 
 **Los cambios en la especificación deben ser compatibles con versiones anteriores.** 
 
 Al agregar funciones a la especificación, queremos evitar realizar cambios que invaliden los feeds existentes. No queremos crear más trabajo para los editores de feeds existentes hasta que quieran agregar capacidades a sus feeds. Además, siempre que sea posible, queremos que los analizadores existentes puedan continuar leyendo las partes más antiguas de los feeds más nuevos. Las convenciones para ampliar los buffers de protocolo impondrán la Retrocompatibilidad hasta cierto punto. Sin embargo, deseamos evitar cambios semánticos en los campos existentes que también podrían romper la Retrocompatibilidad. 
 
 **Se desaconsejan las funciones especulativas.** 
 
 Cada nueva función añade complejidad a la creación y lectura de feeds. Por lo tanto, queremos tener cuidado de agregar sólo funciones que sabemos que serán útiles. Idealmente, cualquier propuesta habrá sido probada generando datos para un sistema de tránsito real que utilice la nueva función y software de escritura para leerla y mostrarla. 
 
## Extensiones 
 Para permitir a los productores agregar información personalizada a un feed GTFS Realtime, aprovecharemos la [función de extensiones de Protocol Buffers](https://developers.google.com/protocol-buffers/docs/proto#extensions). Las extensiones nos permiten definir un espacio de nombres en un message de Protocol Buffer donde los desarrolladores externos pueden definir campos adicionales sin la necesidad de modificar la definición del proto original. 
 
 Cuando sea posible, debemos evitar extensiones y agregar campos útiles para muchas agencias a la especificación principal para evitar la fragmentación y el trabajo adicional para los consumidores para admitir varias extensiones de la especificación. Antes de solicitar una identificación de extensión, los productores deben proponer agregar el campo a la especificación (consulte [Agregar nuevos campos a GTFS Realtime](#agregar-nuevos-campos-a-gtfs-realtime)) 
 
 Las ID de extensión dentro del rango 9000-9999 están reservados para uso privado de los productores de GTFS-rt. Estas identificaciones solo deben usarse para transmitir información internamente a su organización. Las extensiones de este rango **no deben** usarse en feeds públicos. 
 
 Para crear una nueva extensión, asignaremos a un productor la siguiente identificación de extensión disponible, seleccionada incrementalmente de una lista de números que comienza en 1000 y va hacia arriba y documentada en la sección Registro de extensiones que se encuentra a continuación. 
 
 Estos ID de extensión asignados corresponden a los ID de etiqueta disponibles en el espacio de nombres de "extensión" para cada definición de message GTFS Realtime. Ahora que el desarrollador tiene una identificación de extensión asignada, usará esa identificación al extender todos y cada uno de los mensajes GTFS Realtime. Incluso si el desarrollador solo planea extender un único message, la identificación de extensión asignada se reservará para TODOS los mensajes. 
 
 Para un desarrollador que extiende la especificación, en lugar de agregar un solo campo como una "string" o "int32" con su ID de extensión, el modelo preferido es definir un nuevo message como "MyTripDescriptorExtension", extender el GTFS Realtime subyacente message con su nuevo message y luego coloque todos los campos nuevos allí. Esto tiene la buena propiedad de que puede administrar los campos dentro de su message de extensión como desee, sin necesidad de reservar una nueva identificación de extensión de la lista maestra. 
 
```
message MyTripDescriptorExtension {
  optional string some_string = 1;
  optional bool some_bool = 2;
  ...
}
extend transit_realtime.TripDescriptor {
  optional MyTripDescriptorExtension my_trip_descriptor = YOUR_EXTENSION_ID;
}
```
 
 Al crear extensiones, los desarrolladores deben seguir la [Guía de lenguaje de búferes de protocolo](https://developers.google.com/protocol-buffers/docs/proto). Un error común es reutilizar un número de campo de extensión. En la [sección Asignación de números de campo](https://developers.google.com/protocol-buffers/docs/proto#assigning-field-numbers), la Guía de idiomas dice: 
 
 > Cada campo en la definición del message tiene un número único. Estos números se utilizan para identificar sus campos en el formato binario del message y no deben cambiarse una vez que su tipo de message esté en uso. 
 
 Por ejemplo, en el primer ejemplo a `some_string` se le asignó el número de campo `1`. Cuando el desarrollador ya no desea usar `some_string`, o cuando `some_string` se ha adoptado en la especificación oficial de GTFS Realtime y no hay necesidad de la extensión, el desarrollador no puede reutilizar el campo número `1` para un nuevo campo..En su lugar, el desarrollador debería desaprobar el campo y utilizar un nuevo número para el nuevo campo: 

```
message MyTripDescriptorExtension {
  optional string some_string = 1 [deprecated=true];
  optional bool some_bool = 2;
  optional string some_new_string = 3;
  ...
}
```
 
## Registro de extensión 
 
|ID de extensión|Desarrollador|Contacto|Detalles| 
|------------|---------|-------|-------| 
|1000|OneBusAway|[onebusaway-developers](http://groups.google.com/group/onebusaway-developers)|https://github.com/OneBusAway/onebusaway/wiki/GTFS-Realtime-Resources|
|1001|New York City MTA|[mtadeveloperresources](http://groups.google.com/group/mtadeveloperresources)|http://mta.info/developers/|
|1002|Google|[transit-realtime-partner-support@google.com](mailto:transit-realtime-partner-support@google.com)|Google Maps Live Transit Updates|
|1003|OVapi|gtfs-rt at ovapi.nl|http://gtfs.ovapi.nl|
|1004|Metra|[William Ashbaugh <w.l.ashbaugh@gmail.com>](mailto:w.l.ashbaugh@gmail.com)|
|1005|Metro-North Railroad|[John Larsen](mailto:mnrappdev@mnr.org)|
|1006|realCity|[David Varga](mailto:transit@realcity.io)|http://realcity.io|
|1007|Transport for NSW|[timetable@transport.nsw.gov.au](mailto:timetable@transport.nsw.gov.au)|[Discusión](https://groups.google.com/forum/#!msg/gtfs-realtime/WYwIs4Hd_E0/PbkMnELUAwAJ)|
|1008|SEPTA - Southeastern Pennsylvania Transportation Authority|[Gregory Apessos](mailto:GApessos@septa.org)|https://github.com/septadev|
|1009|Swiftly|[mike@goswift.ly](mailto:mike@goswift.ly)|[Discusión](https://groups.google.com/forum/#!msg/gtfs-realtime/mmnZV6L-2ls/wVWdknhLBwAJ)|
|1010|IBI Group|[Ritesh Warade](mailto:transitrealtime@ibigroup.com)|[GitHub proposal for new timestamps in Service Alerts](https://github.com/google/transit/pull/134)|
|1013|MITFAHR\|DE\|ZENTRALE (MFDZ)|[Holger Bruch](mailto:holger.bruch@mfdz.de)|[Discusión](https://groups.google.com/g/gtfs-realtime/c/IxYh-beoNoo)|
|9000-9999|RESERVADO - USO INTERNO|[Comunidad GTFS](https://groups.google.com/forum/#!forum/gtfs-realtime)|[Discusión](https://groups.google.com/g/gtfs-realtime/c/IxYh-beoNoo)|
