# 服务警报

下面的例子是一个Alert feed的ASCII表示。

```python
# header信息
header {
  # speed规范的版本。目前是 "2.0"。有效版本是 "2.0"、"1.0"。
  gtfs_realtime_version: "2.0"

  # 确定数据集是增量的还是full
  incrementality: FULL_DATASET

  # 该数据集在服务器上生成的time
  # 用于确定Alert信息的顺序
  timestamp: 1284457468
}
# 多个实体可以被包括在饲料中
entity {
  # 该entity的唯一标识符
  id: "0"

  # entity的 "类型"
    alert {
    # 当Alert激活时，可以定义多个时段
    active_period {
      # 以POSIX纪元格式的start time
      start: 1284457468
      # 以POSIX纪元格式的end time
      end: 1284468072
    }
    # 选择哪些GTFS实体将受到影响
    informed_entity {
      # 有效参数。
      # agency_id, route_id, route_type, stop_id, trip (见TripDescriptor)
      route_id: "219"
    }
    # 多个选择器informed_entity）可以被包含在一个Alert entity中
    informed_entity {
      stop_id: "16230"
    }
    # 一个informed_entity中可以包含多个字段
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # 这个例子是指100路在16299号站。
      # 这不适用于100路的任何其他站点和16299站点的任何其他路线。
    }

    # Alert的Cause- 参见gtfs-realtime.proto的有效值
    cause: CONSTRUCTION
    # Alert的Effect- 参见gtfs-realtime.proto的有效值
    effect: DETOUR

    # 给定的url提供了额外的信息
    url {
      # 支持多种语言/翻译
      translation {
        # 网页托管在谷歌之外（在供应商/机构等）。
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # Alert的header将被突出显示
    header_text {
      # 支持多种语言/翻译
      translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # Alert描述。对header text添加info
    description_text {
      # 支持多种语言/翻译
      translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```
