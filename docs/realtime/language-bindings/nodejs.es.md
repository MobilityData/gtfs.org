# Enlaces de lenguaje JavaScript GTFS-realtime

[![versión npm](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

Proporciona clases JavaScript y sus tipos asociados generados a partir de la especificación ProtocolBuffer [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime). Estas clases le permitirán analizar una fuente de datos binaria ProtocolBuffer GTFS-realtime en objetos JavaScript.

Estos enlaces están diseñados para ser utilizados en el [entorno Node.js](http://nodejs.org/), pero con un poco de esfuerzo, es probable que puedan ser utilizados en otros entornos de JavaScript también.

Utilizamos la biblioteca [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) para el soporte del búfer de protocolo de JavaScript.

## Añadir la dependencia

Para usar las clases `gtfs-realtime-bindings` en tu propio proyecto, necesitas instalar primero nuestro [paquete npm Node.js](https://www.npmjs.com/package/gtfs-realtime-bindings):

    npm install gtfs-realtime-bindings

## Código de ejemplo

El siguiente fragmento de código Node.js muestra la descarga de una fuente de datos GTFS-realtime desde una URL concreta, su análisis como FeedMessage (el tipo raíz del esquema GTFS-realtime) y la iteración sobre los resultados.

Para que este ejemplo funcione, primero debes instalar `node-fetch` con NPM.

_Nota: este ejemplo utiliza módulos ES (sintaxis`import/export`) y no es compatible con CommonJS (sintaxis`require` ). Puede utilizar CommonJS convirtiendo `import` en `require` e instalando `node-fetch@2`. Obtenga más información sobre los módulos ES [aquí](https://nodejs.org/api/esm.html)._

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
    if (!res.ok) {
      const error = new Error(`${res.url}: ${res.status} ${res.statusText}`);
      error.response = res;
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

Para obtener más información sobre las convenciones de nomenclatura de las clases JavaScript generadas a partir de the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consulte el [proyecto ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js/wiki), que utilizamos para gestionar la serialización del búfer de protocolo.
