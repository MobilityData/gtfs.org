# Binding Bahasa PHP GTFS-realtime

[![versi PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Menyediakan kelas PHP yang dihasilkan dari spesifikasi ProtocolBuffer [GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/) . Kelas ini akan memungkinkan Anda mengurai umpan data GTFS-realtime biner ProtocolBuffer ke dalam objek PHP.

Untuk binding dalam bahasa lain, lihat [project gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) .

!!! fail "Usang"

    *Mulai Februari 2019, alat protoc Google resmi `google-protobuf` [tidak mendukung file proto2](https://github.com/protocolbuffers/protobuf/issues/3623) . Akibatnya, kami tidak lagi menggunakan PHP binding hingga dukungan resmi untuk file proto2 diterapkan di alat penyangga protokol Google.*

## Tambahkan Ketergantungan

Untuk menggunakan kelas `gtfs-realtime-bindings-php` di proyek Anda sendiri, Anda harus menginstal paket [Packagist Composer terlebih dahulu](https://packagist.org/packages/google/gtfs-realtime-bindings) . Untuk melakukannya, tambahkan dependensi di file `composer.json` Anda:

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

Di mana `xyz` adalah versi rilis terbaru:

[![versi PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Kemudian perbarui dependensi Composer Anda:

    composer update

## Kode Contoh

Cuplikan kode berikut menunjukkan pengunduhan umpan data GTFS-realtime dari URL tertentu, menguraikannya sebagai FeedMessage (jenis root dari skema GTFS-realtime), dan mengulangi hasilnya.

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

Untuk detail selengkapnya tentang konvensi penamaan kelas PHP yang dihasilkan dari [gtfs-realtime.proto](https://developers.google.com/transit/gtfs-realtime/gtfs-realtime-proto) , lihat [file sumber gtfs-realtime.php](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php) .
