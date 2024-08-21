# PHP GTFS-realtime Language Bindings
 
 [![Versión de PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings) 
 
 Proporciona clases PHP generadas a partir de 
 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocolo 
 Especificación del buffer. Estas clases le permitirán analizar un protocolo binario 
 Buffer GTFS en tiempo real para alimentar datos en objetos PHP. 
 
 Para enlaces en otros idiomas, consulte el proyecto 
 [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) 
. 
 
!!! fail "Deprecated"
    *A partir de febrero de 2019, la herramienta oficial de protocolo de Google `google-protobuf` [no admite archivos proto2](https://github.com/protocolbuffers/protobuf/issues/3623). Como resultado, estamos desaprobando los enlaces de PHP hasta que se implemente el soporte oficial para archivos proto2 en las herramientas de búfer de protocolo de Google.* 
 
## Agregue la dependencia 
 
 Para usar clases `gtfs-realtime-bindings-php` en su propio proyecto, necesita 
 instalar primero el [paquete Packagist Composer 
](https://packagist.org/packages/google/gtfs-realtime-bindings). Para hacerlo 
, agregue una dependencia en su archivo `composer.json` : 
 
```
"require": {
  "google/gtfs-realtime-bindings": "x.y.z"
}
``` 
 
 Donde `xyz` es la última versión de lanzamiento: 
 
 [![Versión de PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings) 
 
 Luego actualice sus dependencias de Composer: 
 
```
composer update
```
 
## Código de ejemplo 
 
 El siguiente fragmento de código demuestra la descarga de un feed de datos GTFS en tiempo real 
 desde una URL particular, analizándolo como un FeedMessage (el tipo raíz del 
 esquema GTFS en tiempo real), e iterando sobre los resultados. 
 
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
 
 Para obtener más detalles sobre las convenciones de nomenclatura para las clases PHP generadas a partir de 
, [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), 
 consulte [el archivo fuente gtfs-realtime.php](https://github.com/google/gtfs-realtime-bindings- php/blob/master/src/gtfs-realtime.php). 
