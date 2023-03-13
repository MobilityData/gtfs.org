# 여행 업데이트

다음 예는 전체 데이터 세트 여행 업데이트 피드의 ASCII 표현입니다.

```python
# header 정보
header {
  # 의 버전속도 사양. 현재 "2.0". 유효한 버전은 "2.0", "1.0"입니다.
  gtfs_realtime_version: "2.0"
  # 데이터 세트가 증분인지 전체인지 결정
  incrementality: FULL_DATASET
  # 이 데이터 세트가 서버에서 생성된 순간
  timestamp: 1284457468
}

# 여러 엔터티가 피드에 포함될 수 있습니다.
entity {
  # 에 대한 고유 식별자entity
  id: "simple-trip"

  # 의 "유형"entity
  trip_update {
    trip {
      # 선택합니다GTFSentity (trip ) 영향을 받음
        trip_id: "trip-1"
    }
    # 일정 정보 업데이트
    stop_time_update {
      # 영향을 받는 정류장 선택
      stop_sequence: 3
      # \~을 위해차량 '에스도착 시간
      arrival {
        # 5초 지연
          delay: 5
      }
    }
    # ...이것차량 '에스delay 후속 중지로 전파됩니다.

    # 다음 정보 업데이트에 대한차량 님의 일정
    stop_time_update {
      # 에 의해 선택됨stop_sequence . 업데이트 됩니다
      stop_sequence: 8
      # 그만큼차량 님의 원본(예정)도착 시간 와 함께
      arrival {
        # 1 초delay .
          delay: 1
      }
    }
    # ...마찬가지로delay 후속 중지로 전파됩니다.

    # 다음 정보 업데이트에 대한차량 님의 일정
    stop_time_update {
      # 에 의해 선택됨stop_sequence . 그것은 업데이트 할 것입니다차량 '에스도착 시간
      stop_sequence: 10
      # 기본값으로delay 0의 (에시간 ) 이 업데이트를 전파합니다.
      # 나머지차량 가 멈춥니다.
    }
  }
}

# 두번째entity 다른 업데이트 정보를 포함trip
entity {
  id: "3"
  trip_update {
    trip {
      # 주파수 기반 여행은
      # trip_id 안에GTFS 그리고
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # 부정적인delay 수단차량 예정보다 2초 빠름
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
