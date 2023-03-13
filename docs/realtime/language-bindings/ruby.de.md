# Ruby GTFS-realtime Sprachbindungen

[![Gem-Version](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

Stellt Ruby-Klassen zur Verfügung, die aus der [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer-Spezifikation generiert wurden. Mit diesen Klassen können Sie einen binären ProtocolBuffer GTFS-Realtime Datenfeed in Ruby-Objekte parsen.

!!! fail "Abgelehnt"

    *Ab Februar 2019 unterstützt das offizielle `google-protobuf` Google protoc-Tool [keine Erweiterungen](https://github.com/protocolbuffers/protobuf/issues/1198) in proto2-Dateien. Ein Tool eines Drittanbieters, [Ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), kann mit `gem install ruby-protocol-buffers`, scheint aber nicht zur bestehenden Struktur der GTFS zu passen, da die Unit-Tests fehlschlagen. Daher verwerfen wir die Ruby, bis die offizielle Unterstützung für proto2-Dateien in den Google-Protokollpuffer-Tools implementiert ist.*

## Hinzufügen der Abhängigkeit

Um die `gtfs-realtime-bindings` in Ihrem eigenen Projekt zu verwenden, müssen Sie zunächst das [Ruby-Gem](https://rubygems.org/gems/gtfs-realtime-bindings) installieren:

    gem install gtfs-realtime-bindings

## Beispielcode

Der folgende Codeausschnitt veranschaulicht das Herunterladen eines GTFS-Realtime datenfeeds von einer bestimmten URL, das Parsen als FeedMessage (der Stammtyp des GTFS-Realtime schemas) und die Iteration der Ergebnisse.

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

Weitere Details zu den Namenskonventionen für die Ruby-Klassen, die aus dem [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) erzeugt werden, finden Sie in der [Quelldatei gtfs-realtime.pb.rb](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb).
