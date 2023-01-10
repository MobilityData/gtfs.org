# 行程更新

以下示例是完整數據集行程更新提要的 ASCII 表示。

```python
# header信息
header {
  # 的版本speed規格。當前為“2.0”。有效版本為“2.0”、“1.0”。
  gtfs_realtime_version: "2.0"
  # 確定數據集是增量的還是full
  incrementality: FULL_DATASET
  # 在服務器上生成此數據集的時刻
  timestamp: 1284457468
}

# 多個實體可以包含在提要中
entity {
  # 的唯一標識符entity
  id: "simple-trip"

  # “類型”的entity
  trip_update {
    trip {
      # 選擇哪個GTFSentity(trip) 會受影響
      trip_id: "trip-1"
    }
    # 日程信息更新
    stop_time_update {
      # 選擇受影響的站點
      stop_sequence: 3
      # 為了vehicle的arrivaltime
      arrival {
        # 延遲5秒
        delay: 5
      }
    }
    # ...這個vehicle的delay傳播到其後續站點。

    # 下次信息更新vehicle的日
    stop_time_update {
      # 被選擇stop_sequence.它會更新
      stop_sequence: 8
      # 這vehicle的原創（預定）arrivaltime與
      arrival {
        # 1秒delay.
        delay: 1
      }
    }
    # ...同樣的delay傳播到後續站點。

    # 下次信息更新vehicle的日程
    stop_time_update {
      # 被選擇stop_sequence.它將更新vehicle的arrivaltime
      stop_sequence: 10
      # 與默認delay的 0（在time) 並傳播此更新
      # 對於其餘的vehicle的停止。
    }
  }
}

# 第二entity包含另一個的更新信息trip
entity {
  id: "3"
  trip_update {
    trip {
      # 基於頻率的行程由他們定義
      # trip_id在GTFS和
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # 消極的delay方法vehicle提前2秒
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
