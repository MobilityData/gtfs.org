# JavaScript GTFS-realtime言語バインディング

[![npmバージョン](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)のProtocolBuffer仕様から生成されたJavaScriptクラスとその関連型を提供します。 これらのクラスにより、バイナリ ProtocolBuffer GTFS-realtime データフィードをパースして JavaScript オブジェクトに変換することができます。

これらのバインディングは[Node.js環境で](http://nodejs.org/)使用するように設計されていますが、工夫次第で他のJavaScript環境でも使用できるかもしれません。

JavaScriptのProtocol Bufferのサポートには、[ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js)ライブラリを使用しています。

## 依存関係の追加

`gtfs-realtime-bindings`クラスを自分のプロジェクトで使用するには、まず[Node.jsのnpm](https://www.npmjs.com/package/gtfs-realtime-bindings)パッケージをインストールする必要があります。

    npm install gtfs-realtime-bindings

## コード例

次の Node.js コードスニペットは、特定の URL から GTFS-realtime データフィードをダウンロードし、それを FeedMessage（GTFS-realtime スキーマのルート型）として解析し、結果を反復処理する様子を示しています。

このサンプルを動作させるためには、まず NPM で`node-fetch`をインストールする必要があります。

_注：この例は、ESモジュール（`import`/`export`構文）を使用しており、CommonJS（`require`構文）と互換性がありません。CommonJSを使用するには、`import` を `require`に変換して、`node-fetch@2`をインストールします。 ESモジュールについては、[こちらを](https://nodejs.org/api/esm.html)ご覧ください。_

```javascript
import GtfsRealtimeBindings from "gtfs-realtime-bindings";
import fetch from "node-fetch";

(async () => {
  try {
    const response = await fetch("<GTFS-realtime source URL>", {
      headers: {
        "x-api-key": "<redacted>",
        // replace with your GTFS-realtime source's auth token
        // e.g. x-api-key is the header value used for NY's MTA GTFS APIs
      },
    });
    if (!res.ok) {
      const error = new Error(`${res.url}: ${res.status} ${res.statusText}`);
      error.response = res;
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

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)から生成されるJavaScriptクラスの命名規則の詳細については、[ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js/wiki)プロジェクトをご覧ください。このプロジェクトは、プロトコルバッファのシリアライズを処理するために使用されます。
