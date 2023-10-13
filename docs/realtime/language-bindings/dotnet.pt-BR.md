# .NET GTFS-realtime encadernação de idiomas

[![Versão NuGet](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

Fornece classes .NET geradas a partir da especificação do ProtocolBuffer em [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime). Estas classes permitirão a análise de um protocolo binário ProtocolBuffer GTFS-realtime feed em objetos C#.

## Adicionar a Dependência

Para usar as classes `gtfs-realtime-bindings` em seu próprio projeto, você precisa primeiro instalar o módulo a partir do [repositórioNuGet](https://www.nuget.org/packages/GtfsRealtimeBindings/).

    Install-Package GtfsRealtimeBindings

## Código de exemplo

O seguinte trecho de código demonstra o download de um feed de dados em tempo real GTFS de uma URL específica, analisando-o como um FeedMessage (o tipo raiz do esquema em GTFS-realtime), e iterando sobre os resultados.

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
