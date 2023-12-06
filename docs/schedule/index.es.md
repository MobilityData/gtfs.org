---
search:
  exclude: true
---

# Visión general GTFS Schedule

<div class="landing-page">
   <a class="button" href="reference">Referencia</a>
   <a class="button" href="best-practices">Mejores prácticas</a>
   <a class="button" href="examples">Ejemplos</a>
   <a class="button" href="changes">Cambios</a>
</div>

## Cómo empezar

Un feed GTFS, que contiene información de tránsito estática, se compone de una serie de archivos de texto (.txt) que están contenidos en un único archivo ZIP. Cada archivo describe un aspecto particular de la información de tránsito: paradas, rutas, viajes, tarifas, etc. Para más información sobre cada archivo, consulte la referencia GTFS.

Para crear un feed GTFS siga los siguientes pasos.

1. Cree todos los archivos necesarios descritos en la referencia del [GTFS Schedule](reference). Cree los archivos opcionales si se desea su funcionalidad.
1. Guarde todos los archivos en formato .txt. Los valores de los campos deben estar delimitados por comas y cada línea debe terminar con un salto de línea. Consulte la referencia GTFS para obtener información detallada sobre el contenido de los archivos.
1. Comprima todos los archivos de texto juntos. El archivo comprimido comprende una versión del feed.
1. Publique el feed utilizando una de las opciones siguientes.

## Poner a disposición del público un feed de tránsito

<hr/>

Los conjuntos de datos deben publicarse en una URL pública y permanente, incluyendo el nombre del archivo zip. (por ejemplo, www.agency.org/gtfs/gtfs.zip). Idealmente, la URL debería poder descargarse directamente sin necesidad de iniciar sesión para acceder al archivo, para facilitar la descarga por parte de las aplicaciones de software consumidoras. Aunque se recomienda (y es la práctica más habitual) que un conjunto de datos GTFS pueda descargarse abiertamente, si un proveedor de datos necesita controlar el acceso a GTFS por razones de licencia o de otro tipo, se recomienda controlar el acceso al conjunto de datos GTFS mediante claves API, lo que facilitará las descargas automáticas.

El servidor web que aloja los datos GTFS debe estar configurado para informar correctamente de la fecha de modificación del archivo (véase HTTP/1.1 - Solicitud de comentarios 2616, en la sección 14.29).

Véase "[Mejores prácticas: Publicación de conjuntos de datos](best-practices/#dataset-publishing-general-practices)" para más recomendaciones.

## Formación

<hr/>

**Detalles técnicos sobre GTFS, qué es y cómo crear y mantener los datos:**

- [Visión general GTFS Schedule](schedule/)
- [Curso en línea del Banco Mundial "Introducción a los GTFS](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping)
- [MBTA GTFS Onboarding](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb)

**Ver ejemplos de feeds con diversas características:**

- [Base de datos de movilidadGTFS](https://database.mobilitydata.org/)
- [Transitland](https://www.transit.land/)

**Para herramientas gratuitas y material didáctico:**

- [Validador de horarios GTFS Schedule MobilityData](https://gtfs-validator.mobilitydata.org/)
- [Lecciones NRTAP y GTFS Builder](https://www.nationalrtap.org/Technology-Tools/GTFS-Builder/Support)
- [Herramientas de datos Arcadis IBI](https://www.ibigroup.com/ibi-products/transit-data-tools/)

**Para obtener ideas sobre proveedores que ofrecen servicios GTFS:**

- [Center for Urban Transportation Research, University of South Florida Lista de proveedores GTFS](https://docs.google.com/spreadsheets/u/1/d/1Gc9mu4BIYC8ORpv2IbbVnT3q8VQ3xkeY7Hz068vT_GQ/pubhtml)

Ver más [cursos en línea](../resources/other/#on-line-courses).

## Conseguir ayuda y comunidad

<hr/>

### Listas de correo

Existen varias listas de correo que pueden ser un buen recurso cuando se tienen preguntas sobre datos de transporte público, software, formatos como GTFS y GTFS, y otras cuestiones:

* [Cambios de GTFS](https://groups.google.com/group/gtfs-changes): discusión de la propuesta de ampliación de la especificación GTFS, tal y como se recoge en el documento [Cambios de GTFS](https://github.com/google/transit/blob/master/gtfs/CHANGES.md).
* [GTFS Realtime](https://groups.google.com/group/gtfs-realtime): discusión de la [especificación GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime).
* [MobilityData Slack](https://mobilitydata-io.slack.com/): Organización de Slack con canales dedicados a temas de GTFS. [Solicite una invitación a mobilitydata-io.slack.com aquí](https://share.mobilitydata.org/slack).
* [transitfeed](https://groups.google.com/group/transitfeed): debate sobre el proyecto de código abierto [transitfeed](https://groups.google.com/group/transitfeed), así como sobre la especificación GTFS y las herramientas asociadas.
* [transit-developers](https://groups.google.com/group/transit-developers): discusiones generales de desarrolladores de transporte. Muchas agencias de transporte también tienen sus propias listas de correo para desarrolladores, específicas para la agencia. Por ejemplo:
    * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
    * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
    * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
    * [MassDOT](https://groups.google.com/group/massdotdevelopers)
    * [Región de Atlanta, GA](https://groups.google.com/forum/#!forum/atl-transit-developers)
    * [511 San Francisco Bay Area Developer Resources](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)

Consulta con tu agencia de transporte local para ver si tienen una lista de correo propia.

Vea más recursos de [la comunidad](../resources/community).
