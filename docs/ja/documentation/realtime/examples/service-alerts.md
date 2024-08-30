# サービスアラート

次の例は、アラートフィードの ASCII 表現です。

```python#ヘッダー情報
header {
# 速度仕様のバージョン。現在は`2.0`です。有効なバージョンは`2.0`、`1.0`です。
 gtfs_realtime_version: `2.0`

# データセットが増分か完全かを決定します
 incrementality: FULL_DATASET#このデータセットがサーバー上で生成された時刻
# アラート フィードのシーケンスを決定するためのもの
 timestamp: 1284457468
}
# フィードには複数のエンティティを含めることができます
entity {
# エンティティの一意の識別子
 id: `0`

# エンティティの`タイプ`
 alert {
  # アラートがアクティブな場合は複数の期間を定義できます
    active_period {
     # POSIX エポック形式の開始時刻
      start: 1284457468#POSIX エポック形式の終了時刻
      end: 1284468072
    }
  # 影響を受ける GTFS エンティティを選択します
    informed_entity {
     # 有効なパラメータ: 
     # agency_id、 route_id、route_type、stop_id、trip ( TripDescriptorを参照)
       route_id: "219"
    }
  # 1 つのアラート エンティティに複数のセレクター (informed_entity) を含めることができます
    informed_entity {
      stop_id: "16230"
    }
  # 1 つの informed_entity に複数のフィールドを含めることができます
    informed_entity {
      stop_id: "16299"
       route_id: "100"
     # この例では、ルート 100 のストップ 16299 を意味します。
     # これは、ルート 100 の他のストップやストップ 16299 の他のルートには適用されません。
    }

  # アラートの原因 - 有効な値については gtfs-realtime.proto を参照してください
    cause: CONSTRUCTION#アラートの影響 - を参照してください有効な値については gtfs-realtime.proto を参照してください
    effect: DETOUR#指定された URL は追加情報を提供します
    url {
     # 複数の言語/翻訳がサポートされています
      translation {
     # Google の外部でホストされているページ（プロバイダ/代理店など）
       text: "http://www.sometransitagency/alerts"
       language: "en"
      }
    }

  # アラートのヘッダーが強調表示されます
    header_text {
     # 複数の言語/翻訳がサポートされています
      translation {
       text: "Stop at Elm street is closed, temporary stop at Oak street"
       language: "en"
      }
    }

  # アラートの説明。ヘッダーテキストへの追加情報
    description_text {
     # 複数の言語/翻訳がサポートされています
      translation {
       text: "エルム ストリートの工事のため、停留所は閉鎖されています。臨時停留所は、300 メートル北のオーク ストリートにあります"
       language: "en"
      }
    }
 }
}
```



