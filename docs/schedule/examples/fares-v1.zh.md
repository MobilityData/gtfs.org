---
search:
  exclude: true
---

# Fares V1

<hr/>

由[fare_attributes.txt](../../reference/#fare_attributestxt)和[fare_rules.txt](../../reference/#fare_rulestxt)组成，Fares V1历来是描述GTFS中票价信息的官方方法。然而，这两个文件在有效描述因素的广度上是有限的，而且实施起来也很含糊。[Fares V2](../../examples/fares-v2/)是一个正在积极开发的扩展项目，它旨在解决Fares V1的限制。

## 定义一个机构的票价规则

如果乘客使用PRESTO卡支付，在多伦多交通委员会的地铁网络上的trip费用为3.20加元。乘客还可以在两小时内转乘TTC运营的其他地铁、有轨电车或公交线路。

这项服务可以用文件[fare_attributes.txt](../../reference/#fare_attributestxt)、[fare_rules.txt](../../reference/#fare_rulestxt) 和[transfers.txt](../../reference/#transferstxt) 来表示。第一个文件，[fare_attributes.txt](../../reference/#fare_attributestxt)描述了该机构的票价，下面是presto票价的例子。

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- 车费的价格列在价格和`currency_type`下
- 乘客必须在上车前在车站检票口支付车费。这由`payment_method=1`表示。
- 转乘字段留空，代表无限制的转乘。
- `Transfer_duration`字段对应于2小时的换乘窗口（以秒为单位）。

第二个文件，[fare_rules.txt](../../reference/#fare_rulestxt)通过将票价与路线以及该路线的起点/终点联系起来，为旅程分配票价。

为此，下面在[routes.txt](../../reference/#routestxt)中定义了两条地铁线路。

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

在这个例子中，Bloor-Yonge站的换乘被建模。为此，该站被建模为两个独立的站点，第一个是Bloor站，由1号线提供服务，第二个是Yonge站，由2号线提供服务。两者都有`zone_id=ttc_subway_stations`，以便将所有地铁站归入一个票价区。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

在[fare_rules.txt](../../reference/#fare_rulestxt) 中，PRESTO 票价与地铁线路和车站的关系如下。

- 对于`票价_id=presto_fare`，乘客可以在1号线的任何两个车站之间旅行`（routine_id=line1`），并且`origin_id=ttc_subway_stations`和`destination_id=ttc_subway_stations`。

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

第三个文件，[transfers.txt](../../reference/#transferstxt)定义了不同线路之间的换乘点。为了模拟Bloor-Yonge站的换乘，需要两个条目。

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- 第一个模型是用`from_route_id`和`to_route_id`从Bloor站到Yonge站从1号线换乘到2号线。
- 第二个模型是用`from_route_id`和`to_route_id`从Yonge站到Bloor站从2号线换乘到1号线。
- `transfer_type`的值为`0`，因为对换乘没有特别的要求和考虑。

[例子来源](https://www.ttc.ca/Fares-and-passes)
