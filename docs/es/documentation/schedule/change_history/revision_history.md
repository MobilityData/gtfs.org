# Calendario GTFS

### Historial de revisiones

#### Agosto de 2024
* Se modificó la presencia de stops.txt debido a los servicios bajo demanda. Ver [discusión](https://github.com/google/transit/pull/472).
* Se aclaró el uso previsto para el timepoint en stop_times.txt. Ver [discusión](https://github.com/google/transit/pull/474).
* Se agregó que se recomiendan los carteles de destino (Headsigns). Ver [discusión](https://github.com/google/transit/pull/485).

#### Julio de 2024
* Se actualizó los requisitos de prescencia de feed_info.txt. Ver [discusión](https://github.com/google/transit/pull/460).
* Se agregó que shapes.txt debería ser incluido. Ver [discusión](https://github.com/google/transit/pull/470).

#### Mayo de 2024 

 * Se agregó el campo `rule_priority` en `fare_leg_rules.txt`. Consulte la [discusión](https://github.com/google/transit/pull/418). 
 * Se aclaró la presencia de `stops.zone_id`. Consulte la [discusión](https://github.com/google/transit/pull/432). 
 
#### Abril 2024 
 * Se aclaró definición de producto tarifario. Consulte la [discusión](https://github.com/google/transit/pull/426). 
 
#### Marzo de 2024 
 * Se agregó GTFS Flex. Consulte la [discusión](https://github.com/google/transit/pull/433). 
 
#### Noviembre de 2023 
 * Mejores prácticas: agregue pautas de publicación de conjuntos de datos y recomendaciones prácticas para todos los archivos. Consulte la [discusión](https://github.com/google/transit/pull/406). 
 * Agregar networks.txt y route_networks.txt. Consulte la [discusión](https://github.com/google/transit/pull/405). 
 
#### Agosto de 2023 
 * Agregar fare_media_type= 1. Ver [discusión](https://github.com/google/transit/pull/385). 
 
#### Julio 2023 
 * Prohibir subcarpetas en archivos GTFS. Consulte la [discusión](https://github.com/google/transit/pull/379). 
 * Se agregaron tarifas variables por hora o día. Consulte la [discusión](https://github.com/google/transit/pull/357). 
 * Se aclaró la zona horaria implícita en stop_times.txt. Consulte la [discusión](https://github.com/google/transit/pull/378). 
 * Especificar los horarios de parada.shape_dist_traveled no debe exceder la distancia máxima de la forma del viaje. Consulte la [discusión](https://github.com/google/transit/pull/380). 
 * Mejores prácticas: agregar presencia recomendada. Consulte la [discusión](https://github.com/google/transit/pull/386). 
 
#### 14 de marzo de 2023 
 
 * Medios tarifarios agregados. Consulte la [discusión](https://github.com/google/transit/pull/355). 
 
#### 26 de julio de 2022 
 
 * Se agregaron transferencias de viaje a viaje con opción en el asiento. Consulte la [discusión](https://github.com/google/transit/pull/303). 
 
#### 17 de mayo de 2022 
 
* Implementación base GTFS-Fares v2. Consulte la [discusión](https://github.com/google/transit/pull/286). 
 
#### 22 de octubre de 2021 
 
 * Se agregaron campos de identificación primaria y extranjera. Consulte la [discusión](https://github.com/google/transit/pull/278). 
 
#### 05 de octubre de 2021 
 
 * Se agregaron traslados de viaje a viaje y de ruta a ruta. Consulte la [discusión](https://github.com/google/transit/pull/284). 
 
#### 15 de septiembre de 2021 
 
 * Las puertas de tarifa permitidas (pathway_mode=6) serán bidireccionales. Consulte la [discusión](https://github.com/google/transit/pull/276). 
 
#### 13 de septiembre de 2021 
 
 * Mejores prácticas actualizadas de `stop_name`. Consulte la [discusión](https://github.com/google/transit/pull/282). 
 
#### 27 de agosto de 2021 
 
 * Calendario GTFS actualizado a [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119). Consulte la [discusión](https://github.com/google/transit/pull/277). 
 
#### 4 de enero de 2021 
 
 * Descripción aclarada de `stop_times.stop_id`. Consulte la [discusión](https://github.com/google/transit/pull/258). 
 * Signos de campo positivos y distintos de cero definidos. Consulte la [discusión](https://github.com/google/transit/pull/251). 
 
#### 2 de octubre de 2020 
 
 * Se cambió el tipo de campo de `frequencies.headway_secs` de entero no negativo a positivo. Consulte la [discusión](https://github.com/google/transit/pull/249). 
 
#### 25 de mayo de 2020 
 
 * Definido `pathways.txt`, `levels.txt` y `attributions.txt` como tablas traducibles. Se agregaron recomendaciones para traducir valores `signposted_as` multilingües. Consulte la [discusión](https://github.com/google/transit/pull/220). 
 
#### 13 de mayo de 2020 
 
 * Se agregaron `continuous_pickup` y `continuous_drop_off` a `routes.txt` y `stop_times.txt`. Se cambió `shape_id` de "Opcional" a "Requerido condicionalmente". Consulte la [discusión](https://github.com/google/transit/pull/208). 
 
#### 24 de marzo de 2020 
 
 * Campo de conversión de texto a voz definido y agregado `tts_stop_name` a `stops.txt`. Consulte la [discusión](https://github.com/google/transit/pull/49). 
 
#### 5 de febrero de 2020 
 
 * Se agregaron trolebuses y monorrieles `route_types`. Consulte la [discusión](https://github.com/google/transit/pull/174). 
 
#### 9 de enero de 2020 
 
 * Se agregó `translations.txt`. Consulte la [discusión](https://github.com/google/transit/pull/180). 
 
#### 26 de diciembre de 2019 
 
 * Definiciones actualizadas para teleférico y elevador aéreo en `route_type`. Consulte la [discusión](https://github.com/google/transit/pull/186). 
 
#### 20 de diciembre de 2019 
 
 * Añadido `attributions.txt`. Consulte la [discusión](https://github.com/google/transit/pull/192). 
 
#### 26 de agosto de 2019 
 
 * Se especificó que `stop_lat` y `stop_lon` se coloquen donde los pasajeros esperan para abordar el vehículo. Consulte la [discusión](https://github.com/google/transit/pull/179). 
 
#### 9 de julio de 2019 
 
 * Se agregaron mejores prácticas de horarios de llegada y salida. Consulte la [discusión](https://github.com/google/transit/pull/165). 
 * Se agregaron mejores prácticas de letreros. Consulte la [discusión](https://github.com/google/transit/pull/167). 
 * Se agregaron las mejores prácticas de `stop_id`. Consulte la [discusión](https://github.com/google/transit/pull/169). 
 
#### 25 de junio de 2019 
 
 * Relación aclarada de puntos de forma y paradas. Consulte la [discusión](https://github.com/google/transit/pull/39). 
 
#### 4 de abril de 2019 
 
 * Se agregó el campo `platform_code` en `stops.txt`. Consulte la [discusión](https://github.com/google/transit/pull/146). 
 
#### 27 de marzo de 2019 
 
 * Se agregaron `pathways.txt` y `levels.txt`. Consulte la [discusión](https://github.com/google/transit/pull/143). 
 
#### 6 de febrero de 2019 
 
 * Cambios editoriales y de formato para mayor claridad. Consulte la [discusión](https://github.com/google/transit/pull/120). 
 
#### 2 de octubre de 2018 
 
 * Tipos de campos factorizados. Consulte la [discusión](https://github.com/google/transit/pull/104). 
 
#### 14 de septiembre de 2018 
 
 * Se agregó el concepto "Condicionalmente requerido". Consulte la [discusión](https://github.com/google/transit/pull/100). 
 
#### 4 de septiembre de 2018 
 
 * Unificadas las definiciones de `agency_lang` y `feed_lang`. Consulte la [discusión](https://github.com/google/transit/pull/98). 
 
#### 27 de agosto de 2018 
 
 * Actualizado `CHANGES.md` y última date de revisión. Consulte la [discusión](https://github.com/google/transit/pull/99). 
 
#### 22 de agosto de 2018 
 
 * Se agregaron los campos `feed_contact_email` y `feed_contact_url` en el archivo `feed_info.txt`. Consulte la [discusión](https://github.com/google/transit/pull/31). 
 
#### 11 de diciembre de 2017 
 
 * Se agregó `route_sort_order` a `routes.txt`. Consulte la [discusión](https://github.com/google/transit/pull/83). 
 
#### 15 de marzo de 2017 
 
 * Se aclaró que el voto de un proponente no cuenta para el total. Consulte la [discusión](https://github.com/google/transit/pull/50). 
 * Especificó que antes de convocar una votación, al menos un productor de GTFS y un consumidor de GTFS deben implementar el cambio propuesto. Consulte la [discusión](https://github.com/google/transit/pull/46). 
 
#### 7 de febrero de 2017 
 
 * Relación aclarada de `block_id` y `service_id`. Consulte la [discusión](https://github.com/google/transit/pull/44). 
 * Se aclaró que el servicio basado en frecuencia comienza en la salida del vehículo. Consulte la [discusión](https://github.com/google/transit/pull/42). 
 * Descripciones aclaradas de `stop_id` y `stop_code`. Consulte la [discusión](https://github.com/google/transit/pull/40). 
 
#### 11 de diciembre de 2017 
 
 * Se agregó el campo `route_sort_order` en el archivo `routes.txt`. Consulte la [discusión](https://github.com/google/transit/pull/83). 
 
#### 27 de noviembre de 2016 
 
 * Se agregó la entrada de la estación como `stops.location_type`. Consulte la [discusión](https://github.com/google/transit/pull/30). 
 
#### 2 de septiembre de 2016 
 
 * Documentación actualizada para agregar `agency_id` en `fare_attributes.txt`. Consulte la [discusión](https://github.com/google/transit/pull/27). 
 
#### 16 de marzo de 2016 
 
 * Transición de la documentación GTFS a Github en https://github.com/google/transit
 
#### 3 de febrero de 2016 

* Se agregó `agency_email` a la propuesta `agency.txt` para especificar: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA) 
 
#### 2 de febrero de 2015 
 
 * Se agregó la propuesta de ’punto de tiempo’ stop_times.txt a la especificación: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah- J9JP2rJY) 
 
#### 17 de febrero de 2014 
 
 * Se agregó la propuesta trips.txt ’bikes_allowed’ para especificar: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs) 
 
#### 15 de octubre de 2012 
 
 Se agregó la propuesta de trips.txt ’accesible para sillas de ruedas’ para especificar: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4) 
 
#### 20 de junio de 2012 
 
 * Se agregó la propuesta ’wheelchair_boarding’ a la especificación: [discusión](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4) 
 
#### 2 de febrero de 2012 
 
 * Se agregó la propuesta ’stop_timezone’ a la especificación: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4) 
 
#### 18 de enero de 2012 
 
 * Documentación migrada del antiguo code.google.com a su nueva ubicación en desarrolladores.google.com. 
 
#### 26 de septiembre de 2011 
 
 * Se agregó la propuesta ’feed_info’ a la especificación: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw ) 
 
#### 6 de septiembre de 2011 
 
 * Se agregó la propuesta ’agency_fare_url’ a la especificación: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE) 
 * Se agregó la propuesta ’exact_times’ a la especificación: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs) 
 
#### 30 de marzo de 2009 
 
 * Una nueva sección sobre cómo poner a disposición del público un feed de tránsito. Esto no se discutió previamente en el grupo porque no era estrictamente un cambio en la forma en que se interpretan o escriben los datos. Sin embargo, algunas personas de Google pensaron que sería informativo incluir una discusión sobre los usos de GTFS fuera de Google, ya que hay un número cada vez mayor de aplicaciones que pueden hacer uso de datos formateados en GTFS. 
 * Aclaraciones sobre formato CSV: [discusión](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk). 
 * Orientación adicional sobre cómo elegir colores contrastantes en las descripciones de los campos route_color y route_text_color. 
 * trip_short_name, como se propone y prueba en estos hilos: a y b. 
 * Una solución para un error menor en los datos de muestra incluidos al final del documento (dando a la parada S7 la parent_station S8). 
 * Se agregó información "agency_lang" a los datos de muestra al final del documento, como sugirió Marcy durante el período de comentarios: [discusión](https://groups.google.com/forum/#!topic/gtfs- cambios/5qP1kDUFqx0). 
 * Se actualizó el enlace al feed GTFS de OCTA en la barra lateral 
 * Ver [resumen original](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw). 
 
#### 26 de febrero de 2009 
 
 * Se eliminaron la mayoría de las instrucciones de envío de feeds específicas de Google, ya que hay muchas otras aplicaciones que consumen datos GTFS en este momento. 
 * Se corrigió un enlace roto en la barra lateral al feed público de OCTA del Condado de Orange. 
 
#### 7 de agosto de 2008 
 
 * Se restauró el campo stop_url, que se omitió accidentalmente en la versión del 6 de agosto 
 * Se agregó Agency_phone a los datos de muestra 
 * Se agregó una mención del acuerdo de uso de datos al enviar un feed a Google
 
#### 6 de agosto de 2008 
 
 * Se agregó el archivo transfers.txt, que permite a los editores del feed brindar sugerencias sobre el comportamiento de transferencia preferido ([propuesta original](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw)) 
 * Se agregaron los campos tipo_ubicación y estación_parental a stops.txt, lo que permite agrupar los puntos de parada en estaciones ([propuesta original](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw)) 
 * Campo de teléfono de agencia agregado para proporcionar el número de teléfono de voz de una agencia ([propuesta original](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA)) 
 * Se agregó la sección "Probando sus feeds" que menciona herramientas de prueba de código abierto 
 * Se agregaron aclaraciones sobre el formato CSV, zona_hora_agencia, idioma_agencia, color_ruta, color_texto_ruta, hora_llegada, hora_salida, calendar.txt frente a calendar_dates.txt, tablas de tarifas y frequencies.txt 
 * Se agregó un enlace al documento del historial de feeds y se corrigieron algunos enlaces de feeds públicos 
 * Imágenes de ejemplo actualizadas para representar la interfaz de usuario actual de Google Maps 
 * Actualizado/reparado datos de muestra en el documento
 
#### 29 de febrero de 2008 
 
 * Se agregó el campo stop_code en stops.txt para permitir la especificación de códigos de parada orientados al conductor ([propuesta original](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc)) 
 * Se aclaró las descripciones de route_short_name y route_long_name en routes.txt 
 * Se aclaró las descripciones de hora_de_llegada y hora_de_salida en stop_times.txt 
 * Se corrigieron errores tipográficos en la sección Datos de muestra
 
#### 20 de noviembre de 2007 
 
 * Descripción aclarada de block_id 
 * Se cambió el idioma para quitar énfasis a Google Transit (ya que las aplicaciones que no son de Google usan GTFS y transit el enrutamiento ahora es una característica integrada de Google Maps) y para corregir varios errores tipográficos 
 * Capturas de pantalla de ejemplo actualizadas para reflejar la presentación de los campos GTFS en la interfaz de usuario actual de Google Maps 
 * Se actualizó la dirección de correo electrónico de contacto de Google para proveedores de datos de tránsito 
 * Formato actualizado
 
#### 5 de octubre de 2007 
 
 * Se modificó stop_sequence y shape_pt_sequence para permitir números enteros crecientes no negativos 
 * Descripciones aclaradas y errores tipográficos corregidos
 
#### Mayo 31, 2007 
 
 * Estilo de página actualizado, HTML más limpio y accesible 
 * Se agregaron enlaces a ejemplos de fuentes públicas y otros sitios útiles 
 * Ejemplos eliminados de descripciones de campos individuales
 
#### 9 de abril, 2007 
 
 * Se agregó una sección sobre [enviar un feed](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle). 
 * Se agregó el [feed de Agencia de tránsito de demostración de ejemplo](https://developers.google.com/transit/gtfs/examples/gtfs-feed). 
 * Se agregó una nota de que calendar.txt se puede omitir si todas las fechas de servicio están definidas en calendar_dates.txt. 
 * Se hizo opcional el campo id_agencia en feeds que contienen solo una agencia. Esto permite que los feeds existentes sin id_agencia sigan siendo válidos. 
 * Se agregó una especificación más completa de Agency_url, stop_url y route_url, y valores de ejemplo adicionales para esos campos. 
 * Se agregaron 6 (Góndola) y 7 (Funicular) como valores válidos de tipo_ruta. 
 
#### 8 de marzo de 2007 
 
 * Edición menor para mover el campo stop_url de stop_times.txt, donde se especificó incorrectamente en la actualización del 28 de febrero, a stops.txt, donde pertenece. 
 
#### 5 de marzo de 2007 
 
 * Edición menor para aclarar la descripción del campo route_long_name. 
 
#### 28 de febrero de 2007 
 
 * Adición de frequencies.txt para compatibilidad con horarios basados ​​en avances. 
 * Ahora se permiten varias agencias en el mismo feed. También se agregó un nuevo campo agencia_id en agencias.txt y routes.txt que le permite especificar qué ruta es operada por cada agencia. 
 * Adición de URL por ruta y por parada. 
 * Adición del campo direction_id en trips.txt. 
 * Soporte para cambios de cabecera a mitad de viaje con la adición del campo stop_headsign en stop_times.txt. 
 * Soporte para colores de ruta con la adición de route_color y route_text_color opcionales en routes.txt. 
 * Se eliminó la capacidad de especificar paradas usando direcciones de calles. La versión anterior de la especificación le permitía proporcionar la ubicación de una parada de tránsito utilizando una dirección postal en los campos stop_street, stop_city, stop_region, stop_postcode y stop_country. Ahora las ubicaciones de las paradas deben indicarse usando stop_lat para latitud y stop_lon para longitud, que son más útiles para la mayoría de las aplicaciones. 
 * Adición del tipo de vehículo del teleférico para el campo tipo_ruta en routes.txt. 
 * Consulte el resumen original de los cambios [publicación del blog de Headway](http://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/). 
 
#### 29 de noviembre de 2006 
 
 * Se agregó soporte para información de forma de viaje a través de shapes.txt 
 * Se aclaró la definición de stop_sequence 
 * pickup_type y drop_off_type marcados opcionales## 31 de octubre de 2006 
 
 * Se agregó soporte para información de tarifas 
 * Se eliminaron fechas de nombres de archivos individuales 
 * Se cambiaron las definiciones de valores de tipo de ruta 
 * Se permitió publicar múltiples archivos de alimentación al mismo tiempo, siempre y cuando ya que sus períodos de servicio no se superponían 
 * Se corrigió block_id en trips.txt para que se marcara correctamente como Opcional 
 * Se tomó nota de que se deben incluir encabezados de columna
 
#### 29 de septiembre de 2006 
 
 * Edición menor para corregir un par de errores en los ejemplos. 
 
#### 25 de septiembre de 2006 
 
 * Versión inicial.