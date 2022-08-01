---
search:
  exclude: true
---

# GTFS Realtime实时参考

GTFS Realtime实时馈送让交通机构向消费者提供关于服务中断的实时信息（车站关闭、线路不运行、重要延误等）车辆的位置，以及预期arrival时间。

本网站讨论并记录了2.0版本的饲料规范。有效的版本是 "2.0"、"1.0"。

### 术语定义

#### 需要

在GTFS v2.0及以上版本中，"_需要_"列描述了生产者必须提供哪些字段，以便过境数据有效并对消费应用程序有意义。

以下是在 "_需要_"栏中使用的值。

*   **需要**。此字段必须由GTFS馈送生产商提供。
*   **有条件地要求**。该字段在某些条件下是必需的，这些条件在字段_描述_中列出。在这些条件之外，该字段是可选的。
*   **可选的**。这个字段是可选的，不要求生产者实施。然而，如果数据在基础的自动vehicle定位系统中可用（例如，VehiclePosition `timestamp`），建议生产者在可能的情况下提供这些可选字段。

_请注意，语义要求没有在GTFS 1.0版本中定义，因此`gtfs_realtime_version`为`1`的馈送可能不符合这些要求（详见[语义要求的建议](https://github.com/google/transit/pull/64)）。_

#### 心数

_Cardinality_表示可以为某一特定字段提供的元素数量，其数值如下。

*   **一**- 可以为这个字段提供一个单一的一元素。这与[协议缓冲区_的必要_和_可选的_](https://developers.google.com/protocol-buffers/docs/proto#simple)卡位相对应。
*   **许多**- 可以为这个字段提供许多元素（0，1，或更多）。这映射到[协议缓冲区](https://developers.google.com/protocol-buffers/docs/proto#simple)的[ _重复_](https://developers.google.com/protocol-buffers/docs/proto#simple)卡位。

始终参考 "_需要_"和 "_描述_"字段，以了解一个字段何时是需要的、有条件的、或可选的。请参考[GTFS-realtime/proto/GTFS-realtime.proto">`GTFS`](<https://github.com/google/transit/blob/master/\<glossary variable=>).proto以了解协议缓冲区的cardinality。

#### 协议缓冲区数据类型

以下协议缓冲区的数据类型用于描述馈送元素。

*   **message**。复杂类型
*   **enum**。固定值的列表

#### 实验性字段

标记为**实验性的**字段是可以改变的，并且尚未被正式纳入规范。**实验性**字段可能在将来被正式采用。

## 元素索引

*   [FeedMessage](#message-feedmessage)
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

## 讯息

## _message_ FeedMessage

饲料message的内容。流中的每个message都是作为对适当的HTTP GET请求的响应获得的。实时馈送总是与现有的GTFS馈送一起定义。所有的entityID都是相对于GTFS馈送而解决的。

**字段**

| _**字段名**_  | _**类型**_                          | _**需要**_ | _**心数**_ | _**描述**_                                                                |
| ---------- | --------------------------------- | -------- | -------- | ----------------------------------------------------------------------- |
| **header** | [FeedHeader](#message-feedheader) | 需要       | 一        | 关于此馈送和馈送message的元数据。                                                    |
| **entity** | [FeedEntity](#message-feedentity) | 有条件地要求   | 许多       | 饲料的内容。  如果有可用于交通系统的time信息，必须提供这个字段。  如果这个字段是EMPTY，消费者应假定该系统没有可用的time信息。 |

## _message_ FeedHeader

关于feed的元数据，包括在feed消息中。

**字段**

| _**字段名**_                 | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                     |
| ------------------------- | -------------------------------------------------------------------------- | -------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **gtfs_realtime_version** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 需要       | 一        | 饲料规范的版本。目前的版本是2.0。                                                                                                                                                           |
| **Incrementality**        | [Incrementality](#enum-incrementality)                                     | 需要       | 一        |                                                                                                                                                                              |
| **timestamp**             | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 需要       | 一        | 这个timestamp标识了这个feed的内容被创建的时刻（在服务器time）。在POSIXtime（即自1970年1月1日00:00:00 UTC以来的秒数）。为了避免产生和消费实时信息的系统之间的time偏差，强烈建议从time服务器中获得timestamp。使用第3层甚至更低层的服务器是完全可以接受的，因为几秒钟的time是可以容忍的。 |

## _enum_ Incrementality

确定当前获取的数据是否是增量的。

*   **FULL_DATASET**：该饲料更新将覆盖该饲料的所有先前的实时信息。因此，该更新预计将提供所有已知实时信息的FULL快照。
*   **DIFFERENTIAL**：目前，这种模式是**不被支持的**，对于使用这种模式的饲料，行为也**没有被指定**。在[GTFS-realtime">GTFS Realtime](<https://groups.google.com/group/\<glossary variable=>)实时邮件列表中，有关于完全指定DIFFERENTIAL模式的行为的讨论，当这些讨论最终完成时，文档将被更新。

**价值**

| _**价值**_         |
| ---------------- |
| **FULL_DATASET** |
| **DIFFERENTIAL** |

## _message_ FeedEntity

转运信息中的一个entity的定义（或更新）。如果该entity没有被删除，那么trip_update'、vehicle'、Alert'和Shape'中的一个字段应该被填入。

**字段**

| _**字段名**_       | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                 |
| --------------- | -------------------------------------------------------------------------- | -------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **id**          | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 需要       | 一        | 这个entity的feed-unique标识符。这些标识符只用于提供Incrementality支持。Feed所引用的实际实体必须由明确的选择器来指定（更多INFO见下面的EntitySelector）。                                                                   |
| **is_deleted**  | [bool](https://developers.google.com/protocol-buffers/docs/proto#scalar)   | 可选       | 一        | 这个entity是否要被删除。只应提供给Incrementality为DIFFERENTIAL的feeds - 此字段不应提供给Incrementality为FULL_DATASET的feeds。                                                                       |
| **trip_update** | [TripUpdate](#message-tripupdate)                                          | 有条件地要求   | 一        | 关于一个trip的实时departure延迟的数据。  必须提供至少一个字段trip_update,vehicle,Alert, 或Shape- 所有这些字段不能是EMPTY.                                                                                 |
| **vehicle**     | [VehiclePosition](#message-vehicleposition)                                | 有条件地要求   | 一        | 关于一个vehicle的实时Position的数据.必须提供至少一个字段trip_update,vehicle,Alert, 或Shape- 所有这些字段不能是EMPTY.                                                                                   |
| **Alert**       | [Alert](#message-alert)                                                    | 有条件地要求   | 一        | 关于实时Alert的数据。必须提供至少一个字段trip_update,vehicle,Alert, 或Shape- 所有这些字段不能是EMPTY.                                                                                                |
| **Shape**       | [Shape](#message-shape)                                                    | 有条件地要求   | 一        | 关于实时ADDED形状的数据，例如DETOUR.必须提供至少一个字段trip_update,vehicle,Alert, 或Shape- 所有这些字段不能是EMPTY. <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。 |

## _message_ TripUpdate

实时更新vehicle在trip中的进展。也请参考[trip-updates">trip](</realtime/\<glossary variable=>)更新实体的一般讨论。

根据ScheduleRelationship的值，一个TripUpdate可以指定。

*   一个沿着时间表进行的trip。
*   一个沿着路线进行但没有固定时间表的trip。
*   一个被ADDED或删除的trip，与时间表有关。
*   一个新的trip，是静态GTFS中现有trip的副本。它将在TripProperties中指定的服务日期和time运行。

更新可以是未来的，预测的arrival事件，或已经发生的过去的事件。在大多数情况下，关于过去事件的信息是一个测量值，因此它的uncertainty值被推荐为0。如果一个更新的uncertainty不是0，要么该更新是对一个尚未完成的trip的近似预测，要么测量不精确，要么该更新是对过去的预测，但在事件发生后没有得到验证。

如果vehicle在同一区块内提供多个行程（关于行程和区块的更多信息，请参考[GTFS trips.txt](/schedule/reference/#tripstxt)）。

*   馈送应该包括该vehicle当前服务的trip的TripUpdate。如果生产者对这些未来trip的预测质量有信心，我们鼓励生产者在该vehicle的区块中包括当前trip之后的一个或多个行程的TripUpdates。包括同一vehicle的多个TripUpdates，可以避免vehicle从一个trip过渡到另一个行程时对乘客的预测 "突然出现"，也可以让乘客提前知道影响下游行程的延误（例如，当已知的delay超过了行程之间的计划停留时间）。
*   各个TripUpdate实体不需要按照它们在区块中被SCHEDULED相同顺序被ADDED到馈送中。例如，如果有`行程编号`为1，2，和3的行程都属于一个区块，并且vehicle行驶了trip1，然后是trip2，然后是trip3，那么`trip_update`实体可以以任何顺序出现 - 例如，允许添加trip2，然后是trip1，然后是trip3。

注意，更新可以描述一个已经完成的trip.end，只需提供一个trip最后一站的更新即可。如果arrival最后一站的time是过去的，客户端将得出结论，整个trip是过去的（有可能，尽管不重要，也可以提供前面几站的更新）。这个选项对于一个已经提前完成的trip来说是最有意义的，但是根据时间表，这个trip在当前time仍在进行。移除这个trip的更新可能会使客户端认为这个trip仍在进行中。请注意，信息提供者可以，但不是必须，清除过去的更新 - 这是一个实际有用的案例。

**字段**

| _**字段名**_            | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                                                               |
| -------------------- | -------------------------------------------------------------------------- | -------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**             | [TripDescriptor](#message-tripdescriptor)                                  | 需要       | 一        | 这个message所适用的trip。每个实际的trip实例最多只能有一个TripUpdate entity。如果没有，意味着没有可用的预测信息。它确实 _不是_意味着该trip正在按计划进行。                                                                                                                                                                                                                                                                                       |
| **vehicle**          | [VehicleDescriptor](#message-vehicledescriptor)                            | 可选       | 一        | 关于为这个trip服务的vehicle的额外信息。                                                                                                                                                                                                                                                                                                                                                              |
| **stop_time_update** | [StopTimeUpdate](#message-stoptimeupdate)                                  | 有条件地要求   | 许多       | 对该trip的停止时间的更新（包括未来的，即预测的，以及在某些情况下，过去的，即已经发生的）。这些更新必须按照stop_sequence排序，并且适用于trip的所有后续站点，直到下一个指定的stop_time_update。  除非trip的schedule_relationship是CANCELED或DUPLICATED，否则必须提供至少一个stop_time_update时间的更新 - 如果trip是CANCELED，不需要提供停止时间的更新。如果trip是DUPLICATED, stop_time_updates可以被提供以显示新trip的time信息.                                                                                           |
| **timestamp**        | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 测量vehicle的time进度的最近时刻，以估计未来的StopTimes。当提供过去的StopTimes时，arrival时间可能比这个值早。在POSIXtime（即从1970年1月1日00:00:00 UTC开始的秒数）。                                                                                                                                                                                                                                                                      |
| **delay**            | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可选       | 一        | 当前trip的计划偏差。只有当预测是相对于GTFS中的一些现有计划给出时，才应该指定delay。<br/>delay（以秒为单位）可以是正数（意味着vehicle迟到）或负数（意味着vehicle比计划提前）。delay为0意味着vehicle完全time。<br/>StopTimeUpdates中的delay信息优先于trip delay信息，这样，trip delay只传播到trip中的下一站，并指定StopTimeUpdate delay值。<br/>强烈建议信息提供者提供一个TripUpdate.timestamp，表明delay值最后更新的时间，以评估数据的新鲜度。<br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。 |
| **trip_properties**  | [TripProperties](#message-tripproperties)                                  | 可选       | 一        | 提供trip的更新属性。 <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**这个message仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                                                                                                                                                                 |

## _message_ StopTimeEvent

单个预测事件（arrival或departure）的时间信息。时间由delay和/或估计time，以及uncertainty组成。

*   当预测是相对于GTFS中的一些现有时间表给出时，应该使用delay。
*   无论是否有一个预测的时间表，都应该给出time。如果time和delay都被指定，time将被优先考虑（尽管通常情况下，time，如果给出一个SCHEDULED trip，应该等于GTFS中SCHEDULED time+delay）。

uncertainty同样适用于time和delay。uncertainty大致规定了真实delay的预期误差（但注意，我们还没有定义其精确的统计意义）。uncertainty有可能为0，例如在计算机计时控制下的列车。

**字段**

| _**字段名**_       | _**类型**_                                                                  | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                    |
| --------------- | ------------------------------------------------------------------------- | -------- | -------- | --------------------------------------------------------------------------------------------------------------------------- |
| **delay**       | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | delay（以秒为单位）可以是正数（意味着vehicle晚点）或负数（意味着vehicle比计划提前）。delay为0意味着vehicle完全time。  在StopTimeEvent中必须提供delay或time--两个字段都不能是EMPTY。 |
| **time**        | [int64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 事件为绝对time。以POSIXtime（即从1970年1月1日00:00:00 UTC开始的秒数）。在StopTimeEvent中必须提供delay或time，两个字段都不能是EMPTY。                             |
| **uncertainty** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 如果uncertainty被省略，它将被解释为未知。要指定一个完全确定的预测，将其uncertainty设置为0。                                                                   |

## _message_ StopTimeUpdate

对trip中某一站的arrival和/或departure事件进行实时更新。也请参考[message-tripdescriptor">TripDescriptor](<#\<glossary variable=>)和[trip-updates">trip](</realtime/\<glossary variable=>)更新实体文件中关于站点time更新的一般讨论。

可以为过去和未来的事件提供更新。生产者被允许，尽管不是必须，放弃过去的事件。

更新通过stop_sequence或stop_id与一个特定的站点相联系，因此这些字段中的一个必须被设置。 如果同一个stop_id在一个trip中被访问了不止一次，那么stop_sequence应该在该trip中的所有stop_id的StopTimeUpdates中提供。

**字段**

| _**字段名**_                      | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                                                                                                           |
| ------------------------------ | -------------------------------------------------------------------------- | -------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **stop_sequence**              | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 必须与相应的GTFS饲料中的stop_times.txt相同。  stop_stop_sequence或stop_id必须在StopTimeUpdate中提供 - 两个字都不能是EMPTY.stop_sequence对于多次访问同一个stop_id的旅程是必需的(例如，一个循环)，以区分预测是针对哪一站。如果 `StopTimeProperties.assigned_stop_id`已被填入，那么 `stop_sequence`也必须被填入。                                    |
| **stop_id**                    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 必须与相应的GTFS饲料中的stops.txt相同。在StopTimeUpdate中必须提供stop_sequence或stop_id，这两个字段不能是EMPTY。如果 `StopTimeProperties.assigned_stop_id`被填入，最好省略 `stop_id`而只使用 `stop_sequence`.如果 `StopTimeProperties.assigned_stop_id`和 `stop_id`是填充的。 `stop_id`必须匹配 `assigned_stop_id`.        |
| **arrival**                    | [StopTimeEvent](#message-stoptimeevent)                                    | 有条件地要求   | 一        | 如果schedule_relationship是EMPTY或SCHEDULED，必须在StopTimeUpdate中提供arrival或departure--两个字段都不能是EMPTY。当schedule_relationship是SKIPPED时，arrival和departure可能都是EMPTY。  如果schedule_relationship是NO_DATA，arrival和departure必须是EMPTY。                                               |
| **departure**                  | [StopTimeEvent](#message-stoptimeevent)                                    | 有条件地要求   | 一        | 如果schedule_relationship schedule_relationship是EMPTY或SCHEDULED，必须在StopTimeUpdate中提供arrival或departure，两个字段不能都是EMPTY EMPTY。  如果schedule_relationship是NO_DATA，arrival和departure必须是EMPTY。                                                                               |
| **departure_occupancy_status** | [OccupancyStatus](#enum-occupancystatus)                                   | 可选       | 一        | vehicle从给定的站点departure后，预测的乘客占用状态。如果提供，必须提供stop_sequence。要提供departure_occupancy_status而不提供任何time arrival或departure的预测，请填入这个字段并设置StopTimeUpdate。schedule_relationship= NO_DATA。 <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。 |
| **schedule_relationship**      | [ScheduleRelationship](#enum-schedulerelationship)                         | 可选       | 一        | 默认的关系是SCHEDULED。                                                                                                                                                                                                                                                   |
| **stop_time_properties**       | [StopTimeProperties](#message-stoptimeproperties)                          | 可选       | 一        | 对GTFS stop_times.txt内定义的某些属性进行实时更新。 <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                            |

## _enum_ ScheduleRelationship

该停止时间与静态时间表之间的关系。

**价值**

| _**价值**_        | _**评论**_                                                                                                                                                                                                                                                                                                                                                                                     |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SCHEDULED**   | vehicle按照它的静态停靠时间表进行，尽管不一定按照时间表的时间进行。这就是 **默认的**行为。必须至少提供arrival和departure中的一个。基于频率的旅行GTFS frequencies.txt，精确时间=0）不应该有SCHEDULED值，而应该使用UNSCHEDULED。                                                                                                                                                                                                                                           |
| **SKIPPED**     | 该站是SKIPPED，即vehicle不会在这一站停车。arrival和departure是可选的。当设置 `SKIPPED`不会传播到同一trip中的后续站点（即，vehicle将在trip中的后续站点停车，除非这些站点也有一个 `stop_time_update`和 `schedule_relationship: SKIPPED`trip中的前一站的delay_是否_传播到该 `SKIPPED`迟。换句话说，如果一个 `stop_time_update`有一个 `arrival`或 `departure`预测没有为该站之后的一个站点设置 `SKIPPED`后没有设置预测值，那么在该站上游的预测值 `SKIPPED`的上游预测将被传播到该站之后的 `SKIPPED`和trip中的后续站点，直到 `stop_time_update`后面的站点被提供。 |
| **无_DATA**      | 没有为这一站提供数据。它表示没有可用的实时时间信息。当设置NO_DATA时，会通过后续的站点传播，所以这是被推荐的指定你没有实时时间信息的站点的方法。当NO_DATA被设置时，arrival和departure都不应该被提供。                                                                                                                                                                                                                                                                            |
| **UNSCHEDULED** | vehicle正在运行一个基于频率的tripGTFS frequencies.txt与exact_times = 0）。这个值不应该用于没有在GTFS frequencies.txt中定义的车次，或者GTFS frequencies.txt中确切时间=1的车次。包含在 `stop_time_updates`和 `schedule_relationship: UNSCHEDULED`的旅行也必须设置TripDescriptor`schedule_relationship: UNSCHEDULED` <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                               |

## _message_ StopTimeProperties

实时更新在GTFS stop_times.txt中定义的某些属性。

**注意：**这个message仍然是**试验性的**，可能会有变化。它可能在未来被正式采用。<br/>

**字段**

| _**字段名**_            | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| -------------------- | -------------------------------------------------------------------------- | -------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **assigned_stop_id** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 支持time停止分配。指的是一个 `stop_id`在GTFS中定义的 `stops.txt`. <br/>新的 `assigned_stop_id`不应导致end的trip体验与原来的大不相同。 `stop_id`GTFS车次必须设置行程描述符。 `stop_times.txt`.换句话说，end不应该认为这个新的 `stop_id`如果新站是在没有任何额外背景的情况下出现在应用程序中，则被视为 "不寻常的变化"。例如，这个字段的目的是通过使用一个 `stop_id`属于与GTFS中最初定义的站点相同的站点。 `stop_times.txt`. <br/>要在不提供任何time arrival或departure预测的情况下分配一个站点，请填入这个字段并设置 `StopTimeUpdate.schedule_relationship = NO_DATA`. <br/>如果这个字段被填充。 `StopTimeUpdate.stop_sequence`必须填入，而 `StopTimeUpdate.stop_id`不应被填充。站点分配也应反映在其他GTFS字段中（例如。 `VehiclePosition.stop_id`). <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。 |

## _message_ TripProperties

定义更新的trip属性

**注意：**这个message仍然是**试验性的**，可能会有变化。它可能在将来被正式采用。<br/>.

**字段**

| _**字段名**_      | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| -------------- | -------------------------------------------------------------------------- | -------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 定义一个新的trip的标识符，它是在(CSV)GTFS trips.txt中定义的现有trip的重复，但将在不同的服务日期和/或time start（用 `TripProperties.start_date`和 `TripProperties.start_time`).请看定义 `trips.trip_id`(CSV)GTFS中的定义。它的值必须与(CSV)GTFS中使用的值不同。这个字段是必需的，如果 `schedule_relationship`是 `DUPLICATED`否则，这个字段必须不被填入，并将被消费者忽略。 <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                                                                                                                                                                                                                                                                               |
| **start_date** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 服务日期，DUPLICATED trip将被运行。必须以YYYMMDD格式提供。这个字段是必须的，如果 `schedule_relationship`是 `DUPLICATED`, 否则这个字段必须不被填入，并将被消费者忽略。 <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **start_time** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 定义trip被DUPLICATED时的departure start time。见定义 `stop_times.departure_time`在(CSV)GTFS中。DUPLICATED trip的SCHEDULED arrival和departure时间是根据原始trip和这个字段之间的偏移计算的. `departure_time`和这个字段的偏移来计算。例如，如果一个GTFS tripA站有一个 `departure_time`的 `10:00:00`和B站为 `departure_time`的 `10:01:00`而这个字段被填入的值是 `10:30:00`这个字段被填入，DUPLICATED trip中的B站将有一个SCHEDULED. `departure_time`的 `10:31:00`.实时预测 `delay`值被应用到这个计算出的计划time，以确定预测time。例如，如果提供B站的departure`delay`的 `30`提供了B站的出发时间，那么预测的departure time是 `10:31:30`.实时预测 `time`值没有应用任何偏移，并表示所提供的预测time。  例如，如果提供的departure`time`代表10:31:30，那么预测的departure time是 `10:31:30`.这个字段是必须的，如果 `schedule_relationship`是 `DUPLICATED`，否则这个字段必须不被填入，并将被消费者忽略。 <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。 |
| **shape_id**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 指定这个trip的vehicle行驶路径的Shape，当它与原来的不同时。指的是在(CSV)GTFS中定义的Shape或在time反馈中的一个新的Shape entity。见定义 `trips.shape_id`in (CSV)GTFS. <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |

## _message_ VehiclePosition

一个给定vehicle的实时定位信息。

**字段**

| _**字段名**_                  | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                                                                                                                                                                            |
| -------------------------- | -------------------------------------------------------------------------- | -------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**                   | [TripDescriptor](#message-tripdescriptor)                                  | 可选       | 一        | 这个vehicle所服务的trip。如果vehicle不能与给定的trip实例相识别，可以是EMPTY或部分。                                                                                                                                                                                                                                                                             |
| **vehicle**                | [VehicleDescriptor](#message-vehicledescriptor)                            | 可选       | 一        | 关于为这个trip服务的vehicle的额外信息。每个条目都应该有一个 **唯一的**vehicle id.                                                                                                                                                                                                                                                                              |
| **Position**               | [Position](#message-position)                                              | 可选       | 一        | 这个vehicle的当前Position。                                                                                                                                                                                                                                                                                                               |
| **current_stop_sequence**  | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 当前站点的停车顺序索引。current_stop_sequence的含义（即它所指向的站点）由current_status决定。如果缺少current_status，则假定为IN_TRANSIT_TO。                                                                                                                                                                                                                               |
| **stop_id**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 识别当前的站点。该值必须与相应GTFS饲料中的stops.txt相同。如果 `StopTimeProperties.assigned_stop_id`用来指定一个 `stop_id`的变化，这个字段也应反映在 `stop_id`.                                                                                                                                                                                                                 |
| **current_status**         | [VehicleStopStatus](#enum-vehiclestopstatus)                               | 可选       | 一        | vehicle相对于当前站点的确切状态。如果current_stop_sequence丢失，则忽略。                                                                                                                                                                                                                                                                                  |
| **timestamp**              | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 测量vehicle Position的时刻。以POSIXtime为单位（即从1970年1月1日00:00:00 UTC开始的秒数）。                                                                                                                                                                                                                                                                  |
| **congestion_level**       | [CongestionLevel](#enum-congestionlevel)                                   | 可选       | 一        |                                                                                                                                                                                                                                                                                                                                     |
| **occupancy_status**       | [OccupancyStatus](#enum-occupancystatus)                                   | _可选_     | 一        | vehicle或车厢的乘客占用状态。如果multi_carriage_details是以每节车厢的OccupancyStatus填充的，那么这个字段应该描述整个vehicle，并考虑所有接受乘客的车厢。<br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                            |
| **occupancy_percentage**   | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 一个百分比值，表示vehicle中的乘客占用程度。100这个值应该代表vehicle设计的最大乘员总数，包括座位和站立的能力，以及目前的运营规则允许的。如果有更多的乘客超过最大设计容量，该值可能超过100。occupancy_percentage的精度应该足够低，以至于无法追踪到个别乘客的上车或下车情况。如果multi_carriage_details是用每节车厢occupancy_percentage填写的，那么这个字段应该描述整个vehicle，并考虑所有接受乘客的车厢。<br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。 |
| **multi_carriage_details** | [CarriageDetails](#message-CarriageDetails)                                | 可选       | 许多       | 这个给定vehicle的多个车厢的详细信息。第一次出现代表该vehicle的第一节车厢。 **鉴于当前的旅行方向**.multi_carriage_details字段的出现次数代表该vehicle的车厢数量。它还包括不可登机的车厢，如发动机、MAINTENANCE车厢等......因为它们为乘客提供了关于站台位置的宝贵信息。<br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                              |

## _enum_ VehicleStopStatus

**价值**

| _**价值**_          | _**评论**_                               |
| ----------------- | -------------------------------------- |
| **INCOMING_AT**   | vehicle即将到达站台（在站台显示器上，vehicle符号通常会闪烁）。 |
| **STOPPED_AT**    | vehicle正站在该站。                          |
| **IN_TRANSIT_TO** | vehicle已经离开了前一站，正在运输中。                 |

## _enum_ CongestionLevel

影响该vehicle的CONGESTION级别。

**价值**

| _**价值**_                     |
| ---------------------------- |
| **UNKNOWN_CONGESTION_LEVEL** |
| **RUNNING_SMOOTHLY**         |
| **STOP_AND_GO**              |
| **CONGESTION**               |
| **SEVERE_CONGESTION**        |

## _enum OccupancyStatus_

vehicle或车厢的乘客占用状态。

个别生产者可能不会公布所有的OccupancyStatus值。因此，消费者不能假设OccupancyStatus值遵循一个线性比例。消费者应该将OccupancyStatus值表示为生产者所指示和打算的状态。同样地，生产者必须使用与实际vehicle占用状态相对应的OccupancyStatus值。

对于描述线性比例的乘客占用水平，请参见`occupancy_percentage`。

**注意：**这个字段仍然是**实验性的**，会有变化。它可能在将来被正式采用。

_**价值**_

| _**价值**_                         | _**评论**_                                                    |
| -------------------------------- | ----------------------------------------------------------- |
| _**EMPTY**_                      | _按照大多数的衡量标准，vehicle被认为是EMPTY，车上的乘客很少或没有，但仍在接受乘客。_           |
| _**MANY_SEATS_AVAILABLE**_       | _该vehicle或车厢有大量的可用座位。在全部可用座位中，有多少空闲座位被认为大到可以归入这一类别，由生产者决定。_ |
| _**FEW_SEATS_AVAILABLE**_        | _该vehicle或车厢有少量可用的座位。在总的座位中，被认为足够小而属于这一类的空闲座位的数量，由制作者酌情决定。_ |
| _**STANDING_ROOM_ONLY**_         | _该vehicle或车厢目前只能容纳站立的乘客。_                                   |
| _**CRUSHED_STANDING_ROOM_ONLY**_ | _该vehicle或车厢目前只能容纳站立的乘客，而且空间有限。_                            |
| _**FULL**_                       | _按照大多数的衡量标准，该vehicle被认为是FULL，但可能仍然允许乘客上车。_                  |
| _**NOT_ACCEPTING_PASSENGERS**_   | _该vehicle或车厢不接受乘客。该vehicle或车厢通常接受乘客上车。_                     |
| _**NO_DATA_AVAILABLE**_          | _该vehicle或车厢time没有任何载客数据。_                                  |
| _**NOT_BOARDABLE**_              | _该vehicle或车厢不能登车，从不接受乘客。对特殊车辆或车厢（发动机、MAINTENANCE车等）很有用。_    |

## _message_ CarriageDetails

马车的具体细节，用于由几个马车组成的车辆。

**注意：**这条message仍然是**实验性的**，可能会有变化。它可能在未来被正式采用。

**字段**

| _**字段名**_                | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                                                                                                                                                                            |
| ------------------------ | -------------------------------------------------------------------------- | -------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**                   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 车厢的标识。vehicle应该是唯一的。 <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                                                                                                            |
| **label**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一        | 用户可见的label，可以显示给乘客，帮助识别车厢。例如。"7712"，"ABC-32车厢"，等等。 <br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                                                                                   |
| **occupancy_status**     | [OccupancyStatus](#enum-occupancystatus)                                   | 可选       | 一        | 在这个vehicle中，这个给定的车厢的占用状态。默认设置为 `NO_DATA_AVAILABLE`.<br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                                                                              |
| **occupancy_percentage** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可选       | 一        | 该车厢的占用率，在vehicle中的占用率。遵循与 "VehiclePosition.occupancy_percentage "相同的规则。如果没有这个车厢的数据，则使用-1。<br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                                                                                                                                                        |
| **carriage_sequence**    | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 需要       | 一        | 确定该车厢相对于vehicle的车厢状态列表中的其他车厢的顺序。行进方向上的第一个车厢必须有1的值，第二个值对应于行进方向上的第二个车厢，必须有2的值，以此类推。例如，行进方向上的第一节车厢的值为1，如果行进方向上的第二节车厢的值为3，消费者将放弃所有车厢的数据（即multi_carriage_details字段）。没有数据的车厢必须用一个有效的carriage_sequence来表示，没有数据的字段应该被省略（另外，这些字段也可以包括在内，并设置为 "没有数据 "的值）。 <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。 |

## _message_ Alert

一个Alert，表明公共交通网络中的某种事件。

**字段**

| _**字段名**_                  | _**类型**_                                      | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                                                                                        |
| -------------------------- | --------------------------------------------- | -------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **active_period**          | [TimeRange](#message-timerange)               | 可选       | 许多       | Alert应该显示给用户的time。如果缺失，只要Alert出现在feed中，就会显示。如果给出多个范围，Alert将在所有范围内显示。                                                                                                                                                                            |
| **informed_entity**        | [EntitySelector](#message-entityselector)     | 需要       | 许多       | 我们应该通知其用户这个Alert的实体。  必须提供至少一个informed_entity。                                                                                                                                                                                                  |
| **Cause**                  | [Cause](#enum-cause)                          | 可选       | 一        |                                                                                                                                                                                                                                                 |
| **Effect**                 | [Effect](#enum-effect)                        | 可选       | 一        |                                                                                                                                                                                                                                                 |
| **url**                    | [TranslatedString](#message-translatedstring) | 可选       | 一        | 提供有关该Alert的额外信息的url。                                                                                                                                                                                                                            |
| **header_text**            | [TranslatedString](#message-translatedstring) | 需要       | 一        | Alert的header。这个纯文本string将被突出显示，例如用黑体字。                                                                                                                                                                                                          |
| **description_text**       | [TranslatedString](#message-translatedstring) | 需要       | 一        | Alert的描述。这个纯文本的string将被格式化为Alert的主体（或者在用户明确的 "展开 "请求中显示）。描述中的信息应该添加到header的信息中。                                                                                                                                                                 |
| **tts_header_text**        | [TranslatedString](#message-translatedstring) | 可选       | 一        | 包含Alert的header的text，用于text的实现。这个字段是header_text的text版本。它应该包含与header_text相同的信息，但格式化后可以作为text的读物（例如，去掉缩写，拼出数字，等等）。                                                                                                                                 |
| **tts_description_text**   | [TranslatedString](#message-translatedstring) | 可选       | 一        | 包含对Alert的描述的text，用于text的实现。这个字段是description_text的文本text版本。它应该包含与description_text相同的信息，但格式化后可以作为text的读物（例如，去掉缩写，拼出数字，等等）。                                                                                                                        |
| **severity_level**         | [SeverityLevel](#enum-severitylevel)          | 可选       | 一        | Alert的严重程度。                                                                                                                                                                                                                                     |
| **image**                  | [TranslatedImage](#message-translatedimage)   | 可选       | 一        | 沿着Alert text显示的TranslatedImage。用来直观地解释DETOUR、车站关闭等的Alert Effect。image应该加强对Alert的理解，不能成为重要信息的唯一位置。不鼓励以下类型的图像：主要包含text的image，没有增加额外信息的营销或品牌图像。 <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。                |
| **image_alternative_text** | [TranslatedString](#message-translatedstring) | 可选       | 一        | 描述链接的image在该领域的外观的text（例如，在该领域中）。 `image`字段中的链接图像的外观（例如，在image不能被显示或用户由于可访问性的原因不能看到image的情况下）。参见HTML [规范的altimage text](https://html.spec.whatwg.org/#alt). <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。 |


## _enum_ Cause

该Alert的Cause。

**价值**

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

## _enum_ Effect

该问题对受影响entity的Effect。

**价值**

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

## _enum_ SeverityLevel

Alert的严重程度。

**注意：**这个字段仍然是**实验性的**，会有变化。它可能在将来被正式采用。

**价值**

| _**价值**_             |
| -------------------- |
| **UNKNOWN_SEVERITY** |
| **INFO**             |
| **WARNING**          |
| **SEVERE**           |

## _message_ TimeRange

一个time区间。如果`t`大于或等于start time，小于end time，则认为该时间间隔在time `t`上处于活动状态。

**字段**

| _**字段名**_ | _**类型**_                                                                   | _**需要**_ | _**编码量**_ | _**描写**_                                                                                                                 |
| --------- | -------------------------------------------------------------------------- | -------- | --------- | ------------------------------------------------------------------------------------------------------------------------ |
| **start** | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一个        | start time，以POSIXtime为单位（即从1970年1月1日00:00:00 UTC开始的秒数）。如果缺少，则间隔时间从负无穷开始。  如果提供了一个TimeRange，必须提供start或end- 两个字段都不能是EMPTY。 |
| **end**   | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一个        | end time，以POSIXtime为单位（即从1970年1月1日00:00:00 UTC开始的秒数）。如果缺失，则时间间隔在正无穷处结束。如果提供一个TimeRange，必须提供start或end- 两个字段都不能是EMPTY。     |

## _message_ Position

一个vehicle的Position。

**字段**

| _**字段名**_     | _**类型**_                                                                   | _**需要的**_ | _**规模**_ | _**说明**_                                                                                           |
| ------------- | -------------------------------------------------------------------------- | --------- | -------- | -------------------------------------------------------------------------------------------------- |
| **latitude**  | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 需要的       | 一个       | 北纬度，在WGS-84坐标系中。                                                                                   |
| **longitude** | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 需要        | 一个       | 东经度数，在WGS-84坐标系中。                                                                                  |
| **bearing**   | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可选的       | 一        | bearing，单位为度，从真北顺时针方向，即0为北，90为东。这可以是罗盘bearing，也可以是通往下一站或中间位置的方向。这不应该从以前的位置序列中推断出来，客户可以从以前的数据中计算出来。 |
| **odometer**  | [double](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选的       | 一        | odometer值，单位是米。                                                                                    |
| **speed**     | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可选的       | 一        | vehicle测量的瞬间speed，单位是米/秒。                                                                          |

## _message_ TripDescriptor

一个描述符，用于识别GTFS trip的单个实例。

为了指定一个单一的trip实例，在许多情况下，一个`trip_id`本身就足够了。然而，下面的情况需要额外的信息来解析一个单一的trip实例。

* 对于在frequencies.txt中定义的旅程，除了`trip_id`，还需要start\_`start_date`和`start_time`。
* 如果trip持续超过24小时，或者延迟到与第二天的SCHEDULED trip相冲突，那么除了`trip_id`之外，还需要`start_date`。
* 如果不能提供`trip_id`字段，那么必须提供`route_id`,`direction_id`,`start_date`, 和`start_time`.

在所有情况下，如果除了`trip_id`\_id之外还提供了`trip_id`\_id，那么`route_id`必须是GTFS trips.txt中分配给特定trip的同一个`route_id`。

`trip_id`字段本身或与其他TripDescriptor字段结合，不能用来识别多个trip实例.例如，TripDescriptor不应该为GTFS frequencies.txtexact_times=0的旅程指定trip_id本身，因为start_time也需要解析为在一天中某个特定time开始的单一trip实例。如果TripDescriptor没有解析到一个trip实例（即，它解析到零个或多个trip实例），它被认为是一个错误，包含错误的TripDescriptor的entity可能被消费者丢弃。

注意，如果TripUpdate trip_id不知道，那么TripUpdate中的车站序列id是不够的，还必须提供stop_id。此外，必须提供绝对的arrival时间。

TripDescriptor.route_id不能在Alert EntitySelector中使用，以指定影响一条路线的所有车次的路线范围的Alert- 使用EntitySelector.route_id代替。

**字段**

| _**字段名**_                 | _**类型**_                                                                   | _**需要**_ | _**纵向**_ | _**说明**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ------------------------- | -------------------------------------------------------------------------- | -------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip_id**               | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 这个选择器所指的GTFS资料中的trip_id。对于非基于频率的旅程（未在GTFS frequencies.txt中定义的旅程），这个字段足以唯一地识别该trip。对于在GTFS frequencies.txt中定义的基于频率的旅行，trip_id,start_time, 和start_date都是必须的。对于SCHEDULED旅行（未在GTFS frequencies.txt中定义的旅行），只有当trip可以由route_id，direction_id，start_time和start_date组合来唯一识别，并且所有这些字段都提供时，才可以省略trip_id。当TripUpdate中的schedule_relationship被DUPLICATED时，trip_id从静态GTFS中识别出要被DUPLICATED的trip。当schedule_relationship在一个VehiclePosition中被DUPLICATED时，trip_id标识新的重复trip，并且必须包含相应的TripUpdate的值。TripProperties.trip_id.                                         |
| **route_id**              | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 这个选择器所指的GTFS中的route_id。如果trip_id被省略，route_id，direction_id，start_time和schedule_relationship=SCHEDULED都必须被设置来识别一个trip实例。TripDescriptor.route_id不应该被用在一个Alert EntitySelector中，以指定一个影响到一条路线的所有旅程的路线范围的Alert--使用EntitySelector.route_id代替。                                                                                                                                                                                                                                                                                                         |
| **direction_id**          | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件要求    | 一        | GTFSfeedtrips.txt檔案中的direction_id，表示此選擇器所指的旅程的方向。如果trip_id被省略，direction_id必须被提供。 <br/><br/>**注意事项。**这个领域仍然是 **实验性**，并可能发生变化。它可能在未来被正式采用。<br/>                                                                                                                                                                                                                                                                                                                                                                                                 |
| **start_time**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 这个trip实例的最初SCHEDULED start time。当ttrip_id对应的是一个非基于频率的trip时，这个字段应该被省略或者等于GTFS中的值。当trip_id对应于GTFS frequencies.txt中定义的基于频率的trip时，start_time是必需的，必须为trip更新和vehicle位置指定。如果trip对应的是exact_times=1的GTFS记录，那么start_time必须比frequencies.txt中相应time的start_time晚一些倍数（包括0）的headway_secs。如果trip对应exact_times=0，那么它的start_time可以是任意的，最初预计是该trip的第一次departure。一旦建立，这个基于频率的exact_times=0trip的start_time应该被认为是不可改变的，即使第一次departure time改变了 -- 这个time的改变可能会反映在StopTimeUpdate中。如果trip_id被省略，start_time必须被提供。这个字段的格式和语义与GTFSfrequencies.txt相同，例如，11:15:35或25:15:35。 |
| **start_date**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 这个trip实例的start日期是YYYMMDD格式。对于SCHEDULED行程（未在GTFS frequencies.txt中定义的行程），这个字段必须被提供，以区分那些晚到与第二天SCHEDULED相撞的trip。例如，对于每天8:00和20:00出发的列车，如果晚点12个小时，就会有两个不同的班次在time出现。这个字段可以提供，但对于不可能发生这种碰撞的时间表来说不是强制性的--例如，按小时运行的服务，晚点一小时的vehicle就不再被认为与时间表有关。这个字段对于GTFS frequencies.txt中定义的基于频率的车次是必须的。如果trip_id被省略，必须提供start_date。                                                                                                                                                                                                                               |
| **schedule_relationship** | [ScheduleRelationship](#enum-schedulerelationship-1)                       | 可选的      | 一        | 这个trip和静态时间表之间的关系.如果TripDescriptor是在Alert中提供的 `EntitySelector`，则 `schedule_relationship`字段在识别匹配的trip实例时被消费者忽略.                                                                                                                                                                                                                                                                                                                                                                                                                                |

## _enum_ ScheduleRelationship

这个trip和静态日程表之间的关系。如果一个trip是按照临时日程表完成的，没有反映在GTFS中，那么它不应该被标记为SCHEDULED，而是标记为ADDED。

**价值**

| _**价值**_        | _**评论**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SCHEDULED**   | 正在按照GTFS Schedule排程运行的trip，或者足够接近SCHEDULED trip而与之相关。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **ADDED**       | 一个额外的trip，是在运行计划之外ADDED的，例如，替换一个坏掉的vehicle或应对突然的客运量。 _注意：目前，对于使用这种模式的馈送，行为是没有规定的。在GTFSGitHub上有一些讨论 [(1)](https://github.com/google/transit/issues/106) [(2)](https://github.com/google/transit/pull/221) [(3)](https://github.com/google/transit/pull/219)围绕着完全指定或废弃ADDED行程进行讨论，当这些讨论最终确定时，文档将被更新。_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **UNSCHEDULED** | 一个正在运行的trip，没有与之相关的时间表 - 这个值用来识别GTFS frequencies.txt中定义的确切时间=0的旅程。它不应该用来描述GTFS frequencies.txtxt中没有定义的旅程，或者GTFS frequencies.txt中确切时间=1的旅程。带有 `schedule_relationship: UNSCHEDULED`的行程也必须设置所有的StopTimeUpdates `schedule_relationship: UNSCHEDULED`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| **CANCELED**    | 一个在计划表中存在但被删除的trip。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **DUPLICATED**  | 一个新的trip，除了服务start日期和time外，与现有的SCHEDULED trip相同。与 `TripUpdate.TripProperties.trip_id`, `TripUpdate.TripProperties.start_date`, 和 `TripUpdate.TripProperties.start_time`一起使用，从静态GTFS中复制一个现有的trip，但在不同的服务日期和/或time start。如果在(CSV)GTFS中与原始trip有关的服务（在 `calendar.txt`或 `calendar_dates.txt`)在未来30天内运营。被DUPLICATED的trip是通过以下方式确定的 `TripUpdate.TripDescriptor.trip_id`. <br/><br/>这个枚举并不修改现有的trip。 `TripUpdate.TripDescriptor.trip_id`- 如果一个生产者想取消原来的trip，它必须发布一个单独的 `TripUpdate`值为CANCELED。在GTFS中定义的旅行 `frequencies.txt`和 `exact_times`中定义的旅行，如果是EMPTY或等于 `0`不能被DUPLICATED。新旅程的 `VehiclePosition.TripDescriptor.trip_id`中的trip必须包含与之匹配的值. `TripUpdate.TripProperties.trip_id`和 `VehiclePosition.TripDescriptor.ScheduleRelationship`也必须被设置为 `DUPLICATED`.  <br/><br/>_现有的生产者和消费者使用ADDED枚举来代表DUPLICATED行程，必须遵循 [迁移指南](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/examples/migration-duplicated.md)来过渡到DUPLICATED枚举。_ |

## _message_ VehicleDescriptor

执行trip的vehicle的识别信息。

**字段**

| _**字段名**_         | _**类型**_                                                                   | _**需要**_ | _**枢轴量**_ | _**描写**_                                                                                |
| ----------------- | -------------------------------------------------------------------------- | -------- | --------- | --------------------------------------------------------------------------------------- |
| **id**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一         | vehicle的内部系统标识。应该是 **唯一的**vehicle，用于跟踪vehicle在系统中的运行情况。这个id不应该对end可见；为此目的使用 **label**领域 |
| **label**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一         | 用户可见的label，即必须向乘客展示的东西，以帮助识别正确的vehicle。                                                 |
| **license_plate** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可选       | 一         | vehicle的车牌。                                                                             |

## _message_ EntitySelector

一个GTFS馈送中的entity的选择器。字段的值应该对应于GTFS馈送中的适当字段。必须至少给出一个指定器。如果给出了几个，它们应该被解释为由逻辑`和`运算符连接。 此外，指定者的组合必须与GTFS馈送中的相应信息相匹配。 换句话说，为了使Alert适用于GTFS中的一个entity，它必须匹配所有提供的EntitySelector字段。 例如，一个EntitySelector包括字段`route_id`:"5" 和`route_type`:"3 "只适用于`route_id`:"`5 "`的公交车--它不适用任何其他route`route_type`:`"3".` 如果生产者想让一个Alert适用于`route_id`:"5 "以及`route_type`\_type:"`3"`，它应该提供两个独立的EntitySelectors，一个引用`route_id`:"5 "和另一个参考`route_type`。"3".

至少要给出一个指定的字段--EntitySelector中的所有字段不能是EMPTY。

**领域**

| _**字段名**_        | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                            |
| ---------------- | -------------------------------------------------------------------------- | -------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **agency_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 该选择器所指的GTFS馈送中的agency_id。                                                                                                                                                           |
| **route_id**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 这个选择器所指的GTFS中的route_id。如果提供direction_id，也必须提供route_id。                                                                                                                              |
| **route_type**   | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 有条件地要求   | 一        | 这个选择器所指的GTFS中的route_type。                                                                                                                                                           |
| **direction_id** | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 来自GTFSfeedtrips.txt文件的direction_id，用于选择路线的一个方向的所有车次，由route_id 指定。如果提供direction_id，route_id也必须提供。 <br/><br/>**注意：这个字段仍然是试验性的，将来可能被正式采用。**这个领域仍然是 **实验性**实验性的,并且会有变化。它可能在未来正式通过。<br/> |
| **trip**         | [TripDescriptor](#message-tripdescriptor)                                  | 有条件地要求   | 一        | 这个选择器指的是GTFS中的trip实例。这个TripDescriptor必须解析为GTFS数据中的一个trip实例(例如，生产者不能只为exact_times=0的旅程提供一个trip_id)。如果ScheduleRelationship字段在这个TripDescriptor中被填入，当消费者试图识别GTFS trip时，它将被忽略。           |
| **stop_id**      | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | 这个选择器所指的GTFS馈送中的stop_id。                                                                                                                                                            |

## _message_ TranslatedString

一个国际化的message，包含每个语言版本的text片段或一个url。message中的一个字符串将被拾取。解析过程如下。如果用户界面language与某个Translation的language代码相匹配，那么第一个匹配的Translation就会被选中。如果默认的用户界面language（例如，英语）与Translation的language代码相匹配，则挑选第一个匹配的Translation。如果某个Translation有一个未指定的language代码，则该Translation被选中。

**领域**

| _**字段名**_       | _**类型**_                            | _**需要**_ | _**心数**_ | _**描述**_            |
| --------------- | ----------------------------------- | -------- | -------- | ------------------- |
| **Translation** | [Translation](#message-translation) | 需要       | 许多       | 至少要提供一个Translation。 |

## _message_ Translation

一个本地化的string，映射到一种language。

| _**字段名**_    | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                   |
| ------------ | -------------------------------------------------------------------------- | -------- | -------- | -------------------------------------------------------------------------------------------------------------------------- |
| **text**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 需要       | 一        | 一个包含message的UTF-8string。                                                                                                   |
| **language** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | BCP-47language代码。如果language未知，或者根本没有对消息进行国际化处理，可以省略。最多允许一个Translation有一个未指定的language标签 - 如果有一个以上的Translation，必须提供language。 |

## _message_ TranslatedImage

一个国际化的message，包含一个image的每个语言版本。message中的一个图像将被拾取。解决的过程如下。如果用户界面language与某一Translation的language代码相匹配，则挑选第一个匹配的Translation。如果默认的用户界面language（例如，英语）与Translation的language代码相匹配，则挑选第一个匹配的Translation。如果某个Translation有一个未指定的language代码，则该Translation被选中。

**注意：**这条message仍然是**实验性的**，可能会有变化。它可能在未来被正式采用。

**领域**

| _**字段名**_           | _**类型**_                                  | _**需要**_ | _**心数**_ | _**描述**_           |
| ------------------- | ----------------------------------------- | -------- | -------- | ------------------ |
| **localized_image** | [LocalizedImage](#message-localizedimage) | 需要       | 许多       | 必须提供至少一个本地化的image。 |

## _message_ LocalizedImage

一个映射到某种language本地化image url。

| _**字段名**_      | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                                                                                                           |
| -------------- | -------------------------------------------------------------------------- | -------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **url**        | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 需要       | 一        | string，包含一个链接到image的url。链接的image必须小于2MB。如果image的变化足够大，以至于需要在消费者方面进行更新，生产者必须将url更新为新的url。<br/><br/>url应该是一个完全合格的url，其中包括http:// 或 https://，而且url中的任何特殊字符都必须被正确转义。参见以下内容 [hurl](https://www.w3.org/Addressing/URL/4_URI_Recommentations.html for)关于如何创建完全合格的url值的描述。 |
| **media_type** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 需要       | 一        | IANA媒体类型，以指定要显示的image类型。该类型必须以 "image/"start                                                                                                                                                                                                                       |
| **language**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有条件地要求   | 一        | BCP-47language代码。如果language未知或对饲料完全不做国际化处理，则可以省略。最多允许一个Translation有一个未指定的language标签--如果有一个以上的Translation，必须提供language。                                                                                                                                             |

## _message_ Shape

描述当Shape不是(CSV)GTFS的一部分时，vehicle所走的物理路径，例如对于一个临时的DETOUR。形状属于Trips，由一个编码的折线组成，以便更有效地传输。 形状不需要准确地截取站点的位置，但是一个trip中的所有站点应该位于该trip Shape的一小段距离内，即靠近连接Shape点的直线段。

**注意：**这个message仍然是**试验性的**，可能会有变化。它可能在将来被正式采用。<br/>.

**字段**

| _**字段名**_            | _**类型**_                                                                   | _**需要**_ | _**心数**_ | _**描述**_                                                                                                                                                                                                     |
| -------------------- | -------------------------------------------------------------------------- | -------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **shape_id**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 需要       | 一        | Shape的标识符。必须不同于任何 `shape_id`在(CSV)GTFS中定义的。 <br/><br/>**注意事项。**这个字段仍然是 **实验性的**它可能在未来被正式采用，并且可以改变。它可能会在未来正式通过。                                                                                               |
| **encoded_polyline** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 需要       | 一        | Shape的编码折线表示。这条折线必须至少包含两个点。关于编码的折线的更多信息，见 <https://developers.google.com/maps/documentation/utilities/polylinealgorithm> <br/><br/>**注意：这个领域仍然是试验性的，可能会有变化。**此字段仍然是 **实验性的**它可能在未来被正式采用，并可能发生变化。它可能会在未来正式通过。 |
