## Referencia de General Transit Feed Specification 
 
 **Revisado el 16 de agosto de 2024. Consulte [Historial de revisiones](../change_history/revision_history) para obtener más detalles.** 
 
 Este documento define el formato y la estructura de los archivos que componen un conjunto de datos GTFS. 
 
## Índice de contenidos 
 
 1. [Convenciones del documento](#convenciones-de-documentos) 
 2. [Archivos de conjunto de datos](#archivos-de-conjunto-de-datos) 
 3. [Requisitos de archivo](#requisitos-de-archivo) 
 4. [Publicación de conjuntos de datos y prácticas generales](#publicacion-de-conjuntos-de-datos-y-practicas-generales) 
 5. [Definiciones de campo](#definiciones-de-campo) 
    - [agency.txt](#agencytxt) 
    - [stops.txt](#stopstxt) 
    - [routes.txt](#routestxt) 
    - [trips.txt](#tripstxt) 
    - [parada\_times.txt](#stop_timestxt) 
    - [calendar.txt](#calendartxt) 
    - [calendar\_dates.txt](#calendar_datestxt) 
    - [fare\_attributes.txt](#fare_attributestxt) 
    - [fare\_rules.txt](#fare_rulestxt) 
    - [timeframes.txt](#timeframestxt) 
    - [fare\_media.txt](#fare_mediatxt) 
    - [fare\_products.txt](#fare_productstxt) 
    - [fare\ _leg\_rules.txt](#fare_leg_rulestxt) 
    - [fare\_transfer\_rules.txt](#fare_transfer_rulestxt) 
    - [areas.txt](#areastxt) 
    - [stop_areas.txt](#stop_areastxt) 
    - [networks.txt](#networkstxt) 
    - [route_networks.txt](#route_networkstxt) 
    - [shapes.txt](#shapestxt) 
    - [frequencies.txt](#frequenciestxt) 
    - [transfers.txt](#transferstxt) 
    - [pathways.txt](#pathwaystxt) 
    - [levels.txt](#levelstxt) 
    - [location_groups.txt](#location_groupstxt) 
    - [location_group_stops.txt](#location_group_stopstxt) 
    - [locations.geojson](#locationsgeojson) 
    - [booking_rules.txt](#booking_rulestxt) 
    - [translations.txt](#translationstxt) 
    - [feed\ _info.txt](#feed_infotxt) 
    - [attributions.txt](#attributionstxt) 
 
## Convenciones de documentos 
 Las palabras clave "DEBE", "NO DEBE", "OBLIGATORIO", "DEBERÁ", “NO DEBERÁ", "DEBERÍA", "NO DEBERÍA", "RECOMENDADO", "PUEDE" y "OPCIONAL" en este documento deben interpretarse como se describe en [RFC 2119](https://tools.ietf.org/html/rfc2119). 
 
 
### Definiciones de términos 
 
 Esta sección define los términos que se utilizan en este documento. 
 
 * **Conjunto de datos**: un conjunto completo de archivos definidos por esta referencia de especificación. La modificación del conjunto de datos crea una nueva versión del conjunto de datos. Los conjuntos de datos deben publicarse en una URL pública y permanente, incluido el nombre del archivo zip. (por ejemplo, https://www.agency.org/gtfs/gtfs.zip). 
 * **Registro**: una estructura de datos básica compuesta por varios valores de campo diferentes que describen una sola entidad (por ejemplo, agencia de tránsito, parada, ruta, etc.). Representado, en una tabla, como una fila. 
 * **Campo** - Una propiedad de un objeto o entidad. Representado, en una tabla, como una columna. El campo existe si se agrega en un archivo como encabezado. Puede tener o no valores de campo definidos. 
 * **Valor de campo**: una entrada individual en un campo. Representado, en una tabla, como una sola celda. 
 * **Día de servicio**: un día de servicio es un período de tiempo utilizado para indicar la programación de rutas. La definición exacta de día de servicio varía de una agencia a otra, pero los días de servicio a menudo no se corresponden con los días calendario. Un día de servicio puede exceder las 24:00:00 si el servicio comienza un día y finaliza el día siguiente. Por ejemplo, un servicio que funciona desde las 08:00:00 del viernes hasta las 02:00:00 del sábado podría indicarse que funciona desde las 08:00:00 hasta las 26:00:00 en un solo día de servicio. 
 * **Campo de texto a voz**: el campo debe contener la misma información que su campo principal (al que recurre si está vacío). Está destinado a ser leído como texto a voz, por lo tanto, se debe eliminar la abreviatura ("St" debe leerse como "Calle" o "Santo"; "Isabel I" debe ser "Isabel la primera") o debe leerse tal como está ("Aeropuerto JFK" se dice abreviado). 
 * **Tramo**: viaje en el que un pasajero sube y baja entre un par de ubicaciones posteriores a lo largo de un viaje. 
 * **Viaje**: viaje general desde el origen hasta el destino, incluidos todos los tramos y traslados intermedios. 
 * **Subviaje** - Dos o más tramos que componen un subconjunto de un viaje. 
 * **Producto tarifario**: productos tarifarios adquiribles que se pueden utilizar para pagar o validar el viaje. 
 
### Presencia 
 Condiciones de presencia aplicables a campos y archivos: 
 
 * **Obligatorio** - El campo o archivo debe estar incluido en el conjunto de datos y contener un valor válido para cada registro. 
 * **Opcional** - El campo o archivo puede omitirse del conjunto de datos. 
 * **Condicionalmente Obligatorio** - El campo o archivo debe incluirse bajo las condiciones descritas en la descripción del campo o archivo. 
 * **Condicionalmente Prohibido** - El campo o archivo no debe incluirse bajo las condiciones descritas en la descripción del campo o archivo. 
 * **Recomendado**: el campo o archivo puede omitirse del conjunto de datos, pero es una buena práctica incluirlo. Antes de omitir este campo o archivo, se debe evaluar cuidadosamente la mejor práctica y se deben comprender todas las implicaciones de la omisión. 
 
### Tipos de campo
- **Color** - Un color codificado como un número hexadecimal de seis dígitos. Consulte [https://htmlcolorcodes.com](https://htmlcolorcodes.com) para generar un valor válido (no se debe incluir el "#" inicial).<br> *Ejemplo: `FFFFFF` para blanco, `000000` para negro o `0039A6` para las líneas A,C,E en NYMTA.* 
 - **Código de moneda** - Un código de moneda alfabético ISO 4217. Para obtener la lista de monedas actuales, consulte [https://en.wikipedia.org/wiki/ISO_4217#Active\_codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes).<br> *Ejemplo: `CAD` para dólares canadienses, `EUR` para euros o `JPY` para yenes japoneses.* 
 - **Cantidad de moneda** - Un valor decimal que indica una cantidad de moneda. El número de decimales se especifica en [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) para el código de moneda adjunto. Todos los cálculos financieros deben procesarse como decimal, moneda u otro tipo equivalente adecuado para cálculos financieros según el lenguaje de programación utilizado para consumir datos. Se desaconseja procesar montos de moneda como float debido a ganancias o pérdidas de dinero durante los cálculos. 
 - **Fecha** - Día de servicio en formato AAAAMMDD. Dado que la hora dentro de un día de servicio puede ser superior a las 24:00:00, un día de servicio puede contener información para los días siguientes.<br> *Ejemplo: `20180913` para el 13 de septiembre de 2018.* 
 - **Email** - Una dirección de correo electrónico.<br> *Ejemplo: `example@example.com`* 
 - **Enum** - Una opción de un conjunto de constantes predefinidas definidas en la columna "Descripción".<br> *Ejemplo: El campo `route_type` contiene un `0` para tranvía, un `1` para metro...* 
 - **ID** - El valor de un campo ID es un ID interno que no debe mostrarse a jinetes, y es una secuencia de caracteres UTF-8. Se recomienda utilizar únicamente caracteres ASCII imprimibles. Una identificación se denomina "identificación única" cuando debe ser única dentro de un archivo. A menudo se hace referencia a los ID definidos en un archivo.txt en otro archivo.txt. Los ID que hacen referencia a un ID en otra tabla se denominan "ID extranjero".<br> *Ejemplo: El campo `stop_id` en [stops.txt](#stopstxt) es una "ID única". El campo `parent_station` en [stops.txt](#stopstxt) es una "ID extranjera que hace referencia a `stops.stop_id`".* 
 - **Código de idioma** - Un código de idioma IETF BCP 47. Para obtener una introducción a IETF BCP 47, consulte [http://www.rfc-editor.org/rfc/bcp/bcp47.txt](http://www.rfc-editor.org/rfc/bcp/bcp47.txt) y [http://www.w3.org/International/articles/language-tags/](http ://www.w3.org/International/articles/language-tags/).<br> *Ejemplo: `en` para inglés, `en-US` para inglés americano o `de` para alemán.* 
 - **Latitud** - Latitud WGS84 en grados decimales. El valor debe ser mayor o igual a-90,0 y menor o igual a 90,0. *<br> Ejemplo: `41.890169` para el Coliseo de Roma.* 
 - **Longitud** - Longitud WGS84 en grados decimales. El valor debe ser mayor o igual a-180,0 y menor o igual a 180,0.<br> *Ejemplo: `12.492269` para el Coliseo de Roma.* 
 - **Float** - Un número de punto flotante. 
 - **Entero** - Un número entero. 
 - **Número de teléfono** - Un número de teléfono. 
 - **Hora** - Hora en formato HH:MM:SS (también se acepta H:MM:SS). El tiempo se mide a partir del "mediodía menos 12 h" del día de servicio (efectivamente, medianoche, excepto los días en los que se producen cambios de horario de verano). Para los horarios que ocurren después de la medianoche del día del servicio, ingrese la hora como un valor mayor que 24:00:00 en HH:MM:SS.<br> *Ejemplo: `14:30:00` para las 2:30 p.m.o `25:35:00` para las 1:35 a.m.del día siguiente.* 
 - **Text** - Una string de caracteres UTF-8, que está destinado a ser mostrado y que, por lo tanto, debe ser legible por humanos. 
 - **Zona horaria** - Zona horaria TZ de [https://www.iana.org/time-zones](https://www.iana.org/time-zones). Los nombres de zonas horarias nunca contienen el carácter de espacio, pero pueden contener un guión bajo. Consulte [http://en.wikipedia.org/wiki/List\_of\_tz\_zones](http://en.wikipedia.org/wiki/List\_of\_tz\_zones) para obtener una lista de valores válidos..<br> *Ejemplo: `Asia/Tokyo`, `America/Los_Angeles` o `Africa/Cairo`.* 
 - **URL** - Una URL completa que incluye http://o https://, y cualquier enlace especial Los caracteres de la URL deben tener caracteres de escape correctamente. Consulte lo siguiente [http://www.w3.org/Addressing/URL/4\_URI\_Recommentations.html](http://www.w3.org/Addressing/URL/4\_URI\_Recommentations.html) para una descripción de cómo crear valores de URL completos. 
 
### Signos de campo 
 Signos aplicables a tipos de campo flotantes o enteros: 
 
 * **No negativo** - Mayor o igual a 0. 
 * **Diferente de cero** - No es igual a 0. 
 * **Positivo** - Mayor que 0. 
 
 _Ejemplo: **float no negativo ** - Un número de punto flotante mayor o igual a 0._ 
 
### Atributos del conjunto de datos 

La **clave principal** de un conjunto de datos es el campo o combinación de campos que identifican de forma única una fila. `Clave principal (*)` se utiliza cuando todos los campos proporcionados para un archivo se utilizan para identificar de forma única una fila. `Clave principal (none)` significa que el archivo permite solo una fila. 
 
 _Ejemplo: los campos `trip_id` y `stop_sequence` constituyen la clave principal de [stop_times.txt](#stop_timestxt)._ 
 
## Archivos de conjunto de datos 
 
 Esta especificación define los siguientes archivos: 

 | Nombre de archivo | Presencia | Descripción | 
 |------|------|------| 
 | [agency.txt](#agencytxt) | **Obligatorio** | Agencias de tránsito con servicio representado en este conjunto de datos. | 
 | [stops.txt](#stopstxt) | **Condicionalmente Obligatorio** | Paradas donde los vehículos recogen o dejan a los pasajeros. También define estaciones y entradas de estaciones. <br><br>Condicionalmente Obligatorio:<br> - Opcional si se definen zonas que responden a la demanda en [locations.geojson](#locationsgeojson). <br> - **Obligatorio** en caso contrario. | 
 | [routes.txt](#routestxt) | **Obligatorio** | Rutas de tránsito. Una ruta es un grupo de viajes que se muestran a los pasajeros como un único servicio. | 
 | [trips.txt](#tripstxt) | **Obligatorio** | Viajes para cada ruta. Un viaje es una secuencia de dos o más paradas que ocurren durante un período de tiempo específico. | 
 | [stop_times.txt](#stop_timestxt) | **Obligatorio** | Horas de llegada y salida de un vehículo a las paradas para cada viaje. | 
 | [calendar.txt](#calendartxt) | **Condicionalmente Obligatorio** | Fechas de Servicio especificadas mediante un cronograma semanal con fechas de inicio y finalización.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** a menos que todas las fechas de servicio estén definidas en [calendar_dates.txt](#calendar_datestxt).<br> - Opcional en caso contrario. | 
 | [calendar_dates.txt](#calendar_datestxt) | **Condicionalmente Obligatorio** | Excepciones para los servicios definidos en [calendar.txt](#calendartxt).<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si se omite [calendar.txt](#calendartxt). En cuyo caso [calendar_dates.txt](#calendar_datestxt) debe contener todas las fechas de servicio.<br> - Opcional en caso contrario. | 
 | [fare_attributes.txt](#fare_attributestxt) | Opcional | Información de tarifas para las rutas de una agencia de tránsito. | 
 | [fare_rules.txt](#fare_rulestxt) | Opcional | Reglas para aplicar tarifas por itinerarios. | 
 | [timeframes.txt](#timeframestxt) | Opcional | Períodos de fecha y hora que se utilizarán en las reglas de tarifas para tarifas que dependen de factores de date y hora. | 
 | [fare_media.txt](#fare_mediatxt) | Opcional | Describir los medios tarifarios que se pueden emplear para utilizar productos tarifarios.<br><br> El archivo [fare_media.txt](#fare_mediatxt) describe conceptos que no están representados en [fare_attributes.txt](#fare_attributestxt) y [fare_rules.txt](#fare_rulestxt). Como tal, el uso de [fare_media.txt](#fare_mediatxt) es completamente independiente de los archivos [fare_attributes.txt](#fare_attributestxt) y [fare_rules.txt](#fare_rulestxt). | 
 | [fare_products.txt](#fare_productstxt) | Opcional | Describir los diferentes tipos de billetes o tarifas que pueden adquirir los pasajeros.<br><br> El archivo [fare_products.txt](#fare_productstxt) describe productos de tarifas que no están representados en [fare_attributes.txt](#fare_attributestxt) y [fare_rules.txt](#fare_rulestxt). Como tal, el uso de [fare_products.txt](#fare_productstxt) es completamente independiente de los archivos [fare_attributes.txt](#fare_attributestxt) y [fare_rules.txt](#fare_rulestxt). | 
 | [fare_leg_rules.txt](#fare_leg_rulestxt) | Opcional | Reglas de tarifas para tramos individuales de viaje.<br><br> El archivo [fare_leg_rules.txt](#fare_leg_rulestxt) proporciona un método más detallado para modelar estructuras de tarifas. Como tal, el uso de [fare_leg_rules.txt](#fare_leg_rulestxt) es completamente independiente de los archivos [fare_attributes.txt](#fare_attributestxt) y [fare_rules.txt](#fare_rulestxt). | 
 | [fare_transfer_rules.txt](#fare_transfer_rulestxt) | Opcional | Normas tarifarias para traslados entre tramos de viaje.<br><br> Junto con [fare_leg_rules.txt](#fare_leg_rulestxt), el archivo [fare_transfer_rules.txt](#fare_transfer_rulestxt) proporciona un método más detallado para modelar estructuras de tarifas. Como tal, el uso de [fare_transfer_rules.txt](#fare_transfer_rulestxt) es completamente independiente de los archivos [fare_attributes.txt](#fare_attributestxt) y [fare_rules.txt](#fare_rulestxt). | 
 | [areas.txt](#areastxt) | Opcional | Agrupación zonal de localizaciones. | 
 | [stop_areas.txt](#stop_areastxt) | Opcional | Reglas para asignar paradas a áreas. | 
 | [networks.txt](#networkstxt) | **Condicionalmente Prohibido** | Agrupación de redes de rutas.<br><br> Condicionalmente Prohibido:<br> - **Prohibido** si `network_id` existe en [routes.txt](#routestxt).<br> - Opcional en caso contrario. | 
 | [route_networks.txt](#route_networkstxt) | **Condicionalmente Prohibido** | Reglas para asignar rutas a redes.<br><br> Condicionalmente Prohibido:<br> - **Prohibido** si `network_id` existe en [routes.txt](#routestxt).<br> - Opcional en caso contrario. | 
 | [shapes.txt](#shapestxt) | Opcional | Reglas para mapear rutas de tránsito de vehículos, a veces denominadas alineaciones de rutas. | 
 | [frequencies.txt](#frequenciestxt) | Opcional | Intervalo (tiempo entre viajes) para el servicio basado en el intervalo o una representación comprimida del servicio de horario fijo. | 
 | [transfers.txt](#transferstxt) | Opcional | Reglas para realizar conexiones en puntos de transferencia entre rutas. | 
 | [pathways.txt](#pathwaystxt) | Opcional | Recorridos que unen ubicaciones dentro de las estaciones. | 
 | [levels.txt](#levelstxt) | **Condicionalmente Obligatorio** | Niveles dentro de las estaciones.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** al describir caminos con ascensores (`pathway_mode=5`).<br> - Opcional en caso contrario. | 
 | [location_groups.txt](#location_groupstxt) | Opcional | Un grupo de paradas que en conjunto indican lugares donde un pasajero puede solicitar que lo recojan o lo dejen. | 
 | [location_group_stops.txt](#location_group_stopstxt) | Opcional | Reglas para asignar paradas a grupos de ubicación. | 
 | [locations.geojson](#locationsgeojson) | Opcional | Zonas para solicitudes de recogida o devolución de pasajeros mediante servicios bajo demanda, representadas como polígonos GeoJSON. | 
 | [booking_rules.txt](#booking_rulestxt) | Opcional | Información de reserva para servicios solicitados por pasajeros. | 
 | [translations.txt](#translationstxt) | Opcional | Traducciones de valores de conjuntos de datos de cara al cliente. | 
 | [feed_info.txt](#feed_infotxt) | **Condicionalmente Obligatorio** | Metadatos del conjunto de datos, incluida la información del editor, la versión y la caducidad. <br><br>Condicionalmente Obligatorio:<br>- **Obligatorio** si se proporciona [translations.txt](#translationstxt).<br>- Recomendado en caso contrario. | 
 | [attributions.txt](#attributionstxt) | Opcional | Atribuciones de conjuntos de datos. | 
 
## Requisitos de archivo 

 Los siguientes requisitos se aplican al formato y contenido de los archivos del conjunto de datos: 
 
 * Todos los archivos deben guardarse como texto delimitado por comas. 
 * La primera línea de cada archivo debe contener nombres de campos. Cada subsección de la sección [Definiciones de campos](#definiciones-de-campo) corresponde a uno de los archivos en un conjunto de datos GTFS y enumera los nombres de campos que se pueden usar en ese archivo. 
 * Todos los nombres de archivos y campos distinguen entre mayúsculas y minúsculas. 
 * Los valores de los campos no deben contener tabulaciones, retornos de carro ni líneas nuevas. 
 * Los valores de campo que contienen comillas o comas deben estar entre comillas. Además, cada comilla en el valor del campo debe ir precedida de una comilla. Esto es coherente con la forma en que Microsoft Excel genera archivos delimitados por comas (CSV). Para obtener más información sobre el formato de archivo CSV, consulte [http://tools.ietf.org/html/rfc4180](http ://tools.ietf.org/html/rfc4180). 
 El siguiente ejemplo demuestra cómo aparecería un valor de campo en un archivo delimitado por comas: 
 * **Valor de campo original:** `Contiene "comillas", comas y texto` 
 * **Valor de campo en un archivo CSV :** `"Contiene ""comillas"", comas y texto"` 
 * Los valores de campo no deben contener etiquetas HTML, comentarios ni secuencias de escape. 
 * Deben eliminarse los espacios adicionales entre campos o nombres de campos. Muchos analizadores consideran que los espacios son parte del valor, lo que puede provocar errores. 
 * Cada línea debe terminar con un carácter de salto de línea CRLF o LF. 
 * Los archivos deben codificarse en UTF-8 para admitir todos los caracteres Unicode. Se aceptan archivos que incluyen el carácter de marca de orden de bytes (BOM) Unicode. Consulte [http://unicode.org/faq/utf_bom.html#BOM](http://unicode.org/faq/utf_bom.html#BOM) para obtener más información sobre el carácter BOM y UTF-8. 
 * Todos los archivos del conjunto de datos deben estar comprimidos juntos. Los archivos deben residir directamente en el nivel raíz, no en una subcarpeta. 
 * Todas las cadenas de texto orientadas al cliente (incluidos nombres de paradas, nombres de rutas y letreros) deben usar mayúsculas y minúsculas (no TODO EN MAYÚSCULAS), siguiendo las convenciones locales para el uso de mayúsculas en nombres de lugares en pantallas capaces de mostrar caracteres en minúsculas (por ejemplo, “Brighton Plaza Churchill”, “Villiers-sur-Marne”, “Calle del Mercado”). 
 * Se debe evitar el uso de abreviaturas en todo el feed para nombres y otros textos (por ejemplo, St.para Calle) a menos que una ubicación se llame por su nombre abreviado (por ejemplo, “Aeropuerto JFK”). Las abreviaturas pueden resultar problemáticas para la accesibilidad mediante software lector de pantalla e interfaces de usuario de voz. Se puede diseñar software de consumo para convertir de forma fiable palabras completas en abreviaturas para su visualización, pero la conversión de abreviaturas a palabras completas conlleva un mayor riesgo de error. 
 
## Publicación de conjuntos de datos y prácticas generales 
 
 * Los conjuntos de datos deben publicarse en una URL pública y permanente, incluido el nombre del archivo zip. (por ejemplo, www.agency.org/gtfs/gtfs.zip). Idealmente, la URL debería poder descargarse directamente sin necesidad de iniciar sesión para acceder al archivo, para facilitar la descarga mediante el consumo de aplicaciones de software. Si bien se recomienda (y es la práctica más común) hacer que un conjunto de datos GTFS se pueda descargar abiertamente, si un proveedor de datos necesita controlar el acceso a GTFS por motivos de licencia u otros motivos, se recomienda controlar el acceso al conjunto de datos GTFS mediante claves API. lo que facilitará las descargas automáticas. 
 * Los datos GTFS deben publicarse en iteraciones para que un único archivo en una ubicación estable siempre contenga la descripción oficial más reciente del servicio para una agencia (o agencias) de tránsito. 
 * Los conjuntos de datos deben mantener identificadores persistentes (campos de identificación) para `stop_id`, `route_id` y `agency_id` en todas las iteraciones de datos siempre que sea posible. 
 * Un conjunto de datos GTFS debe contener el servicio actual y el próximo (a veces denominado conjunto de datos "fusionado"). Hay varias [herramientas de combinación](../../../resources/gtfs/#gtfs-merge-tools) disponibles que se pueden utilizar para crear un conjunto de datos combinado a partir de dos fuentes GTFS diferentes. 
 * En cualquier momento, el conjunto de datos GTFS publicado debe ser válido durante al menos los próximos 7 días e, idealmente, mientras el operador confíe en que el horario seguirá funcionando. 
 * Si es posible, el conjunto de datos GTFS debe cubrir al menos los próximos 30 días de servicio. 
 * Los servicios antiguos (calendarios caducados) deben eliminarse del feed. 
 * Si una modificación del servicio entrará en vigencia en 7 días o menos, este cambio de servicio debe expresarse a través de un feed GTFS en tiempo real (avisos de servicio o actualizaciones de viaje) en lugar de un conjunto de datos GTFS estático. 
 * El servidor web que aloja los datos GTFS debe configurarse para informar correctamente la date de modificación del archivo (consulte [HTTP/1.1- Solicitud de comentarios 2616, en la Sección 14.29](https://tools.ietf.org/html/rfc2616#sección-14.29)). 
 
## Definiciones de campo

### agency.txt 
 
 Archivo: **Obligatorio** 
 
 Clave principal (`agency_id`) 
 
 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `agency_id` | ID única | **Condicionalmente Obligatorio** | Identifica una marca de transporte que suele ser sinónimo de agencia de transporte. Tenga en cuenta que en algunos casos, como cuando una sola agencia opera varios servicios separados, las agencias y las marcas son distintas. Este documento utiliza el término "agencia" en lugar de "marca". Un conjunto de datos puede contener datos de varias agencias.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** cuando el conjunto de datos contiene datos de varias agencias de tránsito.<br> - Recomendado lo contrario. | 
 | `agency_name` | Text | **Obligatorio** | Nombre completo de la agencia de tránsito. | 
 | `agency_url` | URL | **Obligatorio** | URL de la agencia de tránsito. | 
 | `agency_timezone` | Zona horaria | **Obligatorio** | Zona horaria donde se encuentra la agencia de tránsito. Si se especifican varias agencias en el conjunto de datos, cada una debe tener la misma `agency_timezone`. | 
 | `agency_lang` | Código de idioma | Opcional | Idioma principal utilizado por esta agencia de tránsito. Debe proporcionarse para ayudar a los consumidores de GTFS a elegir reglas de capitalización y otras configuraciones específicas del idioma para el conjunto de datos. | 
 | `agency_phone` | Número de teléfono | Opcional | Un número de teléfono de voz para la agencia especificada. Este campo es un valor de string que presenta el número de teléfono como típico del área de servicio de la agencia. Puede contener signos de puntuación para agrupar los dígitos del número. Se permite el texto que se puede marcar (por ejemplo, "503-238-RIDE" de TriMet), pero el campo no debe contener ningún otro texto descriptivo. | 
 | `agency_fare_url` | URL | Opcional | URL de una página web que permite a un pasajero comprar boletos u otros instrumentos tarifarios para esa agencia en línea. | 
 | `agency_email` | Correo electrónico | Opcional | Dirección de correo electrónico monitorizada activamente por el departamento de atención al cliente de la agencia. Esta dirección de correo electrónico debe ser un punto de contacto directo donde los pasajeros del transporte público puedan comunicarse con un representante de servicio al cliente de la agencia. | 
 
### stops.txt 
 
 Archivo: **Condicionalmente Obligatorio** 
 
 Clave principal (`stop_id`) 
 
 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `stop_id` | ID única | **Obligatorio** | Identifica una ubicación: parada/andén, estación, entrada/salida, nodo genérico o zona de embarque (ver `location_type`).<br><br> El ID debe ser único en todos los valores `stops.stop_id`, locations.geojson `id` y `location_groups.location_group_id` .<br><br> Varias rutas pueden utilizar el mismo `stop_id`. | 
 | `stop_code` | Text | Opcional | Texto breve o un número que identifique la ubicación de los pasajeros. Estos códigos se utilizan a menudo en sistemas telefónicos de información de tránsito o se imprimen en carteles para facilitar a los pasajeros la obtención de información para una ubicación en particular. El `stop_code` puede ser el mismo que el `stop_id` si es público. Este campo debe dejarse vacío para ubicaciones sin un código presentado a los pasajeros. | 
 | `stop_name` | Text | **Condicionalmente Obligatorio** | Nombre de la ubicación. El "`stop_name`" debe coincidir con el nombre de la agencia orientado al pasajero para la ubicación, tal como está impreso en un horario, publicado en línea o representado en los carteles. Para traducciones a otros idiomas, utilice [translations.txt](#translationstxt).<br><br> Cuando la ubicación es un área de embarque (`location_type=4`), el `stop_name` debe contener el nombre del área de embarque tal como lo muestra la agencia. Podría ser solo una letra (como en algunas estaciones de trenes interurbanos europeas) o un texto como “Zona de embarque para sillas de ruedas” (metro de Nueva York) o “Jefe de trenes cortos” (RER de París).<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** para ubicaciones que son paradas (`location_type=0`), estaciones (`location_type=1`) o entradas/salidas (`location_type=2`).<br> - Opcional para ubicaciones que son nodos genéricos (`location_type=3`) o áreas de embarque (`location_type=4`).| 
 | `tts_stop_name` | Text | Opcional | Versión legible del `stop_name`. Consulte "Campo de texto a voz" en [Definiciones de términos](#definiciones-de-terminos) para obtener más información. | 
 | `stop_desc` | Text | Opcional | Descripción del lugar que proporciona información útil y de calidad. No debe ser un duplicado de `stop_name`.| 
 | `stop_lat` | Latitud | **Condicionalmente Obligatorio** | Latitud de la ubicación.<br><br> Para paradas/andenes (`location_type=0`) y zona de embarque (`location_type=4`), las coordenadas deben ser las del poste de autobús —si existe— y en caso contrario del lugar donde los viajeros abordan el vehículo (en la acera). o el andén, y no en la calzada o vía donde se detiene el vehículo).<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** para ubicaciones que son paradas (`location_type=0`), estaciones (`location_type=1`) o entradas/salidas (`location_type=2`).<br> - Opcional para ubicaciones que son nodos genéricos (`location_type=3`) o áreas de embarque (`location_type=4`).| 
 | `stop_lon` | Longitud | **Condicionalmente Obligatorio** | Longitud del lugar.<br><br> Para paradas/andenes (`location_type=0`) y zona de embarque (`location_type=4`), las coordenadas deben ser las del poste de autobús —si existe— y en caso contrario del lugar donde los viajeros abordan el vehículo (en la acera). o el andén, y no en la calzada o vía donde se detiene el vehículo).<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** para ubicaciones que son paradas (`location_type=0`), estaciones (`location_type=1`) o entradas/salidas (`location_type=2`).<br> - Opcional para ubicaciones que son nodos genéricos (`location_type=3`) o áreas de embarque (`location_type=4`). | 
 | `zone_id` | ID | Opcional | Identifica la zona tarifaria para una parada. Si este registro representa una estación o entrada de estación, se ignora `zone_id` .| 
 | `stop_url` | URL | Opcional | URL de una página web sobre la ubicación. Esto debe ser diferente de los valores de los campos `agency.agency_url` y `routes.route_url`. | 
 | `location_type` | Enumeración | Opcional | Tipo de ubicacion. Las opciones válidas son:<br><br> `0` (o en blanco) - **Detener** (o **Plataforma**). Un lugar donde los pasajeros abordan o desembarcan de un vehículo de tránsito. Se llama plataforma cuando se define dentro de una `parent_station`.<br> `1` - **Estación**. Una estructura física o área que contiene una o más plataformas.<br> `2` - **Entrada/Salida**. Un lugar donde los pasajeros pueden entrar o salir de una estación desde la calle. Si una entrada/salida pertenece a varias estaciones, puede estar vinculada mediante rutas a ambas, pero el proveedor de datos debe elegir una de ellas como principal.<br> `3` - **Nodo genérico**. Una ubicación dentro de una estación, que no coincide con ningún otro `location_type`, que puede usarse para vincular rutas definidas en [pathways.txt](#pathwaystxt).<br> `4` - **Zona de embarque**. Un lugar específico en una plataforma, donde los pasajeros pueden subir y/o bajar de vehículos.| 
 | `parent_station` | ID extranjera que hace referencia a `stops.stop_id` | **Condicionalmente Obligatorio** | Define la jerarquía entre las diferentes ubicaciones definidas en [stops.txt](#stopstxt). Contiene el ID de la ubicación principal, como se muestra a continuación:<br><br> - **Parada/plataforma** (`location_type=0`): el campo `parent_station` contiene el ID de una estación.<br> - **Estación** (`location_type=1`): este campo debe estar vacío.<br> - **Entrada/salida** (`location_type=2`) o **nodo genérico** (`location_type=3`): el campo `parent_station` contiene el ID de una estación (`location_type=1`)<br> - **Área de embarque** (`location_type=4`): el campo `parent_station` contiene el ID de una plataforma.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** para ubicaciones que son entradas (`location_type=2`), nodos genéricos (`location_type=3`) o áreas de embarque (`location_type=4`).<br> - Opcional para paradas/andenes (`location_type=0`).<br> - Prohibido para estaciones (`location_type=1`).| 
 | `stop_timezone` | Zona horaria | Opcional | Zona horaria de la ubicación. Si la ubicación tiene una estación principal, hereda la zona horaria de la estación principal en lugar de aplicar la suya propia. Las estaciones y paradas sin padres con `stop_timezone` vacío heredan la zona horaria especificada por `agency.agency_timezone`. Las horas proporcionadas en [stop_times.txt](#stop_timestxt) están en la zona horaria especificada por `agency.agency_timezone`, no en `stop_timezone`. Esto garantiza que los valores de tiempo en un viaje siempre aumenten durante el transcurso de un viaje, independientemente de qué zonas horarias cruza el viaje. | 
 | `wheelchair_boarding` | Enumeración | Opcional | Indica si es posible el embarque de sillas de ruedas desde el lugar. Las opciones válidas son:<br><br> Para paradas sin padres:<br> `0` o vacío: no hay información de accesibilidad para la parada.<br> `1` - Algunos vehículos en esta parada pueden ser abordados por un pasajero en silla de ruedas.<br> `2` - No es posible el embarque para sillas de ruedas en esta parada.<br><br> Para paradas infantiles:<br> `0` o vacío: Stop heredará su comportamiento `wheelchair_boarding` de la estación principal, si se especifica en la estación principal.<br> `1` : existe algún camino accesible desde fuera de la estación hasta la parada/andén específico.<br> `2` - No existe un camino accesible desde fuera de la estación hasta la parada/andén específico.<br><br> Para entradas/salidas de estaciones:<br> `0` o vacío: la entrada de la estación heredará su comportamiento `wheelchair_boarding` de la estación principal, si se especifica para la estación principal.<br> `1` - La entrada a la estación es accesible para sillas de ruedas.<br> `2` - No hay camino accesible desde la entrada de la estación hasta las paradas/andenes. | 
 | `level_id` | ID extranjero que hace referencia a `levels.level_id` | Opcional | Nivel de la ubicación. El mismo nivel podrá ser utilizado por múltiples estaciones no vinculadas.| 
 | `platform_code` | Text | Opcional | Identificador de andén para una parada de andén (una parada perteneciente a una estación). Debe ser solo el identificador de la plataforma (por ejemplo, "G" o "3"). No se deben incluir palabras como "plataforma" o "pista" (o el equivalente específico del idioma del feed). Esto permite a los consumidores de feeds internacionalizar y localizar más fácilmente el identificador de la plataforma a otros idiomas. | 
 
 
### routes.txt 
 
 Archivo: **Obligatorio** 
 
 Clave principal (`route_id`) 
 
 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `route_id` | ID única | **Obligatorio** | Identifica una ruta. | 
 | `agency_id` | ID extranjera que hace referencia a `agency.agency_id` | **Condicionalmente Obligatorio** | Agencia para la ruta especificada.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si se definen varias agencias en [agency.txt](#agencytxt).<br> - Recomendado lo contrario. | 
 | `route_short_name` | Text | **Condicionalmente Obligatorio** | Nombre corto de una ruta. Suele ser un identificador breve y abstracto (p.ej., "32", "100X", "Verde") que los pasajeros utilizan para identificar una ruta. Se pueden definir tanto `route_short_name` como `route_long_name` .<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si `routes.route_long_name` está vacío.<br> - Recomendado si existe una breve designación de servicio. Este debe ser el nombre comúnmente conocido del pasajero del servicio y no debe tener más de 12 caracteres. | 
 | `route_long_name` | Text | **Condicionalmente Obligatorio** | Nombre completo de una ruta. Este nombre es generalmente más descriptivo que "`route_short_name`" y a menudo incluye el destino o la parada de la ruta. Se pueden definir tanto `route_short_name` como `route_long_name` .<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si `routes.route_short_name` está vacío.<br> - Opcional en caso contrario. | 
 | `route_desc` | Text | Opcional | Descripción de una ruta que proporciona información útil y de calidad. No debe ser un duplicado de `route_short_name` o `route_long_name`.<hr> _Ejemplo: Los trenes "A" operan entre Inwood-207 St, Manhattan y Far Rockaway-Mott Avenue, Queens en todo momento. También desde aproximadamente las 6 a.m.hasta aproximadamente la medianoche, trenes "A" adicionales operan entre Inwood-207 St y Lefferts Boulevard (los trenes generalmente alternan entre Lefferts Blvd y Far Rockaway)._ | 
 | `route_type` | Enumeración | **Obligatorio** | Indica el tipo de transporte utilizado en una ruta. Las opciones válidas son:<br><br> `0` - Tranvía, Tranvía, Tren ligero. Cualquier sistema de tren ligero o a nivel de calle dentro de un área metropolitana.<br> `1` - Metro, Metro. Cualquier sistema ferroviario subterráneo dentro de un área metropolitana.<br> `2` - Carril. Utilizado para viajes interurbanos o de larga distancia.<br> `3` - Autobús. Se utiliza para rutas de autobuses de corta y larga distancia.<br> `4` - Transbordador. Se utiliza para servicio de embarcaciones de corta y larga distancia.<br> `5` - Teleférico. Se utiliza para vagones a nivel de calle donde el cable pasa por debajo del vehículo (por ejemplo, teleférico en San Francisco).<br> `6` - Teleférico, teleférico suspendido (p.ej., telecabina, teleférico). Transporte por cable donde cabinas, coches, góndolas o sillas abiertas quedan suspendidas mediante uno o más cables.<br> `7` - Funicular. Cualquier sistema ferroviario diseñado para pendientes pronunciadas.<br> `11` - Trolebús. Autobuses eléctricos que obtienen energía de cables aéreos mediante postes.<br> `12` - Monorraíl. Ferrocarril en el que la vía está formada por un solo carril o una viga. | 
 | `route_url` | URL | Opcional | URL de una página web sobre la ruta particular. Debe ser diferente del valor `agency.agency_url`. | 
 | `route_color` | Color | Opcional | Designación de color de ruta que coincida con el material orientado al público. El valor predeterminado es blanco (`FFFFFF`) cuando se omite o se deja vacío. La diferencia de color entre `route_color` y `route_text_color` debería proporcionar suficiente contraste cuando se ve en una pantalla en blanco y negro. | 
 | `route_text_color` | Color | Opcional | Color legible para usar en el texto dibujado sobre un fondo de `route_color`. El valor predeterminado es negro (`000000`) cuando se omite o se deja vacío. La diferencia de color entre `route_color` y `route_text_color` debería proporcionar suficiente contraste cuando se ve en una pantalla en blanco y negro. | 
 | `route_sort_order` | Entero no negativo | Opcional | Ordena las rutas de forma ideal para presentarlas a los clientes. Las Rutas con valores más pequeños de `route_sort_order` deben mostrarse primero. | 
 | `continuous_pickup` | Enumeración | **Condicionalmente Prohibido** | Indica que el pasajero puede abordar el vehículo de tránsito en cualquier punto a lo largo de la ruta de viaje del vehículo como se describe en [shapes.txt](#shapestxt), en cada viaje de la ruta. Las opciones válidas son:<br><br> `0` - Captación de parada continua.<br> `1` o vacío: no hay recogida de parada continua.<br> `2` - Debe llamar a la agencia para coordinar la recogida con parada continua.<br> `3` - Debe coordinarse con el conductor para organizar la recogida con parada continua.<br><br> Los valores de `routes.continuous_pickup` se pueden anular definiendo valores en `stop_times.continuous_pickup` para `stop_time` específicos a lo largo de la ruta.<br><br> **Condicionalmente Prohibido**:<br> - **Prohibido** si `stop_times.start_pickup_drop_off_window` o `stop_times.end_pickup_drop_off_window` están definidos para cualquier viaje de esta ruta.<br> - Opcional en caso contrario. | 
 | `continuous_drop_off` | Enumeración | **Condicionalmente Prohibido** | Indica que el pasajero puede bajarse del vehículo de tránsito en cualquier punto a lo largo de la ruta de viaje del vehículo como se describe en [shapes.txt](#shapestxt), en cada viaje de la ruta. Las opciones válidas son:<br><br> `0` - Caída de parada continua.<br> `1` o vacío: no hay parada continua.<br> `2` - Debe llamar a la agencia para coordinar la entrega y parada continua.<br> `3` - Debe coordinarse con el conductor para organizar la parada continua y la bajada.<br><br> Los valores de `routes.continuous_drop_off` se pueden anular definiendo valores en `stop_times.continuous_drop_off` para `stop_time` específicos a lo largo de la ruta.<br><br> **Condicionalmente Prohibido**:<br> - **Prohibido** si `stop_times.start_pickup_drop_off_window` o `stop_times.end_pickup_drop_off_window` están definidos para cualquier viaje de esta ruta.<br> - Opcional en caso contrario. | 
 | `network_id` | ID | **Condicionalmente Prohibido** | Identifica un grupo de rutas. Varias filas en [routes.txt](#routestxt) pueden tener el mismo `network_id`.<br><br> Condicionalmente Prohibido:<br> - **Prohibido** si el archivo [route_networks.txt](#route_networkstxt) existe.<br> - Opcional en caso contrario. 
 
### trips.txt 
 
 Archivo: **Obligatorio** 
 
 Clave principal (`trip_id`) 
 
 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `route_id` | ID extranjera que hace referencia a `routes.route_id` | **Obligatorio** | Identifica una ruta. | 
 | `service_id` | ID extranjero que hace referencia a `calendar.service_id` o `calendar_dates.service_id` | **Obligatorio** | Identifica un conjunto de fechas en las que el servicio está disponible para una o más rutas. | 
 | `trip_id` | ID única | **Obligatorio** | Identifica un viaje. | 
 | `trip_headsign` | Text | Opcional | Text que aparece en la señalización que identifica el destino del viaje a los pasajeros. Este campo se recomienda para todos los servicios con cartel de destino mostrado en el vehículo y que puede usarse para distinguir entre viajes en una ruta.<br><br> Si el cartel de destino cambia durante un viaje, los valores de `trip_headsign` pueden anularse definiendo valores en `stop_times.stop_headsign` para `stop_time` específicos a lo largo del viaje. | 
 | `trip_short_name` | Text | Opcional | Texto orientado al público utilizado para identificar el viaje a los pasajeros, por ejemplo, para identificar los números de tren para viajes en trenes de cercanías. Si los pasajeros no suelen confiar en los nombres de los viajes, `trip_short_name` debe estar vacío. Un valor `trip_short_name`, si se proporciona, debe identificar de forma única un viaje dentro de un día de servicio; no debe usarse para nombres de destinos o designaciones limitadas/expresas. | 
 | `direction_id` | Enumeración | Opcional | Indica la dirección de viaje de un viaje. Este campo no debe utilizarse en el enrutamiento; proporciona una manera de separar los viajes por dirección al publicar horarios. Las opciones válidas son:<br><br> `0` - Viaje en una dirección (por ejemplo, viaje de ida).<br> `1` - Viajar en la dirección opuesta (p.ej., viaje de regreso).<hr> *Ejemplo: Los campos `trip_headsign` y `direction_id` se pueden usar juntos para asignar un nombre para viajar en cada dirección durante un conjunto de viajes. Un archivo [trips.txt](#tripstxt) podría contener estos registros para usarlos en tablas de horarios:*<br> `trip_id,...,trip_headsign,direction_id`<br> `1234,...,Aeropuerto,0`<br> `1505,...,Centro,1` | 
 | `block_id` | ID | Opcional | Identifica el bloque al que pertenece el viaje. Un bloque consta de un solo viaje o de muchos viajes secuenciales realizados con el mismo vehículo, definidos por días de servicio compartidos y `block_id`. Un `block_id` puede tener viajes con diferentes días de servicio, formando bloques distintos. Vea el [ejemplo a continuación](#ejemplo-bloques-y-dia-de-servicio). Para proporcionar información sobre transferencias en el asiento, se deben proporcionar [transfers](#transferstxt) de `transfer_type` `4`. | 
 | `shape_id` | ID extranjera que hace referencia a `shapes.shape_id` | **Condicionalmente Obligatorio** | Identifica una forma geoespacial que describe la ruta del vehículo para un viaje.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si el viaje tiene un comportamiento continuo de inicio o regreso definido en [routes.txt](#routestxt) o en [stop_times.txt](#stop_timestxt).<br> - Opcional en caso contrario. | 
 | `wheelchair_accessible` | Enumeración | Opcional | Indica accesibilidad para sillas de ruedas. Las opciones válidas son:<br><br> `0` o vacío: no hay información de accesibilidad para el viaje.<br> `1` : el vehículo que se utiliza en este viaje en particular tiene capacidad para al menos un pasajero en silla de ruedas.<br> `2` - No se pueden acomodar pasajeros en sillas de ruedas en este viaje. | 
 | `bikes_allowed` | Enumeración | Opcional | Indica si se permiten bicicletas. Las opciones válidas son:<br><br> `0` o vacío: no hay información de bicicleta para el viaje.<br> `1` : el vehículo que se utiliza en este viaje en particular tiene capacidad para al menos una bicicleta.<br> `2` - No se permiten bicicletas en este viaje. | 
 
#### Ejemplo: Bloques y día de servicio 
 
 El siguiente ejemplo es válido, con bloques distintos todos los días de la semana. 

| route_id | trip_id | service_id                     | block_id | <span style="font-weight:normal">*(first stop time)*</span> | <span style="font-weight:normal">*(last stop time)*</span> |
|----------|---------|--------------------------------|----------|-----------------------------------------|-------------------------|
| red      | trip_1  | mon-tues-wed-thurs-fri-sat-sun | red_loop | 22:00:00                                | 22:55:00                |
| red      | trip_2  | fri-sat-sun                    | red_loop | 23:00:00                                | 23:55:00                |
| red      | trip_3  | fri-sat                        | red_loop | 24:00:00                                | 24:55:00                |
| red      | trip_4  | mon-tues-wed-thurs             | red_loop | 20:00:00                                | 20:50:00                |
| red      | trip_5  | mon-tues-wed-thurs             | red_loop | 21:00:00                                | 21:50:00                |
 
 Notas sobre la tabla anterior: 
 
 * De viernes a sábado por la mañana, por ejemplo, un solo vehículo opera `trip_1`, `trip_2` y `trip_3` (de 10:00 p.m.a 0:55 a.m.). Tenga en cuenta que el último viaje se realiza el sábado, de 12:00 a.m.a 12:55 a.m., pero es parte del “día de servicio” del viernes porque el horario es de 24:00:00:00 a 24:55:00. 
 * Los lunes, martes, miércoles y jueves, un solo vehículo opera `trip_1`, `trip_4` y `trip_5` en un bloque de 8:00 p.m.a 10:55 p.m. 
 
### stop_times.txt 
 
 Archivo: **Obligatorio** 
 
 Clave principal (`trip_id`, `stop_sequence`) 
 
 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `trip_id` | ID extranjera que hace referencia a `trips.trip_id` | **Obligatorio** | Identifica un viaje. | 
 | `arrival_time` | Hora | **Condicionalmente Obligatorio** | Hora de llegada a la parada (definida por `stop_times.stop_id`) para un viaje específico (definida por `stop_times.trip_id`) en la zona horaria especificada por `agency.agency_timezone`, no en `stops.stop_timezone`.<br><br> Si no hay horarios separados para la llegada y la salida en una parada, "`arrival_time`" y "`departure_time`" deben ser los mismos.<br><br> Para los horarios que ocurren después de la medianoche del día del servicio, ingrese la hora como un valor mayor que 24:00:00 en HH:MM:SS.<br><br> Si las horas exactas de llegada y salida (`timepoint=1`) no están disponibles, se deben proporcionar horas de llegada y salida estimadas o interpoladas (`timepoint=0`).<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** para la primera y última parada de un viaje (definido por `stop_times.stop_sequence`).<br> - **Obligatorio** para `timepoint=1`.<br> - **Prohibido** cuando se definen `start_pickup_drop_off_window` o `end_pickup_drop_off_window` .<br> - Opcional en caso contrario.| 
 | `departure_time` | Hora | **Condicionalmente Obligatorio** | Hora de salida desde la parada (definida por `stop_times.stop_id`) para un viaje específico (definido por `stop_times.trip_id`) en la zona horaria especificada por `agency.agency_timezone`, no por `stops.stop_timezone`.<br><br> Si no hay horarios separados para la llegada y la salida en una parada, "`arrival_time`" y "`departure_time`" deben ser los mismos.<br><br> Para las horas que ocurren después de la medianoche del día del servicio, ingrese la hora como un valor mayor que 24:00:00 en HH:MM:SS.<br><br> Si las horas exactas de llegada y salida (`timepoint=1`) no están disponibles, se deben proporcionar horas de llegada y salida estimadas o interpoladas (`timepoint=0`).<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** para `timepoint=1`.<br> - **Prohibido** cuando se definen `start_pickup_drop_off_window` o `end_pickup_drop_off_window` .<br> - Opcional en caso contrario. | 
 | `stop_id` | ID extranjera que hace referencia a `stops.stop_id` | **Condicionalmente Obligatorio** | Identifica la parada atendida. Todas las paradas atendidas durante un viaje deben tener un registro en [stop_times.txt](#stop_timestxt). Las ubicaciones a las que se hace referencia deben ser paradas/andenes, es decir, su valor `stops.location_type` debe ser `0` o estar vacío. Una parada puede recibir servicio varias veces en el mismo viaje, y varios viajes y rutas pueden dar servicio a la misma parada.<br><br> Se debe hacer referencia al servicio a pedido que utiliza paradas en la secuencia en la que el servicio está disponible en esas paradas. Un consumidor de datos debe asumir que es posible viajar desde una parada o ubicación a cualquier parada o ubicación más adelante en el viaje, siempre que el `pickup/drop_off_type` de cada hora_parada y las limitaciones de tiempo de cada `start/end_pickup_drop_off_window` no lo prohíban..<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si `stop_times.location_group_id` Y `stop_times.location_id` NO están definidos.<br> - **Prohibido** si `stop_times.location_group_id` Y `stop_times.location_id` están definidos. | 
 | `location_group_id` | ID extranjero que hace referencia a `location_groups.location_group_id` | **Condicionalmente Prohibido** | Identifica el grupo de ubicaciones con servicio que indica grupos de paradas donde los pasajeros pueden solicitar que los recojan o los dejen. Todos los grupos de ubicaciones atendidos durante un viaje deben tener un registro en [stop_times.txt](#stop_timestxt). Múltiples viajes y rutas pueden dar servicio al mismo grupo de ubicación.<br><br> Se debe hacer referencia al servicio bajo demanda que utiliza grupos de ubicaciones en la secuencia en la que el servicio está disponible en esos grupos de ubicaciones. Un consumidor de datos debe asumir que es posible viajar desde una parada o ubicación a cualquier parada o ubicación más adelante en el viaje, siempre que el `pickup/drop_off_type` de cada hora_parada y las limitaciones de tiempo de cada `start/end_pickup_drop_off_window` no lo prohíban..<br><br> **Condicionalmente Prohibido**:<br> - **Prohibido** si `stop_times.stop_id` o `stop_times.location_id` están definidos. | 
 | `location_id` | ID extranjera que hace referencia a `id` de `locations.geojson` | **Condicionalmente Prohibido** | Identifica la ubicación GeoJSON que corresponde a la zona de servicio donde los pasajeros pueden solicitar que los recojan o los dejen. Todas las ubicaciones GeoJSON atendidas durante un viaje deben tener un registro en [stop_times.txt](#stop_timestxt). Múltiples viajes y rutas pueden dar servicio a la misma ubicación GeoJSON.<br><br> Se debe hacer referencia al servicio a pedido dentro de las ubicaciones en la secuencia en la que el servicio está disponible en esas ubicaciones. Un consumidor de datos debe asumir que es posible viajar desde una parada o ubicación a cualquier parada o ubicación más adelante en el viaje, siempre que el `pickup/drop_off_type` de cada hora_parada y las limitaciones de tiempo de cada `start/end_pickup_drop_off_window` no lo prohíban..<br><br> **Condicionalmente Prohibido**:<br> - **Prohibido** si `stop_times.stop_id` o `s`. location_group_id` están definidos. | 
 | `stop_sequence` | Entero no negativo | **Obligatorio** | Orden de paradas, grupos de ubicaciones o ubicaciones GeoJSON para un viaje en particular. Los valores deben aumentar a lo largo del viaje pero no es necesario que sean consecutivos.<hr> *Ejemplo: La primera ubicación del viaje podría tener una `stop_sequence`= `1`, la segunda ubicación del viaje podría tener una `stop_sequence`=`23`, la tercera ubicación podría tener una `stop_sequence`=`40`, etcétera.*<br><br> Viajar dentro del mismo grupo de ubicación o ubicación GeoJSON requiere dos registros en [stop_times.txt](#stop_timestxt) con el mismo `location_group_id` o `location_id`. | 
 | `stop_headsign` | Text | Opcional | Text que aparece en la señalización que identifica el destino del viaje a los pasajeros. Este campo anula el `trips.trip_headsign` predeterminado cuando el letrero cambia entre paradas. Si el letrero se muestra durante todo un viaje, se debe usar `trips.trip_headsign` en su lugar.<br><br> Un valor de `stop_headsign` especificado para un `stop_time` no se aplica a los `stop_time` posteriores en el mismo viaje. Si desea anular el `trip_headsign` para múltiples `stop_time` en el mismo viaje, el valor de `stop_headsign` debe repetirse en cada fila de `stop_time`. | 
 | `start_pickup_drop_off_window` | Hora | **Condicionalmente Obligatorio** | Hora en que el servicio bajo demanda está disponible en una ubicación, grupo de ubicaciones o parada GeoJSON.<br><br> **Condicionalmente Obligatorio**:<br> - **Obligatorio** si `stop_times.location_group_id` o `stop_times.location_id` son definidos.<br> - **Obligatorio** si se define `end_pickup_drop_off_window`.<br> - **Prohibido** si se define `arrival_time` o `departure_time` .<br> - Opcional en caso contrario. | 
 | `end_pickup_drop_off_window` | Hora | **Condicionalmente Obligatorio** | Hora en que finaliza el servicio bajo demanda en una ubicación, grupo de ubicaciones o parada GeoJSON.<br><br> **Condicionalmente Obligatorio**:<br> - **Obligatorio** si `stop_times.location_group_id` o `stop_times.location_id` son definidos.<br> - **Obligatorio** si se define `start_pickup_drop_off_window` .<br> - **Prohibido** si se define `arrival_time` o `departure_time` .<br> - Opcional en caso contrario. | 
 | `pickup_type` | Enumeración | **Condicionalmente Prohibido** | Indica el método de recogida. Las opciones válidas son:<br><br> `0` o vacío: recogida programada regularmente.<br> `1` : no hay recogida disponible.<br> `2` - Debe llamar a la agencia para concertar la recogida.<br> `3`: Debe coordinarse con el conductor para organizar la recogida.<br><br> **Condicionalmente Prohibido**:<br> - `pickup_type=0` **prohibido** si se definen `start_pickup_drop_off_window` o `end_pickup_drop_off_window` .<br> - `pickup_type=3` **prohibido** si se definen `start_pickup_drop_off_window` o `end_pickup_drop_off_window` .<br> - Opcional en caso contrario. | 
 | `drop_off_type` | Enumeración | **Condicionalmente Prohibido** | Indica el método de entrega. Las opciones válidas son:<br><br> `0` o vacío: entrega programada regularmente.<br> `1` : no hay entrega disponible.<br> `2` - Debe llamar a la agencia para coordinar la entrega.<br> `3` - Debe coordinar con el conductor para organizar la entrega.<br><br> **Condicionalmente Prohibido**:<br> - `drop_off_type=0` **prohibido** si se definen `start_pickup_drop_off_window` o `end_pickup_drop_off_window` .<br> - Opcional en caso contrario. | 
 | `continuous_pickup` | Enumeración | **Condicionalmente Prohibido** | Indica que el pasajero puede abordar el vehículo de tránsito en cualquier punto a lo largo de la ruta de viaje del vehículo como se describe en [shapes.txt](#shapestxt), desde este `stop_time` hasta el siguiente `stop_time` en la `stop_sequence` del viaje. Las opciones válidas son:<br><br> `0` - Captación de parada continua.<br> `1` o vacío: no hay recogida de parada continua.<br> `2` - Debe llamar a la agencia para coordinar la recogida con parada continua.<br> `3` - Debe coordinarse con el conductor para organizar la recogida con parada continua.<br><br> Si este campo está completo, anula cualquier comportamiento de recogida continua definido en [routes.txt](#routestxt). Si este campo está vacío, `stop_time` hereda cualquier comportamiento de recogida continua definido en [routes.txt](#routestxt).<br><br> **Condicionalmente Prohibido**:<br> - **Prohibido** si se definen `start_pickup_drop_off_window` o `end_pickup_drop_off_window` .<br> - Opcional en caso contrario. | 
 | `continuous_drop_off` | Enumeración | **Condicionalmente Prohibido** | Indica que el pasajero puede bajarse del vehículo de tránsito en cualquier punto a lo largo de la ruta de viaje del vehículo como se describe en [shapes.txt](#shapestxt), desde este `stop_time` hasta el siguiente `stop_time` en la `stop_sequence` del viaje. Las opciones válidas son:<br><br> `0` - Caída de parada continua.<br> `1` o vacío: no hay parada continua.<br> `2` - Debe llamar a la agencia para coordinar la entrega y parada continua.<br> `3` - Debe coordinarse con el conductor para organizar la parada continua y la bajada.<br><br> Si este campo está completo, anula cualquier comportamiento de abandono continuo definido en [routes.txt](#routestxt). Si este campo está vacío, `stop_time` hereda cualquier comportamiento de abandono continuo definido en [routes.txt](#routestxt).<br><br> **Condicionalmente Prohibido**:<br> - **Prohibido** si se definen `start_pickup_drop_off_window` o `end_pickup_drop_off_window` .<br> - Opcional en caso contrario. | 
 | `shape_dist_traveled` | float no negativa | Opcional | Distancia real recorrida a lo largo de la forma asociada, desde la primera parada hasta la parada especificada en este registro. Este campo especifica qué parte de la forma se dibujará entre dos paradas cualesquiera durante un viaje. Debe estar en las mismas unidades utilizadas en [shapes.txt](#shapestxt). Los valores utilizados para `shape_dist_traveled` deben aumentar junto con `stop_sequence`; no deben usarse para mostrar el viaje en reversa a lo largo de una ruta.<br><br> Recomendado para rutas que tienen looping o inline (el vehículo cruza o recorre la misma porción de alineación en un solo viaje). Consulte [`shapes.shape_dist_traveled`](#shapestxt).<hr> *Ejemplo: Si un autobús recorre una distancia de 5,25 kilómetros desde el inicio de la forma hasta la parada, `shape_dist_traveled`=`5.25`.*| 
 | `timepoint` | Enumeración | Opcional | Indica si los horarios de llegada y salida de una parada son estrictamente respetados por el vehículo o son horarios aproximados y/o interpolados. Este campo permite a un productor GTFS proporcionar tiempos de parada interpolados, al tiempo que indica que los tiempos son aproximados. Las opciones válidas son:<br><br> `0` - Los tiempos se consideran aproximados.<br>`1` - Los tiempos se consideran exactos. <br><br>Todos los registros de [stop_times.txt](#stop_timestxt) con horas de llegada o salida definidas deben tener valores de timepoint completos. Si no se proporcionan valores de timepoint, todos los tiempos se consideran exactos. | 
 | `pickup_booking_rule_id` | ID extranjero que hace referencia a `booking_rules.booking_rule_id` | Opcional | Identifica la regla de reserva de embarque a esta hora de parada.<br><br> Recomendado cuando `pickup_type=2`. | 
 | `drop_off_booking_rule_id` | ID extranjero que hace referencia a `booking_rules.booking_rule_id` | Opcional | Identifica la regla de reserva de descenso a esta hora de parada.<br><br> Recomendado cuando `drop_off_type=2`. | 
 
#### Comportamiento de enrutamiento del servicio bajo demanda 
- al proporcionar enrutamiento o tiempo de viaje entre el origen y el destino, los consumidores de datos deben ignorar los registros intermedios stop_times.txt con el mismo `trip_id` que tienen `start_pickup_drop_off_window` y `end_pickup_drop_off_window` definido. Para ver ejemplos que demuestran lo que se debe ignorar, consulte [la página de ejemplo de datos](../examples/flex/#ignoring-intermediate-stop-times-records-with-pickupdrop-off-windows). 
- Está prohibida la superposición simultánea de la geometría `id` de locations.geojson, el tiempo de `inicio/final_recogida_caída_ventana` y `pickup_type` o `drop_off_type` entre dos o más registros stop_times.txt con el mismo `trip_id`. Para ver ejemplos que demuestran lo que está prohibido, consulte [la página de ejemplos de datos](../examples/flex/#zone-overlap-constraint). 
 
### calendar.txt 
 
 Archivo: **Condicionalmente Obligatorio** 
 
 Clave principal (`service_id`) 
 
 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `service_id` | ID única | **Obligatorio** | Identifica un conjunto de fechas en las que el servicio está disponible para una o más rutas. | 
 | `monday` | Enumeración | **Obligatorio** | Indica si el servicio opera todos los lunes en el rango de date especificado por los campos `start_date` y `end_date`. Tenga en cuenta que las excepciones para fechas particulares pueden enumerarse en [calendar_dates.txt](#calendar_datestxt). Las opciones válidas son:<br><br> `1` : el servicio está disponible para todos los lunes en el rango de date .<br> `0`: el servicio no está disponible para los lunes en el rango de date. | 
 | `tuesday` | Enumeración | **Obligatorio** | Funciona de la misma manera que "`monday`", excepto que se aplica a los martes. 
 | `wednesday` | Enumeración | **Obligatorio** | Funciona de la misma manera que "`monday`", excepto que se aplica a los miércoles | 
 | `thursday` | Enumeración | **Obligatorio** | Funciona de la misma manera que "`monday`", excepto que se aplica a los jueves | 
 | `friday` | Enumeración | **Obligatorio** | Funciona de la misma manera que "`monday`", excepto que se aplica a los viernes | 
 | `saturday` | Enumeración | **Obligatorio** | Funciona de la misma manera que "`monday`", excepto que se aplica a los sábados. | 
 | `sunday` | Enumeración | **Obligatorio** | Funciona de la misma manera que "`monday`", excepto que se aplica a los domingos. | 
 | `start_date` | Fecha | **Obligatorio** | Día de inicio del servicio para el intervalo de servicio. | 
 | `end_date` | Fecha | **Obligatorio** | Finalice el día de servicio para el intervalo de servicio. Este día de servicio está incluido en el intervalo. | 
 
### calendar_dates.txt 
 
 Archivo: **Condicionalmente Obligatorio** 
 
 Clave principal (`service_id`, `date`) 
 
 El [calendar_dates.txt](#calendar_datestxt ) la tabla activa o desactiva explícitamente el servicio por date. Puede usarse de dos maneras. 
 
 * Recomendado: utilice [calendar_dates.txt](#calendar_datestxt) junto con [calendar.txt](#calendartxt) para definir excepciones a los patrones de servicio predeterminados definidos en [calendar.txt](#calendartxt). Si el servicio es generalmente regular, con algunos cambios en fechas explícitas (por ejemplo, para adaptarse a servicios de eventos especiales o un horario escolar), este es un buen enfoque. En este caso, `calendar_dates.service_id` es un ID externo que hace referencia a `calendar.service_id`. 
 * Alternativa: Omitir [calendar.txt](#calendartxt) y especificar cada date de servicio en [calendar_dates.txt](#calendar_datestxt). Esto permite una variación considerable del servicio y se adapta al servicio sin horarios semanales normales. En este caso, `service_id` es una identificación. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `service_id` | ID extranjero que hace referencia a `calendar.service_id` o ID | **Obligatorio** | Identifica un conjunto de fechas en las que se produce una excepción de servicio para una o más rutas. Cada par (`service_id`, `date`) solo puede aparecer una vez en [calendar_dates.txt](#calendar_datestxt) si se usa [calendar.txt](#calendartxt) y [calendar_dates.txt](#calendar_datestxt) en conjunto. Si aparece un valor `service_id` tanto en [calendar.txt](#calendartxt) como en [calendar_dates.txt](#calendar_datestxt), la información en [calendar_dates.txt](#calendar_datestxt) modifica la información del servicio especificada en [calendar.txt](#calendartxt). | 
 | `date` | Fecha | **Obligatorio** | Fecha en que ocurre la excepción del servicio. | 
 | `exception_type` | Enumeración | **Obligatorio** | Indica si el servicio está disponible en la date especificada en el campo de date. Las opciones válidas son:<br><br> `1` : se ha agregado el servicio para la date especificada.<br> `2`: el servicio se ha eliminado para la date especificada.<hr> *Ejemplo: supongamos que una ruta tiene un conjunto de viajes disponibles los días festivos y otro conjunto de viajes disponibles el resto de los días. Un `service_id` podría corresponder al horario de servicio regular y otro `service_id` podría corresponder al horario de vacaciones. Para un día festivo en particular, el archivo [calendar_dates.txt](#calendar_datestxt) podría usarse para agregar el día festivo al día festivo `service_id` y eliminar el feriado del programa regular de `service_id`.* | 
 
### fare_attributes.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`fare_id`) 
 
 **Versiones**<br> 
 Hay dos opciones de modelado para describir tarifas. GTFS- Tarifas V1 es la opción heredada para describir información mínima de tarifas. GTFS-Fares V2 es un método actualizado que permite una descripción más detallada de la estructura de tarifas de una agencia. Se permite que ambos estén presentes en un conjunto de datos, pero un consumidor de datos solo debe utilizar un método para un conjunto de datos determinado. Se recomienda que GTFS-Fares V2 tenga prioridad sobre GTFS- Tarifas V1.<br><br> Los archivos asociados con GTFS- Tarifas V1 son:<br> - [fare_attributes.txt](#fare_attributestxt)<br> - [fare_rules.txt](#fare_rulestxt)<br><br> Los archivos asociados con GTFS-Fares V2 son:<br> - [fare_media.txt](#fare_mediatxt)<br> - [fare_products.txt](#fare_productstxt)<br> - [fare_leg_rules.txt](#fare_leg_rulestxt)<br> - [fare_transfer_rules.txt](#fare_transfer_rulestxt) 
 
<br> 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `fare_id` | ID única | **Obligatorio** | Identifica una clase de tarifa. | 
 | `price` | float no negativa | **Obligatorio** | Precio de la tarifa, en la unidad especificada por `currency_type`. | 
 | `currency_type` | Código de moneda | **Obligatorio** | Moneda utilizada para pagar la tarifa. | 
 | `payment_method` | Enumeración | **Obligatorio** | Indica cuándo se debe pagar la tarifa. Las opciones válidas son:<br><br> `0` - La tarifa se paga a bordo.<br> `1` - La tarifa debe pagarse antes del embarque. | 
 | `transfers` | Enumeración | **Obligatorio** | Indica el número de transbordos permitidos en esta tarifa. Las opciones válidas son:<br><br> `0` - No se permiten transferencias en esta tarifa.<br> `1` - Los pasajeros pueden transferirse una vez.<br> `2` - Los corredores pueden transferirse dos veces.<br> vacío: se permiten transferencias ilimitadas. | 
 | `agency_id` | ID extranjera que hace referencia a `agency.agency_id` | **Condicionalmente Obligatorio** | Identifica la agencia relevante para una tarifa.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si se definen varias agencias en [agency.txt](#agencytxt).<br> - Recomendado lo contrario. | 
 | `transfer_duration` | Entero no negativo | Opcional | Tiempo en segundos antes de que expire una transferencia. Cuando `transfers`=`0` este campo se puede usar para indicar por cuánto tiempo es válido un boleto o se puede dejar vacío. | 
 
### fare_rules.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`*`) 
 
 La tabla [fare_rules.txt](#fare_rulestxt) especifica cómo se aplican las tarifas en [fare_attributes.txt](#fare_attributestxt) se aplican a un itinerario. La mayoría de las estructuras de tarifas utilizan alguna combinación de las siguientes reglas: 
 
 * La tarifa depende de las estaciones de origen o destino. 
 * La tarifa depende de las zonas por las que pasa el itinerario. 
 * La tarifa depende de la ruta que utilice el itinerario. 
 
 Para ver ejemplos que demuestran cómo especificar una estructura de tarifas con [fare_rules.txt](#fare_rulestxt) y [fare_attributes.txt](#fare_attributestxt), consulte [FareExamples](https://web.archive.org/web/20111207224351/https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) en la wiki del proyecto de código abierto GoogleTransitDataFeed. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `fare_id` | ID extranjera que hace referencia a `fare_attributes.fare_id` | **Obligatorio** | Identifica una clase de tarifa. | 
 | `route_id` | ID extranjera que hace referencia a `routes.route_id` | Opcional | Identifica una ruta asociada con la clase de tarifa. Si existen varias rutas con los mismos atributos de tarifa, cree un registro en [fare_rules.txt](#fare_rulestxt) para cada ruta.<hr> *Ejemplo: Si la clase de tarifa "b" es válida en la ruta "TSW" y "TSE", el archivo [fare_rules.txt](#fare_rulestxt) contendrá estos registros para la clase de tarifa:*<br> ` id_tarifa, route_id`<br> `b,TSW`<br> `b, EET`| 
 | `origin_id` | ID extranjera que hace referencia a `stops.zone_id` | Opcional | Identifica una zona de origen. Si una clase de tarifa tiene múltiples zonas de origen, cree un registro en [fare_rules.txt](#fare_rulestxt) para cada `origin_id`.<hr> *Ejemplo: si la clase de tarifa "b" es válida para todos los viajes que se originan en la zona "2" o en la zona "8", el archivo [fare_rules.txt](#fare_rulestxt) contendrá estos registros para la clase de tarifa:*<br> `id_tarifa,...,id_origen`<br> `b,...,2`<br> `b,...,8` | 
 | `destination_id` | ID extranjera que hace referencia a `stops.zone_id` | Opcional | Identifica una zona de destino. Si una clase de tarifa tiene varias zonas de destino, cree un registro en [fare_rules.txt](#fare_rulestxt) para cada `destination_id`.<hr> *Ejemplo: Los campos `origin_id` y `destination_id` podrían usarse juntos para especificar que la clase de tarifa "b" es válida para viajar entre las zonas 3 y 4, y para viajar entre las zonas 3 y 5, el [fare_rules.txt](#fare_rulestxt) el archivo contendría estos registros para la clase de tarifa:*<br> `id_tarifa,...,id_origen,id_destino`<br> `b,...,3,4`<br> `b,...,3,5` | 
 | `contains_id` | ID extranjera que hace referencia a `stops.zone_id` | Opcional | Identifica las zonas a las que ingresará un pasajero mientras usa una clase de tarifa determinada. Se utiliza en algunos sistemas para calcular la clase de tarifa correcta.<hr> *Ejemplo: si la clase de tarifa "c" está asociada con todos los viajes en la ruta GRT que pasa por las zonas 5, 6 y 7, [fare_rules.txt](#fare_rulestxt) contendría estos registros:*<br> `id_tarifa, route_id,...,contiene_id`<br> `c,TRB,...,5`<br> `c,TRB,...,6`<br> `c,TRB,...,7`<br> *Debido a que todas las zonas `contains_id` deben coincidir para que se aplique la tarifa, un itinerario que pase por las zonas 5 y 6 pero no por la zona 7 no tendría clase de tarifa "c". Para obtener más detalles, consulte [https://code.google.com/p/googletransitdatafeed/wiki/FareExamples](https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) en la wiki del proyecto GoogleTransitDataFeed.* | 
 
### timeframes.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`*`) 
 
 Se utiliza para describir tarifas que pueden variar según la hora del día, el día de la semana o un día particular del año. Los plazos se pueden asociar con productos tarifarios en [fare_leg_rules.txt](#fare_leg_rulestxt).<br> 
 No debe haber intervalos de tiempo superpuestos para los mismos valores `timeframe_group_id` y `service_id`. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `timeframe_group_id` | ID | **Obligatorio** | Identifica un período de tiempo o un conjunto de períodos de tiempo. | 
 | `start_time` | Hora | **Condicionalmente Obligatorio** | Define el comienzo de un período de tiempo. El intervalo incluye la hora de inicio.<br> Están prohibidos valores superiores a `24:00:00`. Un valor vacío en `start_time` se considera `00:00:00`.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si se define `timeframes.end_time` .<br> - **Prohibido** en caso contrario | 
 | `end_time` | Hora | **Condicionalmente Obligatorio** | Define el final de un período de tiempo. El intervalo no incluye la hora de finalización.<br> Están prohibidos valores superiores a `24:00:00`. Un valor vacío en `end_time` se considera `24:00:00`.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si se define `timeframes.start_time` .<br> - **Prohibido** en caso contrario | 
 | `service_id` | ID extranjero que hace referencia a `calendar.service_id` o `calendar_dates.service_id` | **Obligatorio** | Identifica un conjunto de fechas en las que un período de tiempo está vigente. | 
 
#### Semántica de la hora local del marco temporal
- Al evaluar el tiempo de un evento de tarifa con [timeframes.txt](#timeframestxt), el tiempo del evento se calcula en la hora local utilizando la zona horaria local, según lo determinado por `stop_timezone`, si se especifica, de la parada o estación principal para el evento de tarifa. Si no se especifica, se debe utilizar la zona horaria de la agencia del feed. 
 - El “día actual” es la date actual del evento de tarifa, calculada en relación con la zona horaria local. El “día actual” puede ser diferente del día de servicio de un viaje de tarifa, especialmente para viajes que se extienden después de la medianoche. 
 - La “hora del día” para el evento de tarifa se calcula en relación con el “día actual” utilizando la semántica del tipo de campo Tiempo GTFS. 
 
### fare_media.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`fare_media_id`) 
 
 Para describir los diferentes medios tarifarios que se pueden emplear para utilizar productos tarifarios. Los medios tarifarios son soportes físicos o virtuales utilizados para la representación y/o validación de un producto tarifario. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `fare_media_id` | ID única | **Obligatorio** | Identifica un medio de tarifa. | 
 | `fare_media_name` | Text | Opcional | Nombre del medio tarifario.<br><br> Para los medios de tarifa que son tarjetas de transporte (`fare_media_type =2`) o aplicaciones móviles (`fare_media_type =4`), se debe incluir el `fare_media_name` y debe coincidir con el nombre del pasajero utilizado por las organizaciones que los entregan. | 
 | `fare_media_type` | Enumeración | **Obligatorio** | El tipo de medio tarifario. Las opciones válidas son:<br><br> `0` - Ninguno. Se utiliza cuando no hay medios tarifarios involucrados en la compra o validación de un producto tarifario, como pagar en efectivo a un conductor o revisor sin un boleto físico proporcionado.<br> `1` : billete físico en papel que permite a un pasajero realizar un determinado número de viajes comprados previamente o viajes ilimitados dentro de un período de tiempo fijo.<br> `2` - Tarjeta de tránsito física que tiene almacenados boletos, pases o valor monetario.<br> `3` - cEMV (Europay, Mastercard y Visa sin contacto) como contenedor de tokens de circuito abierto para la emisión de billetes basados ​​en cuentas.<br> `4`: aplicación móvil que ha almacenado tarjetas de transporte virtuales, boletos, pases o valor monetario.| 
 
### fare_products.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`fare_product_id`, `fare_media_id`) 
 
 Se utiliza para describir el rango de tarifas disponibles para la compra por los pasajeros o se tienen en cuenta al calcular la tarifa total para viajes con múltiples tramos, como los costos de transferencia. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `fare_product_id` | ID | **Obligatorio** | Identifica un producto tarifario o un conjunto de productos tarifarios.<br><br> Varios registros en [fare_products.txt](#fare_productstxt) pueden compartir el mismo `fare_product_id`, en cuyo caso todos los registros con esa ID se recuperarán cuando se haga referencia a ellos desde otro archivo.<br><br> Varios registros pueden compartir el mismo `fare_product_id` pero con diferentes `fare_media_id`, lo que indica varios métodos disponibles para emplear el producto de tarifa, potencialmente a diferentes precios. | 
 | `fare_product_name` | Text | Opcional | El nombre del producto de tarifa que se muestra a los pasajeros. | 
 | `fare_media_id` | ID extranjera que hace referencia a `fare_media.fare_media_id` | Opcional | Identifica un medio tarifario que se puede emplear para utilizar el producto tarifario durante el viaje. Cuando `fare_media_id` está vacío, se considera que el medio de tarifa es desconocido.| 
 | `amount` | Cantidad de moneda | **Obligatorio** | El costo del producto tarifario. Puede ser negativo para representar descuentos en transferencias. Puede ser cero para representar un producto tarifario gratuito. | 
 | `currency` | Código de moneda | **Obligatorio** | La moneda del costo del producto tarifario. | 
 
 
### fare_leg_rules.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`network_id, from_area_id, to_area_id, from_timeframe_group_id, to_timeframe_group_id, fare_product_id`) 
 
 Reglas de tarifa para tramos individuales de viaje. 
 
 Las Tarifas en [`fare_leg_rules.txt`](#fare_leg_rulestxt) deben consultarse filtrando todos los registros en el archivo para encontrar reglas que coincidan con el tramo que viajará el pasajero. 
 
 Para procesar el costo de un tramo: 
 
 1. El archivo [fare_leg_rules.txt](#fare_leg_rulestxt) debe ser filtrado por los campos que definen las características del viaje, estos campos son: 
 - `fare_leg_rules.network_id` 
 - `fare_leg_rules.from_area_id` 
 - `fare_leg_rules.to_area_id` 
 - `fare_leg_rules.from_timeframe_group_id` 
 - `fare_leg_rules.to_timeframe_group_id` 
<br/> 
 
 2. Si el tramo coincide exactamente con un registro en [fare_leg_rules.txt](#fare_leg_rulestxt) según las características del viaje, ese registro debe procesarse para determinar el costo del tramo. Este archivo maneja entradas vacías de dos maneras: semántica vacía O rule_priority. 
<br/> 
 
 3. Si no se encuentran coincidencias exactas Y el campo `rule_priority` no existe, entonces se deben verificar las entradas vacías en `fare_leg_rules.network_id`, `fare_leg_rules.from_area_id` y `fare_leg_rules.to_area_id` para procesar la costo del tramo: 
 - Una entrada vacía en `fare_leg_rules.network_id` corresponde a todas las redes definidas en [routes.txt](#routestxt) o [networks.txt](#networkstxt) excluyendo las enumeradas en `fare_leg_rules.network_id` 
 
 - Una entrada vacía en `fare_leg_rules.from_area_id` corresponde a todas las áreas definidas en `areas.area_id` excluyendo las enumeradas en `fare_leg_rules.from_area_id` 
 - Una entrada vacía en `fare_leg_rules.to_area_id` corresponde a todas las áreas definidas en `areas.area_id` excluyendo las enumeradas en `fare_leg_rules.to_area_id` 
<br/> 
 
 4. Si el campo `rule_priority` existe, entonces- Una entrada vacía en `fare_leg_rules.network_id` indica que la red del tramo no afecta la coincidencia de esta regla. 
 - Una entrada vacía en `fare_leg_rules.from_area_id` indica que el área de salida del tramo no afecta la coincidencia de esta regla. 
 - Una entrada vacía en `fare_leg_rules.to_area_id` indica que el área de llegada del tramo no afecta la coincidencia de esta regla. 
<br/> 
 
 5. Si el tramo no cumple ninguna de las reglas descritas anteriormente, entonces se desconoce la tarifa. 
 
<br/> 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `leg_group_id` | ID | Opcional | Identifica un grupo de entradas en [fare_leg_rules.txt](#fare_leg_rulestxt).<br><br> Se utiliza para describir las reglas de transferencia de tarifas entre `fare_transfer_rules.from_leg_group_id` y `fare_transfer_rules.to_leg_group_id`.<br><br> Varias entradas en [fare_leg_rules.txt](#fare_leg_rulestxt) pueden pertenecer al mismo `fare_leg_rules.leg_group_id`.<br><br> La misma entrada en [fare_leg_rules.txt](#fare_leg_rulestxt) (sin incluir `fare_leg_rules.leg_group_id`) no debe pertenecer a múltiples `fare_leg_rules.leg_group_id`.| 
 | `network_id` | ID externo que hace referencia a `routes.network_id` o `networks.network_id`| Opcional | Identifica una red de rutas que se aplica a la regla de tramo de tarifa.<br><br> Si el campo `rule_priority` no existe Y no hay valores `fare_leg_rules.network_id` que coincidan con el `network_id` que se está filtrando, `fare_leg_rules.network_id` vacío coincidirá de forma predeterminada.<br><br> Una entrada vacía en `fare_leg_rules.network_id` corresponde a todas las redes definidas en [routes.txt](#routestxt) o [networks.txt](#networkstxt), excluyendo las que figuran en `fare_leg_rules.network_id`<br><br> Si el campo `rule_priority` existe en el archivo, un `fare_leg_rules.network_id` vacío indica que la red de rutas del tramo no afecta la coincidencia de esta regla. | 
 | `from_area_id` | ID extranjera que hace referencia a `areas.area_id` | Opcional | Identifica una zona de salida.<br><br> Si el campo `rule_priority` no existe Y no hay valores `fare_leg_rules.from_area_id` que coincidan con el `area_id` que se está filtrando, `fare_leg_rules.from_area_id` vacío coincidirá de forma predeterminada.<br><br> Una entrada vacía en `fare_leg_rules.from_area_id` corresponde a todas las áreas definidas en `areas.area_id`, excluyendo las que figuran en `fare_leg_rules.from_area_id`<br><br> Si el campo `rule_priority` existe en el archivo, un `fare_leg_rules.from_area_id` vacío indica que el área de salida del tramo no afecta la coincidencia de esta regla. | 
 | `to_area_id` | ID extranjera que hace referencia a `areas.area_id` | Opcional | Identifica una zona de llegada.<br><br> Si el campo `rule_priority` no existe Y no hay valores `fare_leg_rules.to_area_id` que coincidan con el `area_id` que se está filtrando, `fare_leg_rules.to_area_id` vacío coincidirá de forma predeterminada.<br><br> Una entrada vacía en `fare_leg_rules.to_area_id` corresponde a todas las áreas definidas en `areas.area_id`, excluyendo las que figuran en `fare_leg_rules.to_area_id`<br><br> Si el campo `rule_priority` existe en el archivo, un `fare_leg_rules.to_area_id` vacío indica que el área de llegada del tramo no afecta la coincidencia de esta regla. | 
 | `from_timeframe_group_id` | ID extranjero que hace referencia a `timeframes.timeframe_group_id` | Opcional | Define el período de tiempo para el evento de validación de tarifa al inicio del tramo de tarifa.<br><br> La “hora de inicio” del tramo de tarifa es la hora en la que está programado que ocurra el evento. Por ejemplo, la hora podría ser la hora de salida programada de un autobús al inicio de un tramo de tarifa donde el pasajero sube y valida su tarifa. Para la semántica de coincidencia de reglas a continuación, la hora de inicio se calcula en hora local, según lo determinado por [Semántica de hora local](#semantica-de-la-hora-local-del-marco-temporal) de [timeframes.txt](#timeframestxt). La parada o estación del evento de salida del tramo de tarifa debe usarse para la resolución de zona horaria, cuando corresponda.<br><br> Para una regla de tramo de tarifa que especifica un `from_timeframe_group_id`, esa regla coincidirá con un tramo en particular si existe al menos un registro en [timeframes.txt](#timeframestxt) donde se cumplan todas las condiciones siguientes<br> - El valor de `timeframe_group_id` es igual al valor de `from_timeframe_group_id` .<br> - El conjunto de días identificado por el `service_id` del registro contiene el “día actual” de la hora de inicio del tramo de tarifa.<br> - La “hora del día” de inicio del tramo de tarifa es mayor o igual que el valor `timeframes.start_time` del registro y menor que el valor `timeframes.end_time` .<br><br> Un `fare_leg_rules.from_timeframe_group_id` vacío indica que la hora de inicio del tramo no afecta la coincidencia de esta regla. | 
 | `to_timeframe_group_id` | ID extranjero que hace referencia a `timeframes.timeframe_group_id` | Opcional | Define el período de tiempo para el evento de validación de tarifa al final del tramo de tarifa.<br><br> La “hora de finalización” del tramo de tarifa es la hora en la que está programado que ocurra el evento. Por ejemplo, la hora podría ser la hora de llegada programada de un autobús al final de un tramo de tarifa donde el pasajero se baja y valida su tarifa. Para la semántica de coincidencia de reglas a continuación, la hora de finalización se calcula en hora local, según lo determinado por [Semántica de hora local](#semantica-de-la-hora-local-del-marco-temporal) de [timeframes.txt](#timeframestxt). La parada o estación del evento de llegada del tramo de tarifa debe usarse para la resolución de zona horaria, cuando corresponda.<br><br> Para una regla de tramo de tarifa que especifica un `to_timeframe_group_id`, esa regla coincidirá con un tramo en particular si existe al menos un registro en [timeframes.txt](#timeframestxt) donde se cumplan todas las condiciones siguientes<br> - El valor de `timeframe_group_id` es igual al valor de `to_timeframe_group_id` .<br> - El conjunto de días identificado por el `service_id` del registro contiene el “día actual” de la hora de finalización del tramo de tarifa.<br> - La “hora del día” de finalización del tramo de tarifa es mayor o igual que el valor `timeframes.start_time` del registro y menor que el valor `timeframes.end_time` .<br><br> Un `fare_leg_rules.to_timeframe_group_id` vacío indica que la hora de finalización del tramo no afecta la coincidencia de esta regla. | 
 | `fare_product_id` | ID extranjera que hace referencia a `fare_products.fare_product_id` | **Obligatorio** | El producto tarifario requerido para viajar el tramo. | 
 | `prioridad_regla` | Entero no negativo | Opcional | Define el orden de prioridad en el que se aplican las reglas de coincidencia a los tramos, permitiendo que ciertas reglas tengan prioridad sobre otras. Cuando coincidan varias entradas en `fare_leg_rules.txt`, se seleccionará la regla o conjunto de reglas con el valor más alto para `rule_priority`.<br><br> Un valor vacío para `rule_priority` se trata como cero. | 
 
### fare_transfer_rules.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`from_leg_group_id, to_leg_group_id, fare_product_id, transfer_count, length_limit`) 
 
 Reglas de tarifas para transferencias entre tramos de viaje definido en [`fare_leg_rules.txt`](#fare_leg_rulestxt). 
 
 Para procesar el costo de un viaje de varios tramos: 
 
 1. Los grupos de tramos de tarifa aplicables definidos en `fare_leg_rules.txt` deben determinarse para todos los tramos individuales de viaje en función del viaje del pasajero. 
 2. El archivo [fare_transfer_rules.txt](#fare_transfer_rulestxt) debe ser filtrado por los campos que definen las características de la transferencia, estos campos son: 
 - `fare_transfer_rules.from_leg_group_id` 
 - `fare_transfer_rules.to_leg_group_id`<br/> 
<br/> 
 
 3. Si la transferencia coincide exactamente con un registro en [fare_transfer_rules.txt](#fare_transfer_rulestxt) según las características de la transferencia, entonces ese registro debe procesarse para determinar el costo de la transferencia. 
 4. Si no se encuentran coincidencias exactas, entonces se deben verificar las entradas vacías en `from_leg_group_id` o en `to_leg_group_id` para procesar el costo de transferencia: 
 - Una entrada vacía en `fare_transfer_rules.from_leg_group_id` corresponde a todos los grupos de tramos definidos en `fare_leg_rules.leg_group_id`, excluyendo los que figuran en `fare_transfer_rules.from_leg_group_id` 
 - Una entrada vacía en `fare_transfer_rules.to_leg_group_id` corresponde a todos los grupos de tramos definidos en `fare_leg_rules.leg_group_id`, excluyendo los que figuran en `fare_transfer_rules.to_leg_group_id`<br/> 
<br/> 
 5. Si la transferencia no cumple con ninguna de las reglas descritas anteriormente, entonces no hay acuerdo de transferencia y los tramos se consideran separados. 
 
<br/> 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `from_leg_group_id` | ID extranjera que hace referencia a `fare_leg_rules.leg_group_id` | Opcional | Identifica un grupo de reglas de tramo de tarifa previa a la transferencia.<br><br> Si no hay valores `fare_transfer_rules.from_leg_group_id` que coincidan con el `leg_group_id` que se está filtrando, `fare_transfer_rules.from_leg_group_id` vacío coincidirá de forma predeterminada.<br><br> Una entrada vacía en `fare_transfer_rules.from_leg_group_id` corresponde a todos los grupos de tramos definidos en `fare_leg_rules.leg_group_id`, excluyendo los que figuran en `fare_transfer_rules.from_leg_group_id`| 
 | `to_leg_group_id` | ID extranjera que hace referencia a `fare_leg_rules.leg_group_id` | Opcional | Identifica un grupo de reglas de tramo de tarifa posterior a la transferencia.<br><br> Si no hay valores `fare_transfer_rules.to_leg_group_id` que coincidan con el `leg_group_id` que se está filtrando, `fare_transfer_rules.to_leg_group_id` vacío coincidirá de forma predeterminada.<br><br> Una entrada vacía en `fare_transfer_rules.to_leg_group_id` corresponde a todos los grupos de tramos definidos en `fare_leg_rules.leg_group_id`, excluyendo los que figuran en `fare_transfer_rules.to_leg_group_id` | 
 | `transfer_count` | Entero distinto de cero | **Condicionalmente Prohibido** | Define a cuántas transferencias consecutivas se puede aplicar la regla de transferencia.<br><br> Las opciones válidas son:<br> `-1` - Sin límite.<br> `1` o más: define cuántas transferencias puede abarcar la regla de transferencia.<br><br> Si un subviaje coincide con varios registros con diferentes `transfer_count`, entonces se debe seleccionar la regla con el mínimo `transfer_count` que sea mayor o igual al recuento de transferencias actual del subviaje.<br><br> Condicionalmente Prohibido:<br> - **Prohibido** si `fare_transfer_rules.from_leg_group_id` no es igual a `fare_transfer_rules.to_leg_group_id`.<br> - **Obligatorio** si `fare_transfer_rules.from_leg_group_id` es igual a `fare_transfer_rules.to_leg_group_id`. | 
 | `duration_limit` | Entero positivo | Opcional | Define el límite de duración de la transferencia.<br><br> Debe expresarse en incrementos enteros de segundos.<br><br> Si no hay límite de duración, `fare_transfer_rules.duration_limit` debe estar vacío. | 
 | `duration_limit_type` | Enumeración | **Condicionalmente Obligatorio** | Define el inicio y el final relativos de `fare_transfer_rules.duration_limit`.<br><br> Las opciones válidas son:<br> `0` - Entre la validación de la tarifa de salida del tramo actual y la validación de la tarifa de llegada del siguiente tramo.<br> `1` - Entre la validación de la tarifa de salida del tramo actual y la validación de la tarifa de salida del siguiente tramo.<br> `2` - Entre la validación de la tarifa de llegada del tramo actual y la validación de la tarifa de salida del siguiente tramo.<br> `3` - Entre la validación de la tarifa de llegada del tramo actual y la validación de la tarifa de llegada del siguiente tramo.<br><br> Condicionalmente Obligatorio:<br> - **Obligatorio** si se define `fare_transfer_rules.duration_limit` .<br> - **Prohibido** si `fare_transfer_rules.duration_limit` está vacío. | 
 | `fare_transfer_type` | Enumeración | **Obligatorio** | Indica el método de procesamiento de costos de transferencia entre tramos en un viaje:<br> ![](../../assets/2-leg.svg)<br> Las opciones válidas son:<br> `0` - Desde el tramo `fare_leg_rules.fare_product_id` más `fare_transfer_rules.fare_product_id`; A+AB.<br> `1` - Desde el tramo `fare_leg_rules.fare_product_id` más `fare_transfer_rules.fare_product_id` más hacia el tramo `fare_leg_rules.fare_product_id`; A + AB + B.<br> `2` - `fare_transfer_rules.fare_product_id`; AB.<br><br> Interacciones de procesamiento de costos entre múltiples transferencias en un viaje:<br> ![](../../assets/3-leg.svg)<br><table><thead><tr><th> `fare_transfer_type`</th><th> Procesamiento A > B</th><th> Procesamiento B > C</th></tr></thead><tbody><tr><td> `0`</td><td> A+AB</td><td> S + antes de Cristo</td></tr><tr><td> `1`</td><td> A+AB+B</td><td> S + BC + C</td></tr><tr><td> `2`</td><td> AB</td><td> S + antes de Cristo</td></tr></tbody></table> Donde S indica el costo total procesado de los tramos y transferencias anteriores. | 
 | `fare_product_id` | ID extranjera que hace referencia a `fare_products.fare_product_id` | Opcional | El producto de tarifa requerido para realizar transferencias entre dos tramos de tarifa. Si está vacío, el coste de la regla de transferencia es 0.| 
 
 
### areas.txt 
 
 Archivo: **Opcional** 
 
 Clave primaria (`area_id`) 
 
 Define identificadores de área. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `area_id` | ID única | **Obligatorio** | Identifica un área. Debe ser único en [areas.txt](#areastxt). | 
 | `area_name` | Text | **Opcional** | El nombre del área tal como se muestra al ciclista. | 
 
### stop_areas.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`*`) 
 
 Asigna paradas desde [stops.txt](#stopstxt) a áreas. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `area_id` | ID extranjera que hace referencia a `areas.area_id` | **Obligatorio** | Identifica un área a la que pertenecen uno o varios `stop_id`. El mismo `stop_id` puede definirse en muchos `area_id` s. | 
 | `stop_id` | ID extranjera que hace referencia a `stops.stop_id` | **Obligatorio** | Identifica una parada. Si una estación (es decir, una parada con `stops.location_type=1`) se define en este campo, se supone que todos sus andenes (es decir, todas las paradas con `stops.location_type=0` que tienen esta estación definida como `stops.parent_station`) son parte de la misma área. Este comportamiento se puede anular asignando plataformas a otras áreas. | 
 
### networks.txt 
 
 Archivo: **Condicionalmente Prohibido** 
 
 Clave principal (`network_id`) 
 
 Define identificadores de red que se aplican a las reglas de tramo de tarifa. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `network_id` | ID única | **Obligatorio** | Identifica una red. Debe ser único en [networks.txt](#networkstxt). | 
 | `network_name` | Text | **Opcional** | El nombre de la red que aplica las reglas de tramo de tarifa, tal como lo utilizan la agencia local y sus pasajeros. 
 
### route_networks.txt 
 
 Archivo: **Condicionalmente Prohibido** 
 
 Clave principal (`route_id`) 
 
 Asigna rutas desde [routes.txt](#routestxt) a redes. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `network_id` | ID extranjera que hace referencia a `networks.network_id` | **Obligatorio** | Identifica una red a la que pertenecen uno o varios `route_id`. Un `route_id` solo se puede definir en un `network_id`. | 
 | `route_id` | ID extranjera que hace referencia a `routes.route_id` | **Obligatorio** | Identifica una ruta. | 
 
### shapes.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`shape_id`, `shape_pt_sequence`) 
 
 Las Shapes describen la ruta que recorre un vehículo a lo largo de un alineación de ruta, y se definen en el archivo shapes.txt. Las Shapes están asociadas con Viajes y constan de una secuencia de puntos por los que pasa el vehículo en orden. No es necesario que las Shapes intercepten la ubicación de las Paradas exactamente, pero todas las Paradas de un viaje deben estar dentro de una pequeña distancia de la forma de ese viaje, es decir, cerca de segmentos de línea recta que conectan los puntos de la forma. El archivo shapes.txt debe incluirse para todos los servicios basados ​​en rutas (no para los servicios bajo demanda basados ​​en zonas).

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `shape_id` | ID | **Obligatorio** | Identifica una forma. | 
 | `shape_pt_lat` | Latitud | **Obligatorio** | Latitud de un punto de forma. Cada registro en [shapes.txt](#shapestxt) representa un punto de forma utilizado para definir la forma. | 
 | `shape_pt_lon` | Longitud | **Obligatorio** | Longitud de un punto de forma. | 
 | `shape_pt_sequence` | Entero no negativo | **Obligatorio** | Secuencia en la que los puntos de la forma se conectan para formar la forma. Los valores deben aumentar a lo largo del viaje pero no es necesario que sean consecutivos.<hr> *Ejemplo: Si la forma "A_shp" tiene tres puntos en su definición, el archivo [shapes.txt](#shapestxt) podría contener estos registros para definir la forma:*<br> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence`<br> `A_shp,37.61956,-122.48161,0`<br> `A_shp,37.64430,-122.41070,6`<br> `A_shp,37.65863,-122.30839,11` | 
 | `shape_dist_traveled` | float no negativa | Opcional | Distancia real recorrida a lo largo de la forma desde el primer punto de la forma hasta el punto especificado en este registro. Utilizado por los planificadores de viajes para mostrar la parte correcta de la forma en un mapa. Los valores deben aumentar junto con `shape_pt_sequence`; no deben usarse para mostrar el viaje en reversa a lo largo de una ruta. Las unidades de distancia deben ser coherentes con las utilizadas en [stop_times.txt](#stop_timestxt).<br><br> Recomendado para rutas que tienen looping o inline (el vehículo cruza o recorre la misma porción de alineación en un solo viaje). <br><img src="../../../assets/inlining.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;"><br> Si un vehículo desvía o cruza la alineación de la ruta en puntos en el transcurso de un viaje, `shape_dist_traveled` es importante para aclarar cómo partes de los puntos en la alineación [shapes.txt](#shapestxt) se corresponden con los registros en [stop_times.txt](#stop_timestxt).<hr> *Ejemplo: si un autobús viaja a lo largo de los tres puntos definidos anteriormente para A_shp, los valores adicionales de `shape_dist_traveled` (que se muestran aquí en kilómetros) se verían así:*<br> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled`<br> `A_shp,37.61956,-122.48161,0,0`<br> `A_shp,37.64430,-122.41070,6,6.8310`<br> `A_shp,37.65863,-122.30839,11,15.8765` | 
 
### frequencies.txt 
 
 Archivo: **Opcional** 
 
 Clave primaria (`trip_id`, `start_time`) 
 
 [Frequencies.txt](#frequenciestxt) representa viajes que operan en intervalos regulares (tiempo entre viajes). Este archivo se puede utilizar para representar dos tipos diferentes de servicio. 
 
 * Servicio basado en frecuencia (`exact_times`=`0`) en el que el servicio no sigue un horario fijo a lo largo del día. En cambio, los operadores intentan mantener estrictamente intervalos predeterminados para los viajes. 
 * Una representación comprimida del servicio basado en horarios (`exact_times`= `1`) que tiene exactamente el mismo intervalo para viajes durante períodos de tiempo específicos. En los servicios basados ​​en horarios, los operadores intentan cumplir estrictamente un horario. 
 
 
 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `trip_id` | ID extranjera que hace referencia a `trips.trip_id` | **Obligatorio** | Identifica un viaje al que se aplica el intervalo de servicio especificado. | 
 | `start_time` | Hora | **Obligatorio** | Hora a la que sale el primer vehículo de la primera parada del viaje con el intervalo especificado. | 
 | `end_time` | Hora | **Obligatorio** | Hora en la que el servicio cambia a otro intervalo (o cesa) en la primera parada del viaje. | 
 | `headway_secs` | Entero positivo | **Obligatorio** | Tiempo, en segundos, entre salidas desde la misma parada (avance) del viaje, durante el intervalo de tiempo especificado por `start_time` y `end_time`. Se pueden definir varios intervalos para el mismo viaje, pero no deben superponerse. Los nuevos avances pueden comenzar en el momento exacto en que termina el avance anterior. | 
 | `exact_times` | Enumeración | Opcional | Indica el tipo de servicio para un viaje. Consulte la descripción del archivo para obtener más información. Las opciones válidas son:<br><br> `0` o vacío: viajes basados ​​en frecuencia.<br> `1` : viajes basados ​​en horarios con exactamente el mismo intervalo durante todo el día. En este caso, el valor `end_time` debe ser mayor que el último viaje deseado `start_time` pero menor que el último viaje deseado start_time + `headway_secs`. | 
 
### transfers.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`from_stop_id`, `to_stop_id`, `from_trip_id`, `to_trip_id`, `from_route_id`, `to_route_id`) 
 
 Al calcular un itinerario, las aplicaciones que consumen GTFS interpolan las transferencias según el tiempo permitido y la proximidad de las paradas. [Transfers.txt](#transferstxt) especifica reglas adicionales y anulaciones para transferencias seleccionadas. 
 
 Los campos `from_trip_id`, `to_trip_id`, `from_route_id` y `to_route_id` permiten órdenes más altos de especificidad para las reglas de transferencia. Junto con `from_stop_id` y `to_stop_id`, la clasificación de especificidad es la siguiente: 
 
 1. Ambos `trip_id` están definidos: `from_trip_id` y `to_trip_id`. 
 2. Un conjunto `trip_id` y `route_id` definido: (`from_trip_id` y `to_route_id`) o (`from_route_id` y `to_trip_id`). 
 3. Un `trip_id` definido: `from_trip_id` o `to_trip_id`. 
 4. Ambos `route_id` están definidos: `from_route_id` y `to_route_id`. 
 5. Un `route_id` definido: `from_route_id` o `to_route_id`. 
 6. Sólo se definen `from_stop_id` y `to_stop_id` : no se establecen campos relacionados con ruta o viaje. 
 
 Para un par ordenado dado de viaje de llegada y viaje de salida, se elige la transferencia con la mayor especificidad que se aplica entre estos dos viajes. Para cualquier par de viajes, no debería haber dos transferencias con la misma especificidad máxima que pudieran aplicarse. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `from_stop_id` | ID extranjera que hace referencia a `stops.stop_id` | **Condicionalmente Obligatorio** | Identifica una parada o estación donde comienza una conexión entre rutas. Si este campo se refiere a una estación, la regla de transferencia se aplica a todas sus paradas secundarias. Hacer referencia a una estación está prohibido para `transfer_types` 4 y 5. | 
 | `to_stop_id` | ID extranjera que hace referencia a `stops.stop_id` | **Condicionalmente Obligatorio** | Identifica una parada o estación donde finaliza una conexión entre rutas. Si este campo se refiere a una estación, la regla de transferencia se aplica a todas las paradas secundarias. Hacer referencia a una estación está prohibido para `transfer_types` 4 y 5. | 
 | `from_route_id` | ID extranjera que hace referencia a `routes.route_id` | Opcional | Identifica una ruta donde comienza una conexión.<br><br> Si se define `from_route_id`, la transferencia se aplicará al viaje de llegada en la ruta para el `from_stop_id` dado.<br><br> Si se definen tanto `from_trip_id` como `from_route_id`, `trip_id` debe pertenecer a `route_id` y `from_trip_id` tendrá prioridad. | 
 | `to_route_id` | ID extranjera que hace referencia a `routes.route_id` | Opcional | Identifica una ruta donde termina una conexión.<br><br> Si se define `to_route_id`, la transferencia se aplicará al viaje de salida en la ruta para el `to_stop_id` dado.<br><br> Si se definen tanto `to_trip_id` como `to_route_id`, `trip_id` debe pertenecer a `route_id` y `to_trip_id` tendrá prioridad. | 
 | `from_trip_id` | ID extranjera que hace referencia a `trips.trip_id` | **Condicionalmente Obligatorio** | Identifica un viaje donde comienza una conexión entre rutas.<br><br> Si se define `from_trip_id`, la transferencia se aplicará al viaje de llegada para el `from_stop_id` dado.<br><br> Si se definen tanto `from_trip_id` como `from_route_id`, `trip_id` debe pertenecer a `route_id` y `from_trip_id` tendrá prioridad. OBLIGATORIO si "`transfer_type`" es "4" o "5". | 
 | `to_trip_id` | ID extranjera que hace referencia a `trips.trip_id` | **Condicionalmente Obligatorio** | Identifica un viaje donde finaliza una conexión entre rutas.<br><br> Si se define `to_trip_id`, la transferencia se aplicará al viaje de salida para el `to_stop_id` dado.<br><br> Si se definen tanto `to_trip_id` como `to_route_id`, `trip_id` debe pertenecer a `route_id` y `to_trip_id` tendrá prioridad. OBLIGATORIO si `transfer_type` es `4` o `5`. | 
 | `transfer_type` | Enumeración | **Obligatorio** | Indica el tipo de conexión para el par especificado (`from_stop_id`, `to_stop_id`). Las opciones válidas son:<br><br> `0` o vacío: punto de transferencia Recomendado entre rutas.<br> `1` - Punto de transferencia cronometrado entre dos rutas. Se espera que el vehículo que sale espere al que llega y deje tiempo suficiente para que el pasajero pueda cambiar de ruta.<br> `2` - El traslado requiere un tiempo mínimo entre la llegada y la salida para garantizar una conexión. El tiempo necesario para la transferencia se especifica en `min_transfer_time`.<br> `3` - Los Transferencias entre rutas no son posibles en el lugar.<br> `4` - Los pasajeros pueden transferir de un viaje a otro permaneciendo a bordo del mismo vehículo (un "traslado en el asiento"). Más detalles sobre este tipo de traslado [abajo](#viajes-vinculados).<br> `5` - No se permiten transferencias en el asiento entre viajes secuenciales. El pasajero deberá descender del vehículo y volver a subir. Más detalles sobre este tipo de traslado [abajo](#viajes-vinculados). | 
 | `min_transfer_time` | Entero no negativo | Opcional | Cantidad de tiempo, en segundos, que debe estar disponible para permitir una transferencia entre rutas en las paradas especificadas. El `min_transfer_time` debe ser suficiente para permitir que un pasajero típico se mueva entre las dos paradas, incluido el tiempo de reserva para permitir la variación del horario en cada ruta. | 
 
#### Viajes vinculados 
 
 Lo siguiente se aplica a `transfer_type=4` y `=5`, que se utilizan para vincular viajes, con o sin transferencias en los asientos. 
 
 Los viajes unidos DEBE ser operados por el mismo vehículo. El vehículo PUEDE estar acoplado o desacoplado de otros vehículos. 
 
 Si se proporcionan tanto una transferencia de viajes vinculados como un block_id y producen resultados contradictorios, entonces se utilizará la transferencia de viajes vinculados. 
 
 La última parada de `from_trip_id` DEBERÍA estar geográficamente cerca de la primera parada de `to_trip_id`, y la última hora de llegada de `from_trip_id` DEBERÍA ser anterior pero cercana a la primera hora de salida de `to_trip_id`. La última hora de llegada de `from_trip_id` PUEDE ser posterior a la primera hora de salida de `to_trip_id` en caso de que el viaje `to_trip_id` se produzca el día de servicio siguiente. 
 
 Los Viajes PUEDE estar vinculados 1 a 1 en el caso normal, pero también PUEDE estar vinculados 1 a n, n a 1 o n a n para representar continuaciones de viajes más complejas. Por ejemplo, dos viajes en tren (viaje A y viaje B en el siguiente diagrama) pueden fusionarse en un solo viaje en tren (viaje C) después de una operación de acoplamiento de vehículos en una estación común: 
 
 - En un tren de 1 a n A continuación, el `trips.service_id` para cada `to_trip_id` DEBE ser idéntico. 
 - En una continuación n a 1, `trips.service_id` para cada `from_trip_id` DEBE ser idéntico. 
 - Las continuaciones n a n deben respetar ambas restricciones. 
 - Los Viajes pueden vincularse entre sí como parte de múltiples continuaciones distintas, siempre que `trip.service_id` NO DEBE superponerse en ningún día de servicio. 
 
<pre> 
 Viaje A 
 ───────────────────\ 
                     \ Viaje C 
                      ───────────── 
 Viaje B             /
 ───────────────────/
</pre> 
 
### pathways.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`pathway_id`) 
 
 Archivos [pathways.txt](#pathwaystxt) y [levels.txt](#levelstxt) utiliza una representación gráfica para describir estaciones de metro o tren, con nodos que representan ubicaciones y bordes que representan caminos. 
 
 Para navegar desde la entrada/salida de la estación (un nodo representado como una ubicación con `location_type=2`) hasta una plataforma (un nodo representado como una ubicación con `location_type=0` o vacío), el pasajero se moverá a través de pasillos, puertas de entrada, escaleras y otros bordes representados como caminos. Los nodos genéricos (nodos representados con `location_type=3`) se pueden usar para conectar rutas a lo largo de una estación. 
 
 Los Recorridos deberán definirse exhaustivamente en una estación. Si se definen rutas, se supone que todas las rutas a lo largo de la estación están representadas. Por lo tanto, se aplican las siguientes pautas: 
 
 - No hay lugares colgantes: si algún lugar dentro de una estación tiene un camino, entonces todos los lugares dentro de esa estación deben tener caminos, excepto las plataformas que tienen áreas de embarque (`location_type=4`, ver guía a continuación). 
 - No hay caminos para una plataforma con áreas de embarque: una plataforma (`location_type=0` o vacía) que tiene áreas de embarque (`location_type=4`) se trata como un objeto principal, no como un punto. En tales casos, la plataforma no deberá tener senderos asignados. Todos los caminos deberán estar asignados para cada una de las zonas de embarque de la plataforma. 
 - No hay plataformas bloqueadas: Cada plataforma (`location_type=0` o vacía) o área de embarque (`location_type=4`) debe estar conectada a al menos una entrada/salida (`location_type=2`) a través de alguna cadena de caminos. Las estaciones que no permiten un camino hacia el exterior de la estación desde una plataforma determinada son raras. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `pathway_id` | ID única | **Obligatorio** | Identifica un camino. Utilizado por los sistemas como identificador interno del registro. Debe ser único en el conjunto de datos.<br><br> Diferentes rutas pueden tener los mismos valores para `from_stop_id` y `to_stop_id`.<hr> _Ejemplo: cuando dos escaleras mecánicas están una al lado de la otra en direcciones opuestas, o cuando un conjunto de escaleras y un ascensor van del mismo lugar al mismo lugar, diferentes `pathway_id` pueden tener los mismos valores `from_stop_id` y `to_stop_id` | 
 | `from_stop_id` | ID extranjera que hace referencia a `stops.stop_id` | **Obligatorio** | Lugar en el que comienza el sendero.<br><br> Debe contener un `stop_id` que identifique una plataforma (`location_type=0` o vacía), entrada/salida (`location_type=2`), nodo genérico (`location_type=3`) o área de embarque (`location_type=4`)..<br><br> Los valores para `stop_id` que identifican estaciones (`location_type=1`) están prohibidos.| 
 | `to_stop_id` | ID extranjera que hace referencia a `stops.stop_id` | **Obligatorio** | Lugar en el que termina el camino.<br><br> Debe contener un `stop_id` que identifique una plataforma (`location_type=0` o vacía), entrada/salida (`location_type=2`), nodo genérico (`location_type=3`) o área de embarque (`location_type=4`)..<br><br> Los valores para `stop_id` que identifican estaciones (`location_type=1`) están prohibidos.| 
 | `pathway_mode` | Enumeración | **Obligatorio** | Tipo de ruta entre el par especificado (`from_stop_id`, `to_stop_id`). Las opciones válidas son:<br><br> `1` - Pasarela.<br> `2` - Escaleras.<br> `3` - Acera/viajero en movimiento.<br> `4` - Escalera mecánica.<br> `5` - Ascensor.<br> `6` - Puerta de tarifa (o puerta de pago): Un camino que cruza hacia un área de la estación donde se requiere comprobante de pago para cruzar. Las puertas de embarque pueden separar las áreas pagadas de la estación de las no pagadas, o separar diferentes áreas de pago dentro de la misma estación entre sí. Esta información se puede utilizar para evitar dirigir a los pasajeros a través de estaciones usando atajos que requerirían que los pasajeros hicieran pagos innecesarios, como indicarle a un pasajero que camine a través de una plataforma del metro para llegar a una vía de autobús.<br> `7`- Puerta de salida: Un camino que sale de un área paga hacia un área no paga donde no se requiere comprobante de pago para cruzar.| 
 | `is_bidirectional` | Enumeración | **Obligatorio** | Indica la dirección en la que se puede tomar el camino:<br><br> `0`: ruta unidireccional que solo se puede usar desde `from_stop_id` hasta `to_stop_id`.<br> `1` - Vía bidireccional que se puede utilizar en ambas direcciones.<br><br> Las puertas de salida (`pathway_mode=7`) no deben ser bidireccionales.| 
 | `length` | float no negativa | Opcional | Longitud horizontal en metros del camino desde la ubicación de origen (definida en `from_stop_id`) hasta la ubicación de destino (definida en `to_stop_id`).<br><br> Este campo se recomienda para pasarelas (`pathway_mode=1`), puertas de pago (`pathway_mode=6`) y puertas de salida (`pathway_mode=7`).| 
 | `traversal_time` | Entero positivo | Opcional | Tiempo promedio en segundos necesario para recorrer el camino desde la ubicación de origen (definida en `from_stop_id`) hasta la ubicación de destino (definida en `to_stop_id`).<br><br> Este campo se recomienda para mover aceras (`pathway_mode=3`), escaleras mecánicas (`pathway_mode=4`) y ascensores (`pathway_mode=5`).| 
 | `stair_count` | Entero no nulo | Opcional | Número de escaleras del camino.<br><br> Un `stair_count` positivo implica que el usuario sube desde `from_stop_id` hasta `to_stop_id`. Y un `stair_count` negativo implica que el ciclista baja desde `from_stop_id` hasta `to_stop_id`.<br><br> Este campo se recomienda para escaleras (`pathway_mode=2`).<br><br> Si sólo se puede proporcionar un número estimado de escaleras, se recomienda aproximadamente 15 escaleras por 1 piso.| 
 | `max_slope` | Flotador | Opcional | Máxima relación de pendiente del camino. Las opciones válidas son:<br><br> `0` o vacío: sin pendiente.<br> `Float` : relación de pendiente del camino, positiva para arriba, negativa para abajo.<br><br> Este campo solo debe usarse con pasarelas (`pathway_mode=1`) y aceras móviles (`pathway_mode=3`).<hr> _Ejemplo: en EE. UU., 0,083 (también escrito 8,3%) es la relación de pendiente máxima para una silla de ruedas impulsada manualmente, lo que significa un aumento de 0,083 m (es decir, 8,3 cm) por cada 1 m._| 
 | `min_width` | float positiva | Opcional | Ancho mínimo del camino en metros.<br><br> Este campo es recomendable si el ancho mínimo es inferior a 1 metro.| 
 | `signposted_as` | Text | Opcional | Texto orientado al público de señalización física que sea visible para los pasajeros.<br><br> Puede usarse para proporcionar instrucciones de texto a los pasajeros, como "siga las señales hasta". El texto en `singposted_as` debe aparecer exactamente como está impreso en los carteles.<br><br> Cuando la señalización física es multilingüe, este campo se puede completar y traducir siguiendo el ejemplo de `stops.stop_name` en la definición de campo de `feed_info.feed_lang`.| 
 | `reversed_signposted_as` | Text | Opcional | Igual que `signposted_as`, pero cuando la ruta se utiliza desde `to_stop_id` hasta `from_stop_id`.| 
 
### levels.txt 
 
 Archivo: **Condicionalmente Obligatorio** 
 
 Clave principal (`level_id`) 
 
 Describe los niveles en una estación. Útil junto con [pathways.txt](#pathwaystxt). 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `level_id` | ID única | **Obligatorio** | Identifica un nivel en una estación.| 
 | `level_index` | Flotador | **Obligatorio** | Índice numérico del nivel que indica su posición relativa.<br><br> El nivel del suelo deberá tener el índice «0», indicando los niveles sobre el suelo mediante índices positivos y los niveles bajo el suelo mediante índices negativos.| 
 | `level_name` | Text | Opcional | Nombre del nivel visto por el ciclista dentro del edificio o estación.<hr> _Ejemplo: Tome el ascensor hasta "Mezzanine" o "Andén" o "-1"._| 
 
### location_groups.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`location_group_id`) 
 
 Define grupos de ubicación, que son grupos de paradas donde un pasajero puede solicitar recoger o dejar. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |----------|----|------------|-----------| 
 | `location_group_id` | ID única | **Obligatorio** | Identifica un grupo de ubicación. El ID debe ser único en todos los valores `stops.stop_id`, locations.geojson `id` y `location_groups.location_group_id` .<br><br> Un grupo de ubicación es un grupo de paradas que en conjunto indican ubicaciones donde un pasajero puede solicitar que lo recojan o lo dejen. | 
 | `location_group_name` | Text | Opcional | El nombre del grupo de ubicación que se muestra al usuario. | 
 
### location_group_stops.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`*`) 
 
 Asigna paradas desde stops.txt a grupos de ubicación. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |----------|----|------------|-----------| 
 | `location_group_id` | ID extranjero que hace referencia a `location_groups.location_group_id` | **Obligatorio** | Identifica un grupo de ubicación al que pertenecen uno o varios `stop_id`. El mismo `stop_id` se puede definir en muchos `location_group_id`. | 
 | `stop_id` | ID extranjera que hace referencia a `stops.stop_id` | **Obligatorio** | Identifica una parada perteneciente al grupo de ubicación. | 
 
 
### locations.geojson 
 
 Archivo: **Opcional** 
 
 Define zonas donde los pasajeros pueden solicitar que los recojan o los dejen mediante servicios a pedido. Estas zonas se representan como polígonos GeoJSON. 
 
: este archivo utiliza un subconjunto del formato GeoJSON, descrito en [RFC 7946](https://tools.ietf.org/html/rfc7946). 
 - El archivo `locations.geojson` debe contener una `FeatureCollection`. 
 - Una "`FeatureCollection`" define varias ubicaciones de paradas donde los pasajeros pueden solicitar que los recojan o los dejen. 
 - Cada `Feature` de GeoJSON debe tener un `id`. El "`id`" debe ser único en todos los valores de "`stops.stop_id`", locations.geojson "`id`" y "`location_group_id`". 
 - Cada `Feature` de GeoJSON debe tener objetos y claves asociadas de acuerdo con la siguiente tabla: 
 
 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 |- `type` | Cadena | **Obligatorio** | `"FeatureCollection"` de ubicaciones. | 
 |- `features` | Matriz | **Obligatorio** | Colección de objetos `"Características"` que describen las ubicaciones. | 
 |     \- `type` | Cadena | **Obligatorio** | `"Característica"` | 
 |     \- `id` | Cadena | **Obligatorio** | Identifica una ubicación. El ID debe ser único en todos los valores `stops.stop_id`, locations.geojson `id` y `location_groups.location_group_id`. | 
 |     \- `properties` | Objeto | **Obligatorio** | Claves de la propiedad de ubicación. | 
 |         \- `stop_name` | Cadena | Opcional | Indica el nombre de la ubicación tal como se muestra a los pasajeros. | 
 |         \- `stop_desc` | Cadena | Opcional | Descripción significativa de la ubicación para ayudar a orientar a los pasajeros. | 
 |     \- `geometry` | Objeto | **Obligatorio** | Geometría del lugar. | 
 |         \- `type` | Cadena | **Obligatorio** | Debe ser de tipo:<br> - `"Polígono"`<br> - `"MultiPolígono"` | 
 |         \- `coordinates` | Matriz | **Obligatorio** | Coordenadas geográficas (latitud y longitud) que definen la geometría del lugar. | 
 
### booking_rules.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`booking_rule_id`) 
 
 Define las reglas de reserva para los servicios solicitados por el pasajero 
 
 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `booking_rule_id` | ID única | **Obligatorio** | Identifica una regla. | 
 | `booking_type` | Enumeración | **Obligatorio** | Indica con cuánta antelación se puede realizar la reserva. Las opciones válidas son:<br><br> `0` - Reserva en tiempo real.<br> `1` - Hasta reserva el mismo día con aviso previo.<br> `2` - Hasta la reserva del día(s) anterior(es). | 
 | `prior_notice_duration_min` | Entero | **Condicionalmente Obligatorio** | Número mínimo de minutos antes del viaje para realizar la solicitud.<br><br> **Condicionalmente Obligatorio**:<br> - **Obligatorio** para `booking_type=1`.<br> - **Prohibido** en caso contrario. | 
 | `prior_notice_duration_max` | Entero | **Condicionalmente Prohibido** | Número máximo de minutos antes del viaje para realizar la solicitud de reserva.<br><br> **Condicionalmente Prohibido**:<br> - **Prohibido** para `booking_type=0` y `booking_type=2`.<br> - Opcional para `booking_type=1`.| 
 | `prior_notice_last_day` | Entero | **Condicionalmente Obligatorio** | Último día antes del viaje para realizar la solicitud de reserva.<br><br> Ejemplo: "El viaje debe reservarse con 1 día de anticipación antes de las 5:00 p.m." se codificará como `prior_notice_last_day=1`.<br><br> **Condicionalmente Obligatorio**:<br> - **Obligatorio** para `booking_type=2`.<br> - **Prohibido** en caso contrario. | 
 | `prior_notice_last_time` | Hora | **Condicionalmente Obligatorio** | Última hora el último día antes del viaje para realizar la solicitud de reserva.<br><br> Ejemplo: "El viaje debe reservarse con 1 día de anticipación antes de las 5 p.m." se codificará como `prior_notice_last_time=17:00:00`.<br><br> **Condicionalmente Obligatorio**:<br> - **Obligatorio** si se define `prior_notice_last_day` .<br> - **Prohibido** en caso contrario. | 
 | `prior_notice_start_day` | Entero | **Condicionalmente Prohibido** | El día más temprano antes del viaje para realizar la solicitud de reserva.<br><br> Ejemplo: "El viaje se puede reservar como mínimo con una semana de anticipación a la medianoche" se codificará como `prior_notice_start_day=7`.<br><br> **Condicionalmente Prohibido**:<br> - **Prohibido** para `booking_type=0`.<br> - **Prohibido** para `booking_type=1` si se define `prior_notice_duration_max` .<br> - Opcional en caso contrario. | 
 | `prior_notice_start_time` | Hora | **Condicionalmente Obligatorio** | Hora más temprana el primer día antes del viaje para realizar la solicitud de reserva.<br><br> Ejemplo: "El viaje se puede reservar como mínimo con una semana de anticipación a la medianoche" se codificará como `prior_notice_start_time=00:00:00`.<br><br> **Condicionalmente Obligatorio**:<br> - **Obligatorio** si se define `prior_notice_start_day` .<br> - **Prohibido** en caso contrario. | 
 | `prior_notice_service_id` | ID extranjero que hace referencia a `calendar.service_id` | **Condicionalmente Prohibido** | Indica los días de servicio en los que se cuentan `prior_notice_last_day` o `prior_notice_start_day` .<br><br> Ejemplo: si está vacío, `prior_notice_start_day=2` tendrá dos días naturales de antelación. Si se define como un `service_id` que contiene solo días hábiles (entre semana sin feriados), `prior_notice_start_day=2` tendrá dos días hábiles de anticipación.<br><br> **Condicionalmente Prohibido**:<br> - Opcional si `booking_type=2`.<br> - **Prohibido** en caso contrario. | 
 | `message` | Text | Opcional | Envíe mensajes a los pasajeros que utilizan el servicio en una "`stop_time`" al reservar el servicio de recogida y regreso a pedido. Tiene como objetivo proporcionar información mínima que se transmitirá dentro de una interfaz de usuario sobre la acción que debe realizar un usuario para utilizar el servicio. | 
 | `pickup_message` | Text | Opcional | Funciona de la misma manera que "`message`", pero se usa cuando los pasajeros solo tienen recogida a pedido. | 
 | `drop_off_message` | Text | Opcional | Funciona de la misma manera que "`message`", pero se usa cuando los pasajeros solo tienen entrega a pedido. | 
 | `phone_number` | Número de teléfono | Opcional | Número de teléfono al que llamar para realizar la solicitud de reserva. | 
 | `info_url` | URL | Opcional | URL que proporciona información sobre la regla de reserva. | 
 | `booking_url` | URL | Opcional | URL a una interfaz o aplicación online donde se puede realizar la solicitud de reserva. | 
 
### translations.txt 
 
 Archivo: **Opcional** 
 
 Clave principal (`table_name`, `field_name`, `language`, `record_id`, `record_sub_id`, `field_value`) 
 
 En regiones que tienen varios idiomas oficiales, las agencias/operadores de transporte suelen tener nombres y páginas web específicos de cada idioma. Para brindar un mejor servicio a los pasajeros en esas regiones, es útil que el conjunto de datos incluya estos valores que dependen del idioma. 
 
 Si ambos métodos de referencia (`record_id`, `record_sub_id`) y `field_value` se utilizan para traducir el mismo valor en 2 filas diferentes, la traducción proporcionada con (`record_id`, `record_sub_id`) tiene prioridad. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `table_name` | Enumeración | **Obligatorio** | Define la tabla que contiene el campo a traducir. Los valores permitidos son:<br><br> - `agency`<br> - `stops`<br> - `routes`<br> - `trips`<br> - `stop_times`<br> - `pathways`<br> - `levels`<br> - `feed_info`<br> - `attributions`<br><br> Cualquier archivo agregado a GTFS tendrá un valor `table_name` equivalente al nombre del archivo, como se indica arriba (es decir, sin incluir la extensión de archivo `.txt`). | 
 | `field_name` | Text | **Obligatorio** | Nombre del campo a traducir. Los campos con tipo "Text" se pueden traducir, los campos con tipo "`URL`", "`Email`" y "`e` number`" también se pueden "traducir" para proporcionar recursos en el idioma correcto. Los campos con otros tipos no deben traducirse. | 
 | `language` | Código de idioma | **Obligatorio** | Idioma de traducción.<br><br> Si el idioma es el mismo que en `feed_info.feed_lang`, se asumirá que el valor original del campo es el valor predeterminado para usar en idiomas sin traducciones específicas (si `default_lang` no especifica lo contrario).<hr> _Ejemplo: En Suiza, una ciudad en un cantón oficialmente bilingüe se llama oficialmente “Biel/Bienne”, pero simplemente se llamaría “Bienne” en francés y “Biel” en alemán._ | 
 | `translation` | Text o URL o correo electrónico o número de teléfono | **Obligatorio** | Valor traducido. | 
 | `record_id` | ID de Extranjero | **Condicionalmente Obligatorio** | Define el registro que corresponde al campo a traducir. El valor en `record_id` debe ser el primer o único campo de la clave principal de una tabla, como se define en el atributo de clave principal para cada tabla y a continuación:<br><br> - `agency_id` para [agency.txt](#agencytxt)<br> - `stop_id` para [stops.txt](#stopstxt);<br> - `route_id` para [routes.txt](#routestxt);<br> - `trip_id` para [trips.txt](#tripstxt);<br> - `trip_id` para [stop_times.txt](#stop_timestxt);<br> - `pathway_id` para [pathways.txt](#pathwaystxt);<br> - `level_id` para [levels.txt](#levelstxt);<br> - `attribution_id` para [attributions.txt](#attributionstxt).<br><br> Los campos de las tablas no definidas anteriormente no deben traducirse. Sin embargo, a veces los productores agregan campos adicionales que están fuera de la especificación oficial y estos campos no oficiales pueden traducirse. A continuación se muestra la forma recomendada de utilizar `record_id` para esas tablas:<br><br> - `service_id` para [calendar.txt](#calendartxt);<br> - `service_id` para [calendar_dates.txt](#calendar_datestxt);<br> - `fare_id` para [fare_attributes.txt](#fare_attributestxt);<br> - `fare_id` para [fare_rules.txt](#fare_rulestxt);<br> - `shape_id` para [shapes.txt](#shapestxt);<br> - `trip_id` para [frequencies.txt](#frequenciestxt);<br> - `from_stop_id` para [transfers.txt](#transferstxt).<br><br> Condicionalmente Obligatorio:<br> - **Prohibido** si `table_name` es `feed_info`.<br> - **Prohibido** si se define `field_value` .<br> - **Obligatorio** si `field_value` está vacío. | 
 | `record_sub_id` | ID de Extranjero | **Condicionalmente Obligatorio** | Ayuda a traducir el registro que contiene el campo cuando la tabla no tiene un ID único. Por lo tanto, el valor en `record_sub_id` es el ID secundario de la tabla, como se define en la siguiente tabla:<br><br> - Ninguno para [agency.txt](#agencytxt);<br> - Ninguno para [stops.txt](#stopstxt);<br> - Ninguno para [routes.txt](#routestxt);<br> - Ninguno para [trips.txt](#tripstxt);<br> - `stop_sequence` para [stop_times.txt](#stop_timestxt);<br> - Ninguno para [pathways.txt](#pathwaystxt);<br> - Ninguno para [levels.txt](#levelstxt);<br> - Ninguno para [attributions.txt](#attributionstxt).<br><br> Los campos de las tablas no definidas anteriormente no deben traducirse. Sin embargo, a veces los productores agregan campos adicionales que están fuera de la especificación oficial y estos campos no oficiales pueden traducirse. A continuación se muestra la forma recomendada de utilizar `record_sub_id` para esas tablas:<br><br> - Ninguno para [calendar.txt](#calendartxt);<br> - `e` para [calendar_dates.txt](#calendar_datestxt);<br> - Ninguno para [fare_attributes.txt](#fare_attributestxt);<br> - `route_id` para [fare_rules.txt](#fare_rulestxt);<br> - Ninguno para [shapes.txt](#shapestxt);<br> - `start_time` para [frequencies.txt](#frequenciestxt);<br> - `to_stop_id` para [transfers.txt](#transferstxt).<br><br> Condicionalmente Obligatorio:<br> - **Prohibido** si `table_name` es `feed_info`.<br> - **Prohibido** si se define `field_value` .<br> - **Obligatorio** si se define `table_name=stop_times y `record_id`. | 
 | `field_value` | Text o URL o correo electrónico o número de teléfono | **Condicionalmente Obligatorio** | En lugar de definir qué registro se debe traducir usando `record_id` y `record_sub_id`, este campo se puede usar para definir el valor que se debe traducir. Cuando se use, la traducción se aplicará cuando los campos identificados por `table_name` y `field_name` contengan exactamente el mismo valor definido en field_value.<br><br> El campo debe tener **exactamente** el valor definido en `field_value`. Si solo un subconjunto del valor coincide con `field_value`, no se aplicará la traducción.<br><br> Si dos reglas de traducción coinciden con el mismo registro (una con `field_value` y la otra con `record_id`), la regla con `record_id` tiene prioridad.<br><br> Condicionalmente Obligatorio:<br> - **Prohibido** si `table_name` es `feed_info`.<br> - **Prohibido** si se define `record_id` .<br> - **Obligatorio** si `record_id` está vacío. | 
 
### feed_info.txt 
 
 Archivo: **Condicionalmente Obligatorio**
 
 Primary key (none) § § 
 El archivo contiene información sobre el conjunto de datos en sí, en lugar de los servicios que describe el conjunto de datos. En algunos casos, el editor del conjunto de datos es una entidad diferente a cualquiera de las agencias. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `feed_publisher_name` | Text | **Obligatorio** | Nombre completo de la organización que publica el conjunto de datos. Puede ser el mismo que uno de los valores de `agency.agency_name`. | 
 | `feed_publisher_url` | URL | **Obligatorio** | URL del sitio web de la organización que publica el conjunto de datos. Puede ser el mismo que uno de los valores de `agency.agency_url`. | 
 | `feed_lang` | Código de idioma | **Obligatorio** | Idioma predeterminado utilizado para el texto en este conjunto de datos. Esta configuración ayuda a los consumidores de GTFS a elegir reglas de uso de mayúsculas y otras configuraciones específicas del idioma para el conjunto de datos. El archivo `translations.txt` se puede utilizar si el texto necesita traducirse a idiomas distintos al predeterminado.<br><br> El idioma predeterminado puede ser multilingüe para conjuntos de datos con el texto original en varios idiomas. En tales casos, el campo `feed_lang` debe contener el código de idioma `mul` definido por la norma ISO 639-2, y se debe proporcionar una traducción para cada idioma utilizado en el conjunto de datos en `translations.txt`. Si todo el texto original del conjunto de datos está en el mismo idioma, entonces no se debe utilizar "`mul`" .<hr> _Ejemplo: considere un conjunto de datos de un país multilingüe como Suiza, con el campo original `stops.stop_name` lleno con nombres de paradas en diferentes idiomas. El nombre de cada parada se escribe según el idioma dominante en la ubicación geográfica de esa parada, por ejemplo, "`Genève`" para la ciudad de habla francesa de Ginebra, "`Zürich`" para la ciudad de habla alemana de Zurich y "`Biel/Bienne`" para la ciudad bilingüe.ciudad de Biel/Bienne. El conjunto de datos `feed_lang` debería ser `mul` y las traducciones se proporcionarían en `translations.txt`, en alemán: `Genf`, `Zürich` y `Biel`; en francés: `Genève`, `Zurich` y `Bienne`; en italiano: `Ginevra`, `Zurigo` y `Bienna`; y en inglés: `Geneva`, `Zurich` y `Biel/Bienne`._ | 
 | `default_lang` | Código de idioma | Opcional | Define el idioma que se debe utilizar cuando el consumidor de datos no conoce el idioma del pasajero. A menudo será "en" (inglés). | 
 | `feed_start_date` | Fecha | Recomendado | El conjunto de datos proporciona información de programación completa y confiable para el servicio en el período desde el comienzo del día `feed_start_date` hasta el final del día `feed_end_date`. Ambos días pueden quedar vacíos si no están disponibles. La date `feed_end_date` no debe preceder a la date `feed_start_date` si se proporcionan ambas. Se recomienda que los proveedores de conjuntos de datos proporcionen datos de programación fuera de este período para informar sobre posibles servicios futuros, pero los consumidores de conjuntos de datos deben tratarlos teniendo en cuenta su estado no autorizado. Si `feed_start_date` o `feed_end_date` se extienden más allá de las fechas del calendario activo definidas en [calendar.txt](#calendartxt) y [calendar_dates.txt](#calendar_datestxt), el conjunto de datos está haciendo una afirmación explícita de que no hay servicio para fechas dentro del rango `feed_start_date` o `feed_end_date` pero no incluido en las fechas del calendario activo. | 
 | `feed_end_date` | Fecha | Recomendado | (ver arriba) | 
 | `feed_version` | Text | Recomendado | Cadena que indica la versión actual de su conjunto de datos GTFS. Las aplicaciones que consumen GTFS pueden mostrar este valor para ayudar a los editores de conjuntos de datos a determinar si se ha incorporado el último conjunto de datos. | 
 | `feed_contact_email` | Correo electrónico | Opcional | Dirección de correo electrónico para comunicaciones sobre el conjunto de datos GTFS y las prácticas de publicación de datos. `feed_contact_email` es un contacto técnico para aplicaciones que consumen GTFS. Proporcione información de contacto de servicio al cliente a través de [agency.txt](#agencytxt). Se recomienda proporcionar al menos uno de "`feed_contact_email`" o "`feed_contact_url`". | 
 | `feed_contact_url` | URL | Opcional | URL para información de contacto, un formulario web, servicio de soporte u otras herramientas de comunicación sobre el conjunto de datos GTFS y las prácticas de publicación de datos. `feed_contact_url` es un contacto técnico para aplicaciones que consumen GTFS. Proporcione información de contacto de servicio al cliente a través de [agency.txt](#agencytxt). Se recomienda proporcionar al menos uno de "`feed_contact_url`" o "`feed_contact_email`". | 
 
### attributions.txt 
 
 Archivo: **Opcional** 
 
 Clave primaria (`attribution_id`) 
 
 El archivo define las atribuciones aplicadas al conjunto de datos. 

 | Nombre del campo | Tipo | Presencia | Descripción | 
 |------|------|------|------| 
 | `attribution_id` | ID única | Opcional | Identifica una atribución para el conjunto de datos o un subconjunto del mismo. Esto es sobre todo útil para las traducciones. | 
 | `agency_id` | ID extranjera que hace referencia a `agency.agency_id` | Opcional | Agencia a la que se aplica la atribución.<br><br> Si se define una atribución `agency_id`, `route_id` o `trip_id`, las otras deben estar vacías. Si no se especifica ninguno de ellos, la atribución se aplicará a todo el conjunto de datos. | 
 | `route_id` | ID extranjera que hace referencia a `routes.route_id` | Opcional | Funciona de la misma manera que `agency_id` excepto que la atribución se aplica a una ruta. Se pueden aplicar múltiples atribuciones a la misma ruta. | 
 | `trip_id` | ID extranjera que hace referencia a `trips.trip_id` | Opcional | Funciona de la misma manera que `agency_id` excepto que la atribución se aplica a un viaje. Es posible que se apliquen múltiples atribuciones al mismo viaje. | 
 | `organization_name` | Text | **Obligatorio** | Nombre de la organización a la que se atribuye el conjunto de datos. | 
 | `is_producer` | Enumeración | Opcional | El papel de la organización es productor. Las opciones válidas son:<br><br> `0` o vacío: la organización no tiene esta función.<br> `1` - La organización tiene esta función.<br><br> Al menos uno de los campos `is_producer`, `is_operator` o `is_authority` debe establecerse en `1`. | 
 | `is_operator` | Enumeración | Opcional | Funciona de la misma manera que `is_producer` excepto que el rol de la organización es operador. | 
 | `is_authority` | Enumeración | Opcional | Funciona de la misma manera que `is_producer` excepto que el rol de la organización es autoridad. | 
 | `attribution_url` | URL | Opcional | URL de la organización. | 
 | `attribution_email` | Correo electrónico | Opcional | Correo electrónico de la organización. | 
 | `attribution_phone` | Número de teléfono | Opcional | Número de teléfono de la organización. | 
 