# GTFS Realtime リファレンス {: #gtfs-realtime-reference}

GTFS Realtime フィードを利用することで、交通事業者は利用者に対して、サービスの運行障害（駅の閉鎖、路線の運休、重大な遅延など）、車両の位置、予想到着時刻に関するリアルタイム情報を提供することができます。

このサイトでは、フィード仕様のバージョン 2.0 について説明および文書化しています。有効なバージョンは "2.0"、"1.0" です。

## 用語定義 {: #term-definitions}

### 必須 {: #required}


GTFS-realtime v2.0 以降では、*Required* 列は、事業者が提供する交通データが有効であり、利用アプリケーションにとって意味を持つために、どのフィールドを提供しなければならないかを示します。

*Required* フィールドには、以下の値が使用されます:

*   **Required**: このフィールドは GTFS-realtime フィードの事業者によって提供しなければなりません。
*   **Conditionally required**: このフィールドは、フィールド *Description* に記載された特定の条件下で必須となります。それ以外の条件では任意です。
*   **Conditionally forbidden**: このフィールドは、フィールド *Description* に記載された特定の条件下では使用してはいけません。それ以外の条件では任意です。
*   **Optional**: このフィールドは任意であり、事業者が必ず実装する必要はありません。ただし、基盤となる自動車両位置システム（例: VehiclePosition の `timestamp`）でデータが利用可能な場合、可能であれば事業者がこれらの任意フィールドを提供することが推奨されます。

*なお、意味的要件は GTFS-realtime バージョン 1.0 では定義されていなかったため、`gtfs_realtime_version` が `1` のフィードはこれらの要件を満たさない可能性があります（詳細は [意味的要件の提案](https://github.com/google/transit/pull/64) を参照してください）。*

### 多重度(cardinality) {: #cardinality}


*多重度(cardinality)* は、特定のフィールドに対して提供される要素の数を表し、以下の値があります:

* **One** - このフィールドには1つの要素のみを提供することができます。これは [Protocol Buffer の *required* および *optional* の多重度(cardinality)](https://developers.google.com/protocol-buffers/docs/proto#simple) に対応します。
* **Many** - このフィールドには複数の要素 (0、1、またはそれ以上) を提供することができます。これは [Protocol Buffer の *repeated* の多重度(cardinality)](https://developers.google.com/protocol-buffers/docs/proto#simple) に対応します。

フィールドが必須、条件付き必須、または任意であるかを確認するために、常に *Required* および *Description* フィールドを参照してください。Protocol Buffer の多重度(cardinality) については、[`gtfs-realtime.proto`](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) を参照してください。

### Protocol Buffer データ型 {: #protocol-buffer-data-types}

以下の Protocol Buffer データ型は、フィード要素を記述するために使用されます:

*   **message**: 複合型
*   **enum**: 固定値のリスト

### 実験的フィールド {: #experimental-fields}

**実験的** とラベル付けされたフィールドは、変更される可能性があり、まだ仕様に正式に採用されていません。**実験的** フィールドは将来的に正式に採用される可能性があります。

## 要素索引 {: #element-index}


*   [FeedMessage](#message-feedmessage)
    *   [FeedHeader](#message-feedheader)
        *   [Incrementality](#enum-incrementality)
    *   [FeedEntity](#message-feedentity)
        *   [TripUpdate](#message-tripupdate)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship_1)
            *   [VehicleDescriptor](#message-vehicledescriptor)
                *   [WheelchairAccessible](#enum-wheelchairaccessible)
            *   [StopTimeUpdate](#message-stoptimeupdate)
                *   [StopTimeEvent](#message-stoptimeevent)
                *   [ScheduleRelationship](#enum-schedulerelationship)
                *   [StopTimeProperties](#message-stoptimeproperties)
            *   [TripProperties](#message-tripproperties)
        *   [VehiclePosition](#message-vehicleposition)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship_1)
                *   [ModifiedTripSelector](#message-modifiedtripselector)
            *   [VehicleDescriptor](#message-vehicledescriptor)
                *   [WheelchairAccessible](#enum-wheelchairaccessible)
            *   [Position](#message-position)
            *   [VehicleStopStatus](#enum-vehiclestopstatus)
            *   [CongestionLevel](#enum-congestionlevel)
            *   [OccupancyStatus](#enum-occupancystatus)
            *   [CarriageDetails](#message-carriagedetails)
        *   [Alert](#message-alert)
            *   [TimeRange](#message-timerange)
            *   [EntitySelector](#message-entityselector)
                *   [TripDescriptor](#message-tripdescriptor)
                    *   [ScheduleRelationship](#enum-schedulerelationship_1)
            *   [Cause](#enum-cause)
            *   [Effect](#enum-effect)
            *   [TranslatedString](#message-translatedstring)
                *   [Translation](#message-translation)
            *   [SeverityLevel](#enum-severitylevel)
        *   [Shape](#message-shape)
        *   [Stop](#message-stop)
            *   [WheelchairBoarding](#enum-wheelchairboarding)
        *   [TripModifications](#message-tripmodifications)
            *   [Modification](#message-modification)
            *   [ReplacementStop](#message-replacementstop)

## 要素 {: #elements}

### _message_ FeedMessage {: #message-feedmessage}

フィードメッセージの内容です。ストリーム内の各メッセージは、適切な HTTP GET リクエストへの応答として取得されます。リアルタイムフィードは常に既存の GTFS フィードに関連付けて定義されます。すべての entity id は GTFS フィードに基づいて解決されます。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**header** | [FeedHeader](#message-feedheader) | 必須 | 1つ | このフィードおよびフィードメッセージに関するメタデータ。 |
|**entity** | [FeedEntity](#message-feedentity) | 条件付き必須 | 複数 | フィードの内容。交通システムにリアルタイム情報が利用可能な場合、このフィールドを提供しなければなりません。このフィールドが空の場合、利用者はシステムにリアルタイム情報が存在しないと想定するべきです。 |

### _message_ FeedHeader {: #message-feedheader}


フィードメッセージに含まれる、フィードに関するメタデータ。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **gtfs_realtime_version** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | フィード仕様のバージョン。現在のバージョンは 2.0 です。 |
| **incrementality** | [Incrementality](#enum-incrementality) | 必須 | 1つ |
| **timestamp** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | このタイムスタンプは、このフィードの内容が作成された時点（サーバー時間）を示します。POSIX 時間（1970年1月1日 00:00:00 UTC からの秒数）で表されます。リアルタイム情報を生成するシステムと消費するシステム間の時間のずれを避けるために、タイムサーバーからタイムスタンプを取得することが強く推奨されます。数秒程度の差は許容されるため、Stratum 3 あるいはそれ以下の階層のサーバーを使用しても問題ありません。 |
| **feed_version** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | リアルタイムデータの基となる GTFS フィードの `feed_info.feed_version` と一致する文字列。利用者はこれを用いて、現在どの GTFS フィードが有効であるか、または新しいフィードがダウンロード可能になったかを識別することができます。 |

### _enum_ Incrementality {: #enum-incrementality}

現在の取得が増分であるかどうかを決定します。

*   **FULL_DATASET**: このフィード更新は、フィードに関するすべての先行するリアルタイム情報を上書きします。したがって、この更新は既知のすべてのリアルタイム情報の完全なスナップショットを提供することが期待されます。
*   **DIFFERENTIAL**: 現在、このモードは**未対応**であり、このモードを使用するフィードの動作は**未定義**です。DIFFERENTIAL モードの動作を完全に定義することについては [GTFS Realtime メーリングリスト](http://groups.google.com/group/gtfs-realtime) で議論されており、その議論が完了次第、ドキュメントが更新されます。

**値**

| _**値**_ |
|-------------|
| **FULL_DATASET** |
| **DIFFERENTIAL** |

### _message_ FeedEntity {: #message-feedentity}

交通フィード内のエンティティの定義（または更新）。エンティティが削除されていない場合、`trip_update`、`vehicle`、`alert`、`shape`、`stop`、または `trip_modification` フィールドのうち、正確に1つが入力されていなければなりません。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | このエンティティのフィード内で一意の識別子。id はインクリメンタル更新のサポートのためにのみ使用されます。フィードによって参照される実際のエンティティは、明示的なセレクタによって指定しなければなりません（詳細は下記の EntitySelector を参照してください）。 |
| **is_deleted** | [bool](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | このエンティティが削除されるかどうか。DIFFERENTIAL のインクリメンタリティを持つフィードに対してのみ指定するべきです。FULL_DATASET のインクリメンタリティを持つフィードに対しては、このフィールドを指定してはいけません。 |
| **trip_update** | [TripUpdate](#message-tripupdate) | 条件付き必須 | 1つ | 便(trip)のリアルタイム出発遅延に関するデータ。`trip_update`、`vehicle`、`alert`、または `shape` のいずれかのフィールドは必ず指定しなければなりません。これらのフィールドをすべて空にしてはいけません。 |
| **vehicle** | [VehiclePosition](#message-vehicleposition) | 条件付き必須 | 1つ | 車両のリアルタイム位置情報(vehicle position)に関するデータ。`trip_update`、`vehicle`、`alert`、または `shape` のいずれかのフィールドは必ず指定しなければなりません。これらのフィールドをすべて空にしてはいけません。 |
| **alert** | [Alert](#message-alert) | 条件付き必須 | 1つ | リアルタイム運行情報(alert)に関するデータ。`trip_update`、`vehicle`、`alert`、または `shape` のいずれかのフィールドは必ず指定しなければなりません。これらのフィールドをすべて空にしてはいけません。 |
| **shape** | [Shape](#message-shape) | 条件付き必須 | 1つ | 迂回などによって追加されたリアルタイムのルート形状(shape)に関するデータ。`trip_update`、`vehicle`、`alert`、または `shape` のいずれかのフィールドは必ず指定しなければなりません。これらのフィールドをすべて空にしてはいけません。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **stop** | [Stop](#message-stop) | 条件付き必須 | 1つ | フィードに動的に追加された新しい停留所等(stop)。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **trip_modifications** | [TripModifications](#message-tripmodifications) | 条件付き必須 | 1つ | 迂回など、特定の変更によって影響を受ける便(trip)の一覧。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |

### _message_ TripUpdate {: #message-tripupdate}


便(trip)に沿った車両の進行状況に関するリアルタイム更新です。[便の更新(trip updates)エンティティ](../../../documentation/realtime/feed-entities/trip-updates)の一般的な説明も参照してください。

ScheduleRelationship の値に応じて、TripUpdate は以下を指定することができます:

*   スケジュールに従って運行する便。
*   ルートに沿って運行するが、固定スケジュールを持たない便。
*   スケジュールに対して追加または削除された便。
*   静的 GTFS 内の既存の便を置き換える便。
*   静的 GTFS 内の既存の便をコピーした新しい便。これは TripProperties で指定された運行日(service day)と時刻に運行されます。

更新は、将来の予測到着/出発イベント、またはすでに発生した過去のイベントに関するものです。ほとんどの場合、過去のイベントに関する情報は実測値であるため、その不確実性の値は 0 にすることが推奨されます。ただし、必ずしもそうでない場合もあるため、過去のイベントに対して不確実性の値が 0 以外であることも許容されます。更新の不確実性が 0 でない場合、その更新は未完了の便に対する概算予測であるか、測定が正確でないか、または過去に対する予測がイベント発生後に検証されていないことを意味します。

1つのブロック内で車両が複数の便を運行している場合（便とブロックの詳細については [GTFS trips.txt](../../schedule/reference/#tripstxt) を参照してください）:

* フィードには、車両が現在運行している便に対する TripUpdate を含めるべきです。プロデューサーは、将来の便に対する予測の品質に自信がある場合、この車両のブロック内で現在の便の後に続く1つ以上の便に対する TripUpdate を含めることが推奨されます。同一車両に対して複数の TripUpdate を含めることで、便が切り替わる際に予測が「突然現れる」ことを避け、また後続の便に影響する遅延（例: 既知の遅延が便間の計画された待機時間を超える場合）を乗客に事前に知らせることができます。
* 各 TripUpdate エンティティは、ブロック内でスケジュールされた順序と同じ順序でフィードに追加する必要はありません。例えば、`trip_ids` が 1, 2, 3 の便が1つのブロックに属し、車両が便1、便2、便3の順に運行する場合、`trip_update` エンティティは任意の順序で現れることができます。例えば、便2、便1、便3 の順に追加することも可能です。

更新はすでに完了した便を記述することもできます。この場合、便の最後の停留所(stop)に対する更新を提供するだけで十分です。最後の停留所への到着時刻が過去であれば、クライアントは便全体が過去のものであると判断します（前の停留所に対する更新を提供することも可能ですが、意味はありません）。このオプションは、便が予定より早く完了したが、スケジュール上はまだ運行中とされている場合に最も関連性があります。この便に対する更新を削除すると、クライアントは便がまだ運行中であると誤解する可能性があります。フィードプロバイダーは過去の更新を削除することが許可されていますが、必須ではありません。これは実用的に有用な場合の1つです。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **trip** | [TripDescriptor](#message-tripdescriptor) | 必須 | 1つ | このメッセージが適用される便(trip)。各実際の便インスタンスに対して TripUpdate エンティティは最大1つしか存在できません。存在しない場合、それは予測情報が利用できないことを意味します。便がスケジュール通りに進行していることを意味するわけではありません。 |
| **vehicle** | [VehicleDescriptor](#message-vehicledescriptor) | 任意 | 1つ | この便を運行している車両に関する追加情報。 |
| **stop_time_update** | [StopTimeUpdate](#message-stoptimeupdate) | 条件付き必須 | 複数 | 便の停車時刻(stop_time)に対する更新（将来の予測、または一部の過去の実際のもの）。更新は stop_sequence に従って並べ替えられ、次に指定された stop_time_update までのすべての停留所(stop)に適用されます。<br>trip.schedule_relationship が SCHEDULED または UNSCHEDULED の場合、少なくとも1つの stop_time_update を便に対して提供しなければなりません。<br>trip.schedule_relationship が NEW または REPLACEMENT の場合、新規または置換便のすべての停留所(stop)に対して stop_time_update を提供しなければなりません（過去の時刻を含む）。この場合、静的 GTFS の停車時刻は使用されません。<br>便がキャンセルまたは削除された場合、stop_time_update を提供する必要はありません。キャンセルまたは削除された便に stop_time_update が提供された場合、trip.schedule_relationship が stop_time_update およびその関連する schedule_relationship より優先されます。便が複製された場合、新しい便に対するリアルタイム情報を示すために stop_time_update を提供することができます。 |
| **timestamp** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 将来の停車時刻(stop_time)を推定するために車両のリアルタイム進行状況が最後に測定された時刻。過去の停車時刻が提供される場合、到着/出発時刻はこの値よりも前になることがあります。POSIX 時間（1970年1月1日 00:00:00 UTC からの秒数）。 |
| **delay** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 便の現在のスケジュール遅延。遅延は、GTFS 内の既存のスケジュールに対して予測が与えられる場合にのみ指定するべきです。<br>遅延（秒単位）は正（車両が遅れていることを意味する）または負（車両が予定より早いことを意味する）であり得ます。遅延が 0 の場合、車両は正確に定刻通りです。<br>StopTimeUpdate 内の遅延情報は便レベルの遅延情報より優先され、便レベルの遅延は StopTimeUpdate 内で遅延値が指定された次の停留所(stop)までのみ伝播されます。<br>フィードプロバイダーは、遅延値が最後に更新された時刻を示す TripUpdate.timestamp 値を提供することが強く推奨されます。これによりデータの鮮度を評価できます。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **trip_properties** | [TripProperties](#message-tripproperties) | 任意 | 1つ | 便に対する更新されたプロパティを提供します。<br><br>**注意:** このメッセージはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |

### _message_ StopTimeEvent {: #message-stoptimeevent}


1つの予測イベント（到着または出発）のタイミング情報です。タイミングは、遅延および/または推定時刻、不確実性で構成されます。NEW、REPLACEMENT、または DUPLICATED の便(trip)には、予定時刻を追加することもできます。

*   delay は、GTFS 内の既存の時刻表に対して相対的に予測が与えられる場合に使用するべきです。
*   time は、予測された時刻表があるかどうかに関わらず指定するべきであり、新規または置換の便(trip)には必ず指定しなければなりません。time と delay の両方が指定された場合、time が優先されます（ただし通常、便(trip)が予定されている場合、time は GTFS の予定時刻 + delay と等しくなるべきです）。
*   scheduled time は、便(trip)が新規、置換、または複製の場合に指定することができます。

不確実性は time と delay の両方に等しく適用されます。不確実性は、真の遅延における予想誤差を大まかに示します（ただし、その正確な統計的意味はまだ定義されていません）。例えば、コンピュータ制御で運行される列車では、不確実性が 0 になることもあります。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **delay** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 遅延（秒単位）。正の値は車両が遅れていることを意味し、負の値は車両が予定より早いことを意味します。0 の場合、車両は正確に定刻通りです。<br>StopTimeUpdate.schedule_relationship が NO_DATA の場合は **禁止**。<br>それ以外では time が指定されていない場合に **必須**。 |
| **time** | [int64](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 推定または実際のイベントの絶対時刻。POSIX 時刻（1970年1月1日 00:00:00 UTC からの秒数）。<br>StopTimeUpdate.schedule_relationship が NO_DATA の場合は **禁止**。<br>それ以外では delay が指定されていない場合に **必須**。 |
| **scheduled_time** | [int64](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き禁止 | 1つ | 予定時刻。POSIX 時刻（1970年1月1日 00:00:00 UTC からの秒数）。<br>TripUpdate.schedule_relationship が NEW、REPLACEMENT、または DUPLICATED の場合は **任意**、それ以外では **禁止**。 |
| **uncertainty** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 不確実性が省略された場合、不明と解釈されます。完全に確実な予測を指定するには、不確実性を 0 に設定します。<br>StopTimeUpdate.schedule_relationship が NO_DATA の場合は **禁止**。 |

### _message_ StopTimeUpdate {: #message-stoptimeupdate}


便(trip)における特定の停留所等(stop)の到着および/または出発イベントに関するリアルタイム更新です。stop_time の更新に関する一般的な議論については、[TripDescriptor](#message-tripdescriptor) および [trip updates entities](../../../documentation/realtime/feed-entities/trip-updates) のドキュメントも参照してください。

更新は過去および将来のイベントの両方に対して提供することができます。プロデューサーは、`TripUpdate.schedule_relationship` が NEW または REPLACEMENT でない限り、過去のイベントを削除することが許可されています（必須ではありません）。NEW または REPLACEMENT の場合、過去の停留所等(stop)は便(trip)が終了するまで、その便(trip)を定義するため削除してはいけません。  
更新は stop_sequence または stop_id を通じて特定の停留所等(stop)にリンクされるため、これらのフィールドのいずれかを必ず設定しなければなりません。1つの便(trip)の中で同じ stop_id が複数回訪問される場合、その便(trip)におけるその stop_id のすべての StopTimeUpdate に stop_sequence を提供するべきです。

新規または置換便(trip)では、GTFS Static 内の既存の便(trip)を参照せずに、その便(trip)が訪問する停留所等(stop)を指定するために更新が使用されます。このような便(trip)では、`stop_id`、`stop_sequence`、`departure`、`arrival` をすべて設定しなければなりません。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **stop_sequence** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 対応する GTFS フィードの stop_times.txt と同じでなければなりません。StopTimeUpdate 内では stop_sequence または stop_id のいずれかを提供しなければならず、両方を空にしてはいけません。同じ stop_id を複数回訪問する便(trip)（例: ループ）の場合、予測対象の停留所等(stop)を区別するために stop_sequence が必須です。`StopTimeProperties.assigned_stop_id` が設定されている場合、`stop_sequence` も設定しなければなりません。`TripUpdate.schedule_relationship` が NEW または REPLACEMENT の場合は **必須** であり、便(trip)に沿って値が増加していかなければなりません。 |
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 対応する GTFS フィードの stops.txt と同じでなければなりません。StopTimeUpdate 内では stop_sequence または stop_id のいずれかを提供しなければならず、両方を空にしてはいけません。`StopTimeProperties.assigned_stop_id` が設定されている場合、`stop_id` を省略し、`stop_sequence` のみを使用することが推奨されます。`StopTimeProperties.assigned_stop_id` と `stop_id` の両方が設定されている場合、`stop_id` は `assigned_stop_id` と一致しなければなりません。`TripUpdate.schedule_relationship` が NEW または REPLACEMENT の場合は **必須** です。 |
| **arrival** | [StopTimeEvent](#message-stoptimeevent) | 条件付き必須 | 1つ | schedule_relationship が空または SCHEDULED の場合、StopTimeUpdate 内で arrival または departure のいずれかを提供しなければならず、両方を空にしてはいけません。schedule_relationship が SKIPPED の場合、arrival と departure の両方を空にすることができます。`TripUpdate.schedule_relationship` が NEW または REPLACEMENT の場合は **必須** です。 |
| **departure** | [StopTimeEvent](#message-stoptimeevent) | 条件付き必須 | 1つ | schedule_relationship が空または SCHEDULED の場合、StopTimeUpdate 内で arrival または departure のいずれかを提供しなければならず、両方を空にしてはいけません。schedule_relationship が SKIPPED の場合、arrival と departure の両方を空にすることができます。`TripUpdate.schedule_relationship` が NEW または REPLACEMENT の場合は **必須** です。 |
| **departure_occupancy_status** | [OccupancyStatus](#enum-occupancystatus) | 任意 | 1つ | 指定された停留所等(stop)を出発した直後の車両の予測乗車率状態です。提供する場合、stop_sequence も提供しなければなりません。リアルタイムの到着または出発予測を提供せずに departure_occupancy_status のみを提供するには、このフィールドを設定し、StopTimeUpdate.schedule_relationship = NO_DATA を設定してください。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式採用される可能性があります。 |
| **schedule_relationship** | [ScheduleRelationship](#enum-schedulerelationship) | 任意 | 1つ | デフォルトの関係は SCHEDULED です。 |
| **stop_time_properties** | [StopTimeProperties](#message-stoptimeproperties) | 任意 | 1つ | GTFS stop_times.txt 内で定義された特定のプロパティに関するリアルタイム更新です。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式採用される可能性があります。 |

### _enum_ ScheduleRelationship {: #enum-schedulerelationship}

この停車時刻(stop_time)と静的な時刻表との関係。

**値**

| _**値**_ | _**説明**_ |
|-------------|---------------|
| **SCHEDULED** | 車両は静的な停留所等(stop)の時刻表に従って運行していますが、必ずしも時刻表の時刻通りではありません。これは **デフォルト** の動作です。到着または出発の少なくとも一方を指定しなければなりません。頻度ベースの便(trip)（GTFS frequencies.txt において exact_times = 0 の場合）は SCHEDULED 値を持つべきではなく、代わりに UNSCHEDULED を使用するべきです。 |
| **SKIPPED** | 停留所等(stop)がスキップされ、車両はこの停留所等(stop)に停車しません。到着と出発は任意です。`SKIPPED` が設定されても、同じ便(trip)内の後続の停留所等(stop)には伝播されません（つまり、その停留所等(stop)にも `stop_time_update` で `schedule_relationship: SKIPPED` が設定されていない限り、車両は後続の停留所等(stop)に停車します）。便(trip)内の前の停留所等(stop)からの遅延は `SKIPPED` 停留所等(stop)を通過して伝播します。言い換えると、`SKIPPED` 停留所等(stop)の後の停留所等(stop)に `arrival` または `departure` の予測が設定されていない場合、`SKIPPED` 停留所等(stop)より前の予測が、その後の停留所等(stop)および便(trip)内の後続の停留所等(stop)に伝播し、後続の停留所等(stop)に対して `stop_time_update` が提供されるまで続きます。 |
| **NO_DATA** | この停留所等(stop)に関するリアルタイムデータは提供されません。これはリアルタイムの時刻情報が利用できないことを示します。NO_DATA が設定されると、後続の停留所等(stop)にも伝播するため、どの停留所等(stop)からリアルタイムの時刻情報がないかを指定する推奨の方法です。NO_DATA が設定されている場合、`TripDescriptor.schedule_relationship` が `NEW` または `REPLACEMENT` でない限り、到着や出発を指定してはいけません。その場合は予測ではなく、時刻表上の時刻のみを指定しなければなりません。`TripDescriptor.schedule_relationship` が `NEW` または `REPLACEMENT` の場合、StopTimeUpdate が便(trip)の停留所等(stop)リストを定義するため、到着と出発は依然として時刻表上の時刻で指定しなければなりません。この場合、時刻表は静的な GTFS とは無関係ですが、リアルタイム予測はまだ利用できないことを示します。 |
| **UNSCHEDULED** | 車両は頻度ベースの便(trip)（GTFS frequencies.txt において exact_times = 0 の場合）を運行しています。この値は、GTFS frequencies.txt に定義されていない便(trip)や、GTFS frequencies.txt において exact_times = 1 の便(trip)には使用するべきではありません。`stop_time_updates` に `schedule_relationship: UNSCHEDULED` を含む便(trip)は、TripDescriptor にも `schedule_relationship: UNSCHEDULED` を設定しなければなりません。<br><br>**注意:** このフィールドは依然として **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |

### _message_ StopTimeProperties {: #message-stoptimeproperties}


GTFS `stop_times.txt` 内で定義されている特定のプロパティに関するリアルタイム更新。

**注意:** このメッセージはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。<br> 

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **assigned_stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | リアルタイムの停留所等(stop)の割り当てをサポートします。GTFS `stops.txt` で定義された `stop_id` を参照します。<br> 新しい `assigned_stop_id` は、GTFS `stop_times.txt` で定義された `stop_id` と比較して、利用者にとって大きく異なる便(trip)体験をもたらしてはいけません。言い換えると、アプリ内で追加の文脈なしに新しい `stop_id` が提示された場合でも、利用者がそれを「異常な変更」と見なすべきではありません。例えば、このフィールドは、GTFS `stop_times.txt` で元々定義されている停留所等(stop)と同じ駅に属する `stop_id` を使用して、プラットフォームの割り当てを行うために使用されることを意図しています。<br> 到着や出発のリアルタイム予測を提供せずに停留所等(stop)を割り当てるには、このフィールドを設定し、`StopTimeUpdate.schedule_relationship = NO_DATA` を設定してください。<br> このフィールドが設定されている場合、`StopTimeUpdate.stop_sequence` は設定しなければならず、`StopTimeUpdate.stop_id` は設定するべきではありません。停留所等(stop)の割り当ては、他の GTFS-realtime フィールド（例: `VehiclePosition.stop_id`）にも反映されるべきです。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **stop_headsign** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 停留所等(stop)における車両の更新された行先表示(headsign)。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **drop_off_type** | [DropOffPickupType](#enum-dropoffpickuptype) | 任意 | 1つ | 停留所等(stop)における車両の更新された降車設定。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **pickup_type** | [DropOffPickupType](#enum-dropoffpickuptype) | 任意 | 1つ | 停留所等(stop)における車両の更新された乗車設定。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |

## _enum_ DropOffPickupType {: #enum-dropoffpickuptype}


**値**

| _**値**_                   | _**コメント**_                                   |
|----------------------------|--------------------------------------------------|
| **REGULAR**                | 定期的に予定された乗車/降車。                     |
| **NONE**                   | 乗車/降車は利用できません。                       |
| **PHONE_AGENCY**           | 乗車/降車を手配するには事業者に電話しなければなりません。 |
| **COORDINATE_WITH_DRIVER** | 乗車/降車を手配するには運転手と調整しなければなりません。 |

### _message_ TripProperties {: #message-tripproperties}


便(trip)の更新されたプロパティを定義します。

**注意:** このメッセージはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。<br>.

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **trip_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | (CSV) GTFS trips.txt で定義された既存の便(trip)を複製した新しい便の識別子を定義しますが、異なる運行日(service day)および/または時刻（`TripProperties.start_date` および `TripProperties.start_time` を使用して定義）で開始します。(CSV) GTFS における `trips.trip_id` の定義を参照してください。その値は (CSV) GTFS で使用されているものとは異ならなければなりません。このフィールドは `schedule_relationship` が `DUPLICATED` の場合に必須であり、それ以外の場合は入力してはいけません。入力された場合、利用者によって無視されます。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **start_date** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 複製された便が運行される運行日(service day)。YYYYMMDD 形式で指定しなければなりません。このフィールドは `schedule_relationship` が `DUPLICATED` の場合に必須であり、それ以外の場合は入力してはいけません。入力された場合、利用者によって無視されます。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **start_time** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 複製された便の出発開始時刻を定義します。(CSV) GTFS における `stop_times.departure_time` の定義を参照してください。複製された便の予定到着時刻および出発時刻は、元の便の `departure_time` とこのフィールドの差分に基づいて計算されます。例えば、GTFS の便が停留所等(stop) A に `departure_time` = `10:00:00`、停留所等(stop) B に `departure_time` = `10:01:00` を持ち、このフィールドに `10:30:00` が設定された場合、複製された便の停留所等(stop) B の予定 `departure_time` は `10:31:00` になります。リアルタイム予測の `delay` 値は、この計算された予定時刻に適用され、予測時刻が決定されます。例えば、停留所等(stop) B に `delay` = `30` が与えられた場合、予測出発時刻は `10:31:30` になります。リアルタイム予測の `time` 値にはオフセットは適用されず、与えられた予測時刻をそのまま示します。例えば、停留所等(stop) B に `10:31:30` を表す `time` が与えられた場合、予測出発時刻は `10:31:30` になります。このフィールドは `schedule_relationship` が `DUPLICATED` の場合に必須であり、それ以外の場合は入力してはいけません。入力された場合、利用者によって無視されます。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **trip_headsign** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 元の便と異なる場合、この便の行先表示(headsign)を指定します。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **trip_short_name** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 元の便と異なる場合、この便の名称を指定します。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **shape_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 便のルート形状(shape)が (CSV) GTFS で指定されたものと異なる場合、または (CSV) GTFS で提供されていない場合にリアルタイムで指定するために、車両の走行経路の形状識別子を指定します。例えば、乗客の需要に応じて異なる経路を取る車両などです。(CSV) GTFS における `trips.shape_id` の定義を参照してください。<br>(CSV) GTFS にもリアルタイムにも shape が定義されていない場合、その shape は不明と見なされます。このフィールドは (CSV) GTFS の shapes.txt に定義された shape、または同じ (protobuf) リアルタイムフィード内の `Shape` を参照することができます。この便の停留所等(stop)の順序（停留所順序）は (CSV) GTFS と同じでなければなりません。同じリアルタイムフィード内の `Shape` エンティティを参照する場合、このフィールドの値はエンティティ内の `shape_id` であり、`FeedEntity` の `id` では**ありません**。<br>迂回が発生した場合など、元の便の一部の停留所等(stop)が通過されなくなる場合、それらは schedule_relationship=SKIPPED としてマークするか、より詳細な情報を `TripModifications` メッセージを通じて提供するべきです。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |

### _message_ VehiclePosition {: #message-vehicleposition}


特定の車両に関するリアルタイムの位置情報。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **trip** | [TripDescriptor](#message-tripdescriptor) | 任意 | 1つ | この車両が運行している便(trip)。車両が特定の便インスタンスと識別できない場合は、空または部分的であることがあります。 |
| **vehicle** | [VehicleDescriptor](#message-vehicledescriptor) | 任意 | 1つ | この便を運行している車両に関する追加情報。各エントリには **一意の** 車両IDを持たせるべきです。 |
| **position** | [Position](#message-position) | 任意 | 1つ | この車両の現在位置。 |
| **current_stop_sequence** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 現在の停留所等(stop)の停車順序インデックス。current_stop_sequence の意味（すなわち、どの停留所等(stop)を指すか）は current_status によって決まります。current_status が欠落している場合は IN_TRANSIT_TO が仮定されます。 |
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 現在の停留所等(stop)を識別します。この値は、対応する GTFS フィードの stops.txt にあるものと同じでなければなりません。`StopTimeProperties.assigned_stop_id` を使用して `stop_id` を割り当てる場合、このフィールドも `stop_id` の変更を反映するべきです。 |
| **current_status** | [VehicleStopStatus](#enum-vehiclestopstatus) | 任意 | 1つ | 現在の停留所等(stop)に関する車両の正確な状態。current_stop_sequence が欠落している場合は無視されます。 |
| **timestamp** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 車両の位置が計測された時刻。POSIX 時間（1970年1月1日 00:00:00 UTC からの秒数）。 |
| **congestion_level** | [CongestionLevel](#enum-congestionlevel) | 任意 | 1つ |
| **occupancy_status** | [OccupancyStatus](#enum-occupancystatus) | 任意 | 1つ | 車両または車両の各車両単位における乗客の混雑状況。multi_carriage_details に車両ごとの OccupancyStatus が設定されている場合、このフィールドは乗客を受け入れるすべての車両を考慮した車両全体の状態を表すべきです。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **occupancy_percentage** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 車両内の乗客混雑度を示すパーセンテージ値。100 は、座席と立席の両方を含む車両の設計上の最大収容人数を表し、かつ現行の運行規制で許容されている最大値を意味します。設計上の最大収容人数を超える乗客がいる場合、値は 100 を超えることがあります。occupancy_percentage の精度は、個々の乗客の乗降が追跡できない程度に低くするべきです。multi_carriage_details に車両ごとの occupancy_percentage が設定されている場合、このフィールドは乗客を受け入れるすべての車両を考慮した車両全体の状態を表すべきです。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **multi_carriage_details** | [CarriageDetails](#message-carriagedetails) | 任意 | 複数 | この車両の複数の車両単位に関する詳細。最初の出現は、**現在の進行方向に基づいて** 車両の先頭車両を表します。multi_carriage_details フィールドの出現回数は、その車両の車両数を表します。エンジンや保守用車両など、乗車できない車両も含まれます。これらは乗客に対してプラットフォーム上での立ち位置に関する有益な情報を提供するためです。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |

### _enum_ VehicleStopStatus {: #enum-vehiclestopstatus}


**値**

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| **INCOMING_AT** | 車両が停留所等(stop)に到着しようとしているところです（停留所等(stop)の表示では、車両のシンボルが点滅するのが一般的です）。 |
| **STOPPED_AT** | 車両が停留所等(stop)に停車しています。 |
| **IN_TRANSIT_TO** | 車両が前の停留所等(stop)を出発し、走行中です。 |

### _enum_ CongestionLevel {: #enum-congestionlevel}


この車両に影響を与えている混雑レベル。

**値**

| _**値**_ |
|-------------|
| **UNKNOWN_CONGESTION_LEVEL** |
| **RUNNING_SMOOTHLY** |
| **STOP_AND_GO** |
| **CONGESTION** |
| **SEVERE_CONGESTION** |

### _enum_ OccupancyStatus {: #enum-occupancystatus}


車両または車両の客室における乗客の混雑状況を示します。

個々の提供者がすべての OccupancyStatus 値を公開するとは限りません。したがって、利用者は OccupancyStatus 値が線形スケールに従うと仮定してはいけません。利用者は、提供者が示し意図した状態として OccupancyStatus 値を表現するべきです。同様に、提供者は実際の車両の混雑状況に対応する OccupancyStatus 値を使用しなければなりません。

乗客の混雑度を線形スケールで表現する場合は、`occupancy_percentage` を参照してください。

**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。

***値***

| _**値**_ | _**説明**_ |
|-------------|---------------|
| _**EMPTY**_ | _ほとんどの基準で車両は空と見なされ、乗客はほとんどいないか全くいないが、引き続き乗客を受け入れている状態。_ |
| _**MANY_SEATS_AVAILABLE**_ | _車両または客室に多数の空席がある状態。全座席に対する空席数がこのカテゴリに該当するかどうかは、提供者の裁量によって決定される。_ |
| _**FEW_SEATS_AVAILABLE**_ | _車両または客室に少数の空席がある状態。全座席に対する空席数がこのカテゴリに該当するかどうかは、提供者の裁量によって決定される。_ |
| _**STANDING_ROOM_ONLY**_ | _車両または客室が現在、立ち乗りの乗客のみを収容できる状態。_ |
| _**CRUSHED_STANDING_ROOM_ONLY**_ | _車両または客室が現在、立ち乗りの乗客のみを収容でき、かつそのスペースも限られている状態。_ |
| _**FULL**_ | _ほとんどの基準で車両は満員と見なされるが、まだ乗客の乗車を許可している可能性がある状態。_ |
| _**NOT_ACCEPTING_PASSENGERS**_ | _車両または客室が乗客を受け入れていない状態。通常は乗客の乗車を受け入れる車両または客室である。_ |
| _**NO_DATA_AVAILABLE**_ | _その時点で車両または客室に混雑データが存在しない状態。_ |
| _**NOT_BOARDABLE**_ | _車両または客室が乗車不可能で、乗客を受け入れることがない状態。特殊な車両や客室（機関車、保守用車両など）に有用。_ |

### _message_ CarriageDetails {: #message-carriagedetails}

複数の車両で構成される車両に使用される、車両ごとの詳細情報。

**注意:** このメッセージはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 車両の識別子。車両ごとに一意であるべきです。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **label** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 乗客が車両を識別するのに役立つ、利用者に表示されるラベル。例: "7712", "Car ABC-32" など。<br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **occupancy_status** | [OccupancyStatus](#enum-occupancystatus) | 任意 | 1つ | この車両における占有状況。デフォルトは `NO_DATA_AVAILABLE` に設定されています。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。|
| **occupancy_percentage** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | この車両における占有率。 "VehiclePosition.occupancy_percentage" と同じルールに従います。この車両に関するデータが利用できない場合は -1 を使用してください。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **carriage_sequence** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | 車両の CarriageStatus リストにおける、この車両の順序を識別します。進行方向の最初の車両は値 1 を持たなければなりません。2番目の車両は進行方向の2番目に対応し、値 2 を持たなければなりません。以下同様です。例えば、進行方向の最初の車両は値 1 を持ちます。進行方向の2番目の車両が値 3 を持つ場合、利用者はすべての車両のデータ（すなわち multi_carriage_details フィールド）を破棄します。データがない車両も、有効な carriage_sequence 番号で表現されなければならず、データがないフィールドは省略するべきです（または、それらのフィールドを含めて "no data" の値に設定することもできます）。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |

### _message_ Alert {: #message-alert}

公共交通ネットワークにおける何らかの事象を示す運行情報(alert)です。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **active_period** | [TimeRange](#message-timerange) | 任意 | 複数 | 運行情報(alert)を利用者に表示する時間です。欠落している場合、運行情報(alert)はフィードに含まれている限り表示されます。複数の範囲が指定された場合、すべての範囲で表示されます。 |
| **informed_entity** | [EntitySelector](#message-entityselector) | 必須 | 複数 | この運行情報(alert)を通知すべき対象のエンティティです。少なくとも1つの informed_entity を指定しなければなりません。 |
| **cause** | [Cause](#enum-cause) | 条件付き必須 | 1つ | cause_detail が含まれる場合、Cause も含めなければなりません。 |
| **cause_detail** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | 運行情報(alert)の原因を説明する事業者固有の言語を許容する詳細な説明です。Cause よりも具体的です。cause_detail が含まれる場合、Cause も含めなければなりません。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式採用される可能性があります。 |
| **effect** | [Effect](#enum-effect) | 条件付き必須 | 1つ | effect_detail が含まれる場合、Effect も含めなければなりません。 |
| **effect_detail** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | 運行情報(alert)の影響を説明する事業者固有の言語を許容する詳細な説明です。Effect よりも具体的です。effect_detail が含まれる場合、Effect も含めなければなりません。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式採用される可能性があります。 |
| **url** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | 運行情報(alert)に関する追加情報を提供する URL です。 |
| **header_text** | [TranslatedString](#message-translatedstring) | 必須 | 1つ | 運行情報(alert)の見出しです。このプレーンテキスト文字列は、太字などで強調表示されます。 |
| **description_text** | [TranslatedString](#message-translatedstring) | 必須 | 1つ | 運行情報(alert)の説明です。このプレーンテキスト文字列は本文として表示されるか、利用者の明示的な「展開」要求に応じて表示されます。description 内の情報は header の情報を補足するべきです。 |
| **tts_header_text** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | 読み上げ用フィールド(text-to-speech field)として利用される運行情報(alert)の見出しを含むテキストです。このフィールドは header_text の読み上げ用バージョンです。header_text と同じ情報を含むべきですが、読み上げに適した形式（例: 略語を削除、数字を文字で表記など）にする必要があります。 |
| **tts_description_text** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | 読み上げ用フィールド(text-to-speech field)として利用される運行情報(alert)の説明を含むテキストです。このフィールドは description_text の読み上げ用バージョンです。description_text と同じ情報を含むべきですが、読み上げに適した形式（例: 略語を削除、数字を文字で表記など）にする必要があります。 |
| **severity_level** | [SeverityLevel](#enum-severitylevel) | 任意 | 1つ | 運行情報(alert)の深刻度です。 |
| **image** | [TranslatedImage](#message-translatedimage) | 任意 | 1つ | 運行情報(alert)テキストと共に表示される TranslatedImage です。迂回や駅の閉鎖など、運行情報(alert)の影響を視覚的に説明するために使用されます。画像は運行情報(alert)の理解を補助するべきであり、必須情報の唯一の場所であってはなりません。以下の種類の画像は推奨されません: 主にテキストを含む画像、追加情報を提供しないマーケティングやブランド画像。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式採用される可能性があります。 |
| **image_alternative_text** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | `image` フィールドにリンクされた画像の外観を説明するテキストです（例: 画像が表示できない場合や、アクセシビリティの理由で利用者が画像を見られない場合）。HTML の [alt image text の仕様](https://html.spec.whatwg.org/#alt) を参照してください。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式採用される可能性があります。 |

### _enum_ Cause {: #enum-cause}


この運行情報(alert)の原因。

**値**

| _**値**_ |
|-------------|
| **UNKNOWN_CAUSE** |
| **OTHER_CAUSE** |
| **TECHNICAL_PROBLEM** |
| **STRIKE** |
| **DEMONSTRATION** |
| **ACCIDENT** |
| **HOLIDAY** |
| **WEATHER** |
| **MAINTENANCE** |
| **CONSTRUCTION** |
| **POLICE_ACTIVITY** |
| **MEDICAL_EMERGENCY** |

### _enum_ Effect {: #enum-effect}


影響を受ける対象に対するこの問題の影響。

**値**

| _**値**_ |
|-------------|
| **NO_SERVICE** |
| **REDUCED_SERVICE** |
| **SIGNIFICANT_DELAYS** |
| **DETOUR** |
| **ADDITIONAL_SERVICE** |
| **MODIFIED_SERVICE** |
| **OTHER_EFFECT** |
| **UNKNOWN_EFFECT** |
| **STOP_MOVED** |
| **NO_EFFECT** |
| **ACCESSIBILITY_ISSUE** |

### _enum_ SeverityLevel {: #enum-severitylevel}


運行情報(alert)の深刻度。

**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。

**値**

| _**値**_ |
|-------------|
| **UNKNOWN_SEVERITY** |
| **INFO** |
| **WARNING** |
| **SEVERE** |

### _message_ TimeRange {: #message-timerange}

時間間隔。時刻 `t` が開始時刻以上かつ終了時刻未満である場合、その間隔は有効とみなされます。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **start** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 開始時刻。POSIX 時間（1970年1月1日 00:00:00 UTC からの経過秒数）で表されます。省略された場合、間隔はマイナス無限大から始まります。TimeRange が指定される場合、start または end のいずれかは指定しなければなりません。両方のフィールドを空にすることはできません。 |
| **end** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 終了時刻。POSIX 時間（1970年1月1日 00:00:00 UTC からの経過秒数）で表されます。省略された場合、間隔はプラス無限大で終了します。TimeRange が指定される場合、start または end のいずれかは指定しなければなりません。両方のフィールドを空にすることはできません。 |

### _message_ Position {: #message-position}

車両の地理的位置。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **latitude** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | WGS-84 座標系における北緯（度）。 |
| **longitude** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | WGS-84 座標系における東経（度）。 |
| **bearing** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 真北から時計回りの方位（度）。0 は北、90 は東を表します。これはコンパスの方位、または次の停留所等(stop)や中間地点への方向を表すことができます。これは、クライアントが過去のデータから計算できる過去の位置の並びから推定してはいけません。 |
| **odometer** | [double](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 走行距離計の値（メートル単位）。 |
| **speed** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 車両が測定した瞬間速度（メートル毎秒）。 |

### _message_ TripDescriptor {: #message-tripdescriptor}

`TripDescriptor` は、GTFS の便(trip)の単一インスタンスを識別する記述子です。ただし、`schedule_relationship` が `NEW` の場合は、新しい便インスタンスを追加することを指定します。

単一の便インスタンスを指定するには、多くの場合 `trip_id` だけで十分です。しかし、以下の場合には単一の便インスタンスを特定するために追加情報が必要です。

* frequencies.txt で定義された便については、`trip_id` に加えて `start_date` と `start_time` が必須です  
* 便が 24 時間以上にわたる場合、または遅延によって翌日の予定便と重複する場合、`trip_id` に加えて `start_date` が必須です  
* `trip_id` フィールドを提供できない場合、`route_id`、`direction_id`、`start_date`、`start_time` をすべて提供しなければなりません  

すべての場合において、`trip_id` に加えて `route_id` が提供される場合、その `route_id` は GTFS trips.txt で当該便に割り当てられたものと同一でなければなりません。

`trip_id` フィールドは、それ単独でも、他の TripDescriptor フィールドと組み合わせても、複数の便インスタンスを識別するために使用してはいけません。例えば、TripDescriptor は GTFS frequencies.txt の exact_times=0 の便に対して `trip_id` のみを指定してはいけません。なぜなら、特定の時刻に開始する単一の便インスタンスを特定するためには `start_time` も必須だからです。TripDescriptor が単一の便インスタンスに解決されない場合（すなわち、0 または複数の便インスタンスに解決される場合）、それはエラーと見なされ、その誤った TripDescriptor を含むエンティティは利用者によって破棄される可能性があります。

なお、`trip_id` が不明な場合、便の更新(trip update) における停留所順序 ID だけでは不十分であり、`stop_id` も提供しなければなりません。さらに、絶対的な到着・出発時刻も提供する必要があります。

TripDescriptor.route_id は、運行情報(alert) の EntitySelector 内で、ルート全体に影響するアラートを指定するために使用してはいけません。その場合は EntitySelector.route_id を使用してください。

`schedule_relationship` が `NEW` の場合、`trip_id` は GTFS フィードに存在しない値を設定しなければならず、`route_id` は GTFS 静的データの routes.txt に存在する値を設定して、その便をルートに関連付けなければなりません。`start_date` を設定するべきであり、新しい便に対しては `direction_id` を設定することもできます。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **trip_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | このセレクタが参照する GTFS フィードの trip_id。非頻度ベースの便（GTFS frequencies.txt に定義されていない便）の場合、このフィールドだけで便を一意に識別できます。frequencies.txt に定義された頻度ベースの便の場合、trip_id、start_time、start_date がすべて必須です。スケジュールベースの便（frequencies.txt に定義されていない便）の場合、便が route_id、direction_id、start_time、start_date の組み合わせで一意に識別でき、かつそれらすべてのフィールドが提供される場合に限り、trip_id を省略できます。schedule_relationship が NEW の場合、GTFS 静的データに存在しない一意の値を指定しなければなりません。schedule_relationship が REPLACEMENT の場合、trip_id は静的 GTFS から置き換える便を識別します。schedule_relationship が DUPLICATED で TripUpdate 内にある場合、trip_id は静的 GTFS から複製される便を識別します。schedule_relationship が DUPLICATED で VehiclePosition 内にある場合、trip_id は新しい複製便を識別し、対応する TripUpdate.TripProperties.trip_id の値を含まなければなりません。 |
| **route_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | このセレクタが参照する GTFS の route_id。trip_id が省略される場合、route_id、direction_id、start_time、schedule_relationship=SCHEDULED をすべて設定して便インスタンスを識別しなければなりません。TripDescriptor.route_id は、運行情報(alert) の EntitySelector 内でルート全体に影響するアラートを指定するために使用してはいけません。その場合は EntitySelector.route_id を使用してください。schedule_relationship が NEW の場合、新しい便が属するルートの route_id を指定しなければなりません。 |
| **direction_id** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | GTFS trips.txt ファイルの direction_id。このセレクタが参照する便の進行方向を示します。trip_id が省略される場合、direction_id を提供しなければなりません。<br><br>**注意:** このフィールドは **実験的** であり、変更される可能性があります。将来的に正式採用される可能性があります。<br>|
| **start_time** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | この便インスタンスの当初予定されていた開始時刻。trip_id が非頻度ベースの便に対応する場合、このフィールドは省略するか、GTFS フィードの値と同じであるべきです。trip_id が frequencies.txt に定義された頻度ベースの便に対応する場合、start_time は必須であり、便の更新(trip update) および車両位置情報(vehicle position) に指定しなければなりません。便が exact_times=1 の GTFS レコードに対応する場合、start_time は frequencies.txt の start_time に対して headway_secs の倍数（0 を含む）だけ後の時刻でなければなりません。便が exact_times=0 の場合、start_time は任意であり、当初は便の最初の出発時刻であると想定されます。一度確立された exact_times=0 の頻度ベース便の start_time は不変と見なされるべきであり、最初の出発時刻が変更されても、その変更は StopTimeUpdate に反映されるべきです。trip_id が省略される場合、start_time を提供しなければなりません。フォーマットと意味は GTFS/frequencies.txt/start_time と同じです（例: 11:15:35 または 25:15:35）。 |
| **start_date** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | この便インスタンスの開始日 (YYYYMMDD 形式)。スケジュール便（frequencies.txt に定義されていない便）の場合、翌日の予定便と衝突するほど遅延する便を区別するために、このフィールドを提供しなければなりません。例えば、毎日 8:00 と 20:00 に出発する列車が 12 時間遅延した場合、同じ時刻に 2 つの異なる便が存在することになります。このフィールドは、そのような衝突が不可能なスケジュール（例: 毎時運行で、1 時間遅延した車両はもはやスケジュールに関連しないと見なされる場合）では必須ではありません。frequencies.txt に定義された頻度ベースの便では、このフィールドは必須です。trip_id が省略される場合、start_date を提供しなければなりません。 |
| **schedule_relationship** | [ScheduleRelationship](#enum-schedulerelationship_1) | 任意 | 1つ | この便と静的スケジュールの関係。TripDescriptor が運行情報(alert) の `EntitySelector` 内で提供される場合、`schedule_relationship` フィールドは利用者が便インスタンスを特定する際には無視されます。 |
| **modified_trip** | [ModifiedTripSelector](#message-modifiedtripselector) | 任意 | 1つ | この便に対して行われた変更（ルート形状(shape)の変更、停留所等(stop)の削除や追加）へのリンク。このフィールドが提供される場合、`TripDescriptor` の `trip_id`、`route_id`、`direction_id`、`start_time`、`start_date` フィールドは空にしておかなければなりません。これは、`ModifiedTripSelector` の値を参照していない利用者に混乱を与えないためです。 |

### _enum_ ScheduleRelationship {: #enum-schedulerelationship}

この便(trip)と静的スケジュールとの関係を示します。一時的なスケジュールに従って運行され、GTFS に反映されていない新しい便は、SCHEDULED としてマークしてはいけません。その場合は NEW としてマークするべきです。修正されたスケジュールに従って運行され、GTFS に反映されていない便も、SCHEDULED としてマークしてはいけません。その場合は REPLACEMENT としてマークするべきです。

**値**

| _**値**_ | _**説明**_ |
|-------------|---------------|
| **SCHEDULED** | GTFS スケジュールに従って運行されている便、またはスケジュールされた便に十分近いため、それに関連付けられる便。 |
| **ADDED** | *注: この値は動作が未定義であったため非推奨となりました。スケジュールされた便と同じで開始日または開始時刻のみ異なる追加便には **DUPLICATED** を使用し、既存の便と無関係な追加便には **NEW** を使用してください。* |
| **UNSCHEDULED** | スケジュールに関連付けられていない便。この値は、GTFS `frequencies.txt` において `exact_times = 0` と定義された便を識別するために使用されます。GTFS `frequencies.txt` に定義されていない便や、`exact_times = 1` の便を記述するために使用してはいけません。`schedule_relationship: UNSCHEDULED` の便は、すべての StopTimeUpdates においても `schedule_relationship: UNSCHEDULED` を設定しなければなりません。 |
| **CANCELED** | スケジュールに存在していたが削除された便。 |
| **REPLACEMENT** | 既存のスケジュール便を置き換える便。例えば、スケジュールが変更された場合や経路が迂回された場合です。置き換え便の完全な旅程(journey)は `StopTimeUpdate` を通じて指定しなければならず、置き換え対象のインスタンスには GTFS 静的スケジュールは使用されません。<br>`REPLACEMENT` は修正版スケジュールで運行されている場合に使用できますが、車両が静的 GTFS の `stop_times.txt` に記載されたスケジュールに従うことを前提としている場合のリアルタイムのスケジュール逸脱（予測）を伝えるために使用してはいけません。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **DUPLICATED** | 既存のスケジュール便と同じで、サービス開始日や開始時刻のみ異なる新しい便。静的 GTFS から既存の便をコピーし、異なる運行日や時刻で開始するために `TripUpdate.TripProperties.trip_id`、`TripUpdate.TripProperties.start_date`、`TripUpdate.TripProperties.start_time` と共に使用されます。複製は、元の便に関連するサービスが (CSV) GTFS (`calendar.txt` または `calendar_dates.txt`) において今後30日以内に運行される場合に許可されます。複製対象の便は `TripUpdate.TripDescriptor.trip_id` によって識別されます。<br><br>この列挙値は `TripUpdate.TripDescriptor.trip_id` で参照される既存の便を変更するものではありません。元の便をキャンセルしたい場合は、CANCELED の値を持つ別の `TripUpdate` を公開しなければなりません。GTFS `frequencies.txt` において `exact_times` が空または `0` の便は複製できません。新しい便の `VehiclePosition.TripDescriptor.trip_id` には `TripUpdate.TripProperties.trip_id` の一致する値を含めなければならず、`VehiclePosition.TripDescriptor.ScheduleRelationship` も `DUPLICATED` に設定しなければなりません。<br><br>*既存のプロデューサーおよびコンシューマーで、複製便を表すために ADDED 列挙値を使用していた場合は、[移行ガイド](../../realtime/examples//migration-duplicated) に従って DUPLICATED 列挙値に移行しなければなりません。* |
| **NEW** | 既存の便とは無関係な追加便。例えば、急な乗客増加に対応するための便です。新しい便の完全な旅程(journey)、すべての停留所(stop)と時刻を `StopTimeUpdate` を通じて指定しなければなりません。<br><br>*既存のプロデューサーおよびコンシューマーで、静的 GTFS と無関係な新しい便を表すために ADDED 列挙値を使用していた場合は、[移行ガイド](../../realtime/examples//migration-duplicated) に従って NEW 列挙値に移行しなければなりません。*<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **DELETED** | スケジュールに存在していたが削除され、利用者に表示してはいけない便。<br><br>DELETED は、CANCELED の代わりに使用し、交通事業者が該当便に関する情報を利用アプリケーションから完全に削除したい場合に指定します。これにより、便が乗客にキャンセルとして表示されることを防ぎます。例えば、便が完全に別の便に置き換えられる場合です。この指定は、複数の便がキャンセルされ代替サービスに置き換えられる場合に特に重要です。もしコンシューマーがキャンセル情報を明示的に表示すると、より重要なリアルタイム予測から注意をそらしてしまう可能性があります。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |

## _message_ ModifiedTripSelector {: #message-modifiedtripselector}

サービスが便の変更(trip modification)の影響を受ける場合、`ModifiedTripSelector` は特定の便(trip)を選択するために使用されます。詳細は [便の変更(Trip Modification)](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-modifications.md#linkage-to-tripupdates) 仕様を参照してください。

**値**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **modifications_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | この便に影響を与える `TripModifications` オブジェクトを含む `FeedEntity` の `id`。|
| **affected_trip_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | `modifications_id` によって変更される GTFS フィード内の `trip_id`。|
| **start_time** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 頻度ベースの変更便に適用される、この便インスタンスの当初の予定出発時刻。定義は [TripDescriptor](#message-tripdescriptor) の **start_time** と同じです。|
| **start_date** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 変更便に適用される、この便インスタンスの開始日 (YYYYMMDD 形式)。定義は [TripDescriptor](#message-tripdescriptor) の **start_date** と同じです。|

### _message_ VehicleDescriptor {: #message-vehicledescriptor}


便(trip)を運行する車両の識別情報。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 車両の内部システム識別子。車両ごとに**一意**であるべきであり、システム内で車両を追跡するために使用されます。この id はエンドユーザーに公開してはいけません。その目的には **label** フィールドを使用してください。 |
| **label** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 乗客が正しい車両を識別するのを助けるために表示される、ユーザー向けのラベル。 |
| **license_plate** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 車両のナンバープレート。 |
| **wheelchair_accessible** | [WheelchairAccessible](#enum-wheelchairaccessible) | 任意 | 1つ | 指定された場合、静的 GTFS の *wheelchair_accessible* の値を上書きすることができます。 |

### _enum_ WheelchairAccessible {: #enum-wheelchairaccessible}

特定の便(trip)が車椅子で利用可能かどうかを示します。利用可能な場合、この値は静的GTFSの _wheelchair_accessible_ フィールドの値を上書きするべきです。

##### 値 {: #values}


| _**値**_ | _**コメント**_ |
|-------------|---------------|
| **NO_VALUE** | 便(trip)には車椅子利用可否に関する情報がありません。これは **デフォルト** の動作です。静的GTFSに _wheelchair_accessible_ の値が含まれている場合、それは上書きされません。 |
| **UNKNOWN** | 便(trip)には利用可否の値が存在しません。この値はGTFSの値を上書きします。 |
| **WHEELCHAIR_ACCESSIBLE** | 便(trip)は車椅子で利用可能です。この値はGTFSの値を上書きします。 |
| **WHEELCHAIR_INACCESSIBLE** | 便(trip)は車椅子での利用が **できません**。この値はGTFSの値を上書きします。 |

### _message_ EntitySelector {: #message-entityselector}

GTFS フィード内のエンティティを指定するセレクタです。フィールドの値は、GTFS フィード内の対応するフィールドに一致しなければなりません。少なくとも 1 つの指定子を与えなければなりません。複数の指定子が与えられた場合、それらは論理演算子 `AND` で結合されたものとして解釈されます。さらに、指定子の組み合わせは GTFS フィード内の対応する情報と一致しなければなりません。言い換えると、GTFS 内のエンティティに運行情報(alert)を適用するためには、提供されたすべての EntitySelector フィールドと一致しなければなりません。例えば、`route_id: "5"` と `route_type: "3"` のフィールドを含む EntitySelector は、`route_id: "5"` のバスにのみ適用され、`route_type: "3"` の他のルートには適用されません。もし事業者が `route_id: "5"` と `route_type: "3"` の両方に運行情報(alert)を適用したい場合は、`route_id: "5"` を参照する EntitySelector と `route_type: "3"` を参照する EntitySelector の 2 つを別々に提供するべきです。

少なくとも 1 つの指定子を与えなければならず、EntitySelector 内のすべてのフィールドを空にすることはできません。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **agency_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | このセレクタが参照する GTFS フィードの agency_id。 |
| **route_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | このセレクタが参照する GTFS の route_id。direction_id が指定される場合、route_id も指定しなければなりません。 |
| **route_type** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | このセレクタが参照する GTFS の route_type。 |
| **direction_id** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | GTFS フィードの trips.txt ファイルにある direction_id。route_id で指定されたルートの一方向のすべての便(trip)を選択するために使用されます。direction_id が指定される場合、route_id も指定しなければなりません。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。<br> |
| **trip** | [TripDescriptor](#message-tripdescriptor) | 条件付き必須 | 1つ | このセレクタが参照する GTFS の便(trip)インスタンス。この TripDescriptor は GTFS データ内の単一の便(trip)インスタンスに解決されなければなりません（例: 事業者は exact_times=0 の便に対して trip_id のみを提供することはできません）。この TripDescriptor 内の ScheduleRelationship フィールドが入力されている場合、GTFS の便を特定する際に利用者はそれを無視します。 |
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | このセレクタが参照する GTFS フィードの stop_id。 |

### _message_ TranslatedString {: #message-translatedstring}


各言語ごとのテキスト断片または URL のバージョンを含む国際化されたメッセージです。メッセージから 1 つの文字列が選択されます。解決の手順は以下の通りです。UI 言語が翻訳の言語コードと一致する場合、最初に一致した翻訳が選択されます。デフォルトの UI 言語（例: 英語）が翻訳の言語コードと一致する場合、最初に一致した翻訳が選択されます。言語コードが指定されていない翻訳がある場合、その翻訳が選択されます。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **translation** | [Translation](#message-translation) | 必須 | 複数 | 少なくとも 1 つの翻訳を提供しなければなりません。 |

### _message_ Translation {: #message-translation}


言語に対応付けられたローカライズされた文字列。

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **text** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | メッセージを含む UTF-8 文字列。 |
| **language** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | BCP-47 言語コード。言語が不明な場合、またはフィードに対して国際化が全く行われていない場合は省略することができます。言語タグが未指定の翻訳は最大で1つまで許可されます。複数の翻訳がある場合は、言語を指定しなければなりません。 |

### _message_ TranslatedImage {: #message-translatedimage}


各言語ごとの画像を含む国際化対応メッセージです。メッセージ内の画像の1つが選択されます。解決手順は以下の通りです。UI言語が翻訳の言語コードと一致する場合、最初に一致した翻訳が選択されます。デフォルトのUI言語（例: 英語）が翻訳の言語コードと一致する場合、最初に一致した翻訳が選択されます。言語コードが指定されていない翻訳がある場合、その翻訳が選択されます。

**注意:** このメッセージはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **localized_image** | [LocalizedImage](#message-localizedimage) | 必須 | 複数 | 少なくとも1つのローカライズされた画像を提供しなければなりません。 |

### _message_ LocalizedImage {: #message-localizedimage}


言語に対応付けられたローカライズ済み画像URL。

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **url** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | 画像へのリンクを含むURL文字列。リンクされる画像は2MB未満でなければなりません。画像が大幅に変更され、利用者側で更新が必要となる場合、提供者はURLを新しいものに更新しなければなりません。<br><br> URLは http:// または https:// を含む完全修飾URLであるべきです。また、URL内の特殊文字は正しくエスケープされなければなりません。完全修飾URL値の作成方法については、次の資料を参照してください: http://www.w3.org/Addressing/URL/4_URI_Recommentations.html |
| **media_type** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | 表示する画像の種類を指定するための IANA メディアタイプ。タイプは "image/" で始まらなければなりません。 |
| **language** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | BCP-47 言語コード。言語が不明な場合、またはフィードに国際化が全く行われていない場合は省略することができます。未指定の言語タグを持つ翻訳は最大で1つのみ許可されます。複数の翻訳がある場合は、言語を指定しなければなりません。 |

### _message_ Shape {: #message-shape}


ルート形状(shape)が (CSV) GTFS の一部ではない場合、例えば臨時の迂回運行などにおいて、車両が走行する物理的な経路を記述します。ルート形状(shape)は便(trip)に属し、効率的な伝送のためにエンコードされたポリラインで構成されます。ルート形状(shape)は停留所等(stop)の位置を正確に通過する必要はありませんが、便(trip)上のすべての停留所等(stop)は、その便(trip)のルート形状(shape)から近い距離、すなわちルート形状(shape)の点を結ぶ直線に近い位置に存在するべきです。

<br><br>**注意:** このメッセージはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **shape_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | ルート形状(shape)の識別子。(CSV) GTFS で定義されているいかなる `shape_id` とも異ならなければなりません。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |
| **encoded_polyline** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | ルート形状(shape)のエンコードされたポリライン表現。このポリラインは少なくとも2点を含み、使用される便(trip)の完全なルート形状(shape)を表現しなければなりません。エンコードされたポリラインの詳細については、https://developers.google.com/maps/documentation/utilities/polylinealgorithm を参照してください。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。 |

### _message_ Stop {: #message-stop}


フィードに動的に追加された新しい停留所等(stop)を表します。すべてのフィールドは (CSV) GTFS 仕様で説明されている通りです。新しい停留所等(stop)の location type は `0`（経路指定可能な停留所等(stop)）です。  

<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | 停留所等(stop)の識別子。(CSV) GTFS で定義された任意の `stop_id` と異ならなければなりません。 |
| **stop_code** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | (CSV) GTFS における [stops.stop_code](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **stop_name** | [TranslatedString](#message-translatedstring) | 必須 | 1つ | (CSV) GTFS における [stops.stop_name](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **tts_stop_name** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | (CSV) GTFS における [stops.tts_stop_name](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **stop_desc** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | (CSV) GTFS における [stops.stop_desc](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **stop_lat** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | (CSV) GTFS における [stops.stop_lat](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **stop_lon** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | (CSV) GTFS における [stops.stop_lon](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **zone_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | (CSV) GTFS における [stops.zone_id](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **stop_url** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | (CSV) GTFS における [stops.stop_url](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **parent_station** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | (CSV) GTFS における [stops.parent_station](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **stop_timezone** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | (CSV) GTFS における [stops.stop_timezone](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **wheelchair_boarding** | [WheelchairBoarding](#enum-wheelchairboarding) | 任意 | 1つ | (CSV) GTFS における [stops.wheelchair_boarding](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **level_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | (CSV) GTFS における [stops.level_id](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **platform_code** | [TranslatedString](#message-translatedstring) | 任意 | 1つ | (CSV) GTFS における [stops.platform_code](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |

### _enum_ WheelchairBoarding {: #enum-wheelchairboarding}


**値**

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| **UNKNOWN** | この停留所(stop)にはバリアフリー情報がありません。 |
| **AVAILABLE** | この停留所(stop)では、一部の車両に車椅子の乗客が乗車することができます。 |
| **NOT_AVAILABLE** | この停留所(stop)では車椅子での乗車はできません。 |

### _message_ TripModifications {: #message-tripmodifications}


`TripModifications` メッセージは、迂回などの特定の変更によって影響を受ける類似の便(trip)の一覧を識別します。

<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。

[便の変更(Trip Modifications)についての詳細...](../../../documentation/realtime/feed-entities/trip-modifications)

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **selected_trips** | [SelectedTrips](#message-selectedtrips) | 必須 | 複数 | この TripModifications によって影響を受ける便(trip)の一覧。少なくとも1つの `SelectedTrips` を含める必要があります。`start_times` の値が設定されている場合、1つの trip_id を持つ最大1つの `SelectedTrips` のみを列挙できます。 |
| **start_times** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 複数 | trip_ids で定義された trip_id に対するリアルタイム便記述子の出発時刻の一覧。頻度ベースの便において、1つの trip_id の複数の出発を対象とするのに有用です。 |
| **service_dates** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 複数 | 変更が発生する日付 (YYYYMMDD 形式)。trip_id は、指定された運行日(service day)に運行する場合にのみ変更されます。便(trip)がすべての運行日で運行する必要はありません。プロデューサーは、次の1週間以内に発生する迂回のみを送信するべきです。提供される日付は利用者向け情報として使用すべきではありません。利用者向けの開始日と終了日を提供する必要がある場合は、`service_alert_id` を持つ関連する運行情報(alert)で提供することができます。 |
| **modifications** | [Modification](#message-modification) | 必須 | 複数 | 影響を受ける便(trip)に適用する変更の一覧。 |

### _message_ Modification {: #message-modification}


`Modification` メッセージは、`start_stop_selector` から始まる各影響を受ける便(trip)への変更を記述します。

<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。

<img src="../../../assets/trip-modification.png">

_特定の便に対する変更の効果を示す例。この変更は他の複数の便にも適用される可能性があります。_

<img src="../../../assets/propagated-delay.png">

_迂回による遅延は、変更の終了後のすべての停留所等(stop)に影響します。1つの便に複数の変更がある場合、遅延は累積されます。_


**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **start_stop_selector** | [StopSelector](#message-stopselector) | 必須 | 1つ | この変更の影響を受ける元の便の最初の停留所等(stop)を指定する stop selector。`end_stop_selector` と組み合わせて使用されます。`start_stop_selector` は必須であり、`travel_time_to_stop` と共に使用される基準停留所等(stop)を定義します。詳細は [`travel_time_to_stop`](#message-replacementstop) を参照してください。 |
| **end_stop_selector** | [StopSelector](#message-stopselector) | 条件付き必須 | 1つ | この変更の影響を受ける元の便の最後の停留所等(stop)を指定する stop selector。選択は包括的であるため、1つの停車時刻(stop_time)のみが置き換えられる場合、`start_stop_selector` と `end_stop_selector` は同一でなければなりません。置き換えられる停車時刻(stop_time)がない場合、`end_stop_selector` を指定してはいけません。それ以外の場合は必須です。 |
| **propagated_modification_delay** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | 変更によって挿入された最後の停留所等(stop)以降のすべての出発時刻および到着時刻に加える遅延秒数。変更がルート形状(shape)のみに影響する場合（すなわち `end_stop_selector` も `replacement_stops` も指定されない場合）、遅延の伝播は `start_stop_selector` の次の停留所等(stop)から始まります。正または負の値を取ることができます。同じ便に複数の変更が適用される場合、便の進行に伴って遅延は累積されます。<br/><br/>値が指定されない場合、利用者は他のデータに基づいて `propagated_modification_delay` を補間または推定することができます。 |
| **replacement_stops** | [ReplacementStop](#message-replacementstop) | 任意 | 複数 | 元の便の停留所等(stop)を置き換える代替停留所等(stop)のリスト。新しい停車時刻(stop_time)の数は、置き換えられる停車時刻(stop_time)の数より少なくても、多くても、同じでもかまいません。 |
| **service_alert_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | この変更を利用者向けに説明する `Alert` を含む `FeedEntity` メッセージの `id` 値。 |
| **last_modified_time** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | この変更が最後に更新された時刻を示すタイムスタンプ。POSIX 時間（1970年1月1日 00:00:00 UTC からの秒数）。 |

### _message_ StopSelector {: #message-stopselector}


停留所等(stop)を指定するためのセレクタです。`stop_id` または `stop_sequence` のいずれかで指定します。少なくともどちらか1つの値を指定しなければなりません。  

<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **stop_sequence** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 対応する GTFS フィードの stop_times.txt に記載されているものと同じでなければなりません。`StopSelector` 内では `stop_sequence` または `stop_id` のいずれかを指定しなければならず、両方を空にすることはできません。便(trip)が同じ `stop_id` に複数回停車する場合（例: ループ運行）、どの停留所等(stop)に対する予測かを区別するために `stop_sequence` が必須となります。 |
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付き必須 | 1つ | 対応する GTFS フィードの stops.txt に記載されているものと同じでなければなりません。`StopSelector` 内では `stop_sequence` または `stop_id` のいずれかを指定しなければならず、両方を空にすることはできません。 |

### _message_ SelectedTrips {: #message-selectedtrips}


ルート形状(shape)が関連付けられた選択された便(trip)の一覧。

<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来的に正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **trip_ids** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 複数 | 1つ | 影響を受ける元の (CSV) GTFS の trip_id の一覧。少なくとも1つの trip_id を含める必要があります。`schedule_relationship=REPLACEMENT` を持つ `TripUpdate` がすでにその便に存在していてはいけません。 |
| **shape_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | この SelectedTrips 内の変更された便に対する新しいルート形状(shape)の ID。同じ GTFS-RT フィード内で `Shape` メッセージを使用して追加された新しいルート形状(shape)を参照することも、GTFS-Static フィードの shapes.txt に定義された既存のルート形状(shape)を参照することもできます。リアルタイムフィード内の `Shape` エンティティを参照する場合、このフィールドの値はエンティティ内の `shape_id` の値でなければならず、`FeedEntity` の `id` ではありません。 |

### _message_ ReplacementStop {: #message-replacementstop}


各 `ReplacementStop` メッセージは、便(trip)が新たに停車する停留所等(stop)を定義し、任意でその停留所等(stop)までの推定所要時間を指定します。  

<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来的に正式に採用される可能性があります。

<img src="../../../assets/first-stop-reference.png">

_もし変更が便(trip)の最初の停留所等(stop)に影響する場合、その停留所等(stop)は変更の基準停留所等(reference stop)としても扱われます。_


**フィールド**

| _**フィールド名**_ | _**型**_ | _**必須**_ | _**多重度(cardinality)**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | 便(trip)が新たに停車する置換先の停留所等(stop)ID。これは、同じ GTFS-RT フィード内で `Stop` メッセージを使用して追加された新しい停留所等(stop)、または (CSV) GTFS フィードの `stops.txt` に定義された既存の停留所等(stop)を参照することができます。リアルタイムフィード内の `Shape` エンティティを参照する場合、このフィールドの値は `FeedEntity` の `id` ではなく、そのエンティティ内の `stop_id` でなければなりません。停留所等(stop)は `location_type=0`（経路上の停留所等）でなければなりません。 |
| **travel_time_to_stop** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | この停留所等(stop)の到着時刻と基準停留所等(reference stop)の到着時刻との差（秒単位）。基準停留所等(reference stop)は `start_stop_selector` の直前の停留所等(stop)です。もし変更が便(trip)の最初の停留所等(stop)から始まる場合、その最初の停留所等(stop)が基準停留所等(reference stop)となります。<br/><br/>この値は単調増加でなければならず、元の便(trip)の最初の停留所等(stop)が基準停留所等(reference stop)である場合のみ負の数を取ることができます。<br/><br/>値が指定されていない場合、利用者は他のデータに基づいて `travel_time_to_stop` を補間または推定することができます。 |
