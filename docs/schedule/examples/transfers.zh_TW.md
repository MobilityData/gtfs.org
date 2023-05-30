# 接送服務

<hr/>

## 大宗轉賬

當一組行程滿足以下條件時，可以使用塊轉移，也稱為座位轉移：

1. 行程是連續的。
2. 同一輛車運行兩次行程。
3. 這些`block_id`在[trips.txt](../../reference/#tripstxt) 中轉提要中的文件。

### 使用`block_id`啟用塊傳輸

如果路線是環線，則可以在不同路線或同一路線上的連續行程之間進行分段換乘。使用`block_id`字段指定哪些行程在一個街區中，以及座位內接送是可用選項的位置。

例如，考慮以下[trips.txt](../../reference/#tripstxt) 和[stop_times.txt](../../reference/#stoptimestxt)價值觀：

[**trips.txt**](../../reference/#tripstxt)

| route_id | trip_id  |  block_id |
| -------- | -------- | --------- |
| RouteA      | RouteATrip1 |  Block1   |
| RouteB      | RouteBTrip1 |  Block1   |

[**stop_times.txt**](../../reference/#stoptimestxt)

| trip_id  | arrival_time      | departure_time    | stop_id | stop_sequence |
| -------- | --------- | --------- |---------| ------ |
| RouteATrip1 | 12:00:00  |  12:01:00 | A       | 1      |
| RouteATrip1 |  12:05:00 |  12:06:00 | B       | 2      |
| RouteATrip1 |  12:15:00 |           | C       | 3      |
| RouteBTrip1 |           |  12:18:00 | C       | 1      |
| RouteBTrip1 |  12:22:00 |  12:23:00 | D       | 2      |
| RouteBTrip1 |  12:30:00 |           | E       | 3      |

在這個例子中：

- 搜索從站點 A 到站點 E 的路線的用戶被引導在路線 A 上的 12:00 在站點 A 上車，並在`RouteATrip1`結束後到達站點 C 時留在車輛上。這是因為同一車輛為路線 B 服務`RouteBTrip1` 。
- `RouteATrip1`上的乘客如果想繼續在`RouteBTrip1`上停靠，可以留在車輛上進行此次換乘。
- 沿這些相同路線乘坐其他車輛的其他行程的乘客沒有此選項，因為他們每次行程使用不同的車輛。

### 循環線路中的塊傳送

在循環線路中，行程的第一站和最後一站相同且具有相同的`stop_id` .如果連續的循環行程具有相同的`block_id` ，則啟用塊或座位轉移，這可以讓第一次行程的乘客在下一個循環繼續時留在車輛上。
