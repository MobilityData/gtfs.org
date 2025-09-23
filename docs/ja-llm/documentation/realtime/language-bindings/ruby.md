<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/ruby/README.md" title="このページを編集" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Ruby GTFS-realtime 言語バインディング {: #ruby-gtfs-realtime-language-bindings}


[![Gem Version](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol Buffer 仕様から生成された Ruby クラスを提供します。これらのクラスを使用することで、バイナリ形式の Protocol Buffer GTFS-realtime データフィードを Ruby オブジェクトに変換して解析することができます。

!!! fail "非推奨"

    *2019年2月時点で、公式の `google-protobuf` Google protoc ツールは proto2 ファイルにおける [拡張機能をサポートしていません](https://github.com/protocolbuffers/protobuf/issues/1198)。サードパーティ製ツールである [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers) を `gem install ruby-protocol-buffers` でインストールすることは可能ですが、ユニットテストが失敗するため、既存の Ruby GTFS-rt バインディングの構造とは一致しないようです。その結果、Google の protocol buffer ツールで proto2 ファイルの公式サポートが実装されるまで、Ruby バインディングは非推奨とします。*

## 依存関係の追加 {: #add-the-dependency}

自身のプロジェクトで `gtfs-realtime-bindings` クラスを使用するには、まず [Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings) をインストールする必要があります。

```
gem install gtfs-realtime-bindings
```

## コード例 {: #example-code}

以下のコードスニペットは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをGTFS-realtimeスキーマのルート型であるFeedMessageとしてパースし、結果を反復処理する方法を示しています。

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

Rubyクラスの命名規則に関する詳細については、[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成された [gtfs-realtime.pb.rb ソースファイル](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb) を参照してください。
