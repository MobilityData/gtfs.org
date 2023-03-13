# PHP GTFS-Realtime 언어 바인딩

[![PHP 버전](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

[GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/) ProtocolBuffer 사양에서 생성된 PHP 클래스를 제공합니다. 이러한 클래스를 사용하면 바이너리 ProtocolBuffer GTFS-realtime 데이터 피드를 PHP 개체로 파싱할 수 있습니다.

다른 언어로 된 바인딩은 [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) 프로젝트를 참조하세요.

!!! fail "더 이상 사용되지 않음"

    *2019년 2월부터 공식 `google-protobuf` Google protoc 도구 [는 proto2 파일을 지원하지 않습니다](https://github.com/protocolbuffers/protobuf/issues/3623) . 결과적으로 우리는PHP proto2 파일에 대한 공식 지원이 Google 프로토콜 버퍼 도구에서 구현될 때까지 바인딩됩니다.*

## 종속성 추가

자신의 프로젝트에서 `gtfs-realtime-bindings-php` 클래스를 사용하려면 먼저 [Packagist Composer 패키지](https://packagist.org/packages/google/gtfs-realtime-bindings) 를 설치해야 합니다. 이를 수행하려면 `composer.json` 파일에 종속성을 추가하십시오.

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

여기서 `x.y.z` 는 최신 릴리스 버전입니다.

[![PHP 버전](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

그런 다음 Composer 종속성을 업데이트합니다.

    composer update

## 예제 코드

다음 코드 스니펫은 특정 URL에서 GTFS-realtime 데이터 피드를 다운로드하여 FeedMessage(GTFS-realtime 스키마의 루트 유형)로 파싱하고 결과를 반복하는 방법을 보여줍니다.

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

[gtfs-realtime.proto](https://developers.google.com/transit/gtfs-realtime/gtfs-realtime-proto) 에서 생성된 PHP 클래스의 명명 규칙에 대한 자세한 내용 [은 gtfs-realtime.php 소스 파일](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php) 을 확인하세요.
