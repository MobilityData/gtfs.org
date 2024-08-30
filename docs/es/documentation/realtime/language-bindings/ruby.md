# Ruby GTFS-realtime Language Bindings

 [![Versión Gem](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://Badge.fury.io/rb/gtfs-realtime-bindings) 
 
 Proporciona clases Ruby generadas a partir de 
 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs- tiempo real) Protocolo 
 Especificación del buffer. Estas clases le permitirán analizar un protocolo binario 
 Buffer GTFS, fuente de datos en tiempo real en objetos Ruby. 
 
!!! fail "Deprecated"
 
    *A partir de febrero de 2019, la herramienta oficial de protocolo de Google `google-protobuf` [no admite extensiones](https://github.com/protocolbuffers/protobuf/issues/1198) en proto2 archivos. Se puede instalar una herramienta de terceros, [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), usando `m` install ruby-protocol-buffers`, pero no parece coincidir con la estructura existente de los enlaces Ruby GTFS-rt, ya que las pruebas unitarias fallan. Como resultado, estamos desaprobando los enlaces de Ruby hasta que se implemente el soporte oficial para archivos proto2 en las herramientas de búfer de protocolo de Google.* 
 
## Agregar la dependencia 
 
 Para usar las clases `gtfs-realtime-bindings` en su propio proyecto, primero necesita 
 instalar [Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings): 
 
```
gem install gtfs-realtime-bindings
```
 
## Código de ejemplo 
 
 El siguiente fragmento de código demuestra la descarga de un feed de datos GTFS en tiempo real 
 desde una URL particular, analizándolo como un FeedMessage (el tipo raíz del 
 GTFS-esquema en tiempo real) e iterando sobre los resultados. 
 
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
 
 Para obtener más detalles sobre las convenciones de nomenclatura para las clases Ruby generadas a partir de 
 el [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), 
 consulte [el archivo fuente gtfs-realtime.pb.rb](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb). 
