# Liaisons de langage JavaScript GTFS-realtime

[![Version npm](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

Fournit des classes JavaScript et leurs types associés générés à partir de la spécification ProtocolBuffer GTFS-realtime. Ces classes vous permettront d'analyser un flux de données ProtocolBuffer GTFS-realtime binaire en objets JavaScript.

Ces liaisons sont conçues pour être utilisées dans l'[environnement Node.jsen](http://nodejs.org/), mais avec un peu d'effort, elles peuvent probablement être utilisées dans d'autres environnements JavaScript également.

Nous utilisons la bibliothèque [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) pour la prise en charge des tampons de protocole JavaScript.

## Ajouter la dépendance

Pour utiliser les classes `gtfs-realtime-bindings` dans votre propre projet, vous devez d'abord installer notre [paquet npm Node.js](https://www.npmjs.com/package/gtfs-realtime-bindings):

    npm install gtfs-realtime-bindings

## Exemple de code

L'extrait de code Node.js suivant montre le téléchargement d'un flux de données GTFS-realtime à partir d'une URL particulière, son analyse en tant que FeedMessage (le type racine du schéma GTFS-realtime) et l'itération des résultats.

Afin de faire fonctionner cet exemple, vous devez d'abord installer `node-fetch` avec NPM.

_Note : cet exemple utilise les modules ES (syntaxe`import/export`) et n'est pas compatible avec CommonJS (syntaxe`require` ). Vous pouvez utiliser CommonJS en convertissant `import` en `require et en`installant `node-fetch@2`. Apprenez-en plus sur les modules ES [ici](https://nodejs.org/api/esm.html)._

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

Pour plus de détails sur les conventions de dénomination des classes JavaScript générées à partir de [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consultez le [projet ProtoBuf.js que](https://github.com/dcodeIO/ProtoBuf.js/wiki)nous utilisons pour gérer la sérialisation de notre Protocol Buffer.
