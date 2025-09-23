# :material-wheelchair: アクセシビリティ {: #material-wheelchair-accessibility}

アクセシビリティ機能は、障害のある人々がサービスを利用するために必要な情報を提供することを目的としています。

## 停留所等の車椅子対応状況 {: #stops-wheelchair-accessibility}


停留所等の車椅子対応状況は、指定された場所から車椅子での乗降が可能かどうかを示すことができます。車椅子を利用する乗客に対応するためには、車椅子での乗降が可能であることを指定することは、それが不可能であることを指定するのと同じくらい重要です。

| 含まれるファイル                | 含まれるフィールド |
|----------------------------------|-------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`wheelchair_boarding` |

**前提条件**:

- [基本機能](../base)
- 駅の入口/出口や乗車エリアなどの場所に関するアクセシビリティ情報を定義する場合は、[Location Types](../base_add-ons/#location-types)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、`wheelchair_boarding=1` を使用して停留所等 `TAS001` で車椅子での乗降が可能であることを示しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name  | stop_lat  | stop_lon   | location_type | wheelchair_boarding |
        |---------|------------|-----------|------------|---------------|---------------------|
        | TAS001  | 5 Av/53 St | 40.760167 | -73.975224 |               |                   1 |

## 便の車椅子対応状況 {: #trips-wheelchair-accessibility}

便の車椅子対応状況は、車両が車椅子を利用する乗客に対応できるかどうかを示すことを可能にします。車椅子を利用する乗客に対応するためには、車両が車椅子を利用する乗客に対応できることを指定することと、対応できないことを指定することの両方が同じくらい重要です。乗客が特定の停留所等(stop)で便(trip)を利用できるためには、その停留所等(stop)と便(trip)の両方が車椅子対応でなければなりません。

| 含まれるファイル                | 含まれるフィールド |
|----------------------------------|-------------------|
|[trips.txt](../../../documentation/schedule/reference/#tripstxt)|`wheelchair_accessible`|

**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、便(trip) `AWE1` で使用される車両が少なくとも1台の車椅子に対応できる装備を備えており、便(trip) `AWE2` で使用される車両は対応していないことを示しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | wheelchair_accessible |
        |----------|------------|---------|-----------------------|
        | RA       | WE         | AWE1    |                     1 |
        | RA       | WE         | AWE2    |                     2 |

## 読み上げ用フィールド(Text-to-Speech) {: #text-to-speech}


読み上げ用フィールド(Text-to-Speech)は、テキストを音声に変換するために必要な入力を提供し、支援技術を使用してテキストを読み上げる乗客が、公共交通サービスを利用する際に正しい停留所等(stop)名を取得できるようにします。

| 含まれるファイル                 | 含まれるフィールド   |
|----------------------------------|---------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`tts_stop_name` |

**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、停留所等(stop)名の読み上げ可能なバージョンを提供し、読み上げ用ツールが名前を音声で読み上げられるようにします。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name  | stop_lat    | stop_lon   | tts_stop_name            |
        |---------|------------|-------------|------------|--------------------------|
        | TAS001  | 5 Av/53 St | 45.5035680  | -73.587079 | 5th avenue and 53 street |
