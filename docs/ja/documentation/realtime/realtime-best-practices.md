# GTFS realtimeのベスト プラクティス

## はじめに

これらは、[GTFS realtime](../reference) データ形式でリアルタイムの公共交通事業者情報を記述するための推奨プラクティスです。

### ドキュメントの構造

推奨プラクティスは、2 つの主要なセクションに分かれています

* __[message別にまとめたプラクティス推奨事項](#_4):__ 推奨事項は、公式のGTFS realtimeリファレンスに記載されているのと同じ順序で、messageとフィールド別にまとめられています。
* __[ケース別にまとめたプラクティス推奨事項](#_6):__ 頻度ベースのサービス (対スケジュール ベースのサービス) などの特定のケースでは、プラクティスを複数のメッセージとフィールド、および対応するGTFS scheduleデータに適用する必要がしてもよい。このセクションでは、このような推奨事項をまとめています。

### フィード公開と一般的なプラクティス

* フィードは、公開された永続的な URL で公開するするべきであるがあります
* URL は、フィードにアクセスするためにログインする必要なく、直接アクセスできるするべきである。必要に応じて API キーを使用するべきであるが、API キーの登録は自動化され、すべての人が利用できるようにするするべきである。
* フィードの反復にわたって、 GTFS realtimeフィード内の永続的な識別子（ IDフィールド）を維持します（例: FeedEntity. ID、 VehicleDescriptor. ID、 CarriageDetails. ID）。
* GTFS realtimeフィードは、少なくとも 30 秒に 1 回、またはフィード内に表示される情報（車両のPosition）が変更されるたびに、どちらかの頻度が高いほうで更新する必要があります。VehiclePositions は他のフィード エンティティよりも頻繁に変更される傾向があるため、できるだけ頻繁に更新するするべきである。コンテンツが変更されていない場合は、そのタイムスタンプの時点で情報がまだ関連していることを反映する新しい`FeedHeader.timestamp`でフィードを更新するするべきである。
* GTFS realtimeフィード内のデータは、ルート更新情報と車両位置の場合は 90 秒以内、サービス アラートの場合は 10 分以内でするべきではないがあります。たとえば、プロデューサーが`FeedHeader.timestamp`を` 30 秒ごとに継続的に更新している場合でも、そのフィード内の車両位置の経過時間は 90 秒以内でするべきではない。
* GTFS realtimeデータをホストするサーバーは信頼性が高く、有効な形式の protobuf エンコードされたレスポンスを一貫して返すするべきである。応答の 1% 未満が無効であるするべきである(protobuf エラーまたは取得エラー)。
* GTFS realtimeデータをホストするウェブ サーバーは、ファイルのModificationdateを正しく報告するように設定するするべきである(HTTP/1.1- Request for Comments 2616、セクション 14.29 を参照)。これにより、消費者は`If-Modified-Since` HTTP ヘッダーを活用できます。これにより、変更されていないフィード コンテンツの転送が回避され、プロデューサーとコンシューマーの帯域幅が節約されます。
* フィードは、指定された URL で HTTP リクエストを介してクエリされた場合、デフォルトでプロトコル バッファでエンコードされたフィード コンテンツを提供するするべきである。コンシューマーは、プロトコル バッファでエンコードされたコンテンツを受信するために特別な HTTP 受け入れヘッダーを定義する必要はするべきであるするべきではない。
* プロトコル バッファが [オプションの値](https://developers.google.com/protocol-buffers/docs/proto#optional) をエンコードする方法により、GTFS リアルタイム フィードからデータを読み取る前に、コンシューマーはプロトコル バッファによって生成された `hasX()` メソッドを使用して値の存在を確認し、その値を使用するのは `hasX()` が true の場合のみにする必要があります (`X` はフィールド名)。`hasX()` が `false` を返す場合は、`gtfs-realtime.proto` 値で定義されているそのフィールドのデフォルト値が想定されます。コンシューマーが `hasX()` メソッドを最初に確認せずに値を使用すると、プロデューサーによって意図的に公開されていないデフォルト データを読み取る可能性があります。
* フィードは、付随する静的 GTFS データセットに含まれる便の大部分をカバーするするべきである。特に、高密度で交通量の多い市街地と混雑したルート・路線系統のデータを含めるするべきである。

## メッセージ別に整理された実践推奨事項

### FeedHeader 

| フィールド名 | 推奨事項 |
|---|---|
| `gtfs_realtime_version` | 現在のバージョンは`2.0`です。GTFSGTFS realtimeフィードはすべて`2.0`以上にするするべきである。これは、 GTFS realtimeの初期バージョンでは、さまざまな交通状況を適切に表すために必要なすべてのフィールドが要求されなかったためです。|
| `timestamp` | このタイムスタンプは、2 つの連続したフィード反復間で減少してはなりません。 |
| | フィード コンテンツが変更された場合は、常にこのタイムスタンプ値も変更する必要があります。ヘッダー `timestamp` を更新せずにフィード コンテンツを変更してはなりません。<br><br>*よくある間違い* - ロード バランサの背後に GTFS リアルタイム フィードのインスタンスが複数ある場合、各インスタンスがリアルタイム データ ソースから情報を取得し、わずかに同期がずれた状態で消費者に公開している可能性があります。 GTFS リアルタイム コンシューマーが 2 つの連続したリクエストを行い、各リクエストが異なる GTFS リアルタイム フィード インスタンスによって処理される場合、同じフィード コンテンツが異なるタイムスタンプでコンシューマーに返される可能性があります。<br><br>*考えられる解決策* - プロデューサーは `Last-Modified` HTTP ヘッダーを提供し、コンシューマーは最新の `If-Modified-Since` HTTP ヘッダーを渡すことで、古いデータを受け取らないようにする必要があります。<br><br>*考えられる解決策* - HTTP ヘッダーを使用できない場合は、スティッキー セッションなどのオプションを使用して、各コンシューマーが同じプロデューサー サーバーにルーティングされるようにすることができます。|

### FeedEntity 

すべてのエンティティは、ユーザーにとって関連性がなくなった場合にのみ、 GTFS realtimeフィードから削除するするべきである。フィードはステートレスであると見なされます。つまり、各フィードは交通システムのリアルタイムの状態全体を反映します。あるフィード インスタンスでエンティティが提供され、その後のフィード更新で削除された場合、そのエンティティにはリアルタイムの情報がないものと見なすするべきである。
| フィールド名 | 推奨事項 |
|---|---|
| `id` | 便期間全体にわたって安定しているするべきである |

### TripUpdate 

便キャンセルに関する一般的なガイドライン:

* 数日間にわたる便をキャンセルする場合、プロデューサーは、指定された `trip_ids` と `start_dates` を `CANCELED` として参照する TripUpdates と、同じ `trip_ids` と `TimeRange` を参照する `NO_SERVICE` を含む Alert を提供して、乗客にキャンセルの理由 (迂回など) を説明する必要があります。
* 旅程で停留所を訪問しない場合は、すべての`stop_time_updates`を`SKIPPED`としてマークするのではなく、その旅程を`CANCELED` にするするべきである。ただし、その旅程が `NEW` または`DUPLICATED`旅程で、その後キャンセルされた場合は除きます。

| フィールド名 | 推奨事項 |
|---|---|
| `trip` | [メッセージ TripDescriptor](#tripdescriptor) を参照してください。 |
| | `VehiclePosition` フィードと `TripUpdate` フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) ID 値のペアリングは、2 つのフィード間で一致する必要があります。<br><br>たとえば、`VehiclePosition` エンティティに `vehicle_id:A` と `trip_id:4` がある場合、対応する `TripUpdate` エンティティにも `vehicle_id:A` と `trip_id:4` が必要です。`TripUpdate` エンティティに `trip_id:4` と 4 以外の `vehicle_id` がある場合、これはエラーです。 |
| `vehicle` | [メッセージ VehicleDescriptor](#vehicledescriptor) を参照してください。 |
| | `VehiclePosition` フィードと `TripUpdate` フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) ID 値のペアリングは 2 つのフィード間で一致する必要があります。<br><br>たとえば、`VehiclePosition` エンティティに `vehicle_id:A` と `trip_id:4` がある場合、対応する `TripUpdate` エンティティにも `vehicle_id:A` と `trip_id:4` が必要です。`TripUpdate` エンティティに `trip_id:4` があり、`vehicle_id` が 4 以外の場合、これはエラーです。|
| `stop_time_update` | 特定の `trip_id` の `stop_time_updates` は、`stop_sequence` の昇順に厳密に順序付けする必要があり、`stop_sequence` を繰り返すことはできません。|
| |便の進行中は、すべての `TripUpdates` に、将来の到着または出発の予測時刻を含む `stop_time_update` が少なくとも 1 つ含まれている必要があります。[GTFS Realtime 仕様](../feed-entities/trip-updates/#stoptimeupdate) では、特定の便で予定到着時刻が将来の停留所を参照している場合 (つまり、車両が予定より早く停留所を通過している場合)、プロデューサーは過去の `StopTimeUpdate` を削除してはならないと規定されています。そうしないと、この停留所の更新がないと判断されます。|
| `timestamp` | この便の予測が更新された時刻を反映する必要があります。|
| `delay` | `TripUpdate.delay` はスケジュールの偏差、つまり車両がスケジュールよりどれだけ進んでいるか/遅れているかの過去の観測値を表す必要があります。将来の停留所の予測は、`StopTimeEvent.delay` または `StopTimeEvent.time` を通じて提供される必要があります。|

### TripDescriptor 

`VehiclePosition`と`TripUpdate`フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) ID値のペアリングは 2 つのフィード間で一致するするべきである。

たとえば、`VehiclePosition`エンティティに`vehicle_id:A`と`trip_id:4` がある場合、対応する`TripUpdate`エンティティにも`vehicle_id:A`と`trip_id:4`がするべきである。

| フィールド名 | 推奨事項 |
|---|---|
| `schedule_relationship` | `ADDED`便の動作は指定されていないため、この列挙体の使用は推奨ません。<br/>旅行が元々実行予定でない場合、既存の旅行の停車パターンに従わない場合は `NEW` を使用し、既存の旅行のコピーの場合は`DUPLICATED` を使用します。<br/>旅行が変更されたスケジュールで運行または停留所が、GTFS 静的ファイル内の元のスケジュール済みの旅行に関連付けるするべきである場合は、`REPLACEMENT` を使用して、変更された旅行の停車時刻の完全なリストを指定します。 |

### TripProperties 

| フィールド名 | 推奨事項 |
|---|---|
| `trip_headsign` | ` TripDescriptor.schedule_relationship` = `NEW` の旅行には常に指定し、旅行が迂回する場合は `TripDescriptor.schedule_relationship` = `REPLACEMENT` の旅行に指定します。 |


### VehicleDescriptor 

`VehiclePosition`と`TripUpdate`フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) ID値のペアリングは 2 つのフィード間で一致するするべきである。

たとえば、`VehiclePosition`エンティティに`vehicle_id:A`と`trip_id:4`がある場合、対応する`TripUpdate`エンティティにも`vehicle_id:A`と`trip_id:4`が必要するべきである。

| フィールド名 | 推奨事項 |
|---|---|
| `id` | 便期間全体にわたって車両を一意かつ安定的に識別するするべきである |

### StopTimeUpdate 

| フィールド名 | 推奨事項 |
|---|---|
| `stop_sequence` | `stop_sequence` は可能な限り指定します。`stop_id` とは異なり、`stop_times.txt` の GTFS 停車時刻に明確に解決されるためです。`stop_id` は、1 回の便で複数回発生することがあります (例: ループ ルート)。 |
| `arrival` | 連続する停留所間の到着時刻は増加する必要があります。同じにしたり、減少したりしないでください。 |
| | 乗り継ぎや停車時間が予想される場合は、到着 `time` ([StopTimeEvent](#stoptimeevent) で指定) は同じ停留所の出発 `time` より前である必要があります。それ以外の場合は、到着 `time` は出発 `time` と同じである必要があります。 |
| `departure` | 連続する停留所間の出発時刻は増加する必要があります。同じにしたり、減少したりしないでください。 |
| |乗り継ぎ時間や停車時間が予想されない場合は、出発 `time` ([StopTimeEvent](#stoptimeevent) で指定) は同じ停留所の到着 `time` と同じである必要があります。それ以外の場合は、出発 `time` は到着 `time` より後である必要があります。 |

### StopTimeEvent 

| フィールド名 | 推奨事項 |
|---|---|
| `delay` | `stop_time_update`の`arrival`または`departure`で`delay`のみが指定されている場合 ( `time`は指定されていない場合)、GTFS [`stop_times.txt`](../../schedule/reference/#stop_timestxt) には、これらの対応する停留所等の`arrival_times`および/または`departure_times`が含まれているするべきである。リアルタイム フィード内の`delay`値は、GTFS `stop_times.txt`ファイルに追加するための時刻がない限り、意味がありません。 |
| `scheduled_time` |新規または代替の旅程で、スケジュールに従って運行される場合（代替旅程の場合は変更されたスケジュールでも構いません）、すべての時点に`scheduled_time`を指定するするべきである。複製された旅程の運行時間が元の運行時間と異なる場合も、`scheduled_time`を使用してそれらを指定することができます。|

### VehiclePosition 

消費者に高品質のデータ (予測の生成など) を提供するために、VehiclePostions フィードに含めるするべきである推奨フィールドは次のとおりです。

| フィールド名 | 注 |
|---|---|
| `entity.id` | 乗車時間全体にわたって安定している必要があります
| `vehicle.timestamp` | 車両の位置が測定されたタイムスタンプを提供することを強くお勧めします。そうでない場合、消費者はメッセージのタイムスタンプを使用する必要があります。これは、最後のメッセージが個々の位置よりも頻繁に更新された場合に、乗客に誤解を招く結果をもたらす可能性があります。
| `vehicle.vehicle.id` | 乗車時間全体にわたって車両を一意かつ安定的に識別する必要があります |

### Position

車両のPositionは、この`trip_id`に対して`DETOUR`の効果を持つアラートがない限り、現在の便の GTFS `shapes.txt`ら 200メートル以内である必要があります。

### アラート

アラートの一般的なガイドライン:

* `trip_id`と`start_time`が`exact_time=1`間隔内にある場合、`start_time` は間隔の開始よりも`headway_secs`の正確な倍数だけ後にするするべきである。 
* 数日間にわたって便をキャンセルする場合、運行者は、指定された`trip_ids`と`start_dates` を`CANCELED`る` TripUpdates と、同じ`trip_ids`と`TimeRange`を参照する`NO_SERVICE`の` Alert を提供しするべきである、乗客にキャンセルの理由 (迂回など) を説明できるようにする必要があります。
* アラートが路線のすべての停留所等に影響する場合は、停留所ベースのアラートではなく、路線ベースのアラートを使用します。路線のすべての停留所にアラートを適用しないでください。
* サービスアラートに文字数制限はありませんが、交通事業者の乗客は多くの場合、モバイルデバイスでアラートを表示します。簡潔にしてください。

| フィールド名 | 推奨事項 |
|---|---|
| `description_text` | サービスアラートを読みやすくするために改行を使用します。 |

## ユースケース別にまとめた実践的な推奨事項

### 頻度ベースの便

頻度ベースの旅程は、固定のスケジュールには従わず、事前に決定された間隔を維持しようとします。これらの便は、[GTFS 頻度.txt](../../schedule/reference/#frequenciestxt) で`exact_times=0`を設定するか、`exact_times`フィールドを省略することで示されます ( `exact_times=1`の便は頻度ベースの旅程ではないことに注意してください。`exact_times =`exact_times=1`を指定した`frequencies.txt`は、スケジュールベースの便を便コンパクトに保存するための便利な方法として使用されているだけです)。頻度ベースの便のGTFS realtimeフィードを作成する際には、いくつかのベスト プラクティスに留意する必要があります。

* [TripUpdate. StopTimeUpdate](#stoptimeupdate) では、頻度ベースの便は固定スケジュールに従わないため、`arrival`と`departure`の [StopTimeEvent](#stoptimeevent) に`delay`を含めするべきではない。代わりに、到着/出発の予測を示すために`time` を指定するするべきである。

* 仕様で必須ように、[TripUpdate](#tripupdate) または [VehiclePosition](#vehicleposition) で [TripDescriptor](#tripdescriptor) を使用して`trip` を記述する場合は、`trip_id`、`start_time`、および`start_date`をすべて指定するしなければならない。さらに、`schedule_relationship` は`UNSCHEDULED`にするするべきである。
 (例: 強化便)。


## このドキュメントについて

### 目的GTFS realtimeのベスト プラクティスを維持する目的は、次のとおりです。

* 公共交通事業者アプリにおけるエンドユーザーの顧客エクスペリエンスを向上させる
* ソフトウェア デベロッパーがアプリケーション、製品、サービスを導入および拡張しやすくする

### 公開済みのGTFS realtimeのベスト プラクティスを提案または修正する方法

GTFS のアプリケーションとプラクティスは進化するため、このドキュメントは随時修正する必要がしてもよい。このドキュメントの修正を提案するには、[GTFS realtimeのベスト プラクティス GitHub リポジトリ](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) でプルリクエストを開き、変更を支持してください。

### このドキュメントへのリンク

フィード作成者にGTFS realtimeデータを正しく形成するためのガイダンスを提供するために、こちらにリンクしてください。それぞれの推奨事項にはアンカー リンクがあります。推奨事項をクリックすると、ページ内のアンカー リンクの URL が表示されます。

GTFS realtimeを使用するアプリケーションが、ここで説明されていないGTFS realtimeデータの取り扱いに関する要件や推奨事項を定めている場合は、これらの一般的なベスト プラクティスを補足するために、それらの要件や推奨事項を記載したドキュメントを公開することを推奨