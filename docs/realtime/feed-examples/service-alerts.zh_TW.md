# 服務提醒

以下示例是警報提要的 ASCII 表示形式。

```python
# header信息
header {
  # 的版本速度規格。當前為“2.0”。有效版本為“2.0”、“1.0”。
  gtfs_realtime_version: "2.0"

  # 確定數據集是增量的還是滿的
  incrementality: FULL_DATASET

  # 這時間在服務器上生成此數據集的位置
  # 用於確定順序Alert提要
  timestamp: 1284457468
}
# 多個實體可以包含在提要中
entity {
  # 的唯一標識符entity
    id: "0"

  # “類型”的entity
  alert {
    # 可以定義多個期間Alert活躍
    active_period {
      # 開始時間採用 POSIX 紀元格式
      start: 1284457468
      # 時間結束採用 POSIX 紀元格式
      end: 1284468072
    }
    # 選擇哪個GTFS實體將受到影響
    informed_entity {
      # 有效參數：
        # agency_id, route_id, route_type, stop_id, trip （看TripDescriptor)
      route_id: "219"
    }
    # 多個選擇器（informed_entity) 可以包含在一個Alertentity
    informed_entity {
      stop_id: "16230"
    }
    # 多個字段可以包含在一個informed_entity
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # 此示例表示路線 100 在站點 16299 處。
      # 這不適用於路線 100 上的任何其他站點和站點 16299 處的任何其他路線。
    }

    # Cause的Alert- 看 gtfs-realtime.proto 有效值
    cause: CONSTRUCTION
    # Effect的Alert- 看 gtfs-realtime.proto 有效值
    effect: DETOUR

    # 給定的url提供額外信息
    url {
      # 支持多種語言/翻譯
      translation {
        # 在 Google 之外託管的網頁（在提供商/代理機構等處）
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # header為了Alert將被突出顯示
    header_text {
      # 支持多種語言/翻譯
      translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # Alert描述。額外的信息到header文本
    description_text {
      # 支持多種語言/翻譯
      translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```
