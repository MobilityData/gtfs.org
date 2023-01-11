# Python GTFS-realtime 언어 바인딩

[![PyPI 버전](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer 사양에서 생성된 Python 클래스를 제공합니다. 이러한 클래스를 사용하면 바이너리 ProtocolBuffer GTFS-실시간 데이터 피드를 Python 개체로 파싱할 수 있습니다.

## 종속성 추가

자신의 프로젝트에서 `gtfs-realtime-bindings` 클래스를 사용하려면 먼저 [PyPI 저장소](https://pypi.python.org/pypi/gtfs-realtime-bindings) 에서 모듈을 설치해야 합니다.

    # Using easy_install
    easy_install --upgrade gtfs-realtime-bindings

    # Using pip
    pip install --upgrade gtfs-realtime-bindings

## 예제 코드

다음 코드 스니펫은 특정 URL에서 GTFS 실시간 데이터 피드를 다운로드하여 FeedMessage(GTFS 실시간 스키마의 루트 유형)로 파싱하고 결과를 반복하는 방법을 보여줍니다.

```python
from google.transit import gtfs_realtime_pb2
import requests

feed = gtfs_realtime_pb2.FeedMessage()
response = requests.get('URL OF YOUR GTFS-REALTIME SOURCE GOES HERE')
feed.ParseFromString(response.content)
for entity in feed.entity:
  if entity.HasField('trip_update'):
    print(entity.trip_update)
```

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) 에서 생성된 Python 클래스의 명명 규칙에 대한 자세한 내용은 Protocol Buffers 개발자 사이트의 [Python Generated Code](https://developers.google.com/protocol-buffers/docs/reference/python-generated) 섹션을 확인하십시오.
