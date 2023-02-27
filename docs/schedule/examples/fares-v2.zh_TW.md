---
search:
  exclude: true
---

# Fares V2

<hr/>

Fares V2是一個GTFS旨在解決以下局限性的擴展項目Fares V1 .這個擴展項目正在迭代中被採用，下面的示例顯示了可以使用的部分建模的內容Fares V2已被正式規範採用。查看有關的更多信息Fares V2[擴展](../../../extensions)部分中的擴展項目。

在此期間，生產者可以實施Fares V2隨著實施Fares V1在同一數據集中，兩者之間不存在技術衝突。消費者將可以選擇獨立於另一個實現消費。通過採用和充分認可Fares V2 ,Fares V1將來可能會被棄用。

## 定義過境票價

在多倫多使用 TTC 公交系統有幾種支付票價的方式。 TTC 根據付款方式提供兩種票價選擇。如果使用 PRESTO 卡，成人票價為 3.20 加元，而如果使用現金支付，成人票價為3.25 加元。

可以使用[fare_products.txt](../../reference/#fare_productstxt)文件。每個條目對應一個特定的票價。

[**fare_products.txt**](../../reference/#fare_productstxt)

    fare_product_id,fare_product_name,amount,currency
    presto_fare,PRESTO Card Fare,3.2,CAD
    cash_fare,Cash Fare,3.25,CAD

[示例來源](https://www.ttc.ca/Fares-and-passes)

<hr/>

## 描述同一票價區內的服務地點

一些運輸機構採用基於區域的票價結構。票價區是與不同票價相關聯的劃分地理區域。無論他們是在一個區域內旅行還是從一個區域到另一個區域，過境乘客都需要知道正確的票價。在多倫多的 TTC 系統中，只有一個收費區。無論使用哪種交通方式，在多倫多市範圍內的任何行程距離，過境乘客只需支付相同的單程票價。

可以使用[stops_areas.txt](../../reference/#stops_areastxt)文件來描述票價區，該文件從[stops.txt](../../reference/#stopstxt)至[areas.txt](../../reference/#areastxt) .

首先，確定區域（收費區）。

[**areas.txt**](../../reference/#areastxt)

    area_id,area_name
    ttc_service_area,TTC Fare Zone

之後，使用`stop_id`來自[stops.txt](../../reference/#stopstxt) 文件，組一起停在各自的識別區域（收費區）。

[**stops_areas.txt**](../../reference/#stops_areastxt)

    area_id,stop_id
    ttc_service_area,262
    ttc_service_area,263
    ttc_service_area,264
    ttc_service_area,265
    ttc_service_area,266
    …

[示例來源](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)

<hr/>

## 為單程旅行製定規則

在GTFS ，票價段對應於乘客在不在不同模式、路線、網絡或機構之間換乘的情況下進行的旅行。單一票價允許乘客在 TTC 網絡內的任何一對公共汽車站、地鐵站和有軌電車站內旅行。

航段組定義網絡內從起點到終點的行程（如果區域 標識符 對應於分組停靠點，則定義一組起點到一組終點）。下面的文件描述了在 TTC 網絡內任何地方旅行的兩條規則。第一條規則對應於使用 PRESTO 票價旅行，第二條規則對應於使用現金票價旅行。

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

    leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
    ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
    ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare

[示例來源](https://www.ttc.ca/Fares-and-passes)

<hr/>

## 創建傳輸規則

使用 PRESTO 卡乘坐 TTC 的乘客有 2 小時的無限制換乘窗口。這意味著他們可以在 2 小時的時間內無限次地在該機構的公共汽車、地鐵和有軌電車之間換乘。

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

    from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
    ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer

上面的文件表示這個GTFS具有以下字段：

- 可以往返於由 PRESTO 卡 ( `ttc_trip_presto` ) 支付的行程
- 這`transfer_count`設置為`-1` ，因為允許的傳輸次數沒有限制
- 這`duration_limit`設置為`7200`秒，相當於2小時
- `duration_limit_type`設置為`3` ，因為乘客必須在進入付費區或登上公共汽車或有軌電車後立即刷卡。這對應於當前航段的到達票價驗證和下一航段的到達票價驗證。
- `fare_transfer_type`設置為`0` ，因為乘客只需支付第一筆車費。在 2 小時窗口內轉機不收取轉機費或二次票價。因此，成本可以建模為第一筆票價和轉乘費的總和。
- 轉賬費用設置為零，因為它們在 TTC 系統內是免費的。這由`fare_product_id=free_transfer` 。

[示例來源](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)
