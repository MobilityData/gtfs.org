# Ruby GTFS-realtime 语言绑定

[![宝石版本](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

提供从GTFS-realtime ProtocolBuffer规范中生成的Ruby类。 这些类将允许你解析一个二进制的ProtocolBuffer GTFS-realtime数据馈送到Ruby对象。

!!! fail "废弃的"

    *截至2019年2月，官方的`google-protobuf`Google protoc工具[不支持](https://github.com/protocolbuffers/protobuf/issues/1198)proto2文件的 扩展。 第三方工具[ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers)可以使用`gem install ruby-protocol-buffers`来安装，但似乎不符合Ruby GTFS绑定的现有结构，因为单元测试失败。 因此，在谷歌协议缓冲区工具实现对proto2文件的正式支持之前，我们将废弃Ruby的绑定方式。

## 添加依赖关系

要在你自己的项目中使用`gtfs-realtime-bindings`类，你需要首先安装[Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings)。

    gem install gtfs-realtime-bindings

## 示例代码

下面的代码片段演示了从一个特定的URL下载GTFS-realtime数据源，将其解析为FeedMessage（GTFS-realtime模式的根类型），并对结果进行迭代。

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

关于从[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的Ruby类的命名规则的更多细节，请查看[gtfs-realtime.pb.rb源文件](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb)。
