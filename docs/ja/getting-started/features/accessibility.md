# :material-wheelchair: アクセシビリティ
アクセシビリティ機能は、障害を持つ人々がサービスにアクセスするために必要な情報を提供することを目的としています。

## 停留所等の車椅子アクセシビリティ

停留所等の車椅子アクセシビリティを使用すると、指定された場所から車椅子で乗車できるかどうかを示すことができます。車椅子を使用する乗客にサービスを提供するには、車椅子で乗車できることを指定することは、不可能であることを指定することと同じくらい重要です。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-----------------------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)| `wheelchair_boarding` |

**前提条件**:

- [基本機能](../base)
- [停留所等の種別](../base_add-ons/#location-types) 出入口や乗車エリアなどの駅の場所のアクセシビリティ情報を定義する場合。

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、`wheelchair_boarding=1` を使用して停留所 `TAS001` で車椅子での乗車が可能であることを示しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name  | stop_lat  | stop_lon   | location_type | wheelchair_boarding |
        |---------|------------|-----------|------------|---------------|---------------------|
        | TAS001  | 5 Av/53 St | 40.760167 | -73.975224 |               |                   1 |

## 便車椅子でのアクセシビリティ

便車椅子でのアクセシビリティでは、車両が車椅子を使用する乗客に対応できるかどうかを示すことができます。車椅子を使用する乗客のサービスを提供するためには、車両が車椅子を使用する乗客に対応できることを指定することは、車両が対応できないことを指定するのと同じくらい重要です。乗客が特定の停留所で便にアクセスできるようにするには、停留所と便の両方が車椅子でアクセス可能でしなければならない 

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-----------------------------------|
| [trips.txt](../../../documentation/schedule/reference/#tripstxt)| `wheelchair_accessible` |

**前提条件**: 

- [基本機能](../base)

??? note "サンプル データ"

    <p style="font-size:16px">
    次のサンプルは、便 `AWE1` で使用される車両には少なくとも1台の車椅子を収容できる装備があり、便 `AWE2` で使用される車両にはそれがないことを示しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | wheelchair_accessible |
        |----------|------------|---------|-----------------------|
        | RA       | WE         | AWE1    |                     1 |
        | RA       | WE         | AWE2    |                     2 |

## テキスト読み上げ

テキスト読み上げ、Textを音声に変換するために必要な入力を提供できます。これにより、支援技術を使用してTextを読み上げる乗客が、交通サービスを利用するときに正しい停留所名を取得できるようになります。

| 含まれるファイル                   |含まれるフィールド   |
|----------------------------------|-------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`tts_stop_name` |

**前提条件**: 

- [基本機能](../base)

??? note "サンプル データ"

    <p style="font-size:16px">
    次のサンプルは、停留所名の読み取り可能なバージョンを提供し、テキスト読み上げツールで名前を読み上げることができます。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name  | stop_lat    | stop_lon   | tts_stop_name            |
        |---------|------------|-------------|------------|--------------------------|
        | TAS001  | 5 Av/53 St | 45.5035680  | -73.587079 | 5th avenue and 53 street |