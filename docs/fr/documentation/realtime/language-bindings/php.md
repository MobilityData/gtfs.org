<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings-php/edit/master/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
 
# Liaisons de langage PHP GTFS-realtime 
 
 [![Version PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings) 
 
 Fournit des classes PHP générées à partir du [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocole Spécification du tampon. Ces classes vous permettront d’analyser un flux de données binaires en temps réel de protocole Buffer GTFS dans des objets PHP. 
 
 Pour les liaisons dans d’autres langues, consultez le projet[gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings). 
 
!!! fail "Obsolète" 
 
    *Depuis février 2019, l’outil officiel de protocole Google `google-protobuf` [ne prend pas en charge les fichiers proto2](https://github.com/protocolbuffers/protobuf/issues/3623). En conséquence, nous déprécions les liaisons PHP jusqu’à ce que la prise en charge officielle des fichiers proto2 soit implémentée dans les outils de tampon de protocole de Google.* 
 
## Ajouter la dépendance 
 
 Pour utiliser `gtfs-realtime-bindings-php` classes dans votre propre projet, vous devez installer d’abord le [packagist Composer](https://packagist.org/packages/google/gtfs-realtime-bindings). Pour ce faire, ajoutez une dépendance dans votre fichier `composer.json` : 
 
```
"require": {
  "google/gtfs-realtime-bindings": "x.y.z"
}
```
 
 Où `xyz` est la dernière version : 
 
[![PHP version](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)
 
 Mettez ensuite à jour vos dépendances Composer : 
 
```
composer update
```

## Exemple de code 
 
 L’extrait de code suivant montre le téléchargement d’un flux de données GTFS en temps réel à partir d’une URL particulière, en l’analysant comme un FeedMessage (le type racine du schéma GTFS en temps réel), et itérer sur les résultats. 
 
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
 
 Pour plus de détails sur les conventions de dénomination des classes PHP générées à partir du le [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consultez le [le fichier source gtfs-realtime.php](https://github.com/google/gtfs-realtime-bindings- php/blob/master/src/gtfs-realtime.php). 
