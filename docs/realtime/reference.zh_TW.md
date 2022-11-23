---
search:
  exclude: true
---

# GTFS Realtime 参考

一个GTFS RealtimeFeed 让公交机构可以向消费者提供有关其服务中断（车站关闭、线路未运行、重要延误等）车辆位置和预期的实时信息arrival次。

提要规范的 2.0 版在此站点上进行了讨论和记录。有效版本为“2.0”、“1.0”。

### 术语定义

#### 必需的

在GTFS -realtime v2.0 及更高版本，*必填*列描述了生产者必须提供哪些字段才能使传输数据有效并对消费应用程序有意义。

在*必填*字段中使用以下值：

*   **必填**：此字段必须由GTFS - 实时饲料生产者。
*   **有条件要求**：此字段在某些条件下是必需的，在字段*Description*中进行了概述。在这些条件之外，该字段是可选的。
*   **可选**：该字段是可选的，生产者不需要实现。但是，如果数据在基础自动vehicle定位系统（例如，VehiclePositiontimestamp ) 建议生产者尽可能提供这些可选字段。

*请注意，语义要求未在*GTFS *-实时版本 1.0，因此提供*gtfs_realtime_version *of `1`可能不满足这些要求（详见[语义要求提案](https://github.com/google/transit/pull/64)）。*

#### 基数

*基数*表示可以为特定字段提供的元素数量，具有以下值：

* **One** - 可为该字段提供单个 one 元素。这映射到[Protocol Buffer *required*和*optional* cardinalities](https://developers.google.com/protocol-buffers/docs/proto#simple) 。
* **许多**- 可以为此字段提供许多元素（0、1 或更多）。这映射到[Protocol Buffer 的*重复*基数](https://developers.google.com/protocol-buffers/docs/proto#simple)。

始终参考*必填*字段和*说明*字段以查看字段何时为必填、有条件必填或可选。请参考[GTFS](<https://github.com/google/transit/blob/master/\<glossary variable=>) [-实时/原型/](<https://github.com/google/transit/blob/master/\<glossary variable=>)GTFS [-realtime.proto">](<https://github.com/google/transit/blob/master/\<glossary variable=>)GTFS [`GTFS -realtime.proto`](<https://github.com/google/transit/blob/master/\<glossary variable=>)用于协议缓冲区基数。

#### 协议缓冲区数据类型

以下协议缓冲区数据类型用于描述提要元素：

*   message: 复合型
*   enum: 固定值列表

#### 实验领域

标记为**实验性**的字段可能会发生变化，尚未正式纳入规范。未来可能会正式采用一个**实验**领域。

## 元素索引

*   [FeedMessage](#message-feedmessage )
    *   [FeedHeader](#message-feedheader)
        *   [Incrementality](#enum-incrementality)
    *   [FeedEntity](#message-feedentity)
        *   [TripUpdate](#message-tripupdate)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [VehicleDescriptor](#message-vehicledescriptor)
                *   [WheelchairAccessible](#enum-wheelchairaccessible)
            *   [StopTimeUpdate](#message-stoptimeupdate)
                *   [StopTimeEvent](#message-stoptimeevent)
                *   [ScheduleRelationship](#enum-schedulerelationship)
                *   [StopTimeProperties](#message-stoptimeproperties)
            *   [TripProperties](#message-tripproperties)
        *   [VehiclePosition](#message-vehicleposition)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [VehicleDescriptor](#message-vehicledescriptor)
                *   [WheelchairAccessible](#enum-wheelchairaccessible)
            *   [Position](#message-position)
            *   [VehicleStopStatus](#enum-vehiclestopstatus)
            *   [CongestionLevel](#enum-congestionlevel)
            *   [OccupancyStatus](#enum-occupancystatus)
            *   [CarriageDetails](#message-carriagedetails)
        *   [Alert](#message-alert)
            *   [TimeRange](#message-timerange)
            *   [EntitySelector](#message-entityselector)
                *   [TripDescriptor](#message-tripdescriptor)
                    *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [Cause](#enum-cause)
            *   [Effect](#enum-effect)
            *   [TranslatedString](#message-translatedstring)
                *   [Translation](#message-translation)
            *   [SeverityLevel](#enum-severitylevel)

## 元素

## message FeedMessage

提要的内容message .每个message 流中的内容是作为对适当 HTTP GET 请求的响应而获得的。实时馈送总是相对于现有的GTFS喂养。所有entityids 相对于GTFS喂养。

**字段**

| _**字段名称**_ | _**类型**_                          | _**必需的**_ | _**基数**_ | _**描述**_                                                                |
| ---------- | --------------------------------- | --------- | -------- | ----------------------------------------------------------------------- |
| **header** | [FeedHeader](#message-feedheader) | 必需的       | 一        | 关于此提要和提要的元数据message .                                                    |
| **entity** | [FeedEntity](#message-feedentity) | 有条件要求     | 许多       | 提要的内容。如果有真-time公交系统可用的信息，必须提供此字段。如果这个字段是EMPTY，消费者应该假设没有真正的-time系统可用的信息。 |


## message FeedHeader

有关提要的元数据，包含在提要消息中。

**字段**

| _**字段名称**_                | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                            |
| ------------------------- | -------------------------------------------------------------------------- | --------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **gtfs_realtime_version** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 供稿规范的版本。当前版本是2.0。                                                                                                                                                                                   |
| **Incrementality**        | [Incrementality](#enum-incrementality)                                     | 必需的       | 一        |                                                                                                                                                                                                     |
| **timestamp**             | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 这个timestamp标识创建此提要的内容的时刻（在服务器中time）。在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以来的秒数）。避免time强烈建议生成和使用实时信息的系统之间的偏差timestamp从一个time服务器。使用 Stratum 3 甚至更低的 Stratum 服务器是完全可以接受的，因为time最多几秒钟的差异是可以容忍的。 |

## enum Incrementality

确定当前提取是否是增量的。

*   FULL_DATASET：此提要更新将覆盖提要的所有先前实时信息。因此，本次更新预计将提供一个FULL所有已知实时信息的快照。
*   DIFFERENTIAL：目前，此模式**不受支持**，并且**未指定**使用此模式的提要的行为。有关于[GTFS](<http://groups.google.com/group/\<glossary variable=>)的讨论[-实时">](<http://groups.google.com/group/\<glossary variable=>)GTFS Realtime围绕完全指定行为的[邮件列表](<http://groups.google.com/group/\<glossary variable=>)DIFFERENTIAL模式和文档将在这些讨论完成后更新。

**价值观**

| _**价值**_         |
| ---------------- |
| **FULL_DATASET** |
| **DIFFERENTIAL** |

## message FeedEntity

定义（或更新）entity在运输提要中。如果entity没有被删除，正好是 'trip_update ', 'vehicle', 'Alert' 和 'Shape' 字段应该被填充。

**字段**

| _**字段名称**_      | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                   |
| --------------- | -------------------------------------------------------------------------- | --------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| **id**          | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 供稿唯一标识符entity. id 仅用于提供Incrementality支持。提要引用的实际实体必须由显式选择器指定（请参阅EntitySelector下面了解更多INFO）。                                                  |
| **is_deleted**  | [bool](https://developers.google.com/protocol-buffers/docs/proto#scalar)   | 可选的       | 一        | 这是否entity将被删除。应该只为带有Incrementality的DIFFERENTIAL- 不应为包含以下内容的提要提供此字段Incrementality的FULL_DATASET.                                             |
| **trip_update** | [TripUpdate](#message-tripupdate)                                          | 有条件要求     | 一        | 实时数据departure的延误trip.至少其中一个字段trip_update ,vehicle,Alert， 或者Shape必须提供 - 所有这些字段都不能EMPTY.                                                     |
| **vehicle**     | [VehiclePosition](#message-vehicleposition)                                | 有条件要求     | 一        | 实时数据Position一个vehicle.至少其中一个字段trip_update ,vehicle,Alert， 或者Shape必须提供 - 所有这些字段都不能EMPTY.                                                    |
| **Alert**       | [Alert](#message-alert)                                                    | 有条件要求     | 一        | 实时数据Alert.至少其中一个字段trip_update ,vehicle,Alert， 或者Shape必须提供 - 所有这些字段都不能EMPTY.                                                                |
| **Shape**       | [Shape](#message-shape)                                                    | 有条件要求     | 一        | 实时数据ADDED形状，例如对于DETOUR.至少其中一个字段trip_update ,vehicle,Alert， 或者Shape必须提供 - 所有这些字段都不能EMPTY.<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。 |


## message TripUpdate

实时更新进度vehicle沿着一个trip.另请参阅[行程](</realtime/\<glossary variable=>)的一般讨论[-更新">](</realtime/\<glossary variable=>)trip[更新实体](</realtime/\<glossary variable=>)。

取决于价值ScheduleRelationship， 一个TripUpdate可以指定：

*   一个trip按照时间表进行。
*   一个trip沿着一条路线前进，但没有固定的时间表。
*   一个trip那是ADDED或删除关于时间表。
*   一个新的trip这是现有的副本trip在静态GTFS .它将在服务日期运行，并且time中指定TripProperties .

更新可能是未来的，预测的arrival/departure事件，或已经发生的过去事件。在大多数情况下，关于过去事件的信息是一个测量值，因此它uncertainty建议值为 0。尽管可能存在不成立的情况，因此允许具有uncertainty过去事件的值不同于 0。如果有更新uncertainty不是 0，要么更新是一个近似预测trip尚未完成或测量不精确或更新是对过去的预测，在事件发生后尚未得到验证。

如果一个vehicle正在为同一个街区内的多个行程提供服务（有关行程和街区的更多信息，请参阅GTFStrips.txt ):

*   提要应包括TripUpdate为了trip目前由vehicle.鼓励生产者在当前行程之后包含一次或多次行程的 TripUpdatestrip在这vehicle的块，如果生产者对这些未来的预测质量有信心trip(s)。包括相同的多个 TripUpdatesvehicle避免对骑手的预测“弹出”作为vehicle从一个过渡trip到另一个人，并提前通知乘客影响下游行程的延误（例如，当已知delay超过计划的旅行之间的停留时间）。
*   各自的TripUpdate实体不需要是ADDED以与它们相同的顺序添加到提要中SCHEDULED在块中。例如，如果存在`trip_ids` 1、2 和 3 的行程都属于一个街区，则vehicle旅行trip1，那么trip2，然后trip3、trip_update实体可以按任何顺序出现 - 例如，添加trip2、那么trip1，然后trip3 是允许的。

请注意，更新可以描述一个trip已经完成了。到此end, 提供最后一站的更新就足够了trip.如果time的arrival在最后一站是过去，客户会得出结论，整个trip是过去的（尽管无关紧要，也可以为之前的停靠点提供更新）。此选项与trip已提前完成，但按照计划，trip目前仍在进行中time.删除此更新trip可以让客户假设trip仍在进行中。请注意，允许但不是必须的提要提供者清除过去的更新 - 这是实际有用的一种情况。

**字段**

| _**字段名称**_           | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                        |
| -------------------- | -------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**             | [TripDescriptor](#message-tripdescriptor)                                  | 必需的       | 一        | 这trip这message 适用于。最多可以有一个TripUpdateentity对于每个实际trip实例。如果没有，则意味着没有可用的预测信息。它确实_不是_意味着trip正在按计划进行。                                                                                                                                                                                                                                                  |
| **vehicle**          | [VehicleDescriptor](#message-vehicledescriptor)                            | 可选的       | 一        | 附加信息vehicle这是服务这个trip.                                                                                                                                                                                                                                                                                                                          |
| **stop_time_update** | [StopTimeUpdate](#message-stoptimeupdate)                                  | 有条件要求     | 许多       | 对 StopTimes 的更新trip（未来，即预测，在某些情况下，过去的，即已经发生的）。更新必须按stop_sequence，并申请以下所有站点trip直到下一个指定stop_time_update.最后一个stop_time_update必须为trip除非trip.schedule_relationship是CANCELED或者DUPLICATED- 如果trip是CANCELED，不需要提供 stop_time_updates。如果trip是DUPLICATED，可以提供 stop_time_updates 来指示实时time新的信息trip.                                                         |
| **timestamp**        | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 最近的时刻vehicle是真的——time测量进度以估计未来的停止时间。当提供过去的 StopTimes 时，arrival/departure次可能早于该值。在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以来的秒数）。                                                                                                                                                                                                            |
| **delay**            | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可选的       | 一        | 目前的进度偏差trip.delay仅应在相对于某些现有时间表给出预测时指定GTFS .<br/>delay（以秒为单位）可以是正数（意味着vehicle迟到）或否定（意味着vehicle提前了）。delay为 0 意味着vehicle正好在time.<br/>delayStopTimeUpdates 中的信息优先于trip-等级delay信息，这样trip-等级delay只传播到下一站trip与StopTimeUpdatedelay指定的值。<br/>强烈建议饲料供应商提供TripUpdate.timestamp值指示何时delay最后更新值，以评估数据的新鲜度。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。 |
| **trip_properties**  | [TripProperties](#message-tripproperties)                                  | 可选的       | 一        | 提供更新的属性trip.<br/><br/>**警告：**这个message 还是**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                                                                                                                                                             |

## message StopTimeEvent

单个预测事件的时间信息（arrival或者departure）。时序包括delay和/或估计time， 和uncertainty.

*   delay当预测是相对于一些现有的时间表给出时，应该使用GTFS .
*   time应该给出是否有预测的时间表。如果两者time和delay被指定，time将优先（虽然通常，time, 如果给定一个SCHEDULEDtrip, 应该等于SCHEDULEDtime在GTFS +delay）。

uncertainty同样适用于两者time和delay.这uncertainty粗略指定 true 中的预期误差delay（但请注意，我们尚未定义其精确的统计意义）。这是可能的uncertainty为 0，例如在计算机定时控制下行驶的火车。


**字段**

| _**字段名称**_      | _**类型**_                                                                  | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                      |
| --------------- | ------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **delay**       | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | delay（以秒为单位）可以是正数（意味着vehicle迟到）或否定（意味着vehicle提前了）。delay为 0 意味着vehicle正好在time.任何一个delay或者time必须在一个StopTimeEvent- 两个字段都不能EMPTY. |
| **time**        | [int64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 绝对事件time.在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以来的秒数）。任何一个delay或者time必须在一个StopTimeEvent- 两个字段都不能EMPTY.                 |
| **uncertainty** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 如果uncertainty被省略，它被解释为未知。要指定完全确定的预测，请将其设置为uncertainty为 0。                                                                     |

## message StopTimeUpdate

实时更新arrival和/或departure给定停止的事件trip.另请参阅停止的一般讨论time[消息](<#\<glossary variable=>)中的更新[-tripdescriptor">](<#\<glossary variable=>)TripDescriptor和[旅行](</realtime/\<glossary variable=>)[-更新">](</realtime/\<glossary variable=>)trip[更新实体](</realtime/\<glossary variable=>)文档。

可以为过去和未来的事件提供更新。尽管不是必需的，但允许生产者删除过去的事件。更新链接到特定的停止，或者通过stop_sequence或者stop_id ，因此必须设置这些字段之一。如果一样stop_id在一次访问中不止一次trip， 然后stop_sequence应在所有 StopTimeUpdates 中为此提供stop_id在那trip.


**字段**

| _**字段名称**_                     | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                                                                                   |
| ------------------------------ | -------------------------------------------------------------------------- | --------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **stop_sequence**              | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 必须与中相同stop_times.txt在相应的GTFS喂养。任何一个stop_sequence或者stop_id必须在一个StopTimeUpdate- 两个字段都不能EMPTY.stop_sequence访问相同的旅行需要stop_id不止一次（例如，一个循环）来消除预测是针对哪个停止的歧义。如果`StopTimeProperties.assigned_stop_id`被填充，那么`stop_sequence`必须填充。                                     |
| **stop_id**                    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 必须与中相同stops.txt在相应的GTFS喂养。任何一个stop_sequence或者stop_id必须在一个StopTimeUpdate- 两个字段都不能EMPTY.如果`StopTimeProperties.assigned_stop_id`已填充，最好省略`stop_id`并且只使用`stop_sequence`.如果`StopTimeProperties.assigned_stop_id`和`stop_id`人口稠密，`stop_id`必须匹配`assigned_stop_id` . |
| **arrival**                    | [StopTimeEvent](#message-stoptimeevent)                                    | 有条件要求     | 一        | 如果schedule_relationship是EMPTY或者SCHEDULED， 任何一个arrival或者departure必须在一个StopTimeUpdate- 两个字段都不能EMPTY.arrival和departure可能两者都是EMPTY什么时候schedule_relationship是SKIPPED.如果schedule_relationship是 NO_DATA，arrival和departure一定是EMPTY.                                |
| **departure**                  | [StopTimeEvent](#message-stoptimeevent)                                    | 有条件要求     | 一        | 如果schedule_relationship是EMPTY或者SCHEDULED， 任何一个arrival或者departure必须在一个StopTimeUpdate- 两个字段都不能EMPTY.arrival和departure可能两者都是EMPTY什么时候schedule_relationship是SKIPPED.如果schedule_relationship是 NO_DATA，arrival和departure一定是EMPTY.                                |
| **departure_occupancy_status** | [OccupancyStatus](#enum-occupancystatus)                                   | 可选的       | 一        | 预计客座率vehicle之后立马departure从给定的停止。如果提供，stop_sequence必须提供。提供departure_occupancy_status不提供任何真实的timearrival或者departure预测，填充此字段并设置StopTimeUpdate.schedule_relationship = NO_DATA。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                              |
| **schedule_relationship**      | [ScheduleRelationship](#enum-schedulerelationship)                         | 可选的       | 一        | 默认关系是SCHEDULED.                                                                                                                                                                                                                                            |
| **stop_time_properties**       | [StopTimeProperties](#message-stoptimeproperties)                          | 可选的       | 一        | 内定义的某些属性的实时更新GTFSstop_times.txt<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                                                          |


## enum ScheduleRelationship

此 StopTime 与静态计划之间的关系。

**价值观**

| _**价值**_        | _**评论**_                                                                                                                                                                                                                                                                                                                                             |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SCHEDULED**   | 这vehicle正在按照其静态的停靠时间表进行，尽管不一定按照时间表的时间。这是**默认**行为。至少其中之一arrival和departure必须提供。基于频率的旅行（GTFSfrequencies.txt与exact_times = 0) 不应该有SCHEDULED值并应该使用UNSCHEDULED反而。                                                                                                                                                                                          |
| **SKIPPED**     | 停靠点是SKIPPED，即vehicle不会停在这一站。arrival和departure是可选的。设置时`SKIPPED`不会传播到相同的后续站点trip（即，vehicle将在随后的站点停止trip除非这些站点也有`stop_time_update`和`schedule_relationship: SKIPPED`）。delay从上一站trip_做_传播到`SKIPPED`停止。换句话说，如果一个`stop_time_update`带着`arrival`或者`departure`预测未设置为停止后`SKIPPED`停止，上游的预测`SKIPPED`停止后将传播到停止`SKIPPED`停止和随后的停止trip直到一个`stop_time_update`为随后的停止提供。 |
| **没有数据**        | 没有给出此站点的数据。它表示没有可用的实时时间信息。当设置 NO_DATA 通过后续停靠点传播时，因此这是指定您没有实时时间信息的停靠点的推荐方式。当 NO_DATA 均未设置时arrival也不departure应提供。                                                                                                                                                                                                                                      |
| **UNSCHEDULED** | 这vehicle正在运行基于频率的trip(GTFSfrequencies.txt精确时间 = 0)。此值不应用于未定义的行程GTFSfrequencies.txt , 或旅行GTFSfrequencies.txt精确时间 = 1。行程包含`stop_time_updates`和`schedule_relationship: UNSCHEDULED`还必须设置TripDescriptor`schedule_relationship: UNSCHEDULED` <br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                           |


## message StopTimeProperties

中定义的某些属性的实时更新GTFSstop_times.txt .

**注意：**这个message 仍处于**试验阶段**，可能会发生变化。将来可能会正式采用。<br/>

**字段**

| _**字段名称**_           | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| -------------------- | -------------------------------------------------------------------------- | --------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **assigned_stop_id** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 支持实time停止分配。指一个`stop_id`中定义的GTFS`stops.txt` .<br/>新的`assigned_stop_id`不应导致显着不同trip的经验end用户比`stop_id`定义在GTFS`stop_times.txt` .换句话说，end用户不应查看此新内容`stop_id`如果新站点在没有任何附加上下文的应用程序中呈现，则视为“不寻常的变化”。例如，此字段旨在通过使用`stop_id`与最初定义的停靠点属于同一站GTFS`stop_times.txt` .<br/>在不提供任何真实信息的情况下分配止损timearrival或者departure预测，填充此字段并设置`StopTimeUpdate.schedule_relationship = NO_DATA` .<br/>如果填写此字段，`StopTimeUpdate.stop_sequence`必须填充和`StopTimeUpdate.stop_id`不应填充。停止分配应反映在其他GTFS - 实时字段（例如，`VehiclePosition.stop_id`）。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。 |

## message TripProperties

定义更新的属性trip

**注意：**这个message 仍处于**试验阶段**，可能会发生变化。将来可能会正式采用。<br/>.<br/>


**字段**

| _**字段名称**_     | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| -------------- | -------------------------------------------------------------------------- | --------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 定义一个新的标识符trip这是现有的副本trip在 (CSV) 中定义GTFStrips.txt但会start在不同的服务日期和/或time（定义使用`TripProperties.start_date`和`TripProperties.start_time`）。见定义`trips.trip_id`在 (CSV)GTFS .它的值必须不同于 (CSV) 中使用的值GTFS .此字段是必需的，如果`schedule_relationship`是`DUPLICATED` , 否则这个字段不能被填充并且会被消费者忽略。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                                                                                                                                                                                                                                                          |
| **start_date** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 服务日期DUPLICATEDtrip将运行。必须以 YYYYMMDD 格式提供。此字段是必需的，如果`schedule_relationship`是`DUPLICATED` , 否则这个字段不能被填充并且会被消费者忽略。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| **start_time** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 定义departurestarttime的trip什么时候DUPLICATED.见定义`stop_times.departure_time`在 (CSV)GTFS .SCHEDULEDarrival和departure次为DUPLICATEDtrip是根据原始之间的偏移量计算的trip`departure_time`和这个领域。例如，如果一个GTFStrip有一个停止 A`departure_time`的`10:00:00`并停止 B`departure_time`的`10:01:00` ，并且该字段的值填充为`10:30:00`, 停止 BDUPLICATEDtrip会有一个SCHEDULED`departure_time`的`10:31:00`.真实的-time预言`delay`值应用于此计算的计划time确定预测的time.例如，如果一个departure`delay`的`30`为停止 B 提供，则预测departuretime是`10:31:30`.真实的-time预言`time`值没有应用任何偏移量并指示预测的time如提供。例如，如果一个departure`time`为停止 B 提供代表 10:31:30 的时间，则预测departuretime是`10:31:30`. 此字段是必需的，如果`schedule_relationship`是`DUPLICATED` , 否则这个字段不能被填充并且会被消费者忽略。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。 |
| **shape_id**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 指定Shape的vehicle为此的旅行路线trip当它与原来的不同时。指一个Shape在 (CSV) 中定义GTFS或新的Shapeentity在一个真实的-time喂养。见定义`trips.shape_id`在 (CSV)GTFS .<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |


## message VehiclePosition

给定的实时定位信息vehicle.

**字段**

| _**字段名称**_                 | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                                                                                                                      |
| -------------------------- | -------------------------------------------------------------------------- | --------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**                   | [TripDescriptor](#message-tripdescriptor)                                  | 可选的       | 一        | 这trip这vehicle正在服务。可EMPTY或部分，如果vehicle无法识别给定的trip实例。                                                                                                                                                                                                                                           |
| **vehicle**                | [VehicleDescriptor](#message-vehicledescriptor)                            | 可选的       | 一        | 附加信息vehicle这是服务这个trip.每个条目应该有一个**独特的**vehicleid .                                                                                                                                                                                                                                             |
| **Position**               | [Position](#message-position)                                              | 可选的       | 一        | 当前的Position这个的vehicle.                                                                                                                                                                                                                                                                        |
| **current_stop_sequence**  | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 当前停靠点的停靠顺序索引。的意思current_stop_sequence （即它所指的止损点）由下式确定current_status.如果current_status不见了IN_TRANSIT_TO假设。                                                                                                                                                                                       |
| **stop_id**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 标识当前停靠点。该值必须与stops.txt在相应的GTFS喂养。如果`StopTimeProperties.assigned_stop_id`用于分配一个`stop_id`，这个字段也应该反映`stop_id` .                                                                                                                                                                                  |
| **current_status**         | [VehicleStopStatus](#enum-vehiclestopstatus)                               | 可选的       | 一        | 的确切状态vehicle相对于当前停止。忽略如果current_stop_sequence不见了。                                                                                                                                                                                                                                             |
| **timestamp**              | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 时刻vehicle的Position被测量了。在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以来的秒数）。                                                                                                                                                                                                                   |
| **congestion_level**       | [CongestionLevel](#enum-congestionlevel)                                   | 可选的       | 一        |                                                                                                                                                                                                                                                                                               |
| **occupancy_status**       | [OccupancyStatus](#enum-occupancystatus)                                   | _可选的_     | 一        | 客运量状况vehicle或马车。如果multi_carriage_details填充了每个车厢OccupancyStatus, 那么这个字段应该描述整个vehicle考虑所有接受乘客的车厢。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                             |
| **occupancy_percentage**   | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 一个百分比值，表示乘客的占用程度vehicle.值 100 应代表总最大占用率vehicle设计用于，包括座位和站立容量，以及当前的操作法规允许。如果乘客数量超过最大设计容量，该值可能会超过 100。精度occupancy_percentage应该足够低，以至于无法跟踪个别乘客的上下车vehicle.如果multi_carriage_details填充了每个车厢occupancy_percentage, 那么这个字段应该描述整个vehicle考虑所有接受乘客的车厢。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。 |
| **multi_carriage_details** | [CarriageDetails](#message-CarriageDetails)                                | 可选的       | 许多       | 这个给定的多个车厢的详细信息vehicle.第一次出现代表第一个车厢vehicle,**给定当前的行进方向**.的出现次数multi_carriage_details字段表示的车厢数量vehicle.它还包括不可登机的车厢，如发动机，MAINTENANCE车厢等……因为它们为乘客提供了有关站在平台上何处的宝贵信息。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                              |


## enum VehicleStopStatus

**价值观**

| _**价值**_          | _**评论**_                                |
| ----------------- | --------------------------------------- |
| **INCOMING_AT**   | 这vehicle即将到达停靠点（在停靠点显示上，vehicle符号通常闪烁）。 |
| **STOPPED_AT**    | 这vehicle站在车站。                           |
| **IN_TRANSIT_TO** | 这vehicle已离开上一站并处于运输途中。                  |

## enum CongestionLevel

CONGESTION影响这一点的水平vehicle.

**价值观**

| _**价值**_                     |
| ---------------------------- |
| **UNKNOWN_CONGESTION_LEVEL** |
| **RUNNING_SMOOTHLY**         |
| **STOP_AND_GO**              |
| **CONGESTION**               |
| **SEVERE_CONGESTION**        |

## enum OccupancyStatus

客运量状况vehicle或马车。

个别制作人不得全部发布OccupancyStatus价值观。因此，消费者不能假设OccupancyStatus值遵循线性比例。消费者应代表OccupancyStatus值作为生产商指示和预期的状态。同样，生产者必须使用OccupancyStatus对应于实际的值vehicle占用状态。

有关以线性比例描述乘客占用率的信息，请参阅occupancy_percentage .


**注意：**此字段仍处于**试验阶段**，可能会发生变化。将来可能会正式采用。

_**价值观**_

| _**价值**_                         | _**评论**_                                                   |
| -------------------------------- | ---------------------------------------------------------- |
| _**EMPTY**_                      | _这vehicle被认为EMPTY大多数情况下，机上乘客很少或没有乘客，但仍在接受乘客。_              |
| _**MANY_SEATS_AVAILABLE**_       | _这vehicle或车厢有大量可用座位。在可用的总座位中被认为足够大以属于该类别的空闲座位的数量由生产者自行决定。_ |
| _**FEW_SEATS_AVAILABLE**_        | _这vehicle或车厢有少量可用座位。可被视为小到足以落入这一类别的总座位中的空闲座位数量由生产者自行决定。_   |
| _**STANDING_ROOM_ONLY**_         | _这vehicle或车厢目前只能容纳站立的乘客。_                                  |
| _**CRUSHED_STANDING_ROOM_ONLY**_ | _这vehicle或车厢目前只能容纳站立的乘客，并且空间有限。_                           |
| _**FULL**_                       | _这vehicle被认为FULL通过大多数措施，但可能仍允许乘客登机。_                       |
| _**NOT_ACCEPTING_PASSENGERS**_   | _这vehicle或运输不接受乘客。这vehicle或车厢通常接受乘客登机。_                    |
| _**NO_DATA_AVAILABLE**_          | _这vehicle或运输没有任何可用的占用数据time._                              |
| _**NOT_BOARDABLE**_              | _这vehicle或运输不可登机，从不接受乘客。适用于特殊车辆或车厢（发动机、MAINTENANCE马车等……）。_ |


## message CarriageDetails

车厢特定细节，用于由多个车厢组成的车辆。

**注意：**这个message 仍处于**试验阶段**，可能会发生变化。将来可能会正式采用。

**字段**

| _**字段名称**_               | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                                                                                                                                    |
| ------------------------ | -------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**                   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 车厢的识别。每个应该是唯一的vehicle.<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                                                                                                                    |
| **label**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 用户可见label可能会显示给乘客以帮助识别车厢。示例：“7712”、“汽车 ABC-32”等...<br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                                                                                             |
| **occupancy_status**     | [OccupancyStatus](#enum-occupancystatus)                                   | 可选的       | 一        | 此给定车厢的占用状态，在此vehicle.默认设置为`NO_DATA_AVAILABLE` .<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                                                                                           |
| **occupancy_percentage** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可选的       | 一        | 这个给定车厢的占用百分比，在这个vehicle.遵循与“VehiclePosition.occupancy_percentage”相同的规则。如果该给定托架的数据不可用，请使用 -1。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                                                                                                              |
| **carriage_sequence**    | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 识别该车厢相对于其他车厢的顺序vehicle的 CarriageStatus 列表。行进方向上的第一个托架的值必须为 1。第二个值对应于行进方向上的第二个托架，值必须为 2，依此类推。例如，行驶方向的第一节车厢的值为 1。如果行驶方向的第二节车厢的值为 3，则消费者将丢弃所有车厢的数据（即multi_carriage_details场地）。没有数据的托架必须用有效的表示carriage_sequencenum ber 和没有数据的字段应该被省略（或者，这些字段也可以被包括并设置为“无数据”值）。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。 |

## message Alert

一个Alert，表明公共交通网络中发生了某种事件。

**字段**

| _**字段名称**_                 | _**类型**_                                      | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                      |
| -------------------------- | --------------------------------------------- | --------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **active_period**          | [TimeRange](#message-timerange)               | 可选的       | 许多       | time当。。。的时候Alert应该显示给用户。如果丢失，则Alert只要它出现在提要中就会显示。如果给出多个范围，则Alert将在所有这些期间显示。                                                                                                                   |
| **informed_entity**        | [EntitySelector](#message-entityselector)     | 必需的       | 许多       | 我们应该通知其用户的实体Alert.最后一个informed_entity必须提供。                                                                                                                                                    |
| **Cause**                  | [Cause](#enum-cause)                          | 有条件地需要    | 一        | 如果cause_detail包含在内，那么Cause也必须包括在内。                                                                                                                                                            |
| **cause_detail**           | [TranslatedString](#message-translatedstring) | 可选的       | 一        | 的说明Cause的Alert允许特定机构language;比Cause.如果cause_detail包含在内，那么Cause也必须包括在内。 <br/><br/>**警告：**这个领域还在**实验性的** , 并可能发生变化。它可能在未来被正式采用。                                                                 |
| **Effect**                 | [Effect](#enum-effect)                        | 有条件地需要    | 一        | 如果effect_detail包含在内，那么Effect也必须包括在内。                                                                                                                                                          |
| **effect_detail**          | [TranslatedString](#message-translatedstring) | 可选的       | 一        | 的说明Effect的Alert允许特定机构language;比Effect.如果effect_detail包含在内，那么Effect也必须包括在内。<br/><br/>**警告：**这个领域还在**实验性的** , 并可能发生变化。它可能在未来被正式采用。                                                              |
| **url**                    | [TranslatedString](#message-translatedstring) | 可选的       | 一        | 这url它提供了有关的附加信息Alert.                                                                                                                                                                         |
| **header_text**            | [TranslatedString](#message-translatedstring) | 必需的       | 一        | header为了Alert.这个平原-textstring将突出显示，例如以粗体显示。                                                                                                                                                   |
| **description_text**       | [TranslatedString](#message-translatedstring) | 必需的       | 一        | 的说明Alert.这个平原-textstring将被格式化为Alert（或显示在用户明确的“扩展”请求上）。描述中的信息应添加到header.                                                                                                                       |
| **tts_header_text**        | [TranslatedString](#message-translatedstring) | 可选的       | 一        | text包含Alert的header用于text到语音的实现。这个字段是text的语音版本header_text.它应该包含与以下相同的信息header_text但格式化后可以读作text-语音转换（例如，删除缩写、拼写数字等）                                                                            |
| **tts_description_text**   | [TranslatedString](#message-translatedstring) | 可选的       | 一        | text包含对Alert用于text到语音的实现。这个字段是text的语音版本description_text.它应该包含与以下相同的信息description_text但格式化后可以读作text-语音转换（例如，删除缩写、拼写数字等）                                                                        |
| **severity_level**         | [SeverityLevel](#enum-severitylevel)          | 可选的       | 一        | 的严重性Alert.                                                                                                                                                                                    |
| **image**                  | [TranslatedImage](#message-translatedimage)   | 可选的       | 一        | TranslatedImage沿显示Alerttext.用于直观地解释AlertEffect的DETOUR、车站关闭等。image应该加强对Alert并且不能是基本信息的唯一位置。不鼓励使用以下类型的图像：image主要包含text、营销或品牌图像，不添加任何附加信息。<br/><br/>**警告：**这个领域还在**实验性的** , 并可能发生变化。它可能在未来被正式采用。 |
| **image_alternative_text** | [TranslatedString](#message-translatedstring) | 可选的       | 一        | text描述链接的外观image在里面`image`字段（例如，如果image无法显示或用户看不到image出于可访问性原因）。查看 HTML[替代规格imagetext](https://html.spec.whatwg.org/#alt) .<br/><br/>**警告：**这个领域还在**实验性的** , 并可能发生变化。它可能在未来被正式采用。             |
              |


## enum Cause

Cause这个的Alert.

**价值观**

| _**价值**_              |
| --------------------- |
| **UNKNOWN_CAUSE**     |
| **OTHER_CAUSE**       |
| **TECHNICAL_PROBLEM** |
| **STRIKE**            |
| **DEMONSTRATION**     |
| **ACCIDENT**          |
| **HOLIDAY**           |
| **WEATHER**           |
| **MAINTENANCE**       |
| **CONSTRUCTION**      |
| **POLICE_ACTIVITY**   |
| **MEDICAL_EMERGENCY** |

## enum Effect

这Effect这个问题对受影响的entity.

**价值观**

| _**价值**_                |
| ----------------------- |
| **NO_SERVICE**          |
| **REDUCED_SERVICE**     |
| **SIGNIFICANT_DELAYS**  |
| **DETOUR**              |
| **ADDITIONAL_SERVICE**  |
| **MODIFIED_SERVICE**    |
| **OTHER_EFFECT**        |
| **UNKNOWN_EFFECT**      |
| **STOP_MOVED**          |
| **NO_EFFECT**           |
| **ACCESSIBILITY_ISSUE** |

## enum SeverityLevel

的严重性Alert.

**注意：**此字段仍处于**试验阶段**，可能会发生变化。将来可能会正式采用。

**价值观**

| _**价值**_             |
| -------------------- |
| **UNKNOWN_SEVERITY** |
| **INFO**             |
| **WARNING**          |
| **SEVERE**           |

## message TimeRange

一个time间隔。间隔被认为是活跃的time`t`如果`t`大于或等于starttime并且小于endtime.

**字段**

| _**字段名称**_ | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                        |
| ---------- | -------------------------------------------------------------------------- | --------- | -------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **start**  | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | starttime, 在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以来的秒数）。如果缺失，则间隔从负无穷大开始。如果一个TimeRange提供，要么start或者end必须提供 - 两个字段都不能EMPTY. |
| **end**    | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | endtime, 在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以来的秒数）。如果缺失，则间隔以正无穷大结束。如果一个TimeRange提供，要么start或者end必须提供 - 两个字段都不能EMPTY.   |

## message Position

一个地理Position一个vehicle.

**字段**

| _**字段名称**_    | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                             |
| ------------- | -------------------------------------------------------------------------- | --------- | -------- | ---------------------------------------------------------------------------------------------------- |
| **latitude**  | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 必需的       | 一        | 北度数，在 WGS-84 坐标系中。                                                                                   |
| **longitude** | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 必需的       | 一        | 东度，在 WGS-84 坐标系中。                                                                                    |
| **bearing**   | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可选的       | 一        | bearing，以度为单位，从真北顺时针方向，即，0 是北，90 是东。这可以是指南针bearing，或朝向下一站或中间位置的方向。这不应该从先前位置的序列中推断出来，客户可以从先前的数据中计算出来。 |
| **odometer**  | [double](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | odometer值，以米为单位。                                                                                     |
| **speed**     | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可选的       | 一        | 瞬间speed由测量vehicle，以米/秒为单位。                                                                           |


## message TripDescriptor

标识单个实例的描述符GTFStrip.

指定单个trip例如，在许多情况下trip_id本身就足够了。但是，以下情况需要额外的信息才能解决单个trip实例：

* 对于定义的行程frequencies.txt ,start_date和start_time除了需要trip_id
* 如果trip持续超过 24 小时，或被延迟以致与SCHEDULEDtrip第二天，然后start_date除了需要trip_id
* 如果trip_id无法提供字段，则route_id ,direction_id ,start_date ， 和start_time必须全部提供

在所有情况下，如果route_id除了提供trip_id ，那么route_id必须相同route_id分配给给定的trip在GTFStrips.txt .

这trip_id字段不能单独或与其他字段组合TripDescriptor字段，用于识别多个trip实例。例如，一个TripDescriptor永远不应该指定trip_id本身为GTFSfrequencies.txt exact_times=0 次因为start_time也需要解决一个单一的trip实例开始于特定time的一天。如果TripDescriptor不解决单个trip实例（即，它解析为零或多个trip实例），它被认为是一个错误和entity包含错误的TripDescriptor可能会被消费者丢弃。

请注意，如果trip_id未知，则站序列 id 在TripUpdate还不够，还必须提供 stop_ids。此外，绝对arrival/departure必须提供时间。

TripDescriptor.route_id不能在一个内使用AlertEntitySelector指定路由范围Alert影响路线的所有行程 - 使用EntitySelector.route_id反而。


**字段**

| _**字段名称**_                | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------------- | -------------------------------------------------------------------------- | --------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip_id**               | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 这trip_id来自GTFS此选择器引用的提要。对于非基于频率的旅行（未在GTFSfrequencies.txt )，该字段足以唯一标识trip.对于定义的基于频率的行程GTFSfrequencies.txt ,trip_id ,start_time， 和start_date都是必需的。为了SCHEDULED-基于旅行（旅行未定义在GTFSfrequencies.txt ),trip_id仅当trip可以通过以下组合唯一标识route_id ,direction_id,start_time， 和start_date，并且提供了所有这些字段。什么时候schedule_relationship是DUPLICATED在一个TripUpdate， 这trip_id标识trip从静态GTFS成为DUPLICATED.什么时候schedule_relationship是DUPLICATED在一个VehiclePosition， 这trip_id标识新的副本trip并且必须包含对应的值TripUpdate.TripProperties .trip_id .                                                       |
| **route_id**              | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 这route_id来自GTFS这个选择器所指的。如果trip_id被省略，route_id ,direction_id,start_time, 和 schedule_relationship=SCHEDULED必须全部设置为识别一个trip实例。TripDescriptor.route_id不应该在一个内使用AlertEntitySelector指定路由范围Alert影响路线的所有行程 - 使用EntitySelector.route_id反而。                                                                                                                                                                                                                                                                                                                    |
| **direction_id**          | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 这direction_id来自GTFS喂养trips.txt文件，指示此选择器所指的行程的行进方向。如果trip_id被省略，direction_id必须提供。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。<br/>                                                                                                                                                                                                                                                                                                                                                                                                              |
| **start_time**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 最初的SCHEDULEDstarttime这个的trip实例。当。。。的时候trip_id对应于非基于频率的trip，此字段应省略或等于GTFS喂养。当。。。的时候trip_id对应于基于频率的trip定义在GTFSfrequencies.txt ,start_time是必需的，必须指定为trip更新和vehicle职位。如果trip对应于exact_times=1GTFS记录，然后start_time必须是 headway_secs 的某个倍数（包括零）frequencies.txtstart_time对于相应的time时期。如果trip对应于exact_times=0，那么它的start_time可能是任意的，最初预计是第一个departure的trip.一经成立，start_time这个基于频率的exact_times=0trip应该被认为是不可变的，即使第一个departuretime变化——那time相反，变化可能会反映在StopTimeUpdate.如果trip_id被省略，start_time必须提供。该字段的格式和语义与GTFS /frequencies.txt /start_time，例如 11:15:35 或 25:15:35。 |
| **start_date**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 这start这个日期tripYYYYMMDD 格式的实例。为了SCHEDULED行程（行程未在GTFSfrequencies.txt )，必须提供此字段以消除迟到以至于与SCHEDULEDtrip第二天。例如，对于每天 8:00 和 20:00 出发且晚点 12 小时的火车，同一班次会有两个不同的行程time.可以提供此字段，但对于不可能发生此类冲突的计划（例如，按小时计划运行的服务，其中一个vehicle迟到一小时不再被认为与日程安排有关。此字段对于定义的基于频率的行程是必需的GTFSfrequencies.txt .如果trip_id被省略，start_date必须提供。                                                                                                                                                                                                                                                  |
| **schedule_relationship** | [ScheduleRelationship](#enum-schedulerelationship-1)                       | 可选的       | 一        | 这之间的关系trip和静态时间表。如果TripDescriptor提供在一个Alert`EntitySelector`， 这`schedule_relationship`消费者在识别匹配时忽略该字段trip实例。                                                                                                                                                                                                                                                                                                                                                                                                                                           |


## enum ScheduleRelationship

这之间的关系trip和静态时间表。如果一个trip是按照临时时间表完成的，没有反映在GTFS ，那么它不应该被标记为SCHEDULED, 但标记为ADDED.

**价值观**

| _**价值**_        | _**评论**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **SCHEDULED**   | trip即按照其运行GTFS Schedule，或者足够接近SCHEDULEDtrip与它相关联。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **ADDED**       | 一个额外的trip那是ADDED除了运行计划之外，例如，替换损坏的vehicle或应对突然的载客量。_注意：目前，未指定使用此模式的提要的行为。有关于的讨论GTFS GitHub[ (1)](https://github.com/google/transit/issues/106) [ (2)](https://github.com/google/transit/pull/221) [ (3)](https://github.com/google/transit/pull/219)围绕完全指定或弃用ADDED旅行和文件将在这些讨论完成后更新。_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **UNSCHEDULED** | 一个trip正在运行且没有与之关联的时间表 - 此值用于识别定义的行程GTFSfrequencies.txt精确时间 = 0。它不应用于描述未定义的行程GTFSfrequencies.txt , 或旅行GTFSfrequencies.txt精确时间 = 1。`schedule_relationship: UNSCHEDULED`还必须设置所有 StopTimeUpdates`schedule_relationship: UNSCHEDULED`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **CANCELED**    | 一个trip存在于计划中但已被删除。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **DUPLICATED**  | 一个新的trip这与现有的相同SCHEDULEDtrip除了服务start日期和time.与`TripUpdate.TripProperties.trip_id` ,`TripUpdate.TripProperties.start_date`， 和`TripUpdate.TripProperties.start_time`复制现有的trip从静态GTFS但start在不同的服务日期和/或time.复制一个trip如果与原始服务相关，则允许trip在 (CSV)GTFS （在`calendar.txt`或者`calendar_dates.txt`) 在接下来的 30 天内运营。这trip成为DUPLICATED通过识别`TripUpdate.TripDescriptor.trip_id` .<br/><br/>此枚举不修改现有的trip被引用`TripUpdate.TripDescriptor.trip_id`- 如果制片人想取消原作trip, 它必须单独发布`TripUpdate`与价值CANCELED.行程定义在GTFS`frequencies.txt`和`exact_times`那是EMPTY或等于`0`不可能是DUPLICATED.这`VehiclePosition.TripDescriptor.trip_id`对于新的trip必须包含来自的匹配值`TripUpdate.TripProperties.trip_id`和`VehiclePosition.TripDescriptor.ScheduleRelationship`还必须设置为`DUPLICATED`.<br/><br/>_现有的生产者和消费者正在使用ADDED枚举来表示DUPLICATED旅行必须遵循[迁移指南](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/examples/migration-duplicated.md)过渡到DUPLICATED枚举。_ |


## message VehicleDescriptor

身份识别信息vehicle执行trip.

**字段**

| _**字段名称**_        | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                |
| ----------------- | -------------------------------------------------------------------------- | --------- | -------- | --------------------------------------------------------------------------------------- |
| **id**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 内部系统识别vehicle.应该**独特的**每vehicle, 并用于跟踪vehicle当它通过系统进行时。这个id不应该对end-用户;为此目的使用**label**场地 |
| **label**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 用户可见label，即必须向乘客展示以帮助识别正确的东西vehicle.                                                    |
| **license_plate** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | 车牌号vehicle.                                                                             |
| **无障碍通道**         | [无障碍通道](#enum-wheelchairaccessible)                                        | 可选的       | 一        | 如果提供，可以覆盖_无障碍通道_静态值GTFS .                                                               |

## enum WheelchairAccessible

如果一个特定的trip可供轮椅进出。如果可用，该值应覆盖wheelchair_accessible静态值GTFS .

**价值观**

| _**价值**_                    | _**评论**_                                                                    |
| --------------------------- | --------------------------------------------------------------------------- |
| **NO_VALUE**                | 这trip没有关于轮椅无障碍设施的信息。这是**默认**行为。如果静电GTFS包含一个_wheelchair_accessible_值，它不会被覆盖。 |
| **UNKNOWN**                 | 这trip没有可访问性值。该值将覆盖来自GTFS .                                                  |
| **wheelchair_accessible**   | 这trip可供轮椅进出。该值将覆盖来自GTFS .                                                   |
| **WHEELCHAIR_INACCESSIBLE** | 这trip是**不是**无障碍通道。该值将覆盖来自GTFS .                                             |



## message EntitySelector

一个选择器entity在一个GTFS喂养。字段的值应对应于相应的字段GTFS喂养。必须至少给出一个说明符。如果给出了几个，则应将它们解释为由逻辑`AND`运算符连接。此外，说明符的组合必须与GTFS喂养。换句话说，为了一个Alert适用于entity在GTFS它必须匹配所有提供的EntitySelector字段。例如，一个EntitySelector包括字段route_id `route_id : "5"`和route_type `route_type : "3"`仅适用于route_id `route_id : "5"` bus - 它不适用于任何其他路线route_type `route_type : "3"` 。如果生产者想要一个Alert申请route_id `route_id : "5"`以及route_type `route_type : "3"` ，它应该提供两个独立的EntitySelector，一个引用route_id `route_id : "5"`和另一个引用route_type `route_type : "3"` 。

必须给出至少一个说明符 - 一个字段中的所有字段EntitySelector不可能是EMPTY.

**字段**

| _**字段名称**_       | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                     |
| ---------------- | -------------------------------------------------------------------------- | --------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **agency_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 这agency_id来自GTFS此选择器引用的提要。                                                                                                                                   |
| **route_id**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 这route_id来自GTFS这个选择器所指的。如果direction_id提供，route_id也必须提供。                                                                                                      |
| **route_type**   | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 有条件要求     | 一        | 这route_type来自GTFS这个选择器所指的。                                                                                                                                   |
| **direction_id** | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 这direction_id来自GTFS喂养trips.txt文件，用于选择路线的一个方向上的所有行程，由指定route_id .如果direction_id提供，route_id也必须提供。<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。<br/>       |
| **trip**         | [TripDescriptor](#message-tripdescriptor)                                  | 有条件要求     | 一        | 这trip实例来自GTFS这个选择器所指的。这个TripDescriptor必须解决单个trip中的实例GTFS数据（例如，生产者不能只提供trip_id对于exact_times=0 行程）。如果ScheduleRelationship字段填充在此TripDescriptor消费者在尝试识别GTFStrip. |
| **stop_id**      | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        | 这stop_id来自GTFS此选择器引用的提要。                                                                                                                                     |

## message TranslatedString

国际化的message 包含每language片段的版本text或一个url.来自 a 的字符串之一message 将被捡起。解决方法如下： 如果 UIlanguage匹配languagea的代码Translation, 第一个匹配Translation被选中。如果默认 UIlanguage（例如，英语）匹配languagea的代码Translation, 第一个匹配Translation被选中。如果有些Translation有一个未指定的language代码，那个Translation被选中。


**字段**

| _**字段名称**_      | _**类型**_                            | _**必需的**_ | _**基数**_ | _**描述**_             |
| --------------- | ----------------------------------- | --------- | -------- | -------------------- |
| **Translation** | [Translation](#message-translation) | 必需的       | 许多       | 最后一个Translation必须提供。 |

## message Translation

本地化的string映射到一个language.

| _**字段名称**_   | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                      |
| ------------ | -------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **text**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 一个 UTF-8string包含message .                                                                                                      |
| **language** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        |  BCP-47language代码。可以省略，如果language是未知的，或者是否根本没有对提要进行国际化。最多一个Translation允许有一个未指定的languagetag - 如果有多个Translation， 这language必须提供。 |

## message TranslatedImage

国际化的message 包含每language的版本image.其中一张图片来自message 将被捡起。解决方法如下： 如果 UIlanguage匹配languagea的代码Translation, 第一个匹配Translation被选中。如果默认 UIlanguage（例如，英语）匹配languagea的代码Translation, 第一个匹配Translation被选中。如果有些Translation有一个未指定的language代码，那个Translation被选中。

**注意：**这个message 仍处于**试验阶段**，可能会发生变化。将来可能会正式采用。

**字段**

| _**字段名称**_          | _**类型**_                                  | _**必需的**_ | _**基数**_ | _**描述**_          |
| ------------------- | ----------------------------------------- | --------- | -------- | ----------------- |
| **localized_image** | [LocalizedImage](#message-localizedimage) | 必需的       | 许多       | 至少一个本地化image必须提供。 |


## message LocalizedImage

本地化的imageurl映射到一个language.

| _**字段名称**_     | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                                                                                                                                                    |
| -------------- | -------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **url**        | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | string包含一个url链接到image.这image链接必须小于 2MB。如果image以足够显着的方式发生变化，需要在消费者端进行更新，生产者必须更新url到一个新的。<br/><br/>这url应该是完全合格的url包括 http:// 或 https:// 以及url必须正确转义。请参阅以下内容[http://www.w3.org/Addressing/url/4_URI_Recommentations.html 为](http://www.w3.org/Addressing/URL/4_URI_Recommentations.html for)描述如何创建完全合格的url价值观。 |
| **media_type** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | IANA media type as 指定的类型image要显示。类型必须start与“图像/”                                                                                                                                                                                                                                                            |
| **language**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求     | 一        |  BCP-47language代码。可以省略，如果language是未知的，或者是否根本没有对提要进行国际化。最多一个Translation允许有一个未指定的languagetag - 如果有多个Translation， 这language必须提供。                                                                                                                                                                               |

## message Shape

描述一个物理路径vehicle需要时Shape不属于 (CSV)GTFS ，例如对于临时DETOUR.形状属于 Trips，由编码的折线组成，以实现更有效的传输。 Shapes 不需要精确地截取 Stops 的位置，但所有 Stops 都在一个trip应该在一个小的距离内Shape为了那个原因trip，即接近连接的直线段Shape积分

**注意：**这个message 仍处于**试验阶段**，可能会发生变化。将来可能会正式采用。<br/>.<br/>


**字段**

| _**字段名称**_           | _**类型**_                                                                   | _**必需的**_ | _**基数**_ | _**描述**_                                                                                                                                                                   |
| -------------------- | -------------------------------------------------------------------------- | --------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **shape_id**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 标识符Shape.必须不同于任何`shape_id`在 (CSV) 中定义GTFS .<br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。                                                                              |
| **encoded_polyline** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 的编码折线表示Shape.此折线必须至少包含两个点。有关编码折线的更多信息，请参阅<https://developers.google.com/maps/documentation/utilities/polylinealgorithm> <br/><br/>**警告：**这个领域仍然**实验**，并且可能会发生变化。将来可能会正式采用。 |
