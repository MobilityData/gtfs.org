# Ruby GTFS-realtime言語バインディング

[![Gemバージョン](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)のProtocolBuffer仕様から生成されたRubyクラスを提供します。 これらのクラスは、バイナリ ProtocolBuffer GTFS-realtime データフィードを Ruby オブジェクトにパースすることを可能にします。

!!! fail "非推奨"

    *2019年2月現在、公式のGoogle protocツール`google-protobufは`proto2ファイル内の[拡張子をサポートして](https://github.com/protocolbuffers/protobuf/issues/1198)いません。 サードパーティのツールである[ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers) `gem install ruby-protocol-buffers`インストールできますが、ユニットテストが失敗するため、Ruby GTFSバインディングの既存の構造とは一致しないようです。 そのため、Googleプロトコルバッファツールでproto2ファイルの公式サポートが実装されるまで、このRubyバインディングは非推奨とします。*

## 依存関係の追加

`gtfs-realtime-bindings`クラスを自分のプロジェクトで使用するには、まず[Ruby gemを](https://rubygems.org/gems/gtfs-realtime-bindings)インストールする必要があります。

    gem install gtfs-realtime-bindings

## コード例

次のコードでは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをFeedMessage（GTFS-realtimeスキーマのルートタイプ）として解析し、結果を反復処理する様子を示しています。

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

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成される Ruby クラスの命名規則の詳細については、[gtfs-realtime.pb.rb のソース](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb)ファイルを参照してください。
