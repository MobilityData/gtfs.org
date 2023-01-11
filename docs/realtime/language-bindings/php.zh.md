# PHP GTFS-realtime 语言绑定

[![PHP版本](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

提供根据[GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/) ProtocolBuffer规范生成的PHP类。 这些类允许你将二进制的ProtocolBuffer GTFS-realtime数据源解析为PHP对象。

关于其他语言的绑定，请参见the [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) project。

!!! fail "废弃的"

    *截至2019年2月，官方的`google-protobuf`Google protoc工具[并不支持proto2文件](https://github.com/protocolbuffers/protobuf/issues/3623)。 因此，在谷歌协议缓冲区工具实现对proto2文件的正式支持之前，我们将废弃PHP绑定。*

## 添加依赖关系

要在你自己的项目中使用`gtfs-realtime-bindings-php`类，你需要首先安装[Packagist Composer软件包](https://packagist.org/packages/google/gtfs-realtime-bindings)。 要做到这一点，在你的`composer.json`文件中添加一个依赖项。

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

其中`x.y.z`是最新的发布版本。

[![PHP版本](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

然后更新你的Composer依赖项。

    composer update

## 示例代码

下面的代码片段演示了从一个特定的URL下载GTFS-realtime数据源，将其解析为FeedMessage（GTFS-realtime模式的根类型），并对结果进行迭代。

```php
require_once 'vendor/autoload.php';

use transit_realtime\FeedMessage;

$data = file_get_contents("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
$feed = new FeedMessage();
$feed->parse($data);
foreach ($feed->getEntityList() as $entity) {
  if ($entity->hasTripUpdate()) {
    error_log("trip: " . $entity->getId());
  }
}
```

关于从[gtfs-realtime.proto](https://developers.google.com/transit/gtfs-realtime/gtfs-realtime-proto)生成的PHP类的命名规则的更多细节，请查看[gtfs-realtime.php源代码文件](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php)。
