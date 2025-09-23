# :material-subway-variant: 基本 {: #material-subway-variant-base}

以下の機能は、GTFS が公共交通サービスを表現するために必要となる、最も基本的かつ不可欠な要素を提供します。GTFS はルート・路線系統(route)で構成され、それぞれに便(trip)が関連付けられています。これらの便は、特定の時刻に1つ以上の停留所等(stop)を訪れます。便(trip)には時刻情報のみが含まれ、どの日に運行されるかはカレンダーによって決定されます。  
これらすべての機能を組み合わせて実装することで、動作する GTFS フィードを実現することができます。

## 事業者(Agency) {: #agency}


事業者には、事業者名、ウェブサイトのURL、サービスが運行される言語やタイムゾーンといった、公共交通サービスを提供する事業者に関する基本情報が含まれます。これにより、特定のサービスを対応する事業者と紐付けることができます。

| 含まれるファイル                 | 含まれるフィールド   |
|----------------------------------|-------------------|
|[agency.txt](../../../documentation/schedule/reference/#agencytxt)|`agency_id`, `agency_name`, `agency_url`, `agency_timezone`, `agency_lang`, `agency_phone`, `agency_fare_url`, `agency_email` |

**前提条件**: 

- 他のすべての基本機能

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

## 停留所等(Stops) {: #stops}


停留所等(Stops)は、公共交通サービスが乗客を乗降させる場所を識別するために使用される基本要素を表します。これは地下鉄駅やバス停などが該当します。各停留所等には、地図上で位置を特定するための地理座標や、事業者が乗客向け資料で使用する名称などの属性があります。停留所等は、停車時刻(stop_time)を用いて便(trip)と関連付けられます。  
GTFS では、鉄道駅やバスターミナルのような大規模な駅構内を、[構内通路(pathways)](/getting-started/features/pathways)を用いて記述することも可能です。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|---------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`stop_id`, `stop_code`, `stop_name`, `stop_desc`, `stop_lat`, `stop_lon`, `stop_url`, `stop_timezone`, `platform_code` |

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

## ルート(routes) {: #routes}


ルート(route)とは、同一のブランドの下でまとめられ、乗客に単一のサービスとして表示される複数の便(trip)の集合です。各ルート(route)には、事業者の乗客向け資料と一致する名称や、表現されるサービスの種類（バス、地下鉄・メトロ、フェリーなど）が含まれます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[routes.txt](../../../documentation/schedule/reference/#routestxt)|`route_id`, `agency_id`, `route_desc`, `route_type`, `route_url`, `route_sort_order`, `route_short_name`, `route_long_name`|

**前提条件**: 

- その他すべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルはバスのルート(route)を定義しています（`route_type=3`）。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | agency_id | route_short_name | route_long_name    | route_desc                                            | route_type | route_url                            | route_sort_order |
        |----------|-----------|------------------|--------------------|-------------------------------------------------------|------------|--------------------------------------|------------------|
        | RA       | tb        |               17 | Mission - Downtown | "A" ルートは Mission 下部からダウンタウンまで運行します。 |          3 | https://www.transitbus.org/routes/ra |               12 |

## 運行日(Service Dates) {: #service-dates}


運行日(Service Dates)は、サービスが運行される日付の範囲を示すとともに、祝日や特定の日における特別なサービスなどの運行除外日を設定します。  
これは `calendars.txt` に開始日と終了日を定義し、その期間中に運行する曜日ごとのマーカーを設定することで機能します。もしこの期間中に単日のスケジュール変更が発生する場合は、`calendar_dates.txt` ファイルを使用して各日のスケジュールを上書きすることができます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[calendar.txt](../../../documentation/schedule/reference/#calendartxt)|`service_id`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `start_date`, `end_date`|
|[calendar_dates.txt](../../../documentation/schedule/reference/#calendar_datestxt)|`service_id`, `date`, `exception_type`|

**前提条件**: 

- その他のすべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、2024年7月の平日サービスと週末サービスを定義し、7月4日の祝日に週末サービスとして運行する特別サービスを含んでいます。
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

## Trips {: #trips}

便(trip)は、ルート・路線系統(route)と運行日(service day)を組み合わせて、乗客が利用できる旅程(journey)を作成します。便(trip)は、停車時刻(stop_time)を使用して停留所等(stop)と関連付けられます。

| 含まれるファイル                 | 含まれるフィールド   |
|----------------------------------|----------------------|
|[trips.txt](../../../documentation/schedule/reference/#tripstxt)|`route_id`, `service_id`, `trip_id`, `trip_short_name`, `direction_id`, `block_id`|

**前提条件**: 

- その他のすべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、RA 路線において両方向に運行する2つの便(trip)を定義しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | trip_short_name | direction_id | block_id |
        |----------|------------|---------|-----------------|--------------|----------|
        | RA       | WE         | AWE1    |            3885 |            0 |        1 |
        | RA       | WE         | AWE2    |            3887 |            1 |        2 |

## 停車時刻(stop times) {: #stop-times}

停車時刻(stop times)は、各便(trip)における個々の停留所等(stop)での到着時刻および出発時刻を表現するために使用され、乗客がバス、電車、フェリーが特定の場所にいつ到着し、いつ出発するのかを正確に把握できるようにします。`stop_times.txt` ファイルは、通常 GTFS フィードの中で最も大きなファイルです。  
一部のサービスは、特定の到着・出発時刻を持たず、一定の運行間隔（例: 5分ごとに運行する地下鉄路線）で運行されます。これは [Frequency-based services](../base_add-ons/#frequency-based-service) を使用してモデル化することができ、`stop_times.txt` と組み合わせて表現することもできます。

| 含まれるファイル                 | 含まれるフィールド   |
|----------------------------------|----------------------|
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`trip_id`, `arrival_time`, `departure_time`, `stop_id`, `stop_sequence`, `pickup_type`, `drop_off_type`, `timepoint` |

**前提条件**: 

- その他のすべての基本機能

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、1つの便(trip)における5つの停留所等(stop)の時刻表を定義しています。
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
