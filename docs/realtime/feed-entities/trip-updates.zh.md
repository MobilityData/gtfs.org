# 行程更新

行程更新代表时间表的波动。我们希望收到所有你安排的、可以实时运行的行程的行程更新。这些更新会给出沿途各站的预测到达或出发时间。行程更新也可以提供更复杂的情况，即行程被取消或被添加到时间表中，甚至被重新安排路线。

**提醒。**在[GTFS](../../schedule/reference.md)中，一个行程是在一个特定时间发生的两个或更多站点的序列。

每个预定行程**最多**应该有一个行程更新。如果计划中的行程没有行程更新，将被断定为该行程没有实时数据可用。数据消费者**不**应该假设该行程是准时运行的。

如果一辆车在同一区块内提供多个行程（关于行程和区块的更多信息，请参考[GTFS trips.txt](../../schedule/reference.md#tripstxt)）。

*   馈送应该包括该vehicle当前服务的trip的TripUpdate。如果生产者对这些未来trip的预测质量有信心，我们鼓励生产者在该vehicle的区块中包括当前trip之后的一个或多个行程的TripUpdates。包括同一vehicle的多个TripUpdates，可以避免vehicle从一个trip过渡到另一个行程时对乘客的预测 "突然出现"，也可以让乘客提前知道影响下游行程的延误（例如，当已知的delay超过了行程之间的计划停留时间）。
*   各个TripUpdate实体不需要按照它们在区块中被SCHEDULED相同顺序被ADDED到馈送中。例如，如果有`trip_ids`为1，2，和3的行程都属于一个区块，并且vehicle行驶了trip1，然后是trip2，然后是trip3，那么`trip_update`实体可以以任何顺序出现 - 例如，允许添加trip2，然后是trip1，然后是trip3。

## StopTimeUpdate

一个行程更新包括一个或多个对车辆停靠时间的更新，这被称为[StopTimeUpdates](../reference.md#message-stoptimeupdate)。这些可以为过去和未来的停车时间提供。你可以，但不是必须，放弃过去的停车时间。 如果一个过去的`StopTimeUpdate`是指一个预定到达时间在未来的站点（即车辆已经提前通过了该站点），生产者不应该放弃该站点，否则将被认为该站点没有更新。

例如，如果以下数据出现在GTFS-rt反馈中。

*   第4站 - 预测在上午10:18（计划在上午10:20 - 提前2分钟）。
*   第5站 - 预测在上午10:30（预定在上午10:30 - 准时）。

......4号站的预测在上午10:21之前不能从馈电中删除，即使公交车在上午10:18实际经过该站。 如果4号站的`StopTimeUpdate`在上午10:18或10:19从馈电中删除，而预定到达时间是上午10:20，那么消费者应假定4号站在那个时间不存在实时信息，应使用GTFS的时间表数据。

每个[StopTimeUpdate](../reference.md#message-stoptimeupdate)都与一个站点相关联。通常这可以用GTFS stop_sequence或GTFS stop_id来完成。然而，在你为一个没有GTFS行程号的旅程提供更新的情况下，你必须指定stop_id，因为stop_sequence没有价值。stop_id必须仍然引用GTFS中的一个stop_id。如果同一个站名在一个行程中被访问多次，那么stop_sequence应该在该行程中的所有stop_id的StopTimeUpdates中提供。

更新可以使用[StopTimeEvent](../reference.md#message-stoptimeevent)在[StopTimeUpdates](../reference.md#message-stoptimeupdate)中提供**到达**和/或**离开**某站的确切时间。这应该包含一个绝对的**时间**或一个**延迟**（即从预定时间的一个偏移，以秒为单位）。延迟只能在行程更新是指预定的GTFS行程，而不是基于频率的行程的情况下使用。在这种情况下，时间应该等于计划时间+延迟。你也可以和[StopTimeEvent](../reference.md#message-stoptimeevent)一起指定预测的**不确定性**，这在下面的[不确定性](#uncertainty)部分有更详细的讨论。

对于每个[StopTimeUpdate](../reference.md#message-stoptimeupdate)，默认的计划关系是**计划**。(注意，这与行程的计划关系不同）。你可以把它改成**跳过**，如果这一站不会被停，或者**没有数据**，如果你只有部分行程的实时数据。

**更新应该按车站顺序**（或按行程中出现的顺序）**进行排序**。

如果行程中缺少一个或多个站点，更新的`delay`（或者，如果更新中只提供`time`，通过比较`time`和GTFS计划时间计算的延迟）会传播到所有后续的站点。这意味着，在没有任何其他信息的情况下，更新某一站的停靠时间将改变所有的后续站点。请注意，日程关系为`SKIPPED`的更新不会停止延迟传播，但日程关系为`SCHEDULED`（如果没有提供日程关系，也是默认值）或`NO_DATA`的更新会停止。

**例子1**

对于一个有20个站点的旅程，一个[StopTimeUpdate](../reference.md#message-stoptimeupdate)，其到达延迟和离开延迟为0[（StopTimeEvents](../reference.md#message-stoptimeevent)），对于当前站点的stop_sequence，意味着这个旅程是完全准时的。

**例子2**

对于同一个行程实例，提供三个[StopTimeUpdates](../reference.md#message-stoptimeupdate)。

*   stop_sequence 3的延迟为300秒
*   stop_sequence 8的延迟为60秒
*   Stop_sequence 10的[ScheduleRelationship](../reference.md#enum-schedulerelationship)为`NO_DATA`

这将被解释为。

*   stop_sequence 1,2有未知的延迟。
*   stop_sequence 3,4,5,6,7有300秒的延迟。
*   stop_sequences 8,9有60秒的延迟。
*   stop_sequences 10,...,20有未知的延迟。

## TripDescriptor

TripDescriptor所提供的信息取决于你正在更新的行程的计划关系。有许多选项供你设置。

| _**价值**_ | _**评论**_                                                           |
| -------- | ------------------------------------------------------------------ |
| **Scheduled**  | 这个行程是根据GTFS计划运行的，或者足够接近，仍然与它相关。                                    |
| **Added**  | 这个行程没有安排，已经被添加。例如，为了应付需求，或替换一个坏掉的车辆。                               |
| **Unscheduled** | 这个行程正在运行，但从未与一个时间表相关联。例如，如果没有时间表，公共汽车运行在班车服务上。                     |
| **Canceled**  | 这个行程曾经安排过，但是现在被取消了。                                                |
| **Duplicated**  | 这个新行程是静态GTFS中现有行程的副本，除了服务开始日期和时间。新行程将在TripProperties中指定的服务日期和时间运行。 |

在大多数情况下，你应该提供这个更新所涉及的GTFS中计划行程的行程编号。

#### 使用重复的行程编号的系统

对于使用重复的行程编号的系统，例如使用frequencies.txt建模的行程，即基于频率的行程，行程编号本身并不是一个单一行程的唯一标识，因为它缺乏具体的时间成分。为了在TripDescriptor中唯一地识别这些行程，必须提供三重标识符。

*   **trip_id**
*   **start_time**
*   **start_date**

start_time应该是第一次发布，任何后续的信息更新在提到同一旅程时应该使用相同的start_time。StopTimeUpdates应该被用来表示调整；start_time不一定要精确到从第一站出发的时间，尽管它应该非常接近这个时间。

例如，假设我们在2015年5月25日10:00决定一个行程的id=T将在start_time=10:10:00开始，并在10:01通过realtime feed提供这个信息。到了10:05，我们突然知道旅行将不是在10:10开始，而是在10:13开始。在我们新的实时反馈中，我们仍然可以识别这个行程为(T, 2015-05-25, 10:10:00)，但是提供一个StopTimeUpdate，在10:13:00从第一站出发。

#### 替代的行程匹配

不是基于频率的旅行也可以通过旅行描述符（TripDescriptor）唯一识别，包括以下组合。

*   **route_id**
*   **direction_id**
*   **start_time**
*   **start_date**

其中start_time是在静态时间表中定义的预定开始时间，只要提供的id组合能解决一个唯一的行程。

## 不确定性

不确定性同时适用于[StopTimeUpdate](../reference.md#message-stoptimeupdate)的时间和延迟值。不确定度大致指定了真实延迟的预期误差，以秒为单位的整数（但是注意，精确的统计意义还没有定义）。不确定度有可能为0，例如在计算机定时控制下的列车。

例如，一辆长途巴士估计延迟15分钟，在4分钟的误差范围内（即+2/-2分钟）到达下一站，其不确定性值为240。
