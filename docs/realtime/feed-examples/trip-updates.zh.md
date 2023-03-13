# 旅程更新

下面的例子是一个全数据集的行程更新信息的ASCII表示。

```python
# header信息
header {
  # 速度规范的版本。目前是 "2.0"。有效版本是 "2.0"、"1.0"。
  gtfs_realtime_version: "2.0"
  # 确定数据集是增量的还是完整的
  incrementality: FULL_DATASET
  # 该数据集在服务器上生成的时刻
  timestamp: 1284457468
}

# 多个实体可以被包括在饲料中
entity {
  # 该entity的唯一标识符
  id: "simple-trip"

  # entity的 "类型"
  trip_update {
    trip {
      # 选择哪个GTFS entity (trip）将受到影响
      trip_id: "trip-1"
    }
    # 时间表信息更新
    stop_time_update {
      # 选择哪一站受到影响
      stop_sequence: 3
      # 为车辆到达时间
      arrival {
        # 将被延迟5秒
        delay: 5
      }
    }
    # ...这车辆的delay会传播到它的后续站点。

    # 车辆的下一次信息更新时间表
    stop_time_update {
      # 由stop_sequence选择。它将更新
      stop_sequence: 8
      # 车辆的原定（预定）到达时间与
      arrival {
        # 1秒delay。
        delay: 1
      }
    }
    # ...同样地，delay也会传播到后续站点。

    # 车辆的下一次信息更新时间表
    stop_time_update {
      # 由stop_sequence选择。它将更新车辆到达时间
      stop_sequence: 10
      # 的默认delay为0（时间上），并传播这一更新。
      # 为车辆的其余站点。
    }
  }
}

# 第二个entity，包含另一个trip的更新信息
entity {
  id: "3"
  trip_update {
    trip {
      # 基于频率的旅行是由其
      # GTFS中的trip_id和
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # 负delay意味着车辆比计划提前2秒
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
