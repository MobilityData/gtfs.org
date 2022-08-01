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

We use the [ProtBuf.js](https://github.com/dcodeIO/ProtoBuf.js) library for
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

```javascript
var GtfsRealtimeBindings = require('gtfs-realtime-bindings');
var request = require('request');

var requestSettings = {
  method: 'GET',
  url: 'URL OF YOUR GTFS-REALTIME SOURCE GOES HERE',
  encoding: null
};
request(requestSettings, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    var feed = GtfsRealtimeBindings.transit_realtime.FeedMessage.decode(body);
    feed.entity.forEach(function(entity) {
      if (entity.tripUpdate) {
        console.log(entity.tripUpdate);
      }
    });
  }
});
```

For more details on the naming conventions for the Javascript classes generated
from the
[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto),
check out the [ProtoBuf.js project](https://github.com/dcodeIO/ProtoBuf.js/wiki)
which we use to handle our Protocol Buffer serialization.
