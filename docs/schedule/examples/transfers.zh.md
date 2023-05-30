# 转移

<hr/>

## 区块转移

当一组车次满足以下条件时，可以进行整批转移，也叫座内转移：

1. 这些车次是连续的。
2. 两个车次都由同一辆车操作。
3. 这些行程在转运资料中的[trips.txt](../../reference/#tripstxt)文件中以相同的`block_id`值被提供。

### 使用`block_id`来启用整批换乘

在不同的路线上的连续车次之间，或在同一路线上（如果路线是循环线）的连续车次之间，可以进行区段转移。使用`block_id`字段来指定哪些车次是在一个区段内，以及座位内换乘是一个可用的选项。

例如，考虑以下[trips.txt](../../reference/#tripstxt)和[stop_times.txt](../../reference/#stoptimestxt)值：

[**trips.txt**](../../reference/#tripstxt)

| route_id | trip_id     | block_id |
| -------- | ----------- |----------|
| RouteA      | RouteATrip1    | Block1      |
| RouteB      | RouteBTrip1 | Block1      |

[**stop_times.txt**](../../reference/#stoptimestxt)

| trip_id     | arrival_time    | departure_time     | stop_id | stop_sequence |
| ----------- | -------- | -------- | ------- | ------------- |
| RouteATrip1    | 12:00:00 | 12:01:00 | A       | 1             |
| RouteATrip1    | 12:05:00 | 12:06:00 | B       | 2             |
| RouteATrip1    | 12:15:00 |          | C       | 3             |
| RouteBTrip1 |          | 12:18:00 | C       | 1             |
| RouteBTrip1 | 12:22:00 | 12:23:00 | D       | 2             |
| RouteBTrip1 | 12:30:00 |          | E       | 3             |

在这个例子中：

- 一个搜索从A站到E站的路线的用户被指示在12:00在A站登上路线A，并在`RouteATrip1`结束后到达C站时留在车辆上。这是因为同一辆车为B线提供`RouteBTrip1`的服务。
- 乘坐`RouteATrip1`的乘客如果想继续前往`RouteBTrip1`的一个站点，可以留在车上进行这次换乘。
- 在这些相同线路上乘坐其他车辆的乘客则没有这个选择，因为他们每次出行都使用不同的车辆。

### 循环线中的街区换乘

在一个环形线路中，一个行程的第一站和最后一站是相同的，并且有相同的`stop_id`。只要连续的环线车次有相同的`block_id`，就可以启用区段或座内换乘，这可以让第一个车次的乘客在继续下一个环线时留在车辆上。
