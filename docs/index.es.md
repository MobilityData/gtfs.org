---
search:
  exclude: true
---


# GTFS: Hacer que los datos de transporte público sean universalmente accesibles

<div class="landing-page">
   <a class="button" href="schedule">GTFS Schedule</a><a class="button" href="realtime">GTFS Realtime</a><a class="button" href="resources">Recursos</a><a class="button" href="extensions">Extensiones</a>
</div>

El General Transit Feed SpecificationGTFS) es un [estándar abierto](https://www.interoperablemobility.org/definitions/#open_standard) utilizado para distribuir información relevante sobre los sistemas de tránsito a los usuarios. Permite a las agencias de transporte público publicar sus datos de tránsito en un formato que puede ser consumido por una amplia variedad de aplicaciones de software. En la actualidad, miles de proveedores de transporte público utilizan el formato de datos GTFS.

GTFS consta de dos partes principales: GTFS Schedule GTFS Schedule y GTFS Realtime. GTFS Schedule GTFS Schedule contiene información sobre rutas, horarios, tarifas y detalles geográficos del tránsito, y se presenta en sencillos archivos de texto. Este sencillo formato permite una fácil creación y MAINTENANCE sin depender de software complejo o propietario.

GTFS Realtime contiene actualizaciones de viajes, posiciones de vehículos y alertas de servicio. Se basa en búferes de protocolo, que son un mecanismo de lenguaje (y plataforma) neutro para serializar datos estructurados.

GTFS es compatible en todo el mundo y su uso, importancia y alcance han ido en aumento. Es probable que algún organismo que conozca ya utilice GTFS para representar rutas, Schedule, ubicaciones de paradas y otra información, y que los usuarios ya lo estén consumiendo a través de diversas aplicaciones.

[Más información sobre la historia de GTFS](background.md)

## ¿Por qué utilizar GTFS?

Más de 10.000 agencias de transporte de más de 100 países utilizan GTFS. La mayoría de las agencias de transporte han oído hablar de GTFS, que se ha convertido rápidamente en un estándar del sector. Algunas agencias producen estos datos por sí mismas, mientras que otras contratan a un proveedor para que cree y mantenga los datos por ellas. Como se trata de una norma abierta sencilla y basada en texto, muchos proveedores de tecnología de transporte ya pueden leer y escribir en archivos GTFS. Al conocer mejor GTFS, las agencias pueden tomar mejores decisiones en lo que respecta a los datos. Las decisiones que tomen las agencias sobre cómo mantener y distribuir GTFS pueden tener un gran impacto en la calidad del servicio.

### Datos abiertos significa más oportunidades y opciones

GTFS es un estándar abierto. Esto significa que los organismos pueden facilitar información utilizando cualquiera de las muchas herramientas que ya admiten GTFS (incluida la simple edición de texto con un editor de texto o una hoja de cálculo). Los estándares abiertos conducen a la creación de datos que pueden compartirse fácilmente. Un feed no es más que una colección de archivos de texto que describen un servicio, alojados en línea en un enlace permanente de acceso público. El mismo feed puede ser utilizado por Google, Apple, Transit App, Open Trip Planner e incluso aplicaciones creadas por los usuarios. Cualquiera que desee proporcionar información de tránsito precisa y actualizada puede utilizar un feed GTFS para hacerlo.

Algunos usuarios prefieren utilizar diferentes aplicaciones en función de sus necesidades, por lo que GTFS les permite elegir la aplicación de planificación de viajes que más les convenga. Algunas aplicaciones pueden ser más accesibles o proporcionar mejor información a los usuarios con discapacidades, otras pueden ser más sencillas y fáciles de usar, y a veces los usuarios sólo quieren la aplicación más reciente.

### GTFS puede hacer más de lo que crees

GTFS es más conocido por la información de planificación de viajes, sobre todo en las áreas metropolitanas con servicio de ruta fija. Sin embargo, hay una serie de funciones opcionales que van más allá de la especificación básica GTFS Schedule y que hacen que GTFS sea más ampliamente aplicable, incluyendo Fares para mostrar los costes y estructuras de las tarifas, Flex (en desarrollo) para las opciones de tránsito que responden a la demanda, como los servicios dial-a-ride y paratransit, y Pathways para mostrar información de accesibilidad que es vital para los usuarios que utilizan dispositivos de movilidad o que necesitan adaptaciones adicionales. GTFS Realtime GTFS Realtime se basa en GTFS Schedule y en los sistemas GPS de los vehículos para proporcionar actualizaciones en tiempo real sobre la ubicación de los vehículos.

### GTFS es más que planificación de viajes

En la actualidad, los datosGTFS son utilizados por una gran variedad de aplicaciones de software con fines muy diversos, entre los que se incluyen herramientas de visualización y análisis de datos para la planificación. Disponer de datos actualizados y de alta calidad proporciona información precisa sobre el tránsito no sólo a los usuarios, sino también a los planificadores y responsables políticos, que pueden comprender mejor cómo se utiliza el tránsito en sus comunidades. A partir de 2023, la Administración Federal de Tránsito de Estados Unidos exigirá [a las agencias de tránsito de ese país que presenten datos válidos GTFS](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications) con su informe anual de la Base de Datos Nacional de Tránsito.

## ¿Qué es GTFS de alta calidad?

GTFS de alta calidad es completo, preciso y actualizado. Esto significa que representa el funcionamiento actual de los servicios y proporciona toda la información posible.

### Datos completos

Un GTFS de calidad incluye detalles importantes del servicio, como los cambios de Schedule día festivo y verano, la ubicación exacta de las paradas y los nombres de las rutas y las señales de cabeza que coinciden con otros materiales dirigidos a los usuarios. Incluso si una agencia trabaja con un proveedor para producir GTFS, en última instancia depende de la agencia garantizar que la información presentada en forma impresa, a bordo y en línea sea coherente.

Para obtener información sobre la creación de datos de alta calidad, consulte las [Directrices sobre datos de tránsito de California](https://dot.ca.gov/cal-itp/california-transit-data-guidelines) y las [Buenas prácticas GTFS](schedule/best-practices).

### Al día

Disponer de datos obsoletos es casi peor que no disponer de ellos. No basta con publicar información: tiene que coincidir con lo que el usuario ve y experimenta. Algunas de las mayores agencias de transporte actualizan sus GTFS semanalmente, o incluso a diario, pero la mayoría de las agencias tendrán que actualizar sus GTFS cada pocos meses, o varias veces al año cuando se produzcan cambios en el servicio. Esto incluye cosas como nuevas rutas o paradas, cambios de horario o actualizaciones de la estructura tarifaria.

Muchas agencias contratan a un proveedor para que cree y gestione sus GTFS. Algunos proveedores pueden ser proactivos a la hora de preguntar sobre los cambios de servicio, pero es importante que las agencias se comuniquen con los proveedores sobre los próximos cambios de servicio. Es posible publicar GTFS con los cambios de servicio con antelación, asegurándose de que la transición se realiza sin problemas para todos: agencias, proveedores, planificadores de viajes y usuarios.

