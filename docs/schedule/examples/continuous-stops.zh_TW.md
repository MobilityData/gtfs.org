---
search:
  exclude: true
---

# 連續停止

<hr/>

## 隨處接送

公交機構 The Current（Rockingham, US-VT）對 2、53 和 55 號路線實施連續停車政策。只要公交車有安全的停靠點，就可以在沿途的預定站點之間接送乘客。

文件[routes.txt](../../reference/#routestxt)用於使用字段`continuous_pickup`和`continuous_drop_off`來描述此服務。這些字段設置為`0` ，表示允許連續上車和下車。

[**routes.txt**](../../reference/#routestxt)

    route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
    2,2,Bellows Falls In-Town,3,0,0
    53,53,Bellows Falls / Battleboro Commuter,3,0,0
    55,55,Bellows Falls / Springfield Shuttle,3,0,0

[示例來源](https://crtransit.org/bus-schedules/)

<hr/>

## 在路線的一部分上接送

運輸機構 Victor Valley Transit（Victorville, US-CA）僅對 22 號路線的一部分實施連續停車政策。乘客只能在縣票價區內的任何安全位置上下車。本地票價區內無法連續上車和下車。

Local Fare zone 和 County Fare zone 被 Air Expressway 分開，如下圖所示。預定的停止 National Trails Highway - Air Expressway 位於該邊界的稍北處。準確地說，公交機構可以在公交路線與邊界的實際交匯處增加一個停靠站，從那裡可以連續上下車。此站點可能未安排.

![](../../assets/victor-valley-transit.svg)

這是使用文件[stops.txt](../../reference/#stopstxt)和[stop_times.txt](../../reference/#stoptimestxt):

- 第一個文件定義沿途的站點
- 第二個文件定義了停靠點之間的連續上車和下車規則。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon
    A,Victoriaville Transfer Station,34.514356,-117.318323
    B,Dante St & Venus Ave,34.564499,-117.287097
    C,Victorville Transportation Center,34.538433,-117.294703
    X,Local/County Fare Boundary,34.566224,-117.318357
    D,National Trails Highway - Air Expressway,34.567536,-117.319716
    E,Oro Grande Post Office,34.599292,-117.334452
    F,Silver Lakes Market,34.744662,-117.335407

在[stop_times.txt](../../reference/#stoptimestxt), 對於給定的trip:

- `continuous_pickup=0`的記錄表示從該站到下一站允許連續上車
- `continuous_pickup=1`的記錄表示從該站到下一站禁止連續上車

[**stop_times.txt**](../../reference/#stoptimestxt)

    trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
    22NB9AM,A,1,09:00:00,09:00:00,1,1,1
    22NB9AM,B,2,09:14:00,09:14:00,1,1,1
    22NB9AM,C,3,09:21:00,09:21:00,1,1,1
    22NB9AM,X,4,,,0,0,0
    22NB9AM,D,5,09:25:00,09:25:00,0,0,1
    22NB9AM,E,6,09:31:00,09:31:00,0,0,1
    22NB9AM,F,7,09:46:00,09:46:00,0,0,1

相同的邏輯適用於`continuous_drop_off`字段，但適用於下車的情況。

在上面的示例中，站點 A、B、C 的 continuous_pickup 和`continuous_drop_off`設置為`1` ，這禁止它們之間的連續上車和下車。停靠點`X` 、 `D` 、 `E`和`F`將字段`continuous_pickup`和`continuous_drop_off`設置為`0` ，這允許在它們之間連續上車和下車。

[示例來源](https://vvta.org/routes/route-22/)
