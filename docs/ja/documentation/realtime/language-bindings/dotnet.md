# .NET GTFS-realtime 言語バインディング

[![NuGet バージョン](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) プロトコル バッファ仕様から生成された.NETクラスを提供します。これらのクラスを使用すると、バイナリ プロトコル バッファ GTFS リアルタイム データ フィードを C#オブジェクトに解析できます。

## 依存関係の追加

独自のプロジェクトで`gtfs-realtime-bindings`クラスを使用するには、まず [NuGet リポジトリ](https://www.nuget.org/packages/GtfsRealtimeBindings/) からモジュールをインストールする必要があります。

```
Install-Package GtfsRealtimeBindings
```

## サンプル コード

次のコード スニペットは、特定の URL から GTFS リアルタイム データ フィードをダウンロードし、それをFeedMessage (GTFS リアルタイム スキーマのルート タイプ) として解析し、結果を反復処理する方法を示しています。

```p` using System.Net;
using ProtoBuf;
using TransitRealtime;

WebRequest req = HttpWebRequest.Create("URL OF YOUR GTFS-REALTIMEソースはここに記述します");
 FeedMessage feed = Serializer.Deserialize<FeedMessage> (req.GetResponse().GetResponseStream());
foreach ( feed.Entities 内のFeedEntityエンティティ) {
...
}
```
