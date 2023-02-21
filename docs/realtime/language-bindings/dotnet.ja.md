# .NET GTFS-realtime言語バインディング

[![NuGetバージョン](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

GTFS-realtimeのProtocolBuffer仕様から生成された.NETクラスを提供します。 これらのクラスを使用すると、バイナリ ProtocolBuffer GTFS リアルタイム データ フィードを C# オブジェクトにパースできます。

## 依存関係の追加

`gtfs-realtime-bindings`クラスを自分のプロジェクトで使用するには、まず、[NuGetリポジトリから](https://www.nuget.org/packages/GtfsRealtimeBindings/)モジュールをインストールする必要があります。

    Install-Package GtfsRealtimeBindings

## コード例

次のコードでは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをFeedMessage（GTFS-realtimeスキーマのルートタイプ）として解析し、結果を反復処理する様子を示しています。

```csharp
using System.Net;
using ProtoBuf;
using TransitRealtime;

WebRequest req = HttpWebRequest.Create("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
FeedMessage feed = Serializer.Deserialize<FeedMessage>(req.GetResponse().GetResponseStream());
foreach (FeedEntity entity in feed.Entities) {
  ...
}
```
