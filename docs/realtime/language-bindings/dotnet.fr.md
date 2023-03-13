# Liaisons linguistiques .NET GTFS-realtime

[![Version NuGet](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

Fournit des classes .NET générées à partir de la spécification ProtocolBuffer [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime).. Ces classes vous permettront d'analyser un flux de données ProtocolBuffer GTFS-realtime binaire en objets C#.

## Ajouter la dépendance

Pour utiliser les classes `gtfs-realtime-bindings` dans votre propre projet, vous devez d'abord installer le module à partir du [dépôt NuGet](https://www.nuget.org/packages/GtfsRealtimeBindings/).

    Install-Package GtfsRealtimeBindings

## Exemple de code

L'extrait de code suivant montre le téléchargement d'un flux de données GTFS-realtime à partir d'une URL particulière, son analyse en tant que FeedMessage (le type racine du schéma GTFS-realtime) et l'itération des résultats.

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
