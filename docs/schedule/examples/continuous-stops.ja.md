---
search:
  exclude: true
---

# 連続した停車

<hr>

## どこでも送迎

交通機関The Current (Rockingham, US-VT) は、ルート2、53、55で、連続停車ポリシーを適用しています。バスが安全に停車できる場所がある限り、乗客はルート上のすべての予定された停留所で送迎を受けることができます。

[routes.txt](../../reference/#routestxt)は、`continuous_pickup`と`continuous_drop_off` というフィールドを使用して、このサービスを記述するためのファイルである。このフィールドは、連続的なピックアップとドロップオフが許可されていることを示すために`0`に設定されています。

[**routes.txt**](../../reference/#routestxt)

    route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
    2,2,Bellows Falls In-Town,3,0,0
    53,53,Bellows Falls / Battleboro Commuter,3,0,0
    55,55,Bellows Falls / Springfield Shuttle,3,0,0

[ソース例](https://crtransit.org/bus-schedules/)

<hr>

## 路線の一部区間でのピックアップとドロップオフ

Victor Valley Transit (Victorville, CA, USA)）は、22号線の一部区間に限り、連続停車制度を適用しています。乗客は、County Fareゾーン内の安全な場所でのみバスに乗り降りすることができます。Local Fareゾーンでは、連続したピックアップとドロップオフはできません。

ローカル料金ゾーンとカウンティ料金ゾーンは、下図のようにエア・エクスプレス・ウェイで区切られています。予定停車駅のNational Trails Highway - Air Expresswayは、この境界のやや北側に位置しています。正確には、交通機関は、バスルートと境界線との実際の交差点に停留所を追加し、そこから連続した送迎を行うことができます。この停留所は予定外のままでもよい。

![](../../assets/victor-valley-transit.svg)

これは、[stops.txt](../../reference/#stopstxt)と[stop_times.txt](../../reference/#stoptimestxt) というファイルを使用して記述されています。

- 最初のファイルは、ルートに沿った停留所を定義します。
- 2番目のファイルは、停留所間の連続的なピックアップとドロップオフのルールを定義しています。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon
    A,Victoriaville Transfer Station,34.514356,-117.318323
    B,Dante St & Venus Ave,34.564499,-117.287097
    C,Victorville Transportation Center,34.538433,-117.294703
    X,Local/County Fare Boundary,34.566224,-117.318357
    D,National Trails Highway - Air Expressway,34.567536,-117.319716
    E,Oro Grande Post Office,34.599292,-117.334452
    F,Silver Lakes Market,34.744662,-117.335407

[stop_times.txt](../../reference/#stoptimestxt)では、指定されたトリップについて。

- `continuous_pickup=`0のレコードは、その停留所から次の停留所まで連続的なピックアップが許可されていることを示す。
- `continuous_pickup=`1のレコードは、その停留所から次の停留所まで連続的なピックアップが禁止されていることを示す。

[**stop_times.txt**](../../reference/#stoptimestxt)

    trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
    22NB9AM,A,1,09:00:00,09:00:00,1,1,1
    22NB9AM,B,2,09:14:00,09:14:00,1,1,1
    22NB9AM,C,3,09:21:00,09:21:00,1,1,1
    22NB9AM,X,4,,,0,0,0
    22NB9AM,D,5,09:25:00,09:25:00,0,0,1
    22NB9AM,E,6,09:31:00,09:31:00,0,0,1
    22NB9AM,F,7,09:46:00,09:46:00,0,0,1

同じロジックが`continuous_drop_off`フィールドにも適用されるが、ドロップオフの場合である。

上記の例では、停留所A、B、Cはcontinuous_pickupと`continuous_drop_offが` `1`に設定されており、その間の連続したピックアップとドロップオフを禁止している。一方、停留所`X`,`D`,`E`,`F`のフィールド`continuous_pickup`,`continuous_drop_off`は`0` に設定されており、停留所間の連続したピックアップとドロップオフを許可している。

[ソース例](https://vvta.org/routes/route-22/)
