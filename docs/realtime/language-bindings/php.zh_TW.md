# PHP GTFS-realtime語言綁定

[![PHP版本](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

提供從[GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/)ProtocolBuffer 規範生成的 PHP 類。這些類將允許您將二進制 ProtocolBuffer GTFS-realtime數據饋送解析為 PHP 對象。

對於其他語言的綁定，請參閱[gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings)項目。

!!! fail "棄用"

    *截至 2019 年 2 月，官方`google-protobuf`谷歌協議工具[不支持 proto2 文件](https://github.com/protocolbuffers/protobuf/issues/3623)。因此，我們棄用了PHP綁定，直到在 Google 協議緩衝區工具中實現對 proto2 文件的正式支持。*

## 添加依賴項

要在您自己的項目中使用`gtfs-realtime-bindings-php`類，您需要首先安裝[Packagist Composer 包](https://packagist.org/packages/google/gtfs-realtime-bindings)。為此，請在`composer.json`文件中添加依賴項：

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

其中`x.y.z`是最新發布版本：

[![PHP版本](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

然後更新您的 Composer 依賴項：

    composer update

## 示例代碼

以下代碼片段演示了從特定 URL 下載 GTFS-realtime數據提要，將其解析為 FeedMessage（GTFS-realtime 架構的根類型），並迭代結果。

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

有關從[gtfs-realtime.proto](https://developers.google.com/transit/gtfs-realtime/gtfs-realtime-proto)生成的 PHP 類的命名約定的更多詳細信息，請查看[gtfs-realtime.php 源文件](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php)。
