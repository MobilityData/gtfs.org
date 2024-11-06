# :material-escalator: 構内通路

構内通路機能は、大規模な交通事業者の駅をモデル化し、駅の入口や出口から、交通事業者の車両に乗車または降車する場所まで乗客を誘導することができます。これらの機能の一部は、経路の物理的特性と推定ナビゲーション時間、および駅で採用されている実際の道案内システムを伝えることを可能にします。

## 構内通路の接続

基礎レベルでは、構内通路は、駅内の停留所等の種別で定義された主要なエリアを接続するための基本機能を提供します。これらの接続は構内通路を形成し、ユーザーが正確な方向 (入口から乗車エリアまでなど) を取得できるようにします。これは、大規模で複雑な交通事業者の駅をナビゲートする際に特に役立ちます。

| 含まれるファイル                      | 含まれるフィールド   |
|----------------------------------|-------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `pathway_id`、`from_stop_id`、`to_stop_id`、`pathway_mode`、`is_bidirectional` |

**前提条件**: 

- [基本機能](../ベース)
- [停留所等の種別](../base_add-ons/#location-types)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルでは、​​事前に設定された場所 ( 停留所等として定義) 間の複数の接続 ( 構内通路とも呼ばれる) を定義します: 歩道 ( `pathway_mode=1`)、階段 (`pathway_mode=2`)、および改札口 (`pathway_mode=6`)。双方向性も指定されています。
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

## 構内通路の詳細

駅の構内通路の物理的特性に関する詳細を追加できます。これには、長さ、幅、傾斜 (スロープの場合)、または階段の数 (階段の場合) が含まれます。これにより、乗客は移動する必要がある経路の状態とアクセシビリティを予測できます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `max_slope`、`min_width`、`length`、`stair_count`|

**前提条件**: 

- [基本機能](../ベース)
- [構内通路の接続](#pathway-connections)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルでは、​​階段の最小幅、段数、歩道の長さと最大勾配など、事前に確立された構内通路に対する追加の詳細を定義します。
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

## 階・フロア

階・フロアを使用すると、駅内のすべての異なる階・フロアを一覧表示して、ユーザーに駅に関する追加レイヤーの情報を提供できます。この機能により、構内通路接続機能と組み合わせてエレベーターを使用することもできます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
| [levels.txt](../../../documentation/schedule/reference/#levelstxt)| `level_id`、`level_index`、`level_name`|
| [stops.txt](../../../documentation/schedule/reference/#stopstxt)| `level_id`|

**前提条件**: 

- [基本機能](../ベース)
- [停留所等の種別](../base_add-ons/#location-types)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、駅のさまざまな階・フロアを示しています。場所 (停留所等として定義) は、対応するレベルに割り当てられます。
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

## 駅構内移動時間

駅構内移動時間は、駅構内案内にさらに詳しい情報を提供し、駅を移動するために必須推定時間をユーザーに提供することで、より適切な移動経路と移動時間を実現します。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-----------------------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `traversal_time`|

**前提条件**:  

- [基本機能](../ベース)
- [構内通路の接続](#pathway-connections)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、各経路を移動するために必要な推定移動時間 (秒単位) を示しています。
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

## 通路標識

通路標識は、便計画者に表示される情報と現実世界の標識を結び付けることができます。これがフィードで表現されている場合、便計画者は`標識に従ってください`などの道順を提供できます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-----------------------------------|
|[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `signposted_as`、`reversed_signposted_as`|

**前提条件**: 

- [基本機能](../ベース)
- [構内通路の接続](#pathway-connections)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、駅の物理的な標識に表示されるTextを反映して、事前に確立された構内通路に関連付けられたナビゲーション情報を指定します。
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