# JavaScript GTFS-Realtime Sprachbindungen

[![npm-Version](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

Stellt JavaScript-Klassen und die zugehörigen Typen bereit, die aus der [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)  ProtocolBuffer-Spezifikation generiert wurden. Mit diesen Klassen können Sie einen binären ProtocolBuffer GTFS-Realtime Datenfeed in JavaScript-Objekte parsen.

Diese Bindungen sind für die Verwendung in der [Node.js-Umgebung](http://nodejs.org/) konzipiert, aber mit etwas Aufwand können sie wahrscheinlich auch in anderen JavaScript-Umgebungen verwendet werden.

Wir verwenden die Bibliothek [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) für die Unterstützung von JavaScript-Protokollpuffern.

## Hinzufügen der Abhängigkeit

Um die `gtfs-realtime-bindings` Klassen in Ihrem eigenen Projekt zu verwenden, müssen Sie zunächst unser [Node.js npm-Paket](https://www.npmjs.com/package/gtfs-realtime-bindings) installieren:

    npm install gtfs-realtime-bindings

## Beispielcode

Der folgende Node.js-Codeausschnitt demonstriert das Herunterladen eines GTFS-Realtime daten-Feeds von einer bestimmten URL, das Parsen als FeedMessage (der Stammtyp des GTFS-Realtime schemas) und die Iteration der Ergebnisse.

Damit dieses Beispiel funktioniert, müssen Sie zunächst `node-fetch` mit NPM installieren.

_Hinweis: Dieses Beispiel verwendet ES-Module (`Import/Export`) Syntax und ist nicht mit CommonJS (`require` ) Syntax kompatibel. Sie können CommonJS verwenden, indem Sie `import` in `require`umwandeln und `node-fetch@2` installieren. Mehr über ES-Module erfahren Sie [hier](https://nodejs.org/api/esm.html)._

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

Weitere Einzelheiten zu den Namenskonventionen für die JavaScript-Klassen, die aus der Datei [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) generiert werden, finden Sie im [Projekt ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js/wiki), das wir für die Serialisierung des Protokollpuffers verwenden.
