# デマンド型サービス {: #demand-responsive-services}

GTFS Flex は GTFS の拡張プロジェクトであり、2024年3月に公式に GTFS 仕様に採用されました。その目的は、デマンド型交通サービス(DRT)の発見可能性を高めることにあります。  
デマンド型サービスについては、地域によって異なる用語が存在することに注意してください。詳細は [用語集](#glossary) を参照してください。

以下の例は、Flex を使用してさまざまなデマンド型サービスのユースケースをどのようにモデル化するかを示しています。**以下の例は、必ずしも事業者のサービスを正確または完全に表現しているわけではないことにご注意ください。**

## 単一ゾーン内でのデマンド型サービス {: #on-demand-services-within-a-single-zone}

デマンド型サービスは特定のゾーン内で運行することができ、乗客はそのゾーン内の任意の地点Aでの乗車と、同じゾーン内の任意の地点Bでの降車を予約することができます。例として、アメリカ合衆国ミネソタ州の [Heartland Express Transit](https://www.co.brown.mn.us/heartland-express-transit?view=category&id=56) サービスがあります。

<sup>[Heartland Express のサンプルデータセットをダウンロード](../../../assets/on-demand-services-within-a-single-zone.zip)</sup>

### 便(trip)の定義 {: #define-trips}


Heartland Express の運行時間は以下の通りです:

- 平日:
  - 午前8:00 - 午後5:00
  - 午前6:15 – 午後5:45（New Ulm ゾーンのみ）
- 日曜日: 午前8:00 - 正午（New Ulm ゾーンのみ）

New Ulm 市ゾーンは Brown County ゾーンに含まれています。["ゾーン重複制約"](#zone-overlap-constraint) の問題を避けるために、Heartland Express は4つの便(trip)として定義することができます:

- 平日 午前6:15 から 午前8:00 までの New Ulm ゾーンでの運行
- 平日 午前8:00 から 午後5:00 までの郡全域での運行
- 平日 午後5:00 から 午後5:45 までの New Ulm ゾーンでの運行
- 日曜日 午前8:00 から 正午 までの New Ulm ゾーンでの運行
  
[**trips.txt**](../../reference/#tripstxt)

route_id | service_id | trip_id
-- | -- | -- 
74362 | c_67295_b_77497_d_31 | t_5374945_b_77497_tn_0
74362 | c_67295_b_77497_d_31 | t_5374946_b_77497_tn_0
74362 | c_67295_b_77497_d_31 | t_5374944_b_77497_tn_0
74362 | c_67295_b_77497_d_64 | t_5374947_b_77497_tn_0

`service_id = c_67295_b_77497_d_31` は平日を指し、`service_id = c_67295_b_77497_d_64` は日曜日を指します。

### ゾーンの定義 (GeoJSON locations) {: #define-zone-geojson-locations}


[locations.geojson](../../reference/#locationsgeojson) を使用して Heartland Express サービスの運行ゾーンを定義する際、Brown County と New Ulm City にはそれぞれ別のゾーンを定義しなければなりません。以下は Brown County のゾーンを定義する簡略化された GeoJSON です:
```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "id": "area_708",
      "type": "Feature",
      "geometry": {
        "type": "Polygon",
        # 簡略化のため、ここでは3つの座標のみを示しています。
        "coordinates": [
          [
            [
              -94.7805702,
              44.4560958
            ],
            [
              -94.7805608,
              44.4559928
            ],
            [
              -94.7805218,
              44.4559649
            ]
          ]
        ]
      },
      "properties": {}
    }
  ]
```

### 予約ルールの定義 {: #define-booking-rules}

以下は、Heartland Express のすべてのサービスに適用される予約ルールです:

- 乗車リクエストは平日の午前8時から午後3時の間に行うべきです。  
- 乗車は、乗車日の1営業日前までにリクエストしなければなりません。  
- 乗車リクエストは最大14日前から行うことができます。  

`booking_type = 2` を使用することで、このサービスが前日までの予約を必要とすることを示します。`prior_notice_last_day = 1` および `prior_notice_start_day = 14` は、このサービスが最短で前日、最長で14日前から予約可能であることを示します。  

[**booking_rules.txt**](../../reference/#booking_rulestxt)

booking_rule_id | booking_type | prior_notice_start_day | prior_notice_start_time | prior_notice_last_day | prior_notice_last_time | message | phone_number | info_url
-- | -- | -- | -- | -- | -- | -- | -- | --
booking_route_74362 | 2 | 14 | 8:00:00 | 1 | 15:00:00 | Brown County Heartland Express は、ドアツードアのオンデマンド交通サービスを提供しています。乗車をリクエストするには、便の1営業日前の午後3時までに 1-507-359-2717 または 1-800-707-2717 に電話してください。 | (507) 359-2717 | https://www.co.brown.mn.us/heartland-express-transit

### 停車時刻(stop times)の定義 {: #define-stop-times}

運行時間は `start_pickup_drop_off_window` フィールドと `end_pickup_drop_off_window` フィールドを使用して定義されます。同一ゾーン内での移動には、同じ `location_id` を持つ2つの stop_times.txt のレコードが必要です。

- 最初のレコードは `pickup_type = 2` かつ `drop_off_type = 1` であり、そのゾーン内での乗車予約が可能であることを示します。
- 2つ目のレコードは `pickup_type = 1` かつ `drop_off_type = 2` であり、そのゾーン内での降車予約が可能であることを示します。
 
[**stop_times.txt**](../../reference/#stop_timestxt)

trip_id | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | --
t_5374944_b_77497_tn_0 | area_715 | 1 | 06:15:00 | 08:00:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374944_b_77497_tn_0 | area_715 | 2 | 06:15:00 | 08:00:00 | 1 | 2 | booking_route_74362 | booking_route_74362
t_5374945_b_77497_tn_0 | area_708 | 1 | 08:00:00 | 17:00:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374945_b_77497_tn_0 | area_708 | 2 | 08:00:00 | 17:00:00 | 1 | 2 | booking_route_74362 | booking_route_74362
t_5374946_b_77497_tn_0 | area_715 | 1 | 17:00:00 | 17:45:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374946_b_77497_tn_0 | area_715 | 2 | 17:00:00 | 17:45:00 | 1 | 2 | booking_route_74362 | booking_route_74362
t_5374947_b_77497_tn_0 | area_715 | 1 | 08:00:00 | 12:00:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374947_b_77497_tn_0 | area_715 | 2 | 08:00:00 | 12:45:00 | 1 | 2 | booking_route_74362 | booking_route_74362

`area_715` は New Ulm City ゾーンを指し、`area_708` は Brown County ゾーンを指します。

## 複数ゾーンにまたがるデマンド型サービス {: #on-demand-services-across-multiple-zones}

一部のデマンド型サービスは、複数の異なるゾーンにまたがって運行されており、乗客はあるエリア内の任意の地点Aで乗車を予約し、別のエリア内の任意の地点で降車することができます。例えば、[Minnesota River Valley Transit](https://www.saintpetermn.gov/330/Dial-a-Ride) は、セントピーター市とカソタ市の間でデマンド型サービスを提供しています。

<sup>[River Valley Transit のサンプルデータセットをダウンロード](../../../assets/on-demand-services-between-multiple-zones-river-valley.zip)</sup>

### 便(trip)の定義 {: #define-trips}

前の例と同様に、運行時間は曜日によって異なるため、平日と土曜日で便(trip)を分けて定義する必要があります。  

[**trips.txt**](../../reference/#tripstxt)

route_id | service_id | trip_id 
-- | -- | -- 
74375 | weekdays | t_5298036_b_77503_tn_0 
74375 | saturdays | t_5298041_b_77503_tn_0 

（前の例と同様に、[booking_rules.txt](../../reference/#booking_rulestxt) および [locations.geojson](../../reference/#locationsgeojson) を使用して予約ルールとゾーンを定義します）

### 停車時刻(stop times)の定義 {: #define-stop-times}

以下のデータは、乗車はあるゾーンでのみ許可され、降車は別のゾーンでのみ許可されることを示しています。同じゾーンでの乗降は許可されていません。

[**stop_times.txt**](../../reference/#stop_timestxt)

trip_id | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | --
t_5298036_b_77503_tn_0 | area_713 | 1 | 06:30:00 | 20:00:00 | 2 | 1 | booking_route_74375 | booking_route_74375
t_5298036_b_77503_tn_0 | area_714 | 2 | 06:30:00 | 20:00:00 | 1 | 2 | booking_route_74375 | booking_route_74375
t_5298041_b_77503_tn_0 | area_713 | 1 | 09:00:00 | 19:00:00 | 2 | 1 | booking_route_74375 | booking_route_74375
t_5298041_b_77503_tn_0 | area_714 | 2 | 09:00:00 | 19:00:00 | 1 | 2 | booking_route_74375 | booking_route_74375

## 特定の場所での乗降が必要なデマンド型サービス {: #on-demand-services-where-riders-must-be-picked-up-and-dropped-off-at-specific-locations}

一部のデマンド型サービスでは、乗客はゾーン内の任意の場所で乗降を指定することができません。代わりに、乗客は特定の指定された停留所等（集合地点／仮想停留所）でのみ乗降を予約することができます。これの例として、ドイツのアンガーミュンデおよびガルツで運行されている [RufBus サービス](https://uvg-online.com/rufbus-angermuende/) があります。

### 便(trip)の定義 {: #define-trips}


ルート・路線系統(route) 476 は、Angermünde 地域内の各停留所等(stop)間でデマンド型サービスを提供しています。平日用と週末用の2種類のサービスを運行しており、それぞれに1つの trip_id が関連付けられています。 

[**trips.txt**](../../reference/#tripstxt)

route_id | service_id | trip_id 
-- | -- | -- 
476 | on_demand_weekdays | 476_weekdays 
476 | on_demand_weekends | 476_weekends

### ロケーショングループの定義 {: #define-location-groups}

乗客は各停留所等(stop)間でサービスを予約することができるため、stop_times.txt 内で全ての停留所等(stop)間の組み合わせを定義することを避けるために、location_groups.txt と location_group_stops.txt を使用して、これらの停留所等(stop)をロケーショングループとして定義するのが適切な方法です。

[**location_groups.txt**](../../reference/#location_groupstxt)

location_group_id | location_group_name 
-- | -- 
476_stops | durch den RufBus 476 bedientes Gebiet im Raum Angermünde

[**location_group_stops.txt**](../../reference/#location_group_stopstxt)

location_group_id | stop_id 
-- | -- 
476_stops | de:12073:900340004::1
476_stops | de:12073:900340004::2
476_stops | de:12073:900340004::3
476_stops | de:12073:900340004::4
476_stops | de:12073:900340100::1
476_stops | de:12073:900340100::2
476_stops | ...

### 予約ルールの定義 {: #define-booking-rules}

476系統のサービスは、少なくとも1時間前までの予約が必要です。`booking_type = 1` を使用することで、このサービスが当日予約を事前通知付きで必要とすることを示します。`prior_notice_duration_min = 60` は、少なくとも60分前までの予約が必要であることを示します。  

平日と週末の予約にはわずかな違いがあるため、平日サービスと休日サービスに対して別々の予約ルールを定義することができます。詳細は `message` フィールドに記載することができます。情報ページや予約ページへのリンクは、`info_url` および `booking_url` フィールドに記載することができます。  

[**booking_rules.txt**](../../reference/#booking_rulestxt)

booking_rule_id | booking_type | prior_notice_duration_min | message | phone_number | info_url | booking_url
-- | -- | -- | -- | -- | -- | --
flächenrufbus_angermünde_weekdays | 1 | 60 | Anmeldung mind. 60min vorher erforderlich, per Anruf zwischen 08:00 und 24:00 möglich, oder online rund um die Uhr | +49 3332 442 755 | https://uvg-online.com/rufbus-angermuende/ | https://uvg.tdimo.net/bapp/#/astBuchungenView
flächenrufbus_angermünde_weekends | 1 | 60 | 1€ Komfortzuschlag pro Person; Anmeldung mind. 60min vorher erforderlich, per Anruf zwischen 08:00 und 24:00 möglich, oder online rund um die Uhr | +49 3332 442 755 | https://uvg-online.com/rufbus-angermuende/ | https://uvg.tdimo.net/bapp/#/astBuchungenView

### 停車時刻(stop times)の定義 {: #define-stop-times}


476系統のルートは、平日は午後5時30分から午後10時まで、週末は午前8時から午後10時まで運行されます。運行時間は `start_pickup_drop_off_window` フィールドと `end_pickup_drop_off_window` フィールドを使用して定義されます。同じロケーショングループ内での移動には、同じ `location_group_id` を持つ2つの stop_times.txt のレコードが必要です。

  - 最初のレコードは `pickup_type = 2` および `drop_off_type = 1` であり、ロケーショングループでの予約による乗車が許可されていることを示します。
  - 2つ目のレコードは `pickup_type = 1` および `drop_off_type = 2` であり、ロケーショングループでの予約による降車が許可されていることを示します。

[**stop_times.txt**](../../reference/#stop_timestxt)

trip_id | location_group_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | --
476_weekdays | 476_stops | 1 | 17:30:00 | 22:00:00 | 2 | 1 | flächenrufbus_angermünde_weekdays | flächenrufbus_angermünde_weekdays
476_weekdays | 476_stops | 2 | 17:30:00 | 22:00:00 | 1 | 2 | flächenrufbus_angermünde_weekdays | flächenrufbus_angermünde_weekdays
476_weekends | 476_stops | 1 | 08:00:00 | 22:00:00 | 2 | 1 | flächenrufbus-angermünde_weekdays | flächenrufbus_angermünde_weekends
476_weekends | 476_stops | 2 | 08:00:00 | 22:00:00 | 1 | 2 | flächenrufbus-angermünde_weekdays | flächenrufbus_angermünde_weekends

## 迂回ルート {: #deviated-route}

「ルート迂回」とは、車両が固定されたルートと停留所等(stop)の順序に従って運行する一方で、停留所等(stop)間でルートを外れて乗客を乗降させる柔軟性を持つサービスを指します。通常、迂回は運行の定時性を維持するために制限されており、迂回による乗降には事前予約が必要です。

この例では、New Ulm 市の [Hermann Express](https://www.newulmmn.gov/553/Hermann-Express-City-Bus-Service) サービスは、乗客が固定された停留所等(stop)でのみ乗車でき、降車はこれらの停留所等(stop)間の特定の迂回エリア内の任意の地点で可能となっています。

**以下の例は簡略化されています。詳細については [Hermann Express のサンプルデータセット](../../../assets/deviated-drop-off-route.zip) をダウンロードしてください。**

### 便(trip)の定義 {: #define-trips}

この種のサービスは依然として一連の固定された停留所等(stop)と固定された時刻表を伴うため、便(trip)の定義は通常の固定ルート・路線系統(route)バスサービスと類似しています。各ルート・路線系統(route)が、関連するすべての運行日(service day)に提供する便(trip)を定義する必要があります。

[**trips.txt**](../../reference/#tripstxt)

route_id | service_id | trip_id | share_id
-- | -- | -- | -- 
74513 | c_67295_b_77497_d_31 | t_5374704_b_77497_tn_0 | p_1426044
74513 | c_67295_b_77497_d_31 | t_5374699_b_77497_tn_0 | p_1426044
74513 | c_67295_b_77497_d_31 | t_5374698_b_77497_tn_0 | p_1426044
74513 | c_67295_b_77497_d_31 | t_5374697_b_77497_tn_0 | p_1426044
... | ... | ... | ...

### ゾーンの定義 (GeoJSON location) {: #define-zones-geojson-location}

[locations.geojson](../../reference/#locationsgeojson) を使用して、迂回ルートのゾーンを定義します。通常、迂回は運行スケジュールを維持するために制限されます。そのため、車両が走行する際、各固定停留所(stop)間の迂回可能エリアはそれに応じて変化する場合があります。ルート迂回のエリアは以下の図のようになります:

<div class="flex-photos">
    <img src="../../../../assets/deviated-route-zones.png" alt="deviated route zones">
</div>

### 停車時刻(stop times)の定義 {: #define-stop-times}

固定された停留所等(stop)については、通常のバス路線と同様に `arrival_time`、`departure_time`、`stop_id` といったフィールドを定義します。固定された停留所等(stop)の間には、迂回が許可されるゾーンを定義します。`pickup_type = 1` および `drop_off_type = 3` は、迂回による乗車が許可されないこと（乗車は固定された停留所等(stop)のみに制限されること）、および乗客は迂回ゾーン内で降車するために運転手と調整しなければならないことを示します。

[**stop_times.txt**](../../reference/#stop_timestxt)

trip_id | arrival_time | departure_time | stop_id | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | shape_dist_traveled | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | --
t_5374696_b_77497_tn_0 | 08:00:00 | 08:00:00 | 4149546 | | 1 | | | | | 0 | | 
t_5374696_b_77497_tn_0 | | | | radius_300_s_4149546_s_4149547 | 2 | 08:00:00 | 8:02:22 | 1 | 3 | | booking_route_74513 | booking_route_74513
t_5374696_b_77497_tn_0 | 08:02:22 | 08:02:22 | 4149547 | | 3 | | | | | 1221.627114 | | 
t_5374696_b_77497_tn_0 | | | | radius_300_s_4149546_s_4149548 | 4 | 08:02:22 | 8:03:00 | 1 | 3 | | booking_route_74513 | booking_route_74513
t_5374696_b_77497_tn_0 | 08:03:22 | 08:03:22 | 4149548 | | 5 | | | | | 1548.216356 | | 
t_5374696_b_77497_tn_0 | | | | radius_300_s_4149546_s_4149549 | 6 | 08:03:22 | 8:05:00 | 1 | 3 | | booking_route_74513 | booking_route_74513
... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ...
t_5374696_b_77497_tn_0 | 08:50:00 | 08:50:00 | 4210601 | | 35 | | | | | 23429.19558 | | 
t_5374696_b_77497_tn_0 | 08:56:00 | 08:56:00 | 4149564 | | 36 | | | | | 25320.8471 | |

## 経路探索の挙動 {: #routing-behavior}

### 乗降ウィンドウを持つ中間の停車時刻(stop_times)レコードの無視 {: #ignoring-intermediate-stop-times-records-with-pickupdrop-off-windows}

出発地と目的地の間の経路探索や所要時間を提供する際、データ利用者は `start_pickup_drop_off_window` および `end_pickup_drop_off_window` が定義されている中間の stop_times.txt レコードを無視するべきです。例を示します:

trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | Zone1 | 1 | 2 | 1 | 08:00:00 | 18:00:00
tripA | Zone2 | 2 | 1 | 2 | 08:00:00 | 14:00:00
tripA | Zone3 | 3 | 1 | 2 | 10:00:00 | 18:00:00

Zone1 から Zone3 への便(trip)に対して経路探索や所要時間を提供する際、データ利用者は Zone2 を考慮に入れるべきではありません。

### ゾーンの重複制約 {: #zone-overlap-constraint}

同一の `trip_id` を持つ複数の stop_times.txt レコード間で、  
locations.geojson の `id` ジオメトリ、`start/end_pickup_drop_off_window` の時間、  
および `pickup_type` または `drop_off_type` が同時に重複することは許可されていません。

例:  
（ここで `northportland` は `portland` 内のゾーンを指します）

**禁止される例**

[**stop_times.txt**](../../reference/#stop_timestxt)

trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | northportland | 2 | 2 | 1 | 10:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00

**許可される例**

[**stop_times.txt**](../../reference/#stop_timestxt)

trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | northportland | 2 | 2 | 1 | 12:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00

または

[**stop_times.txt**](../../reference/#stop_timestxt)

trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | northportland | 2 | 1 | 2 | 10:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00

または

[**stop_times.txt**](../../reference/#stop_timestxt)

trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | gresham | 2 | 2 | 1 | 10:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00

## 用語集 {: #glossary}


📲 Dial-a-ride は、ヨーロッパ各地で使われている複数の用語のバリエーションです。 

🇨🇭 スイスでは、Rufbus / On-call bus という用語に該当します。また、[PostAuto の PubliCar システム](https://www.postauto.ch/en/timetable-and-network/publicar) も利用可能です。本提案の下では、PubliCar アプリとサービスは、利用者が選択した旅程プランナーアプリで発見可能になります。 

🇦🇹 オーストリアでは、dial-a-ride は Rufbus と呼ばれ、さらに Bedarfsverkehr（デマンド型交通）や Mikro-ÖV（マイクロトランジット）の大きな枠組みに含まれます。
    
- [bedarfsverkehr.at](https://www.bedarfsverkehr.at/)
- [Wiener Linien](https://www.wienerlinien.at/documents/843721/4770179/Anleitung_Rufbus_359531.pdf/df430b95-9dd4-0d13-ffdf-bdace15932a8?t=1614165175643)
- Rufbus（英語: dial-a-bus、以前は Anruf-Sammel-Taxi または ASTAX call-collect-taxi）
- 現在の GTFS 実装例 [通年の運行情報(alert)として](https://www.google.com/maps/dir/S%C3%BC%C3%9Fenbrunner+Pl.,+1220+Wien,+Austria/2201+Gerasdorf,+Austria/@48.2867283,16.4429959,13z/am=t/data=!4m15!4m14!1m5!1m1!1s0x476d0393b15bc6d9:0x517f69839511fb31!2m2!1d16.4958186!2d48.2772635!1m5!1m1!1s0x476d0488292e6f61:0xeee80d3d2bb6b1f5!2m2!1d16.4690073!2d48.2962096!3e3!5i1?entry=ttu )

🇩🇰 デンマークでは、NT / midttrafik / sydtrafik / FYNBUS / movia などで利用され、[flextur](https://flextur.dk/) と呼ばれています。
    
- flextur（英語: flex trip）
- 以前は flextrafik（英語: flex transit）

🇫🇷 ⚠️ フランスでは、パラトランジットサービスに対して TDA（Transport à la Demande）や PMR（Personnes à Mobilité Réduite）という用語が使われます。

- [Reseau Mistral](https://www.reseaumistral.com/services/service-appel-bus) 
- Appel bus（英語: call bus）

🇩🇪 ドイツでは、On-Demand-Angebot、Flexible Fahrt、AST などと呼ばれます。
   
- [BVG](https://www.bvg.de/de/verbindungen/bvg-muva/flexible-fahrt)
- ブランド: Muva
- On-Demand-Angebot（英語: on-demand-service）
- Flexible Fahrt（英語: flexible trip）
- その他の地域
- Anruf-sammel-taxi または AST（英語: call-collect-taxi）

🇬🇧 イギリスでは、以下のサービスがあります:

- [go2 Sevenoaks](https://www.go-coach.co.uk/go2/ )
- オンデマンドサービス

国境を越えると用語は異なりますが、一般的に dial-a-ride は、乗客が事業者に何らかの形で連絡を取る必要があるデマンド型サービスであると考えることができます。 
<hr>
