<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings-php/edit/master/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
 
# PHP GTFS-realtime Language Bindings

[![PHP バージョン](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) プロトコルバッファ仕様から生成された PHP クラスを提供します。これらのクラスを使用すると、バイナリ プロトコルバッファ GTFS-realtime データフィードを PHP オブジェクトに解析できます。

他の言語のバインディングについては、[gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) プロジェクトをご覧ください。

!!! fail "非推奨"

   2019年2月現在、公式の `google-protobuf` Google プロトコル ツールは [proto2 ファイルをサポートしていません](https://github.com/protocolbuffers/protobuf/issues/3623)。そのため、proto2 ファイルの公式サポートが Google プロトコル バッファツールに実装されるまで、PHP バインディングは非推奨となります。

## 依存関係を追加する

独自のプロジェクトで`gtfs-realtime-bindings-php`クラスを使用するには、まず [Packagist Composer パッケージ](https://packagist.org/packages/google/gtfs-realtime-bindings) をインストールする必要があります。これを行うには、 `composer.json`ファイルに依存関係を追加します:

```
"require": {
  "google/gtfs-realtime-bindings": "x.y.z"
}
```

`xyz` は最新のリリース バージョンです:

[![PHP バージョン](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

次に、Composer の依存関係を更新します:

```
composer update
```

## サンプル コード

次のコード スニペットは、特定の URL から GTFS リアルタイム データ フィードをダウンロードし、それをFeedMessage (GTFS リアルタイム スキーマのルート タイプ) として解析し、結果。

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

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成される PHP クラスの命名規則の詳細については、[gtfs-realtime.php ソース ファイル](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php) を参照してください。