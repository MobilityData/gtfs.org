<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/nodejs/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# JavaScript GTFS-realtime Language Bindings

[![npm version](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

Provides JavaScript classes generated from the
[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol
Buffer specification.  These classes will allow you to parse a binary Protocol
Buffer GTFS-realtime data feed into JavaScript objects.

These bindings are designed to be used in the [Node.js](http://nodejs.org/)
environment, but with some effort, they can probably be used in other
JavaScript environments as well.

We use the [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) library for
JavaScript Protocol Buffer support.

## Add the Dependency

To use the `gtfs-realtime-bindings` classes in your own project, you need to
first install our [Node.js npm package](https://www.npmjs.com/package/gtfs-realtime-bindings):

```
npm install gtfs-realtime-bindings
```

## Example Code

The following Node.js code snippet demonstrates downloading a GTFS-realtime
data feed from a particular URL, parsing it as a FeedMessage (the root type of
the GTFS-realtime schema), and iterating over the results.

In order to make this example work, you must first install `node-fetch` with NPM.

_Note: this exemple is using ES modules (`import`/`export` syntax) and is not compatible
with CommonJS (`require` syntax). You can use CommonJS by converting `import` to `require`
and installing `node-fetch@2`. Learn more about ES modules [here](https://nodejs.org/api/esm.html)._

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

For more details on the naming conventions for the JavaScript classes generated
from the
[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto),
check out the [ProtoBuf.js project](https://github.com/dcodeIO/ProtoBuf.js/wiki)
which we use to handle our Protocol Buffer serialization.
