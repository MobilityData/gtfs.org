<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/ruby/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Ruby GTFS-realtime 言語バインディング

[![Gem バージョン](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) プロトコル バッファ仕様から生成された Ruby クラスを提供します。これらのクラスを使用すると、バイナリ プロトコル バッファ GTFS-realtime データ フィードを Ruby オブジェクトに解析できます。

!!! fail "非推奨"

   2019 年 2 月現在、公式の Google プロトコル ツール `google-protobuf` は、proto2 ファイルの [拡張機能をサポートしていません](https://github.com/protocolbuffers/protobuf/issues/1198)。サードパーティ ツールの [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers) は、`gem install ruby​​-protocol-buffers` を使用してインストールできますが、単体テストが失敗するため、Ruby GTFS-rt バインディングの既存の構造と一致していないようです。そのため、Google プロトコル バッファ ツールで proto2 ファイルの公式サポートが実装されるまで、Ruby バインディングは非推奨となります。

## 依存関係の追加

独自のプロジェクトで `gtfs-realtime-bindings` クラスを使用するには、まず [Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings) をインストールする必要があります。

```
gem install gtfs-realtime-bindings
```

## サンプル コード

次のコード スニペットは、特定の URL から GTFS realtime データ フィードをダウンロードし、それを FeedMessage (GTFS realtime スキーマのルート タイプ) として解析し、結果を反復処理する方法を示しています。

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

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成される Ruby クラスの命名規則の詳細については、[gtfs-realtime.pb.rb ソース ファイル](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb) を参照してください。