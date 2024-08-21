# GTFS Realtime Bindings

## Introducción 
 
 [GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) es un formato de datos para comunicar información en tiempo real sobre los sistemas de transporte público. 
 Los datos GTFS Realtime se codifican y decodifican utilizando [Protocol Buffers](https://developers.google.com/protocol-buffers/), una representación binaria compacta diseñada para un procesamiento rápido y eficiente. El esquema de datos en sí se define en [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto). 
 
 Para trabajar con datos GTFS Realtime, un desarrollador normalmente usaría el esquema 
 `gtfs-realtime.proto` para generar clases en el lenguaje de programación 
 de su elección. Estas clases luego se pueden usar para construir objetos de modelo de datos 
 en tiempo real GTFS y serializarlos como datos binarios o, en la dirección 
 inversa, analizar datos binarios en objetos de modelo de datos. 
 
 Debido a que generar clases de modelo de datos GTFS Realtime a partir del esquema 
 `gtfs-realtime.proto` es una tarea muy común, pero también una que a veces 
 causa confusión a los desarrolladores novatos, este proyecto tiene como objetivo proporcionar enlaces de lenguaje GTFS Realtime pregenerados para varios de los lenguajes de programación 
 más populares. Cuando sea posible, estos enlaces de idiomas se publicarán como paquetes para facilitar su uso en otros proyectos. 
 
## Idiomas admitidos 
 
 * [.NET](dotnet.md) 
 * [Java](java.md) 
 * [JavaScript/TypeScript/Node.js](nodejs.md) 
 * [Python](python.md) 
 * [Golang](golang.md) 
 * ~~[Ruby](ruby.md)~~ *(Obsoleto a principios de 2019)* 
 * ~~[PHP](php.md)~~ *(Obsoleto a principios de 2019)* 
 
## Otros idiomas 
 
 No proporcionamos código generado para C++, use el compilador de protocolo oficial para eso ( desde [aquí](https://developers.google.com/protocol-buffers/docs/downloads) o [aquí](https://github.com/google/protobuf)) 
 
 ¿Nos falta tu favorito? ¿idioma? Considere contribuir: 
 
 1. Lea [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md). 
 2. Abra una solicitud de extracción con el idioma de su elección. Incluya instrucciones de actualización (idealmente, scripts). Además, proporcionar envases adecuados al ecosistema lingüístico. 
 
## Historial del proyecto 
 
 Este proyecto fue creado originalmente por Google; MobilityData comenzó a mantener el proyecto a principios de 2019. 
 
 Las versiones anteriores de las bibliotecas de enlaces todavía se publican bajo el nombre de Google. Consulte la documentación para cada idioma [aquí](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) para encontrar la última versión publicada por Google. 
