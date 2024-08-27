# General Transit Feed Specification (GTFS) 
 
 La General Transit Feed Specification (GTFS) es un [Estándar abierto](https://www.interoperablemobility.org/definitions/#open_standard) que se utiliza para distribuir información relevante sobre los sistemas de tránsito a los usuarios. Permite a las agencias de transporte público publicar sus datos de tránsito en un formato que puede ser consumido por una amplia variedad de aplicaciones de software. 
 
 GTFS consta de dos partes principales: [GTFS Schedule](../schedule/reference) y [GTFS Realtime](../realtime/reference). 
 
## [GTFS Schedule](../schedule/reference) 
 
 Programación GTFS es una especificación de feed que define un formato común para información estática sobre transporte público. Se compone de una colección de archivos simples, en su mayoría archivos de texto (.txt), que están contenidos en un único archivo ZIP. 
 
 Cada archivo describe un aspecto particular de la información de tránsito, como paradas, rutas, viajes, etc. En su forma más básica, un conjunto de datos de programación GTFS se compone de 7 archivos: `agency.txt`, `routes.txt`, `trips.txt`, `stops.txt`, `stop_times.txt`, `calendar.txt` y `calendar_dates.txt`. 
 
 Junto con este conjunto básico de archivos, también se pueden agrupar archivos adicionales (opcionales) para proporcionar información de otros elementos del servicio, como tarifas, traducciones, transbordos, trayectos en la estación, etc. Actualmente existen más de 15 Archivos opcionales que amplían los elementos básicos de GTFS, incluido locations.geojson, que introdujo un nuevo formato además de los archivos de texto (.txt) que se pueden utilizar para representar áreas geográficas. 
 
 La fuente de verdad para todos los archivos de GTFS Schedule es la [Referencia GTFS Schedule](../schedule/reference) oficial, que proporciona información detallada sobre los requisitos para todos los elementos de información en cada archivo que compone un conjunto de datos de GTFS Schedule.
 
 
## [GTFS Realtime](../realtime/reference) 
 
 GTFS Realtime es una especificación de feed que permite a las agencias de transporte público proporcionar información actualizada sobre los horarios actuales de llegada y salida, alertas de servicio y posición del vehículo, lo que permite a los usuarios planificar sus viajes sin problemas. 
 
 La especificación actualmente soporta los siguientes tipos de información: 
 
 - Actualizaciones de viaje: retrasos, cancelaciones, cambios de ruta
 - Alertas de servicio: parada movida, eventos imprevistos que afectan a una estación, ruta o a toda la red
 - Posiciones de vehículos: información sobre los vehículos, incluida la ubicación y el nivel de congestión 
 
 Para obtener más información sobre ellos, visite la sección [Feed Entities](../realtime/feed_entities/overview). 
 
 GTFS Realtime se diseñó teniendo en cuenta la facilidad de implementación, la buena interoperabilidad de GTFS y un enfoque en la información de los pasajeros. Esto fue posible gracias a una asociación de las [actualizaciones iniciales de Live Transit](https://developers.google.com/transit/google-transit#LiveTransitUpdates) agencias asociadas, varios desarrolladores de transporte y Google. La especificación se publica bajo la [Licencia Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). 
 
 El formato de intercambio de datos GTFS Realtime se basa en [Protocol Buffers](https://developers.google.com/protocol-buffers/), que es un mecanismo neutral en cuanto a lenguaje y plataforma para serializar datos estructurados (piense en XML)., pero más pequeño, más rápido y más sencillo). 
 
 De manera similar a GTFS Schedule, la [GTFS Realtime Reference](../realtime/reference) es la fuente de verdad que establece las reglas y requisitos para cualquier fuente GTFS Realtime, mientras que [gtfs-realtime.proto](../realtime/proto) define la jerarquía de elementos y sus definiciones de tipo que se utilizan. 
