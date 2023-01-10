# .NET GTFS-realtime語言綁定

[![版本](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

提供從[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)ProtocolBuffer 規範生成的 .NET 類。這些類將允許您將二進制 ProtocolBuffer GTFS-realtime 數據饋送解析為 C# 對象。

## 添加依賴項

要在您自己的項目中使用`gtfs-realtime-bindings`類，您需要先從[NuGet 存儲庫](https://www.nuget.org/packages/GtfsRealtimeBindings/)安裝該模塊。

    Install-Package GtfsRealtimeBindings

## 示例代碼

以下代碼片段演示了從特定 URL 下載 GTFS-realtime 數據提要，將其解析為 FeedMessage（GTFS-realtime 架構的根類型），並迭代結果。

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
