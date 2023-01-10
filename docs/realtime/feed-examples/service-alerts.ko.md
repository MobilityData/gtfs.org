# 서비스 알림

다음 예는 경고 피드의 ASCII 표현입니다.

```python
# header 정보
header {
  # 의 버전speed 사양. 현재 "2.0". 유효한 버전은 "2.0", "1.0"입니다.
  gtfs_realtime_version: "2.0"

  # 데이터 세트가 증분인지 또는full
  incrementality: FULL_DATASET

  # 그만큼time 이 데이터 세트가 서버에서 생성된 위치
  # 의 순서를 결정하기 위해Alert 피드
  timestamp: 1284457468
}
# 여러 엔터티가 피드에 포함될 수 있습니다.
entity {
  # 에 대한 고유 식별자entity
  id: "0"

  # 의 "유형"entity
  alert {
    # 다음과 같은 경우 여러 기간을 정의할 수 있습니다.Alert 활성
    active_period {
      # starttime POSIX 시대 형식
        start: 1284457468
      # endtime POSIX 시대 형식
      end: 1284468072
    }
    # 선택합니다GTFS 엔터티가 영향을 받음
    informed_entity {
      # 유효한 매개변수:
      # agency_id, route_id, route_type, stop_id, trip (보다TripDescriptor )
      route_id: "219"
    }
    # 다중 선택기(informed_entity ) 하나에 포함될 수 있습니다.Alertentity
    informed_entity {
      stop_id: "16230"
    }
    # 여러 필드를 하나에 포함할 수 있습니다.informed_entity
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # 이 예는 정류장 16299의 경로 100을 의미합니다.
      # 이는 100번 경로의 다른 정류장과 16299번 정류장의 다른 경로에는 적용되지 않습니다.
    }

    # Cause 의Alert - 보다 gtfs-realtime.proto 유효한 값
    cause: CONSTRUCTION
    # Effect 의Alert - 보다 gtfs-realtime.proto 유효한 값
    effect: DETOUR

    # 주어진url 추가 정보를 제공합니다
    url {
      # 여러 언어/번역 지원
      translation {
        # Google 외부에서 호스팅되는 페이지(제공업체/대행사 등)
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # header \~을 위해Alert 강조 표시됩니다
    header_text {
      # 여러 언어/번역 지원
    translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # Alert 설명. 추가의info \~로headertext
    description_text {
      # 여러 언어/번역 지원
      translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```
