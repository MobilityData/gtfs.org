---
search:
  exclude: true
---

# Proceso de modificación de la especificación

La especificación GTFS no está grabada en piedra. Se trata de una especificación abierta desarrollada y mantenida por la comunidad de agencias de transporte, desarrolladores y otras partes interesadas que utilizan GTFS. Se espera que esta comunidad de productores y consumidores de datos GTFS presente propuestas de ampliación de la especificación para habilitar nuevas capacidades. Para ayudar a gestionar ese proceso, se han establecido los siguientes procedimientos y directrices.

!!!note ""

    La especificación oficial, la referencia y la documentación están escritas en inglés. Si la Translation a otro idioma difiere del original en inglés, este último tiene preferencia. Toda la comunicación se realiza en inglés.

1. Crear una rama git con la actualización de todas las partes relevantes de los archivos de definición de protocolo, especificación y documentación (excepto las traducciones).
1. Crear pull request en [https://github.com/google/transit.](https://github.com/google/transit) El pull request debe contener una descripción ampliada del parche. El creador de la pull request se convierte en el _defensor_.
1. Una vez registrada la pull request, debe ser anunciada por su promotor en la [lista de correo de Cambios GTFS](https://groups.google.com/forum/#!forum/gtfs-changes), incluyendo un enlace a la pull request. Una vez anunciado, el pull request se considera una propuesta. El pull request también debería editarse para que contenga un enlace al anuncio en Grupos de Google, de modo que puedan cruzarse fácilmente.
   * Dado que el promotor es un colaborador, debe firmar el [Acuerdo de Licencia de Colaborador](../CONTRIBUTING.md) antes de que se acepte el pull request.
1. A continuación se presenta la discusión de la propuesta. Los comentarios del pull request deberían utilizarse como único foro de discusión.
   * La discusión dura el tiempo que el promotor considere necesario, pero debe ser de al menos 7 días naturales.
   * El promotor es responsable de la actualización oportuna de la propuesta (es decir, pull request) en función de los comentarios con los que esté de acuerdo.
   * En cualquier time, el promotor puede reclamar el abandono de la propuesta.
1. El promotor puede convocar una votación sobre una versión de la propuesta en cualquier time tras el intervalo inicial obligatorio de 7 días para el debate.
   * Antes de pedir una votación, al menos un productor de GTFS y un consumidor de GTFS deberían aplicar el cambio propuesto. Se espera que el productor o productores GTFS incluyan el cambio en una fuente GTFS pública y proporcionen un enlace a esos datos en los comentarios de la solicitud de extracción, y que el consumidor o consumidores GTFS proporcionen un enlace en los comentarios de la solicitud de extracción a una aplicación que utilice el cambio de forma no trivial (es decir, que admita una funcionalidad nueva o mejorada).
1. La votación dura el periodo mínimo suficiente para cubrir 7 días naturales FULL y 5 días laborables SUIZOS FULL. La votación termina a las 23:59:59 UTC.
   * El promotor debería anunciar la time concreta de end al start de la votación.
   * Durante el periodo de votación sólo se permiten cambios editoriales en la propuesta (erratas, la redacción puede cambiar siempre que no cambie el significado).
   * Cualquiera puede votar sí/no en forma de comentario a la pull request, y los votos pueden cambiarse hasta el end del periodo de votación.
   Si un votante cambia su voto, se recomienda hacerlo actualizando el comentario del voto original tachando el voto y escribiendo el nuevo voto.
   * No se tienen en cuenta los votos anteriores al start del periodo de votación.
   * La apertura y el cierre de las votaciones deben anunciarse en la [lista de correo de cambios GTFS](https://groups.google.com/forum/#!forum/gtfs-changes).
1. La propuesta es aceptada si hay un consenso unánime afirmativo con al menos 3 votos.
   * El voto del proponente no cuenta para el total de 3 votos. Por ejemplo, si el proponente X crea un pull request y vota que sí, y los usuarios Y y Z votan que sí, esto se cuenta como 2 votos totales a favor.
   * Los votos en contra deberán estar motivados, e idealmente proporcionar retroalimentación procesable.
   * Si el voto ha fallado, entonces el promotor puede elegir continuar trabajando en la propuesta, o abandonarla.
   Cualquier decisión del promotor debe ser anunciada en la [lista de correo de Cambios GTFS](https://groups.google.com/forum/#!forum/gtfs-changes).
   * Si el promotor continúa trabajando en la propuesta, se puede convocar una nueva votación en cualquier time.
1. Cualquier pull request que permanezca inactiva durante 30 días naturales se cerrará. Cuando se cierra una pull request, la propuesta correspondiente se considera abandonada. El promotor puede reabrir la pull request en cualquier time si desea continuar o mantener la conversación.
1. Si se acepta la propuesta:
   * Google se compromete a fusionar la versión votada de la pull request (siempre que los colaboradores hayan firmado el [CLA](../CONTRIBUTING.md)) y a realizar la pull request en un plazo de 5 días laborables.
   * Las traducciones no deben incluirse en la pull request original.
   Google es responsable de actualizar eventualmente las traducciones pertinentes en los idiomas admitidos, pero las solicitudes de pull request de Translation puras de la comunidad son bienvenidas y se aceptarán tan pronto como se aborden todos los comentarios editoriales.
1. El resultado final de la pull request (aceptada o abandonada) debería anunciarse en el mismo hilo de Grupos de Google en el que se anunció originalmente la pull request.

<hr/>

## Principios rectores

Con el fin de preservar la visión original de GTFS, se han establecido una serie de principios rectores a tener en cuenta a la hora de ampliar la especificación:

**Los feeds deberían ser fáciles de crear y editar**<br/>Elegimos CSV como base para la especificación porque es fácil de ver y editar utilizando programas de hojas de cálculo y editores de text, lo que resulta útil para las agencias más pequeñas. También es fácil de generar a partir de la mayoría de lenguajes de programación y bases de datos, lo que es bueno para los editores de feeds más grandes.<br/>

**Los feeds deberían ser fáciles de analizar**<br/>analizarLos lectores de feeds deberían poder extraer la información que buscan con el menor trabajo posible. Los cambios y adiciones al feed deberían ser lo más útiles posible, para minimizar el número de rutas de código que los lectores del feed tienen que implementar. (Sin embargo, debería darse prioridad a facilitar la creación, ya que al final habrá más editores de feeds que lectores de feeds).<br/>

**La especificación trata sobre la información a los pasajeros**<br/>GTFS se ocupa principalmente de la información a los pasajeros. Es decir, la especificación debería incluir información que pueda ayudar a potenciar las herramientas para los pasajeros, en primer lugar. Existe potencialmente una gran cantidad de información orientada a las operaciones que las agencias de transporte pueden querer transmitir internamente entre sistemas. GTFS no está pensado para ese fin y existen potencialmente otros estándares de datos orientados a las operaciones que pueden ser más apropiados.<br/>

**Los cambios en las especificaciones deberían ser compatibles con las versiones anteriores**<br/>Al añadir funciones a la especificación, queremos evitar cambios que invaliden los feeds existentes. No queremos crear más trabajo para los editores de feeds existentes hasta que quieran añadir capacidades a sus feeds. Además, siempre que sea posible, queremos que los analizadores existentes puedan seguir leyendo las partes antiguas de los nuevos feeds.<br/>

**Se desaconsejan las funciones especulativas**<br/>Cada nueva función añade complejidad a la creación y lectura de feeds. Por ello, queremos tener cuidado de añadir sólo funciones que sepamos que son útiles. Lo ideal es que cualquier propuesta se haya probado generando datos para un sistema de tránsito real que utilice la nueva función y escribiendo software para leerlos y mostrarlos. Tenga en cuenta que el GTFS permite fácilmente extensiones al formato mediante la adición de columnas y archivos adicionales que son ignorados por los analizadores y validadores oficiales, por lo que las propuestas pueden ser fácilmente prototipadas y probadas en los feeds existentes.<br/>

<hr/>

## Historial de revisiones

**15 de septiembre de 2021**<br/>

* Permitir que las compuertas de tarifas (pathway_mode=6) sean bidireccionales. Véase [el debate](https://github.com/google/transit/pull/276).

**13 de septiembre de 2021**<br/>

* Actualizadas las mejores prácticas de `stop_name`. Ver [discusión](https://github.com/google/transit/pull/282).

**27 de agosto de 2021**<br/>

* Actualizado GTFS Schedule a [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119). Ver [discusión](https://github.com/google/transit/pull/277).

**4 de enero de 2021**<br/>

* Aclarada la descripción de `stop_times.stop_id`. Ver [discusión](https://github.com/google/transit/pull/258).
* Definidos los signos de campo positivo y distinto de cero. Ver [discusión](https://github.com/google/transit/pull/251).

**2 de octubre de 2020**<br/>

* Cambiado el tipo de campo de `frequencies.headway_secs` de entero no negativo a entero positivo. Véase [la discusión](https://github.com/google/transit/pull/249).

**Puede 25, 2020**<br/>

* Definidos `pathways.txt`, `levels.txt` y `attributions.txt` como tablas traducibles. Añadidas recomendaciones para traducir valores `signposted_as` multilingües. Véase [la discusión](https://github.com/google/transit/pull/220).

**Puede 13, 2020**<br/>

* Añadidos `continuous_pickup` y `continuous_drop_off` a routes `routes.txt` y `stop_times.txt`. Cambiado `shape_id` de "Optional" a "Conditionally required". Véase [el debate](https://github.com/google/transit/pull/208).

**24 de marzo de 2020**<br/>

* Definido el campo text y añadido `tts_stop_name` a `stops.txt`.txt. Véase [el debate](https://github.com/google/transit/pull/49).

**5 de febrero de 2020**<br/>

* Añadidos `route_types` de trolebús y monorraíl. Véase [discusión](https://github.com/google/transit/pull/174).

**9 de enero de 2020**<br/>

* Añadido `translations.txt`. Véase [discusión](https://github.com/google/transit/pull/180).

**26 de diciembre de 2019**<br/>

* Actualizadas las definiciones de tranvía y teleférico en `route_type`. Ver [discusión](https://github.com/google/transit/pull/186).

**20 de diciembre de 2019**<br/>

* Añadido `attributions.txt`.txt. Véase [discusión](https://github.com/google/transit/pull/192).

**26 de agosto de 2019**<br/>

* Especificado que `stop_lat` y `stop_lon` deben situarse donde los pasajeros esperan para subir al vehicle. Véase [discusión](https://github.com/google/transit/pull/179).

**9 de julio de 2019**<br/>

* Añadidas las mejores prácticas para las time arrival y departure. Ver [discusión](https://github.com/google/transit/pull/165).
* Se han añadido las prácticas recomendadas para las señales de cabeza. Ver [discusión](https://github.com/google/transit/pull/167).
* Añadidas las mejores prácticas de `stop_id`. Véase [el debate](https://github.com/google/transit/pull/169).

**25 de junio de 2019**<br/>

* Aclarada la relación entre los puntos de Shape y las paradas. Véase [el debate](https://github.com/google/transit/pull/39).

**4 de abril de 2019**<br/>

* Añadido el campo `platform_code` en `stops.txt`. Véase [el debate](https://github.com/google/transit/pull/146).

**27 de marzo de 2019**<br/>

* Añadidos `pathways.txt`.txt y `levels.txt`. Véase [el debate](https://github.com/google/transit/pull/143).

**6 de febrero de 2019**<br/>

* Cambios editoriales y de formato para mayor claridad. Véase [el debate](https://github.com/google/transit/pull/120).

**2 de octubre de 2018**<br/>

* Tipos de campo factorizados. Ver [discusión](https://github.com/google/transit/pull/104).

**14 de septiembre de 2018**<br/>

* Añadido el concepto "Conditionally required". Véase [discusión](https://github.com/google/transit/pull/100).

**4 de septiembre de 2018**<br/>

* Unificadas las definiciones de `agency_lang` y `feed_lang`. Véase [discusión](https://github.com/google/transit/pull/98).

**27 de agosto de 2018**<br/>

* Actualizado `CHANGES.md` y fecha de la última revisión. Véase [la discusión](https://github.com/google/transit/pull/99).

**22 de agosto de 2018**<br/>

* Añadidos los campos `feed_contact_email` y `feed_contact_url` en el archivo `feed_info.txt`. Ver [discusión](https://github.com/google/transit/pull/31).

**11 de diciembre de 2017**<br/>

* Añadido `route_sort_order` a `routes.txt`. Véase [el debate](https://github.com/google/transit/pull/83).

**15 de marzo de 2017**<br/>

* Aclarado que el voto de un proponente no cuenta para el total. Ver [discusión](https://github.com/google/transit/pull/50).
* Especificado que antes de llamar a votación, al menos un productor GTFS y un consumidor GTFS deberían implementar el cambio propuesto. Ver [discusión](https://github.com/google/transit/pull/46).

**7 de febrero de 2017**<br/>

* Aclarada la relación entre `block_id` y `service_id`. Véase [discusión](https://github.com/google/transit/pull/44).
* Aclarado que el servicio basado en frecuencias comienza en la departure vehicle. Véase [el debate](https://github.com/google/transit/pull/42).
* Aclaración de las descripciones de `stop_id` y `stop_code`. Véase [el debate](https://github.com/google/transit/pull/40).

**11 de diciembre de 2017**<br/>

* Añadido el campo `route_sort_order` en el archivo `routes.txt`. Véase [el debate](https://github.com/google/transit/pull/83).

**27 de noviembre de 2016**<br/>

* Añadida la entrada a la estación como `stop.location_type`. Véase [el debate](https://github.com/google/transit/pull/30).

**2 de septiembre de 2016**<br/>

* Actualizada la documentación para añadir `agency_id` en `fare_attributes.txt`. Véase [el debate](https://github.com/google/transit/pull/27).

**16 de marzo de 2016**<br/>

* Transición de la documentación GTFS a Github en <https://github.com/google/transit>.

**3 de febrero de 2016**<br/>

* Añadido `agency_email` a `agency.txt` txt propuesta a spec: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

**2 de febrero de 2015**<br/>

* Añadida la propuesta stop_times.txt 'timepoint' a las especificaciones: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

**17 de febrero de 2014**<br/>

* Añadida la propuesta trips.txt 'bikes_allowed' a la especificación: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

**15 de octubre de 2012**<br/>

Añadida la propuesta trips.txt 'wheelchair_accessible' a la especificación: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**20 de junio de 2012**<br/>

* Añadida propuesta 'wheelchair_boarding' a la especificación: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2 de febrero de 2012**<br/>

* Añadida la propuesta 'stop_timezone' a la especificación: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)

**18 de enero de 2012**<br/>

* Migración de la documentación de la antigua code.google.com a su nueva ubicación en developers.google.com.

**26 de septiembre de 2011**<br/>

* Añadida la propuesta 'feed_info' a la especificación: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

**6 de septiembre de 2011**<br/>

* Añadida la propuesta 'agency_fare_url' a la especificación: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
* Propuesta 'exact_times' añadida a la especificación: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

**30 de marzo de 2009**<br/>

* Una nueva sección sobre cómo hacer público un feed de tránsito. Esto no se discutió previamente en el grupo, porque no era estrictamente un cambio en cómo se interpretan o escriben los datos. Sin embargo, algunos de los miembros de Google pensaron que sería informativo incluir un debate sobre los usos de GTFS ajenos a Google, ya que cada vez hay más aplicaciones que pueden utilizar datos GTFS.
* Aclaraciones sobre el formato CSV: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk)
* Orientación adicional sobre cómo elegir colores contrastados en las descripciones de los campos route_color y route_text_color.
* trip_short_name, según lo propuesto y probado en estos hilos: a y b.
* Corrección de un error menor en los datos de ejemplo incluidos al end del documento (dando a la parada S7 la parent_station S8).
* Añadida la información "agency_lang" a los datos de muestra al end del documento, como sugirió Marcy durante el periodo de comentarios: [debate](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0).
* Se ha actualizado el enlace a la fuente GTFS de OCTA en la barra lateral.
* Véase [el resumen original](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw).

**26 de febrero de 2009**<br/>

* Se han eliminado la mayoría de las instrucciones de envío de feeds específicas de Google, ya que actualmente existen muchas otras aplicaciones que consumen datos GTFS.
* Se ha corregido un enlace roto en la barra lateral al feed público de la OCTA del Condado de Orange.

**7 de agosto de 2008**<br/>

* Se ha restaurado el campo stop_url, que se omitió accidentalmente en la versión del 6 de agosto.
* Añadido agency_phone a los datos de muestra
* Se ha añadido una mención al acuerdo de uso de datos al enviar un feed a Google.

**6 de agosto de 2008**<br/>

* Añadido el archivo transfers.txt, que permite a los editores de feeds proporcionar pistas sobre el comportamiento de transferencia preferido ([propuesta original](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw)) .
* Se han añadido los campos location_type y parent_station a stops.txt, lo que permite agrupar las paradas en estaciones ([propuesta original](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw)).
* Añadido el campo agency_phone para proporcionar el número de teléfono de voz de una agencia ([propuesta original](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA))
* Se ha añadido la sección "Pruebe sus feeds", en la que se mencionan las herramientas de prueba de código abierto.
* Se han añadido aclaraciones sobre el formato CSV, agency_timezone, agency_lang, route_color, route_text_color, arrival_time, departure_time, calendar.txt frente a calendar_dates.txt, tablas de tarifas y frequencies.txt.
* Se ha añadido un enlace al documento histórico de feeds y se han corregido algunos enlaces a feeds públicos.
* Se han actualizado las imágenes de ejemplo para mostrar la interfaz de usuario actual de Google Maps.
* Actualización/corrección de datos de ejemplo en el documento

**29 de febrero de 2008**<br/>

* Se ha añadido el campo stop_code en stops.txt para permitir la especificación de códigos de parada orientados al usuario ([propuesta original](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc)).
* Aclaradas las descripciones de route_short_name y route_long_name en routes.txt
* Se han aclarado las descripciones de arrival_time y departure_time en stop_times.txt.
* Corrección de erratas en la sección Datos de muestra

**20 de noviembre de 2007**<br/>

* Aclarada la descripción de block_id
* Se ha modificado el lenguaje para restar importancia a Google Transit (ya que las aplicaciones ajenas a Google utilizan GTFS y las rutas de tránsito son ahora una función integrada en Google Maps) y para corregir varios errores tipográficos.
* Se han actualizado las capturas de pantalla de ejemplo para reflejar la presentación de los campos GTFS en la interfaz de usuario actual de Google Maps.
* Se ha actualizado la dirección de correo electrónico de contacto de Google para los proveedores de datos de tránsito.
* Formato actualizado

**5 de octubre de 2007**<br/>

* Se han modificado stop_sequence y shape_pt_sequence para permitir cualquier número entero no negativo creciente.
* Aclaración de las descripciones y corrección de erratas

**Puede 31, 2007**<br/>

* Estilo de página actualizado, HTML más limpio y accesible.
* Se han añadido enlaces a ejemplos de fuentes públicas y otros sitios útiles.
* Eliminados ejemplos de descripciones de campos individuales

**9 de abril de 2007**<br/>

* Se ha añadido una sección sobre el [envío de feeds](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle).
* Añadido el [feed de ejemplo de una agencia de transporte](https://developers.google.com/transit/gtfs/examples/gtfs-feed).
* Añadida la nota de que calendar.txt puede omitirse si todas las fechas de servicio están definidas en calendar_dates.txt.
* El campo agency_id es opcional en los feeds que contienen una sola agencia. Esto permite que los feeds existentes sin agency_id sigan siendo válidos.
* Se ha añadido una especificación más completa de agency_url, stop_url y route_url, así como valores de ejemplo adicionales para estos campos.
* Se han añadido 6 (Góndola) y 7 (Funicular) como valores válidos de route_type.

**8 de marzo de 2007**<br/>

* Edición menor para mover el campo stop_url de stop_times.txt, donde se especificó incorrectamente en la actualización del 28 de febrero, a stops.txt, donde corresponde.

**5 de marzo de 2007**<br/>

* Edición menor para aclarar la descripción del campo route_long_name.

**28 de febrero de 2007**<br/>

* Adición de frequencies.txt para soporte de Schedule basados en headway.
* Ahora se permiten múltiples agencias en el mismo feed. También se ha añadido un nuevo campo agency_id en agencies.txt y routes.txt que permite especificar qué ruta es operada por qué agencia.
* Adición de URL por ruta y por parada.
* Adición del campo direction_id en trips.txt.
* Posibilidad de cambiar las cabeceras a mitad de trayecto añadiendo el campo stop_headsign en stop_times.txt.
* Soporte para colores de ruta con la adición de route_color opcional y route_text_color en routes.txt.
* Se ha eliminado la posibilidad de especificar paradas utilizando direcciones de calles. La versión anterior de la especificación permitía indicar la ubicación de una parada mediante una dirección en los campos stop_street, stop_city, stop_region, stop_postcode y stop_country. Ahora la ubicación de las paradas debe indicarse utilizando stop_lat para latitude y stop_lon para longitude, que son más útiles para la mayoría de las aplicaciones.
* Adición del tipo de vehicle de teleférico al campo route_type en routes.txt.
* Véase el resumen de los cambios en la [entrada original del blog Headway](https://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/).

**29 de noviembre de 2006**<br/>

* Añadida la compatibilidad con la información de Shape trip a través de shapes.txt
* Aclarada la definición de stop_sequence
* Marcados pickup_type y drop_off_type opcionales

**31 de octubre de 2006**<br/>

* Añadido soporte para información sobre tarifas
* Eliminadas las fechas de los nombres de archivos individuales
* Cambiadas las definiciones de los valores de route_type
* Permitir la publicación time de varios archivos de alimentación, siempre que sus periodos de servicio no se solapen.
* Corregido block_id en trips.txt para que estuviera correctamente marcado como Opcional
* Se ha observado que deben incluirse cabeceras de columna

**29 de septiembre de 2006**<br/>

* Edición menor para corregir un par de errores en los ejemplos.

**25 de septiembre de 2006**<br/>

* Versión inicial.
