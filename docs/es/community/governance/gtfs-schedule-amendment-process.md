# GTFS Schedule 

 La especificación GTFS no está escrita en piedra. Más bien, es una especificación abierta desarrollada y mantenida por la comunidad de agencias de transporte, desarrolladores y otras partes interesadas que utilizan GTFS. Se espera que esta comunidad de productores y consumidores de datos GTFS tenga propuestas para ampliar la especificación para habilitar nuevas capacidades. Para ayudar a gestionar ese proceso, se han establecido los siguientes procedimientos y pautas. 
 
!!! nota "" 
 
    La especificación oficial, la referencia y la documentación están escritas en inglés. Si una traducción a un idioma diferente difiere del original en inglés, este último tiene prioridad. Toda la comunicación se realiza en inglés. 
 
# Proceso de modificación de la especificación 
 
 1. Crear una rama git con actualización de todas las partes relevantes de los archivos de definición, especificación y documentación del protocolo (excepto las traducciones). 
 1. Cree una Pull Request en https://github.com/google/transit. La Pull Request debe contener una descripción detallada del cambio. El creador de la Pull Request se convierte en el _promotor_ (advocate). 
 1. Una vez registrada la Pull Request, su promotor debe anunciarla en la [lista de correo de cambios GTFS](https://groups.google.com/forum/#!forum/gtfs-changes), incluyendo un enlace a la Pull Request. Una vez anunciada, la Pull Request se considera una propuesta. La Pull Request también debe editarse para que contenga un enlace al anuncio de Grupos de Google para que se puedan realizar referencias cruzadas fácilmente. 
    - Dado que el promotor es un colaborador, debe firmar el [Acuerdo de licencia de colaborador](https://github.com/google/transit/blob/master/CONTRIBUTING.md) antes de que se pueda aceptar la Pull Request. 
 1. La discusión de la propuesta sigue a continuación. Los comentarios de las Pull Requests deben utilizarse como único foro de discusión. 
    - La discusión dura el tiempo que el promotor considere necesario, pero debe ser de al menos 7 días naturales. 
    - El promotor es responsable de la actualización oportuna de la propuesta (es decir, Pull Request) en función de los comentarios que acepta. 
    - En cualquier momento el promotor puede reclamar el abandono de la propuesta. 
 1. El promotor puede solicitar una votación sobre una versión de la propuesta en cualquier momento después del intervalo inicial de siete días requerido para la discusión. 
    - Antes de convocar a votación, al menos un productor de GTFS y un consumidor de GTFS deben implementar el cambio propuesto. Se espera que los productores de GTFS incluyan el cambio en un feed GTFS público y proporcionen un enlace a esos datos dentro de los comentarios de la Pull Request, y que los consumidores de GTFS proporcionen un enlace en los comentarios de la Pull Request a una aplicación que utiliza el cambio de una manera no trivial (es decir, admite funcionalidades nuevas o mejoradas). 
 1. La votación tiene una duración mínima suficiente para cubrir catorce días naturales completos. La votación finaliza a las 23:59:59 UTC. 
    - El promotor deberá anunciar la hora concreta de finalización al inicio de la votación. 
    - Durante el período de votación sólo se permiten cambios editoriales en la propuesta (errores tipográficos, la redacción puede cambiar siempre que no cambie el significado). 
    - Cualquiera puede votar sí/no en forma de comentario a la Pull Request, y los votos se pueden cambiar hasta el final del período de votación. Si un elector cambia su voto, se recomienda hacerlo actualizando el comentario de voto original tachando el voto y escribiendo el nuevo voto. 
    - No se consideran los votos antes del inicio del período de votación. 
    - La apertura y el cierre de las votaciones deben anunciarse en la [lista de correo de cambios GTFS](https://groups.google.com/forum/#!forum/gtfs-changes). 
 1. La propuesta se acepta si hay consenso unánime con al menos 3 votos. 
    - El voto del promotor no cuenta para el total de 3 votos. Por ejemplo, si el promotor X crea una Pull Request y vota sí, y los Usuarios Y y Z votan sí, esto se cuenta como 2 votos afirmativos en total. 
    - Los votos en contra deberán estar motivados e idealmente proporcionar información procesable. 
    - Si la votación fracasa, el promotor podrá optar por continuar trabajando en la propuesta o abandonarla. Cualquiera de las decisiones del promotor debe anunciarse en la [lista de correo de cambios GTFS](https://groups.google.com/forum/#!forum/gtfs-changes). 
    - Si el promotor continúa trabajando en la propuesta, se podrá convocar una nueva votación en cualquier momento. 
 1. Cualquier pull request que permanezca inactiva durante 30 días naturales será cerrado. Cuando se cierra una Pull Request, la propuesta correspondiente se considera abandonada. El promotor puede reabrir la Pull Request en cualquier momento si desea continuar o mantener la conversación. 
 1. Si se acepta la propuesta: 
    - Google se compromete a fusionar la versión votada de la Pull Request (siempre que los contribuyentes hayan firmado el [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md)) y realizar la Pull Request dentro de los 5 días hábiles. 
    - Las Traducciones no deben incluirse en la Pull Request original. 
    Google es responsable de actualizar eventualmente las traducciones relevantes a los idiomas admitidos, pero las solicitudes de traducción pura de la comunidad son bienvenidas y se aceptarán tan pronto como se aborden todos los comentarios editoriales. 
 1. El resultado final de la Pull Request (aceptada o abandonada) debe anunciarse en el mismo hilo de Grupos de Google donde se anunció originalmente la Pull Request. 
 
<hr> 
 
## Principios rectores 
 Para preservar la visión original de GTFS, se han establecido una serie de principios rectores que se deben tener en cuenta al ampliar la especificación: 
 
 **Los feeds deben ser fáciles de crear y editar**<br> 
 Elegimos CSV como base para la especificación porque es fácil de ver y editar usando programas de hojas de cálculo y editores de texto, lo cual resulta útil para agencias más pequeñas. También es sencillo de generar a partir de la mayoría de los lenguajes de programación y bases de datos, lo que es bueno para los editores de feeds más grandes. 
 
 **Los feeds deben ser fáciles de analizar**<br> 
 Los lectores de feeds deberían poder extraer la información que buscan con el menor trabajo posible. Los cambios y adiciones al feed deben ser lo más útiles posible para minimizar la cantidad de rutas de código que los lectores del feed deben implementar. (Sin embargo, se debe dar prioridad a facilitar la creación, ya que en última instancia habrá más editores de feeds que lectores de feeds). 
 
 **La especificación se refiere a la información de los pasajeros**<br> 
 GTFS se ocupa principalmente de la información a los pasajeros. Es decir, la especificación debe incluir información que pueda ayudar a los conductores a utilizar herramientas eléctricas, ante todo. Existe potencialmente una gran cantidad de información orientada a las operaciones que las agencias de tránsito podrían querer transmitir internamente entre sistemas. GTFS no está diseñado para ese propósito y existen potencialmente otros estándares de datos orientados a operaciones que pueden ser más apropiados. 
 
 **Los cambios en las especificaciones deben ser compatibles con versiones anteriores**<br> 
 Al agregar funciones a la especificación, queremos evitar realizar cambios que invaliden los feeds existentes. No queremos crear más trabajo para los editores de feeds existentes hasta que quieran agregar capacidades a sus feeds. Además, siempre que sea posible, queremos que los analizadores existentes puedan continuar leyendo las partes más antiguas de los feeds más nuevos. 
 
 **Se desaconsejan las funciones especulativas**<br> 
 Cada nueva característica agrega complejidad a la creación y lectura de feeds. Por lo tanto, queremos tener cuidado de agregar sólo funciones que sabemos que serán útiles. Idealmente, cualquier propuesta habrá sido probada generando datos para un sistema de tránsito real que utilice la nueva función y software de escritura para leerla y mostrarla. Tenga en cuenta que GTFS permite fácilmente extensiones del formato mediante la adición de columnas y archivos adicionales que los analizadores y validadores oficiales ignoran, por lo que las propuestas se pueden crear prototipos y probar fácilmente en fuentes existentes. 
 
<hr> 
