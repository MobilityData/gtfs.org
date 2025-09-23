# GTFS Schedule の機能 {: #gtfs-schedule-features}

GTFS Reference フォーマットは、公共交通システムの現在のニーズに対応するために進化するにつれて、その機能はますます複雑になる可能性があります。**GTFS の機能**は、GTFS Reference フォーマットによって有効化される機能を明確かつ決定的に説明することを目的としています。これにより、交通事業者、ベンダー、利用者、研究者が GTFS の能力を理解し、**GTFS で何ができるのか？** という問いに答えることができます。

以下の機能グループは、それぞれの機能の目的と、それに関連するファイルやフィールドを説明し、特定の機能をサポートするためにどのデータが必要かを理解する助けとなります。

## 基本要素 {: #base}

これらの基本機能は GTFS フィードの中核を形成します。これは、公共交通サービスを表現するために必要な最小限の要素です。

<div class="grid cards" markdown>

- :material-subway-variant:{ .lg .middle } __Agency__

    公共交通サービスを提供する事業者に関する詳細を記述します。
    
    [:octicons-arrow-right-24: 詳細を見る](../base/#agency)

- :material-subway-variant:{ .lg .middle } __Stops__

    公共交通サービスが乗客を乗降させる場所を定義します。

    [:octicons-arrow-right-24: 詳細を見る](../base/#stops)

- :material-subway-variant:{ .lg .middle }  __Routes__

    路線の名称やサービスの種類など、公共交通のルート・路線系統(route)の要素を定義します。

    [:octicons-arrow-right-24: 詳細を見る](../base/#routes)

- :material-subway-variant:{ .lg .middle } __Service Dates__

    便(trip)の運行スケジュールや運休日の構造を作成します。

    [:octicons-arrow-right-24: 詳細を見る](../base/#service-dates)

- :material-subway-variant:{ .lg .middle } __Trips__

    定義されたルート・路線系統(route)に沿って、時刻表に従って運行する公共交通車両を表現します。

    [:octicons-arrow-right-24: 詳細を見る](../base/#trips)

-   :material-subway-variant:{ .lg .middle } __Stop Times__

    各便(trip)における各停留所等(stop)での到着時刻と出発時刻を定義します。

    [:octicons-arrow-right-24: 詳細を見る](../base/#stop-times)

</div>

## 基本アドオン {: #base-add-ons}

これらの機能は GTFS データセットを拡張し、乗客の体験を向上させ、事業者、ベンダー、データ再利用者間の協力を促進します。既存ファイルに新しいフィールドを追加したり、新しいファイルを作成したりすることがあります。

<div class="grid cards" markdown>

- :material-plus-box-multiple-outline:{ .lg .middle } __フィード情報__

    フィード自体に関する重要な情報を伝えます。

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#feed-information)

- :material-plus-box-multiple-outline:{ .lg .middle } __ルート形状(Shapes)__

    便(trip)に沿って車両がたどる地理的な経路を定義します。

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#shapes)

- :material-plus-box-multiple-outline:{ .lg .middle } __ルートカラー__

    特定のルート・路線系統(route)に割り当てられた配色を正確に表現し伝えます。

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#route-colors)

- :material-plus-box-multiple-outline:{ .lg .middle } __自転車持ち込み可否__

    車両が自転車を収容できるかどうかを伝えます。

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#bike-allowed)

- :material-plus-box-multiple-outline:{ .lg .middle } __行先表示(Headsigns)__

    便(trip)の行先を示す車両の表示を伝えます。

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#headsigns)

- :material-plus-box-multiple-outline:{ .lg .middle } __ロケーションタイプ__

    駅構内の入口や出口などの主要エリアを分類します。

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#location-types)

- :material-plus-box-multiple-outline:{ .lg .middle } __運行間隔(Frequencies)__

    一定の運行間隔や特定のヘッドウェイで運行するサービスを表現します。                           

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#frequencies)

- :material-plus-box-multiple-outline:{ .lg .middle } __乗換(Transfers)__

    異なる交通サービス間で許可される乗換を記述します。

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#transfers)

-   :material-plus-box-multiple-outline:{ .lg .middle } __翻訳__

    複数の言語でサービス情報を伝えます。

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#translations)

- :material-plus-box-multiple-outline:{ .lg .middle } __帰属情報__

    データセットの作成に関わった人や組織を伝えます。

    [:octicons-arrow-right-24: 詳細を見る](../base_add-ons/#attributions)

</div>

## アクセシビリティ {: #accessibility}

アクセシビリティ機能は、障害のある方がサービスを利用するために必要な情報を提供します。

<div class="grid cards" markdown>

- :material-wheelchair:{ .lg .middle } __停留所等の車椅子対応__

    その場所から車椅子での乗降が可能かどうかを示します。     

    [:octicons-arrow-right-24: 詳細はこちら](../accessibility/#stops-wheelchair-accessibility)

- :material-wheelchair:{ .lg .middle } __便の車椅子対応__

    車両が車椅子を利用する乗客に対応できるかどうかを示します。       

    [:octicons-arrow-right-24: 詳細はこちら](../accessibility/#trips-wheelchair-accessibility)

- :material-wheelchair:{ .lg .middle } __読み上げ用フィールド(text-to-speech)__

    停留所等の名称を音声に変換するために必要な入力を提供します。

    [:octicons-arrow-right-24: 詳細はこちら](../accessibility/#text-to-speech)

</div>

## 運賃 {: #fares}

GTFS は、ゾーン制、距離制、時間帯別運賃など、さまざまな運賃体系をモデル化することができます。これにより、乗客に便の料金や支払い方法を知らせることができます。

<div class="grid cards" markdown>

-   :material-cash:{ .lg .middle } __チケット商品 (Fare Products)__

    利用者が購入できるチケットや運賃の種類を定義します。

    [:octicons-arrow-right-24: 詳しく見る](../fares/#fare-products)

-   :material-cash:{ .lg .middle } __チケットメディア (Fare Media)__

    チケット商品を保持および/または認証するために使用できるメディアを定義します。

    [:octicons-arrow-right-24: 詳しく見る](../fares/#fare-media)

-   :material-cash:{ .lg .middle } __乗客カテゴリー (Rider Categories)__

    特定の運賃を利用できる異なる乗客のカテゴリーを表します。

    [:octicons-arrow-right-24: 詳しく見る](../fares/#rider-categories)

-   :material-cash:{ .lg .middle } __ルートベース運賃 (Route-Based Fares)__

    特定のルートグループに異なる運賃を適用するためのルールを記述します。

    [:octicons-arrow-right-24: 詳しく見る](../fares/#route-based-fares)

-   :material-cash:{ .lg .middle } __時間ベース運賃 (Time-Based Fares)__

    時間帯や曜日によって区別される運賃を記述します。

    [:octicons-arrow-right-24: 詳しく見る](../fares/#time-based-fares)

-   :material-cash:{ .lg .middle } __ゾーンベース運賃 (Zone-Based Fares)__

    あるエリアから別のエリアへ移動する際に区別される運賃を記述します。

    [:octicons-arrow-right-24: 詳しく見る](../fares/#zone-based-fares)

-   :material-cash:{ .lg .middle } __運賃乗り継ぎ (Fare Transfers)__

    便の1つの乗車区間(leg)から別の乗車区間(leg)に乗り継ぐ際に適用される料金を定義します。

    [:octicons-arrow-right-24: 詳しく見る](../fares/#fare-transfers)

-   :material-cash:{ .lg .middle } __運賃 V1 (Fares V1)__

    運賃情報をより簡単に表現できるレガシー機能です。

    [:octicons-arrow-right-24: 詳しく見る](../fares/#fares-v1)

</div>

## 構内通路(Pathways) {: #pathways}


構内通路(pathways)の機能を利用すると、大規模な交通駅をモデル化し、乗客が入口から乗車エリアまで案内されるようにすることができます。これにより、経路の詳細、推定所要時間、案内システムを提供することができます。

<div class="grid cards" markdown>

-   :material-escalator:{ .lg .middle } __構内通路の接続(Pathway Connections)__

    交通駅内の関連する地点を接続する経路をモデル化します。

    [:octicons-arrow-right-24: 詳細を見る](../pathways/#pathway-connections)

-   :material-escalator:{ .lg .middle } __構内通路の詳細(Pathway Details)__

    構内通路の物理的な特性に関する追加の詳細を提供します。

    [:octicons-arrow-right-24: 詳細を見る](../pathways/#pathway-details)

-   :material-escalator:{ .lg .middle } __階層(Levels)__

    交通駅内の異なるすべての階層を記述し、一覧化します。

    [:octicons-arrow-right-24: 詳細を見る](../pathways/#levels)

-   :material-escalator:{ .lg .middle } __駅構内の移動時間(In-Station Traversal Time)__

    交通駅内の経路を移動するための推定所要時間を伝えます。

    [:octicons-arrow-right-24: 詳細を見る](../pathways/#in-station-traversal-time)

-   :material-escalator:{ .lg .middle } __構内通路の案内表示(Pathway Signs)__

    構内通路に関連する駅構内の案内表示を伝えます。

    [:octicons-arrow-right-24: 詳細を見る](../pathways/#pathway-signs)

</div>

## フレキシブルサービス {: #flexible-services}

フレキシブルサービス、またはデマンド型サービスは、定期的な時刻表や固定されたルートに従わないサービスです。

<div class="grid cards" markdown>

- :material-transit-detour:{ .lg .middle } __連続停留所(Continuous Stops)__

    停留所間で乗客を乗せたり降ろしたりできるかどうかを示します。
    
    [:octicons-arrow-right-24: 詳細はこちら](../flexible_services/#continuous-stops)

- :material-transit-detour:{ .lg .middle } __予約ルール(Booking Rules)__

    乗客がデマンド型サービスで便を予約できるかどうかを示します。            

    [:octicons-arrow-right-24: 詳細はこちら](../flexible_services/#booking-rules)

- :material-transit-detour:{ .lg .middle } __迂回可能な事前定義ルート(Predefined Routes with Deviation)__

    車両がルートから一時的に迂回して乗客を乗せたり降ろしたりできるサービスです。   

    [:octicons-arrow-right-24: 詳細はこちら](../flexible_services/#predefined-routes-with-deviation)

- :material-transit-detour:{ .lg .middle } __ゾーンベースのデマンド型サービス(Zone-based Demand Responsive Services)__

    特定のエリア内であれば任意の場所で乗降できるサービスです。

    [:octicons-arrow-right-24: 詳細はこちら](../flexible_services/#zone-based-demand-responsive-services)

- :material-transit-detour:{ .lg .middle } __固定停留所型デマンドサービス(Fixed-Stops Demand Responsive Services)__

    特定の停留所グループ内であれば任意の場所で乗降できるサービスです。
   
    [:octicons-arrow-right-24: 詳細はこちら](../flexible_services/#fixed-stops-demand-responsive-services)

</div>
