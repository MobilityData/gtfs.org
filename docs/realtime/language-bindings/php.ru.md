# Языковые привязки PHP GTFS-realtime

[![Версия PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Предоставляет классы PHP, созданные на основе спецификации ProtocolBuffer [GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/). Эти классы позволят вам разобрать двоичный поток данных ProtocolBuffer GTFS-realtime в объекты PHP.

Для привязок на других языках, смотрите проект the [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) project.

!!! fail "Утративший силу"

    *По состоянию на февраль 2019 года официальный инструмент `google-protobuf` Google protoc [не поддерживает файлы proto2](https://github.com/protocolbuffers/protobuf/issues/3623). В связи с этим мы прекращаем использование привязки PHP до тех пор, пока официальная поддержка файлов proto2 не будет реализована в инструментах буфера протокола Google.*

## Добавьте зависимость

Чтобы использовать классы `gtfs-realtime-bindings-php` в своем проекте, вам необходимо сначала установить [пакет Packagist Composer](https://packagist.org/packages/google/gtfs-realtime-bindings). Для этого добавьте зависимость в файл `composer.json`:

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

Где `x.y.z` - последняя версия релиза:

[![Версия PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Затем обновите зависимости Composer:

    composer update

## Пример кода

Следующий фрагмент кода демонстрирует загрузку потока данных GTFS-realtime с определенного URL, его разбор как FeedMessage (корневой тип схемы GTFS-realtime) и итерацию результатов.

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

Для получения более подробной информации о соглашениях об именовании классов PHP, созданных на основе [gtfs-realtime.proto](https://developers.google.com/transit/gtfs-realtime/gtfs-realtime-proto), ознакомьтесь с [исходным файлом gtfs-realtime.php](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php).
