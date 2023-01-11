# Liaisons de langage Ruby GTFS-realtime

[![Version Gem](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

Fournit des classes Ruby générées à partir de la spécification ProtocolBuffer GTFS-realtime. Ces classes vous permettront d'analyser un flux de données ProtocolBuffer GTFS-realtime binaire en objets Ruby.

!!! fail "Déprécié

    *En février 2019, l'outil officiel `google-protobuf` Google protoc ne [prend pas en charge les extensions](https://github.com/protocolbuffers/protobuf/issues/1198) dans les fichiers proto2. Un outil tiers, [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), peut être installé en utilisant `gem install ruby-protocol-buffers`, mais ne semble pas correspondre à la structure existante des liaisons Ruby GTFS, car les tests unitaires échouent. En conséquence, nous déprécions les liaisons Ruby jusqu'à ce que le support officiel des fichiers proto2 soit implémenté dans les outils de tampon de protocole de Google.*

## Ajouter la dépendance

Pour utiliser les classes `gtfs-realtime-bindings` dans votre propre projet, vous devez d'abord installer la [gemme Ruby](https://rubygems.org/gems/gtfs-realtime-bindings):

    gem install gtfs-realtime-bindings

## Exemple de code

L'extrait de code suivant montre le téléchargement d'un flux de données GTFS-realtime à partir d'une URL particulière, son analyse en tant que FeedMessage (le type racine du schéma GTFS-realtime) et l'itération des résultats.

```ruby
require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'

data = Net::HTTP.get(URI.parse("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE"))
feed = Transit_realtime::FeedMessage.decode(data)
for entity in feed.entity do
  if entity.field?(:trip_update)
    p entity.trip_update
  end
end
```

Pour plus de détails sur les conventions de nommage des classes Ruby générées à partir de [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consultez le [fichier source gtfs-realtime.pb.rb](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb).
