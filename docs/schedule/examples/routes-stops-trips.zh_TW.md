---
search:
  exclude: true
---

# 路線、站點和行程

<hr/>

## 航線

路線是固定路線運輸運營的核心，因為它們描述了運輸網絡的地理範圍。在GTFS ，定義路線是描述運輸機構運營的第一步。

第一步是添加代理信息，如文件中所示[agency.txt](../../reference/#agencytxt)以下。此文件包含有關該機構的高級信息。

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
    CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000

Calgary Transit 在艾伯塔省卡爾加里經營 LRT、BRT、定期巴士服務、輔助客運和按需運輸。在此示例中，定義了兩條路線，第一條是公共汽車，第二條是輕軌。使用文件[routes.txt](../../reference/#routestxt)，每條路線都分配了一個唯一的id , 和一個短名稱以及一個人類可讀性的長名稱。

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
    CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
    CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff

第五個字段（`route_type`) 用於區分路由類型：

- 第一個是公共汽車，因此`route_type=3`
- 第二個是輕軌，因此`route_type=0`
- 完整的值列表`route_type`可以在[這裡](../../reference/#routestxt)找到

其餘字段包含其他信息，例如url特定於路線以及特定於機構的顏色以在地圖上表示服務。

<hr/>

## 停止

在GTFS , 停靠站和車站使用文件進行描述[stops.txt](../../reference/#stopstxt)，下面，第一個記錄中定義了一個公共汽車站，第二個記錄中定義了一個輕軌站。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
    8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
    6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,0

- `stop_id`是唯一標識符
- `stop_code`和`stop_name`通常包含面向騎手的信息
- 使用坐標（ `stop_lat`和`stop_lon` ）提供確切位置
- 第六個字段 ( `location_type` ) 用於區分站點和站點
- 第一條記錄對應一個公交車站，因此`location_type=0`
- 第二條記錄對應車站，因此`location_type=1`
- 可以在[此處](../../reference/stopstxt)找到`location_type`值的完整列表

<hr/>

## 行程

在描述機構的路線之後，現在可以描述每條路線所服務的行程。

首先，需要定義服務範圍[calendar.txt](../../reference/#calendartxt) .

[**calendar.txt**](../../reference/#calendartxt)

    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    weekend_service,0,0,0,0,0,1,1,20220623,20220903

此處描述了僅在周六和周日運行的服務，因此這些天的字段填充為 1，其余天的字段填充為零。該服務從 2022 年 6 月 23 日到 2022 年 9 月 3 日運行，如字段下方所示`start_date`和`end_date` 。

在這個例子中，文件[trips.txt](../../reference/#tripstxt)描述了由上述 MAX Orange 路線提供服務的 3 次週末旅行。

[**trips.txt**](../../reference/#tripstxt)

    route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
    303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
    303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
    303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027

- 這`route_id`從[routes.txt](../../reference/#routestxt)列出對應於 MAX Orange 的
- 這`service_id`從[calendar.txt](../../reference/#calendartxt)列出對應於週末的
- 每條記錄都包含一個唯一的id為每次旅行提供車頭標誌文字，通常顯示在巴士內外的標誌上

- 場`direction_id`允許區分同一路線的不同方向的行程。例如，區分入境旅行和出境旅行 - 或南行旅行和北行旅行。
- 在這種情況下，前往 Saddletowne 的行程的`direction_id=0`和前往 Brentwood 的行程的`direction_id=1` 。中的值direction_id沒有內在含義，它們僅用於指定一個行進方向與另一個行進方向
- 這`shape_id`從[shapes.txt](../../reference/#shapestxt)對應於通往 Saddletowne 的 MAX Orange 路線的路線被列為第一條記錄，而對應於通往 Brentwood 的 MAX Orange 路線的路線被列為第二和第三條記錄

`shape_id=3030026`對應於 Saddletowne 的 MAX Orange。下面的文件包含有關勾勒路線的點以及這些點之間的距離的信息。有了這些信息，就可以在地圖上繪製路線trip規劃或分析目的。

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

## 服務異常

可以定義服務的例外情況，例如added服務日（特殊日）或取消服務日（如節假日不提供服務）。

例如，如果沒有預定的 2022 年 7 月 17 日星期日的服務 - 然後可以從`weekend_service`中刪除該日期[calendar.txt](../../reference/#calendartxt)通過將服務一分為二：

| 服務                 | start      | end        |
| ------------------ | ---------- | ---------- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

但是，這會使文件複雜化，因為`service_id`被分成兩半，這個休息將級聯到[trips.txt](../../reference/#tripstxt) .相反，這可以使用更簡單的方式完成[calendar_dates.txt](../../reference/#calendar_datestxt)如下所示：

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

    service_id,date,exception_type
    weekend_service,20220623,2

- 這`service_id` `weekend_service`已列出
- 刪除日期或added服務列在`date` （2022 年 7 月 17 日）下
- 字段`exception_type`設置為 2，表示這一天移除服務

[示例來源](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)
