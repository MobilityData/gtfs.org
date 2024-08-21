<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/ruby/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Liaisons de langage Ruby GTFS-realtime 
 
 [![Gem Version](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings) 
 
 Fournit des classes Ruby générées à partir du [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs- temps réel) Protocole Spécification du tampon. Ces classes vous permettront d’analyser un flux de données binaires en temps réel Protocol Buffer GTFS dans des objets Ruby. 
 
!!! fail "Deprecated" 
 
    *Depuis février 2019, l’outil officiel de protocole Google `google-protobuf` [ne prend pas en charge les extensions](https://github.com/protocolbuffers/protobuf/issues/1198) dans proto2 des dossiers. Un outil tiers, [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), peut être installé à l’aide de `m` install ruby-protocol-buffers`, mais ne semble pas le faire correspondre à la structure existante des liaisons Ruby GTFS-rt, car les tests unitaires échouent. En conséquence, nous déprécions les liaisons Ruby jusqu’à ce que la prise en charge officielle des fichiers proto2 soit implémentée dans les outils de tampon de protocole de Google.* 
 
## Ajouter la dépendance 
 
 Pour utiliser les classes `gtfs-realtime-bindings` dans votre propre projet, vous devez d’abord installer le [Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings) : 
 
```
gem install gtfs-realtime-bindings
```
 
## Exemple de code 
 
 L’extrait de code suivant montre le téléchargement d’un flux de données GTFS en temps réel à partir d’une URL particulière, en l’analysant comme un FeedMessage (le type racine du GTFS-schéma en temps réel) et itérer sur les résultats. 
 
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
 
 Pour plus de détails sur les conventions de dénomination des classes Ruby générées à partir de le [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consultez le [le fichier source gtfs-realtime.pb.rb](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb). 
