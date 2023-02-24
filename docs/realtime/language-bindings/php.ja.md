# PHP GTFS-realtimeの言語バインディング

[![PHPバージョン](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

[GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/) ProtocolBuffer 仕様から生成された PHP クラスを提供します。 これらのクラスを使用すると、バイナリの ProtocolBuffer [GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/) データフィードをパースして PHP オブジェクトに変換することができます。

他の言語でのバインディングについては、the [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) project を参照してください。

!!! fail "非推奨"

    *2019年2月現在、公式の`google-protobuf`Google protocツールは[proto2ファイルをサポートして](https://github.com/protocolbuffers/protobuf/issues/3623)いません。 そのため、Googleプロトコルバッファツールにproto2ファイルの公式サポートが実装されるまで、PHPバインディングを非推奨とします\*。*

## 依存関係の追加

`gtfs-realtime-bindings-php`クラスを自分のプロジェクトで使用するには、 まず[Packagist Composer パッケージを](https://packagist.org/packages/google/gtfs-realtime-bindings)インストールする必要があります。 そのためには、`composer.json`ファイルに依存関係を追加してください。

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

ここで`x.y.z`は最新のリリース・バージョンです。

[![PHPバージョン](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

次に、Composer の依存関係を更新します。

    composer update

## コード例

次のコードでは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをFeedMessage（GTFS-realtimeスキーマのルートタイプ）として解析し、結果を反復処理する様子を示しています。

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

[gtfs-realtime.proto](https://developers.google.com/transit/gtfs-realtime/gtfs-realtime-proto) から生成される PHP クラスの命名規則についての詳細は、[gtfs-realtime.php のソース](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php)ファイルを参照してください。
