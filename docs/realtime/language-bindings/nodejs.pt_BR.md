# Encadernação de idiomas JavaScript GTFS-realtime 

[![versão npm](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

Fornece classes JavaScript e seus tipos associados gerados a partir da especificação do [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer. Estas classes permitirão que você analise um binário ProtocolBuffer GTFS-realtime feed de dados em objetos JavaScript.

Estes bindings são projetados para serem usados no [Node.js ambiente](http://nodejs.org/), mas com algum esforço, eles provavelmente também podem ser usados em outros ambientes JavaScript.

Usamos a biblioteca do [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) para suporte a Buffer de Protocolo JavaScript.

## Adicionar a Dependência

Para usar as classes `gtfs-realtime-bindings` em seu próprio projeto, você precisa primeiro instalar nosso [pacote Node.js npm](https://www.npmjs.com/package/gtfs-realtime-bindings):

    npm install gtfs-realtime-bindings

## Código de exemplo

O seguinte trecho de código do Node.js demonstra o download de um feed de dados GTFS-realtime de uma URL específica, analisando-o como um FeedMessage (o tipo raiz do esquema GTFS-realtime), e iterando sobre os resultados.

A fim de fazer este exemplo funcionar, é necessário primeiro instalar o `"node-fetch"` com NPM.

_Nota: este exemplo está usando módulos ES (sintaxe de `import`/`export`) e não é compatível com o CommonJS (sintaxe `require` ). Você pode usar o CommonJS convertendo a `import` para `require` instalando `node-fetch@2`. Saiba mais sobre os módulos ES [aqui](https://nodejs.org/api/esm.html)._

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

Para mais detalhes sobre as convenções de nomenclatura para as classes JavaScript geradas a partir de the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto),confira o [projeto ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js/wiki), que usamos para lidar com nossa seriação do Protocolo Buffer.
