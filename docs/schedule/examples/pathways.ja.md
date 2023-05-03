---
search:
  exclude: true
---

# 経路

<img class="center" src="../../../assets/pathways-visual.jpg">

<hr>

## 駅の出入り口の位置を記述する

GTFSでは、出入口や駅構内の情報を用いて、駅を正確に表現することができます。この例では、バンクーバーのダウンタウンにあるウォーターフロント駅の一部を記述しています。この駅はスカイトレインの一部であり、カナダライン、エキスポライン、シーバス、ウエストコーストエクスプレスが乗り入れている。駅には3つの路面入口があり、乗客はここから出入りします。駅の残りの部分は地下にあり、料金の確認ができるコンコースレベルと、ホームのある低層部があります。

まず、駅の位置と入り口を[stops.txtで](../../reference/#pathwaystxt)で定義する。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

上のファイルでは、最初のレコードが駅の位置に関するもので、したがって`location_type`は`1` に設定されている。他の 5 つのレコードは 3 つの駅の入口に関するものである（グランビル入口は実際には階段、エスカレーター、エレベーターの 3 つの別々の入口を持っているので 5 つのレコードが必要である）。この5つのレコードは、`location_type`が`2` に設定されているので、エントランスと定義される。

また、エントランスの`parent_station`には、Waterfront Station の`stop_id`が記載されており、駅と関連付けられています。アクセシブルな入口は`wheelchair_boarding` `1`、ノンアクセシブルな入口は`2`を設定しています。

## 階段とエスカレーターの記述

Granville 通りにある Waterfront 駅の入り口には、エレベーター、エスカレーター、階段があり、入り口は[stops.txt](../../reference/#stopstxt) の上のノードとして定義されています。エントランスと駅の内部をつなぐには、[stops.txt](../../reference/#stopstxt)の`parent_station`の Waterfront Station の下にノードを追加する必要があります。下の[stops.txt](../../reference/#stopstxt)には、階段とエスカレーターの下に相当する汎用ノード (`location_type 3`) が定義されています。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width=700px>

次に、[pathways.txt](../../reference/#pathwaystxt)ファイルを使用してノードをリンクして経路を作成し、最初のレコードで階段の上部と下部に関連するノードをリンクしています。`pathway_mode`は階段を示す`2`に設定され、最後のフィールドには乗客が階段の上下を行き来できることが記述されている。

同様に、2番目のレコードでは、エスカレーターを記述します`（pathway_mode` `4`はに設定）。エスカレーターは一方向にしか移動できないので、`is_bidirectional`フィールドは`0`に設定されており、ノード`96` `91`から（上方向）へ一方通行で移動するようになっています。

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## エレベータと通路の記述

グランビルストリートにあるエレベータは、エスカレータと階段の終点であるコンコースレベルにある通路に乗客を運びます。地上階のエレベータは、すでに上の駅入口として定義されている（`stop_id` `92`）。従って、コンコースレベルのエレベータドアも定義する必要がある。

さらに、下図に示すように、Granville streetの階段、エスカレータ、エレベータの下と駅舎本体をつなぐ地下通路がある。したがって、歩道部分を定義するために、さらに2つのノードが作成される。

<img class="center" src="../../../assets/pathways-2.png" width=500px>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width=500px>

最後に、以下のファイル[pathways.txt](../../reference/#pathwaystxt)に示すように、ノードを連結して地下通路を定義します。

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
