# ゾーンベース運賃 (Zone-Based Fares) {: #zone-based-fares}


*主なファイル: fare_leg_rules.txt, areas.txt, stop_areas.txt*  
*例: [Translink (バンクーバー)](../intro/#translink-vancouver)*

!!! info "リマインダー"

    ゾーンベース運賃は、ゾーンベースの運賃体系を表現するために使用されます。これは、特定のゾーンから別のゾーンへ移動する際に特定の運賃が適用される仕組みです。ゾーンは、エリアまたは停留所等(stop)のグループによって定義されます。詳細については、イントロダクションページの [機能のセクション](../intro/#fares-features-and-their-files) を参照してください。

!!! Note

    このセクションには、非接触型運賃(コンタクトレス運賃)の例のみが含まれています。他のチケットメディア(fare media)タイプをサポートするには、該当する `fare_products.txt` の行を複製し、金額および `fare_media_id` フィールドを適切に更新してください。

## ゾーンの定義 {: #define-zones}

ゾーン制運賃で運行されるルート・路線系統(route)では、そのルートが停車する各停留所等(stop)はゾーンに属しています。ゾーンは `areas.txt` に以下のように作成します。

1. **area_id** にゾーンの一意の識別子を入力します。  
2. **area_name** にゾーンの名称を入力します。

ゾーンに関する詳細は [ドキュメントを参照してください](../../../reference/#areastxt)。

!!! info "リマインダー"

    [Translink](../intro/#translink-vancouver) では、バスは均一運賃を使用しますが、SkyTrain と SeaBus はゾーン制運賃を使用します。各停留所等(stop)は 3つのゾーンのいずれかに割り当てられています: ZN1, ZN2, ZN3。

    - **1ゾーン** 運賃は、同一ゾーン内のみの乗車区間(leg)に適用されます (ZN1 → ZN1, ZN2 → ZN2, ZN3 → ZN3)  
    - **2ゾーン** 運賃は、2つのゾーンをまたぐ乗車区間(leg)に適用されます (ZN1 → ZN2, ZN2 → ZN3)  
    - **3ゾーン** 運賃は、3つすべてのゾーンをまたぐ乗車区間(leg)に適用されます (ZN1 → ZN3、ZN2を経由)

    さらに、ZN2 内には追加のゾーン「Sea Island」があり、**バンクーバー国際空港 (YVR)**、**Sea Island Centre**、**Templeton** 駅が含まれます。 

    * Sea Island から出発する旅程(journey)は、ZN2 から出発する旅程に比べて追加で CAD 5.00 が課金されます。  
    * Sea Island で終了する旅程は、ZN2 で終了する旅程と同額です。Sea Island 内のみで完結する旅程は無料です。

この例では、4つのエリアが作成されます。各ゾーンごとに1つと、追加で Sea Island 用に1つです。各ゾーンには一意の識別子 (`ZN1`, `ZN2`, `ZN3`, `sea_island`) と、それぞれの名称が `area_name` に割り当てられます。 

[**areas.txt**](../../../reference/#areastxt)

| area_id | area_name |
| :---- | :---- |
| ZN1 | Zone 1 - Vancouver |
| ZN2 | Zone 2 - Burnaby, Richmond and North Vancouver |
| ZN3 | Zone 3 - Surrey and Coquitlam |
| sea_island | Sea Island (Vancouver Airport YVR Airport, Sea Island Centre, Templeton) |

## 停留所等(stop)をゾーンに割り当てる {: #assign-stops-to-zones}

`stops.txt` に含まれる各停留所等(stop)は、それを含むゾーンに割り当てる必要があります。停留所等(stop)は `stop_areas.txt` 内で以下のようにゾーンと関連付けられます。

1. **stop_id** に `stops.txt` の停留所等(stop)の id を入力します  
2. **area_id** に `areas.txt` のゾーンの id を入力します

ゾーンに関する詳細は [ドキュメントを参照してください](../../../reference/#areastxt)。

この例では、Translink のサービスエリア内の各停留所等(stop)が `ZN1`、`ZN2`、または `ZN3` に割り当てられています。Sea Island の停留所等(stop)（`99901`、`99902`、`99903`）は、`ZN2` と `sea_island` の両方に存在するため、両方に関連付けられています。この後のセクションでは、`rule_priority` を使用して `sea_island` と `ZN2` の乗車区間(leg)を区別します。

[**stop_areas.txt**](../../../reference/#stop_areastxt)

| stop_id | area_id |
| :---- | :---- |
| 8039 | ZN1 |
| 8066 | ZN2 |
| … | … |
| 99901 | ZN2 |
| 99902 | ZN2 |
| 99903 | ZN2 |
| 99901 | sea_island |
| 99902 | sea_island |
| 99903 | sea_island |

以下は `stops.txt` の一部を抜粋したもので、`stop_areas.txt` に登場するいくつかの stop_id を示しています。

[**stops.txt**](../../../reference/#stopstxt)

| stop_id | stop_name |
| :---- | :---- |
| 8039 | Waterfront Station @ Platform 2 |
| 8066 | Edmonds Station @ Platform 1 |
| 99901 | YVR-Airport Station @ Canada Line |
| … | … |

## 運賃商品の作成 {: #create-fare-products}

[ルートベース運賃](../route-based-fares)と同様に、ゾーンベース運賃の運賃商品は `fare_products.txt` に以下のように作成します。

1. **fare_product_id** 列に、運賃商品を識別する一意のIDを入力します。  
2. **fare_product_name** 列に、乗客向けの運賃商品の名称を入力します（例: 1-Zone Fare、2-Zone Fare、1-Zone Fare Monthly）。  
3. **amount** 列と **currency** 列に、運賃の金額とその通貨を入力します（[通貨コード](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)）。  
4. **fare_media_id** 列に、この運賃商品を保存・利用できるチケットメディアを入力します。  
    * これは `fare_media.txt` の **fare_media_id** を参照する外部キーです（[Fare Media](../../../reference/#faremediatxt)）。  
    * 複数のチケットメディアを同じ運賃商品に関連付けることができ、価格が異なる場合もあります。  
    * **fare_media_id** が空の場合、そのチケットメディアは不明であることを意味します。

運賃商品の詳細については、[ドキュメントを参照してください](../../../reference/#fare_productstxt)。

この例では、`fare_products.txt` に各ゾーンベース運賃に対応する運賃商品を作成しています。

* 1ゾーン運賃: CAD 3.20 — 旅程が1つのゾーン内で完結する場合。  
* 2ゾーン運賃: CAD 4.65 — 旅程が1つのゾーンから別のゾーンにまたがる場合。  
* 3ゾーン運賃: CAD 6.35 — 旅程がゾーン1からゾーン2（またはSea Island）を経由してゾーン3に至る場合。  
* 1ゾーンSea Island運賃: CAD 8.20（CAD 5.00 + CAD 3.20）— Sea Islandからゾーン2への旅程。  
* 2ゾーンSea Island運賃: CAD 9.65（CAD 5.00 + CAD 4.65）— Sea Islandからゾーン1またはゾーン3への旅程。  
* Sea Island内の旅程: CAD 0 — Sea Island内で開始し終了する場合。

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | amount | currency | fare_media_id |
| :---- | :---- | :---- | :---- | :---- |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | contactless |
| 1_zone_fare | 1-Zone Fare | 3.20 | CAD | contactless |
| 2_zone_fare | 2-Zone Fare | 4.65 | CAD | contactless |
| 3_zone_fare | 3-Zone Fare | 6.35 | CAD | contactless |
| sea_island_1_zone_fare | Sea Island travel + 1-zone Fare | 8.20 | CAD | contactless |
| sea_island_2_zone_fare | Sea Island travel + 2-zone fare | 9.65 | CAD | contactless |
| sea_island_sea_island_fare | Free fare inside Sea Island | 0 | CAD | contactless |

## ルート・路線系統(route)をグループ化するネットワークの作成 {: #create-networks-that-group-the-routes}

ゾーン制運賃の場合、同じ運賃体系を持つため、該当するルート・路線系統(route)をネットワークにまとめる必要があります。

ネットワークは `networks.txt` で次のように作成します:

1. **network_id** 列にネットワークを識別する一意のIDを入力します。  
2. **network_name** 列にネットワークの名称を入力します（例: Translink Buses, TTC Subway, STM All Routes）。

ネットワークの詳細については [ドキュメントを参照してください](../../../reference/#networkstxt)。

[Translink](../intro/#translink-vancouver) の場合、バスは以前、独自のネットワークに分けられていました（[ルートベース運賃](../route-based-fares) セクションを参照）。これは、バスが均一運賃体系を持っているためです。同様に、SkyTrain と Seabus は、運賃が通過ゾーン数に依存するため、1つのネットワークにまとめられます。`skytrain_seabus` という `network_id` が作成されます。

[**networks.txt**](../../../reference/#networkstxt)

| network_id | network_name |
| :---- | :---- |
| skytrain_seabus | SkyTrain and SeaBus |

## ルートをネットワークに関連付ける {: #associate-routes-to-networks}


ネットワークを作成した後、それに含まれるルートを関連付ける必要があります。ルートは `route_networks.txt` 内で次のようにネットワークに関連付けられます。

1. **route_id** 列に、`routes.txt` 内のルートの ID を入力します。
2. **network_id** 列に、`networks.txt` 内の対応するネットワークの ID を入力します。

ルートネットワークの詳細については、[ドキュメントを参照してください](../../../reference/#route_networkstxt)。

この例では、SkyTrain のルート（Canada Line、Millennium Line、Expo Line）および SeaBus の `route_id` が、`route_networks.txt` 内で `network_id` `skytrain_seabus` に関連付けられています。以下のスナップショットでは、*13686* が Canada Line の `route_id`、`30052` が Millennium Line の `route_id` です。

[**route_networks.txt**](../../../reference/#route_networkstxt)

| route_id | network_id |
| :---- | :---- |
| 13686 | skytrain_seabus |
| 30052 | skytrain_seabus |
| … | … |

## 運賃区間ルールの作成 {: #create-fare-leg-rules}


!!! info "リマインダー"

    **乗車区間(leg)**: 特定のサービスまたはルート上で、通常は2つの停留所等(stop)間を、乗り換えなしで移動する旅程の連続した1区間。

    **乗車区間グループ(Leg Group)**: `fare_leg_rules.txt` ファイルの文脈で定義される、特定の共通属性や運賃条件を共有する1つ以上の乗車区間の集合。

乗車区間の運賃は、運賃区間ルールを用いて乗車区間をチケット商品に対応付けることで決定されます。ゾーンベース運賃の場合、運賃区間ルールは、ゾーン間（`areas.txt` で定義）を運行するルートのネットワーク（`networks.txt` で作成）を、チケット商品（`fare_products.txt` で作成）に関連付けます。

ゾーンベースの運賃区間ルールは、`fare_leg_rules.txt` に以下のように作成します:

1. **leg_group_id** 列に、乗車区間グループを識別する一意のIDを入力します。  
2. **network_id** 列に、乗車区間に含まれるルートが属するネットワークのIDを入力します。  
    * これは `networks.txt` の **network_id** を参照する外部キーです。  
3. **from_area_id** に、乗車区間の出発ゾーンのIDを入力します。  
4. **to_area_id** に、乗車区間の到着ゾーンのIDを入力します。  
5. **fare_product_id** 列に、乗車区間の運賃を決定するチケット商品のIDを入力します。  
    * これは `fare_products.txt` の **fare_product_id** を参照する外部キーです。

運賃区間ルールの詳細については、[ドキュメントを参照してください](../../../reference/#fare_leg_rulestxt)。

この例では、考えられるゾーンの組み合わせごとに複数の乗車区間グループが追加されています。例えば、`ZN1_ZN1` は `from_area_id=ZN1` かつ `to_area_id=ZN1` であるため、ゾーン1内に留まる乗車区間を表します。`ZN1_ZN1` は `fare_product_id=1_zone_fare` に関連付けられています。  

以下の例では `ZN1_ZN2` が2回記載されている点に注意してください。最初は (`from_area_id=ZN1`, `to_area_id=ZN2`) として、次に (`from_area_id=ZN2`, `to_area_id=ZN1`) として2行目に記載されています。これは、`ZN1_ZN2` が `ZN1` と `ZN2` の間の両方向の移動に対応する運賃ルールを持つ乗車区間グループであることを意味します。

!!! Note

    以下の例には Sea Island の運賃区間ルールは含まれていません。これについては次のステップで扱います。

[**fare_leg_rules.txt**](../../../reference/#fare_leg_rulestxt)

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id |
| :---- | :---- | :---- | :---- | :---- |
| … | … | … |  |  |
| ZN1_ZN1 | skytrain_seabus | 1_zone_fare | ZN1 | ZN1 |
| ZN2_ZN2 | skytrain_seabus | 1_zone_fare | ZN2 | ZN2 |
| ZN3_ZN3 | skytrain_seabus | 1_zone_fare | ZN3 | ZN3 |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN1 | ZN2 |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN2 | ZN1 |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN2 | ZN3 |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN3 | ZN2 |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN1 | ZN3 |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN3 | ZN1 |

## 重複するゾーンの優先順位付け {: #prioritize-overlapping-zones}

場合によっては、複数のゾーンが同じ停留所(stop)を共有することがあります。これにより、乗車区間(leg)に運賃区間ルール(fare leg rule)を適用する際に、どのゾーンを使用すべきか曖昧になる可能性があります。これを解決するために、`fare_leg_rules.txt` の `rule_priority` フィールドが使用されます。これは、一致するルールが適用される順序を決定するもので、`rule_priority` の値が高いルールは、値が低いまたは空のルールよりも優先されます。

これは `fare_leg_rules.txt` において以下のように行われます。

1. 前のステップの手順に従って、考えられるすべての運賃区間ルールを作成します。  
2. **rule_priority** に区間の優先順位を入力します。**rule_priority** の値が高いほど、その運賃区間ルールの優先度が高くなります。

運賃区間ルールの詳細については、[ドキュメントを参照してください](../../../reference/#fare_transfer_rulestxt)。

この例では、Sea Island が Zone 2 内に存在するため、もし乗車区間が Sea Island から始まり Zone 2 で終わる場合、それは「Sea Island から Zone 2」区間なのか、「Zone 2 から Zone 2」区間なのか、あるいは「Sea Island から Sea Island」区間なのか、という曖昧さが生じます。実際には、その区間は3つすべての可能性に一致するため、曖昧さが発生します。

まず、Sea Island から始まる区間を追加します。

* 区間 `sea_island_ZN1` および `sea_island_ZN3` は、いずれも CAD 5.00 + 2ゾーン運賃です。  
* 区間 `sea_island_ZN2` は CAD 5.00 + 1ゾーン運賃です。  
* 区間 `sea_island_sea_island` は無料です。  

次に、`rule_priority` に適切な値を入力します。

* `sea_island_sea_island` は最も高い優先度 (`rule_priority=2`) を持ちます。これにより、乗車区間の出発停留所(stop)と到着停留所(stop)が `sea_island`（Zone 2 内）にある場合、優先される区間は `sea_island_sea_island` になります。  
* Sea Island から始まり、他の場所（Zone 1、Zone 3、Sea Island 外の Zone 2）で終わる区間は `rule_priority=1` です。  
* 残りの区間は最も低い優先度を持ち、`rule_priority=0`（または空）となります。  

[**fare_leg_rules.txt**](../../../reference/#fare_leg_rulestxt)

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id | rule_priority |
| :---- | :---- | :---- | :---- | :---- | :---- |
| … | … | … |  |  |  |
| sea_island_ZN1 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN1 | 1 |
| sea_island_ZN2 | skytrain_seabus | sea_island_1_zone_fare | sea_island | ZN2 | 1 |
| sea_island_ZN3 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN3 | 1 |
| sea_island_sea_island | skytrain_seabus | sea_island_sea_island_fare | sea_island | sea_island | 2 |
| ZN1_ZN1 | skytrain_seabus | 1_zone_fare | ZN1 | ZN1 |  |
| ZN2_ZN2 | skytrain_seabus | 1_zone_fare | ZN2 | ZN2 |  |
| ZN3_ZN3 | skytrain_seabus | 1_zone_fare | ZN3 | ZN3 |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN1 | ZN2 |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN2 | ZN1 |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN2 | ZN3 |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN3 | ZN2 |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN1 | ZN3 |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN3 | ZN1 |  |
