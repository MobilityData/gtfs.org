# Hacer que su feed GTFS esté disponible públicamente

## Beneficios de compartir su GTFS 

Los datos GTFS se pueden utilizar de muchas maneras, y compartir públicamente los datos GTFS de su agencia proporciona muchos beneficios a sus usuarios y a su agencia en general..Estos incluyen: 
 
- Integrar su feed en aplicaciones de planificación de viajes móviles y basadas en la web, permitiendo a los pasajeros planificar viajes en su sistema
- Enviar su feed a un agregador GTFS como Mobility Database, que proporciona una información más amplia audiencia y más visibilidad para su agencia
- Uso de herramientas que permiten visualizar y analizar datos GTFS en Sistemas de Información Geográfica (GIS) y otros programas de análisis basados ​​en mapas

### Aplicaciones de planificación de viajes 
 
Cuándo Los datos GTFS de su agencia se comparten públicamente y pueden ser utilizados por una variedad de aplicaciones de planificación de viajes además de Google Maps. Estas pueden incluir otras aplicaciones de navegación como Bing Maps, Apple Maps, así como plataformas específicas de transporte como Transit, Moovit, Transportr y Citymapper. Además, el acceso a datos de fuentes abiertas permite a los desarrolladores crear aplicaciones orientadas a regiones particulares o que pueden tener funciones que no están incluidas en los planificadores de viajes estándar, como: Vamos (condados de San Joaquín y Stanislaus, California), MetroHero (Washington DC zona), Entur (Noruega), y más. 
 
### Agregadores de feeds 
 
 Compartir sus datos GTFS también permite que sean indexados por plataformas de agregación de feeds GTFS, que pueden incluir directorios de feeds GTFS a nivel estatal o regional, así como agregadores de feeds internacionales como la [Base de datos de movilidad](https://database.mobilitydata.org/) y [Transitland](https://www.transit.land/) (ver más agregadores de feeds [aquí](../../resources/data)). Estar indexado en un agregador de feeds aumenta la visibilidad de su agencia y permite a los desarrolladores, investigadores y otras partes interesadas acceder fácilmente a los datos de su agencia para una variedad de propósitos, incluido el desarrollo de nuevas aplicaciones. 
 
### Integración con SIG, análisis y otras plataformas y herramientas 
 
 Los datos GTFS también se pueden importar y utilizar en una variedad de plataformas de análisis geoespacial. Los programas de sistemas de información geográfica (GIS) como ArcGIS de Esri, así como el QGIS de código abierto, tienen sus propios complementos y extensiones que pueden importar y visualizar datos de paradas y rutas GTFS. 
 
 - Esri tiene una [amplia variedad de herramientas y complementos](https://github.com/Esri/public-transit-tools) que utilizan datos GTFS, incluida la visualización de datos de programación- En QGIS, [GTFS-GO](https://plugins.qgis.org/plugins/GTFS-GO-master/) y [GTFS Loader](https://plugins.qgis.org/plugins/GTFS_Loader/) le permiten visualizar rutas + se detiene dentro de la plataforma- [Herramientas de análisis adicionales](../../resources/agency-tools) 
 
 Otras plataformas le permiten visualizar y analizar datos GTFS de formas únicas: 
 
 - [Transmitir](https://conveyal.com/) es un programa de código abierto que permite a los usuarios importar datos GTFS para visualizar horarios, rutas y patrones, y analizar los impactos de posibles cambios en el servicio. Los usuarios también pueden importar y trabajar con datos demográficos para realizar análisis sobre, por ejemplo, cómo diferentes rutas u horarios afectarían el acceso a empleos en un área urbana en particular. 
 - [GTFS a HTML](https://gtfstohtml.com/) es una herramienta de código abierto que permite la conversión de datos de horarios GTFS en horarios HTML. Permite a las agencias publicar y actualizar automáticamente sus horarios en su sitio web en un formato que también pueden leer los lectores de pantalla, haciendo que los datos sean accesibles para las personas con discapacidad visual. 
 
## Compartir sus datos: consejos y mejores prácticas

### Crear y mantener un enlace de recuperación permanente 
 
 Un enlace de búsqueda es una URL permanente en la que se almacenan los archivos de programación GTFS de su agencia. Por lo general, está alojado en el sitio web de su agencia o en su proveedor, si contrata uno para la producción de GTFS. Así es como las aplicaciones de planificación de viajes como Google Maps acceden a tus datos. Idealmente, sus archivos de programación GTFS deberían poder descargarse directamente desde esta URL sin necesidad de iniciar sesión. Sin embargo, si esto no es factible debido a restricciones de licencia, su agencia puede controlar el acceso a los datos utilizando y emitiendo claves API a los usuarios de los datos. 
 
### URL y nombres de archivos 
 
 Los enlace de búsqueda y los nombres de archivos GTFS coherentes son cruciales para garantizar el acceso a los datos de su feed. Si su agencia no utiliza URL y nombres de archivos consistentes para sus datos, significa que las aplicaciones de planificación de viajes, los agregadores de feeds y otros usuarios no obtendrán los datos más precisos y actualizados, lo que causará problemas a largo plazo..
 
 Una vez que haya configurado una URL para su enlace de búsqueda permanente, NO LA CAMBIE. Esto significa que el nombre de la URL debe permanecer coherente, incluso si los archivos se actualizan. Como tal, mantenga sus URL lo más simples y genéricas posible y evite el uso de URL que tengan fechas o números de versión. 
 
 - **BUENO:** http://www.bart.gov/dev/schedules/google_transit.zip, 
 - **EVITAR:** http://www.bart.gov/dev/horarios/google_transit_Fall_2021.zip 
 
 Del mismo modo, mantén constante el nombre de la carpeta ZIP que contiene los archivos de programación GTFS, incluso si realizas actualizaciones en el feed. Por ejemplo, cuando actualiza una fuente, no debe agregar ningún tipo de date o número de versión al nombre de la carpeta ZIP. Si desea incluir datos sobre la versión del feed o las fechas de inicio y finalización del feed, puede incluirlos en el archivo feed_info.txt. 
 
 - **BUENO:** “YourAgency_gtfs.zip”, “google_transit.zip”, “gtfs.zip”, 
 - **EVITAR:** “YourAgency_gtfs_092921.zip”, “YourAgency_Fall2021.zip” § § 
 
### Configuración e integridad del archivo 
 
 Su GTFS es un archivo zip que contiene varios archivos de texto interconectados (.txt). Para garantizar que el formato sea correcto, haga siempre lo siguiente: 
 
 1. Al abrir un archivo de texto, asegúrese de mantener los valores como texto. Hay muchos campos en un GTFS que aplicaciones como Excel leerán incorrectamente o abreviarán. 
 2. Los archivos están delimitados por comas, no por tabulaciones. Esto significa que cada archivo contiene registros en filas y los diferentes campos están separados por comas. 
 3. Las filas o columnas adicionales causarán errores al consumir aplicaciones, así que asegúrese de que no haya filas o columnas vacías al guardar el archivo. 
 4. No descarte ninguno de los archivos en su GTFS: funcionan juntos y cualquier archivo faltante puede causar errores al consumir aplicaciones. 
 5. Al volver a comprimir los archivos, asegúrese de comprimir los archivos, no la carpeta que los contiene. Puede estar seguro de haber hecho esto correctamente descomprimiendo su archivo e inmediatamente viendo los archivos en esa carpeta, no en otra carpeta que contenga los archivos. 
 
 
### Consideraciones adicionales 
 
 Si varias agencias comparten la misma parada con diferentes nombres o códigos, es posible que aplicaciones como Google Maps deban elegir una. Para evitar confusiones, coordine con otras agencias para acordar los nombres y códigos. Esto minimiza los conflictos entre diferentes conjuntos de datos GTFS. 
 
 En caso de que tenga varios conjuntos de datos GTFS disponibles (generalmente el resultado de uno producido para aplicaciones públicas como Transit App y otro para sistemas CAD/AVL operativos internos), es posible que deba decidir cuál ser el GTFS publicado. Se recomienda que elija promocionar el feed que contenga la mayor cantidad de información dirigida a los usuarios. Siempre que sea posible, trate de que sus conjuntos de datos GTFS coincidan (los mismos identificadores para cosas como paradas y viajes) para que los internos no entren en conflicto con los públicos, y es posible integrar otros feeds como GTFS-RT. 
