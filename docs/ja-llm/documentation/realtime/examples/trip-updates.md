# 便の更新(trip update) {: #trip-update}


以下の例は、完全データセットの便の更新(trip update)フィードを ASCII で表現したものです。

```python
# ヘッダー情報
header {
  # speed 仕様のバージョン。現在は "2.0"。有効なバージョンは "2.0", "1.0"。
  gtfs_realtime_version: "2.0"
  # データセットが増分か完全かを決定する
  incrementality: FULL_DATASET
  # このデータセットがサーバーで生成された時刻
  timestamp: 1284457468
}

# フィードには複数の entity を含めることができる
entity {
  # entity の一意な識別子
  id: "simple-trip"

  # entity の "type"
  trip_update {
    trip {
      # どの GTFS entity (trip) が影響を受けるかを選択
      trip_id: "trip-1"
    }
    # 運行スケジュール情報の更新
    stop_time_update {
      # どの停留所等(stop)が影響を受けるかを選択
      stop_sequence: 3
      # 車両の到着時刻に関して
      arrival {
        # 5 秒の遅延
        delay: 5
      }
    }
    # ...この車両の遅延は後続の停留所等(stop)に伝播されます。

    # 車両のスケジュールに関する次の更新情報
    stop_time_update {
      # stop_sequence によって選択される。更新対象は
      stop_sequence: 8
      # 車両の元の（予定された）到着時刻を
      arrival {
        # 1 秒の遅延に更新
        delay: 1
      }
    }
    # ...同様に遅延は後続の停留所等(stop)に伝播されます。

    # 車両のスケジュールに関する次の更新情報
    stop_time_update {
      # stop_sequence によって選択される。車両の到着時刻を更新
      stop_sequence: 10
      # 遅延 0（定刻通り）に更新し、この更新を
      # 残りの停留所等(stop)に伝播します。
    }
  }
}

# 別の便に関する更新情報を含む 2 つ目の entity
entity {
  id: "3"
  trip_update {
    trip {
      # 頻度ベースの便は GTFS 内の
      # trip_id によって定義される
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # 負の遅延は、車両が予定より 2 秒早いことを意味する
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
