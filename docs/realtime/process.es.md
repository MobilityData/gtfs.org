# Añadir nuevos campos a GTFS Realtime

Cuando un productor o consumidor está interesado en añadir un nuevo campo a la especificación GTFS Realtime, debe abrir una nueva incidencia en el [repositorio GitHub de GTFS Realtime](https://github.com/google/transit) describiendo el campo propuesto y anunciar este nuevo campo (incluyendo un enlace a la incidencia) en [la lista de correo de GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime).

## Proceso de modificación de la especificación

1. Crear una rama git con la actualización de todas las partes relevantes de los archivos de definición de protocolo, especificación y documentación (excepto las traducciones).
2. Crear pull request en [https://github.com/google/transit.](https://github.com/google/transit) El pull request debe contener una descripción ampliada del parche. El creador de la pull request se convierte en el *defensor*.
3. Una vez registrado el pull request, debe ser anunciado por su defensor en la [lista de correo de GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime). Una vez anunciado, el pull request se considera una propuesta.
     - Dado que el promotor es un colaborador, debe firmar el [Acuerdo de Licencia de Colaborador](https://github.com/google/transit/blob/master/CONTRIBUTING.md) antes de que el pull request pueda ser aceptado.
4. A continuación se presenta la discusión de la propuesta. Los comentarios del pull request deberían utilizarse como único foro de discusión.
     - La discusión dura el tiempo que el promotor considere necesario, pero debe ser de al menos 7 días naturales.
     - El promotor es responsable de la actualización oportuna de la propuesta (es decir, pull request) en función de los comentarios con los que esté de acuerdo.
     - En cualquier time, el promotor puede reclamar el abandono de la propuesta.
5. El promotor puede convocar una votación sobre una versión de la propuesta en cualquier momento tras el intervalo inicial de 7 días necesario para la discusión.
     - Antes de convocar una votación, al menos un productor de GTFS-realtime y un consumidor de GTFS-realtime deberán aplicar el cambio propuesto. Se espera que el (los) productor(es) de GTFS-realtime incluya(n) el cambio en un feed público de GTFS-realtime y proporcione(n) un enlace a esos datos en los comentarios de la solicitud de extracción, y que el (los) consumidor(es) de GTFS-realtime proporcione(n) un enlace en los comentarios de la solicitud de extracción a una aplicación que esté utilizando el cambio de una manera no trivial (es decir, que esté soportando una funcionalidad nueva o mejorada).
     - Al solicitar una votación, el promotor debe indicar claramente si la votación es para la adopción oficial del campo en la especificación o para un campo experimental.
6. La votación dura el periodo mínimo suficiente para cubrir 7 días naturales completos y 5 días laborables suizos completos. La votación finaliza a las 23:59:59 UTC.
     - El promotor debe anunciar la hora concreta de finalización al inicio de la votación.
     - Durante el periodo de votación sólo se permiten cambios editoriales en la propuesta (erratas, la redacción puede cambiar siempre que no cambie el significado).
     - Cualquiera puede votar sí/no en forma de comentario a la pull request, y los votos pueden cambiarse hasta el final del periodo de votación.
   Si un votante cambia su voto, se recomienda hacerlo actualizando el comentario del voto original tachando el voto y escribiendo el nuevo voto.
     - No se tienen en cuenta los votos anteriores al inicio del periodo de votación.
7. La propuesta se acepta si hay un consenso unánime a favor con al menos 3 votos.
     - El voto del proponente no cuenta para el total de 3 votos. Por ejemplo, si el proponente X crea un pull request y vota que sí, y el usuario Y y Z votan que sí, esto se cuenta como 2 votos totales a favor.
     - Los votos en contra deben estar motivados, e idealmente proporcionar retroalimentación procesable.
     - Si la votación ha fallado, entonces el promotor puede elegir continuar trabajando en la propuesta, o abandonarla.
   Cualquier decisión del promotor deberá anunciarse en la lista de correo.
     - Si el promotor continúa trabajando en la propuesta, se puede convocar una nueva votación en cualquier momento.
8. Cualquier pull request que permanezca inactiva durante 30 días naturales será cerrada. Cuando se cierra una pull request, la propuesta correspondiente se considera abandonada. El promotor puede reabrir el pull request en cualquier momento si desea continuar o mantener la conversación.
     - Tenga en cuenta que el promotor puede optar por implementar la función como una [extensión personalizada](#extensions) en lugar de como parte de la especificación oficial.
9. Si se acepta la propuesta
     - Google se compromete a fusionar la versión votada de la pull request (siempre que los colaboradores hayan firmado el [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md), y a realizar la pull request en un plazo de 5 días laborables.
     - Google se compromete a actualizar puntualmente el repositorio <https://github.com/google/gtfs-realtime-bindings>. Los commits de gtfs-realtime-bindings que sean resultado de una propuesta deben hacer referencia al pull request de la propuesta.
     - Las traducciones no deben incluirse en el pull request original.
   Google es responsable de actualizar eventualmente las traducciones relevantes a los idiomas soportados, pero los pull requests de traducción puros de la comunidad son bienvenidos y serán aceptados tan pronto como se aborden todos los comentarios editoriales.

## Campos *experimentales*

1. Si la comunidad llega a un consenso (a) sobre la utilidad del campo propuesto y (b) sobre el tipo de campo (`optional` o `repeated`, `string` o `int` o `bool`), se asignará un número de campo en el mensaje GTFS Realtime y se indicará en el [archivo .proto](../proto) y en la documentación que se trata de un campo *experimental* que puede cambiar en el futuro.
     - El consenso se alcanza a través de un proceso de debate y votación que es el mismo que el [proceso de modificación de la especificación](#specification-amendment-process), pero en lugar del consentimiento unánime sólo se requiere el 80% de votos afirmativos para su aprobación.
     - Los productores y consumidores de GTFS Realtime que deseen utilizar el nuevo campo *experimental* volverán a generar su biblioteca utilizando el archivo .proto con el nuevo campo (por ejemplo, Google actualizará la [biblioteca gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings)), y empezarán a rellenar y analizar el campo con datos en tiempo real.
     - Cuando estemos convencidos de que el campo *experimental* merece la pena y tanto productores como consumidores lo utilicen, seguiremos el siguiente [proceso de modificación de la especificación](#specification-amendment-process) para añadirlo oficialmente a la especificación.
     - Si el campo *experimental* no se adopta a través del proceso de [modificación](#specification-amendment-process) de la especificación en un plazo de dos años desde su aprobación como campo *experimental*, se dejará de utilizar añadiendo `[deprecated=true]` junto al valor del campo en el [archivo .proto](../proto). Al utilizar `[deprecated=true]` (en lugar de `RESERVED`), los productores y consumidores que ya hayan adoptado el campo no tendrán que dejar de utilizarlo. Además, el campo puede "dejar de estar obsoleto" en el futuro si se aprueba en una votación posterior al [proceso de modificación de la especificación](#specification-amendment-process) (por ejemplo, cuando otros productores y/o consumidores empiecen a utilizar el campo).
2. Si el nuevo campo se considera específico de un único productor o existe una disputa sobre el tipo de datos, asignaremos una [extensión personalizada](../extensions) al productor para que pueda utilizar el campo en su propio feed. En la medida de lo posible, deberíamos evitar las extensiones y añadir campos útiles para muchas agencias a la especificación principal, a fin de evitar la fragmentación y el trabajo adicional que supone para los consumidores admitir varias extensiones de la especificación.

## Principios rectores

Con el fin de preservar la visión original de GTFS Realtime, se han establecido una serie de principios rectores a tener en cuenta a la hora de ampliar la especificación:

<br/>**Los feeds deben ser eficientes para producir y consumir en tiempo real.**

La información en tiempo real es un flujo continuo y dinámico de datos que requiere necesariamente un procesamiento eficiente. Elegimos los búferes de protocolo como base de la especificación porque ofrecen un buen equilibrio entre facilidad de uso para los desarrolladores y eficacia en la transmisión de datos. A diferencia de lo que ocurre con GTFS, no creemos que muchas agencias vayan a editar a mano los datos en tiempo real de GTFS. La elección de los búferes de protocolo refleja la conclusión de que la mayoría de los flujos GTFS en tiempo real se producirán y consumirán mediante programación.

<br/>**La especificación se refiere a la información sobre pasajeros.**

Al igual que GTFS antes que ella, GTFS Realtime se ocupa principalmente de la información de los pasajeros. Es decir, la especificación debe incluir información que pueda ayudar a potenciar las herramientas para los pasajeros, en primer lugar. Existe potencialmente una gran cantidad de información orientada a las operaciones que las agencias de transporte pueden querer transmitir internamente entre sistemas. GTFS Realtime no está pensado para este fin y existen otros estándares de datos orientados a las operaciones que podrían ser más apropiados.

<br/>**Los cambios en la especificación deben ser compatibles con versiones anteriores.**

Al añadir funciones a la especificación, queremos evitar cambios que invaliden los feeds existentes. No queremos crear más trabajo para los editores de feeds existentes hasta que quieran añadir funciones a sus feeds. Además, siempre que sea posible, queremos que los analizadores existentes puedan seguir leyendo las partes antiguas de los nuevos feeds. Las convenciones para ampliar los búferes de protocolo garantizarán hasta cierto punto la compatibilidad con versiones anteriores. Sin embargo, queremos evitar cambios semánticos en los campos existentes que puedan romper la compatibilidad con versiones anteriores.

<br/>**Se desaconsejan las funciones especulativas.**

Cada nueva función añade complejidad a la creación y lectura de feeds. Por lo tanto, queremos tener cuidado de añadir sólo características que sabemos que son útiles. Lo ideal es que cualquier propuesta se haya probado generando datos para un sistema de tránsito real que utilice la nueva función y escribiendo software para leerlos y mostrarlos.

## Historial de revisiones

**12 de marzo de 2020**

- Actualizada la descripción de `TripDescriptor` en la página de referencia de GTFS Realtime.

**26 de febrero de 2015**

- Se ha añadido el campo experimental `direction_id` a `TripDescriptor`[(discusión](https://groups.google.com/d/msg/gtfs-realtime/b8N2GGd2TBs/0fJ1IOMTjJ0J)).

**30 de enero de 2015**

- Añadido el espacio de nombres de extensión Protocol Buffer a todos los mensajes GTFS-realtime restantes que aún no tenían uno (como `FeedMessage` y `FeedEntity`).

**28 de enero de 2015**

- Se añade el campo experimental `delay` a `TripUpdate`[(discusión)](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8).

**16 de enero de 2015**

- Actualización de la descripción de `TripDescriptor.start_time`.

**8 de enero de 2015**

- Definido el enum experimental `OccupancyStatus`.
- Añadido campo experimental `occupancy_status` a `VehiclePosition`[(discusión)](https://groups.google.com/forum/#!topic/gtfs-realtime/\_HtNTGp5LxM).

**22 de mayo de 2014**

- Actualizada la descripción del enum `ScheduleRelationship` en el mensaje `StopTimeUpdate`[(discusión)](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI).
- Eliminación de REPLACEMENT de los valores de `ScheduleRelationship` en el mensaje `TripDescriptor`[(discusión)](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI).

**12 de octubre de 2012**

- Añadido campo timestamp al mensaje `TripUpdate`.

**30 de mayo de 2012**

- Añadidos detalles específicos sobre Extensiones a la especificación.

**30 de noviembre de 2011**

- Añadido espacio de nombres de extensión Protocol Buffer a mensajes clave GTFS-realtime para facilitar la escritura de extensiones a la especificación.

**25 de octubre de 2011**

- Actualizada la documentación para aclarar que `alert`, `header_text` y `description_text` son ambos valores de texto plano.

**20 de agosto de 2011**

- Documentación actualizada para aclarar la semántica del mensaje `TimeRange`.

**22 de agosto de 2011**

- Versión inicial.
