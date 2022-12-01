---
search:
  exclude: true
---

<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/continuous-stops.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# 连续停车

<hr/>

## 随处可见的上下车

交通机构The Current (Rockingham, US-VT)在2、53和55号线路上实行连续停靠政策。只要有安全的地方可以停车，乘客就可以在沿途的scheduled站点之间上、下车。

文件[routes.txt](../../reference/#routestxt)使用`continuous_pickup`和`continuous_drop_off`字段来描述这项服务。这些字段被设置为`0`，表示允许连续接送。

[**routes.txt**](../../reference/#routestxt)

    route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
    2,2,Bellows Falls In-Town,3,0,0
    53,53,Bellows Falls / Battleboro Commuter,3,0,0
    55,55,Bellows Falls / Springfield Shuttle,3,0,0

[示例源](https://crtransit.org/bus-schedules/)

<hr/>

## 在路线的某一区段上落车

维克多谷公交公司（Victorville, US-CA）只在22路的一部分实行连续停靠政策。乘客只能在县城收费区的任何安全地点上车和下车。在本地票价区域内，不可能有连续的上下车。

如下图所示，本地票价区和县城票价区被空中高速路隔开。scheduled站点National Trails Highway - Air Expressway位于该边界的稍北处。为了准确起见，公交机构可以在公交线路与边界的实际交汇处增加一个站点，从这里可以连续接送乘客。这个站点可以保持unscheduled。

![](../../assets/victor-valley-transit.svg)

这是用文件[stops.txt](../../reference/#stopstxt)和[stop_times.txt](../../reference/#stoptimestxt)描述的。

- 第一个文件定义了沿线的站点
- 第二个文件定义了各站之间的连续上下车规则。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon
    A,Victoriaville Transfer Station,34.514356,-117.318323
    B,Dante St & Venus Ave,34.564499,-117.287097
    C,Victorville Transportation Center,34.538433,-117.294703
    X,Local/County Fare Boundary,34.566224,-117.318357
    D,National Trails Highway - Air Expressway,34.567536,-117.319716
    E,Oro Grande Post Office,34.599292,-117.334452
    F,Silver Lakes Market,34.744662,-117.335407

在[stop_times.txt](../../reference/#stoptimestxt)中，对于一个特定的trip。

- 记录中的`continuous_pickup=0`表示从该站到下一站允许连续取车。
- 如果记录为`continuous_pickup=1`，则表示从该站到下一站禁止连续取车。

[**stop_times.txt**](../../reference/#stoptimestxt)

    trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
    22NB9AM,A,1,09:00:00,09:00:00,1,1,1
    22NB9AM,B,2,09:14:00,09:14:00,1,1,1
    22NB9AM,C,3,09:21:00,09:21:00,1,1,1
    22NB9AM,X,4,,,0,0,0
    22NB9AM,D,5,09:25:00,09:25:00,0,0,1
    22NB9AM,E,6,09:31:00,09:31:00,0,0,1
    22NB9AM,F,7,09:46:00,09:46:00,0,0,1

同样的逻辑适用于字段`continuous_drop_off`，但是对于下车的情况。

在上面的例子中，A、B、C站的continuous_pickup和`continuous_drop_off`设置为`1`，禁止在它们之间连续取车和下车。`X`、`D`、`E`和`F`站的`continuous_pickup`和`continuous_drop_off`字段被设置为`0`，这允许在它们之间连续取货和卸货。

[例子来源](https://vvta.org/routes/route-22/)
