# 連続停車

## どこでも乗降可能

交通機関 The Current (ロッキンガム、米国バーモント州) は、ルート 2、53、55 に連続停車ポリシーを適用しています。バスが安全に停車できる場所がある限り、ルート上のすべての予定停車間で乗客の乗降が可能です。

ファイル [routes.txt](../../reference/#routestxt) は、フィールド`continuous_pickup`および`continuous_drop_off`を使用してこのサービスを説明するために使用されます。連続乗降が許可されていることを示すために、フィールドは `0` に設定されています。 

[** routes.txt**](../../reference/#routestxt)

```
 route_id、route_short_name、route_long_name、route_type、連続乗車、連続降車
2,2、ベローズ フォールズ市内、3,0,0
53,53、ベローズ フォールズ/バトルボロ通勤、3,0,0
55,55、ベローズ フォールズ/スプリングフィールド シャトル、3,0,0
```

<hr> 

## 路線の一部での乗降

交通機関 Victor Valley Transit (ビクタービル、米国カリフォルニア州) は、路線 22 の一部にのみ連続停車ポリシーを適用しています。乗客は、郡運賃ゾーン内の安全な場所でのみバスに乗降できます。ローカル運賃ゾーン内で連続した乗降はできません。

ローカル運賃ゾーンと郡運賃ゾーンは、下の図に示すように、エア エクスプレスウェイによって分離されています。予定されている停留所 National Trails Highway- Air Expressway は、この境界の少し北にあります。正確には、交通機関はバス路線と境界の実際の交差点に停留所を追加し、そこから連続した乗降を利用できます。この停留所は予定されていない場合があります。 

![](../../../assets/victor-valley-transit.svg)

これは、[stop.txt](../../reference/#stopstxt) および [stop_times.txt](../../reference/#stop_timestxt) ファイルを使用して説明されています:

- 最初のファイルはルート沿いの停留所を定義します
- 2 番目のファイルは停留所間の連続的な乗降ルールを定義します。

[**stop.txt**](../../reference/#stopstxt)

```
stop_id、stop_name、stop_lat、stop_lon
A、Victoriaville Transfer Station、34.514356、-117.318323
B、Dante St &amp; Venus Ave、34.564499、-117.287097
C、Victorville Transportationセンター、34.538433、-117.294703
X、地方/郡運賃境界、34.566224、-117.318357
D、ナショナル トレイルズ ハイウェイ - エア エクスプレスウェイ、34.567536、-117.319716
E、オロ グランデ郵便局、34.599292、-117.334452
F、シルバー レイクス マーケット、34.744662、-117.335407
```

[stop_times.txt](../../reference/#stop_timestxt) では、特定の旅行について次のようになります。

- `continuous_pickup=0` のレコードは、その停車地から次の停車地まで連続乗車が許可されていることを示します。
- `continuous_pickup=1` のレコードは、連続乗車が許可されていないことを示します。次の停留所までその停留所から立ち入り禁止

[** stop_times.txt**](../../reference/#stop_timestxt)

```
 trip_id、stop_id、 stop_sequence、departure_time、arrival_time、continuous_pickup、continuous_drop_off、timepoint
22NB9AM、A、1、09:00:00、09:00:00、1、1、1
22NB9AM、B、2、09:14:00、09:14:00、1、1、1
22NB9AM、C、3,09:21:00,09:21:00,1,1,1
22NB9AM,X,4,,,0,0,0
22NB9AM,D,5,09:25:00,09:25:00,0,0,1
22NB9AM,E,6,09:31:00,09:31:00,0,0,1
22NB9AM,F,7,09:46:00,09:46:00,0,0,1
```

降車の場合、フィールド`continuous_drop_off`に同じロジックが適用されます。

上記の例では、停車地 A、B、C の Continuous_pickup と`continuous_drop_off` が`1`に設定されており、それらの間での連続的な乗車と降車が禁止されています。停留所`X`、`D`、`E`、`F` では、フィールド`continuous_pickup`と`continuous_drop_off`が `0` に設定されており、それらの間での連続的な乗車と降車が許可されます<sup>。

 [例のソース](https://vvta.org/routes/route-22/)</sup>