# Liaisons de langage .NET GTFS Realtime 
 
 [![Version NuGet](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings ) 
 
 Fournit des classes .NET générées à partir du protocole 
 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Spécification du tampon. Ces classes vous permettront d’analyser un flux de données binaires en temps réel Protocol Buffer GTFS dans des objets C#. 
 
## Ajouter la dépendance 
 
 Pour utiliser les classes `gtfs-realtime-bindings` dans votre propre projet, vous devez d’abord installer le module à partir du [répertoire NuGet](https://www.nuget.org/packages/GtfsRealtimeBindings/). 
 
```
Install-Package GtfsRealtimeBindings
```
 
## Exemple de code 
 
 L’extrait de code suivant montre le téléchargement d’un flux de données GTFS Realtime à partir d’une URL particulière, l’analyse en tant que FeedMessage (le type racine du schéma GTFS Realtime) et en itérant sur les résultats. 
 
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
