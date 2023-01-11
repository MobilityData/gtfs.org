# Ruby GTFS-realtime Language Bindings

[![Versão Gem](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

Fornece classes de Ruby geradas a partir da especificação doGTFS-realtime ProtocolBuffer. Estas classes permitirão a análise de um protocolo binário ProtocolBuffer GTFS-realtime feed em objetos Ruby.

!!! fail "Deprecated" (Depreciado)

    *Desde fevereiro de 2019, a ferramenta oficial `google-protobuf` Google protoc [não suporta extensões](https://github.com/protocolbuffers/protobuf/issues/1198) em arquivos proto2. Uma ferramenta de terceiros, [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), pode ser instalada usando `gem install ruby-protocol-buffers`, mas não parece combinar com a estrutura existente do Ruby GTFS bindings, pois os testes da unidade falham. Como resultado, estamos depreciando os bindings Ruby até que o suporte oficial para arquivos proto2 seja implementado nas ferramentas de buffer do protocolo Google.*

## Adicionar a Dependência

Para utilizar as classes `gtfs-realtime-bindings` em seu próprio projeto, você precisa primeiro instalar a [jóia Ruby](https://rubygems.org/gems/gtfs-realtime-bindings):

    gem install gtfs-realtime-bindings

## Código de exemplo

O seguinte trecho de código demonstra o download de um feed de dados em tempo real GTFS de uma URL específica, analisando-o como um FeedMessage (o tipo raiz do esquema em tempo real doGTFS), e iterando sobre os resultados.

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

Para mais detalhes sobre as convenções de nomenclatura das classes Ruby geradas a partir do [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), confira o [arquivo fonte gtfs-realtime.pb.rb](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb).
