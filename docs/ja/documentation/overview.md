#General Transit Feed Specification(GTFS)

General Transit Feed Specification(GTFS) は、交通システムに関する関連情報を乗客に配信するために使用される [オープン スタンダード](https:) です。これにより、公共交通事業者は、さまざまなソフトウェア アプリケーションで使用できる形式で交通データを公開できます。

GTFS は、[GTFS Schedule](../schedule/reference) と [GTFS Realtime](../realtime/reference) という 2 つの主要な部分で構成されています。

## [GTFS Schedule](../schedule/reference)

 GTFS Scheduleは、静的な公共交通機関情報の共通形式を定義するフィード仕様です。これは、単一の ZIP ファイルに含まれる、ほとんどがテキスト ファイル (.txt) である単純なファイルのコレクションで構成されています。 

各ファイルは、停留所、ルート、旅行などの交通情報の特定の側面を記述します。最も基本的な形式では、 GTFS Scheduleデータセットは 7 つのファイルで構成されます: `agency.txt`、 `routes.txt`、 `trips.txt`、 `stops.txt`、 `stop_times.txt`、 `calendar.txt` 、および`calendar_dates.txt`ル` セットに加えて、追加の (オプションの) ファイルをグループ化して、運賃、翻訳、乗り換え、駅構内経路などの他のサービス要素の情報を提供することもできます。現在、GTFS の基本要素を拡張する 15 を超えるオプション ファイルがあり、その中には、地理的領域を表すために使用できるテキスト ファイル ( .txt ) 以外の新しい形式を導入したlocations.geojsonも含まれます。 

すべてのGTFS Scheduleファイルの信頼できる情報源は、公式の [GTFS Scheduleリファレンス](../schedule/reference) です。このリファレンスには、 GTFS Scheduleデータセットを構成する各ファイルのすべての情報要素の要件に関する詳細情報が記載されています。


## [GTFS Realtime](../realtime/reference)

 GTFS Realtimeは、公共交通機関が現在の到着時刻と出発時刻、サービス アラート、車両の位置に関する最新情報を提供できるようにするフィード仕様であり、ユーザーはスムーズに旅行を計画できます。

この仕様では現在、次の種類の情報がサポートされています。

- 旅行の更新 - 遅延、キャンセル、ルート変更
- サービス アラート - 停留所の移動、駅、ルート、またはネットワーク全体に影響を及ぼす予期しないイベント
- 車両の位置 - 場所や混雑レベルなどの車両に関する情報

詳細については、[フィード エンティティ](../realtime/feed_entities/overview) セクションをご覧ください。

 GTFS Realtimeは、実装の容易さ、優れたGTFS の相互運用性と乗客情報への重点。これは、[初期の Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates) パートナー機関、多数の交通機関開発者、および Google のパートナーシップを通じて実現しました。仕様は [Apache 2.0 ライセンス](http://www.apache.org/licenses/LICENSE-2.0.html) に基づいて公開されています。

GTFSGTFS Realtimeデータ交換形式は [Protocol Buffers](https://developers.google.com/protocol-buffers/) に基づいています。これは、構造化データをシリアル化するための言語およびプラットフォームに依存しないメカニズムです (XML のようなものですが、より小さく、より高速で、よりシンプルです)。 GTFS Scheduleと同様に、[GTFS Realtimeリファレンス](../realtime/reference) は、あらゆるGTFS Realtimeフィードのルールと要件を確立する信頼できる情報源であり、[gtfs-realtime.proto](../realtime/proto) ファイルは、使用される要素の階層とそのタイプ定義を定義します。
