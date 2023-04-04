# Fares v2

<hr>

Fares V22は、Fares V11の制限を解決することを目的としたGTFS拡張プロジェクトです。この拡張プロジェクトは、反復して採用されています。以下の例では、運賃商品や乗り換え時に運賃を使用する方法など、基本的な概念をモデル化する方法を概説しています。運賃[ Fares V2](/extensions/fares-v2/)拡張プロジェクトの詳細については、こちらをご覧ください。

暫定的に，製作者はFares v2をFares v1の実装と並行して同じデータセットに実装することができる．Fares v2が採用され、十分な支持を得た場合、Fares v1は将来的に非推奨となる可能性があります。

## 乗り換え運賃の定義

メリーランド州交通局のシステムを利用するための運賃の支払い方法はいくつかあります。[通常の満杯価格の運賃オプションは4種類あります：](https://www.mta.maryland.gov/regular-fares)

- 2.00米ドルで購入できる片道航空券
- 4.60USドルの一日乗車券
- 22米ドルで購入できるウィークリーパス
- 77米ドルで購入できる月極めパス

トランジットチケットや運賃は、GTFS運賃商品と呼ばれています。トランジット・チケットまたは運賃は、GTFS では運賃商品と呼ばれます。これらは[fare_products.txt](../../reference/#fare_productstxt)ファイルを使用して説明することができます。各項目は、特定の運賃に対応しています。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id  | fare_product_name  | amount  | currency  |
|------------------------|--------------------|---|---|
| core_local_oneway_fare | One Way Full Fare |  2.00 | USD  |
| core_local_1_day_fare  | 1-Day Pass - Core Service  | 4.60  | USD   |
| core_local_31_day_fare | 31-Day Pass - Core Service  | 77.00  | USD  |
| core_local_7_day_fare  | 7-Day Pass - Core Service |  22.00 | USD  |

<sup>[メリーランド州交通局ローカルバスGTFSフィードのダウンロード](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr>

## シングルレッグの旅のルールを作る

GTFS、運賃レッグは、ライダーが異なるモード、ルート、ネットワーク、またはエージェンシー間で乗り換えることなく移動することを意味するものである。メリーランド州交通局のフィードでは、1つの運賃で、BaltimoreLinkバス、Light RailLink、Metro SubwayLinkルートの`コア`ネットワーク内の任意の停留所と地下鉄駅のペア内で移動することができます。

レッググループは、ネットワーク内の出発地から目的地（エリアIDがグループ化されたストップに対応する場合は、出発地のセットから目的地のセット）までの旅行を定義します。以下のファイルは、Maryland Transit Administrationのコアネットワーク内のどこにでも移動できるルールを記述しています。各ルールは、[乗り換え運賃の定義](#_1)普通運賃商品の1つに対応しています。

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

|  leg_group_id |  network_id | fare_product_id  |
|---|---|---|
| core_local_one_way_trip | core  |  core_local_oneway_fare |
| core_local_one_way_trip | core  |  core_local_1_day_fare |
| core_local_one_way_trip | core  |  core_local_31_day_fare |
| core_local_one_way_trip | core  |  core_local_7_day_fare |

<sup>[メリーランド州交通局ローカルバスGTFSフィードのダウンロード](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr>

## 乗り換えのルールを作る

BaltimoreLinkのローカルバス、Metro SubwayLink、Light RailLinkに乗るために片道料金を購入したライダーには、90分の乗り換えがあります。つまり、90分以内であれば、路線バス、地下鉄、ライトレール間で回数無制限で乗り換えが可能です。

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id       | to_leg_group_id  | duration_limit | duration_limit_type | fare_transfer_type | transfer_count |
|-------------------------|---|----------------|-------------------|---------------------|----------------|
| core_local_one_way_trip | core_local_one_way_trip  | 5400           | 1                 | 0                   | -1             |

上のファイルは、これをGTFSで以下のフィールドで表現しています。

- 片道移動のレッグ（`core_local_oneway_trip`）との間で転送が可能です。
- 転送回数に制限がないため、`transfer_count`は`-1`に設定されています。
- `duration_limit` `5400`秒に設定されており、90分に相当します
- 乗り換え時間は、ライダーが`core_local_one_way_trip`fare leg のいずれかのルートで出発したときに始まり、別の fare leg で出発したときに終わるので、`duration_limit_type`は`1`に設定される。
- ライダーは最初の運賃のみを支払うので、`fare_transfer_type` `0`に設定される。90分以内の乗り換えには、乗り換え料金や2回目の運賃は発生しない。したがって、コストは、初乗り運賃と乗り換え料金の合計としてモデル化することができる。
- ライダーは 90 分の`duration_limit`ウィンドウ内で無制限に乗り換えることができるため、`transfer_count`は`-1`に設定されています。

運賃を定義し、適切な`fare_leg_ruleを`作成し、`fare_transfer_rule`を定義すると、トリッププランナーに2.00米ドルの`core_local_oneway_fare`が表示されるのがわかります。以下は、Transitの例です：

<div class="flex-photos">
    <img src="../../../assets/transit-fares-mdot.png" alt="fare of $2 USD">
</div>

<sup>[メリーランド州交通局ローカルバスGTFSフィードのダウンロード](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

## 同じ運賃帯のサービス場所を記述する

交通機関の中には、ゾーン制の運賃体系を採用しているところもあります。運賃ゾーンは、異なる運賃価格に関連する地理的な領域を分割したものです。ベイエリアのBARTシステムでは、出発地と目的地によって運賃が異なり[（BART fare differences）](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf)、乗り換え客は正しい運賃を知る必要があります。運賃のエリアは、[stops](../../reference/#stops_areastxt) [stops.txt](../../reference/#stopstxt) [areas.txt](../../reference/#areastxt)停留所を割り当てる[stops_areas.txt](../../reference/#stops_areastxt)ファイルを使用して記述することができます。

まず、[areas.txt](../../reference/#areastxt)エリアを特定します。エリア名がない場合は、`area_name`を空欄にしても構いません。下の表では、`ASHB`,`GLEN`,`OAKL`の3つの`area_id`あります。

[**areas.txt**](../../reference/#areastxt)

| area_id | area_name |
|---------|-----------|
| ASHB    |           |
| GLEN    |           | 
| OAKL    |           | 

その後、[stops.txt](../../reference/#stopstxt)ファイルから`stop_id`を使用して、特定されたエリア（運賃ゾーン）ごとに停留所をまとめます。

次に、`stop_id` `area_id`グループ化します。BARTの例では、各エリアには1つの`stop_id`含まれています。例えば、エリア`ASHB`には停留所`ASHB`（Ashby Station）のみが含まれますが、エリアが複数の停留所を含む場合は、複数の`stop_id`記載する必要があります。

[**stops_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
|---------|---------|
| ASHB    | ASHB    |
| GLEN    | GLEN    | 
| OAKL    | OAKL    | 

`fare_leg_rules.txt`、異なる出発地と到着地に基づいて、異なる運賃商品を特定することができます。例えば、最初のエントリでは

- 出発エリアは`ASHB`
- 到着地は`GLEN`
- 発着地の運賃商品は、`BA:matrix:ASHB-GLEN`です。

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id|to_area_id|fare_product_id|
|--------------|-----------|------------|---------------|
|   BA    |  ASHB   | GLEN | BA:matrix:ASHB-GLEN |
|     BA         |  ASKB   | OAKL | BA:matrix:ASHB-OAKL |

運賃は`fare_products.txt`特定されます。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name| amount | currency |
|---------------------|-----------|--------|----------|
| BA:matrix:ASHB-GLEN |  generated  | 4.75   | USD      |
| BA:matrix:ASHB-OAKL  |  generated  | 9.45   | USD       |

<sup><a href="https://511.org/open-data/transit" target="_blank">サンフランシスコ・ベイエリア地域のフィードを見る</a></sup>

<hr>

## どのような運賃メディアが受け入れられるかを説明する

サンフランシスコ・ミュニのライダーは、旅行代金の支払いと運賃の検証に、いくつかの異なるタイプの運賃メディアを使用することができます：

- ベイエリアの交通カード「<a href="https://www.clippercard.com/ClipperWeb/" target="_blank">クリッパーカード</a>」を使う
- <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">ムニモバイルアプリを</a>利用する
- 運賃を現金で支払う

これらの検証方法は、GTFS-Fares V2では`fare_media`と呼ばれ、`fare_media.txt` を使用して記述することができます。

以下は、511 SF Bay APIでアクセスできる<a href="https://511.org/open-data/transit">San Francisco Bay Area Regional Feedの</a>スニペットの例です。

`Clipper`、`fare_media_type=2` の物理的なトランジットカードとして記述されます。`SFMTA Munimobile`は、`fare_media_type=2` を持つモバイルアプリとして記述されます。`Cash`、チケットなしでドライバーに直接渡されるため、運賃メディアを持ちません。そのため、`Cash` `fare_media_type=0`となります。

運賃メディアタイプとして物理的なチケットを記述したいプロデューサーは、[満杯 Fares V2提案に](https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd)ある実験的な`fare_media_type=1`オプションを使用できます。

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| munimobile    | SFMTA MuniMobile | 4               |
| cash           | Cash             | 0               |

<sup><a href="https://511.org/open-data/transit" target="_blank">サンフランシスコ・ベイエリア地域のフィードを見る</a></sup>

## 運賃メディアによる価格差の定義

Muniの運賃は、利用者が使用する運賃媒体によって異なります。この例では、現金とクリッパーカードを使用した場合の大人市内料金の変化について説明します。現金で支払った大人普通運賃は3米ドル、クリッパーカードで支払った同じ運賃は 2.50と50セント安くなります。

以下の各エントリーは、運賃メディアについて説明しています。

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| cash           | Cash             | 0               |

以下の`fare_products.txt`ファイルのスニペットは、ライダーが使用する運賃媒体によって、`Muni single local fare`商品の金額がどのように異なるかを示しています。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | amount | currency | fare_media_id |
|---------------|------------------|-------|--- |---------------|
| SF:local:single | Muni single local fare | 3     | USD | cash |
| SF:local:single | Muni single local fare  | 2.5   |USD | clipper |

Apple Mapsでは、ライダーは運賃価格の変化を確認することができます。"Board the Muni J Church train" の指示で運賃価格を比較することができます：

<div class="flex-photos">
    <img src="../../../assets/apple-muni-cash.jpg" alt="cash fare of $3 USD">
    <img src="../../../assets/apple-muni-clipper.jpg" alt="Clipper card fare of $2.50 USD">
</div>

<sup><a href="https://511.org/open-data/transit" target="_blank">サンフランシスコ・ベイエリア地域のフィードを見る</a></sup>

## 非接触型運賃媒体オプションの説明

[サンタバーバラ郡北部のClean Air Expressは、クレジットカード、Google Pay、Apple Payによる非接触決済に対応して](https://vimeo.com/539436401)います。

Clean Air Expressのフィードでは、cEMV（非接触型ユーロペイ、マスターカード、ビザ）オプションなので、`fare_media_type=3` `tap_to_ride`運賃メディアが存在します。

| fare_media_id | fare_media_name | fare_media_type |
|---------------|-----------------|-----------------|
| tap_to_ride   | Tap to Ride   | 3  |

下図のシングルライド運賃商品には、`cash` `tap-to-ride`運賃媒体の両方があります。シングルライドを`tap-to-ride`運賃媒体で支払った場合、1米ドル安くなります。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | fare_media_id | amount | currency |
|---------------|------------------|---------------|--------|----------|
| single-ride | Single Ride | tap_to_ride       | 6      | USD      |
| single-ride | Single Ride |       | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">クリーン・エア・エクスプレスのフィードをダウンロードする</a></sup>
