# JavaScript GTFS-realtime语言绑定

[![npm版本](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

提供从[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer规范中生成的JavaScript类及其相关类型。 这些类将允许你将二进制的ProtocolBuffer GTFS-realtime数据源解析为JavaScript对象。

这些绑定被设计为在[Node.js](http://nodejs.org/)环境中使用，但经过一些努力，它们可能也可以在其他JavaScript环境中使用。

我们使用[ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js)库来支持JavaScript协议缓冲区。

## 添加依赖关系

要在你自己的项目中使用`gtfs-realime-bindings`类，你需要首先安装我们的[Node.js npm包](https://www.npmjs.com/package/gtfs-realtime-bindings)。

    npm install gtfs-realtime-bindings

## 示例代码

下面的Node.js代码片段演示了从一个特定的URL下载GTFS-realtime 数据输入，将其解析为FeedMessage（GTFS-realtime模式的根类型），并对结果进行迭代。

为了让这个例子工作，你必须先用NPM安装`node-fetch`。

_注意：这个例子使用的是ES模块（`import`/`export`语法），与CommonJS（`require`语法）不兼容。你可以通过将`import`转换为`require`并安装`node-fetch@2`来使用CommonJS。[在这里](https://nodejs.org/api/esm.html)了解更多关于ES模块的信息。_

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

关于从 [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的JavaScript类的命名规则的更多细节，请查看[ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js/wiki)项目我们用它来处理我们的协议缓冲区序列化。
