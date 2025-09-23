# 運行情報(alert) {: #service-alert}


以下の例は、運行情報(alert)フィードの ASCII 表現です。

```python
# ヘッダー情報
header {
  # 仕様のバージョン。現在は "2.0"。有効なバージョンは "2.0", "1.0"。
  gtfs_realtime_version: "2.0"

  # データセットが増分か完全かを決定
  incrementality: FULL_DATASET

  # サーバーでこのデータセットが生成された時刻
  # 運行情報(alert)フィードの順序を決定するために使用
  timestamp: 1284457468
}
# フィードには複数のエンティティを含めることができます
entity {
  # エンティティの一意の識別子
  id: "0"

  # エンティティの "type"
  alert {
    # 運行情報(alert)が有効な複数の期間を定義可能
    active_period {
      # POSIX エポック形式での開始時刻
      start: 1284457468
      # POSIX エポック形式での終了時刻
      end: 1284468072
    }
    # どの GTFS エンティティが影響を受けるかを選択
    informed_entity {
      # 有効なパラメータ: 
      # agency_id, route_id, route_type, stop_id, trip (TripDescriptor を参照)
      route_id: "219"
    }
    # 1つの運行情報(alert)エンティティに複数のセレクタ(informed_entity)を含めることができます
    informed_entity {
      stop_id: "16230"
    }
    # 1つの informed_entity に複数のフィールドを含めることができます
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # この例は、停留所等(stop) 16299 における route 100 を意味します。
      # これは route 100 の他の停留所等(stop)や、停留所等(stop) 16299 における他の route には適用されません。
    }

    # 運行情報(alert)の原因 - 有効な値は gtfs-realtime.proto を参照
    cause: CONSTRUCTION
    # 運行情報(alert)の影響 - 有効な値は gtfs-realtime.proto を参照
    effect: DETOUR

    # 追加情報を提供する URL
    url {
      # 複数言語/翻訳をサポート
      translation {
        # Google 外部（事業者など）でホストされているページ
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # 運行情報(alert)のヘッダーは強調表示されます
    header_text {
      # 複数言語/翻訳をサポート
      translation {
        text: "Elm street の停留所等(stop)は閉鎖されています。臨時停留所等(stop)は Oak street にあります"
        language: "en"
      }
    }

    # 運行情報(alert)の説明。ヘッダーテキストに追加情報を提供
    description_text {
      # 複数言語/翻訳をサポート
      translation {
        text: "Elm street の工事により停留所等(stop)は閉鎖されています。臨時停留所等(stop)は北に 300 メートルの Oak street にあります"
        language: "en"
      }
    }
  }
}
```
