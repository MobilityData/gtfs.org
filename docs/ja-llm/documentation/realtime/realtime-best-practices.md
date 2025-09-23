# GTFS Realtime ベストプラクティス {: #gtfs-realtime-best-practices}

## はじめに {: #introduction}

ここでは、[GTFS Realtime](../reference) データ形式において、公共交通のリアルタイム情報を記述するための推奨される実践方法について説明します。

### ドキュメント構成 {: #document-structure}


推奨される実践方法は、主に2つのセクションに整理されています。

* __[メッセージごとに整理された推奨事項](#practice-recommendations-organized-by-message):__ 推奨事項は、公式の GTFS Realtime リファレンスで説明されているのと同じ順序で、メッセージおよびフィールドごとに整理されています。
* __[ケースごとに整理された推奨事項](#practice-recommendations-organized-by-use-case):__ 頻度ベースの運行（時刻表ベースの運行との対比）などの特定のケースでは、複数のメッセージやフィールド、さらに対応する GTFS Schedule データにわたって実践方法を適用する必要がある場合があります。そのような推奨事項は、このセクションに集約されています。

### フィード公開と一般的な運用慣行 {: #feed-publishing-general-practices}


* フィードは公開され、恒久的な URL で提供されるべきです。
* URL は、フィードにアクセスするためにログインを必要とせず、直接アクセスできるべきです。必要に応じて API キーを使用することができますが、API キーの登録は自動化され、すべての人が利用できるようにすべきです。
* GTFS Realtime フィード内の識別子 (id フィールド)（例: FeedEntity.id、VehicleDescriptor.id、CarriageDetails.id）は、フィードの更新をまたいで一貫して維持しなければなりません。
* GTFS Realtime フィードは、少なくとも 30 秒ごと、またはフィード内で表現される情報（車両の位置）が変化するたびに更新されるべきです。どちらか頻度の高い方を優先します。VehiclePositions は他のフィードエンティティよりも頻繁に変化する傾向があるため、可能な限り頻繁に更新するべきです。内容が変化していない場合でも、情報がその時点で依然として有効であることを示す新しい `FeedHeader.timestamp` を付与してフィードを更新するべきです。
* GTFS Realtime フィード内のデータは、Trip Updates および Vehicle Positions に関しては 90 秒以上古くあってはならず、Service Alerts に関しては 10 分以上古くあってはなりません。例えば、プロデューサーが `FeedHeader.timestamp` を 30 秒ごとに更新していたとしても、そのフィード内の VehiclePositions のデータは 90 秒以上古くなってはいけません。
* GTFS Realtime データをホストするサーバーは信頼性が高く、一貫して正しくフォーマットされた protobuf エンコードのレスポンスを返さなければなりません。無効なレスポンス（protobuf エラーや取得エラー）は 1% 未満であるべきです。
* GTFS Realtime データをホストする Web サーバーは、ファイルの更新日時を正しく報告するように設定されるべきです（HTTP/1.1 - Request for Comments 2616 のセクション 14.29 を参照）。これにより、コンシューマーは `If-Modified-Since` HTTP ヘッダーを活用することができ、変更されていないフィード内容の転送を回避することで、プロデューサーとコンシューマー双方の帯域幅を節約できます。
* フィードは、指定された URL に対して HTTP リクエストで問い合わせられた際、デフォルトで protocol buffer エンコードされたフィード内容を提供するべきです。コンシューマーは protocol buffer エンコードされた内容を受け取るために特別な HTTP accept ヘッダーを定義する必要があってはなりません。
* protocol buffer が [optional values](https://developers.google.com/protocol-buffers/docs/proto#optional) をエンコードする方法により、GTFS Realtime フィードからデータを読み取る前に、コンシューマーは protocol buffer によって生成された `hasX()` メソッドを使用して値の存在を確認するべきです。そして `hasX()` が true の場合にのみその値を使用するべきです（ここで `X` はフィールド名です）。`hasX()` が false を返す場合、そのフィールドのデフォルト値は `gtfs-realtime.proto` に定義された値であるとみなさなければなりません。コンシューマーが `hasX()` メソッドを確認せずに値を使用した場合、プロデューサーが意図的に公開していないデフォルトデータを読み取ってしまう可能性があります。
* フィードは、フィードの完全性を確保するために、暗号化されていない HTTP ではなく HTTPS を使用するべきです。
* フィードは、対応する静的 GTFS データセットに含まれる便の大部分をカバーするべきです。特に、人口密度が高く交通量の多い都市部や混雑するルートを含むべきです。

## メッセージごとに整理された実践推奨事項 {: #practice-recommendations-organized-by-message}

### FeedHeader {: #feedheader}


| フィールド名 | 推奨事項 |
| --- | --- |
| `gtfs_realtime_version` | 現在のバージョンは "2.0" です。すべての GTFS Realtime フィードは "2.0" 以上であるべきです。初期のバージョンの GTFS Realtime では、さまざまな交通状況を適切に表現するために必要なすべてのフィールドが必須ではありませんでした。 |
| `timestamp` | このタイムスタンプは、2つの連続するフィード更新の間で減少してはいけません。 |
|  | フィード内容が変更された場合、このタイムスタンプ値は必ず変更されなければなりません。フィード内容が変更される際に、ヘッダーの `timestamp` を更新せずに変更してはいけません。<br><br>*よくある間違い* - ロードバランサーの背後に複数の GTFS Realtime フィードインスタンスがある場合、それぞれのインスタンスがリアルタイムデータソースから情報を取得し、わずかに異なるタイミングで利用者に配信することがあります。GTFS Realtime の利用者が連続して2回リクエストを行い、それぞれが異なる GTFS Realtime フィードインスタンスによって処理された場合、同じフィード内容が異なるタイムスタンプで返される可能性があります。<br><br>*考えられる解決策* - 提供者は `Last-Modified` HTTP ヘッダーを提供し、利用者は最新の `If-Modified-Since` HTTP ヘッダーを送信することで、古いデータを受け取るのを避けるべきです。<br><br>*考えられる解決策* - HTTP ヘッダーが使用できない場合、スティッキーセッションなどの方法を用いて、各利用者が同じ提供サーバーにルーティングされるようにすることができます。 |

### FeedEntity {: #feedentity}


すべてのエンティティは、利用者にとってもはや関連性がなくなった場合にのみ、GTFS Realtime フィードから削除されるべきです。フィードはステートレスであると見なされ、各フィードは交通システム全体のリアルタイムの状態を反映します。あるフィードインスタンスでエンティティが提供され、その後のフィード更新で削除された場合、そのエンティティに関するリアルタイム情報は存在しないと見なされるべきです。

| フィールド名 | 推奨事項 |
| --- | --- |
| `id` | 便の全期間にわたって安定して保持するべきです |

### TripUpdate {: #tripupdate}


便のキャンセルに関する一般的なガイドライン:

* 複数日にわたって便をキャンセルする場合、プロデューサーは指定された `trip_ids` と `start_dates` を `CANCELED` として参照する TripUpdates を提供するとともに、同じ `trip_ids` と `TimeRange` を参照する `NO_SERVICE` の Alert を提供し、乗客にキャンセルの理由（例: 迂回）を説明できるようにするべきです。
* 便の停留所等(stop)が1つも訪問されない場合、その便はすべての `stop_time_updates` を `SKIPPED` とするのではなく、`CANCELED` とするべきです。ただし、その便が `NEW` または `DUPLICATED` の便で、その後キャンセルされた場合は例外です。 

| フィールド名 | 推奨事項 |
| --- | --- |
| `trip` | [message TripDescriptor](#tripdescriptor) を参照してください。 |
|  | `VehiclePosition` フィードと `TripUpdate` フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) の ID 値の組み合わせは両方のフィードで一致しなければなりません。<br><br>例: `VehiclePosition` エンティティが `vehicle_id:A` と `trip_id:4` を持つ場合、対応する `TripUpdate` エンティティも `vehicle_id:A` と `trip_id:4` を持たなければなりません。もし `TripUpdate` エンティティが `trip_id:4` を持ち、かつ `vehicle_id` が 4 以外である場合、それはエラーです。 |
| `vehicle` | [message VehicleDescriptor](#vehicledescriptor) を参照してください。 |
|  | `VehiclePosition` フィードと `TripUpdate` フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) の ID 値の組み合わせは両方のフィードで一致しなければなりません。<br><br>例: `VehiclePosition` エンティティが `vehicle_id:A` と `trip_id:4` を持つ場合、対応する `TripUpdate` エンティティも `vehicle_id:A` と `trip_id:4` を持たなければなりません。もし `TripUpdate` エンティティが `trip_id:4` を持ち、かつ `vehicle_id` が 4 以外である場合、それはエラーです。 |
| `stop_time_update` | 指定された `trip_id` に対する `stop_time_updates` は、`stop_sequence` が昇順に厳密に並んでいなければならず、同じ `stop_sequence` を繰り返してはいけません。 |
|  | 便が運行中である間、すべての `TripUpdates` は少なくとも1つの将来の到着または出発時刻を予測する `stop_time_update` を含むべきです。なお、[GTFS Realtime 仕様](../feed-entities/trip-updates/#stoptimeupdate) では、プロデューサーは、便において将来の予定到着時刻を持つ停留所等(stop)に対応する過去の `StopTimeUpdate` を削除するべきではないとされています（つまり、車両が予定より早く停留所等(stop)を通過した場合）。そうしないと、その停留所等(stop)に対する更新が存在しないと解釈されてしまいます。 |
| `timestamp` | この便に対する予測が更新された時刻を反映するべきです。 |
| `delay` | `TripUpdate.delay` はダイヤからのずれを表すべきです。すなわち、車両がどれだけ予定より早い/遅いかという過去の観測値を示すべきです。将来の停留所等(stop)に対する予測は、`StopTimeEvent.delay` または `StopTimeEvent.time` を通じて提供するべきです。 |

### TripDescriptor {: #tripdescriptor}


もし `VehiclePosition` フィードと `TripUpdate` フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) の ID 値の組み合わせは、両方のフィード間で一致しなければなりません。

例えば、ある `VehiclePosition` エンティティが `vehicle_id:A` および `trip_id:4` を持つ場合、対応する `TripUpdate` エンティティも `vehicle_id:A` および `trip_id:4` を持たなければなりません。

| フィールド名 | 推奨事項 |
| --- | --- |
| `schedule_relationship` | `ADDED` 便の挙動は未定義であり、この列挙値の使用は推奨されません。<br/>便が元々運行予定に含まれていない場合、既存の便の停車パターンに従わない場合は `NEW` を使用し、既存の便のコピーである場合は `DUPLICATED` を使用してください。<br/>便が修正された時刻表や停車パターンで運行されるが、GTFS 静的データ内の元の運行予定便に関連付けることができる場合は、`REPLACEMENT` を使用し、修正された便の停車時刻(stop_time)の完全なリストを指定してください。 |

### TripProperties {: #tripproperties}


| フィールド名 | 推奨事項 |
| --- | --- |
| `trip_headsign` | `TripDescriptor.schedule_relationship` = `NEW` の便(trip)には常に提供するべきです。また、便(trip)が迂回している場合は、`TripDescriptor.schedule_relationship` = `REPLACEMENT` の便(trip)にも提供するべきです。 |

### VehicleDescriptor {: #vehicledescriptor}

もし `VehiclePosition` フィードと `TripUpdate` フィードが別々に提供される場合、[TripDescriptor](#tripdescriptor) と [VehicleDescriptor](#vehicledescriptor) の ID 値の組み合わせは、両方のフィード間で一致しなければなりません。

例えば、ある `VehiclePosition` エンティティが `vehicle_id:A` および `trip_id:4` を持つ場合、対応する `TripUpdate` エンティティも `vehicle_id:A` および `trip_id:4` を持つべきです。

| フィールド名 | 推奨事項 |
| --- | --- |
| `id` | 便の全期間にわたって車両を一意かつ安定的に識別するべきです |

### StopTimeUpdate {: #stoptimeupdate}


| フィールド名 | 推奨事項 |
| --- | --- |
| `stop_sequence` | 可能な限り `stop_sequence` を提供してください。`stop_id` は1つの便(trip)内で複数回出現する可能性がある（例: ループ路線）ため、`stop_sequence` の方が `stop_times.txt` 内の停車時刻(stop_time)に一意に対応します。 |
| `arrival` | 連続する停留所等(stop)間の到着時刻は増加していくべきです。同じであったり減少してはいけません。 | 
|         | 乗り継ぎ待ちや停車時間が想定される場合、同じ停留所等(stop)における到着 `time`（[StopTimeEvent](#stoptimeevent) で指定）は出発 `time` より前であるべきです。そうでない場合、到着 `time` は出発 `time` と同じであるべきです。 |
| `departure` | 連続する停留所等(stop)間の出発時刻は増加していくべきです。同じであったり減少してはいけません。 |
|           | 乗り継ぎ待ちや停車時間が想定されない場合、同じ停留所等(stop)における出発 `time`（[StopTimeEvent](#stoptimeevent) で指定）は到着 `time` と同じであるべきです。そうでない場合、出発 `time` は到着 `time` より後であるべきです。 |

### StopTimeEvent {: #stoptimeevent}


| フィールド名 | 推奨事項 |
| --- | --- |
| `delay` | `stop_time_update` の `arrival` または `departure` において `delay` のみが提供され（`time` が提供されない場合）、対応する停留所等(stop)について GTFS の [`stop_times.txt`](../../schedule/reference/#stop_timestxt) に `arrival_times` および/または `departure_times` が含まれていなければなりません。リアルタイムフィードにおける `delay` の値は、GTFS の `stop_times.txt` ファイルに加算する基準となる時刻が存在しない限り、意味を持ちません。 |
| `scheduled_time` | 便(trip) が新規または代替便であり、その便が時刻表に従って運行する場合（代替便の場合は修正された時刻表である可能性があります）、すべての時刻ポイントに対して `scheduled_time` を提供するべきです。複製された便の運行や停車時間が元の便と異なる場合、`scheduled_time` を使用してそれらを指定することもできます。 |

### VehiclePosition {: #vehicleposition}

以下は、利用者に高品質なデータ（例: 予測生成のため）を提供するために、VehiclePositions フィードに含めることが推奨されるフィールドです。

| フィールド名 | 備考 |
| --- | --- |
| `entity.id` | 便の全期間にわたって安定して保持するべきです |
| `vehicle.timestamp` | 車両位置が測定された時刻を提供することが強く推奨されます。そうでない場合、利用者はメッセージのタイムスタンプを使用しなければならず、最後のメッセージが個々の位置情報よりも頻繁に更新されていた場合、乗客に誤解を与える結果となる可能性があります。 |
| `vehicle.vehicle.id` | 便の全期間にわたって車両を一意かつ安定的に識別できるようにするべきです |

### 位置 {: #position}

車両位置情報(vehicle position)は、現在の便(trip)に対応する GTFS `shapes.txt` データから 200 メートル以内であるべきです。ただし、この `trip_id` に対して `DETOUR` の効果を持つ運行情報(alert)がある場合は除きます。

### Alert {: #alert}


運行情報(alert)に関する一般的なガイドライン:

* `trip_id` と `start_time` が `exact_time=1` の間隔内にある場合、`start_time` はその間隔の開始時刻から `headway_secs` の正確な倍数だけ後でなければなりません。 
* 複数日にわたって便(trip)を運休する場合、提供者は指定された `trip_ids` と `start_dates` を `CANCELED` として参照する便の更新(trip update)を提供するとともに、同じ `trip_ids` と `TimeRange` を参照する `NO_SERVICE` の運行情報(alert)を提供し、乗客に運休の理由（例: 迂回）を説明できるようにするべきです。
* ある路線全体のすべての停留所等(stop)に影響する運行情報(alert)の場合は、停留所等(stop)ベースの運行情報(alert)ではなく、路線ベースの運行情報(alert)を使用してください。その路線のすべての停留所等(stop)に個別に適用してはいけません。
* 運行情報(alert)には文字数制限はありませんが、公共交通の乗客は多くの場合モバイル端末で運行情報(alert)を閲覧します。簡潔に記載してください。

| フィールド名 | 推奨事項 |
| --- | --- |
| `description_text` | 改行を使用して運行情報(alert)を読みやすくしてください。 |

## ユースケース別の実践推奨事項 {: #practice-recommendations-organized-by-use-case}

### 頻度ベースの便(frequency-based trips) {: #frequency-based-trips}

頻度ベースの便は固定された時刻表に従うのではなく、あらかじめ決められた運行間隔を維持しようとするものです。これらの便は [GTFS frequency.txt](../../schedule/reference/#frequenciestxt) において `exact_times=0` を設定するか、`exact_times` フィールドを省略することで表されます（なお、`exact_times=1` の便は頻度ベースの便では *ありません*。`exact_times=1` の `frequencies.txt` は、単に時刻表ベースの便をよりコンパクトに格納するための便宜的な方法として使用されます）。頻度ベースの便に対して GTFS Realtime フィードを構築する際には、いくつかのベストプラクティスを考慮する必要があります。

* [TripUpdate.StopTimeUpdate](#stoptimeupdate) において、`arrival` および `departure` の [StopTimeEvent](#stoptimeevent) には `delay` を含めるべきではありません。これは、頻度ベースの便が固定された時刻表に従わないためです。その代わりに、到着/出発予測を示すために `time` を提供するべきです。

* 仕様で必須とされている通り、[TripUpdate](#tripupdate) または [VehiclePosition](#vehicleposition) において [TripDescriptor](#tripdescriptor) を使用して `trip` を記述する場合、`trip_id`、`start_time`、および `start_date` をすべて提供しなければなりません。さらに、`schedule_relationship` は `UNSCHEDULED` であるべきです。（例: 増発便など）。

## このドキュメントについて {: #about-this-document}

### 目的 {: #objectives}


GTFS Realtime ベストプラクティスを維持する目的は以下の通りです:

* 公共交通アプリにおけるエンドユーザーの利用体験を向上させること
* ソフトウェア開発者がアプリケーション、製品、サービスを展開し、スケールさせやすくすること

### 公開されている GTFS Realtime ベストプラクティスを提案または修正する方法 {: #how-to-propose-or-amend-published-gtfs-realtime-best-practices}


GTFS のアプリケーションや運用方法は進化していくため、この文書も随時修正が必要になる場合があります。この文書の修正を提案するには、[GTFS Realtime Best Practices GitHub リポジトリ](https://github.com/MobilityData/GTFS_Realtime_Best-Practices)でプルリクエストを作成し、変更を提案してください。

### 本ドキュメントへのリンク {: #linking-to-this-document}

GTFS Realtime データを正しく作成するためのガイダンスをフィード提供者に示すには、本ドキュメントにリンクしてください。各推奨事項にはアンカーリンクがあります。推奨事項をクリックすると、ページ内アンカーリンクの URL を取得できます。

もし GTFS Realtime を利用するアプリケーションが、ここで説明されていない GTFS Realtime データの運用に関する要件や推奨事項を設ける場合は、これらの共通ベストプラクティスを補足するために、その要件や推奨事項を記載したドキュメントを公開することが推奨されます。
