# .NET GTFS-realtime语言绑定

[![NuGet版本](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

提供从[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime). ProtocolBuffer规范中生成的.NET类。 这些类将允许你解析一个二进制的ProtocolBuffer GTFS-realtime数据源到C#对象。

## 添加依赖关系

要在自己的项目中使用`gtfs-realtime-bindings`类，你需要先从[NuGet仓库](https://www.nuget.org/packages/GtfsRealtimeBindings/)中安装该模块。

    Install-Package GtfsRealtimeBindings

## 示例代码

下面的代码片段演示了从一个特定的URL下载GTFS-realtime数据源，将其解析为FeedMessage（GTFS-realtime模式的根类型），并对结果进行迭代。

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
