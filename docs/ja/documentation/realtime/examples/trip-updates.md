# 旅行更新

次の例は、完全なデータセットの旅行更新フィードを表す ASCII 表現です。

```python#ヘッダー情報
header {
# 速度仕様のバージョン。現在は`2.0`です。有効なバージョンは`2.0`、`1.0`です。
 gtfs_realtime_version: `2.0`
# データセットが増分か完全かを決定します
 incrementality: FULL_DATASET#このデータセットがサーバー上で生成された時刻
 timestamp: 1284457468
}

# フィードには複数のエンティティを含めることができます
entity {
# エンティティの一意の識別子
 id: `simple-trip`

# エンティティの`タイプ`
 trip_update {
    trip {
     # 影響を受ける GTFS エンティティ (旅行) を選択します
       trip_id: `trip-1`
    }
  # スケジュール情報の更新
    stop_time_update {
     # 影響を受ける停留所を選択します
       stop_sequence : 3#車両の到着時間
      arrival {
     # 5 秒遅延します
       delay: 5
      }
    }
  #...この車両の遅延は、後続の停車駅に伝播します。

  # 車両のスケジュールに関する次の情報更新
    stop_sequence {
     # stop_sequenceによって選択されます。車両の元の (予定) 到着時刻が
      arrival {
     # 1 秒の遅延で更新されます。
       delay: 1
      }
    }
  #...同様に、遅延は後続の停車駅に伝播します。

  # 車両のスケジュールに関する次の情報更新
    stop_time_update {
     # stop_sequenceによって選択されます。車両の到着時刻
       stop_sequence: 10#をデフォルトの遅延 0 (定刻) で更新し、この更新を車両の残りの停車地に伝播します
    }
 }
}

# 別の旅行の更新情報を含む 2 番目のエンティティ
entity {
 id: "3"
 trip_update {
    trip {
     # 頻度ベースの旅行は、GTFS のtrip_idによって定義され
       trip_id: "frequency-expanded-trip"
     # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
       stop_sequence: 1
      arrival {
     # 負の遅延は、車両がスケジュールより 2 秒進んでいることを意味します
       delay: -2
      }
    }
    stop_time_update {
       stop_sequence: 9
    }
 }
}
```


