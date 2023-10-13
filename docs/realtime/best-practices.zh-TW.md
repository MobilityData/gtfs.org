---
search:
  exclude: true
---
  
# GTFS Realtime 最佳实践

## 介绍

这些是描述实时公共交通信息的推荐做法GTFS Realtime数据格式。

### 文件结构

推荐的做法分为两个主要部分

* __[实践建议组织者](#practice-recommendations-organized-by-message)__message__:__推荐由message和字段按照官方描述的相同顺序GTFS Realtime参考。
* __[按案例组织的实践建议](#practice-recommendations-organized-by-use-case)：__对于特定案例，例如基于频率的服务（与基于时间表的服务），实践可能需要应用于多个消息和字段以及相应的GTFS Schedule数据。此类建议合并在本节中。

### 饲料发布和一般实践

* 提要应在公开的、永久的url
* 这url应该可以直接访问，而无需登录即可访问提要。如果需要，可以使用 API 密钥，但 API 密钥的注册应该是自动化的并且对所有人都可用。
* 维护持久标识符 (id字段）内GTFS Realtime饲料（例如，FeedEntity.id ,VehicleDescriptor.id ,CarriageDetails.id ) 跨提要迭代。
* GTFS Realtime提要应至少每 30 秒刷新一次，或者每当提要中表示的信息 (Position一个vehicle) 更改，以较频繁者为准。 VehiclePositions 往往比其他提要实体更频繁地更改，应尽可能频繁地更新。如果内容未更改，则应使用新的更新FeedHeader `FeedHeader . timestamp`timestamp反映该信息仍然相关timestamp.
* 一个内的数据GTFS Realtime饲料不应超过 90 秒trip更新和vehicle服务警报的位置和不超过 10 分钟。例如，即使生产者不断刷新FeedHeader `FeedHeader . timestamp`timestamptimestamp每 30 秒，该提要中的 VehiclePosition 的年龄不应超过 90 秒。
* 服务器托管GTFS Realtime数据应该是可靠的，并且始终返回格式有效的 protobuf 编码响应。少于 1% 的响应应该是无效的（protobuf 错误或获取错误）。
* 网络服务器托管GTFS Realtime数据应配置为正确报告文件修改日期（参见 HTTP/1.1 - Request for Comments 2616，在第 14.29 节下），以便消费者可以利用`If-Modified-Since` HTTPheader.这通过避免传输未更改的提要内容来节省生产者和消费者的带宽。
* 当通过给定的 HTTP 请求进行查询时，Feed 应默认提供协议缓冲区编码的 Feed 内容url- 消费者不需要定义特殊的 HTTP 接受标头来接收协议缓冲区编码的内容。
* 由于协议缓冲区如何对[可选值](https://developers.google.com/protocol-buffers/docs/proto#optional)进行编码，因此在从GTFS Realtime提要消费者应在使用该值之前使用协议缓冲区生成的`hasX()`方法检查值的存在，并且仅应在`hasX()`为真（其中`X`是字段的名称）时使用该值。如果`hasX()`返回`false` ，则该字段的默认值在GTFS应该假设`GTFS -realtime.proto`值。如果消费者在没有首先检查`hasX()`方法的情况下使用该值，则它可能正在读取生产者无意发布的默认数据。
* Feed 应使用 HTTPS 而不是 HTTP（不加密）以确保 Feed 完整性。
* 提要应涵盖伴随静态中包含的绝大多数行程GTFS数据集。特别是，它应该包括高密度和高流量的城市地区和繁忙路线的数据。

## 实践建议组织者message

### FeedHeader

| 字段名称                    | 推荐                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gtfs_realtime_version` | 当前版本是“2.0”。全部GTFS Realtime提要应该是“2.0”或更高版本，作为早期版本GTFS Realtime不需要所有字段来充分代表各种过境情况。                                                                                                                                                                                                                                                                                                                                        |
| `timestamp`             | 这个timestamp在两个连续的馈送迭代之间不应减少。                                                                                                                                                                                                                                                                                                                                                                                            |
|                         | 这个timestamp如果提要内容更改，则值应始终更改 - 提要内容不应在不更新header`timestamp` .<br/><br/>*常见错误*- 如果有多个实例GTFS Realtime在负载均衡器后面馈送，每个实例可能会从实时数据源中提取信息并将其发布给稍微不同步的消费者。如果一个GTFS Realtime消费者发出两个背靠背请求，每个请求由不同的GTFS Realtimefeed 实例，相同的 feed 内容可能会以不同的时间戳返回给消费者。<br/><br/>*可能的解决方案*- 生产者应提供`Last-Modified`HTTPheader, 消费者应该通过他们最近的`If-Modified-Since`HTTPheader以避免收到过时的数据。<br/><br/>*可能的解决方案* - 如果无法使用 HTTP 标头，则可以使用粘性会话等选项来确保每个消费者都被路由到同一个生产者服务器。 |

### FeedEntity

所有实体只能从GTFS Realtime当它们不再与用户相关时提供。提要被认为是无状态的，这意味着每个提要都反映了整个真实的time公交系统的状态。如果entity在一个提要实例中提供，但在随后的提要更新中删除，应该假设没有真正的-time相关信息entity.

| 字段名称 | 推荐                 |
| ---- | ------------------ |
| `id` | 应该在整个过程中保持稳定trip期间 |

### TripUpdate

一般准则trip取消：

* 当取消几天内的旅行时，生产者应提供引用给定`trip_ids`和`start_dates`的 TripUpdates 作为CANCELED以及一个Alert和NO_SERVICE引用相同的`trip_ids`和TimeRange可以显示给乘客解释取消（例如，DETOUR）。
* 如果没有停止trip将被访问，trip应该CANCELED而不是将所有`stop_time_updates`标记为SKIPPED .

| 字段名称               | 推荐                                                                                                                                                                                                                                                                                                                       |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `trip`             | 参考[messageTripDescriptor](#TripDescriptor) .                                                                                                                                                                                                                                                                             |
|                    | 如果分开`VehiclePosition`和`TripUpdate`提供饲料，[TripDescriptor](#TripDescriptor)和[VehicleDescriptor](#VehicleDescriptor)id值配对应该在两个提要之间匹配。<br/><br/>例如，一个`VehiclePosition`entity有`vehicle_id:A`和`trip_id:4`, 那么对应的`TripUpdate`entity也应该有`vehicle_id:A`和`trip_id:4`.如果有的话`TripUpdate`entity有`trip_id:4`和任何`vehicle_id`除了 4，这是一个错误。 |
| `vehicle`          | 参考[messageVehicleDescriptor](#VehicleDescriptor) .                                                                                                                                                                                                                                                                       |
|                    | 如果分开`VehiclePosition`和`TripUpdate`提供饲料，[TripDescriptor](#TripDescriptor)和[VehicleDescriptor](#VehicleDescriptor)id值配对应该在两个提要之间匹配。<br/><br/>例如，一个`VehiclePosition`entity有`vehicle_id:A`和`trip_id:4`, 那么对应的`TripUpdate`entity也应该有`vehicle_id:A`和`trip_id:4`.如果有的话`TripUpdate`entity有`trip_id:4`和任何`vehicle_id`除了 4，这是一个错误。 |
| `stop_time_update` | `stop_time_updates`对于给定的`trip_id`应严格按照增加顺序`stop_sequence`和不`stop_sequence`应该重复。                                                                                                                                                                                                                                          |
|                    | 虽然trip正在进行中，所有`TripUpdates`应至少包括一个`stop_time_update`与预测arrival或者departuretime在将来。请注意，[GTFS Realtime规格](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates)说生产者不应该放弃过去`StopTimeUpdate`如果它指的是一个停止SCHEDULEDarrivaltime在给定的未来trip（即vehicle已提前通过该站点），否则将得出该站点没有更新的结论。      |
| `timestamp`        | 应反映time这个预测trip已更新。                                                                                                                                                                                                                                                                                                      |
| `delay`            | `TripUpdate.delay`应该表示进度偏差，即观察到的过去值如何提前/落后于进度vehicle是。应通过以下方式提供对未来停靠点的预测`StopTimeEvent.delay`或者`StopTimeEvent.time` .                                                                                                                                                                                                    |

### TripDescriptor

如果分开VehiclePosition和TripUpdate提供饲料，TripDescriptor和VehicleDescriptorid值配对应该在两个提要之间匹配。

例如，一个VehiclePositionentity有`vehicle_id:A`和trip_id `trip_id :4` ，那么对应的TripUpdateentity还应该有`vehicle_id:A`和trip_id `trip_id :4` 。

| 字段名称                    | 推荐                        |
| ----------------------- | ------------------------- |
| `schedule_relationship` | 的行为`ADDED`行程未指定，不推荐使用此枚举。 |

### VehicleDescriptor

如果分开VehiclePosition和TripUpdate提供饲料，TripDescriptor和VehicleDescriptorid值配对应该在两个提要之间匹配。

例如，一个VehiclePositionentity有`vehicle_id:A`和trip_id `trip_id :4` ，那么对应的TripUpdateentity还应该有`vehicle_id:A`和trip_id `trip_id :4` 。

| 字段名称 | 推荐                           |
| ---- | ---------------------------- |
| `id` | 应该唯一且稳定地识别一个vehicle在整个trip期间 |

### StopTimeUpdate

| 字段名称            | 推荐                                                                                                                                   |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `stop_sequence` | 提供`stop_sequence`只要有可能，因为它明确地解析为GTFS停止time在`stop_times.txt`不像`stop_id`, 这可能在一个trip（例如，循环路线）。                                         |
| `arrival`       | arrival连续停止之间的时间应该增加 - 它们不应该相同或减少。                                                                                                   |
|                 | arrival`time`（指定在[StopTimeEvent](#StopTimeEvent)) 应该在departure`time`如果中途停留或停留，则为同一站点time预计 - 否则，arrival`time`应该是一样的departure`time` . |
| `departure`     | departure连续停止之间的时间应该增加 - 它们不应该相同或减少。                                                                                                 |
|                 | departure`time`（指定在[StopTimeEvent](#StopTimeEvent)) 应与arrival`time`如果没有中途停留或停留，则为同一站time预计 - 否则，departure`time`应该在之后arrival`time`.   |

### StopTimeEvent

| 字段名称    | 推荐                                                                                                                                                                                                                                                    |
| ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `delay` | 要是`delay`提供在一个`stop_time_update` `arrival`或者`departure`（并不是`time`)，那么GTFS[`stop_times.txt`](https://gtfs.org/reference/static#stopstxt)应该包含`arrival_times`和/或`departure_times`对于这些相应的站点。一个`delay`除非您有时钟，否则实时提要中的值毫无意义time将其添加到GTFS`stop_times.txt`文件。 |

### VehiclePosition

以下是应包含在 VehiclePostions 提要中的推荐字段，以便为消费者提供高质量数据（例如，用于生成预测）

| 字段名称                 | 笔记                                                                                                        |
| -------------------- | --------------------------------------------------------------------------------------------------------- |
| `entity.id`          | 应该在整个过程中保持稳定trip期间                                                                                        |
| `vehicle.timestamp`  | 提供timestamp在哪个vehiclePosition强烈建议进行测量。否则，消费者必须使用messagetimestamp，这可能会给骑手带来误导性的结果message比个人更频繁地更新Position. |
| `vehicle.vehicle.id` | 应该唯一且稳定地识别一个vehicle在整个trip期间                                                                              |

### Position

这vehiclePosition应在 200 米范围内GTFSshapes.txt当前的数据trip除非有一个Alert与Effect的DETOUR为了这trip_id .

### Alert

警报的一般准则：

* 什么时候trip_id和start_time在`exact_time=1`区间内，start_time应该比间隔的开始晚一个精确的倍数`headway_secs` 。
* 当取消几天内的旅行时，生产者应提供引用给定`trip_ids`和`start_dates`的 TripUpdates 作为CANCELED以及一个Alert和NO_SERVICE引用相同的`trip_ids`和TimeRange可以显示给乘客解释取消（例如，DETOUR）。
* 如果Alert影响一条线上的所有停靠点，使用基于线的Alert而不是基于停止的Alert.不要应用Alert到线路的每一站。
* 虽然服务提醒没有字符限制，但公交乘客通常会在移动设备上查看提醒。请简明扼要。

| 字段名称               | 推荐                    |
| ------------------ | --------------------- |
| `description_text` | 使用换行符使您的服务Alert更容易阅读。 |

## 按用例组织的实践建议

### 基于频率的旅行

基于频率的trip不遵循固定的时间表，而是试图保持预定的进度。这些行程在[GTFS](<https://\<glossary variable=>)中表示[.org/reference/static/#frequenciestxt">](<https://\<glossary variable=>)GTFS [frequency.txt](<https://\<glossary variable=>)通过设置`exact_times=0`或省略`exact_times`字段（注意`exact_times=1`行程*不是*基于频率的行程-frequencies.txt使用`exact_times=1`只是作为一种方便的方法，以更紧凑的方式存储基于时间表的行程）。构建时需要牢记几个最佳实践GTFS Realtime用于基于频率的旅行的提要。

* 在TripUpdate[.](#StopTimeUpdate)StopTimeUpdate， 这StopTimeEvent为了arrival和departure不应包含delay因为基于频率的旅行不遵循固定的时间表。反而，time应提供以表明arrival/departure预测。

* 根据规范的要求，在描述时trip在TripUpdate或者VehiclePosition通过使用TripDescriptor， 所有的trip_id ,start_time ， 和start_date必须提供。此外，schedule_relationship应该UNSCHEDULED .

（例如，重新执法旅行）。

## 关于本文档

### 目标

维护的目标GTFS Realtime最佳实践是：

* 提升end- 公共交通应用程序中的用户客户体验
* 让软件开发人员更轻松地部署和扩展应用程序、产品和服务

### 如何提出或修改已发表GTFS Realtime最佳实践

GTFS应用程序和实践不断发展，因此本文档可能需要从time至time.要对本文档提出修改建议，请[在](https://github.com/MobilityData/GTFS_Realtime_Best-Practices)GTFS Realtime[最佳实践 GitHub 存储库](https://github.com/MobilityData/GTFS_Realtime_Best-Practices)并倡导变革。

### 链接到此文档

请在此处链接，以便为饲料生产商提供正确形成的指导GTFS Realtime数据。每个单独的推荐都有一个锚链接。点击推荐获取url对于页内锚链接。

如果一个GTFS Realtime- 消费应用程序提出要求或建议GTFS Realtime对于此处未描述的数据实践，建议发布包含这些要求或建议的文档，以补充这些常见的最佳实践。
