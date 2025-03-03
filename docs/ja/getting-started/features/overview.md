---
title: GTFS Schedule Features
description: GTFS schedule の機能について理解を深め、その機能について理解を深めましょう。
---

# GTFS Schedule Features

GTFS リファレンス フォーマットは、交通システムの現在のニーズを満たすために進化しており、その機能はますます複雑になる可能性があります。**GTFS Schedule Features** は、GTFS リファレンス フォーマットによって実現される機能について明確かつ明確な説明を提供することを目的としています。これにより、交通事業者、ベンダー、消費者、研究者は GTFS の機能を理解し、「**GTFS で何ができるのか?**」という質問に答えることができます。

## ベース

次の機能グループでは、各機能の目的と、それに関連付けられているファイルとフィールドについて説明しており、特定の機能をサポートするためにどのデータが必要かをユーザーが理解するのに役立ちます。

<div class="grid cards" markdown> 

- :material-subway-variant:{ .lg.middle } __事業者__ 

    交通サービスを担当する事業者についての詳細を伝えます。
    
    [:octicons-arrow-right-24: 詳細はこちら](../base/#_2)

- :material-subway-variant:{ .lg.middle } __停留所等 停留所__ 

    交通サービスが乗客を乗せたり降ろしたりする場所を定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../base/#_3)

- :material-subway-variant:{ .lg.middle } __ルート・路線系統__ 

    名前やサービスの種類などの交通ルートの要素を定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../base/#_4)

- :material-subway-variant:{ .lg.middle } __運行日__ 

    便とサービスの免除をスケジュールするための構造を作成します。

    [:octicons-arrow-right-24: 詳細](../base/#_5)

- :material-subway-variant:{ .lg.middle } __便__ 

    定義されたルートに沿ってスケジュールされた時間に移動する交通事業者の車両を表します。

    [:octicons-arrow-right-24: 詳細](../base/#_6)

-   :material-subway-variant:{ .lg.middle } __停車時刻__ 

    各停留所の各便の到着時刻と出発時刻を定義します。

    [:octicons-arrow-right-24: 詳細](../base/#_7)

</div> 

## ベースアドオン
これらの機能はGTFS データセットを強化し、乗客のエクスペリエンスを向上させ、事業者、ベンダー、データ再利用者間のコラボレーションを促進します。既存のファイルに新しいフィールドを追加したり、新しいファイルを作成したりすることがしてもよい。

<div class="grid cards" markdown> 

- :material-plus-box-multiple-outline:{ .lg.middle } __フィード情報__ 

    フィード自体に関する重要な情報を伝えます。

    [:octicons-arrow-right-24: 詳細はこちら](../base-add-ons/#_2)

- :material-plus-box-multiple-outline:{ .lg.middle } __ルート形状__ 

    車両が走行中にたどる地理的経路を定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../base-add-ons/#_3)

- :material-plus-box-multiple-outline:{ .lg.middle } __路線系統色__ 

    特定のルート・路線系統に割り当てられた配色を正確に描写し、伝えます。

    [:octicons-arrow-right-24: 詳細はこちら詳しくはこちら](../base-add-ons/#_4)

- :material-plus-box-multiple-outline:{ .lg.middle } __自転車の持ち込み可__ 

    車両が自転車に対応しているかどうかを伝達します。

    [:octicons-arrow-right-24: 詳しくはこちら](../base-add-ons/#_5)

- :material-plus-box-multiple-outline:{ .lg.middle } __行先表示__ 

    車両が便の目的地を示すために使用する標識を伝えます。

    [:octicons-arrow-right-24: 詳しくはこちら](../base-add-ons/#_6)

- :material-plus-box-multiple-outline:{ .lg.middle } __停留所等の種別__ 

    交通事業者の駅内の入口や出口などの主要エリアを分類します。終了します。

    [:octicons-arrow-right-24: 詳細はこちら](../base-add-ons/#_7)

- :material-plus-box-multiple-outline:{ .lg.middle } __頻度__ 

    定期的な頻度または特定の間隔で動作するサービスを表します。                              

    [:octicons-arrow-right-24: 詳細はこちら](../base-add-ons/#_8)

- :material-plus-box-multiple-outline:{ .lg.middle } __乗り換え__ 

    異なる交通サービス間で許可される乗り換えについて説明します。

    [:octicons-arrow-right-24: 詳細はこちら](../base-add-ons/#_9)

-   :material-plus-box-multiple-outline:{ .lg.middle } __翻訳__ 

    複数の言語でサービス情報を伝えます。

    [:octicons-arrow-right-24: 詳細はこちら](../base-add-ons/#_10)

- :material-plus-box-multiple-outline:{ .lg.middle } __帰属組織__ 

    データセットの作成に関わった人物を伝えます。

    [:octicons-arrow-right-24: 詳細はこちら](../base-add-ons/#_11)

</div> 


##アクセシビリティ
アクセシビリティ機能は、障害のある人がサービスにアクセスするために必要な情報を提供します。

<div class="grid cards" markdown> 

- :material-wheelchair:{ .lg.middle } __停留所の車椅子でのアクセス__

    場所から車椅子での乗車が可能かどうかを示します。    

    [:octicons-arrow-right-24: 詳細はこちら](../accessibility/#_2)

- :material-wheelchair:{ .lg.middle } __乗車の車椅子でのアクセス__

    車両が車椅子を使用する乗客に対応できるかどうかを示します。       

    [:octicons-arrow-right-24: 詳細はこちら](../accessibility/#_3)

- :material-wheelchair:{ .lg.middle } __テキスト読み上げ__ 

    停留所名のTextを音声に変換するために必要な入力を提供します。

    [:octicons-arrow-right-24: 詳細はこちら詳細](../accessibility/#_4)

</div> 


##運賃
GTFS は、ゾーン、距離、時間帯に基づく運賃など、さまざまな運賃体系をモデル化できます。乗客に乗車料金と支払い方法を通知します。

<div class="grid cards" markdown> 

-   :material-cash:{ .lg.middle } __チケット商品__ 

    ユーザーが利用できるチケットまたは運賃の種類のリストを定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#_2)

-   :material-cash:{ .lg.middle } __運賃メディア__ 

    チケット商品の保持や検証に使用できるメディアを定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#_3)

-   :material-cash:{ .lg.middle } __乗客カテゴリ__

    特定の運賃が適用されるライダーのさまざまなカテゴリを表します。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#_4)

-   :material-cash:{ .lg.middle } __乗車経路ベースの運賃__ 

    特定のルート・路線系統グループに異なる運賃を適用するために使用するルールについて説明します。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#_5)

-   :material-cash:{ .lg.middle } __時間ベースの運賃__ 

    時間帯や曜日によって異なる運賃について説明します。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#_6)

-   :material-cash:{ .lg.middle } __ゾーンベースの運賃__ 

    あるエリアから別のエリアに便するときに異なる運賃について説明します。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#_7)

-   :material-cash:{ .lg.middle } __運賃の乗り換え__

    便の 1 つの区間から別の区間に乗り換えるときに適用される料金を定義します。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#_8)

-   :material-cash:{ .lg.middle } __Fares v1__ 

    運賃情報をよりシンプルに表現できるレガシー機能。

    [:octicons-arrow-right-24: 詳細はこちら](../fares/#fares-v1)

</div> 


##構内通路

構内通路機能を使用すると、大規模な交通事業者の駅をモデル化して、乗客を入口から乗車エリアまで誘導することができます。経路の詳細、推定ナビゲーション時間、および道案内システムが提供されます。

<div class="grid cards" markdown> 

-   :material-escalator:{ .lg.middle } __構内通路の接続__ 

    交通事業者の駅内の関連ポイントを接続する経路をモデル化します。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#_2)

-   :material-escalator:{ .lg.middle } __構内通路の詳細__ 

    経路の物理的特性に関する追加の詳細を提供します。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#_3)

-   :material-escalator:{ .lg.middle } __階・フロア__ 

    交通事業者の駅内のすべての異なる階・フロアについて説明し、リストします。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#_4)

-   :material-escalator:{ .lg.middle } __駅構内移動時間__ 

    駅構内の経路を移動するのに要する推定時間を伝達します。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#_5)

-   :material-escalator:{ .lg.middle } __通路標識__ 

    経路に関連付けられた駅構内標識を伝達します。

    [:octicons-arrow-right-24: 詳細はこちら](../pathways/#_6)

</div> 

##フレキシブルサービス
フレキシブルサービス、つまり需要に応じたサービス。定期的なスケジュールや固定ルート・路線系統に従わないサービスです。

<div class="grid cards" markdown> 

- :material-transit-detour:{ .lg.middle } __連続した停留所等__ 

    停留所等間でユーザーを乗せたり降ろしたりできるかどうかを示します。
    
    [:octicons-arrow-right-24: 詳細はこちら](../flexible-services/#_2)

- :material-transit-detour:{ .lg.middle } __予約ルール__ 

    ユーザーがデマンド応答型サービスで便を予約できるかどうかを示します。            

    [:octicons-arrow-right-24: 詳細はこちら](../flexible-services/#_3)

- :material-transit-detour:{ .lg.middle } __逸脱する定義済みルート・路線系統__

    乗車または降車のためにルートから一時的に逸脱できる車両。   

    [:octicons-arrow-right-24: 詳細はこちら](../flexible-services/#_4)

- :material-transit-detour:{ .lg.middle } __ゾーンベースのデマンドサービス__

    特定のエリア内の任意の場所での乗車/降車を可能にするサービス。

    [:octicons-arrow-right-24: 詳細はこちら](../flexible-services/#_5)

- :material-transit-detour:{ .lg.middle } __固定停留所型のデマンドサービス__

    停留所等グループ内の任意の場所での乗車/降車を可能にするサービス。
   
    [:octicons-arrow-right-24: 詳細はこちら詳細](../flexible-services/#_6)

</div> 