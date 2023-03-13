# サービスアラート

次の例は、AlertフィードをASCIIで表現したものです。

```python
# header情報
header {
  # スピード仕様のバージョン。現在は "2.0"。有効なバージョンは "2.0", "1.0 "です。
  gtfs_realtime_version: "2.0"

  # データセットがインクリメンタルか満杯判断します。
  incrementality: FULL_DATASET

  # このデータセットがサーバで生成された時間
  # Alertフィードの順序を決定するための
  timestamp: 1284457468
}
# フィードに複数のエンティティを含めることができる
entity {
  # entity固有の識別子
    id: "0"

  # entityゅ
  alert {
    # Alertアクティブになる期間を複数設定することが可能
    active_period {
      # POSIXエポック形式による開始時刻
        start: 1284457468
      # POSIXエポック形式による終了時間
        end: 1284468072
    }
    # どのGTFSエンティティが影響を受けるかを選択します。
    informed_entity {
      # 有効なパラメータです。
      # agency_id, route_id, route_type, stop_id, trip (TripDescriptor参照)
      route_id: "219"
    }
    # 1つのentity複数のセレクタ(informed_entity)を含めることができる。
    informed_entity {
      stop_id: "16230"
    }
    # 1つのinformed_entity複数のフィールドを含めることができる。
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # この例では、16299番地のルート100を意味します。
      # ルート100の他の停留所、および16299停留所の他のルートには適用されません。
    }

    # AlertCause- 有効な値についてはgtfs-realtime.protoを参照してください。
    cause: CONSTRUCTION
    # AlertEffect- 有効な値についてはgtfs-realtime.protoを参照してください。
    effect: DETOUR

    # 指定されたurlが追加情報を提供します。
    url {
      # 多言語/翻訳対応
      translation {
        # Google外ページ
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # Alertheaderハイライト表示されます
    header_text {
      # 多言語/翻訳対応
      translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # Alert 説明。 ヘッダー テキストへの追加情報追加
    description_text {
      # 多言語/翻訳対応
    translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```
