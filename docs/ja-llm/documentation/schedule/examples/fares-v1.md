# レガシー運賃 (v1) {: #legacy-fares-v1}

レガシー運賃 (v1) は、GTFS における初期の基本的な運賃モデルであり、限られた運賃要素のみをサポートしています。出発地から目的地までの運賃、ゾーンベースの運賃、路線ベースの運賃構造、そして最小限の乗り換えルールのみを表現することができます。後方互換性のために GTFS に残されていますが、包括的なチケット発行や支払い情報を提供し、より幅広い運賃構造やルールをサポートする [運賃 (v2)](../../examples/fares-v2/) への移行が推奨されます。

[fare_attributes.txt](../../reference/#fare_attributestxt) と [fare_rules.txt](../../reference/#fare_rulestxt) で構成されるレガシー運賃 (v1) は、歴史的に GTFS における運賃情報を記述する公式な方法でした。しかし、この2つのファイルは効率的に記述できる要素の範囲が限られており、実装において曖昧さを含んでいます。

## 事業者の運賃ルールを定義する {: #define-an-agencys-fare-rules}


Toronto Transit Commission（TTC）の地下鉄ネットワークでの1回の便(trip)の運賃は、PRESTOカードを使用して支払う場合、3.20 CAD です。乗客は、2時間以内であれば、TTCが運行する他の地下鉄、ストリートカー、またはバスのルート・路線系統(route)に乗り換えることもできます。

このサービスは、[fare_attributes.txt](../../reference/#fare_attributestxt)、[fare_rules.txt](../../reference/#fare_rulestxt)、および [transfers.txt](../../reference/#transferstxt) を使用して表現することができます。最初のファイル [fare_attributes.txt](../../reference/#fare_attributestxt) は事業者の運賃を記述しており、以下は PRESTO 運賃の例です。

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

```
fare_id,price,currency_type,payment_method,transfers,transfer_duration
presto_fare,3.2,CAD,1,,7200
```

- 運賃の金額は `price` と `currency_type` に記載されます
- 乗客は地下鉄に乗車する前に、駅の改札で運賃を支払わなければなりません。これは `payment_method=1` で表現されます
- `transfers` フィールドは空欄にして、無制限の乗り換えを表現します
- `transfer_duration` フィールドは、2時間の乗り換え可能時間（秒単位）に対応します

2つ目のファイル [fare_rules.txt](../../reference/#fare_rulestxt) は、運賃をルート・路線系統(route)およびそのルート上の出発地/目的地に関連付けることで、旅程(journey)に運賃を割り当てます。  

そのために、以下のように2つの地下鉄路線が [routes.txt](../../reference/#routestxt) に定義されています。

[**routes.txt**](../../reference/#routestxt)

```
agency_id,route_id,route_type
TTC,Line1,1
TTC,Line2,1
```

この例では、Bloor-Yonge 駅での乗り換えをモデル化しています。そのため、この駅は2つの別々の停留所等(stop)としてモデル化されます。1つ目は Line 1 が停車する Bloor Station、2つ目は Line 2 が停車する Yonge Station です。両方とも `zone_id=ttc_subway_stations` を持ち、すべての地下鉄駅を1つの運賃ゾーンにまとめています。  

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_name,stop_lat,stop_lon,zone_id
Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations
```

[fare_rules.txt](../../reference/#fare_rulestxt) では、PRESTO 運賃が以下の関係を用いて両方の地下鉄路線および駅に関連付けられています。

- `fare_id=presto_fare` の場合、乗客は Line 1 (`route_id=line1`) 上の任意の2駅間を、`origin_id=ttc_subway_stations` および `destination_id=ttc_subway_stations` として移動できます。

[**fare_rules.txt**](../../reference/#fare_rulestxt) 

```
fare_id,route_id,origin_id,destination_id
presto_fare,line1,ttc_subway_stations,ttc_subway_stations
presto_fare,line2,ttc_subway_stations,ttc_subway_stations
```

3つ目のファイル [transfers.txt](../../reference/#transferstxt) は、異なるルート間の乗り換えポイントを定義します。Bloor-Yonge 駅での乗り換えをモデル化するためには、2つのエントリが必要です。

[**transfers.txt**](../../reference/#transferstxt) 

```
from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
Bloor,Yonge,line1,line2,0
Yonge,Bloor,line2,line1,0
```

- 1つ目は、Bloor Station から Yonge Station への Line 1 から Line 2 への乗り換えを、`from_route_id` と `to_route_id` を用いてモデル化しています
- 2つ目は、Yonge Station から Bloor Station への Line 2 から Line 1 への乗り換えを、`from_route_id` と `to_route_id` を用いてモデル化しています
- `transfer_type` の値は `0` であり、乗り換えに特別な要件や考慮事項がないことを示しています

<sup>[例の出典](https://www.ttc.ca/Fares-and-passes)</sup>
