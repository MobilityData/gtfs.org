# 運賃 - 旧バージョン (v1)

料金 - 旧バージョン (v1) は、限られた運賃要素をサポートする、以前の基本的な GTFS運賃モデルです。出発地から目的地、ゾーンベース、ルートベースの運賃構造と、最小限の乗り換えルールのみをモデル化できます。下位互換性のために GTFS の機能として残っていますが、[運賃(v2)](../../examples/fares-v2/) に移行することを推奨。包括的な発券、支払い情報を提供し、より幅広い運賃構造とルールをサポートするためです。

[fare_attributes.txt](../../reference/#fare_attributestxt) と [fare_rules.txt](../../reference/#fare_rulestxt) で構成されるレガシー運賃(v1) は、歴史的に GTFS で運賃情報を記述するための公式の方法でした。ただし、これら 2 つのファイルは、効率的に記述できる要素の範囲が限られており、実装があいまいです。

## 事業者の運賃規則を定義する

トロント交通委員会の地下鉄ネットワークで乗客が PRESTO カードを使用して支払う場合、乗車料金は3.20カナダドルです。乗客は、2 時間以内に TTC が運営する他の地下鉄、路面電車、またはバスルート・路線系統に乗り換えることもできます。

このサービスは、[fare_attributes.txt](../../reference/#fare_attributestxt)、[fare_rules.txt](../../reference/#fare_rulestxt)、および [transfers.txt](../../reference/#transferstxt) ファイルを使用して表すことができます。最初のファイル [fare_attributes.txt](../../reference/#fare_attributestxt) には、交通事業者の運賃が記載されています。以下は、プレスト運賃の例です。

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

```
fare_id,price,currency_type,payment_method,transfers,transfer_duration
presto_fare,3.2,CAD,1,,7200
```

- 運賃は、price と `currency_type`の下に表示されます。
- 乗客は、地下鉄に乗る前に、駅の改札口で運賃を支払う必要があります。これは `payment_method=1` で表されます
- フィールド乗り換えは、無制限の乗り換えを表すために空白のままにされています
- フィールド `transfer_duration` は、2時間の乗り換えウィンドウに対応します (秒単位)

2 番目のファイル [fare_rules.txt](../../reference/#fare_rulestxt) は、運賃をルートおよびそのルートの出発地/目的地に結び付けて、運賃を旅程に割り当てます。

そのために、2 つの地下鉄路線が [routes.txt](../../reference/#routestxt) で以下のように定義されています:

[**routes.txt**](../../reference/#routestxt)

```
agency_id,route_id,route_type
TTC,Line1,1
TTC,Line2,1
```

この例では、Bloor-Yonge 駅での乗り換えがモデル化されています。そのため、この駅は2つの別々の停留所等としてモデル化されています。1つ目は1号線が停車する Bloor 駅、2つ目は2.号線が停車する Yonge 駅です。両方の停留所に `zone_id=ttc_subway_stations` があり、すべての地下鉄駅を1つの料金ゾーンにグループ化しています。 

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_name,stop_lat,stop_lon,zone_id
Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations
```

[fare_rules.txt](../../reference/#fare_rulestxt)では、PRESTO 運賃は、次の関係を使用して地下鉄の路線と駅の両方に関連付けられています:

- `fare_id=presto_fare` の場合、乗客はLine 1 (`route_id=line1`)の任意の2つの駅間を移動でき、`origin_id=ttc_subway_stations` および `destination_id=ttc_subway_stations`。

[**fare_rules.txt**](../../reference/#fare_rulestxt) 

```
fare_id,route_id,origin_id,destination_id
presto_fare,line1,ttc_subway_stations,ttc_subway_stations
presto_fare,line2,ttc_subway_stations,ttc_subway_stations
```

3 番目のファイル [transfers.txt](../../reference/#transferstxt) は、異なるルート・路線系統間の乗り換えポイントを定義します。 Bloor-Yonge 駅での乗り換えをモデル化するには、2 つのエントリが必須です。

[**transfers.txt**](../../reference/#transferstxt) 

```
from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
Bloor,Yonge,line1,line2,0
Yonge,Bloor,line2,line1,0
```

- 最初のモデルは、Bloor 駅から Yonge 駅までの `from_route_id` と `to_route_id` を使用して、Line 1 から Line 2 への乗り換えをモデル化します
- 2 番目のモデルは、Yonge 駅から Bloor 駅までの `from_route_id` と `to_route_id`を使用して、Line 2 から Line 1 への乗り換えをモデル化します
- 乗り換えに関する特定の要件や考慮事項がないため、`transfer_type` の値は `0` です 

 <sup>[例のソース](https:( https://www.ttc.ca/Fares-and-passes)</sup> 
