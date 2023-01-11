# Ruby GTFS-실시간 언어 바인딩

[![보석 버전](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer 사양에서 생성된 Ruby 클래스를 제공합니다. 이러한 클래스를 사용하면 바이너리 ProtocolBuffer GTFS-실시간 데이터 피드를 Ruby 객체로 파싱할 수 있습니다.

!!! fail "더 이상 사용되지 않음"

    **2019년 2월부터 공식 `google-protobuf` Google protoc 도구는 proto2 파일의 [확장 프로그램을 지원하지 않습니다](https://github.com/protocolbuffers/protobuf/issues/1198) . 타사 도구인 [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), 을 사용하여 설치할 수 있습니다.Ruby `gem install ruby-protocol-buffers` 의 기존 구조와 일치하지 않는 것 같습니다.Ruby GTFS-rt 바인딩, 단위 테스트 실패. 결과적으로 우리는Ruby Google 프로토콜 버퍼 도구에서 proto2 파일에 대한 공식 지원이 구현될 때까지 바인딩합니다.**

## 종속성 추가

자신의 프로젝트에서 `gtfs-realtime-bindings` 클래스를 사용하려면 먼저 [Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings) 을 설치해야 합니다.

    gem install gtfs-realtime-bindings

## 예제 코드

다음 코드 스니펫은 특정 URL에서 GTFS 실시간 데이터 피드를 다운로드하여 FeedMessage(GTFS 실시간 스키마의 루트 유형)로 파싱하고 결과를 반복하는 방법을 보여줍니다.

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

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) 에서 생성된 Ruby 클래스의 명명 규칙에 대한 자세한 내용 [은 gtfs-realtime.pb.rb 소스 파일](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb) 을 확인하십시오.
