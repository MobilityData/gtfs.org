# フィード エンティティ

 GTFS Realtimeは、単一のリアルタイム フィードに組み合わせることができる 4 つの異なるタイプのリアルタイム データをサポートしています。概要は以下に記載されており、詳細なドキュメントは関連セクションに記載されています。

## ルート更新

#### `ス` X は 5 分遅れています`

ルート更新は時刻表の変動を表します。スケジュールされているルートのうちリアルタイム対応のルート更新はすべて受信されるものと想定されます。これらの更新により、ルート上の停留所の到着または出発が予測されます。
トリップ更新では、トリップがキャンセルされたり、スケジュールに追加されたり、ルートが変更されたりするような、より複雑なシナリオにも対応できます。

[トリップ更新の詳細...](../trip-updates)

## サービス アラート

#### `駅` Y は工事のため閉鎖されています`

サービス アラートは、特定のエンティティに関する高レベルの問題を表し、通常は混乱のテキスト説明の形式です。

次の問題を表すことができます:

*   駅
*   路線
*   ネットワーク全体
*   など。

サービス アラートは通常、問題を説明するテキストで構成され、詳細情報の URL や、このサービス アラートが誰に影響するかを理解するのに役立つより構造化された情報も使用できます。

[サービス アラートの詳細...](../service-alerts)

## 車両の位置

#### `刻` Y に位置 X にいる"

車両の位置は、ネットワーク上の特定の車両に関するいくつかの基本的な情報を表します。

最も重要なのは、車両が現在いる緯度と経度ですが、車両の現在の速度とオドメーターの読み取り値のデータも使用できます。

[車両Positionの更新の詳細...](../vehicle-positions)

## ルートの変更

#### `これらのルートは、特定の日に迂回によって影響を受けます`

ルートの変更は、一連のルートに影響する迂回を説明するために使用されます。

ルートの変更により、特定の停車地をキャンセルしたり、ルートのタイミングを調整したり、ルートの新しい形状を提供したり、途中の一時的な停車地の場所を提供したりできます。

[ルートの変更の詳細...](../trip-modifications)

## フィード タイプに関する過去のコメントGTFS Realtime仕様の初期のバージョンでは、各フィードに 1 種類のエンティティのみを含める必要がありました。マージされたスキーマから
feed-per-type スキーマに変換するサンプル ツールは、Bliksem Labs [gtfsrt-examples](https:) GitHub リポジトリにあります。