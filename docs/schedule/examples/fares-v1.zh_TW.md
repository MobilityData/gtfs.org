---
search:
  exclude: true
---

# Fares V1

<hr/>

由...組成的[fare_attributes.txt](../../reference/#fare_attributestxt)和[fare_rules.txt](../../reference/#fare_rulestxt) ,Fares V1在歷史上一直是描述票價信息的官方方法GTFS .然而，這兩個文件在它們可以有效描述的因素的廣度上是有限的，並且實施起來不明確。[Fares V2](../../examples/fares-v2/)是一個正在積極開發中的擴展項目，它旨在解決Fares V1 .

## 定義機構的票價規則

一個trip如果乘客使用 PRESTO 卡付款，在多倫多交通委員會的地鐵網絡上的票價為 3.20 加元。乘客還可以在兩小時內轉乘 TTC 運營的其他地鐵、有軌電車或公交線路。

該服務可以使用文件表示[fare_attributes.txt](../../reference/#fare_attributestxt) ,[fare_rules.txt](../../reference/#fare_rulestxt) ， 和[transfers.txt](../../reference/#transferstxt) .第一個文件，[fare_attributes.txt](../../reference/#fare_attributestxt)描述代理機構的票價，以下是 presto 票價的示例：

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- 票價列在 price 和`currency_type`下
- 乘坐地鐵前，乘客必須在車站檢票口繳費。這由`payment_method=1`表示
- transfers字段留空代表無限次轉賬
- 字段`transfer_duration`對應 2 小時的傳輸窗口（以秒為單位）

第二個文件，[fare_rules.txt](../../reference/#fare_rulestxt)通過將票價綁定到路線以及該路線上的起點/目的地來為旅程分配票價。

為此，下面定義了兩條地鐵線[routes.txt](../../reference/#routestxt) :

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

在此示例中，對 Bloor-Yonge 站的換乘進行了建模。為此，該站被建模為兩個獨立的站點，第一個是 1 號線服務的 Bloor 站，第二個是 2 號線服務的 Yonge 站。兩者都有`zone_id=ttc_subway_stations`以便對所有地鐵站進行分組在單一收費區。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

在[fare_rules.txt](../../reference/#fare_rulestxt), PRESTO 票價使用以下關係與地鐵線路和車站相關聯：

- 對於`fare_id=presto_fare` ，乘客可以在 1 號線 ( `route_id=line1` ) 和`origin_id=ttc_subway_stations`和`destination_id=ttc_subway_stations`的任意兩個站點之間移動。

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

第三個文件，[transfers.txt](../../reference/#transferstxt)定義不同路線之間的中轉點。要模擬 Bloor-Yonge 站的換乘，需要兩個條目：

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- 第一個模型從 1 號線轉移到 2 號線使用`from_route_id`和`to_route_id`從 Bloor 站到 Yonge 站
- 第二個模型從 2 號線轉移到 1 號線使用`from_route_id`和`to_route_id`從 Yonge 站到 Bloor 站
- `transfer_type`的值為`0` ，因為沒有針對傳輸的特定要求或註意事項

[示例來源](https://www.ttc.ca/Fares-and-passes)
