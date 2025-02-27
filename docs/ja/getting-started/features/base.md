# :material-subway-variant: ベース

以下の機能は、 GTFS が交通サービスを表すために必要な最も基本的かつ重要な要素を提供します。GTFS はルート・路線系統で構成され、各ルートには関連する便があります。これらの便は、特定の時間に 1 つ以上の停留所等を訪れます。便には時刻情報のみが含まれ、運行日はカレンダーによって決定されます。
GTFS フィードを機能させるには、これらすべての機能を同時に実装する必要がしなければならない

## 事業者

事業者には、名前、ウェブサイトの URL、サービスが運行される言語とタイムゾーンなど、交通サービスを担当する事業者に関する基本情報が含まれます。これにより、特定のサービスを対応する事業者と一致させることができます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[agency.txt](../../../documentation/schedule/reference/#agencytxt)| `agency_id`、`agency_name`、`agency_url`、`agency_timezone`、`agency_lang`、`agency_phone`、`agency_fare_url`、`agency_email` |

**前提条件**:  

- その他すべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#agencytxt"><b>agency.txt</b></a> <br>
        </p>

        | agency_id | agency_name | agency_url                 | agency_timezone     | agency_lang | agency_phone   | agency_fare_url                  | agency_email           |
        |-----------|-------------|----------------------------|---------------------|-------------|----------------|----------------------------------|------------------------|
        | tb        | Transit Bus | https://www.transitbus.org | America/Los_Angeles | EN          | (777) 555-7777 | https://www.transitbus.org/fares | contact@transitbus.org |

## 停留所等

停留所等は、交通サービスが乗客を乗降させる場所を識別するために使用される基本要素を表します。地下鉄の駅やバス停などです。各停留所には、他の属性とともに、地図上で位置を正確に示すための地理座標や、事業者の乗客向け資料と一致する名前があります。停留所等は停車時刻 を使用して便に関連付けられます。
GTFS では、[構内通路](/getting-started/機能/構内通路) を使用して、鉄道駅やバス停などの大きな駅の内部を記述することもできます。

| 含まれるファイル                      | 含まれるフィールド   |
|----------------------------------|-------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)| `stop_id`、`stop_code`、`stop_name`、`stop_desc`、`stop_lat`、`stop_lon`、`stop_url`、`stop_url` 、`stop_timezone`、`platform_code` |

**前提条件**:  

- その他すべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_code | stop_desc                                  | stop_name  | stop_lat  | stop_lon   | stop_url                                | stop_timezone | platform_code |
        |---------|-----------|--------------------------------------------|------------|-----------|------------|-----------------------------------------|---------------|---------------|
        | TAS001  | TAS001    | Southwest corner of 5 Avenue and 53 Street | 5 Av/53 St | 45.503568 | -73.587079 | https://www.transitbus.org/stops/TAS001 |               |               |

## ルート・路線系統

ルートとは、同じブランドの下にある便のグループで、乗客には単一のサービスとして表示されます。各ルートには、他の属性の中でも、事業者の乗客向け資料に一致する名前と、表されるサービスの種類 (バス、地下鉄、フェリーなど) があります。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[routes.txt](../../../documentation/schedule/reference/#routestxt)| `route_id`、`agency_id`、`route_desc`、`route_type`、`route_url`、`route_url` 、`route_sort_order`、`route_short_name`、`route_long_name` |

**前提条件**: 

- その他すべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルはバスルート (`route_type=3`) を定義します。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | agency_id | route_short_name | route_long_name    | route_desc                                            | route_type | route_url                            | route_sort_order |
        |----------|-----------|------------------|--------------------|-------------------------------------------------------|------------|--------------------------------------|------------------|
        | RA       | tb        |               17 | Mission - Downtown | The "A" route travels from lower Mission to Downtown. |          3 | https://www.transitbus.org/routes/ra |               12 |

## 運行日

ルート・路線系統運行日は、サービスが実行される日付の範囲を示すとともに、特定の日付の休日やその他の特別サービスなどのサービス免除を作成します。
これは、`calendars.txt ` で開始dateと終了dateを定義し、次に運行する各曜日のマーカーを定義することで機能します。この期間中に 1 日のスケジュール変更が発生した場合は、 `calendar_dates.txt`ファイルを使用して、これらの各日のスケジュールを上書きできます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[calendar.txt](../../../documentation/schedule/reference/#calendartxt)| `service_id`、`monday`、`tuesday`、`wednesday`、`thursday`、`friday`、`saturday`、`sunday`、`start_date`、`end_date`|
|[calendar_dates.txt](../../../documentation/schedule/reference/#calendar_datestxt)| `service_id`、`date`、`exception_type`|

**前提条件**:  

- その他すべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルでは、​​2024 年 7 月の 2 つのサービス (平日と週末) を定義しており、これには週末サービスとして運行される 7 月 4 日の特別休日サービスが含まれます。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#calendartxt"><b>calendar.txt</b></a> <br>
        </p>

        | service_id | monday | tuesday | wednesday | thursday | friday | saturday | sunday | start_date | end_date |
        |------------|--------|---------|-----------|----------|--------|----------|--------|------------|----------|
        | WE         |      0 |       0 |         0 |        0 |      0 |        1 |      1 |   20240701 | 20240731 |
        | WD         |      1 |       1 |         1 |        1 |      1 |        0 |      0 |   20240701 | 20240731 |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#calendar_datestxt"><b>calendar_dates.txt</b></a> <br>
        </p>

        | service_id | date     | exception_type |
        |------------|----------|----------------|
        | WD         | 20240704 |              2 |
        | WE         | 20240704 |              1 |

## 便

便は、ルート・路線系統と運行日を組み合わせて、乗客が利用できる旅程を作成します。便は、停車時刻を使用して停留所等に関連付けられます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[trips.txt](../../../documentation/schedule/reference/#tripstxt)| `route_id`、`service_id`、`trip_id`、`trip_short_name`、`direction_id`、`block_id`|

**前提条件**:  

- その他すべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルでは、​​RA ルートの両方向に実行される 2 つの便を定義します。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | trip_short_name | direction_id | block_id |
        |----------|------------|---------|-----------------|--------------|----------|
        | RA       | WE         | AWE1    |            3885 |            0 |        1 |
        | RA       | WE         | AWE2    |            3887 |            1 |        2 |

## 停車時刻

停車時刻は、各便の個々の停留所の到着時刻と出発時刻を表すために使用され、乗客はバス、電車、フェリーが特定の場所に到着および出発する時刻を正確に知ることができます。`stop_times.txt` ファイルは通常、`STOP_TIMES.TXT` フィード内で最も大きくなります。 
特定のサービスは、特定の到着時間と出発時間を持つのではなく、一定の頻度で運行されます (例: 5 分間隔で運行する地下鉄路線)。これは、[頻度`、`のサービス](../base_add-ons/#frequency-based-service) を使用してモデル化でき、 `stop_times.txt`と組み合わせてモデル化できます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-----------------------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)| `trip_id`、`arrival_time`、`departure_time`、`stop_id`、`stop_sequence`、`pickup_type`、`drop_off_type`、`timepoint` |

**前提条件**:  

- その他すべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、5 つの停留所等での便のスケジュールを定義します。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | pickup_type | drop_off_type | timepoint |
        |---------|--------------|----------------|---------|---------------|-------------|---------------|-----------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |           0 |             0 |         1 |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |           0 |             0 |         1 |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |           0 |             0 |         1 |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 |           0 |             0 |         1 |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 |           0 |             0 |         1 |