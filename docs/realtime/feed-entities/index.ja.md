# フィードエンティティ

GTFS Realtime は3種類のリアルタイムデータをサポートしており、1つのリアルタイムフィードにまとめることができます。以下にその概要を説明します。

## Trip Updates

#### "バスXは5分遅れています"

Trip Updatesは、時刻表の変動を表す。私たちは、リアルタイムに対応するすべてのトリップについて、トリップ・アップデートを受信することを期待します。これらの更新は、ルート上の停留所の到着または出発の予測を提供します。Trip updates、トリップのキャンセル、スケジュールへの追加、または経路変更など、より複雑なシナリオを提供することもできます。

[トTrip Updatesの詳細...](trip-updates.md)

## Service Alerts

#### "Y駅は工事のため閉鎖されています"

Service Alertsは、特定のエンティティに関するより高度な問題を表し、一般に障害に関するテキスト記述の形式をとっている。

以下のような問題を表すことができる。

*   駅
*   線路
*   ネットワーク全体
*   などです。

Service alertは通常、問題点 を説明するテキストで構成されます。また、このサービスアラートが誰に影響するかを理解するために、詳細情報のURLや、より構造化された な情報も許可しています。

[Service Alertsの詳細...](service-alerts.md)

## Vehicle Positions

#### "このバスはY時にX地点にいます"

Vehicle positionは、ネットワーク上の特定の車両に関するいくつかの基本的な情報を表します。

最も重要なのは、その車両がいる緯度と経度であるが、その車両の現在の速度やオドメーターの読み取り値に関するデータも取得できる。

[Vehicle Positionsの更新について...](vehicle-positions.md)

## フィードの種類に関する歴史的な発言

GTFS Realtime Specificationの初期のバージョンでは、各フィードには1つのタイプのエンティティしか含まれないことが要求されていました。Bliksem Labs[gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py)GitHub リポジトリに、マージされたスキーマからfeed-per-typeスキーマに変換するツールのサンプルがあります。
