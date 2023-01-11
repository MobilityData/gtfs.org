# Enlaces de Lenguaje PHP GTFS-realtime

[![Versión PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Proporciona clases PHP generadas a partir de la especificación ProtocolBuffer [GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/). Estas clases le permitirán analizar una fuente de datos binaria ProtocolBuffer GTFS-realtime en objetos PHP.

Para enlaces en otros lenguajes, vea the [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) project.

!!! fail "Obsoleto"

    *A partir de febrero de 2019, la herramienta oficial `google-protobuf` Google protoc [no soporta](https://github.com/protocolbuffers/protobuf/issues/3623) archivos proto2. Como resultado, estamos obviando los enlaces PHP hasta que se implemente el soporte oficial para archivos proto2 en las herramientas de búfer de protocolo de Google.*

## Añadir la dependencia

Para usar las clases `gtfs-realtime-bindings-php` en su propio proyecto, necesita instalar primero el [paquete Packagist Composer](https://packagist.org/packages/google/gtfs-realtime-bindings). Para ello, añada una dependencia en su archivo `composer.json`:

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

Donde `x.y.z` es la última versión:

[![Versión PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

A continuación, actualice sus dependencias Composer:

    composer update

## Código de ejemplo

El siguiente fragmento de código muestra la descarga de una fuente de datos GTFS-realtime desde una URL determinada, su análisis como FeedMessage (el tipo raíz del esquema GTFS-realtime) y la iteración sobre los resultados.

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

Para más detalles sobre las convenciones de nomenclatura de las clases PHP generadas a partir de [gtfs-realtime.proto](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php), consulte [el archivo fuente gtfs-realtime.php](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php).
