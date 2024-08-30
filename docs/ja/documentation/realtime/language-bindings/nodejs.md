# JavaScript GTFS-realtime 言語バインディング

[![npm バージョン](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) プロトコル バッファ仕様から生成された JavaScript クラスとそれに関連する型を提供します。これらのクラスを使用すると、バイナリ プロトコル バッファ GTFS リアルタイム データ フィードを JavaScript オブジェクトに解析できます。

これらのバインディングは [Node.js](http://nodejs.org/) 環境で使用するように設計されていますが、少し努力すれば、他の JavaScript 環境でも使用できる可能性があります。

JavaScript プロトコル バッファのサポートには [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) ライブラリを使用します。

## 依存関係の追加

独自のプロジェクトで`gtfs-realtime-bindings`クラスを使用するには、まず [Node.js npm パッケージ](https://www.npmjs.com/package/gtfs-realtime-bindings) をインストールする必要があります。

```
npm install gtfs-realtime-bindings
```

## サンプル コード

次の Node.js コード スニペットは、GTFS リアルタイム データ フィードのダウンロードを示しています。特定の URL からデータ フィードを取得し、それをFeedMessage (GTFS リアルタイム スキーマのルート タイプ) として解析し、結果を反復処理します。

この例を機能させるには、まず NPM で`node-fetch`をインストールする必要があります。

注: この例は ES モジュール (`import`/`export`構文) を使用しており、CommonJS (`require`構文) とは互換性がありません。`import`を`require`に変換し、 `node-fetch@2`で` CommonJS を使用できます。ES モジュールの詳細については、[こちら](https://nodejs.org/api/esm.html) を参照してください。_

```t` import GtfsRealtimeBindings from "gtfs-realtime-bindings";
import fetch from "node-fetch";

(async () => {
 try {
    const response = await fetch("<GTFS-realtime source URL> "、{
      ヘッダー: {
       "x-api-key": "<redacted> ",
     //GTFS リアルタイム ソースの認証トークンに置き換えます
     //たとえば、x-api-key は NY の MTA GTFS API に使用されるヘッダー値です
      },
    });
    if (!response.ok) {
      const error = new Error(`${response.url}: ${response.status} ${response.statusText}`);
      error.response = response;
      throw error;
      process.exit(1);
    }
    const buffer = await response.arrayBuffer();
    const feed = GtfsRealtimeBindings.transit_realtime. FeedMessage.decode(
      new Uint8Array(buffer)
    );
    feed.entity.forEach((entity) => {
      if (entity.tripUpdate) {
       console.log(entity.tripUpdate);
      }
    });
 }
 catch (error) {
    console.log(error);
    process.exit(1);
 }
})();
```

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成される JavaScript クラスの命名規則の詳細については、Protocol Buffer のシリアル化を処理するために使用する [ProtoBuf.js プロジェクト](https://github.com/dcodeIO/ProtoBuf.js/wiki) をご覧ください。
