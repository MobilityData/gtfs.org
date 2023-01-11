# Enlaces de lenguaje Ruby GTFS-realtime

[![Versión Gem](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

Proporciona clases Ruby generadas a partir de la especificación ProtocolBuffer GTFS-realtime. Estas clases te permitirán parsear un binario ProtocolBuffer GTFS-realtime data feed en objetos Ruby.

!!! fail "Obsoleto"

    *A partir de febrero de 2019, la herramienta oficial `google-protobuf` Google protoc [no admite extensiones](https://github.com/protocolbuffers/protobuf/issues/1198) en archivos proto2. Una herramienta de terceros, [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), se puede instalar usando `gem install ruby-protocol-buffers`, pero no parece coincidir con la estructura existente de los enlaces GTFS Ruby, ya que las pruebas unitarias fallan. Como resultado, estamos obviando los enlaces Ruby hasta que se implemente el soporte oficial para archivos proto2 en las herramientas de búfer de protocolo de Google.*

## Añadir la dependencia

Para utilizar las clases `gtfs-realtime-bindings` en tu propio proyecto, primero tienes que instalar la [gema Ruby](https://rubygems.org/gems/gtfs-realtime-bindings):

    gem install gtfs-realtime-bindings

## Código de ejemplo

El siguiente fragmento de código muestra la descarga de una fuente de datos GTFS-realtime desde una URL determinada, su análisis como FeedMessage (el tipo raíz del esquema GTFS-realtime) y la iteración sobre los resultados.

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

Para más detalles sobre las convenciones de nomenclatura de las clases Ruby generadas a partir de [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consulta [el archivo fuente gtfs-realtime.pb.rb](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb).
