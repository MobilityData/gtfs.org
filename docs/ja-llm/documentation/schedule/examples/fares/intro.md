# 運賃: はじめに {: #fares-introduction}

運賃（Fares v2 とも呼ばれます）は、[GTFS Schedule の機能](../../../../../getting-started/features/overview)の1つであり、乗客向けの運賃情報を標準化することで、各交通システムおよびその接続における運賃体系や条件に基づいたチケットや料金オプションを利用者が把握できるようにします。

運賃 (v2) の主な機能には、チケット商品 (Fare Products)、チケットメディア (Fare Media)、乗客区分 (Rider Categories)、ルートベース運賃 (Route-Based Fares)、ゾーンベース運賃 (Zone-Based Fares)、時間ベース運賃 (Time-Based Fares)、および運賃乗り継ぎ (Fare Transfers) が含まれます。

GTFS 運賃 (v2) は、コミュニティ主導のプロジェクトとして進化を続けており、作業名 [GTFS-Fares v2](../../../../../community/extensions/fares-v2) のもとで開発されています。実験的な機能のモデリングに関するガイダンスについては、[完全な提案文書](https://share.mobilitydata.org/gtfs-fares-v2)を参照してください。GTFS は後方互換性を維持していますが、将来の拡張性や進行中の仕様開発との整合性を確保するために、従来の運賃 (v1) よりも運賃 (v2) を採用することが推奨されます。

このガイドでは、運賃 (v2) を用いて一般的な運賃体系をどのようにモデリングするかを示します。まず、運賃 (v2) でサポートされている運賃機能と、それぞれに使用されるファイルを紹介します。その後、後のセクションでモデリングする実際の例を提示します。

## 運賃機能とそのファイル {: #fares-features-and-their-files}

GTFS Fares (v2) では、一般的な運賃体系に見られるさまざまな運賃機能をモデル化することができます。

| 機能 | 説明 | 関連ファイル |
| :---- | :---- | :---- |
| [**Fare Media**](../../../../../getting-started/features/fares/#fare-media)<br>([例](../fare-media)を参照) | チケット商品を保持および/または認証するために使用できるサポートされているメディア（例: 現金、非接触型、物理カードなど）。 | `fare_media.txt`, `fare_products.txt` |
| [**Fare Products**](../../../../../getting-started/features/fares/#fare-products)<br>([例](../fare-products)を参照) | 事業者がサービスにアクセスするために提供する運賃の種類（例: 片道運賃、定期券、乗り換え料金など）。 | `fare_products.txt` |
| [**Rider Categories**](../../../../../getting-started/features/fares/#rider-categories)<br>([例](../rider-categories)を参照) | 高齢者、学生、子供、大人など、年齢、資格、またはニーズに基づいて特定の運賃率の対象となる異なる乗客グループを表します。経路検索アプリケーションは、この情報を使用して利用可能なカテゴリを表示し、フィードを提供する事業者によって設定されたデフォルト運賃を表示することができます。 | `rider_categories.txt`, `fare_products.txt` |
| [**Route-Based Fares**](../../../../../getting-started/features/fares/#route-based-fares)<br>([例](../route-based-fares)を参照) | 特定のルート・路線系統のグループ（ルートネットワークとも呼ばれる）に異なる運賃を割り当てます。均一料金のルートベース運賃は最も基本的な運賃です。 | `fare_products.txt`, `fare_leg_rules.txt`, `networks.txt`, `route_networks.txt` |
| [**Zone-Based Fares**](../../../../../getting-started/features/fares/#zone-based-fares)<br>([例](../zone-based-fares)を参照) | 特定のゾーンから別のゾーンへ移動する際に特定の運賃が適用されるゾーンベースのシステムを表します。ゾーンは停留所等(stop)の集合として定義することができます。 | `fare_products.txt`, `fare_leg_rules.txt`, `areas.txt`, `stop_areas.txt` |
| [**Time-Based Fares**](../../../../../getting-started/features/fares/#time-based-fares)<br>([例](../time-based-fares)を参照) | 特定の時間帯や曜日に基づいて運賃を割り当てます。例として、ピーク時運賃、オフピーク運賃、週末運賃などがあります。 | `fare_products.txt`, `fare_leg_rules.txt`, `timeframes.txt` |
| [**Fare Transfers**](../../../../../getting-started/features/fares/#fare-transfers)<br>([例](../fare-transfers)を参照) | 乗車区間(leg)（または個別の移動区間）間を乗り換える際に適用されるルールです。これにより、無料または割引の乗り換えを含む旅程(journey)全体の運賃を計算することができます。 | `fare_products.txt`, `fare_leg_rules.txt`, `fare_transfer_rules.txt` |

これらの機能および各機能に含まれるファイルの詳細については、[運賃機能ページ](../../../../../getting-started/features/fares)をご覧ください。

### ファイル間の関係 {: #relations-between-files}

以下のエンティティ・リレーションシップ図 (ERD) は、Fares (v2) ファイルがどのように連携するかを示しています。

<iframe width="768" height="432" src="https://miro.com/app/embed/uXjVIHu_Wws=/?pres=1&frameId=3458764623400726374&embedId=111450801270" frameborder="0" scrolling="no" allow="fullscreen; clipboard-read; clipboard-write" allowfullscreen></iframe>

## 例の提示 {: #presenting-the-example}

Fares (v2) を使用して運賃をモデル化する方法を説明するために、このガイドでは実際の公共交通事業者を例として使用します。簡潔にするために、その事業者の運賃体系の特定の側面に焦点を当てます。このガイドでは片道のチケット商品の例を含みますが、同じモデリング手法は日次パスや月次パスなどの他のチケット商品にも適用されます。

例となる交通システム:

* TransLink (バンクーバー)

### Translink (バンクーバー) {: #translink-vancouver}


Translink はバンクーバーの公共交通事業者です。2024年11月現在、バンクーバーではゾーン制運賃システムを採用しています（詳細は[こちら](https://www.translink.ca/transit-fares/pricing-and-fare-zones)をご覧ください）。本ガイドで使用される要素の一部を以下の表にまとめます。  

| カテゴリ | 詳細 |
| ----- | ----- |
| **チケットメディア (Fare Media)** | - **現金 (Cash)** <br>- **Compass Ticket**（紙のチケット） <br>- **Compass Card**（物理的な交通カード） <br>- **非接触型決済カード** および **モバイルウォレット** |
| **バス運賃 (Bus Fare)** | 均一運賃 **CAD 3.20** |
| **1日乗車券 (Daily pass)** | - バスおよび全ゾーンで **CAD 11.50** <br>- **Compass Card または Compass Ticket のみ有効** |
| **SkyTrain および SeaBus 運賃** | **ゾーン制運賃**（通過するゾーン数に応じて変動） <br>- **ゾーン1**: バンクーバー <br>- **ゾーン2**: バーナビー、リッチモンド、ノースバンクーバー <br>- **ゾーン3**: サレー、コキットラム |
| **[空港加算運賃 (Airport AddFare)](https://www.translink.ca/transit-fares/transferring-and-addfare)** | - **Sea Island** から出発する SkyTrain の便には **CAD 5.00** の追加料金 <br>- Sea Island 内の3駅間の移動は **無料** |
| **週末および夜間運賃** | - 午後6時30分から午前3時まで、または週末はすべて **ゾーン1**（バスは均一運賃 **CAD 3.20**） <br>- ただし、Sea Island 出発の旅程は追加運賃が必要。そのため午後6時30分から午前3時まで、または週末は **5.00 + 3.20 = CAD 8.20** となる |
| **[乗り継ぎ (Transfers)](https://www.translink.ca/transit-fares/transferring-and-addfare)** | - **90分間の乗り継ぎ**は **非現金チケットメディア** のみ利用可能 <br>- この期間中は **バス間の乗り継ぎは無料** <br>- **同一運賃ゾーン内**であれば無料 <br>- **より高い運賃ゾーンへの乗り継ぎ**には追加運賃（AddFare）が適用 <br>- 新しい高額運賃と以前の低額運賃との差額が乗客に請求される。つまり、両運賃の差額が最初の運賃に加算される |
| **乗客区分 (Rider Categories)** | **大人 (Adult)** と **割引 (Concession)** の区分 <br>- 大人はデフォルト区分 <br>- 障害者、高齢者、青少年は割引区分に含まれる |

West Coast Express もゾーン制を採用しています（別のゾーン体系）。簡略化のため本ガイドでは扱いませんが、そのゾーン制運賃も SkyTrain と同様の方法でモデル化することができます。  

本ガイドでは、TransLink のセクションにおいては大人 (Adult) 区分のみを記載しています。ただし、[乗客区分](../rider-categories) セクションでは割引 (Concession) 区分も含まれます。  

## 用語集 {: #glossary}


以下の表は、このガイドおよび運賃に関連する議論で一般的に使用される用語の概念を示しています。

| 概念 | 説明 |
| :---- | :---- |
| 乗車区間(leg) | 特定のサービスまたはルート・路線系統(route)で、通常は2つの停留所等(stop)間を乗り換えなしで移動する、1つの連続した区間。 |
| 部分旅程(sub-journey) | 旅程(journey)の部分集合を構成する2つ以上の乗車区間(leg)。 |
| 旅程(journey) | 出発地から目的地までの全体の移動で、すべての乗車区間(leg)とその間の乗り換えを含む。 |

<img class="center" width="1200" height="100%" src="../../../../../../assets/glossary-journey-abcd.svg"> 

| 概念 | 説明 |
| :---- | :---- |
| 乗車区間グループ(Leg Group) | `fare_leg_rules.txt` ファイルの文脈で定義される、特定の共通属性や運賃条件を共有する1つ以上の乗車区間(leg)の集合。 |
| 運賃区間ルール(Fare leg rule) | フィルタ条件に従い、1つの乗車区間(leg)または有効運賃区間(effective fare leg)での移動を完了するための運賃適用基準。 |
| ネットワーク(Network) | 運賃区間の一致を目的として、類似の運賃体系を持つルート・路線系統(route)のグループ。ルート・路線系統(route)のネットワークは以下のように定義できる：事業者全体のルート・路線系統(route)、同一モード（例: 地下鉄、バス）のルート・路線系統(route)、類似の目的（例: 郊外、都市部）のルート・路線系統(route)。 |
| 運賃ゾーン(Fare zones) | ゾーン間またはゾーン内の移動に基づいて料金を決定するために使用されるエリア。運賃ゾーンは GTFS 内でエリア（停留所等(stop)の集合）として定義することができる。 |
| 時間枠(Timeframe) | 特定の運賃が適用される定義済みの期間（例: 平日午前6時から9時、ラッシュアワー、週末）。 |
| 時間枠グループ(Timeframe group) | 運賃ルールや料金設定において同様に扱われる時間枠の集合（例: すべてのオフピーク時間）。 |
| 運賃乗り換えルール(Fare transfer rule) | フィルタ条件に従い、乗車区間(leg)間の乗り換えに対する運賃適用基準。 |
| 有効運賃区間(Effective Fare Leg) | 運賃計算のために、`fare_leg_rules.txt` 内のルールとの照合において1つの乗車区間(leg)として扱うべき、2つ以上の乗車区間(leg)からなる部分旅程(sub-journey)。 |
| フィルタ条件(Filter conditions) | 運賃区間ルール、チケット商品、または運賃乗り換えルールの利用可能な料金を決定する旅行の制約や変数。 |
