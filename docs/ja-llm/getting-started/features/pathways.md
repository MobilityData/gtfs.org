# :material-escalator: 構内通路(Pathways) {: #material-escalator-pathways}

構内通路(Pathways)の機能を利用することで、大規模な交通駅をモデル化し、乗客を駅の入口や出口から、交通機関の車両に乗車または降車する場所まで案内することができます。これらの機能の一部は、通路の物理的な特性や推定移動時間、そして駅で使用されている実際の経路案内システムを伝えることを可能にします。

## 構内通路(Pathway)接続 {: #pathway-connections}


基礎的なレベルにおいて、構内通路(Pathway)は、駅構内の Location Types で定義された主要なエリアを接続する基本的な機能を提供します。これらの接続は pathway を形成し、利用者が正確な経路案内（例: 出入口から乗車エリアまで）を得ることを可能にします。これは特に、大規模で複雑な交通駅を移動する際に有用です。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)|`pathway_id`, `from_stop_id`, `to_stop_id`, `pathway_mode`, `is_bidirectional` |

**前提条件**:

- [基本機能](../base)
- [Location Types](../base_add-ons/#location-types)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、事前に定義された場所（停留所等(stop)として定義）間の複数の接続（pathway とも呼ばれる）を定義しています。歩道 (`pathway_mode=1`)、階段 (`pathway_mode=2`)、改札口 (`pathway_mode=6`) が含まれています。双方向性も指定されています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | from_stop_id | to_stop_id | pathway_mode | is_bidirectional |
        |------------|--------------|------------|--------------|------------------|
        | MainSt-001 | A102_E01     | A102_S01   |            1 |                1 |
        | MainSt-002 | A102_S01     | A102_S02   |            2 |                1 |
        | MainSt-003 | A102_S02     | A102_F02   |            1 |                1 |
        | MainSt-004 | A102_F02     | A102_F01   |            6 |                1 |
        | MainSt-005 | A102_F01     | A102_S03   |            1 |                1 |
        | MainSt-006 | A102_S03     | A102_S04   |            2 |                1 |
        | MainSt-007 | A102_F01     | A102_S05   |            1 |                1 |
        | MainSt-008 | A102_S05     | A102_S06   |            2 |                1 |
        | MainSt-009 | A102_S04     | A102_B01   |            1 |                1 |
        | MainSt-010 | A102_S06     | A102_B02   |            1 |                1 |

## 構内通路(Pathway)の詳細 {: #pathway-details}

駅の構内通路(pathway)の物理的な特徴について、長さ、幅、傾斜（スロープの場合）、階段の段数（階段の場合）などの詳細を追加することができます。これにより、乗客は通行する必要がある構内通路(pathway)の状況やバリアフリー性を事前に把握することができます。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)|`max_slope`, `min_width`, `length`, `stair_count`|

**前提条件**:

- [基本機能](../base)
- [構内通路の接続(Pathway Connections)](#pathway-connections)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、既存の構内通路(pathway)に追加の詳細を定義したもので、最小幅、階段の段数、通路の長さや最大傾斜を含みます。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | max_slope | min_width | length | stair_count |
        |------------|-----------|-----------|--------|-------------|
        | MainSt-001 |         0 |       4.3 |    3.6 |             |
        | MainSt-002 |           |       2.2 |        |          15 |
        | MainSt-003 |      0.06 |         4 |    3.1 |             |
        | MainSt-004 |           |       0.9 |    2.9 |             |
        | MainSt-005 |         0 |       3.5 |      5 |             |
        | MainSt-006 |           |       2.2 |        |          18 |
        | MainSt-007 |         0 |       3.5 |      5 |             |
        | MainSt-008 |           |       2.2 |        |          18 |
        | MainSt-009 |         0 |         6 |      2 |             |
        | MainSt-010 |         0 |         6 |      2 |             |

## レベル {: #levels}


レベルは、駅構内のすべての異なる階層を一覧化するために使用でき、利用者に駅に関する追加情報を提供します。この機能により、構内通路(pathway)接続機能と組み合わせてエレベーターを利用することも可能になります。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[levels.txt](../../../documentation/schedule/reference/#levelstxt)|`level_id`, `level_index`, `level_name`|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`level_id`|

**前提条件**:

- [基本機能](../base)
- [Location Types](../base_add-ons/#location-types)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、駅における異なるレベルを示しています。場所（停留所等(stop)として定義）は、それぞれ対応するレベルに割り当てられます。 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | level_id          | level_index | level_name |
        |-------------------|-------------|------------|
        | level_0_street    |           0 | On street  |
        | level_-1_lobby    |          -1 | Lobby      |
        | level_-2_platform |          -2 | Platform   |


    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | stop_id      | level_id |
        |--------------|----------|
        | Station_A102 |          |
        | A102_B01     |       -2 |
        | A102_B02     |       -2 |
        | A102_E01     |        0 |
        | A102_S01     |        0 |
        | A102_S02     |       -1 |
        | A102_S03     |       -1 |
        | A102_S04     |       -2 |
        | A102_S05     |       -1 |
        | A102_S06     |       -2 |
        | A102_F01     |       -1 |
        | A102_F02     |       -1 |

## 駅構内の移動時間 {: #in-station-traversal-time}

駅構内の移動時間は、駅構内の経路案内に追加の詳細情報を提供し、利用者に駅を移動するために必要な推定時間を示すことで、より正確な経路案内と所要時間を実現します。

| 含まれるファイル                 | 含まれるフィールド |
|----------------------------------|-------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)|`traversal_time`|

**前提条件**: 

- [基本機能](../base)
- [構内通路(Pathway)の接続](#pathway-connections)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、各構内通路(pathway)を移動するのに必要な推定時間（秒単位）を示しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | traversal_time |
        |------------|----------------|
        | MainSt-001 |              3 |
        | MainSt-002 |             20 |
        | MainSt-003 |              2 |
        | MainSt-004 |              2 |
        | MainSt-005 |              4 |
        | MainSt-006 |             25 |
        | MainSt-007 |              4 |
        | MainSt-008 |             25 |
        | MainSt-009 |              2 |
        | MainSt-010 |              2 |

## 構内通路の案内表示(Pathway Signs) {: #pathway-signs}

構内通路の案内表示(Pathway Signs)は、旅程検索サービスに表示される情報と実際の案内表示をつなぐことができます。これがフィード内で表現されている場合、旅程検索サービスは「案内表示に従って進んでください」といった経路案内を提供することができます。

| 含まれるファイル                 | 含まれるフィールド   |
|----------------------------------|----------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)|`signposted_as`, `reversed_signposted_as`|

**前提条件**:

- [基本機能](../base)
- [構内通路の接続](#pathway-connections)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、事前に設定された構内通路に関連付けられた案内情報を指定しており、駅の実際の案内表示に表示されるテキストを反映しています。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | signposted_as    | reversed_signposted_as |
        |------------|------------------|------------------------|
        | MainSt-001 | to lobby         | Exit                   |
        | MainSt-002 |                  |                        |
        | MainSt-003 | To platforms     | Exit                   |
        | MainSt-004 |                  |                        |
        | MainSt-005 | Westbound trains | Exit                   |
        | MainSt-006 |                  |                        |
        | MainSt-007 | Eastbound trains | Exit                   |
        | MainSt-008 |                  |                        |
        | MainSt-009 | Westbound trains | To Lobby               |
        | MainSt-010 | Eastbound trains | To Lobby               |
