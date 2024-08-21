# JavaScript GTFS-realtime Language Bindings

 [![versión npm](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings) 
 
 Proporciona clases de JavaScript y sus tipos asociados generados a partir de 
 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocolo 
 Especificación del buffer. Estas clases le permitirán analizar un protocolo binario 
 Buffer GTFS en tiempo real en objetos JavaScript. 
 
 Estos enlaces están diseñados para usarse en el entorno [Node.js](http://nodejs.org/) 
, pero con un poco de esfuerzo, probablemente también se puedan usar en otros entornos 
 JavaScript..
 
 Usamos la biblioteca [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) para 
 compatibilidad con el búfer de protocolo JavaScript. 
 
## Agregar la dependencia 
 
 Para usar las clases `gtfs-realtime-bindings` en su propio proyecto, primero debe 
 instalar nuestro [paquete npm Node.js](https://www.npmjs.com/package/gtfs-realtime-bindings): 
 
```
npm install gtfs-realtime-bindings
```
 
## Código de ejemplo 
 
 El siguiente fragmento de código node.js demuestra la descarga de un feed de datos GTFS en tiempo real 
 desde una URL concreta, su análisis como un FeedMessage (el tipo raíz de 
 el esquema GTFS en tiempo real) y la iteración sobre los resultados. 
 
 Para que este ejemplo funcione, primero debe instalar `node-fetch` con NPM. 
 
 _Nota: este ejemplo utiliza módulos ES (sintaxis `import`/`export` ) y no es compatible 
 con CommonJS (sintaxis `require` ). Puede usar CommonJS convirtiendo `import` a `require` 
 e instalando `node-fetch@2`. Obtenga más información sobre los módulos ES [aquí](https://nodejs.org/api/esm.html)._ 
 
```javascript
import GtfsRealtimeBindings from "gtfs-realtime-bindings";
import fetch from "node-fetch";

(async () => {
  try {
    const response = await fetch("<GTFS-realtime source URL>", {
      headers: {
        "x-api-key": "<redacted>",
        // replace with your GTFS-realtime source's auth token
        // e.g. x-api-key is the header value used for NY's MTA GTFS APIs
      },
    });
    if (!response.ok) {
      const error = new Error(`${response.url}: ${response.status} ${response.statusText}`);
      error.response = response;
      throw error;
      process.exit(1);
    }
    const buffer = await response.arrayBuffer();
    const feed = GtfsRealtimeBindings.transit_realtime.FeedMessage.decode(
      new Uint8Array(buffer)
    );
    feed.entity.forEach((entity) => {
      if (entity.tripUpdate) {
        console.log(entity.tripUpdate);
      }
    });
  }
  catch (error) {
    console.log(error);
    process.exit(1);
  }
})();
```
 
 Para obtener más detalles sobre las convenciones de nomenclatura para las clases de JavaScript generadas a partir de 
 el 
 [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), 
 consulte el [proyecto ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js/wiki) 
 que utilizamos para manejar la serialización de nuestro búfer de protocolo. 
