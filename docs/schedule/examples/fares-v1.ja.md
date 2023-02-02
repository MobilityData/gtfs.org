---
search:
  exclude: true
---

# 運賃 v1

<hr>

Fares v1 は、[fare_attributes.txt](../../reference/#fare_attributestxt)と[fare_rules.txt](../../reference/#fare_rulestxt) で構成され、歴史的に GTFS における運賃情報の公式記述方法となっています。しかし、この2つのファイルは効率的に記述できる要素の幅に限界があり、実装も曖昧なものでした。[Fares v2](../../examples/fares-v2/)は、Fares v1 の制限を解消することを目的として、現在活発に開発が進められている拡張プロジェクトです。

## ある機関の運賃規則を定義する

トロント交通委員会の地下鉄ネットワークの旅は、ライダーがPRESTOカードで支払う場合、\$3.20 CADです。また、2時間以内であれば、TTCが運営する他の地下鉄、路面電車、バス路線に乗り換えることができます。

このサービスは[fare_attributes.txt](../../reference/#fare_attributestxt), [fare_rules.txt](../../reference/#fare_rulestxt), [transfers.txt](../../reference/#transferstxt) というファイルを使って表現することができる．最初のファイル、[fare_attributes.txtは](../../reference/#fare_attributestxt)代理店の運賃を記述し、以下はpresto運賃の例である。

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- 運賃の価格は、価格と`currency_type`に記載されています。
- ライダーは、地下鉄に乗る前に駅の運賃ゲートで運賃を支払わなければならない。これは、`payment_method=1`で表される。
- transfersは無制限の乗り換えを表すため、空欄になっています。
- `transfer_durationは`、2時間の乗り換え時間（秒）です。

2つ目のファイル、[fare_rules.txtは](../../reference/#fare_rulestxt)、運賃を路線とその路線の出発地/目的地に関連付けることで、旅に運賃を割り当てるものです。

そのために、以下のように2つの地下鉄路線を[routes.txtで](../../reference/#routestxt)定義しています。

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

この例では、Bloor-Yonge駅での乗り換えがモデル化されています。そのために、この駅は2つの別々の駅としてモデル化されています。1つ目はBloor駅、これは1号線が通っており、2つ目はYonge駅、これは2号線が通っている駅です。地下鉄の駅を1つの運賃ゾーンにまとめるために、どちらも`zone_id=ttc_subway_stationsとして`います。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

[fare_rules.txt](../../reference/#fare_rulestxt)では、さきがけの運賃は地下鉄の路線と駅に以下のような関係で関連づけられています。

- `fare_id=presto_fareの`場合，ライダーはLine 1の任意の2駅間（`route_id=line1`）を移動でき，`origin_id=ttc_subway_stations`と`destination_id=ttc_subway_stations` である．

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

3番目のファイル[transfers.txt](../../reference/#transferstxt)、は異なるルート間の乗り換えポイントを定義しています。Bloor-Yonge駅での乗り換えをモデル化するには、2つのエントリーが必要です。

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- 最初のモデルは、Bloor駅からYonge駅までの`from_route_idと` `to_route_idを使って`、Line 1からLine 2への乗り換えを行うものです。
- 2つ目は、Yonge駅からBloor駅までの`from_route_id`と`to_route_`idを使って、2号線から1号線への乗り換えをモデル化したものです。
- 乗り換えに関する特別な要件や考慮事項がないため、`transfer_type`の値は`0`になっています。

[ソース例](https://www.ttc.ca/Fares-and-passes)
