# Ruby GTFS-Realtime語言綁定

[![寶石版](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

提供從[GTFS-Realtime](https://github.com/google/transit/tree/master/gtfs-realtime)ProtocolBuffer 規範生成的 Ruby 類。這些類將允許您將二進制 ProtocolBuffer GTFS-Realtime數據饋送解析為 Ruby 對象。

!!! fail "棄用"

    *截至 2019 年 2 月，官方`google-protobuf` Google protoc 工具[不支持 proto2 文件中的擴展](https://github.com/protocolbuffers/protobuf/issues/1198)。第 3 方工具， [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers)，可以使用安裝 `gem install ruby-protocol-buffers` 但似乎與現有的結構不匹配Ruby GTFS-rt 綁定，因為單元測試失敗。因此，我們棄用了Ruby綁定，直到在 Google 協議緩衝區工具中實現對 proto2 文件的正式支持。*

## 添加依賴項

要在您自己的項目中使用`gtfs-realtime-bindings`類，您需要先安裝[Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings) ：

    gem install gtfs-realtime-bindings

## 示例代碼

以下代碼片段演示了從特定 URL 下載 GTFS-realtime數據提要，將其解析為 FeedMessage（GTFS-realtime 架構的根類型），並迭代結果。

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

有關從[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的 Ruby 類的命名約定的更多詳細信息，請查看[gtfs-realtime.pb.rb 源文件](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb)。
