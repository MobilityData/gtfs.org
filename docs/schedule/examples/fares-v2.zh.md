---
search:
  exclude: true
---

# Fares V2

<hr/>

Fares V2是一个GTFS扩展项目，旨在解决Fares V1的限制。这个扩展项目正在迭代中被采用，下面的例子显示了使用官方规范中已经采用的Fares V2的部分可以建模的内容。请参阅[扩展](../../../extensions)部分中关于Fares V2扩展项目的更多信息。

在此期间，生产者可以在同一数据集中实施Fares V2和实施Fares V1，因为这两者之间不存在技术冲突。消费者可以选择独立使用哪一个实现。随着Fares V2的采用和充分认可，Fares V1在未来可能会被废弃。

## 定义一个交通票价

在多伦多，有几种支付票价的方式来使用TTC公交系统。TTC根据支付方式的不同，提供两种票价选择。如果使用PRESTO卡， 成人票价为3.20加元，而 如果用现金支付，同样的票价为3 .25加元。

公交车票或票价可以用[fare_products.txt](../../reference/#fare_productstxt)文件来描述。每个条目都对应着一个特定的票价。

[**fare_products.txt**](../../reference/#fare_productstxt)

    fare_product_id,fare_product_name,amount,currency
    presto_fare,PRESTO Card Fare,3.2,CAD
    cash_fare,Cash Fare,3.25,CAD

[例子来源](https://www.ttc.ca/Fares-and-passes)

<hr/>

## 描述同一票价区的服务地点

一些公交机构实行基于区域的票价结构。票价区是划分的地理区域，与不同的票价相关。无论他们是在一个区域内旅行还是从一个区域到另一个区域，公交乘客都需要知道正确的票价。在多伦多的TTC系统中，只有一个票价区。公交乘客只需为多伦多市范围内的任何trip距离支付相同的单程票价，无论使用哪种交通形式。

票价区可以用[stops_areas.txt](../../reference/#stops_areastxt)文件来描述，该文件将[stops.txt](../../reference/#stopstxt)txt中的站点分配给[areas.txt](../../reference/#areastxt)。

首先，确定区域（票价区）。

[**areas.txt**](../../reference/#areastxt)

    area_id,area_name
    ttc_service_area,TTC Fare Zone

之后，使用[stops.txt](../../reference/#stopstxt)文件中的`stop_id`，将站点组合到其各自确定的区域（票价区）。

[**stops_areas.txt**](../../reference/#stops_areastxt)

    area_id,stop_id
    ttc_service_area,262
    ttc_service_area,263
    ttc_service_area,264
    ttc_service_area,265
    ttc_service_area,266
    …

[例子来源](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)

<hr/>

## 为单程旅行建立规则

在GTFS中，一个票价段对应于乘客不在不同的模式、路线、网络或机构之间转车的trip。单一票价允许乘客在TTC网络内的任何一对公交站、地铁站和有轨电车站内旅行。

腿组定义了网络内从一个起点到一个目的地的旅行（如果区域ID与分组站点相对应，则是一组起点到一组目的地）。下面的文件描述了在TTC网络内任何地方旅行的两条规则。第一条规则对应于使用PRESTO票价出行，第二条对应于使用现金票价出行。

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

    leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
    ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
    ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare

[例子来源](https://www.ttc.ca/Fares-and-passes)

<hr/>

## 为换乘建立规则

使用PRESTO卡乘坐TTC的乘客有2小时不受限制的换乘时间。这意味着他们可以在2小时的时间范围内，在该机构的公共汽车、地铁和有轨电车之间无限次换乘。

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

    from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
    ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer

上面的文件在GTFS中用以下字段表示。

- 可以在用PRESTO卡支付的路段之间转车`（ttc_trip_presto`）。
- `transfer_count`被设置为`-1`，因为对允许的转账次数没有限制。
- `duration_limit`被设置为`7200`秒，相当于2小时。
- `duration_limit_type`被设定为`3`，因为乘客在进入付费区或登上公共汽车或有轨电车时，必须立即拍下他们的PRESTO卡。这相当于当前行程的arrival票价验证和下一行程的arrival票价验证。
- `fare_transfer_type`被设置为`0`，因为乘客只需支付第一笔票价。在2小时窗口内转车没有转车费或第二次车费。因此，成本可以被模拟为第一笔车费和转车费的总和。
- 转车费被设定为零，因为在TTC系统内转车是免费的。这是由`fare_product_id=free_transfer`来表示的。

[例子来源](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)
