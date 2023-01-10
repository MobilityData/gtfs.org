# .NET GTFS-realtime-Sprachbindungen

[![NuGet-Version](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

Stellt .NET-Klassen zur Verfügung, die aus der GTFS-realtime ProtocolBuffer-Spezifikation generiert wurden. Diese Klassen ermöglichen es Ihnen, einen binären ProtocolBuffer GTFS-realtime-Datenfeed in C#-Objekte zu parsen.

## Hinzufügen der Abhängigkeit

Um die `gtfs-realtime-bindings` in Ihrem eigenen Projekt zu verwenden, müssen Sie zunächst das Modul aus[demNuGet-Repository](https://www.nuget.org/packages/GtfsRealtimeBindings/) installieren.

    Install-Package GtfsRealtimeBindings

## Beispielcode

Der folgende Codeausschnitt veranschaulicht das Herunterladen eines GTFS-realtime datenfeeds von einer bestimmten URL, das Parsen als FeedMessage (der Stammtyp des GTFS-realtime schemas) und die Iteration der Ergebnisse.

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
