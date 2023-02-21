# Enlaces de lenguaje .NET GTFS-realtime

[![Versión NuGet](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

Proporciona clases .NET generadas a partir de la especificación ProtocolBuffer GTFS-realtime. Estas clases le permitirán analizar una fuente de datos binaria ProtocolBuffer GTFS-realtime en objetos C#.

## Añadir la dependencia

Para utilizar las clases `gtfs-realtime-bindings` en su propio proyecto, primero debe instalar el módulo desde el [repositorio NuGet](https://www.nuget.org/packages/GtfsRealtimeBindings/).

    Install-Package GtfsRealtimeBindings

## Código de ejemplo

El siguiente fragmento de código muestra la descarga de una fuente de datos GTFS-realtime desde una URL determinada, su análisis como FeedMessage (el tipo raíz del esquema GTFS-realtime) y la iteración sobre los resultados.

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
