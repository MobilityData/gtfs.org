# PHP GTFS-realtime Sprachbindungen

[![PHP-Version](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Stellt PHP-Klassen zur Verfügung, die aus der [GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/) ProtocolBuffer-Spezifikation generiert wurden. Diese Klassen ermöglichen es Ihnen, einen binären ProtocolBuffer GTFS-Realtime Datenfeed in PHP-Objekte zu parsen.

Für Bindungen in anderen Sprachen, siehe das [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) project.

!!! fail "Abgelehnt"

    *Ab Februar 2019 unterstützt das offizielle `google-protobuf` Google-Protokolltool [keine proto2-Dateien](https://github.com/protocolbuffers/protobuf/issues/3623). Daher verwerfen wir die PHP, bis die offizielle Unterstützung für proto2-Dateien in den Google-Protokollpuffer-Tools implementiert ist.*

## Hinzufügen der Abhängigkeit

Um die `gtfs-realtime-bindings-php` Klassen in Ihrem eigenen Projekt zu verwenden, müssen Sie zuerst das [Packagist Composer package](https://packagist.org/packages/google/gtfs-realtime-bindings) installieren. Fügen Sie dazu eine Abhängigkeit in Ihrer `composer.json` Datei hinzu:

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

Dabei ist `x.y.z` die neueste Version:

[![PHP-Version](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Aktualisieren Sie dann Ihre Composer-Abhängigkeiten:

    composer update

## Beispielcode

Der folgende Codeausschnitt veranschaulicht das Herunterladen eines GTFS-Realtime datenfeeds von einer bestimmten URL, das Parsen als FeedMessage (der Stammtyp des GTFS-Realtime schemas) und die Iteration der Ergebnisse.

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

Weitere Einzelheiten zu den Namenskonventionen für die PHP-Klassen, die aus dem [gtfs-realtime.proto](https://developers.google.com/transit/gtfs-realtime/gtfs-realtime-proto) generiert werden, finden Sie in der [Quelldatei gtfs-realtime.php](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php).
