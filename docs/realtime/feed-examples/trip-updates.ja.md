# トリップアップデート

次の例は、フルデータセットトリップアップフィードをASCIIで表現したものです。

```python
# header情報
header {
  # スピード仕様のバージョン。現在は "2.0"。有効なバージョンは "2.0", "1.0 "です。
  gtfs_realtime_version: "2.0"
  # データセットが増分か完全かを判断します
  incrementality: FULL_DATASET
  # このデータセットがサーバーで生成された瞬間
  timestamp: 1284457468
}

# フィードに複数のエンティティを含めることができる
entity {
  # entity固有の識別子
  id: "simple-trip"

  # entityゅ
  trip_update {
    trip {
      # どのGTFS entity(trip)が影響を受けるかを選択します。
      trip_id: "trip-1"
    }
    # スケジュール情報更新
    stop_time_update {
      # どの停留所を対象とするかを選択する
      stop_sequence: 3
      # は、車両到着時刻
        arrival {
        # を5秒遅らせる
        delay: 5
      }
    }
    # ...この車両 delay、後続の停車駅に伝搬される。

    # 車両スケジュールに関する次の情報の更新
        stop_time_update {
      # stop_sequence選択された。を更新します。
      stop_sequence: 8
      # 車両到着予定時間表示します。
      arrival {
        # 1秒間のdelay
        delay: 1
      }
    }
    # ...同様に、delay後続の停車駅に伝搬される。

    # 車両スケジュールに関する次の情報の更新
    stop_time_update {
      # stop_sequence で選択された。車両到着時間更新される
      stop_sequence: 10
      # をデフォルトのdelay0（時間）に設定し、この更新を伝搬させます。
      # を、残りの車両時間に使用します。
    }
  }
}

# 別の旅行の更新情報を含む 2 番目のエンティティ
entity {
  id: "3"
  trip_update {
    trip {
      # 頻度ベースのトリップは、その頻度によって定義されます。
      # GTFS の trip_id と
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # 負のdelay、車両予定より2秒進んでいることを意味します。
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
