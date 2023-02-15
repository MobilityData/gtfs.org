# 饲料实体

GTFS Realtime支持三种不同类型的实时数据，它们可以在单个实时馈送中进行组合。下面给出了摘要，在相关部分给出了完整的文档。

## Trip Updates

#### "X路公交车延误了5分钟"

旅程更新表示时间表的波动。我们希望收到你安排的所有可实时使用的行程的trip updates。这些更新将提供沿途各站的预计到达或出发时间。Trip updates也可以提供更复杂的情况，即行程被取消，被添加到时间表中，甚至被改变路线。

[更多关于Trip Updates...](trip-updates.md)

## Service Alerts

#### "Y站因施工而关闭"

Service alerts代表了某一特定实体的更高层次的问题，通常是以文本描述的形式出现的中断。

它们可以代表以下问题。

*   车站
*   线路
*   整个网络
*   等。

一个Service alerts通常包括一些描述问题的文本，我们也允许提供更多信息的URL，以及更多结构化的信息，以帮助我们了解这个service alerts影响到谁。

[更多Service Alerts...](service-alerts.md)

## Vehicle Position

#### "该巴士在Y时间位于X位置"

Vehicle positions代表了网络上某一特定车辆的一些基本信息。

最重要的是车辆所处的经度和纬度，但我们也可以提供车辆的当前速度和里程表读数的数据。

[更多关于Vehicle Positions更新...](vehicle-positions.md)

## 饲料类型的历史评论

早期版本的GTFS Realtime规范要求每个订阅只包含单一类型的实体。在Bliksem Labs[gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py)GitHub仓库中，有一个将合并后的模式转换为每个类型的feed的例子工具。
