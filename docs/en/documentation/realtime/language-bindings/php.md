<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings-php/edit/master/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# PHP GTFS-realtime Language Bindings

[![PHP version](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Provides PHP classes generated from the [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol Buffer specification.  These classes will allow you to parse a binary Protocol Buffer GTFS-realtime data feed into PHP objects.

For bindings in other languages, see the [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) project.

!!! fail "Deprecated"

    *As of February 2019, the official `google-protobuf` Google protoc tool [doesn't support proto2 files](https://github.com/protocolbuffers/protobuf/issues/3623).  As a result we are deprecating the PHP bindings until official support for proto2 files is implemented in the Google protocol buffer tools.*

## Add the Dependency

To use the `gtfs-realtime-bindings-php` classes in your own project, you need to first install the [Packagist Composer package](https://packagist.org/packages/google/gtfs-realtime-bindings).  To do, add a dependency in your `composer.json` file:

```
"require": {
  "google/gtfs-realtime-bindings": "x.y.z"
}
```

Where `x.y.z` is the latest release version:

[![PHP version](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Then update your Composer dependencies:

```
composer update
```

## Example Code

The following code snippet demonstrates downloading a GTFS-realtime data feed from a particular URL, parsing it as a FeedMessage (the root type of the GTFS-realtime schema), and iterating over the results.

```php
require_once 'vendor/autoload.php';

use transit_realtime\FeedMessage;

$data = file_get_contents("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
$feed = new FeedMessage();
$feed->parse($data);
foreach ($feed->getEntityList() as $entity) {
  if ($entity->hasTripUpdate()) {
    error_log("trip: " . $entity->getId());
  }
}
```

For more details on the naming conventions for the PHP classes generated from the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), check out the [the gtfs-realtime.php source file](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php).
