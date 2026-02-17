# :material-cash: 運賃

GTFS では、世界中のさまざまな交通事業者が使用する、ゾーン別、移動距離別、または時間帯別の運賃など、さまざまな運賃体系を正確にモデル化できます。GTFS運賃は、便に適用される価格と、支払いに使用できる媒体を乗客に通知します。

## チケット商品

チケット商品には、交通事業者がサービスにアクセスするために提供するチケットまたは運賃の種類 (つまり、片道運賃、月間パス、乗り換え料金など) がリストされます。チケット商品は、事業者の運賃構造をモデル化するための基礎として機能し、 `fare_leg_rules.txt`で概説されているメカニズムを通じて交通サービスにリンクされます。チケット商品をルート・路線系統、エリア、時間などのさまざまな便条件に関連付けることで、個々の便区間と乗り換えの運賃コストが決まります。

| 含まれるファイル                   |含まれるフィールド   |
|----------------------------------|-------------------|
|[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)| `fare_product_id`、`fare_product_name`、`amount`、`currency`、`fare_media_id` |
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `fare_product_id`|

**前提条件**:  

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、単純なチケット商品 (片道 2.75 米ドル) を示しています。
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

## 運賃メディア

運賃メディアは、チケット商品の保持や検証に使用できるサポートされているメディアを定義します。これは、紙のチケット、再チャージ可能な交通カード、さらにはクレジットカードやスマートフォンによる非接触型決済などの物理または仮想のコンテナーを指します。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[fare_media.txt](../../../documentation/schedule/reference/#fare_mediatxt)| `fare_media_id`、`fare_media_name`、`fare_media_type`|
|[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)| `fare_media_id`|

**前提条件**:  

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、サンフランシスコ ベイエリアのさまざまな運賃メディアのスニペットを示しています。`Clipper` は、`fare_media_type=2` の物理的な交通カードとして記述されています。`A` Munimobile` は、`fare_media_type=2` のモバイル アプリとして記述されています。チケットなしで運転手に直接渡される `Cash` は、`fare_media_type=0` です。
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

## 乗客カテゴリ

乗客カテゴリは、高齢者、学生、成人など、特定の運賃が適用される公共交通機関の乗客のさまざまなタイプを表すために使用されます。旅行計画アプリケーションは、この情報を使用して、利用可能なカテゴリを表示し、フィードを提供する事業者によって設定されたデフォルトの運賃を表示できます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[rider_categories.txt](../../../documentation/schedule/reference/#rider_categoriestxt)|`rider_category_id`, `rider_category_name`, `is_default_fare_category`, `eligibility_url`|
|[fare_products.txt](../../../documentation/schedule/reference/#fare_productstxt)|`rider_category_id`|


**前提条件**: 

- [基本機能](../base)
- [チケット商品機能](#_2)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルでは、​​3 つの異なるライダー カテゴリが示されており、大人カテゴリがデフォルトとして設定されています。
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

## 乗車経路ベースの運賃

乗車経路ベースの運賃は、急行サービスの特別運賃や、バス高速輸送サービスと従来のバスサービスの運賃を区別するなど、特定のルート・路線系統グループに異なる運賃を割り当てるために使用されます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[routes.txt](../../../documentation/schedule/reference/#routestxt)| `network_id`|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `fare_product_id`、`network_id`|
|[networks.txt](../../../documentation/schedule/reference/#networkstxt)| `network_id`、`network_name`|
|[route_networks.txt](../../../documentation/schedule/reference/#route_networkstxt)| `network_id`、`route_id`|

**前提条件**: 

- [基本機能](../base)
- [チケット商品機能](#_2)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、ルート・路線系統をエクスプレス カテゴリとローカル カテゴリに分類し、それぞれに異なるチケット商品を割り当てるシステムを示しています。 </p>

    <p style="font-size:16px">**`networks.txt` + `route_networks.txt` を使用する**</p>

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

    <p style="font-size:16px">**または`ルート・路線系統を使用する**</p>

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

## 時間ベースの運賃

時間ベースの運賃は、ピーク運賃やオフピーク運賃、週末運賃など、特定の時間帯や曜日の運賃を割り当てるために使用されます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `fare_product_id`、`from_timeframe_group_id`、`to_timeframe_group_id`|
|[timeframes.txt](../../../documentation/schedule/reference/#timeframestxt)| `timeframe_group_id`、`start_time`、`end_time`、`service_id`|

**前提条件**: 

- [基本機能](../base)
- [チケット商品機能](#_2)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、ピーク時間が 8:00 から 10:00 で、残りの時間がオフピークであるシステムを示しています。 </p>

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

## ゾーンベースの運賃

ゾーンベースの運賃は、特定の運賃が特定のゾーンから別のゾーンへ移動する際に適用されるゾーンベースのシステムを表すために使用されます。ゾーンは停留所等のグループによって定義されます。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-------------------|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `fare_product_id`、`from_area_id`、`to_area_id`|
|[areas.txt](../../../documentation/schedule/reference/#areastxt)| `area_id`、`area_name`|
|[stop_areas.txt](../../../documentation/schedule/reference/#stop_areastxt)| `area_id`、`stop_id`|

**前提条件**: 

- [基本機能](../base)
- [チケット商品機能](#_2)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、ゾーン A からゾーン B までの運賃を示しています。</p>

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#areastxt"><b>areas.txt</b></a> <br>
        </p>

        | area_id | area_name |
        |---------|-----------|
        | zone_a  | Zone A    |
        | zone_b  | Zone B    |

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

## 運賃の乗り換え

運賃の乗り換えは、区間（または個々の便セグメント）間の乗り換え時に適用されるルールを定義するために使用されます。これにより、特定の時間制限での無料乗り換えや、すでに便した区間に基づいた運賃割引の適用など、特別な乗り換えポリシーを考慮して、複数区間の便の総コストをモデル化できます。

| 含まれるファイル                      | 含まれるフィールド   |
|----------------------------------|-------------------|
|[fare_leg_rules.txt](../../../documentation/schedule/reference/#fare_leg_rulestxt)| `leg_group_id`|
|[fare_transfer_rules.txt](../../../documentation/schedule/reference/#fare_transfer_rulestxt)| `from_leg_group_id`、`to_leg_group_id`、`transfer_count`、`duration_limit`、`duration_limit_type`、`fare_transfer_type`、`fare_product_id`|

**前提条件**: 

- [基本機能](../base)
- [チケット商品機能](#_2)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、2時間のウィンドウ内で、システム内の Leg A 間で無制限の無料乗り換えが許可されていることを示しています。</p>

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

## 非接触型 EMV サポート

非接触型 EMV サポート機能により、データ プロデューサーは、乗客が非接触型カードまたはデバイス (たとえば、タップして支払うシステム) を使用して交通サービスにアクセスできるかどうかを示すことができます。この機能は、事業者またはルート レベルで非接触型支払いの可用性を伝えるための簡略化された代替手段を提供しますが、[チケットメディア](http://../運賃/#fare-media) を通じて提供される詳細な運賃情報の代わりになるものではありません。

| 含まれているファイル |含まれるフィールド |
| :----| :----|
| [agency.txt](http://../../../documentation/schedule/reference/#agencytxt) | `cemv_support` |
| [routes.txt](http://../../../documentation/schedule/reference/#routestxt) | `cemv_support` |**前提条件**:

- [基本機能](http://../ベース)

 ??? note"サンプルデータ"

<p style="font-size:16px"> 
次の例では、最初の表は、事業者`AA`が運営するすべてのサービスに、非接触型カードまたはデバイス (cEMV) で支払う乗客がアクセスできることを指定します。</p> 

注記 ""
   <p style="font-size:16px"> 
    <a href="../../../documentation/schedule/reference/#agencytxt"><b>agency.txt</b></a><br> 
   </p> 

    | agency_id | agency_name | agency_url | agency_timezone | cemv_support |
    | :----| :----| :----| :----| :----|
    | AA |事業者A | [www.gtfsagencya.org](http://www.gtfsagencya.org) | America/Denver | 1 |
    | BB |事業者B | [www.gtfsagencyb.org](http://www.gtfsagencyb.org) | America/Denver | |
    | CC |事業者C | [www.gtfsagencyc.org](http://www.gtfsagencyc.org) | America/Denver | |

<p style="font-size:16px"> 
2番目の表では、非接触型カードまたはデバイス（cEMV）で支払いを行う乗客は、特定のルート・路線系統（`BB001`、`BB003`、`CC001`）のみを利用できます。`BB`および`CC`のその他のルート・路線系統は、非接触型決済に対応していません。</p> 

注記 ""
   <p style="font-size:16px"> 
    <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a><br> 
   </p> 

    | route_id | agency_id | route_short_name | route_type | cemv_support |
    | :----| :----| :----| :----| :----|
    | AA001 | AA | A1 | 3 | |
    | AA002 | AA | A2 | 3 | |
    | AA003 | AA | A3 | 3 | |
    | BB001 | BB | B1 | 3 | 1 |
    | BB002 | BB | B2 | 3 | 2 |
    | BB003 | BB | B3 | 3 | 1 |
    | CC001 | CC | C1 | 3 | 1 |
    | CC002 | CC | C2 | 3 | 2 |
    | CC003 | CC | C3 | 3 | 2 |

## Fares V1 

 Fares v1 は、上で説明した他の運賃機能の従来の代替手段です。`fare_rules.txt` および `fare_attributes.txt` ファイルを使用して、`fare_rules.txt` 設定、支払い方法の乗り換え、ゾーンベースの運賃などの基本的な運賃情報をモデル化できます。作成は簡単ですが、より複雑な運賃構造をモデル化する能力が低く、他の運賃機能( Fares v2と呼ばれる機能の一部) の十分な承認があれば廃止されるしてもよい。

| 含まれるファイル                   | 含まれるフィールド   |
|----------------------------------|-----------------------------------|
| [stops.txt](../../../documentation/schedule/reference/#stopstxt) | `zone_id` |
| [fare_attributes.txt](../../../documentation/schedule/reference/#fare_attributestxt) | `fare_id` `price` `currency_type` `payment_method` `transfers` `agency_id` `transfer_duration` |
| [fare_rules.txt](../../../documentation/schedule/reference/#fare_rulestxt) | `fare_id` `route_id` `origin_id` `destination_id` `contains_id` |

**前提条件**:  

- [基本機能](../base)

??? note "サンプルデータ"

    <p style="font-size:16px">
    次のサンプルは、プリペイド カードを使用してネットワークを移動すると 3.20 カナダ ドルかかり、2 時間以内で乗り換えが無料になることを示しています。</p>

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