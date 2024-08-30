# GTFS Realtimeのベスト プラクティス

## はじめに

これらは、[GTFS Realtime](../reference) データ形式でリアルタイムの公共交通機関情報を記述するための推奨プラクティスです。

### ドキュメントの構造

推奨プラクティスは、2 つの主要なセクションに分かれています

* __[メッセージ別にまとめたプラクティス推奨事項](#practice-recommendations-organized-by-message):__ 推奨事項は、公式のGTFS Realtimeリファレンスに記載されているのと同じ順序で、messageとフィールド別にまとめられています。
* __[ケース別にまとめたプラクティス推奨事項](#practice-recommendations-organized-by-use-case):__ 頻度ベースのサービス (対スケジュール ベースのサービス) などの特定のケースでは、プラクティスを複数のメッセージとフィールド、および対応するGTFS scheduleデータに適用する必要がある場合があります。このセクションでは、このような推奨事項をまとめています。

### フィード公開と一般的なプラクティス

* フィードは、公開された永続的な URL で公開する必要があります
* URL は、フィードにアクセスするためにログインする必要なく、直接アクセスできる必要があります。必要に応じて API キーを使用できますが、API キーの登録は自動化され、すべての人が利用できるようにする必要があります。
* フィードの反復にわたって、 GTFS Realtimeフィード内の永続的な識別子（id フィールド）を維持します（例: FeedEntity.id、 VehicleDescriptor.id、 CarriageDetails.id）。
* GTFS Realtimeフィードは、少なくとも 30 秒ごとに 1 回、またはフィード内に表示される情報（車両の位置）が変更されるたびに、どちらかの頻度が高いほうで更新する必要があります。VehiclePositions は他のフィード エンティティよりも頻繁に変更される傾向があるため、できるだけ頻繁に更新する必要があります。コンテンツが変更されていない場合は、そのタイムスタンプの時点で情報がまだ関連していることを反映する新しい`FeedHeader.timestamp`でフィードを更新する必要があります。
* GTFS Realtimeフィード内のデータは、ルート更新情報と車両位置の場合は 90 秒以内、サービス アラートの場合は 10 分以内である必要があります。たとえば、プロデューサーが`FeedHeader.timestamp`を` 30 秒ごとに継続的に更新している場合でも、そのフィード内の車両位置の経過時間は 90 秒以内である必要があります。
* GTFS Realtimeデータをホストするサーバーは信頼性が高く、有効な形式の protobuf エンコードされたレスポンスを一貫して返す必要があります。応答の 1% 未満が無効である必要があります (protobuf エラーまたは取得エラー)。
* GTFS Realtimeデータをホストするウェブ サーバーは、ファイルの変更dateを正しく報告するように設定する必要があります (HTTP/1.1- Request for Comments 2616、セクション 14.29 を参照)。これにより、消費者は`If-Modified-Since` HTTP ヘッダーを活用できます。これにより、変更されていないフィード コンテンツの転送が回避され、プロデューサーとコンシューマーの帯域幅が節約されます。
* フィードは、指定された URL で HTTP リクエストを介してクエリされた場合、デフォルトでプロトコル バッファでエンコードされたフィード コンテンツを提供する必要があります。コンシューマーは、プロトコル バッファでエンコードされたコンテンツを受信するために特別な HTTP 受け入れヘッダーを定義する必要はありません。
* プロトコル バッファが [オプションの値](https://developers.google.com/protocol-buffers/docs/proto#optional) をエンコードする方法のため、 GTFS Realtimeフィードからデータを読み取る前に、コンシューマーはプロトコル バッファによって生成された`hasX()`() ` メソッドを使用して値の存在を確認してからその値を使用し、 `hasX()`が` true の場合のみ値を使用する必要があります ( `X`はフィールド名)。`hasX ()`hasX()`が`false`を返す場合は、 `gtfs-realtime.proto`値で定義されているそのフィールドのデフォルト値が想定されます。コンシューマーが最初に`hasX()`メソッドをチェックせずに値を使用すると、プロデューサーによって意図的に公開されていないデフォルト データを読み取る可能性があります。
* フィードの整合性を確保するため、フィードでは HTTP (暗号化なし) ではなく HTTPS を使用する必要があります。
* フィードは、付随する静的 GTFS データセットに含まれる旅行の大部分をカバーする必要があります。特に、高密度で交通量の多い市街地と混雑したルートのデータを含める必要があります。

## メッセージ別に整理された実践的な推奨事項

### FeedHeader 

| フィールド名 | 推奨事項 |
|---|---|
| `gtfs_realtime_version` | 現在のバージョンは`2.0`です。GTFS GTFS Realtimeの初期バージョンでは、さまざまな交通状況を適切に表すために必要なすべてのフィールドが要求されなかったため、すべてのGTFS Realtimeフィードは`2.0`以上である必要があります。|
| `timestamp` | このタイムスタンプは、2 つの連続したフィード反復間で減少してはなりません。|
| |フィード コンテンツが変更された場合、このタイムスタンプ値は常に変更される必要があります。つまり、ヘッダー`timestamp`ド` コンテンツを変更してはなりません。<br><br> *よくある間違い* - ロードバランサの背後にGTFS Realtimeフィードのインスタンスが複数ある場合、各インスタンスがリアルタイム データ ソースから情報を取得し、わずかに同期がずれた状態で消費者に公開している可能性があります。GTFSGTFS Realtimeの消費者が 2 つのリクエストを連続して行い、各リクエストが異なるGTFS Realtimeフィード インスタンスによって処理された場合、同じフィード コンテンツが異なるタイムスタンプで消費者に返される可能性があります。<br><br> *考えられる解決策* - プロデューサーは`Last-Modified` HTTP ヘッダーを提供し、コンシューマーは最新の`If-Modified-Since` HTTP ヘッダーを渡すことで、古いデータを受け取らないようにする必要があります。<br><br> *考えられる解決策* - HTTP ヘッダーを使用できない場合は、スティッキー セッションなどのオプションを使用して、各コンシューマーが同じプロデューサー サーバーにルーティングされるようにすることができます。|

### FeedEntity 

すべてのエンティティは、ユーザーにとって関連性がなくなった場合にのみ、 GTFS Realtimeフィードから削除する必要があります。フィードはステートレスであると見なされます。つまり、各フィードは交通システムのリアルタイムの状態全体を反映します。あるフィード インスタンスでエンティティが提供され、その後のフィード更新で削除された場合、そのエンティティにはリアルタイムの情報がないものと見なす必要があります。

| フィールド名 | 推奨事項 |
|---|---|
| `id` |旅行期間全体にわたって安定している必要があります |

### TripUpdate 

旅行キャンセルに関する一般的なガイドライン:

* 数日間にわたる旅行をキャンセルする場合、プロデューサーは、指定された`trip_ids`と`start_dates` を`CANCELED`る` TripUpdates と、同じ`trip_ids`と`TimeRange`を参照する`NO_SERVICE`む` Alert を提供する必要があります。この Alert は、乗客にキャンセルの理由 (迂回など) を説明するために表示できます。
* 旅行中に訪問先がない場合は、すべての`stop_time_updates`を`SKIPPED`としてマークするのではなく、旅行を`CANCELED`にする必要があります。

| フィールド名 | 推奨事項 |
|---|---|
| `trip` | [message TripDescriptor](#tripdescriptor) を参照してください。|
| | `VehiclePosition`と`TripUpdate`フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) ID値のペアは、2 つのフィード間で一致する必要があります。<br><br>たとえば、 `VehiclePosition`エンティティに`vehicle_id:A`と`trip_id:4` がある場合、対応する`TripUpdate``TripUpdate`にも`vehicle_id:A`と`trip_id:4`が必要です。`TripUpdate` エンティティに`trip_id:4`と` 4 以外の`vehicle_id`がある場合は、エラーになります。|
| `vehicle` | [message VehicleDescriptor](#vehicledescriptor) を参照してください。|
| | `VehiclePosition`と`TripUpdate`フィードが別々に提供されている場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) のID値のペアは、2 つのフィード間で一致する必要があります。<br><br>たとえば、 `VehiclePosition`エンティティに`vehicle_id:A`と`trip_id:4` がある場合、対応する`TripUpdate``TripUpdate`にも`vehicle_id:A`と`trip_id:4`が必要です。`TripUpdate` エンティティに`trip_id:4`があり、 `vehicle_id`が` 4 以外の場合、エラーになります。|
| `stop_time_update` | 特定の`trip_id`の`stop_time_updates` は、 `stop_sequence`の昇順で厳密に順序付けする必要があり、 `stop_sequence` を繰り返さないでください。|
| | 旅行の進行中は、すべての`TripUpdates`に、将来の予測到着時刻または出発時刻を含む`stop_time_update` が少なくとも 1 つ含まれている必要があります。 [GTFS Realtime仕様](../feed_entities/trip-updates/#stoptimeupdate)では、過去の`StopTimeUpdate`が、特定の旅程で予定到着時刻が未来の停留所を参照している場合（つまり、車両が予定より早く停留所を通過した場合）、プロデューサーはそれを削除してはならないと規定されていることに注意してください。そうしないと、この停留所には更新がないと判断されます。|
| `timestamp` | この旅程の予測が更新された時間を反映する必要があります。|
| `delay` | `TripUpdate.delay` はスケジュールの偏差、つまり車両がスケジュールよりどれだけ進んでいるか/遅れているかの過去の観測値を表す必要があります。将来の停留所の予測は、`StopTimeEvent.delay`または`StopTimeEvent.time`を通じて提供される必要があります。 |

### TripDescriptor 

`VehiclePosition``VehiclePosition`と`TripUpdate`フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) ID値のペアリングは 2 つのフィード間で一致する必要があります。

たとえば、 `VehiclePosition`エンティティに`vehicle_id:A`と`trip_id:4` がある場合、対応する`TripUpdate`エンティティにも`vehicle_id:A`と`trip_id:4`が必要です。

| フィールド名 | 推奨事項 |
|---|---|
| `schedule_relationship` | `ADDED`旅行の動作は指定されていないため、この列挙体の使用は推奨されません。 |


### VehicleDescriptor 

`VehiclePosition``VehiclePosition`と`TripUpdate`フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) ID値のペアリングは 2 つのフィード間で一致する必要があります。

たとえば、 `VehiclePosition`エンティティに`vehicle_id:A`と`trip_id:4` がある場合、対応する`TripUpdate`エンティティにも`vehicle_id:A`と`trip_id:4` が必要です。

| フィールド名 | 推奨事項 |
|---|---|
| `id` | 旅行期間全体にわたって車両を一意かつ安定的に識別する必要があります |

### StopTimeUpdate 

| フィールド名 | 推奨事項 |
|---|---|
| `stop_sequence` |可能な場合は常に`stop_sequence`を指定します。これは、 `stop_id`とは異なり、 `stop_times.txt`の` GTFS 停車時刻に明確に解決されるためです。`stop_id` は、旅程で複数回出現することがあります (例: ループ ルート)。|
| `arrival` | 連続する停車地間の到着時刻は増加する必要があります。同じにしたり、減少したりしてはなりません。| 
|         | 乗り継ぎまたは停車時間が予想される場合、到着`time` ([StopTimeEvent](#stoptimeevent) で指定) は同じ停車地の出発`time`より前である必要があります。それ以外の場合、到着`time`は出発`time`と同じである必要があります。|
| `departure` | 連続する停車地間の出発時刻は増加する必要があります。同じにしたり、減少したりしてはなりません。|
|          |出発`time` `time` ([StopTimeEvent](#stoptimeevent) で指定) は、乗り継ぎ時間や停車時間が予想されない場合は、同じ停車地の到着 `time` と同じにする必要があります。それ以外の場合は、出発`time` は到着`time`より後である必要があります。 |

### StopTimeEvent 

| フィールド名 | 推奨事項 |
|---|---|
| `delay` | `stop_time_update`の`arrival`または`departure`で`delay`のみが指定されている場合 ( `time`は指定されていない場合)、GTFS [`stop_times.txt`](../../schedule/reference/#stop_timestxt) には、これらの対応する停車地の`arrival_times`および/または`departure_times` が含まれている必要があります。リアルタイム フィード内の`delay`値は、GTFS `stop_times.txt`ファイルに追加するための時刻がない限り、意味がありません。 |

### VehiclePosition 

消費者に高品質のデータを提供するために (予測の生成などのために) VehiclePositions フィードに含める必要がある推奨フィールドは次のとおりです。

| フィールド名 | 注 |
|---|---|
| `entity.id` | 乗車時間全体にわたって一定に保つ必要があります
| `vehicle.timestamp` | 車両の位置が測定されたタイムスタンプを提供することを強くお勧めします。そうしないと、消費者はmessageのタイムスタンプを使用する必要があります。最後のmessageが個々の位置よりも頻繁に更新された場合、乗客に誤解を与える可能性があります。
| `vehicle.vehicle.id` |旅行期間全体にわたって車両を一意かつ安定的に識別する必要があります |

###Position

車両の位置は、この`trip_id`に対して`DETOUR`の効果を持つアラートがない限り、現在の旅行の GTFS `shapes.txt`ら` 200 メートル以内である必要があります。

### アラート

アラートの一般的なガイドライン:

* `trip_id`と`start_time`が`exact_time=1`間隔内にある場合、 `start_time` は間隔の開始よりも`headway_secs`の正確な倍数だけ後にする必要があります。 
* 数日間にわたって運行をキャンセルする場合、運行者は、指定された`trip_ids`と`start_dates`を`CANCELED`る` TripUpdates と、同じ`trip_ids`と`TimeRange`を参照する`NO_SERVICE`の` Alert を提供して、乗客にキャンセルの理由 (迂回など) を説明できるようにする必要があります。
* アラートが路線のすべての停留所に影響する場合は、停留所ベースのアラートではなく、路線ベースのアラートを使用します。路線のすべての停留所にアラートを適用しないでください。
* サービスアラートに文字数制限はありませんが、交通機関の乗客は多くの場合、モバイルデバイスでアラートを表示します。簡潔にしてください。

| フィールド名 | 推奨事項 |
|---|---|
| `description_text` | サービスアラートを読みやすくするために改行を使用します。 |

## ユースケース別にまとめた実践的な推奨事項

### 頻度ベースの旅程

頻度ベースの旅程は、固定のスケジュールには従わず、事前に決められた間隔を維持しようとします。これらの旅程は、[GTFS 頻度.txt](../../schedule/reference/#frequenciestxt) で`exact_times=0`を設定するか、 `exact_times`フィールドを省略することで示されます ( `exact_times=1` の旅程は頻度ベースの旅程ではないことに注意してください`exact_times=1`を指定した`frequencies.txt`は、スケジュールベースの旅程をよりコンパクトに保存するための便利な方法として使用されているだけです)。頻度ベースの旅程のGTFS Realtimeフィードを作成する際には、いくつかのベスト プラクティスに留意する必要があります。

* [TripUpdate. StopTimeUpdate](#stoptimeupdate) では、頻度ベースの旅行は固定スケジュールに従わないため、 `arrival`と`departure`の [StopTimeEvent](#stoptimeevent) に`delay`を含めないでください。代わりに、到着/出発の予測を示すために`time`を指定する必要があります。

* 仕様で要求されているように、[TripUpdate](#tripupdate) または [VehiclePosition](#vehicleposition) で [TripDescriptor](#tripdescriptor) を使用して`trip`を記述する場合は、 `trip_id`、 `start_time`、および`start_date`をすべて指定する必要があります。さらに、 `schedule_relationship` は`UNSCHEDULED`にする必要があります。
 (例: 強化旅行)。


## このドキュメントについて

### 目的GTFS Realtimeのベスト プラクティスを維持する目的は、次のとおりです。

* 公共交通機関アプリにおけるエンドユーザーの顧客エクスペリエンスを向上させる
* ソフトウェア デベロッパーがアプリケーション、製品、サービスをより簡単に導入および拡張できるようにする

### 公開済みのGTFS Realtimeのベスト プラクティスを提案または修正する方法

GTFS のアプリケーションとプラクティスは進化するため、このドキュメントは随時修正する必要がある場合があります。このドキュメントの修正を提案するには、[GTFS Realtimeのベスト プラクティス GitHub リポジトリ](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) でpull requestを開き、変更を支持してください。

### このドキュメントへのリンク

フィード作成者にGTFS Realtimeデータを正しく形成するためのガイダンスを提供するために、ここにリンクしてください。それぞれの推奨事項にはアンカー リンクがあります。推奨事項をクリックすると、ページ内のアンカー リンクの URL が表示されます。

GTFSGTFS Realtimeを使用するアプリケーションが、ここで説明されていないGTFS Realtimeデータの取り扱いに関する要件や推奨事項を定めている場合は、これらの一般的なベスト プラクティスを補足するために、それらの要件や推奨事項を記載したドキュメントを公開することをお勧めします。


