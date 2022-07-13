# Visión general ScheduleGTFS

<div class="landing-page">
   <a class="button" href="reference">Referencia</a>
   <a class="button" href="best-practices">Mejores prácticas</a>
   <a class="button" href="examples">Ejemplos</a>
   <a class="button" href="changes">Cambios</a>
</div>

## Cómo empezar

Un feed GTFS, que contiene información de tránsito estática, se compone de una serie de archivos de texto (.txt) que están contenidos en un único archivo ZIP. Cada archivo describe un aspecto particular de la información de tránsito: paradas, rutas, viajes, tarifas, etc. Para más información sobre cada archivo, consulte la referencia GTFS.

Para crear un feed GTFS siga los siguientes pasos.

1. Cree todos los archivos necesarios descritos en la referencia del [ScheduleGTFS](reference). Cree los archivos opcionales si se desea su funcionalidad.
1. Guarde todos los archivos en formato .txt. Los valores de los campos deben estar delimitados por comas y cada línea debe terminar con un salto de línea. Consulte la referencia GTFS para obtener información detallada sobre el contenido de los archivos.
1. Comprima todos los archivos de texto juntos. El archivo comprimido comprende una versión del feed.
1. Publique el feed utilizando una de las opciones siguientes.

## Poner a disposición del público un feed de tránsito

<hr/>

Los conjuntos de datos deben publicarse en una URL pública y permanente, incluyendo el nombre del archivo zip. (por ejemplo, [GTFS/GTFS.zip">GTFS](<http://www.agency.org/\<glossary variable=>). Idealmente, la URL debería poder descargarse directamente sin necesidad de iniciar sesión para acceder al archivo, para facilitar la descarga por parte de las aplicaciones de software consumidoras. Aunque se recomienda (y es la práctica más habitual) que un conjunto de datos GTFS pueda descargarse abiertamente, si un proveedor de datos necesita controlar el acceso a GTFS por razones de licencia o de otro tipo, se recomienda controlar el acceso al conjunto de datos GTFS mediante claves API, lo que facilitará las descargas automáticas.

El servidor web que aloja los datos GTFS debe estar configurado para informar correctamente de la fecha de modificación del archivo (véase HTTP/1.1 - Solicitud de comentarios 2616, en la sección 14.29).

Véase "[Mejores prácticas: Publicación de conjuntos de datos](best-practices/#dataset-publishing-general-practices)" para más recomendaciones.

## Formación

<hr/>

El Open Learning Campus (OLC) del Banco Mundial ofrece un curso en línea autodidáctico llamado "[GTFS-and-informal-transit-system-mapping">Introducción a](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)la[GTFS-and-informal-transit-system-mapping"> General Transit Feed Specification (GTFS](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)) y a la Cartografía del Sistema de Tránsito Informal". Este curso incluye las siguientes secciones:

* ¿Qué es el GTFS? Historia y estructura de los archivos
* ¿Qué es el GTFS? Visualización y comunidad
* Configuración de una fuente GTFS
* Introducción a GitHub y a las herramientas de código abierto
* Historias de campo
* Cómo mapear los datos de tránsito
* Cómo recopilar datos para el primer feed de una ciudad
* Encuesta sobre la aplicación
* GTFS

Ver más [cursos en](../resources/other/#on-line-courses) línea.

## Conseguir ayuda y comunidad

<hr/>

### Listas de correo

Existen varias listas de correo que pueden ser un buen recurso cuando se tienen preguntas sobre datos de transporte público, software, formatos como GTFS y GTFS, y otras cuestiones:

* [GTFS-changes">Cambios enGTFS](<https://groups.google.com/group/\<glossary variable=>)[GTFS-changes">GTFS](<https://groups.google.com/group/\<glossary variable=>)[GTFS-changes">GTFS](<https://groups.google.com/group/\<glossary variable=>): discusión de la propuesta para extender la especificación GTFS.
* [MobilityData Slack](https://mobilitydata-io.slack.com/): Organización de Slack en con canales dedicados a temas de GTFS. [Solicite una invitación a mobilitydata-io.slack.com aquí](https://share.mobilitydata.org/slack).
* [Desarrolladores de Tránsito](https://groups.google.com/group/transit-developers): discusiones generales de desarrolladores de tránsito. Muchas agencias de tránsito también tienen sus propias listas de correo para desarrolladores específicas de la agencia. Por ejemplo:
  * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
  * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
  * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
  * [MassDOT](https://groups.google.com/group/massdotdevelopers)
  * [Región de Atlanta, GA](https://groups.google.com/forum/#!forum/atl-transit-developers)
  * [511 Recursos para desarrolladores del Área de la Bahía de San Francisco](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)
* Consulta con tu agencia de transporte local para ver si tienen una lista de correo propia.

Vea más recursos de [la comunidad](../resources/community).
