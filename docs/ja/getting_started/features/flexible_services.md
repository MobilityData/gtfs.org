# :material-transit-detour:フレキシブルサービス
フレキシブルサービスは、需要対応サービスとも呼ばれ、スケジュールされたサービスや固定サービスの一般的な動作に従わないサービスです。 

##連続した停留所等

連続した停留所等は、スケジュールされた停留所等間で乗客を乗降させることができる場合に使用されます。 
これは、ルートのすべての旅行で車両の移動経路に沿った任意のポイントで乗客を乗降させることができることを示す `routes.txt` で指定するか、ルートの特定のセクションの `stop_times.txt` で指定できます。 

| 含まれるファイル                      | 含まれるフィールド   |
|----------------------------------|-------------------|
| [stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt) | `continuous_pickup`、`continuous_drop_off` |
| [routes.txt](../../../documentation/schedule/reference/#routestxt) | `continuous_pickup`、`continuous_drop_off` |

**前提条件**: 

- [基本機能](../ベース )

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、連続停止を表現する 2 つの方法を示しています。
    </p>
    
    <p style="font-size:16px">
    最初のサンプルは、ルート `RA` 沿いのどの地点でも乗車と降車が許可されていることを示しています。
     </p>

    <p style="font-size:16px">
    2番目のサンプルは、`stop_sequence=3` と `stop_sequence=4` に `continuous_pickup` と `continuous_drop_off` の値を割り当てることで、トリップ `AWE1` の3番目と5番目の停留所等の間で乗車と降車が許可されていることを示しています。
    </p>

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | route_short_name | route_type | continuous_pickup | continuous_drop_off |
        |----------|------------------|------------|-------------------|---------------------|
        | RA       |               17 |          3 |                 0 |                   0 |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | continuous_pickup | continuous_drop_off |
        |---------|--------------|----------------|---------|---------------|-------------------|---------------------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |                   |                     |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |                   |                     |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |                 0 |                   0 |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 |                 0 |                   0 |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 |                   |                     |

## 予約ルール

予約ルールを使用すると、ユーザーは需要に応じたサービスで旅行を予約できます。これらのルールは、予約を正常に行うために必要な前提条件を概説し、ユーザーが旅行を予約できる連絡先情報を提供します。この機能は、[偏差付き定義するべきであるルート・路線系統](#predefined-routes-with-deviation)、[ゾーンベースのデマンドサービス](#zone-based-demand-responsive-services)、[固定停留所型のデマンドサービス](#fixed-stops-demand-responsive-services)機能と組み合わせて使用​​する必要があります (これらのサービスで予約が必要な場合)。

| 含まれるファイル                   |含まれるフィールド   |
|----------------------------------|-------------------|
| [booking_rules.txt](../../../documentation/schedule/reference/#booking_rulestxt) | `booking_rule_id`、 `booking_type`、 `prior_notice_duration_min`、 `prior_notice_duration_max`、 `prior_notice_last_day`、 `prior_notice_last_time` 、 `prior_notice_start_time` 、 `prior_notice_service_id`、 `message`、 `pickup_message`、 `drop_off_message`、 `phone_number`、 `info_url`、 `booking_url` |

**前提条件**: 

- [基本機能](../ベース)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、2つの異なる予約ルールセットを示しています。1 つ目は、少なくとも 1 日前 (午後 1 時前) から 14 日前までに予約するしなければならない便用であり、2つ目は、少なくとも旅行の 45 分前から 5 時間前までに予約できる便用です。

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#booking_rulestxt"><b>booking_rules.txt</b></a> <br>
        </p>

        | booking_rule_id | booking_type | prior_notice_duration_min | prior_notice_duration_max | prior_notice_last_day | prior_notice_last_time | prior_notice_start_day | prior_notice_start_time | prior_notice_service_id | message                                                                                                                                            | pickup_message | drop_off_message | phone_number   | info_url             | booking_url             |
        |-----------------|--------------|---------------------------|---------------------------|-----------------------|------------------------|------------------------|-------------------------|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|----------------|------------------|----------------|----------------------|-------------------------|
        | route_br_1818   |            2 |                           |                           |                     1 |                  13:00 |                     14 |                    9:00 |                         | To request a ride, call 123-111-2233 before 1pm at least one business day ahead of your trip. You can book trips up to 14 business days in advace. |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |
        | route_br_4545   |            1 |                        45 |                       300 |                       |                        |                        |                         |                         | To request a ride, use the official booking system in our website, trips must be booked at least 45 min in advance                                 |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |

## 偏差付き定義済みルート・路線系統

偏差付き定義済みルート・路線系統は、車両が特定のルートから一時的に逸脱して、ルート沿いの特定のエリア内で旅行を予約したユーザーをピックアップできるフレキシブルサービスをモデル化するために使用できます。これは、従来の停留所等(通常のスケジュールされたサービスなど) と`locations.geojson`を使用したゾーンの組み合わせを使用します。

| 含まれるファイル                      | 含まれるフィールド   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
|[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson)|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features:Properties`, `Features:Properties:Stop_name`, `Features:Properties:Stop_description`, `Features:Geometry`, `Features:Geometry:Type`, `Features:Geometry:Coordinates` |

**前提条件**:

- [基本機能](../ベース)
- [予約ルール](#booking-rules)サービスに予約が必要な場合

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、3 つの固定停留所等を含む旅行を示しています。この旅行では、固定停留所等間で定義された特定のエリア内の任意の場所で乗客を降ろすこともできます。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | arrival_time | departure_time | stop_id | location_id           | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | shape_dist_traveled | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|--------------|----------------|---------|-----------------------|---------------|------------------------------|----------------------------|-------------|---------------|---------------------|------------------------|--------------------------|
        | 4545_001 |     10:00:00 |       10:00:00 | S50122  |                       |             1 |                              |                            |             |               |                   0 |                        |                          |
        | 4545_001 |              |                |         | zone_S50122_to_S50123 |             2 |                     10:00:00 |                   10:06:00 |           1 |             3 |                     | br_1234                | br_1234                  |
        | 4545_001 |     10:06:00 |       10:06:00 | S50123  |                       |             3 |                              |                            |             |               |                 983 |                        |                          |
        | 4545_001 |              |                |         | zone_S50123_to_S50124 |             4 |                     10:06:00 |                   10:15:00 |           1 |             3 |                     | br_1234                | br_1234                  |
        | 4545_001 |     10:15:00 |       10:15:00 | S50124  |                       |             5 |                              |                            |             |               |                2109 |                        |                          |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#locationsgeojson"><b>locations.geojson</b></a> <br>
        </p>

        ~~~
        {
          "type": "FeatureCollection",
          "features": [
            {
              "id": "zone_S50122_to_S50123",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplified, only presenting 3 coordinates here.
                "coordinates": [
                  [
                    [
                      -73.575952,
                      45.514974
                    ],
                    [
                      -73.577314,
                      45.513433
                    ],
                    [
                      -73.569794,
                      45.5098370
                    ]
                  ]
                ]
              },
              "properties": {}
            },
        {
              "id": "zone_S50123_to_S50124",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplified, only presenting 3 coordinates here.
                "coordinates": [
                  [
                    [
                      -73.561332,
                      45.5085599
                    ],
                    [
                     -73.5701298,
                      45.5124057
                    ],
                    [
                      -73.571302,
                      45.5105563
                    ]
                  ]
                ]
              },
              "properties": {}
            }
           ]
        } 
        ~~~

## ゾーンベースのデマンドサービス

ゾーンベースのデマンドサービスは、サービスをモデル化するために使用されます旅行を予約したユーザーが特定のエリア内の任意の場所で乗車および/または降車できるようにするものです。これらのエリアは`locations.geojson`を使用して定義されるため、 `stops.txt`や `stop_times.arrival_time` および `stop_times.departure_time` を使用する必要はありません。

| 含まれるファイル                      | 含まれるフィールド   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
|[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson)|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features:Properties`, `Features:Properties:Stop_name`, `Features:Properties:Stop_description`, `Features:Geometry`, `Features:Geometry:Type`, `Features:Geometry:Coordinates` |

**前提条件**:

- [基本機能](../ベース)
- [予約ルール](#booking-rules) サービスに予約が必要な場合

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、午前 9 時から午後 6 時の間に、特定のエリア内のどこでも、事前に予約された乗客をピックアップおよびドロップオフできるサービスを示しています。

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|-------------|---------------|------------------------------|----------------------------|-------------|---------------|------------------------|--------------------------|
        | 2708_001 | area_001    |             1 |                      9:00:00 |                   18:00:00 |           2 |             1 | br_3289                | br_3289                  |
        | 2708_001 | area_001    |             2 |                      9:00:00 |                   18:00:00 |           1 |             2 | br_3289                | br_3289                  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#locationsgeojson"><b>locations.geojson</b></a> <br>
        </p>

        ~~~
        {
          "type": "FeatureCollection",
          "features": [
            {
              "id": "area_001",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplified, only presenting 3 coordinates here.
                "coordinates": [
                  [
                    [
                      -73.644437,
                      45.5023960
                    ],
                    [
                      -73.641593,
                      45.5054392
                    ],
                    [
                      -73.636580,
                      45.5081683
                    ]
                  ]
                ]
              },
              "properties": {}
            }
          ]
        }
        ~~~

## 固定停留所型のデマンドサービス
固定停留所型のデマンドサービスは、旅行を予約したユーザーに対して、定義済みの停留所等のグループ内の任意の場所での乗車および/または降車を許可するサービスをモデル化するために使用されます。これらの停留所等のグループは、`location_groups.txt` および `location_group_stops.txt` を使用して定義されます。

| 含まれるファイル                   |含まれるフィールド   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_group_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
|[location_groups.txt](../../../documentation/schedule/reference/#location_groupstxt)|`location_group_id`, `location_group_name`|
|[location_group_stops.txt](../../../documentation/schedule/reference/#location_group_stopstxt)|`location_group_id`, `stop_id`|

**前提条件**:

- [基本機能](../ベース)
- [予約ルール](#booking-rules) サービスに予約が必要な場合

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、午前 7 時から午前 10 時の間に 4 つの異なる停留所等で事前予約された乗客をピックアップおよび降車できるサービスを示しています。

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#location_groupstxt"><b>location_groups.txt</b></a> <br>
        </p>

        | location_group_id | location_group_name           |
        |-------------------|-------------------------------|
        | r27_stops         | Yellow Borough Route 27 stops |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#location_group_stopstxt"><b>location_group_stops.txt</b></a> <br>
        </p>

        | location_group_id | stop_id |
        |-------------------|---------|
        | r27_stops         | syb029  |
        | r27_stops         | syb030  |
        | r27_stops         | syb031  |
        | r27_stops         | syb032  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | location_group_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|-------------------|---------------|------------------------------|----------------------------|-------------|---------------|------------------------|--------------------------|
        | 2714_002 | r27_stops         |             1 |                      7:00:00 |                   10:00:00 |           2 |             1 | br_5478                | br_5478                  |
        | 2714_002 | r27_stops         |             2 |                      7:00:00 |                   10:00:00 |           1 |             2 | br_5478                | br_5478                  |