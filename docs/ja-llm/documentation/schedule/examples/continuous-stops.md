# 連続停留所等 {: #continuous-stops}

## どこでも乗降可能 {: #pickup-and-drop-off-everywhere}

公共交通事業者 The Current (Rockingham, US-VT) は、ルート・路線系統(route) 2、53、55 において連続停車ポリシーを適用しています。乗客は、バスが安全に停車できる場所であれば、ルート全体の定期停留所等(stop)の間で乗車および降車することができます。  

このサービスは、[routes.txt](../../reference/#routestxt) ファイルで `continuous_pickup` および `continuous_drop_off` フィールドを使用して記述されます。これらのフィールドに `0` を設定することで、連続乗降が許可されていることを示します。  

[**routes.txt**](../../reference/#routestxt)

```
route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
2,2,Bellows Falls In-Town,3,0,0
53,53,Bellows Falls / Battleboro Commuter,3,0,0
55,55,Bellows Falls / Springfield Shuttle,3,0,0
```

<hr>

## ルートの一部区間における乗降 {: #pickup-and-drop-off-on-a-section-of-the-route}

交通事業者 Victor Valley Transit（米国カリフォルニア州ビクタービル）は、ルート22の一部区間にのみ連続乗降ポリシーを適用しています。乗客は、County Fareゾーン内の安全な場所であればどこでも乗降することができます。Local Fareゾーン内では連続乗降はできません。

Local FareゾーンとCounty Fareゾーンは、下図に示すようにAir Expresswayによって分けられています。定期停留所 National Trails Highway - Air Expressway は、この境界のやや北に位置しています。正確を期すために、交通事業者はバスルートが境界と交差する地点に停留所を追加し、そこから連続乗降を可能にすることができます。この停留所は時刻表に載せないままにしておくことも可能です。

![](../../../assets/victor-valley-transit.svg)

これは [stop.txt](../../reference/#stopstxt) と [stop_times.txt](../../reference/#stop_timestxt) を用いて表現されます。

- 最初のファイルはルート上の停留所を定義します
- 2つ目のファイルは停留所間の連続乗降ルールを定義します

[**stop.txt**](../../reference/#stopstxt)

```
stop_id,stop_name,stop_lat,stop_lon
A,Victoriaville Transfer Station,34.514356,-117.318323
B,Dante St & Venus Ave,34.564499,-117.287097
C,Victorville Transportation Center,34.538433,-117.294703
X,Local/County Fare Boundary,34.566224,-117.318357
D,National Trails Highway - Air Expressway,34.567536,-117.319716
E,Oro Grande Post Office,34.599292,-117.334452
F,Silver Lakes Market,34.744662,-117.335407
```

[stop_times.txt](../../reference/#stop_timestxt) では、特定の便(trip)に対して以下のように定義します。

- `continuous_pickup=0` のレコードは、その停留所から次の停留所まで連続乗車が許可されていることを示します
- `continuous_pickup=1` のレコードは、その停留所から次の停留所まで連続乗車が禁止されていることを示します

[**stop_times.txt**](../../reference/#stop_timestxt)

```
trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
22NB9AM,A,1,09:00:00,09:00:00,1,1,1
22NB9AM,B,2,09:14:00,09:14:00,1,1,1
22NB9AM,C,3,09:21:00,09:21:00,1,1,1
22NB9AM,X,4,,,0,0,0
22NB9AM,D,5,09:25:00,09:25:00,0,0,1
22NB9AM,E,6,09:31:00,09:31:00,0,0,1
22NB9AM,F,7,09:46:00,09:46:00,0,0,1
```

同じロジックが `continuous_drop_off` フィールドにも適用され、降車の場合を表します。

上記の例では、停留所 A, B, C は `continuous_pickup` および `continuous_drop_off` が `1` に設定されており、これらの間では連続乗降が禁止されています。停留所 `X`, `D`, `E`, `F` は `continuous_pickup` および `continuous_drop_off` が `0` に設定されており、これらの間では連続乗降が許可されています。

<sup>[例の出典](https://vvta.org/routes/route-22/)</sup>
