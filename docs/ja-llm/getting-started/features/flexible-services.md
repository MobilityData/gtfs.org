# :material-transit-detour: フレキシブルサービス {: #material-transit-detour-flexible-services}

フレキシブルサービス（デマンド型サービスとも呼ばれます）は、定期的かつ固定的な運行の一般的な形態に従わないサービスです。

## 連続停留所等(Continuous Stops) {: #continuous-stops}


連続停留所等(Continuous Stops)は、乗客が定められた停留所等(stop)の間で乗降できる場合に使用されます。  
これは `routes.txt` に指定することで、そのルートのすべての便(trip)において車両の走行経路上の任意の地点で乗降できることを示すか、または `stop_times.txt` に指定することで、ルートの特定の区間において乗降できることを示すことができます。  

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`continuous_pickup`, `continuous_drop_off` |
|[routes.txt](../../../documentation/schedule/reference/#routestxt)|`continuous_pickup`, `continuous_drop_off` |

**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、連続停留所等(Continuous Stop)を表現する2つの方法を示しています。
    </p>
    
    <p style="font-size:16px">
    最初のサンプルは、ルート `RA` において経路上の任意の地点で乗降が可能であることを示しています。
     </p>

    <p style="font-size:16px">
    2つ目のサンプルは、便(trip) `AWE1` の3番目から5番目の停留所等(stop)の間で乗降が可能であることを示しています。これは、`stop_sequence=3` および `stop_sequence=4` に `continuous_pickup` と `continuous_drop_off` の値を設定することで実現されています。
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

## 予約ルール {: #booking-rules}


予約ルールは、利用者がデマンド型サービスにおいて便(trip)を予約できるようにするために使用することができます。これらのルールは、予約を成功させるために必要な前提条件を示し、利用者が便(trip)を予約するための連絡先情報を提供します。この機能は、サービスに予約が必要な場合、[迂回を伴う事前定義ルート](#predefined-routes-with-deviation)、[ゾーンベースのデマンド型サービス](#zone-based-demand-responsive-services)、[固定停留所のデマンド型サービス](#fixed-stops-demand-responsive-services)の機能と組み合わせて使用するべきです。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[booking_rules.txt](../../../documentation/schedule/reference/#booking_rulestxt)|`booking_rule_id`, `booking_type`, `prior_notice_duration_min`, `prior_notice_duration_max`, `prior_notice_last_day`, `prior_notice_last_time`, `prior_notice_start_day`, `prior_notice_start_time`, `prior_notice_service_id`, `message`, `pickup_message`, `drop_off_message`, `phone_number`, `info_url`, `booking_url` |


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、2種類の異なる予約ルールを示しています。1つ目は、便(trip)を少なくとも1営業日前の午後1時までに予約しなければならず、最大で14営業日前まで予約可能なものです。2つ目は、便(trip)の少なくとも45分前から最大5時間前までに予約可能なものです。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#booking_rulestxt"><b>booking_rules.txt</b></a> <br>
        </p>

        | booking_rule_id | booking_type | prior_notice_duration_min | prior_notice_duration_max | prior_notice_last_day | prior_notice_last_time | prior_notice_start_day | prior_notice_start_time | prior_notice_service_id | message                                                                                                                                            | pickup_message | drop_off_message | phone_number   | info_url             | booking_url             |
        |-----------------|--------------|---------------------------|---------------------------|-----------------------|------------------------|------------------------|-------------------------|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|----------------|------------------|----------------|----------------------|-------------------------|
        | route_br_1818   |            2 |                           |                           |                     1 |                  13:00 |                     14 |                    9:00 |                         | 乗車を希望する場合は、便(trip)の1営業日前の午後1時までに123-111-2233に電話してください。最大で14営業日前まで予約可能です。 |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |
        | route_br_4545   |            1 |                        45 |                       300 |                       |                        |                        |                         |                         | 乗車を希望する場合は、公式ウェブサイトの予約システムをご利用ください。便(trip)は少なくとも45分前までに予約しなければなりません。 |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |

## 事前定義されたルートと迂回 {: #predefined-routes-with-deviation}


事前定義されたルートと迂回は、車両が特定のルートから一時的に迂回して、そのルート沿いの特定のエリア内で便(trip)を予約した利用者を乗せることができる柔軟なサービスをモデル化するために使用することができます。これは、従来の停留所等(stop)（通常の定期運行サービスのように）と、`locations.geojson` を使用したゾーンの組み合わせを利用します。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
|[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson)|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features:Properties`, `Features:Properties:Stop_name`, `Features:Properties:Stop_description`, `Features:Geometry`, `Features:Geometry:Type`, `Features:Geometry:Coordinates` |

**前提条件**:

- [基本機能](../base)
- サービスに予約が必要な場合は [予約ルール](#booking-rules)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、3つの固定停留所等(stop)を持つ便(trip)で、固定停留所等(stop)間に定義された特定のエリア内であれば、どこでも乗客を降ろすことができる例を示しています。
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
                # 簡略化のため、ここでは3つの座標のみを表示しています。
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
                # 簡略化のため、ここでは3つの座標のみを表示しています。
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

## ゾーンベースのデマンド型サービス {: #zone-based-demand-responsive-services}


ゾーンベースのデマンド型サービスは、便を予約した利用者に対して、特定のエリア内の任意の場所での乗車および/または降車を可能にするサービスをモデル化するために使用されます。これらのエリアは `locations.geojson` を使用して定義されるため、`stops.txt` や `stop_times.arrival_time`、`stop_times.departure_time` を使用する必要はありません。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
|[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson)|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features:Properties`, `Features:Properties:Stop_name`, `Features:Properties:Stop_description`, `Features:Geometry`, `Features:Geometry:Type`, `Features:Geometry:Coordinates` |

**前提条件**:

- [基本機能](../base)
- サービスに予約が必要な場合は [予約ルール](#booking-rules)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、午前9時から午後6時の間に、特定のエリア内の任意の場所で事前予約した乗客を乗降させることができるサービスを示しています。
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
                # 簡略化のため、ここでは3つの座標のみを表示。
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

## 固定停留所型デマンド型サービス {: #fixed-stops-demand-responsive-services}

固定停留所型デマンド型サービスは、事前に定義された停留所等(stop)のグループ内の任意の場所で、予約した乗客を乗降させることができるサービスをモデル化するために使用されます。これらの停留所等(stop)のグループは、`location_groups.txt` および `location_group_stops.txt` を使用して定義されます。

| 含まれるファイル                  | 含まれるフィールド   |
|----------------------------------|-------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_group_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
|[location_groups.txt](../../../documentation/schedule/reference/#location_groupstxt)|`location_group_id`, `location_group_name`|
|[location_group_stops.txt](../../../documentation/schedule/reference/#location_group_stopstxt)|`location_group_id`, `stop_id`|

**前提条件**:

- [基本機能](../base)
- サービスに予約が必要な場合は [予約ルール](#booking-rules)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、午前7時から午前10時の間に、事前予約した乗客を4つの異なる停留所等(stop)で乗降させることができるサービスを示しています。
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
