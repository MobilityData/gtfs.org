# Языковые привязки Ruby GTFS-realtime

[![Версия Gem](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

Предоставляет классы Ruby, созданные на основе спецификацииGTFS-realtime ProtocolBuffer. Эти классы позволят вам разобрать двоичный поток данных ProtocolBuffer GTFS-realtime в объекты Ruby.

!!! fail "Утративший силу"

    *По состоянию на февраль 2019 года официальный инструмент `google-protobuf` Google protoc [не поддерживает расширения](https://github.com/protocolbuffers/protobuf/issues/1198) в файлах proto2. Сторонний инструмент, [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), можно установить с помощью `gem install ruby-protocol-buffers`, но, похоже, он не соответствует существующей структуре привязки Ruby GTFS, поскольку модульные тесты не работают. В результате мы прекращаем использование связки Ruby до тех пор, пока официальная поддержка файлов proto2 не будет реализована в инструментах буферов протоколов Google.*

## Добавьте зависимость

Чтобы использовать классы `gtfs-realtime-bindings` в своем проекте, вам необходимо сначала установить [Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings):

    gem install gtfs-realtime-bindings

## Пример кода

Следующий фрагмент кода демонстрирует загрузку потока данных GTFS-realtime с определенного URL, его разбор как FeedMessage (корневой тип схемы GTFS-realtime) и итерацию результатов.

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

Более подробную информацию о соглашениях об именах для классов Ruby, созданных на основе [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), можно найти в [исходном файле gtfs-realtime.pb.rb](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb).
