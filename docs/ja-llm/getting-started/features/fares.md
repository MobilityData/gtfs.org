# :material-cash: 運賃 {: #material-cash-fares}

GTFS は、世界中のさまざまな交通事業者が使用している多様な運賃体系を正確にモデル化することができます。例えば、ゾーン制、移動距離制、時間帯制などです。GTFS 運賃は、乗客に対して便(trip)に適用される価格と、支払いに使用できるチケットメディアを知らせます。

## チケット商品(Fare Products) {: #fare-products}


チケット商品(Fare Products)は、交通事業者がサービスを利用するために提供するチケットや運賃の種類（例: 片道運賃、月額パス、乗り換え料金など）を一覧化したものです。チケット商品は事業者の運賃体系をモデル化する基盤となり、`fare_leg_rules.txt` に記載された仕組みを通じて交通サービスに関連付けられます。チケット商品がルート・路線系統(route)、エリア、時間などのさまざまな旅行条件に関連付けられることで、個々の乗車区間(leg)や乗り換えにかかる運賃が決定されます。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)|`fare_product_id`, `fare_product_name`, `amount`, `currency`, `fare_media_id` |
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`fare_product_id`|


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、単純なチケット商品（片道 $2.75 USD）を示しています。 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_productstxt"><b>fare_products.txt</b></a> <br>
        </p>

        | fare_product_id  | fare_product_name      | amount  | currency  |
        |------------------|--------------------    |---      |---        |
        | single_ride      | Single Ride Fare       |  2.75   | USD       |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | fare_product_id  |
        |------------------|
        | single_ride |

## チケットメディア(Fare Media) {: #fare-media}


チケットメディア(Fare Media)は、チケット商品(Fare product)を保持および/または認証するために使用できるサポートされるメディアを定義します。これは、紙のチケット、チャージ式の交通系カード、さらにはクレジットカードやスマートフォンによる非接触決済といった物理的または仮想的なコンテナを指します。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[fare_media.txt](../../../documentation/schedule/reference/#fare_mediatxt)|`fare_media_id`, `fare_media_name`, `fare_media_type`|
|[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)|`fare_media_id`|


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、サンフランシスコ湾岸地域における異なるチケットメディア(Fare Media)の一部を示しています。`Clipper` は `fare_media_type=2` の物理的な交通系カードとして記述されています。`SFMTA Munimobile` は `fare_media_type=2` のモバイルアプリとして記述されています。チケットを介さずに運転手に直接渡される `Cash` は `fare_media_type=0` です。
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_mediatxt"><b>fare_media.txt</b></a> <br>
        </p>

        | fare_media_id | fare_media_name  | fare_media_type |
        |---------------|------------------|-----------------|
        | clipper       | Clipper          | 2               |
        | munimobile    | SFMTA MuniMobile | 4               |
        | cash          | Cash             | 0               |  

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_productstxt"><b>fare_products.txt</b></a> <br>
        </p>

        | fare_product_id  | fare_product_name      | amount  | currency  | fare_media_id |
        |------------------|--------------------    |---      |---        | ---           |
        | single_ride      | Single Ride Fare       |  2.75   | USD       | munimobile          |

## 乗客カテゴリ {: #rider-categories}


乗客カテゴリは、高齢者、学生、大人など、特定の運賃に適用される公共交通の乗客の種類を表すために使用されます。経路検索アプリケーションは、この情報を利用して利用可能なカテゴリを表示し、フィードを提供する事業者によって設定されたデフォルト運賃を表示することができます。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[rider_categories.txt](../../../documentation/schedule/reference/#rider_categoriestxt)|`rider_category_id`, `rider_category_name`, `is_default_fare_category`, `eligibility_url`|
|[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)|`rider_category_id`|


**前提条件**: 

- [基本機能](../base)
- [チケット商品(Fare Products)機能](#fare-products)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、3つの異なる乗客カテゴリを示しており、大人カテゴリがデフォルトとして設定されています。 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#rider_categoriestxt"><b>rider_categories.txt</b></a> <br>
        </p>

        | rider_category_id | rider_category_name | is_default_fare_category | eligibility_url |
        |---|---|---|---|
        | rc01-adult | Adult | 1 |  |
        | rc02-senior | Senior (65+) | 0 | https://www.agency-abcd.org/info/reduced-fare-65 |
        | rc03-student | Student | 0 | https://www.agency-abcd.org/info/reduced-fare-students |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_productstxt"><b>fare_products.txt</b></a> <br>
        </p>

        | fare_product_id | fare_product_name          | rider_category_id | amount | currency |
        |-----------------|----------------------------|-------------------|--------|----------|
        | single_ride     | Single Ride Fare           | rc01-adult        |   2.75 | USD      |
        | single_ride     | Single Ride Fare - Student | rc03-student      |   1.50 | USD      |

## ルートベース運賃(Route-Based Fares) {: #route-based-fares}


ルートベース運賃(Route-Based Fares)は、特定のルート・路線系統(route)のグループに異なる運賃を割り当てるために使用されます。例えば、急行サービスに特別運賃を設定したり、バス高速輸送システム(BRT)と従来のバスサービスの運賃を区別する場合などです。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[routes.txt](../../../documentation/schedule/reference/#routestxt)|`network_id`|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`fare_product_id`, `network_id`|
|[networks.txt](../../../documentation/schedule/reference/#networkstxt)|`network_id`, `network_name`|
|[route_networks.txt](../../../documentation/schedule/reference/#route_networkstxt)|`network_id`, `route_id`|

**前提条件**:

- [基本機能](../base)
- [チケット商品(Fare Products)機能](#fare-products)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、ルート・路線系統(route)を急行とローカルに分類し、それぞれに異なるチケット商品(fare product)を関連付けるシステムを示しています。 </p>

    <p style="font-size:16px"> **`networks.txt` + `route_networks.txt` を使用する場合** </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#networkstxt"><b>networks.txt</b></a> <br>
        </p>

        | network_id | network_name    |
        |------------|-----------------|
        | express    | Express         |
        | local      | Local           |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#route_networkstxt"><b>route_networks.txt</b></a> <br>
        </p>

        | network_id | route_id |
        |------------|-----------|
        | express    | express_a |
        | express    | express_b |
        | local      | local_1   |
        | local      | local_2   |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | network_id | fare_product_id |
        |------------|-----------------|
        | express    | express_single_ride |
        | local      | local_single_ride   |

    <p style="font-size:16px"> **または `routes.networks_id` を使用する場合** </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id   | network_id |
        |------------|------------|
        | express_a  | express    |
        | express_b  | express    |
        | local_1    | local      |
        | local_2    | local      |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | network_id | fare_product_id |
        |------------|-----------------|
        | express    | express_single_ride |
        | local      | local_single_ride   |

## 時間帯別運賃 {: #time-based-fares}


時間帯別運賃は、特定の時間帯や曜日に応じて運賃を設定するために使用されます。例えば、ピーク時運賃、オフピーク時運賃、週末運賃などです。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`fare_product_id`, `from_timeframe_group_id`, `to_timeframe_group_id`|
|[timeframes.txt](../../../documentation/schedule/reference/#timeframestxt)|`timeframe_group_id`, `start_time`, `end_time`, `service_id`|

**前提条件**:

- [基本機能](../base)
- [チケット商品機能](../fares/#fare-products)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、ピーク時間が8:00から10:00で、それ以外の時間がオフピークとなるシステムを示しています。 </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#timeframestxt"><b>timeframes.txt</b></a> <br>
        </p>

        | timeframe_group_id | start_time | end_time | service_id |
        |--------------------|------------|----------|------------|
        | peak               | 8:00:00    | 10:00:00 | all_day    |
        | regular            | 0:00:00    | 08:00:00 | all_day    |
        | regular            | 10:00:00   | 24:00:00 | all_day    |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | from_timeframe_group_id | fare_product_id     |
        |-------------------------|---------------------|
        | peak                    | peak_single_ride    |
        | regular                 | regular_single_ride |

## ゾーンベース運賃 {: #zone-based-fares}


ゾーンベース運賃は、特定のゾーンから別のゾーンへ移動する際に特定の運賃が適用されるゾーンベースのシステムを表現するために使用されます。ゾーンは停留所等(stop)のグループによって定義されます。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`fare_product_id`, `from_area_id`, `to_area_id`|
|[areas.txt](../../../documentation/schedule/reference/#areastxt)|`area_id`, `area_name`|
|[stop_areas.txt](../../../documentation/schedule/reference/#stop_areastxt)|`area_id`, `stop_id`|

**前提条件**:

- [基本機能](../base)
- [チケット商品(Fare Products)機能](../fares/#fare-products)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、ゾーンAからゾーンBへの運賃を示しています。 </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#areastxt"><b>areas.txt</b></a> <br>
        </p>

        | area_id | area_name |
        |---------|-----------|
        | zone_a  | ゾーンA   |
        | zone_b  | ゾーンB   |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_areastxt"><b>stop_areas.txt</b></a> <br>
        </p>

        | area_id | stop_id |
        |---------|---------|
        | zone_a  | stop_a  |
        | zone_a  | stop_b  |
        | zone_b  | stop_c  |
        | zone_b  | stop_d  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | from_area_id | to_area_id | fare_product_id |
        |--------------|------------|-----------------|
        | zone_a       | zone_b     | zone_a_b_single |

## 運賃乗り継ぎ (Fare Transfers) {: #fare-transfers}


運賃乗り継ぎは、乗車区間(leg)（または個別の移動区間）間を乗り継ぐ際に適用されるルールを定義するために使用されます。これにより、特定の時間内の無料乗り継ぎや、すでに利用した乗車区間に基づく割引運賃の適用など、特別な乗り継ぎポリシーを考慮した複数区間の旅程(journey)全体の総費用をモデル化することができます。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|----------------------|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)|`leg_group_id`|
|[fare_transfer_rules.txt](../../../documentation/schedule/reference/#fare_transfer_rulestxt)|`from_leg_group_id`, `to_leg_group_id`, `transfer_count`, `duration_limit`, `duration_limit_type`, `fare_transfer_type`, `fare_product_id`|

**前提条件**:

- [基本機能](../base)
- [チケット商品(Fare Products)機能](../fares/#fare-products)

??? note "サンプルデータ"

    <p style="font-size:16px">
    以下のサンプルは、2時間の時間枠内で、システム内の乗車区間A間で無制限の無料乗り継ぎが許可されることを示しています。 </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_leg_rulestxt"><b>fare_leg_rules.txt</b></a> <br>
        </p>

        | leg_group_id  |
        |---------------|
        | a             |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_transfer_rulestxt"><b>fare_transfer_rules.txt</b></a> <br>
        </p>

        | from_leg_group_id | to_leg_group_id | transfer_count | duration_limit | duration_limit_type | fare_transfer_type | fare_product_id |
        |-------------------|-----------------|----------------|----------------|---------------------|--------------------|-----------------|
        | a                 | a               | -1             | 7200           | 1                   | 0                  | free_transfer   |

## 運賃 v1 {: #fares-v1}


運賃 v1 は、上記で説明した他の運賃機能に対するレガシーな代替手段です。`fare_rules.txt` および `fare_attributes.txt` ファイルを使用して、運賃価格、支払い方法、乗り換え、ゾーンベースの運賃といった基本的な運賃情報をモデル化することができます。作成はより簡単ですが、複雑な運賃体系をモデル化する能力は低く、他の運賃機能（Fares v2 と呼ばれるものの一部）が十分に支持されれば、廃止される可能性があります。

| 含まれるファイル                | 含まれるフィールド   |
|----------------------------------|-------------------|
|[stops.txt](../../../documentation/schedule/reference/#stopstxt)|`zone_id`|
|[fare_attributes.txt](../../../documentation/schedule/reference/#fare_attributestxt)|`fare_id` `price` `currency_type` `payment_method` `transfers` `agency_id` `transfer_duration`|
|[fare_rules.txt](../../../documentation/schedule/reference/#fare_rulestxt)|`fare_id` `route_id` `origin_id` `destination_id` `contains_id`|


**前提条件**: 

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、プリペイドカードを使用した場合に、ネットワーク上の便(trip)の運賃が 3.20 CAD であり、2時間以内の無料乗り換えが可能であることを示しています。 </p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_attributestxt"><b>fare_attributes.txt</b></a> <br>
        </p>

        | fare_id           | price | currency_type | payment_method | transfers | transfer_duration |
        |-------------------|-------|---------------|----------------|-----------|-------------------|
        | prepaid-card_fare | 3.2   | CAD           | 1              |           | 7200              |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#fare_rulestxt"><b>fare_rules.txt</b></a> <br>
        </p>

        | fare_id           | route_id | origin_id       | destination_id  |
        |-------------------|----------|-----------------|-----------------|
        | prepaid-card_fare | line1    | subway_stations | subway_stations |
        | prepaid-card_fare | line2    | subway_stations | subway_stations |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name | stop_lat  | stop_lon   | zone_id         |
        |---------|-----------|-----------|------------|-----------------|
        | A       | stopA     | 43.670049 | -79.385389 | subway_stations |
        | B       | stopB     | 43.671049 | -79.386789 | subway_stations |


        | stop_id | stop_name | stop_lat  | stop_lon   | zone_id         |
        |---------|-----------|-----------|------------|-----------------|
        | A       | stopA     | 43.670049 | -79.385389 | subway_stations |
        | B       | stopB     | 43.671049 | -79.386789 | subway_stations |
