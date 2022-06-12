<a href="https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/dotnet/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.71 7.04c.39-.39.39-1.04 0-1.41l-2.34-2.34c-.37-.39-1.02-.39-1.41 0l-1.84 1.83 3.75 3.75M3 17.25V21h3.75L17.81 9.93l-3.75-3.75L3 17.25Z"></path></svg>
  </a>
  
# .NET GTFS-realtime Language Bindings

[![NuGet version](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](https://badge.fury.io/nu/GtfsRealtimeBindings)

Provides .NET classes generated from the
[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol
Buffer specification.  These classes will allow you to parse a binary Protocol
Buffer GTFS-realtime data feed into C# objects.

## Add the Dependency

To use the `gtfs-realtime-bindings` classes in your own project, you need to
first install the module from the
[NuGet repository](https://www.nuget.org/packages/GtfsRealtimeBindings/).

```
Install-Package GtfsRealtimeBindings
```

## Example Code

The following code snippet demonstrates downloading a GTFS-realtime data feed
from a particular URL, parsing it as a FeedMessage (the root type of the
GTFS-realtime schema), and iterating over the results.

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
