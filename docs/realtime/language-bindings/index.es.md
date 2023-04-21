# gtfs-realtime-bindings [![Join the MobilityData chat](https://img.shields.io/badge/chat-on%20slack-red)](https://share.mobilitydata.org/slack)

Vinculaciones lingüísticas generadas a partir de la especificación del búfer de protocolo [GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) para lenguajes populares.

## Introducción

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) es un formato de datos para comunicar información en tiempo real sobre sistemas de transporte público. Los datos de GTFS Realtime se codifican y descodifican mediante [ProtocolBuffers](https://developers.google.com/protocol-buffers/), una representación binaria compacta diseñada para un procesamiento rápido y eficaz. El propio esquema de datos se define en [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto).

Para trabajar con datos GTFS Realtime, un desarrollador normalmente usaría el esquema `gtfs-realtime.proto` para generar clases en el lenguaje de programación de su elección. Estas clases pueden utilizarse para construir objetos del modelo de datos GTFS-realtimedata y serializarlos como datos binarios o, en sentido inverso, para convertir datos binarios en objetos del modelo de datos.

Dado que la generación de clases de modelos de datos GTFS Realtime a partir del esquema `gtfs-realtime.proto` es una tarea muy común, pero también una tarea que a veces causa confusión a los desarrolladores noveles, este proyecto pretende proporcionar enlaces de lenguaje GTFS Realtime pregenerados para varios de los lenguajes de programación más populares. En la medida de lo posible, estos enlaces lingüísticos se publicarán como paquetes para facilitar su uso en otros proyectos.

## Lenguajes compatibles

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~ ( *obsoleto a partir de principios de 2019)*
* ~~[PHP](php.md)~~ (obsoleto a partir de principios de 2019 *)*

## Otros idiomas

No proporcionamos código generado para C++, usa el compilador oficial de protoc para eso (desde [aquí](https://developers.google.com/protocol-buffers/docs/downloads) o [aquí](https://github.com/google/protobuf))

¿Nos falta su idioma favorito? Considere la posibilidad de contribuir:

1. Lea [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md).
2. Abra un pull request con el idioma de su elección. Por favor, incluya instrucciones de actualización (idealmente, scripts). Además, proporcione un empaquetado adecuado para el ecosistema de idiomas.

## Historial del proyecto

Este proyecto fue creado originalmente por Google - MobilityData comenzó a mantener el proyecto a principios de 2019.

Las versiones más antiguas de las bibliotecas de bindings se siguen publicando bajo el nombre de Google. Consulta la documentación de cada idioma [aquí](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) para encontrar la última versión publicada por Google.
