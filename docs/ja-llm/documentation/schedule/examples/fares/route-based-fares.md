# ルートベース運賃(Route-Based Fares) {: #route-based-fares}


*主なファイル: fare_leg_rules.txt, networks.txt, route_networks.txt, routes.txt*  
*例: [Translink (バンクーバー)](../intro/#translink-vancouver)*

!!! info "リマインダー"

    ルートベース運賃(Route-Based Fares)は、利用するルート(route)に基づいて異なる運賃を割り当てます。チケット商品(Fare Products)は、事業者がサービスを利用するために提供する運賃の種類です。詳細については、イントロダクションページの[機能のセクション](../intro/#fares-features-and-their-files)を参照してください。

!!! Note

    このセクションでは、同じチケット商品(Fare Product)に対して異なるチケットメディア(Fare Media)を表示します。後続のセクションでは、ガイドを簡略化するために、*非接触型(contactless)* のチケットメディアを持つチケット商品のみを表示します。

## 運賃商品の作成 {: #create-fare-products}


ルートベース運賃は、定額運賃を提供する運賃商品によって表現されます。ルートベースの運賃商品は、`fare_products.txt` に以下のように作成します。

1. **fare_product_id** 列に、運賃商品を識別する一意のIDを入力します。  
2. **fare_product_name** 列に、乗客向けの運賃商品の名称を入力します（例: Bus Flat Fare, Bus Flat Fare Monthly）。  
3. **amount** および **currency** 列に、運賃の金額とその通貨を入力します（[通貨コード](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)）。  
4. **fare_media_id** 列に、この運賃商品を保存・利用できるチケットメディアを入力します。  
    * これは `fare_media.txt` 内の **fare_media_id** を参照する外部キーです（[Fare Media](../fare-media)）。  
    * 複数のチケットメディアを同じ運賃商品に関連付けることができ、価格が異なる場合もあります。  
    * **fare_media_id** が空の場合、そのチケットメディアは不明であることを意味します。

運賃商品の詳細については、[ドキュメントを参照してください](../../../reference/#fare_productstxt)。

この例では、`bus_flat_fare` という運賃商品が Translink バスの定額運賃を表しています。異なる `fare_media_id` 値を持つ3つのエントリがあるため、この運賃商品は現金、コンタクトレスカード、または Compass Card で利用できます。Compass Card で支払う場合の価格は、他のチケットメディアよりも安く設定されています。

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | amount | currency | fare_media_id |
| :---- | :---- | :---- | :---- | :---- |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | contactless |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | cash |
| bus_flat_fare | Bus Flat Fare | 2.60 | CAD | compass_card |
| … | … | … | … | … |

## ルートをグループ化するネットワークを作成する {: #create-networks-that-group-the-routes}

ルートベース運賃(Route-Based Fares)では、ルートのグループごとに異なる運賃が設定されます。これらのグループはネットワークとも呼ばれます。事業者のすべてのルートが同じ運賃である場合、それらは1つのネットワークにまとめることができます。

ネットワークは `networks.txt` に以下のように作成します:

1. **network_id** 列にネットワークを識別する一意のIDを入力します。  
2. **network_name** 列にネットワークの名前を入力します（例: Translink Buses, TTC Subway, STM All Routes）。

[Translink](../intro/#translink-vancouver) の場合、バスは定額運賃であるため、独自のグループに分ける必要があります。これに対して、SkyTrain と Seabus は通過したゾーン数に応じて運賃が変わります（[ゾーンベース運賃](../zone-based-fares) のセクションを参照してください）。

この例では、Translink Buses を表すために translink_bus というネットワークが作成されます。

[**networks.txt**](../../../reference/#networkstxt)

| network_id | network_name |
| :---- | :---- |
| translink_bus | Translink Buses |

## ルート・路線系統(route)をネットワークに関連付ける {: #associate-routes-to-networks}


ネットワークを作成した後、それに含まれるルート・路線系統(route)を関連付ける必要があります。ルート・路線系統(route)は `route_networks.txt` 内で以下のようにネットワークに関連付けられます。

1. **route_id** 列に `routes.txt` のルート・路線系統(route)の ID を入力します。  
2. **network_id** 列に `networks.txt` の対応するネットワークの ID を入力します。

ネットワークの詳細については [ドキュメントを参照してください](../../../reference/#networkstxt)。

この例では、各バスのルート・路線系統(route)が `translink_bus` ネットワークに関連付けられています。`route_id` は `routes.txt` 内のバスの `route_id` を参照しています。

[**route_networks.txt**](../../../reference/#route_networkstxt)


| route_id | network_id |
| :---- | :---- |
| 10232 | translink_bus |
| 11201 | translink_bus |
| … | … |

## 運賃区間ルールの作成 {: #create-fare-leg-rules}


!!! info "リマインダー"

    **乗車区間(leg)**: 特定のサービスまたはルートで、通常は2つの停留所等(stop)間を、乗り換えなしで移動する旅程(journey)の連続した1区間。

    **乗車区間グループ(Leg Group)**: `fare_leg_rules.txt` ファイルの文脈で定義される、特定の共通属性や運賃条件を共有する1つ以上の乗車区間(leg)の集合。

乗車区間(leg)の運賃は、運賃区間ルールを用いて乗車区間をチケット商品(fare product)に対応付けることで決定されます。ルートベース運賃の場合、運賃区間ルールは、`networks.txt` で作成されたルートのネットワークを、`fare_products.txt` で作成されたチケット商品に関連付けます。  

ルートベースの運賃区間ルールは、`fare_leg_rules.txt` に以下のように作成します:

1. **leg_group_id** 列に、乗車区間グループを識別する一意のIDを入力します。  
2. **network_id** 列に、乗車区間が含まれるルートに関連付けられたネットワークのIDを入力します。  
    * これは `networks.txt` 内の **network_id** を参照する外部キーです。  
3. **fare_product_id** 列に、乗車区間の運賃を決定するチケット商品のIDを入力します。  
    * これは `fare_products.txt` 内の **fare_product_id** を参照する外部キーです。  

運賃区間ルールの詳細については、[ドキュメントを参照してください](../../../reference/#fare_leg_rulestxt)。  

[Translink](../intro/#translink-vancouver) の場合、バスの乗車区間(leg)は、停留所等(stop)Aから停留所等(stop)Bまで、1台のTranslinkバスに乗車し、乗り換えを行わない区間を指します。別のバス、交通モード、または事業者に乗り換えると、新しい乗車区間(leg)が開始されます。  

この例では、`fare_leg_rules.txt` 内の運賃区間ルールが、`translink_bus` ネットワークを `bus_flat_fare` 商品に関連付け、ネットワーク内のすべての乗車区間(leg)が適切に料金設定されるようにしています。  

[**fare_leg_rules.txt**](../../../reference/#fare_leg_rulestxt)

| leg_group_id | network_id | fare_product_id |
| :---- | :---- | :---- |
| flat_fare_leg | translink_bus | bus_flat_fare |
