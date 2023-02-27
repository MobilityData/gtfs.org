---
search:
  exclude: true
---

# 途徑

<hr/>

## 描述車站出入口的位置

和GTFS ，可以使用有關入口和車站內部的信息準確描述車站。此示例描述了溫哥華市中心的 Waterfront 車站部分。該站是該市輕軌網絡的一部分，由加 Canada Line、Expo Line、SeaBus 和 West Coast Express 提供服務。三個街道入口允許騎手進出車站。車站的其餘部分位於地下，設有一個用於驗證票價的大廳層和一個設有站台的較低層。

首先，車站的位置及其入口定義在[stops.txt](../../reference/#pathwaystxt) :

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

在上面的文件中，第一條記錄與站點位置有關，因此`location_type`設置為`1` 。其他五個與三個車站入口有關（需要五個記錄，因為 Granville 入口實際上有三個獨立的入口、一個樓梯、一個自動扶梯和一個電梯）。這五個記錄被定義為入口，因為`location_type`設置為`3` 。

此外，`stop_id` Waterfront Station 的入口列在`parent_station`下，以便將它們與車站相關聯。無障礙入口的`wheelchair_boarding`設置為`1` ，不可訪問的入口設置為`2` 。

## 描述樓梯和自動扶梯

Granville street 的 Waterfront Station 入口有電梯、自動扶梯和樓梯，入口定義為上面的節點[stops.txt](../../reference/#stopstxt).為了將入口連接到車站的內部部分，必須在[stops.txt](../../reference/#pathwaystxt)在 Waterfront Station 的`parent_station`下。在裡面[stops.txt](../../reference/#stopstxt)在下面的文件中，定義了對應於樓梯和自動扶梯底部的通用節點 ( `location_type 3` )。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width="700px"/>

接下來，文件[pathways.txt](../../reference/#pathwaystxt)用於鏈接節點以創建路徑，其中第一個記錄鏈接屬於樓梯頂部和底部的節點。 `pathway_mode`設置為`2`表示樓梯，最後一個字段描述乘客可以在樓梯上雙向（上下）。

同樣，第二條記錄描述了自動扶梯（ `pathway_mode`設置為`4` ）。由於自動扶梯只能沿一個方向移動，因此字段`is_bidirectional`設置為`0` ，因此自動扶梯以單向移動，從節點`96`到`91` （向上）。

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## 描述電梯和通道

Granville 街的電梯將乘客帶到大廳層的一條通道，那裡有自動扶梯和樓梯end.地面層的電梯已經被定義為上面的車站入口（`stop_id` `92` ）。因此，還需要定義大廳層的電梯門。

此外，如下圖所示，在Granville street的樓梯、自動扶梯和電梯底部還有一條地下走道連接到主站大樓。因此，創建了兩個額外的節點來定義人行道部分。

<img class="center" src="../../../assets/pathways-2.png" width="500px"/>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width="500px"/>

最後，將節點連接在一起以定義地下通道，如文件中所示[pathways.txt](../../reference/#pathwaystxt)以下：

[pathways.txt](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
