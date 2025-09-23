# General Transit Feed Specification (GTFS) {: #general-transit-feed-specification-gtfs}

General Transit Feed Specification (GTFS) は、乗客に対して公共交通システムに関する関連情報を配信するために使用される[オープン標準](https://www.interoperablemobility.org/definitions/#open_standard)です。これにより、公共交通事業者は、自らの交通データをさまざまなソフトウェアアプリケーションで利用可能な形式で公開することができます。

GTFS は、[GTFS Schedule](../schedule/reference) と [GTFS Realtime](../realtime/reference) の2つの主要な部分で構成されています。

## [GTFS Schedule](../schedule/reference) {: #gtfs-schedule}


GTFS Schedule は、公共交通機関の静的な情報に共通のフォーマットを定義するフィード仕様です。これは、主にテキストファイル (.txt) で構成される一連のシンプルなファイル群から成り、それらは1つの ZIP ファイルにまとめられます。 

各ファイルは、停留所等(stop)、ルート・路線系統(route)、便(trip) など、交通情報の特定の側面を記述します。最も基本的な形では、GTFS Schedule データセットは `agency.txt`、`routes.txt`、`trips.txt`、`stops.txt`、`stop_times.txt`、`calendar.txt`、`calendar_dates.txt` の7つのファイルで構成されます。

この基本的なファイル群に加えて、運賃、翻訳、乗り換え、構内通路(pathway) など、他のサービス要素に関する情報を提供する追加の（任意の）ファイルを含めることもできます。現在では、GTFS の基本要素を拡張する15以上の任意ファイルが存在しており、その中には地理的なエリアを表現するためにテキストファイル (.txt) 以外の新しいフォーマットとして導入された `locations.geojson` も含まれています。 

すべての GTFS Schedule ファイルの信頼できる情報源は公式の [GTFS Schedule Reference](../schedule/reference) であり、GTFS Schedule データセットを構成する各ファイル内のすべての情報要素に関する要件を詳細に提供しています。

## [GTFS Realtime](../realtime/reference) {: #gtfs-realtime}


GTFS Realtime は、公共交通事業者が最新の到着・出発時刻、運行情報(alert)、車両位置情報(vehicle position)を提供できるフィード仕様であり、利用者が円滑に旅程(journey)を計画できるようにします。

この仕様は現在、以下の種類の情報をサポートしています:

- 便の更新(trip updates) - 遅延、運休、ルート・路線系統(route)の変更
- 運行情報(alerts) - 停留所等(stop)の移動、駅・ルート・路線系統(route)またはネットワーク全体に影響を与える予期せぬ事象
- 車両位置情報(vehicle positions) - 位置や混雑度を含む車両に関する情報

詳細については [Feed Entities](../realtime/feed-entities/overview) セクションをご覧ください。

GTFS Realtime は、実装の容易さ、GTFS との高い相互運用性、そして乗客向け情報に重点を置いて設計されました。これは、[初期の Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates) パートナー事業者、複数の交通系開発者、そして Google との協力によって実現しました。この仕様は [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html) の下で公開されています。

GTFS Realtime のデータ交換フォーマットは [Protocol Buffers](https://developers.google.com/protocol-buffers/) に基づいており、これは構造化データをシリアライズするための言語やプラットフォームに依存しない仕組みです（XML に似ていますが、より小さく、速く、シンプルです）。

GTFS Schedule と同様に、[GTFS Realtime Reference](../realtime/reference) は GTFS Realtime フィードに関するルールと要件を定める唯一の正規の情報源であり、[gtfs-realtime.proto](../realtime/proto) ファイルは使用される要素の階層とその型定義を定義しています。
