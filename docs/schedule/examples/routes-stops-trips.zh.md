---
search:
  exclude: true
---

# 路线、站点和行程

<hr/>

## 路由

路线是固定路线交通运营的核心，因为它们描述了交通网络的地理范围。在GTFS中，定义路线是描述公交机构运营的第一步。

第一步是添加机构信息，如下面文件[agency.txt](../../reference/#agencytxt)中所示。该文件包含关于该机构的高水平信息。

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
    CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000

Calgary Transit 在AB省卡尔加里市经营轻轨、快速公交、普通公交、准公交和按需公交。在这个例子中，定义了两条线路，第一条是公共汽车，第二条是轻轨。使用[routes.txt](../../reference/#routestxt)文件，每条路线都被分配了一个唯一的id，以及一个短名称和一个长名称，以便于人阅读。

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
    CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
    CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff

第五个字段 (`route_type`）是用来区分路线的类型。

- 第一条是公共汽车，因此`route_type=3`
- 第二条是轻轨，因此`route_type=0`
- `route_type`的完整列表可以[在这里](../../reference/#routestxt)找到。

其余的字段包含额外的信息，如路线的特定URL，以及机构特定的颜色，在地图上表示服务。

<hr/>

## 车站

在GTFS中，站点和车站是用[stops.txt](../../reference/#stopstxt)文件描述的，下面的第一条记录中定义了一个公共汽车站，第二条记录中定义了一个轻轨站。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
    8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
    6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,1

- `stop_id`是一个唯一的标识符
- `stop_code`和`stop_name`通常包含面向乘客的信息
- 使用坐标（`stop_lat`和`stop_lon`）提供确切的位置。
- 第六个字段（`location_type`）用于区分站点和车站。
- 第一条记录对应的是一个公交车站，因此`location_type=0`
- 第二条记录对应的是车站，因此`location_type=1`。
- 关于`location_type`值的完整列表可以[在这里](../../reference/stopstxt)找到。

<hr/>

## 车次

在描述了该机构的线路后，现在可以描述每条线路所服务的车次。

首先，需要用[calendar.txt](../../reference/#calendartxt)来定义服务时间跨度。

[**calendar.txt**](../../reference/#calendartxt)

    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    weekend_service,0,0,0,0,0,1,1,20220623,20220903

这里描述的是只在周六和周日运行的服务，所以这些天的字段被填充为1，其余日子的字段被填充为0。这项服务从2022年6月23日开始，到2022年9月3日结束，如字段`start_date`和`end_date`下所示。

在这个例子中，文件[trips.txt](../../reference/#tripstxt)描述了3个周末的行程，这些行程由上面描述的MAX橙色路线提供。

[**trips.txt**](../../reference/#tripstxt)

    route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
    303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
    303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
    303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027

- 从[routes.txt](../../reference/#routestxt)中列出了与MAX Orange对应的`route_id`。
- 列出了[calendar.txt](../../reference/#calendartxt)中与周末相对应的`service_id`。
- 每条记录都包含每个行程的唯一id提供车头标志文本，这就是通常显示在巴士内部和外部的标志上的内容。
- `direction_id`字段允许区分同一路线上不同方向的车次。例如，区分进站和出站的车次，或南行和北行的车次。
- 在这种情况下，往Saddletowne方向的车次，`direction_id=0`，往Brentwood方向的车次，`direction_id=1`。direction_id中的值没有内在的意义，它们只是用来指定一个旅行方向与另一个旅行方向。
- [shapes.txt](../../reference/#shapestxt)中的`shape_id`，对应于往Saddletowne方向的MAX Orange路线，被列在第一条记录中，MAX Orange往Brentwood方向的路线被列在第二和第三条记录中。

`shape_id=3030026`对应于朝向Saddletowne的MAX Orange。下面的文件包括勾勒路线的点的信息以及这些点之间的距离。有了这些信息，就有可能在地图上绘制路线，用于trip规划或分析目的。

[**shapes.txt**](../../reference/#shapestxt)

    shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
    3030026,51.086506,-114.132259,10001,0.000
    3030026,51.086558,-114.132371,10002,0.010
    3030026,51.086781,-114.132865,10003,0.052
    3030026,51.086938,-114.133179,10004,0.080
    3030026,51.086953,-114.133205,10005,0.083
    3030026,51.086968,-114.133224,10006,0.085
    3030026,51.086992,-114.133249,10007,0.088
    3030026,51.087029,-114.133275,10008,0.093
    3030026,51.087057,-114.133286,10009,0.096
    3030026,51.087278,-114.133356,10010,0.121
    3030026,51.087036,-114.132864,10011,0.165
    3030026,51.086990,-114.132766,10012,0.173
    3030026,51.086937,-114.132663,10013,0.183

<hr/>

## 服务例外

可以定义服务的例外情况，如额外服务日（特殊日子）或取消的服务日（如节假日不提供服务）。

例如，如果2022年7月17日星期日没有预定的服务--那么该日期可以通过将服务一分为二从[calendar.txt](../../reference/#calendartxt)的`weekend_service`中删除。

| 服务                 | 开始      | 结尾        |
| ------------------ | ---------- | ---------- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

然而，这使文件变得复杂，因为`service_id`被一分为二，而且这种断裂会连带到[trips.txt](../../reference/#tripstxt)。相反，这可以通过使用[calendar_dates.txt](../../reference/#calendar_datestxt)以更简单的方式完成，如下所示。

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

    service_id,date,exception_type
    weekend_service,20220623,2

- `service_id` `weekend_service`被列出。
- 移除或额外服务的日期列在`date`下（2022年7月17日）。
- 字段`exception_type`被设置为2，这意味着这一天的服务被取消。

[例子来源](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)
