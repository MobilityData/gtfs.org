# Liaisons de langage PHP GTFS-realtime

[![Version PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Fournit des classes PHP générées à partir de la spécification ProtocolBuffer [GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/). Ces classes vous permettront d'analyser un flux de données ProtocolBuffer GTFS-realtime binaire en objets PHP.

Pour les liaisons dans d'autres langues, voir le projet [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings).

!!! fail "Déprécié

    *À partir de février 2019, l'outil officiel de protocole `google-protobuf` ne [prend pas en charge les fichiers proto2](https://github.com/protocolbuffers/protobuf/issues/3623). Par conséquent, nous déprécions les liaisons PHP jusqu'à ce que le support officiel des fichiers proto2 soit mis en œuvre dans les outils de tampon de protocole de Google.*

## Ajouter la dépendance

Pour utiliser les classes `gtfs-realtime-bindings-php` dans votre propre projet, vous devez d'abord installer le [Packagist Composerpackage](https://packagist.org/packages/google/gtfs-realtime-bindings). Pour ce faire, ajoutez une dépendance dans votre fichier `composer.json`:

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

Où `x.y.z` est la dernière version :

[![Version PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Ensuite, mettez à jour vos dépendances Composer :

    composer update

## Exemple de code

L'extrait de code suivant montre le téléchargement d'un flux de données GTFS-realtime à partir d'une URL particulière, son analyse en tant que FeedMessage (le type racine du schéma GTFS-realtime) et l'itération des résultats.

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

Pour plus de détails sur les conventions de nommage des classes PHP générées à partir du [gtfs-realtime.proto](https://developers.google.com/transit/gtfs-realtime/gtfs-realtime-proto), consultez le [fichier source gtfs-realtime.php](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php).
