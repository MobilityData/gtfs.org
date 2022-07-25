---
search:
  exclude: true
---

# GTFS Realtime最佳实践

## 介绍

这些是以[GTFS Realtime](../reference)数据格式描述Realtime公共交通信息的推荐做法。

### 文件结构

推荐的实践被组织成两个主要部分

* __[按信息组织的实践建议](#practice-recommendations-organized-by-message)__。建议按信息和字段组织，其顺序与官方GTFS Realtime参考中描述的相同。
* __[按案例组织的实践建议](#practice-recommendations-organized-by-use-case)__。对于特殊情况，如基于频率的服务（相对于Schedule服务），实践可能需要应用于几个消息和字段以及相应的GTFS Schedule数据。此类建议在本节中进行了整合。

### 消息发布和一般实践

* 消息源应发布在一个公共的、永久的URL上
* 该URL应该可以直接访问，而不需要登录来访问信息源。如果需要，可以使用API密钥，但API密钥的注册应该是自动的，并对所有人开放。
* 在GTFS Realtime馈送中保持持久的标识符（id字段）（例如，`FeedEntity.id`、`VehicleDescriptor.id`、`CarriageDetails.id`），跨越馈送的迭代。
* GTFS Realtime馈送应至少每30秒刷新一次，或每当馈送中代表的信息（车辆位置）发生变化时，以更频繁的方式为准。车辆位置往往比其他feed实体更频繁地变化，应尽可能频繁地更新。如果内容没有改变，应该用一个新的`FeedHeader.timestamp`来更新feed，反映出信息在该时间点上仍然是相关的。
* GTFS Realtime馈送中的数据对于行程更新和车辆位置不应超过90秒，对于服务警报不应超过10分钟。例如，即使生产者每30秒不断刷新`FeedHeader.timestamp`的时间戳，该饲料中的VehiclePositions的年龄不应超过90秒。
* 托管GTFS Realtime数据的服务器应该是可靠的，并持续返回有效格式的protobuf编码响应。少于1%的响应应该是无效的（protobuf错误或获取错误）。
* 托管GTFS Realtime数据的网络服务器应被配置为正确报告文件修改日期（见第14.29节下的HTTP/1.1 - Request for Comments 2616），以便消费者能够利用`If-Modified-Since`HTTP头。这通过避免传输没有改变的馈送内容，节省了生产者和消费者的带宽。
* 当通过给定URL的HTTP请求进行查询时，Feeds应该默认提供协议缓冲区编码的Feed内容--消费者不应该需要定义特殊的HTTP接受头来接收协议缓冲区编码的内容。
* 由于协议缓冲区如何编码[可选值](https://developers.google.com/protocol-buffers/docs/proto#optional)，在从GTFS Realtime馈送中读取数据之前，消费者应在使用该值之前使用协议缓冲区生成的`hasX()`方法检查该值是否存在，并且仅在`hasX()`为真时使用该值（其中`X`是字段的名称）。如果`hasX()`返回`false`，应该假定`GTFS`.proto值中定义的该字段的默认值。如果消费者在没有先检查`hasX()`方法的情况下使用该值，它可能在读取生产者没有故意发布的默认数据。
* 饲料应该使用HTTPS而不是HTTP（没有加密），以确保饲料的完整性。
* 馈送应涵盖配套的静态GTFS数据集中所包含的绝大多数行程。特别是，它应该包括高密度和高交通量的城市地区和繁忙路线的数据。

## 按信息组织的实践建议

### FeedHeader

| 字段名                     | 建议                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gtfs_realtime_version` | 目前的版本是 "2.0"。  所有GTFS Realtime馈送应该是 "2.0 "或更高版本，因为早期版本的GTFS Realtime不需要充分表示各种运输情况所需的所有字段。                                                                                                                                                                                                                                                                                                                             |
| `timestamp`             | 这个时间戳在两个连续的喂食迭代之间不应该减少。                                                                                                                                                                                                                                                                                                                                                                                               |
|                         | 如果馈送内容发生变化，该时间戳值应始终改变 - 馈送内容不应改变而不更新标题 `timestamp`.<br/><br/>*常见错误*- 如果在负载平衡器后面有多个GTFS Realtime馈送的实例，每个实例可能会从Realtime数据源拉取信息并发布给消费者，但这一过程稍有不同步。如果一个GTFS Realtime消费者发出两个背对背的请求，并且每个请求由不同的GTFS Realtimefeed 实例提供，则相同的 feed 内容可能会以不同的时间戳返回给消费者。<br/><br/>*可能的解决方案*- 生产者应该提供一个 `Last-Modified`HTTP头，而消费者应该传递他们最近的 `If-Modified-Since`HTTP头，以避免收到陈旧的数据。<br/><br/>*可能的解决方案*- 如果不能使用HTTP头，可以使用粘性会话等选项，以确保每个消费者被路由到同一个生产者服务器。 |

### FeedEntity

所有实体只有在它们不再与用户相关时才应从GTFS Realtime馈送中删除。馈送被认为是无状态的，这意味着每个馈送反映了交通系统的整个实时状态。如果一个实体在一个馈送实例中被提供，但在随后的馈送更新中被放弃，应假定没有该实体的实时信息。

| 字段名  | 建议            |
| ---- | ------------- |
| `id` | 应该在整个行程期间保持稳定 |

### TripUpdate

旅程取消的一般准则。

* 当取消几天的行程时，生产者应该提供TripUpdates，把给定的`行程` `ID`和`开始日期`作为`CANCELED`，以及一个`NO_SERVICE`的警报，这个警报可以显示给乘客解释取消的原因（例如，绕道）。
* 如果一个行程中没有任何站点将被访问，该行程应该被`取消`，而不是将所有的`站点时间更新`标记为`SKIPPED`。

| 字段名                | 建议                                                                                                                                                                                                                                                                                                                      |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip`             | 参照 [消息 TripDescriptor](#TripDescriptor).                                                                                                                                                                                                                                                                                |
|                    | 如果单独 `VehiclePosition`和 `TripUpdate`提供了饲料。 [行程描述符](#TripDescriptor)和 [车辆描述符](#VehicleDescriptor)ID值配对应在两个feeds之间匹配。<br/><br/>例如，一个 `VehiclePosition`实体有 `vehicle_id:A`和 `trip_id:4`，那么相应的 `TripUpdate`实体也应该有 `vehicle_id:A`和 `trip_id:4`.如果任何 `TripUpdate`实体有 `trip_id:4`和任何 `vehicle_id`不超过4，这是一个错误。                   |
| `vehicle`          | 参照 [消息VehicleDescriptor](#VehicleDescriptor).                                                                                                                                                                                                                                                                           |
|                    | 如果单独的 `VehiclePosition`和 `TripUpdate`提供了feeds。 [旅程描述符](#TripDescriptor)和 [车辆描述符](#VehicleDescriptor)ID值配对应在两个馈送之间匹配。<br/><br/>例如，一个 `VehiclePosition`实体有 `vehicle_id:A`和 `trip_id:4`，那么相应的 `TripUpdate`实体也应该有 `vehicle_id:A`和 `trip_id:4`.如果有的话 `TripUpdate`实体有 `trip_id:4`和任何 `vehicle_id`除4以外，这是一个错误。                 |
| `stop_time_update` | `stop_time_updates`对于一个给定的 `trip_id`的车辆描述符应该是严格排序的，通过增加 `stop_sequence`并且没有 `stop_sequence`应该重复。                                                                                                                                                                                                                        |
|                    | 当行程正在进行时，所有 `TripUpdates`应至少包括一个 `stop_time_update`有预测的未来到达或离开时间。请注意，在 [GTFS Realtime规范](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates)说，生产者不应该放弃一个过去的 `StopTimeUpdate`如果它指的是一个在未来有预定到达时间的站点（即车辆已经提前通过Schedule该站点），那么生产者就不应该放弃过去的StopTimeUpdate，否则就会认为这个站点没有更新。 |
| `timestamp`        | 应该反映这个行程的这个预测被更新的时间。                                                                                                                                                                                                                                                                                                    |
| `delay`            | `TripUpdate.delay`应该代表Schedule的偏差，即车辆领先/落后于Schedule的过去观察值。对未来站点的预测应该通过以下方式提供 `StopTimeEvent.delay`或 `StopTimeEvent.time`.                                                                                                                                                                                               |

### TripDescriptor

如果提供单独的`VehiclePosition`和`TripUpdate`馈送，[TripDescriptor](#TripDescriptor)和[VehicleDescriptor](#VehicleDescriptor)ID值的配对应在两个馈送之间匹配。

例如，一个`VehiclePosition`实体有`vehicle_id:A`和`trip_id`:4，那么相应的`TripUpdate`实体也应该有`vehicle_id:A`和`trip_id`：4。

| 字段名                     | 建议                                |
| ----------------------- | --------------------------------- |
| `schedule_relationship` | 旅程的行为 `ADDED`的行为是没有规定的，不建议使用这个枚举。 |

### 车辆描述符

如果提供单独的`VehiclePosition`和`TripUpdate`信息，[TripDescriptor](#TripDescriptor)和[VehicleDescriptor](#VehicleDescriptor)ID值的配对应该在两个信息之间匹配。

例如，一个`VehiclePosition`实体有`vehicle_id:A`和`trip_id`:4，那么相应的`TripUpdate`实体也应该有`vehicle_id:A`和`trip_id`:4。

| 字段名  | 建议                    |
| ---- | --------------------- |
| `id` | 应该在整个行程中唯一地和稳定地识别一个车辆 |

### 停止时间更新

| 字段名             | 建议                                                                                                                                 |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `stop_sequence` | 提供 `stop_sequence`尽可能地提供，因为它可以明确地解决GTFS停车时间问题。 `stop_times.txt`不像 `stop_id`在一个行程中可能出现不止一次（例如，循环路线）。                                |
| `arrival`       | 连续停车之间的到达时间应该增加--它们不应该相同或减少。                                                                                                       |
|                 | 到达时间 `time`(指定在 [StopTimeEvent](#StopTimeEvent))应该在出发前 `time`如果预计有停靠或停留时间，同一站点的到达时间应该在出发时间之前 - 否则，到达时间 `time`应与出发时间相同。 `time`.     |
| `departure`     | 连续站点之间的出发时间应该增加--它们不应该相同或减少。                                                                                                       |
|                 | 出发时间 `time`(中规定的 [StopTimeEvent](#StopTimeEvent))应与同一站点的到达时间相同 `time`如果预计没有停靠或停留时间，同一站点的出发时间应与到达时间相同 - 否则，出发 `time`应该在到达之后 `time`. |

### StopTimeEvent

| 字段名     | 建议                                                                                                                                                                                                                                                              |
| ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `delay` | 如果只有 `delay`中提供了一个 `stop_time_update` `arrival`或 `departure`(而不是 `time`)，那么GTFS[`stop_times.txt`](https://gtfs.org/reference/static#stopstxt)应该包含 `arrival_times`和/或 `departure_times`为这些相应的站。A `delay`Realtime是没有意义的，除非你有一个时钟时间将其添加到GTFS中。 `stop_times.txt`文件。 |

### 车辆位置

以下是VehiclePostions馈送应包括的推荐字段，以向消费者提供高质量的数据（例如，用于生成预测）。

| 字段名称                 | 备注                                                                  |
| -------------------- | ------------------------------------------------------------------- |
| `entity.id`          | 应该在整个行程期间保持稳定                                                       |
| `vehicle.timestamp`  | 强烈建议提供测量车辆位置的时间戳。否则，消费者必须使用消息的时间戳，当最后一条消息的更新频率高于个人位置时，会对乘客产生误导性的结果。 |
| `vehicle.vehicle.id` | 应该在整个行程中唯一地、稳定地识别一个车辆                                               |

### 位置

车辆位置应该在当前行程的GTFS `shapes.txt`数据的200米范围内，除非对这个`trip_id`有一个具有`DETOUR`效果的警报。

### 警报

警报的一般准则:

* 当`trip_id`和`start_time`在`exact_time=1`的区间内时，`start_time`应该比区间的开始时间晚，是`headway_secs`的精确倍数。
* 当取消几天的行程时，生产者应该提供TripUpdates，将给定的`行程ID`和`开始日期`作为`CANCELED`，同时提供一个带有`NO_SERVICE`的提示，参考相同的`行程ID`和`时间范围`，可以显示给乘客解释取消的原因（例如，绕道）。
* 如果一个警报影响到一条线路上的所有站点，使用基于线路的警报而不是基于站点的警报。不要将警报应用到线路的每一站。
* 虽然服务提示没有字数限制，但公交乘客往往会在移动设备上查看提示信息。请简明扼要。

| 字段名                | 建议                  |
| ------------------ | ------------------- |
| `description_text` | 使用换行符，使你的服务提示更容易阅读。 |

## 按使用情况组织的实践建议

### 基于频率的旅行

基于频率的行程不遵循固定的Schedule，但试图保持预先确定的班次。这些行程在[GTFS.org/reference/static/#frequenciestxt">GTFS](<https://\<glossary variable=>)的frequency.txt中通过设置`exact_times=0`或省略`exact_times`字段来表示（注意`exact_times=1`的行程*不是*基于频率的行程，`frequencies.txt`中`exact_times=1`只是作为一种方便的方法，以更紧凑的方式存储Schedule行程）。在构建基于频率的行程的GTFS Realtime馈送时，有几个最佳做法需要记住。

* 在[TripUpdate.StopTimeUpdate](#StopTimeUpdate)中，`到达`和`离开的` [StopTimeEvent](#StopTimeEvent)不应该包含`延迟`，因为基于频率的旅行不遵循固定的Schedule。相反，应该提供`时间`来表示到达/离开的预测。

* 按照规范的要求，当使用[TripDescriptor](#TripDescriptor)在[TripUpdate](#TripDescriptor)或[VehiclePosition](#VehiclePosition)中描述`行程`时，必须提供所有的`trip_id`、`start_time`和`start_date`。此外，`schedule_relationship`应该是`UNSCHEDULED`。

(例如，重新执行的班次)。

## 关于本文件

### 目标

维护GTFS Realtime最佳实践的目标是。

* 改善终端用户在公共交通应用中的客户体验
* 使软件开发人员更容易部署和扩展应用程序、产品和服务

### 如何提出或修改已发布的GTFS Realtime最佳实践

GTFS的应用和实践不断发展，因此本文件可能需要不时地进行修改。要对本文档提出修正，请[在GTFS Realtime](https://github.com/MobilityData/GTFS_Realtime_Best-Practices)最佳实践GitHub仓库中打开一个拉动请求，并主张进行修改。

### 与本文件的链接

请在此链接，以便为饲料生产商提供正确形成GTFS Realtime数据的指导。每个单独的建议都有一个锚点链接。点击建议以获得页面内锚定链接的URL。

如果一个Realtime GTFS Realtime数据的应用程序对GTFS Realtime数据的做法提出了这里没有描述的要求或建议，建议发布一个包含这些要求或建议的文件来补充这些通用的最佳做法。
