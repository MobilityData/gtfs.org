# Языковые привязки .NET GTFS-realtime

[![Версия NuGet](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

Предоставляет классы .NET, созданные на основе спецификации ProtocolBuffer протоколаGTFS-realtime. Эти классы позволят вам разобрать двоичный поток данных ProtocolBuffer GTFS-realtime в объекты C#.

## Добавьте зависимость

Чтобы использовать классы `gtfs-realtime-bindings` в своем проекте, необходимо сначала установить модуль из[репозиторияNuGet](https://www.nuget.org/packages/GtfsRealtimeBindings/).

    Install-Package GtfsRealtimeBindings

## Пример кода

Следующий фрагмент кода демонстрирует загрузку потока данных GTFS-realtime с определенного URL, его разбор как FeedMessage (корневой тип схемы GTFS-realtime) и итерацию результатов.

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
