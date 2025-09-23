# フィードエンティティ {: #feed-entities}

GTFS Realtime は、1つのリアルタイムフィード内で組み合わせることができる、4種類の異なるリアルタイムデータをサポートしています。以下に概要を示し、詳細なドキュメントは該当するセクションに記載されています。

## 便の更新(trip updates) {: #trip-updates}

#### "バスXは5分遅れています" {: #bus-x-is-delayed-by-5-minutes}


便の更新(trip updates)は、時刻表の変動を表します。リアルタイム対応可能なすべての便について、便の更新を受け取ることが期待されます。これらの更新は、ルート・路線系統(route)に沿った停留所等(stop)での到着または出発の予測を提供します。便の更新は、便の運休、時刻表への追加、さらには経路変更といった、より複雑なシナリオにも対応することができます。

[便の更新についてさらに詳しく...](../trip-updates)

## 運行情報(alerts) {: #service-alerts}

#### "駅Yは工事のため閉鎖されています" {: #station-y-is-closed-due-to-construction}

運行情報(alert)は、特定のエンティティに関する高レベルの問題を表し、一般的には運行障害の内容を説明するテキスト形式で提供されます。

運行情報(alert)は以下のような問題を表すことがあります:

*   駅
*   路線
*   ネットワーク全体
*   その他

運行情報(alert)は通常、問題を説明するテキストで構成されます。また、詳細情報へのURLや、この運行情報(alert)が誰に影響するのかを理解するための、より構造化された情報を含めることもできます。

[運行情報(alert)についての詳細...](../service-alerts)

## 車両位置情報(vehicle position) {: #vehicle-positions}

#### "このバスは時刻Yに位置Xにいます" {: #this-bus-is-at-position-x-at-time-y}

車両位置情報(vehicle position)は、ネットワーク上の特定の車両に関するいくつかの基本的な情報を表します。

最も重要なのは車両が存在する緯度と経度ですが、車両からの現在の速度や走行距離計の読み取りデータを使用することもできます。

[車両位置情報の更新についてさらに詳しく...](../vehicle-positions)

## 便の変更(trip modifications) {: #trip-modifications}

#### "これらの便は特定の日に迂回の影響を受けます" {: #these-trips-are-affected-by-a-detour-on-certain-days}


便の変更(trip modification)は、複数の便に影響を与える迂回を記述するために使用されます。

便の変更(trip modification)では、特定の停留所等(stop)をキャンセルしたり、便の時刻を調整したり、便が通る新しいルート形状(shape)を提供したり、途中に設置される臨時停留所等(stop)の位置を提供したりすることができます。

[便の変更(trip modification)についてさらに詳しく...](../trip-modifications)

## フィードタイプに関する歴史的注記 {: #historical-remark-on-feed-types}

GTFS Realtime 仕様の初期バージョンでは、各フィードには単一の種類のエンティティのみを含める必要がありました。マージされたフィードをタイプごとのフィードスキーマに変換するためのツールの例は、Bliksem Labs の [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py) GitHub リポジトリにあります。
