# GTFS Schedule機能

GTFS リファレンス形式は、交通システムの現在のニーズを満たすために進化しており、その機能はますます複雑になる可能性があります。**GTFS機能** は、GTFS リファレンス形式によって実現される機能について明確かつ決定的な説明を提供することを目的としています。これにより、交通機関、ベンダー、消費者、研究者は GTFS の機能を理解し、`S` で何ができるのか`という質問に答えることができます。

次の機能のグループでは、各機能の目的と、それに関連付けられているファイルとフィールドについて説明しており、特定の機能をサポートするためにどのデータが必要かをユーザーが理解するのに役立ちます。

##ベース
これらの重要な機能は、GTFS フィードの中核を形成します。これらは、交通サービスを表すために必要な最小限の要素です。

<div class="grid cards" markdown> 

- :material-subway-variant:{ .lg.middle } __事業者__ 

    交通サービスを担当する機関の詳細を伝えます。
    
    [:octicons-arrow-right-24: 詳細はこちら](../base/#agency)

- :material-subway-variant:{ .lg.middle } __停留所等__ 

    交通サービスが乗客を乗せたり降ろしたりする場所を定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../base/#stops)

- :material-subway-variant:{ .lg.middle } __ルート・路線系統__ 

    名前やサービスの種類などの交通ルートの要素を定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../base/#routes)

- :material-subway-variant:{ .lg.middle } __運行日__

    旅行とサービスの免除をスケジュールするための構造を作成します。

    [:octicons-arrow-right-24: 詳細](../base/#service-dates)

- :material-subway-variant:{ .lg.middle } __便__ 

    定義されたルートに沿ってスケジュールされた時間に移動する交通機関の車両を表します。

    [:octicons-arrow-right-24: 詳細](../base/#trips)

-   :material-subway-variant:{ .lg.middle } __停車時刻____ 

    各停車地の各旅行の到着時刻と出発時刻を定義します。

    [:octicons-arrow-right-24: 詳細](../base/#stop-times)

</div> 

##ベースアドオン
これらの機能はGTFS データセットを強化し、乗客のエクスペリエンスを向上させ、機関、ベンダー、データ再利用者間のコラボレーションを促進します。既存のファイルに新しいフィールドを追加したり、新しいファイルを作成したりすることがあります。

<div class="grid cards" markdown> 

- :material-plus-box-multiple-outline:{ .lg.middle } __フィード情報__ 

    フィード自体に関する重要な情報を伝えます。

    [:octicons-arrow-right-24: 詳細はこちら](../base_add-ons/#feed-information)

- :material-plus-box-multiple-outline:{ .lg.middle } __ルート形状__ 

    車両が走行中にたどる地理的経路を定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../base_add-ons/#shapes)

- :material-plus-box-multiple-outline:{ .lg.middle } __路線系統色__ 

    特定のルートに割り当てられた配色を正確に描写し、伝えます。

    [:octicons-arrow-right-24: 詳細はこちら詳しくはこちら](../base_add-ons/#route-colors)

- :material-plus-box-multiple-outline:{ .lg.middle } __自転車の持ち込み可____ 

    車両が自転車に対応しているかどうかを伝達します。

    [:octicons-arrow-right-24: 詳しくはこちら](../base_add-ons/#bike-allowed)

- :material-plus-box-multiple-outline:{ .lg.middle } __行先表示____ 

    車両が旅行の目的地を示すために使用する標識を伝えます。

    [:octicons-arrow-right-24: 詳しくはこちら](../base_add-ons/#headsigns)

- :material-plus-box-multiple-outline:{ .lg.middle } __停留所等の種別__ 

    交通機関の駅内の入口や出口などの主要エリアを分類します。終了します。

    [:octicons-arrow-right-24: 詳細はこちら](../base_add-ons/#location-types)

- :material-plus-box-multiple-outline:{ .lg.middle } __頻度__ 

    定期的な頻度または特定の間隔で動作するサービスを表します。                              

    [:octicons-arrow-right-24: 詳細はこちら](../base_add-ons/#frequency-based-service)

- :material-plus-box-multiple-outline:{ .lg.middle } __乗り換え__ 

    異なる交通サービス間で許可される乗り換えについて説明します。

    [:octicons-arrow-right-24: 詳細はこちら](../base_add-ons/#transfers)

-   :material-plus-box-multiple-outline:{ .lg.middle } __翻訳__ 

    複数の言語でサービス情報を伝えます。

    [:octicons-arrow-right-24: 詳細はこちら](../base_add-ons/#translations)

- :material-plus-box-multiple-outline:{ .lg.middle } __帰属組織__ 

    データセットの作成に関わった人物を伝えます。

    [:octicons-arrow-right-24: 詳細はこちら](../base_add-ons/#attributions)

</div> 


##アクセシビリティ
アクセシビリティ機能は、障害のある人がサービスにアクセスするために必要な情報を提供します。

<div class="grid cards" markdown> 

- :material-wheelchair:{ .lg.middle } __停留所の車椅子でのアクセス__

    場所から車椅子での乗車が可能かどうかを示します。    

    [:octicons-arrow-right-24: 詳細はこちら](../accessibility/#stops-wheelchair-accessibility)

- :material-wheelchair:{ .lg.middle } __乗車の車椅子でのアクセス__

    車両が車椅子を使用する乗客に対応できるかどうかを示します。       

    [:octicons-arrow-right-24: 詳細はこちら](../accessibility/#trips-wheelchair-accessibility)

- :material-wheelchair:{ .lg.middle } __テキスト読み上げ__ 

    停留所名のテキストを音声に変換するために必要な入力を提供します。

    [:octicons-arrow-right-24: 詳細はこちら詳細](../アクセシビリティ/#テキスト読み上げ)

</div> 


##運賃
GTFS は、ゾーン、距離、時間帯に基づく運賃など、さまざまな運賃体系をモデル化できます。乗客に乗車料金と支払い方法を通知します。

<div class="grid cards" markdown> 

-   :material-cash:{ .lg.middle } __チケット商品____ 

    ユーザーが利用できるチケットまたは運賃タイプのリストを定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#fare-products)

-   :material-cash:{ .lg.middle } __チケットメディア__ 

    運賃商品の保持や検証に使用できるメディアを定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#fare-media)

-   :material-cash:{ .lg.middle } __乗車経路ベースの運賃____ 

    特定の路線グループに異なる運賃を適用するために使用するルールについて説明します。

    [:octicons-arrow-right-24: 詳細はこちら詳細](../fares/#route-based-fares)

-   :material-cash:{ .lg.middle } __時間ベースの運賃__ 

    時間帯や曜日によって異なる運賃について説明します。

    [:octicons-arrow-right-24: 詳細](../fares/#time-based-fares)

-   :material-cash:{ .lg.middle } __ゾーンベースの運賃__ 

    あるエリアから別のエリアに移動するときに異なる運賃について説明します。

    [:octicons-arrow-right-24: 詳細](../fares/#zone-based-fares)

-   :material-cash:{ .lg.middle } __運賃の乗り換え__

    旅行の1つの区間から別の区間に乗り換えるときに適用される料金を定義します。

    [:octicons-arrow-right-24: 詳細詳細](../fares/#fares-transfers)

-   :material-cash:{ .lg.middle } __運賃V1__ 

    運賃情報をよりシンプルに表現できるレガシー機能。

    [:octicons-arrow-right-24: 詳細](../fares/#fares-v1)

</div> 


##構内通路

構内通路機能を使用すると、大規模な交通機関の駅をモデル化して、乗客を入口から乗車エリアまで誘導することができます。経路の詳細、推定ナビゲーション時間、および道案内システムが提供されます。

<div class="grid cards" markdown> 

-   :material-escalator:{ .lg.middle } __構内通路の接続__ 

    交通機関の駅内の関連ポイントを接続する経路をモデル化します。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#pathway-connections)

-   :material-escalator:{ .lg.middle } __構内通路の詳細____ 

    経路の物理的特性に関する追加の詳細を提供します。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#pathway-details)

-   :material-escalator:{ .lg.middle } __階・フロア__ 

    交通機関の駅内のすべての異なるレベルについて説明し、リストします。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#levels)

-   :material-escalator:{ .lg.middle } __駅構内通過時間__

    駅構内の経路を移動するのに要する推定時間を伝達します。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#in-station-traversal-time)

-   :material-escalator:{ .lg.middle } __通路標識__ 

    経路に関連付けられた駅構内標識を伝達します。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#pathway-signs)

</div> 

## 柔軟なサービス
定期的なスケジュールや固定ルートに従わない柔軟なサービス、または需要に応じたサービス。

<div class="grid cards" markdown> 

- :material-transit-detour:{ .lg.middle } __連続した停留所等____ 

    停車地間でユーザーを乗せたり降ろしたりできるかどうかを示します。
    
    [:octicons-arrow-right-24: 詳細はこちら](../flexible_services/#continuous-stops)

- :material-transit-detour:{ .lg.middle } __予約ルール__

    ユーザーがデマンド応答型サービスで旅行を予約できるかどうかを示します。            

    [:octicons-arrow-right-24: 詳細はこちら](../flexible_services/#booking-rules)

- :material-transit-detour:{ .lg.middle } __逸脱する定義済みルート・路線系統__

    乗車または降車のためにルートから一時的に逸脱できる車両。   

    [:octicons-arrow-right-24: 詳細はこちら](../flexible_services/#predefined-routes-with-deviation)

- :material-transit-detour:{ .lg.middle } __ゾーンベースのデマンドサービス__ 

    特定のエリア内の任意の場所での乗車/降車を可能にするサービス。

    [:octicons-arrow-right-24: 詳細はこちら](../flexible_services/#zone-based-demand-responsive-services)

- :material-transit-detour:{ .lg.middle } __固定停留所型のデマンドサービス__ 

    停車地グループ内の任意の場所での乗車/降車を可能にするサービス。
   
    [:octicons-arrow-right-24: 詳細はこちら詳細](../flexible_services/#固定停止需要対応サービス)

</div> 
