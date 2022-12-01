---
search:
  exclude: true
---

# 運賃v2

<hr>

Fares v2 は Fares v1 の制限を解決することを目的とした GTFS 拡張プロジェクトです。 この拡張プロジェクトは繰り返し採用されており、以下の例は Fares v2 のうち正式仕様に採用された部分を用いてモデリングできるものです。Fares v2拡張プロジェクトの詳細については、[拡張機能の](../../../extensions)セクションを参照してください。

暫定的に，製作者はFares v2をFares v1の実装と並行して同じデータセットに実装することができる．Fares v2が採用され、十分な支持を得た場合、Fares v1は将来的に非推奨となる可能性があります。

## 乗り換え運賃の定義

トロントの交通機関であるTTCを利用するには、運賃を支払う方法がいくつかあります。TTC は、支払い方法によって、運賃の価格を 2 種類用意しています。PRESTO カードで支払うと大人3.20CAD、 現金で支払うと同3 .25CADとなります。

乗り換えのチケットや運賃は、[fare_products.txtという](../../reference/#fare_productstxt)ファイルに記述することができます。各項目は、特定の運賃に対応しています。

[fare_products.txt](../../reference/#fare_productstxt)

    fare_product_id,fare_product_name,amount,currency
    presto_fare,PRESTO Card Fare,3.2,CAD
    cash_fare,Cash Fare,3.25,CAD

[ソース例](https://www.ttc.ca/Fares-and-passes)

<hr>

## 同じ運賃帯のサービス場所を記述する

一部の交通機関では、ゾーンベースの運賃体系を採用しています。運賃ゾーンは、異なる運賃価格に関連する地理的な領域を分割したものです。1つのゾーン内を移動する場合でも、あるゾーンから別のゾーンへ移動する場合でも、乗り換え客は正しい運賃を知る必要があります。トロントのTTCでは、運賃ゾーンは1つだけです。トロント市内の移動であれば、どの交通機関を利用しても、同じ運賃を支払えばよいのです。

運賃ゾーンは[stops_areas.txt](../../reference/#stops_areastxt)ファイルを使って記述することができます。[stops.txtから](../../reference/#stopstxt) [areas.txtに](../../reference/#areastxt)停留所を割り当てることで、運賃ゾーンを表現することができます。

まず、エリア（運賃ゾーン）を特定する。

[**areas.txt**](../../reference/#areastxt)

    area_id,area_name
    ttc_service_area,TTC Fare Zone

その後、[stops.txt](../../reference/#stopstxt)ファイルから`stop_idを`使用して、特定されたエリア（運賃ゾーン）ごとに停留所をまとめます。

[**stops_areas.txt**](../../reference/#stops_areastxt)

    area_id,stop_id
    ttc_service_area,262
    ttc_service_area,263
    ttc_service_area,264
    ttc_service_area,265
    ttc_service_area,266
    …

[ソース例](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)

<hr>

## シングルレッグの旅のルールを作る

GTFSでは、運賃のレッグとは、異なる交通手段、ルート、ネットワーク、機関間で乗り換えることなく移動することを指します。1回の運賃で、TTCのネットワーク内のバス停、地下鉄駅、路面電車駅のどのペア内でも移動することが可能です。

脚グループは、出発地から目的地（またはエリアIDがグループ化された停止に対応している場合は、目的地のセットに起点のセット）までのネットワーク内の旅行を定義します。以下のファイルでは、TTCのネットワーク内のどこにでも移動できる2つのルールを説明しています。最初のルールはさきがけ運賃での移動に対応し、2つ目のルールは現金運賃での移動に対応します。

[**運賃規則(fare_leg_rules.txt)**](../../reference/#fare_leg_rulestxt)

    leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
    ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
    ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare

[ソース例](https://www.ttc.ca/Fares-and-passes)

<hr>

## 乗り換えのルールを作る

PRESTOカードでTTCを利用する場合、2時間の乗り換え自由時間があります。つまり、2時間以内であれば、バス、地下鉄、路面電車を何度でも乗り換えることができるのです。

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

    from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
    ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer

上のファイルは、これをGTFSで以下のフィールドで表現しています。

- PRESTOカードで決済された脚との間で乗り換えが可能`(ttc_trip_presto`)
- `転送回数に制限がないため、transfer_count`は`-1`に設定されています。
- `duration_limitは` `7200`秒（2時間相当）に設定されます。
- `duration_limit_typeは` `3`である。これは、運賃支払区間に入ったとき、あるいはバスや路面電車に乗車したときに、さきがけカードをタップしなければならないからである。これは、現在のレグの到着運賃確認と次のレグの到着運賃確認に相当する。
- ライダーは最初の運賃のみを支払うので、`fare_transfer_typeは` `0に`設定される。2時間以内の乗り換えには、乗り換え料金や2回目の運賃は発生しない。したがって、コストは初乗り運賃と乗り換え手数料の合計としてモデル化することができる。
- 乗り換え料金は、TTCシステム内では無料であるため、ゼロに設定されている。これは、`fare_product_id=free_transferで`示されます。

[ソース例](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)
