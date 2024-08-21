# .NET GTFS-realtime Language Bindings

 [![Versión de NuGet](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings ) 
 
 Proporciona clases .NET generadas a partir del 
 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol 
 búfer. Estas clases le permitirán analizar un protocolo binario 
 Buffer GTFS, fuente de datos en tiempo real en objetos C#. 
 
## Agregar la dependencia 
 
 Para usar las clases `gtfs-realtime-bindings` en su propio proyecto, primero debe 
 instalar el módulo desde el 
 [repositorio NuGet](https://www.nuget.org/packages/GtfsRealtimeBindings/). 
 
```
Install-Package GtfsRealtimeBindings
```
 
## Código de ejemplo 
 
 El siguiente fragmento de código demuestra la descarga de un feed de datos GTFS en tiempo real 
 desde una URL particular, analizando como un FeedMessage (el tipo raíz del esquema en tiempo real 
 GTFS) e iterando sobre los resultados. 
 
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
