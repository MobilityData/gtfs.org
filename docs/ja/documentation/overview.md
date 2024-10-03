---
title: 技術ドキュメント
description: GTFS scheduleとGTFS realtimeの両方について、GTFS リファレンス ドキュメント、ベスト プラクティス、データ例、変更履歴にアクセスします。
---

# General Transit Feed Specification (GTFS)

General Transit Feed Specification (GTFS) は、交通システムに関する関連情報を乗客に配信するために使用される [オープン スタンダード](https:) です。これにより、公共交通事業者は、さまざまなソフトウェア アプリケーションで使用できる形式で交通データを公開できます。

GTFS は、[GTFS schedule](../schedule/reference) と [GTFS realtime](../realtime/reference) という 2 つの主要な部分で構成されています。

## [GTFS schedule](../schedule/reference)

GTFS scheduleは、静的な公共交通機関情報の共通形式を定義するフィード仕様です。これは、単一の ZIP ファイルに含まれる、主にTextファイル (.txt) の単純なファイルのコレクションで構成されています。 

各ファイルは、停留所等、ルート・路線系統、便などの交通情報の特定の側面を記述します。最も基本的な形式では、 GTFS scheduleデータセットは 7 つのファイルで構成されます: `agency.txt`、 `routes.txt`、 `trips.txt`、 `stops.txt`、 `stop_times.txt`、 `calendar.txt` 、および`calendar_dates.txt`ル` セットに加えて、追加の (任意の) ファイルをグループ化して、運賃、翻訳、乗り換え、駅構内構内通路などの他のサービス要素の情報を提供することもできます。現在、GTFS の基本要素を拡張する 15 を超える任意ファイルがあり、その中には、地理的なエリアを表すために使用できるTextファイル (.txt ) 以外の新しい形式を導入したlocations.geojsonも含まれます。 

すべてのGTFS scheduleファイルの信頼できる情報源は、公式の [GTFS scheduleリファレンス](../schedule/reference)です。このリファレンスには、 GTFS scheduleデータセットを構成する各ファイルのすべての情報要素の要件に関する詳細情報が記載されています。


## [GTFS realtime](../realtime/reference)

GTFS realtimeは、公共交通機関が現在の到着時刻と出発時刻、サービス アラート、車両のPositionに関する最新情報を提供できるようにするフィード仕様であり、ユーザーはスムーズに便を計画できます。

この仕様では現在、次の種類の情報がサポートされています。

- 旅行の更新 - 遅延、キャンセル、ルート・路線系統変更 
- サービス アラート - 停留所の移動、駅、ルート、またはネットワーク全体に影響を及ぼす予期しないイベント
- 車両の位置 - 場所や混雑レベルなどの車両に関する情報

詳細については、[フィード エンティティ](../realtime/feed_entities/overview) セクションをご覧ください。

GTFS realtimeは、使いやすさを重視して設計されています。実装、GTFS の相互運用性、乗客情報への重点が重視されています。これは、[初期の Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates) パートナー機関、多数の交通機関開発者、および Google のパートナーシップを通じて実現しました。仕様は [Apache 2.0 ライセンス](http://www.apache.org/licenses/LICENSE-2.0.html) に基づいて公開されていますGTFS realtimeデータ交換形式は [プロトコル バッファ](https://developers.google.com/protocol-buffers/) に基づいています。これは、構造化データをシリアル化する言語およびプラットフォームに依存しないメカニズムです (XML のようなものですが、より小さく、より高速で、よりシンプルです)。 GTFS scheduleと同様に、[GTFS realtimeリファレンス](../realtime/reference) は、あらゆるGTFS realtimeフィードのルールと要件を確立する信頼できる情報源であり、[gtfs-realtime.proto](../realtime/proto) ファイルは、使用される要素の階層とそのタイプ定義を定義します。
