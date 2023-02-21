# .NET GTFS-realtime Ikatan Bahasa

[![Versi NuGet](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

Menyediakan kelas .NET yang dihasilkan dari [spesifikasi GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer. Kelas ini akan memungkinkan Anda mengurai feed data GTFS-realtime biner ProtocolBuffer ke objek C#.

## Tambahkan Ketergantungan

Untuk menggunakan kelas `gtfs-realtime-bindings` di proyek Anda sendiri, Anda harus menginstal modul terlebih dahulu dari [repositori NuGet](https://www.nuget.org/packages/GtfsRealtimeBindings/) .

    Install-Package GtfsRealtimeBindings

## Kode Contoh

Cuplikan kode berikut menunjukkan pengunduhan feed data GTFS-realtime dari URL tertentu, menguraikannya sebagai FeedMessage (jenis root dari skema GTFS-realtime), dan mengulangi hasilnya.

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
