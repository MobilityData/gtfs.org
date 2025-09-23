<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings-php/edit/master/README.md" title="このページを編集" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# PHP GTFS-realtime 言語バインディング {: #php-gtfs-realtime-language-bindings}


[![PHP version](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol Buffer 仕様から生成された PHP クラスを提供します。これらのクラスを使用することで、バイナリ形式の Protocol Buffer GTFS-realtime データフィードを PHP オブジェクトに変換して解析することができます。

他の言語でのバインディングについては、[gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) プロジェクトを参照してください。

!!! fail "非推奨"

    *2019年2月時点で、公式の `google-protobuf` Google protoc ツールは [proto2 ファイルをサポートしていません](https://github.com/protocolbuffers/protobuf/issues/3623)。そのため、Google protocol buffer ツールで proto2 ファイルの公式サポートが実装されるまで、PHP バインディングは非推奨とします。*

## 依存関係の追加 {: #add-the-dependency}

`gtfs-realtime-bindings-php` クラスを自身のプロジェクトで使用するには、まず [Packagist Composer パッケージ](https://packagist.org/packages/google/gtfs-realtime-bindings) をインストールする必要があります。そのためには、`composer.json` ファイルに依存関係を追加してください:

```
"require": {
  "google/gtfs-realtime-bindings": "x.y.z"
}
```

ここで、`x.y.z` は最新のリリースバージョンです:

[![PHP version](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

次に、Composer の依存関係を更新してください:

```
composer update
```

## コード例 {: #example-code}

以下のコードスニペットは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをFeedMessage（GTFS-realtimeスキーマのルート型）としてパースし、結果を反復処理する方法を示しています。

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

PHPクラスの命名規則に関する詳細については、[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成された [gtfs-realtime.php ソースファイル](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php) を参照してください。
