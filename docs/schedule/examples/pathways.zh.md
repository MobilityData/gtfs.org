---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/pathways.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# 路径

<hr/>

## 描述车站入口和出口的位置

通过GTFS，可以使用入口和车站内部的信息来准确地描述车站。这个例子描述了温哥华市中心的Waterfront站的部分。该站是该市天铁网络的一部分，有加拿大线、世博线、海上巴士和西海岸快线。三个街道层面的入口允许乘客进入和离开车站。车站的其余部分在地下，有一个用于验票的大厅层和一个带有月台的低层。

首先，车站的位置和它的出入口在[stops.txt](../../reference/#pathwaystxt)中被定义。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

在上述文件中，第一条记录与车站位置有关，因此，`location_type`被设置为`1`。 其他五条记录与车站的三个入口有关（需要五条记录，因为格兰维尔入口实际上有三个独立的入口，一个楼梯，一个自动扶梯和一个电梯）。这五条记录被定义为出入口，因为`location_type`被设置为`3`。

此外，Waterfront站的`stop_id`被列在出入口的`父站`下，以便将它们与车站联系起来。无障碍出入口的`轮椅`设置为`1`，非无障碍出入口的轮椅设置为`2`。

## 描述楼梯和自动扶梯

位于Granville街的Waterfront车站的入口有一个电梯、一个自动扶梯和楼梯，这些入口在[stops.txt](../../reference/#stopstxt)中被定义为上述节点。为了将入口连接到车站的内部区域，必须在Waterfront站的`父站`下的[stops.txt](../../reference/#stopstxt)中创建额外的节点。在下面的[stops.txt](../../reference/#stopstxt)文件中，定义了对应于楼梯和自动扶梯底部的通用节点`（location_type 3`）。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width="700px"/>

接下来，文件[pathways.txt](../../reference/#pathwaystxt)被用来连接节点以创建路径，其中第一条记录连接了与楼梯顶部和底部有关的节点。`pathway_mode`被设置为`2`，表示楼梯，最后一个字段描述了乘客可以在楼梯上双向（向上和向下）行走。

同样地，第二条记录描述了自动扶梯`（pathway_mode`设置为`4`）。由于自动扶梯只能向一个方向移动，字段`is_bidirectional`被设置为`0`，因此自动扶梯单向移动，从节点`96`到`91`（向上）。

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## 描述电梯和路径

格兰维尔街的电梯将乘客带到大厅层的一个通道上，那里是自动扶梯和楼梯end。地面层的电梯已经被定义为上面的一个车站入口`stop_id` `92`）。因此，大厅层的电梯门也需要被定义。

此外，如下图所示，有一条地下人行道将格兰维尔街的楼梯、自动扶梯和电梯的底部与车站主楼相连。因此，需要创建两个额外的节点来定义人行道部分。

<img class="center" src="../../../assets/pathways-2.png" width="500px"/>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width="500px"/>

最后，这些节点被连接在一起，以定义地下通道，如下面的文件[pathways.txt](../../reference/#pathwaystxt)所示。

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
