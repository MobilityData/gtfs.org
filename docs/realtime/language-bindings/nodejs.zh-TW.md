# JavaScript GTFS-Realtime語言綁定

[![npm 版本](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

提供從[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer 規範生成的 JavaScript 類及其關聯類型。這些類將允許您將二進制 ProtocolBuffer GTFS-realtime 數據饋送解析為 JavaScript 對象。

這些綁定旨在用於[Node.js](http://nodejs.org/)環境，但通過一些努力，它們也可能用於其他 JavaScript 環境。

我們使用[ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js)庫來支持 JavaScript Protocol Buffer。

## 添加依賴項

要在您自己的項目中使用`gtfs-realtime-bindings`類，您需要首先安裝我們的[Node.js npm 包](https://www.npmjs.com/package/gtfs-realtime-bindings)：

    npm install gtfs-realtime-bindings

## 示例代碼

以下 Node.js 代碼片段演示了從特定 URL 下載 GTFS-realtime 數據提要，將其解析為 FeedMessage（GTFS-realtime 架構的根類型），並迭代結果。

為了使這個示例工作，您必須首先使用 NPM 安裝`node-fetch` 。

_注意：此示例使用 ES 模塊（ `import` / `export`語法）並且與 CommonJS 不兼容（ `require`語法）。您可以通過將`import`轉換為`require`並安裝`node-fetch@2`來使用 CommonJS。[在此處](https://nodejs.org/api/esm.html)了解有關 ES 模塊的更多信息。_

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

有關從[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的 JavaScript 類的命名約定的更多詳細信息，請查看我們用來處理 Protocol Buffer 序列化的[ProtoBuf.js 項目](https://github.com/dcodeIO/ProtoBuf.js/wiki)。
