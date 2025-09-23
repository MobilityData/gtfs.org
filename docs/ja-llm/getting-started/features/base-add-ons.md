# :material-plus-box-multiple-outline: 基本拡張機能 {: #material-plus-box-multiple-outline-base-add-ons}

これらの機能は Base で説明されている機能を拡張し、乗客により良い体験を提供するために GTFS データセットの包括性を高めたり、事業者、データベンダー、データ再利用者間の協力を促進したりする役割を果たします。これらの拡張には、Base で説明されているファイルに新しいフィールドを導入することや、新しいファイルを作成することが含まれる場合があります。

## フィード情報 {: #feed-information}


フィード情報は、フィードの有効期間（開始日と終了日）、公開している組織、GTFSデータセットやデータ公開方法に関する問い合わせ先など、フィードに関する重要な情報を伝達します。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[feed_info.txt](../../../documentation/schedule/reference/#feed_infotxt)|`feed_publisher_name`, `feed_publisher_url`, `feed_lang`, `default_lang`, `feed_start_date`, `feed_end_date`, `feed_version`, `feed_contact_email`, `feed_contact_url` |


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#feed_infotxt"><b>feed_info.txt</b></a> <br>
        </p>

        | feed_publisher_name	      | feed_publisher_url   | feed_lang | default_lang | feed_start_date | feed_end_date | feed_version | feed_contact_email | feed_contact_url             |
        |--------------------------|----------------------|-----------|--------------|-----------------|---------------|--------------|--------------------|------------------------------|
        | Greater Region Transport | https://www.gra1.org | en        | en           |        20240101 |      20241231 |          3.1 | support@gra1.org   | https://www.gra1.org/support |

## ルート形状(Shapes) {: #shapes}

ルート形状(Shapes)は便(trip)に関連付けることができ、経路検索アプリケーションが便を地図上に表示し、乗客に公共交通機関で移動する距離を知らせることを可能にします。`shape_dist_traveled` フィールドは、乗客に地図を表示する際にルート形状のどの部分を描画するかをプログラム的に決定するために使用されます。  
ルート形状を定義する際には、道路の正確な曲線に従うといった詳細さと、必要な情報だけを効率的に伝えることとのバランスを取る必要があります。

|含まれるファイル                             |含まれるフィールド            |
|----------------------------------|-------------------|
|[shapes.txt](../../../documentation/schedule/reference/#shapestxt)                        |`shape_id`, `shape_pt_lat`, `shape_pt_lon`, `shape_pt_sequence`, `shape_dist_traveled`           |
|[trips.txt](../../../documentation/schedule/reference/#tripstxt)                         |`shape_id`           |
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)                    |`shape_dist_traveled`|


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、TriMet の GTFS フィードから取得したルート形状の一部を示しています（<a href="https://developer.trimet.org/GTFS.shtml">こちら</a>からダウンロードできます）。 <br><br>
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#shapestxt">shapes.txt</a> <br>
        </p>
    
        | shape_id | shape_pt_lat | shape_pt_lon | shape_pt_sequence | shape_dist_traveled |
        | --------- | ------------- | ------------- | ------------------ | ------------------- |
        | 558674     | 45.47623       | -122.721885    | 1                   | 0.0                  |
        | 558674     | 45.476235      | -122.72236     | 2                   | 121.9                |
        | 558674     | 45.476237      | -122.722523    | 3                   | 163.7                |
        | 558674     | 45.476242      | -122.723024    | 4                   | 292.2                |
        | 558674     | 45.476244      | -122.72316     | 5                    | 327.1               |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt">trips.txt</a> <br>
        </p>
        
        |trip_id |shape_id|
        |--------|--------|
        |13302375|558674  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt">stop_times.txt</a> <br>
        </p>
        
        |trip_id |stop_sequence|shape_dist_traveled|
        |--------|-------------|-------------------|
        |13302375|1            |0                  |
        |13302375|2            |461.7              |
        |13302375|3            |1245               |

## ルートカラー {: #route-colors}


ルートカラーを使用することで、事業者のデザインガイドラインによって特定のルートに割り当てられた配色を正確に表現し、伝えることができます。これにより、利用者は公式の色によって交通サービスを容易に識別することができます。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[routes.txt](../../../documentation/schedule/reference/#routestxt)|`route_color`, `route_text_color` |


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、ルート `RA` が HEX カラーコード `D95700` を使用してオレンジ色であり、テキストは HEX カラーコード `0` を使用して黒で表示されるべきであることを示しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | agency_id | route_short_name | route_long_name    | route_type | route_color | route_text_color |
        |----------|-----------|------------------|--------------------|------------|-------------|------------------|
        | RA       | agency001 |               17 | Mission - Downtown |          3 | D95700      |                0 |

## 自転車持ち込み可否 {: #bike-allowed}


自転車持ち込み可否は、特定の便(trip)で使用される車両が自転車を収容できるかどうかを示し、利用者がマルチモーダルな旅程を計画・利用できるように支援します。

| 含まれるファイル                | 含まれるフィールド |
|----------------------------------|-------------------|
|[trips.txt](../../../documentation/schedule/reference/#tripstxt)|`bikes_allowed` |


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、便 `AWE1` で使用される車両が少なくとも1台の自転車を車内に収容できること（`bikes_allowed=1`）、および便 `AWE2` で使用される車両は収容できないこと（`bikes_allowed=2`）を示しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | bikes_allowed |
        |----------|------------|---------|---------------|
        | RA       | WE         | AWE1    |             1 |
        | RA       | WE         | AWE2    |             2 |

## 行先表示(Headsigns) {: #headsigns}


行先表示(headsigns)は、便(trip)の目的地を示す車両の表示を伝えるために使用され、利用者が正しい交通サービスを識別しやすくすることができます。この機能は、特定のルート(route)に沿った行先表示の変更をサポートします。

| 含まれるファイル                 | 含まれるフィールド   |
|----------------------------------|----------------------|
|[trips.txt](../../../documentation/schedule/reference/#tripstxt)|`trip_headsign` |
|[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`stop_headsign`|

**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルでは、最初の表で便(trip) `AWE1` と `AWE2` に使用される行先表示を指定し、2つ目の表では `AWE1` の行先表示が停留所等(stop) `TAS004` 以降で変更され、`trips.txt` に指定されたものを上書きすることを示しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | trip_headsign |
        |----------|------------|---------|---------------|
        | RA       | WE         | AWE1    | Downtown      |
        | RA       | WE         | AWE2    | Mission       |

    
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign          |
        |---------|--------------|----------------|---------|---------------|------------------------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |                        |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |                        |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |                        |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 | Downtown - Main Square |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 | Downtown - Main Square |

## ロケーションタイプ {: #location-types}


ロケーションタイプは、出入口、ノード、乗車エリアなどの交通駅内の主要なエリアを分類し、それらの関係を表すために使用されます。ロケーションタイプは、構内通路(pathway)を用いた交通駅のモデリングの基盤となります。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`location_type`, `parent_station` |


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、`stops.txt` 内の交通駅における複数のロケーションを示しています。親駅は主要なロケーションを表し、その子ロケーションとしてプラットフォーム、出入口、汎用ノードなどが含まれます。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id      | stop_name                                             | location_type | parent_station |
        |--------------|-------------------------------------------------------|---------------|----------------|
        | Station_A102 | Main Street station                                   |             1 |                |
        | A102_B01     | Main Street station - North Platform                  |             0 | Station_A102   |
        | A102_B02     | Main Street station - South Platform                  |             0 | Station_A102   |
        | A102_E01     | Main Street station - Entrance/Exit                   |             2 | Station_A102   |
        | A102_S01     | Main Street station - Top of entrance stairs          |             3 | Station_A102   |
        | A102_S02     | Main Street station - Bottom of entrance stairs       |             3 | Station_A102   |
        | A102_S03     | Main Street station - Top of north platform stairs    |             3 | Station_A102   |
        | A102_S04     | Main Street station - Bottom of north platform stairs |             3 | Station_A102   |
        | A102_S05     | Main Street station - Top of south platform stairs    |             3 | Station_A102   |
        | A102_S06     | Main Street station - Bottom of south platform stairs |             3 | Station_A102   |
        | A102_F01     | Main Street station - Paid side of fare gate          |             3 | Station_A102   |
        | A102_F02     | Main Street station - Unpaid side of fare gate        |             3 | Station_A102   |

## 頻度(frequencies) {: #frequencies}


頻度は、一定の間隔で運行するサービスをモデル化するために使用することができます。例えば、10分ごとに運行するバスや、指定された時間帯に2分間隔で運行する地下鉄サービスなどです。  
一定の間隔で運行するサービスをモデル化する場合、`stop_times.txt` には停留所間の相対的な時間が含まれており、これに基づいて乗客に表示する時刻を決定します。 

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[frequencies.txt](../../../documentation/schedule/reference/#frequenciestxt)|`trip_id`, `start_time`, `end_time`, `headway_secs`, `exact_times` |


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは2つの異なる便を示しています。便 `AWE1` は30分ごとに運行します (`headway_secs=1800`)。便 `AWE2` は15分ごとに運行します (`headway_secs=900`)。  
    <p style="font-size:16px">
    `exact_times` フィールドは、スケジュールが 'start_time' フィールドに入力された正確な開始時刻に従うかどうかを示します: 
    - 便 `AWE1` は午前6:10から正午12:00まで30分ごとに出発します。
    - 便 `AWE2` は午前6:00、6:15、6:30といった具合に出発します。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#frequenciestxt"><b>frequencies.txt</b></a> <br>
        </p>

        | trip_id | start_time | end_time | headway_secs | exact_times |
        ---------|------------|----------|--------------|-------------|
         AWE1    |    6:10:00 | 12:00:00 |         1800 |           0 |
         AWE2    |    6:00:00 | 19:50:00 |          900 |           1 |

## 乗り換え(Transfers) {: #transfers}


乗り換えは、異なる移動区間（乗車区間(leg)）間の接続に関する詳細を提供し、経路検索システムが乗り換えを含む旅程(journey)の実現可能性を判断できるようにします。乗り換えを指定することは、乗客が他の場所で乗り換えできないことを意味するものではなく、特定の乗り換えが不可能であるか、または乗り換えに必要な最小時間があるかを示すものです。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[transfers.txt](../../../documentation/schedule/reference/#transferstxt)|`from_stop_id`, `to_stop_id`, `from_route_id`, `to_route_id`, `from_trip_id`, `to_trip_id`, `transfer_type`, `min_transfer_time` |


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは3種類の異なる乗り換えを示しています。1つは停留所等(stop)間の乗り換えで、最小乗り換え時間が5分必要なもの、1つは2つのルート・路線系統(route)間の時刻調整された乗り換えポイント、もう1つは同じ車両によって運行される2つの便(trip)間の座席に座ったままの乗り換えです。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#transferstxt"><b>transfers.txt</b></a> <br>
        </p>

        | from_stop_id | to_stop_id | from_route_id | to_route_id | from_trip_id | to_trip_id | transfer_type | min_transfer_time |
        |--------------|------------|---------------|-------------|--------------|------------|---------------|-------------------|
        | s6           | s7         |               |             |              |            |             2 |               300 |
        |              |            |               |             | PL04-003     | DL57-008   |             4 |                   |
        |              |            | BR09          | CR01        | BR09-012     | CR01-005   |             1 |                   |

## 翻訳 {: #translations}


翻訳を利用することで、駅名などのサービス情報を複数の言語で提供することができ、旅行プランナーはユーザーの言語や位置情報の設定に応じて特定の言語で情報を表示することができます。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[translations.txt](../../../documentation/schedule/reference/#translationstxt)|`table_name`,`field_name`,`language`,`translation`,`record_id`,`record_sub_id`,`field_value` |


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、`routes.txt` で使用される2つのフィールド `route_long_name` と `route_desc` に対して、フランス語とスペイン語の翻訳が提供されている例です。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#translationstxt"><b>translations.txt</b></a> <br>
        </p>

        | table_name | field_name      | language | translation                                           | record_id | record_sub_id | field_value |
        |------------|-----------------|----------|-------------------------------------------------------|-----------|---------------|-------------|
        | routes     | route_long_name | ES       | Mission - Centro                                      | RA        |               |             |
        | routes     | route_long_name | FR       | Mission - Centre ville                                | RA        |               |             |
        | routes     | route_desc      | ES       | La ruta "A" viaja desde Lower Mission hasta el centro | RA        |               |             |
        | routes     | route_desc      | FR       | La route « A » relie Lower Mission au centre-ville.   | RA        |               |             |

## 帰属情報 {: #attributions}


帰属情報(attributions)を使用すると、データセットの作成に関与した組織（プロデューサー、運行事業者、当局など）に関する追加の詳細を共有することができます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[attributions.txt](../../../documentation/schedule/reference/#attributionstxt) |`attribution_id`, `agency_id`, `route_id`, `trip_id`, `organization_name`, `is_producer`, `is_operator`, `is_authority`, `attribution_url`, `attribution_email`, `attribution_phone` |


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px"> 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#attributionstxt"><b>attributions.txt</b></a> <br>
        </p>

        | attribution_id | agency_id | route_id | trip_id | organization_name        | is_producer | is_operator | is_authority | attribution_url                  | attribution_email       | attribution_phone |
        |----------------|-----------|----------|---------|--------------------------|-------------|-------------|--------------|----------------------------------|-------------------------|-------------------|
        | op01           | tb        |          |         | Transit Bus              |             |           1 |              | https://www.transitbus.org/fares | contact@transitbus.org  | (777) 555-7777    |
        | au01           | gra       |          |         | Greater Region Transport |           1 |             |            1 | https://www.gra1.org             | contact@gra1.org        | (555) 555-5555    |
        | op02           |           | rtd023   |         | Bus company A            |             |           1 |              | https://www.buscompanya.com      | contact@buscompanya.com | (333) 333-3333    |
        | op03           |           | rtd025   |         | Bus company B            |             |           1 |              | https://www.buscompanyb.com      | contact@buscompanyb.com | (888) 888-8888    |
