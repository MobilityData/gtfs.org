# JavaScript GTFS-realtime 言語バインディング {: #javascript-gtfs-realtime-language-bindings}


[![npm version](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol Buffer 仕様から生成された JavaScript クラスとその関連型を提供します。これらのクラスを使用することで、バイナリ形式の Protocol Buffer GTFS-realtime データフィードを JavaScript オブジェクトに変換して解析することができます。

これらのバインディングは [Node.js](http://nodejs.org/) 環境で使用することを目的としていますが、多少の工夫をすれば他の JavaScript 環境でも使用できる可能性があります。

JavaScript における Protocol Buffer のサポートには [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) ライブラリを使用しています。

## 依存関係の追加 {: #add-the-dependency}

`gtfs-realtime-bindings` クラスを自身のプロジェクトで使用するには、まず [Node.js npm パッケージ](https://www.npmjs.com/package/gtfs-realtime-bindings) をインストールする必要があります。

```
npm install gtfs-realtime-bindings
```

## コード例 {: #example-code}

以下の Node.js コードスニペットは、特定の URL から GTFS-realtime データフィードをダウンロードし、それを FeedMessage（GTFS-realtime スキーマのルート型）としてパースし、結果を反復処理する方法を示しています。

この例を動作させるためには、まず NPM で `node-fetch` をインストールしなければなりません。

_注意: この例は ES モジュール（`import`/`export` 構文）を使用しており、CommonJS（`require` 構文）とは互換性がありません。CommonJS を使用する場合は、`import` を `require` に変換し、`node-fetch@2` をインストールしてください。ES モジュールについての詳細は [こちら](https://nodejs.org/api/esm.html) を参照してください。_

```javascript
import GtfsRealtimeBindings from "gtfs-realtime-bindings";
import fetch from "node-fetch";

(async () => {
  try {
    const response = await fetch("<GTFS-realtime source URL>", {
      headers: {
        "x-api-key": "<redacted>",
        // あなたの GTFS-realtime ソースの認証トークンに置き換えてください
        // 例: x-api-key は NY の MTA GTFS API で使用されるヘッダー値です
      },
    });
    if (!response.ok) {
      const error = new Error(`${response.url}: ${response.status} ${response.statusText}`);
      error.response = response;
      throw error;
      process.exit(1);
    }
    const buffer = await response.arrayBuffer();
    const feed = GtfsRealtimeBindings.transit_realtime.FeedMessage.decode(
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

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成された JavaScript クラスの命名規則についての詳細は、Protocol Buffer のシリアライズ処理に使用している [ProtoBuf.js プロジェクト](https://github.com/dcodeIO/ProtoBuf.js/wiki) を参照してください。
