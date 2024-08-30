# GTFS RealtimeリファレンスGTFS Realtimeフィードを使用すると、交通機関はサービスへの混乱 (駅の閉鎖、路線の運行停止、大幅な遅延など)、車両の位置、到着予定時刻に関するリアルタイム情報を消費者に提供できます。

フィード仕様のバージョン 2.0 については、このサイトで説明および文書化されています。有効なバージョンは`2.0`、`1.0`です。

## 用語の定義

###必須

GTFS リアルタイム v2.0 以降では、*必須* 列は、交通データが有効で、使用するアプリケーションにとって意味を成すために、プロデューサーが提供する必要があるフィールドを示します。

*必須* フィールドでは次の値が使用されます:

*   **必須**: このフィールドは、GTFS リアルタイム フィード プロデューサーが提供する必要があります。
*   **条件付きで必須**: このフィールドは、フィールド *説明* で概説されている特定の条件下で必須です。これらの条件以外では、フィールドはオプションです。
*   **任意**: このフィールドはオプションであり、プロデューサーが実装する必要はありません。ただし、基礎となる自動車両位置システム (例: VehiclePosition `timestamp`) でデータが利用可能な場合は、プロデューサーが可能な場合はこれらのオプション フィールドを提供することが推奨されます。

*セマンティック要件は GTFS リアルタイム バージョン 1.0 では定義されていないため、 `gtfs_realtime_version`が`1`のフィードはこれらの要件を満たさない可能性があることに注意してください (詳細については、[セマンティック要件の提案](https://github.com/google/transit/pull/64) を参照してください)。*

### カーディナリティ

*カーディナリティ* は、特定のフィールドに提供できる要素の数を表し、次の値があります:

* **1** - このフィールドには 1 つの要素を指定できます。これは、[プロトコル バッファの *必須* および *オプション* の基数](https://developers.google.com/protocol-buffers/docs/proto#simple) にマップされます。
* **多数** - このフィールドには、多数の要素 (0、1、またはそれ以上) を指定できます。これは、[プロトコル バッファの *繰り返し* 基数](https://developers.google.com/protocol-buffers/docs/proto#simple) にマップされます。

フィールドが必須、条件付きで必須、またはオプションであるかどうかを確認するには、常に *必須* フィールドと *説明* フィールドを参照してください。プロトコル バッファのカーディナリティについては、[`gtfs-realtime.proto`](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) を参照してください。

### プロトコル バッファのデータ型

フィード要素の記述には、次のプロトコル バッファのデータ型が使用されます:

*   **message**: 複合型
*   **enum**: 固定値のリスト

### 試験的なフィールド

**試験的** というラベルの付いたフィールドは変更される可能性があり、まだ正式に仕様に採用されていません。 **実験的** フィールドは、将来正式に採用される可能性があります。

## 要素インデックス

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
            *   [原因](#enum-cause)
            *   [効果](#enum-effect)
            *   [TranslatedString](#message-translatedstring)
                *   [翻訳](#message-translation)
            *   [SeverityLevel](#enum-severitylevel)
       *   [形状](#message-shape)
       *   [停止](#message-stop)
            *   [WheelchairBoarding](#enum-wheelchairboarding)
       *   [TripModifications](#message-tripmodifications)
            *   [Modification](#message-modification)
            *   [ReplacementStop](#message-replacementstop)
            

##要素

### _message_ FeedMessage 

フィードmessageの内容。ストリーム内の各messageは、適切な HTTP GET リクエストへの応答として取得されます。リアルタイム フィードは常に、既存の GTFS フィードとの関連で定義されます。すべてのエンティティ ID は、GTFS フィードを基準にして解決されます。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **header** | [FeedHeader](#message-feedheader) |必須| 1 つ | このフィードとフィードmessageに関するメタデータ。 |
| **entity** | [FeedEntity](#message-feedentity) | 条件付きで必須 | 複数 | フィードの内容。交通システムに関するリアルタイム情報がある場合は、このフィールドを指定する必要があります。このフィールドが空の場合、ユーザーはシステムに関するリアルタイム情報がないものと想定する必要があります。 |

### _message_ FeedHeader 

フィード メッセージに含まれる、フィードに関するメタデータ。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **gtfs_realtime_version** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | フィード仕様のバージョン。現在のバージョンは 2.0 です。 |
| **incrementality** | [Incrementality](#enum-incrementality) |必須| 1 |
| **timestamp** | [uint64](https:) |必須| 1 | このタイムスタンプは、このフィードの内容が作成された瞬間を識別します (サーバー時間)。POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。リアルタイム情報を生成するシステムと消費するシステム間の時間のずれを回避するには、タイム サーバーからタイムスタンプを取得することを強くお勧めします。数秒までの時間差は許容されるため、Stratum 3 またはそれより低い Strata サーバーを使用することはまったく問題ありません。 |

### _enum_Incrementality

現在のフェッチが増分かどうかを決定します。

*    **FULL_DATASET**: このフィード更新により、フィードの以前のすべてのリアルタイム情報が上書きされます。したがって、このアップデートでは、既知のすべてのリアルタイム情報の完全なスナップショットが提供される予定です。
*    **DIFFERENTIAL**: 現在、このモードは**サポートされていません**。このモードを使用するフィードの動作は**未指定**です。[GTFS Realtimeメーリング リスト](http://groups.google.com/group/gtfs-realtime)で、DIFFERENTIAL モードの動作を完全に指定することについて議論されており、その議論が完了した時点でドキュメントが更新されます。

**値**

| _**値**_ |
|-------------|
| ** **FULL_DATASET** ** |
| **DIFFERENTIAL** |

### _message_ FeedEntity 

交通フィード内のエンティティの定義 (または更新)。エンティティが削除されない場合は、`trip_update`、`vehicle`、`alert`、および`shape`ち` 1 つだけを入力する必要があります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | このエンティティのフィード固有の識別子。ID は増分サポートを提供するためだけに使用されます。フィードによって参照される実際のエンティティは、明示的なセレクターによって指定する必要があります (詳細については、以下のEntitySelectorを参照してください)。|
| **is_deleted** | [bool](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | このエンティティを削除するかどうか。増分性が DIFFERENTIAL のIncrementalityに対してのみ指定する必要があります。このフィールドは、Incrementalityが FULL_DATASET のフィードには指定しないでください。 |
| **trip_update** | [TripUpdate](#message-tripupdate) | 条件付きで必須 | 1 つ | 旅行の出発遅延に関するリアルタイムのデータ。trip_update、vehicle、alert、または shape のフィールドのうち少なくとも 1 つを指定する必要があります。これらのフィールドすべてを空にすることはできません。 |
| **vehicle** | [VehiclePosition](#message-vehicleposition) | 条件付きで必須 | 1 つ | 車両のリアルタイムの位置に関するデータ。trip_update、vehicle、alert、または shape のフィールドのうち少なくとも 1 つを指定する必要があります。これらのフィールドすべてを空にすることはできません。 |
| **alert** | [アラート](#message-alert) | 条件付きで必須 | 1 つ | リアルタイム アラートに関するデータ。trip_update、vehicle、alert、shape のフィールドのうち少なくとも 1 つを指定する必要があります。これらのフィールドすべてを空にすることはできません。|
| **shape** | [シェイプ](#message-shape) | 条件付きで必須 | 1 つ | 迂回路などのリアルタイムで追加されたシェイプに関するデータ。trip_update、vehicle、alert、shape のフィールドのうち少なくとも 1 つを指定する必要があります。これらのフィールドすべてを空にすることはできません。<br><br> **注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来、正式に採用される可能性があります。 |


### _message_ TripUpdate 

旅程に沿った車両の進行状況に関するリアルタイム更新。[旅程更新エンティティ](../../../documentation/realtime/feed_entities/trip-updates)の一般的な説明も参照してください。
upd
ScheduleRelationship の値に応じて、 TripUpdate以下を指定できます。

*   ScheduleRelationshipに沿って進む旅程。
*   ルートに沿って進むが、スケジュールが固定されていない旅程。
*   スケジュールに関して追加または削除された旅程。
*   静的 GTFS の既存の旅程のコピーである新しい旅程。TripProperties で指定されたサービスdateで実行されますTripProperties更新は、将来の予測到着/出発イベント、またはすでに発生した過去のイベントに対して行うことができます。ほとんどの場合、過去のイベントに関する情報は測定値であるため、その不確実性の値は 0 にすることをお勧めします。ただし、これに当てはまらない場合もあり、その場合は過去のイベントの不確実性の値が 0 以外になることが許可されます。更新の不確実性が 0 でない場合、更新は完了していない旅行のおおよその予測であるか、測定が正確でないか、更新はイベント発生後に検証されていない過去の予測であったかのいずれかです。

車両が同じブロック内で複数の旅行を提供している場合 (旅行とブロックの詳細については、[GTFS trips.txt](../../schedule/reference/#tripstxt) を参照してください):

* フィードには、車両が現在提供している旅行のTripUpdateを含める必要があります。プロデューサーは、将来の旅行の予測の品質に自信がある場合は、この車両のブロックの現在の旅行の後の 1 つ以上の旅行の TripUpdate を含めることが推奨されます。同じ車両に複数の TripUpdates を含めると、車両が 1 つの旅程から別の旅程に移行する際に乗客に予測の`TripUpdateエンティティは、ブロック内でスケジュールされている順序と同じ順序でフィードに追加する必要はありません。たとえば、 `trip_ids`が` 1、2、3 の旅程がすべて 1 つのブロックに属していて、車両が旅程 1、旅程 2、旅程 3 の順に移動する場合、 `trip_update`エンティティは任意の順序で表示できます。たとえば、旅程 2、旅程 1、旅程 3 の順で追加できます。

更新ではすでに完了した旅程を記述できることに注意してください。このためには、旅程の最後の停車地の更新を提供すれば十分です。最後の停車地への到着時刻が過去である場合、クライアントは旅行全体が過去であると結論付けます (重要ではありませんが、前の停車地の更新も提供できます)。このオプションは、スケジュールより早く完了したが、スケジュールによると現時点で旅行がまだ進行中である旅行に最も関連しています。この旅行の更新を削除すると、クライアントは旅行がまだ進行中であると想定する可能性があります。フィード プロバイダーは過去の更新を消去できますが、必須ではないことに注意してください。これは、これが実際に役立つ 1 つのケースです。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|-----------|----------------|-------------------|-------------------|
| **trip** | [TripDescriptor](#message-tripdescriptor) |必須| 1 つ | このmessageが適用される旅行。実際の旅行インスタンスごとに、最大 1 つのTripUpdateエンティティを指定できます。存在しない場合は、予測情報がないことを意味します。旅行がスケジュールどおりに進んでいることを意味するわけではありません。 |
| **vehicle** | [VehicleDescriptor](#message-vehicledescriptor) |任意| 1 つ | この旅行にサービスを提供する車両に関する追加情報。 |
| **stop_time_update** | [StopTimeUpdate](#message-stoptimeupdate) | 条件付きで必須 | 複数 | 旅行の StopTimes の更新 (将来の予測と、場合によっては過去の停止時刻 (すでに発生した停止時刻) の両方)。更新はstop_sequenceで並べ替える必要があり、次に指定された stop_time_update までの旅行のすべての後続の停車地に適用されます。trip.schedule_relationship が CANCELED、DELETED、または DUPLICATED でない限り、旅行に対して少なくとも 1 つの stop_time_update を指定する必要があります。旅行がキャンセルまたは削除された場合、stop_time_updates を指定する必要はありません。キャンセルまたは削除された旅行に対して stop_time_updates が指定されている場合、trip.schedule_relationship は、stop_time_updates および関連する schedule_relationship よりも優先されます。旅行が重複している場合は、新しい旅行のリアルタイム情報を示すために stop_time_updates を指定できます。|
| **timestamp** | [uint64](https:) |任意| 1 つ | 将来の StopTimes を推定するために車両のリアルタイムの進行状況が測定された最新の瞬間。過去の StopTimes が指定されている場合、到着/出発時刻はこの値よりも早くなることがあります。POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数) です。|
| **delay** | [int32](https:) |任意| 1 つ | 旅行の現在のスケジュールの偏差。遅延は、予測が GTFS の既存のスケジュールと比較して提供される場合にのみ指定する必要があります。<br>遅延 (秒単位) は、正 (車両が遅れていることを意味する) または負 (車両が予定より進んでいることを意味する) になります。遅延が 0 の場合、車両は正確に時間通りであることを意味します。<br> StopTimeUpdates の遅延情報は、旅行レベルの遅延情報よりも優先されるため、旅行レベルの遅延は、 StopTimeUpdate遅延値が指定された旅行の次の停車地までのみ伝播されます。<br>フィード プロバイダーは、データの鮮度を評価するために、遅延値が最後に更新された日時を示すTripUpdate.timestamp 値を提供することを強くお勧めします。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。|
| **trip_properties** | [TripProperties](#message-tripproperties) |任意| 1 つ | 旅行の更新されたプロパティを提供します。<br><br> **注意:**このmessageはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |

### _message_ StopTimeEvent 

単一の予測イベント (到着または出発) のタイミング情報。タイミングは、遅延および/または推定時間、および不確実性で構成されます。

*   遅延は、GTFS の既存のスケジュールを基準にして予測が示される場合に使用します。
*   時間は、予測スケジュールがあるかどうかに関係なく指定する必要があります。時間と遅延の両方が指定されている場合は、時間が優先されます (ただし、通常、スケジュールされた旅行に対して時間が指定されている場合は、GTFS のスケジュールされた時間 + 遅延に等しくする必要があります)。

不確実性は、時間と遅延の両方に等しく適用されます。不確実性は、実際の遅延の予想される誤差を大まかに指定します (ただし、その正確な統計的意味はまだ定義されていません)。たとえば、コンピューターのタイミング制御下で運転される列車の場合、不確実性が 0 になることがあります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **delay** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | 遅延 (秒単位) は正 (車両が遅れていることを意味する) または負 (車両が予定より進んでいることを意味する) になります。遅延が 0 の場合、車両は正確に時間通りです。StopTimeEvent 内では遅延または時間のいずれかを指定する必要があります。両方のフィールドを空にすることはできません。 |
| **time** | [int64](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件StopTimeEventで必須 | 1 つ | 絶対時間としてのイベント。 POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。StopTimeEvent 内では、遅延または時間のいずれかを指定する必要があります。両方のフィールドを空にすることはできません。 |
| **uncertainty** | [int32](https:) |任意| 1StopTimeEvent| 不確実性が省略されている場合は、不明と解釈されます。完全に確実な予測を指定するには、不確実性を 0 に設定します。 |

### _message_ StopTimeUpdate 

旅行中の特定の停車地の到着イベントや出発イベントのリアルタイム更新。[TripDescriptor](#message-tripdescriptor) および [旅行更新エンティティ](../../../documentation/realtime/feed_entities/trip-updates) ドキュメントの停車時間更新に関する一般的な説明も参照してください。

過去と未来の両方のイベントの更新を提供できます。プロデューサーは過去のイベントを削除できますが、必須ではありません。
更新はstop_sequenceまたは stop_id のいずれかを介して特定の停車地にリンクされるため、これらのフィールドのいずれかが必ず設定されている必要があります。1 つの旅程で同じ stop_id を複数回訪問する場合は、その旅程のその stop_id のすべての StopTimeUpdates でstop_sequenceを指定する必要があります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **stop_sequence** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | 対応する GTFS フィードのstop_times.txtと同じであるしなければならない。 StopTimeUpdate内ではstop_sequenceまたは stop_id のいずれかを指定する必要があります。両方のフィールドを空にすることはできません。stop_sequenceは、予測の対象となる停留所を区別するために、同じ stop_id を複数回訪れる旅程 (ループなど) に必要です。`StopTimeProperties.assigned_stop_id` が設定されている場合は、 `stop_sequence`設定する必要があります。|
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | 対応する GTFS フィードのstops.txtと同じであるしなければならない。StopTimeUpdate 内ではstop_sequenceまたは stop_id のいずれかを指定する必要があります。両方のフィールドを空にすることはできません。`StopTimeProperties.assigned_stop_id` がStopTimeUpdate`StopTimeProperties.assigned_stop_id`れている場合は、 `stop_id` を省略して`stop_sequence`のみを使用することをお勧めします。 `StopTimeProperties.assigned_stop_id`と`stop_id` が設定されている場合、 `stop_id` は`assigned_stop_id`と一致する必要があります。 |
| **arrival** | [StopTimeEvent](#message-stoptimeevent) | 条件付きで必須 | 1 つ | schedule_relationship が空または SCHEDULED の場合、 StopTimeUpdate内で arrive または destination のいずれかを指定する必要があります。両方のフィールドを空にすることはできません。schedule_relationship が SKIPPED の場合、arrival と destination の両方を空にすることができます。schedule_relationship が NO_DATA の場合、arrival と destination の両方を空にする必要があります。 |
| **departure** | [StopTimeEvent](#message-stoptimeevent) | 条件付きで必須 | 1 つ | schedule_relationship が空または SCHEDULED の場合、 StopTimeUpdate内で arrive または destination のいずれかを指定する必要があります。両方のフィールドを空にすることはできません。schedule_relationship が SKIPPED の場合、arrival と destination の両方を空にすることができます。 schedule_relationship が NO_DATA の場合、到着と出発は空でなければなりません。|
| **departure_occupancy_status** | [OccupancyStatus](#enum-occupancystatus) |任意| 1 つ | 指定された停留所から出発した直後の車両の乗客の占有状況の予測。指定されている場合は、 stop_sequence を指定する必要があります。リアルタイムの到着または出発の予測を提供せずに、departure_occupancy_status を提供するには、このフィールドに値を入力し、 StopTimeUpdate.schedule_relationship = NO_DATA を設定します。<br><br> **注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **schedule_relationship** | [ScheduleRelationship](#enum-schedulerelationship) |任意| 1 つ | デフォルトの関係は SCHEDULED です。 |
| **stop_time_properties** | [StopTimeProperties](#message-stoptimeproperties) |任意| 1 つ | GTFS stop_times.txt内で定義されている特定のプロパティのリアルタイム更新<br><br>**注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |

### _enum_ ScheduleRelationship 

この StopTime と静的スケジュールの関係。

**値**

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| **SCHEDULED** | 車両は、必ずしもスケジュールの時間に従っているわけではありませんが、静的な停車スケジュールに従って進んでいます。これが**デフォルト**の動作です。到着と出発の少なくとも 1 つを指定する必要があります。頻度ベースの旅程 (exact_times = 0 の GTFS frequencies.txt ) には SCHEDULED 値を指定せず、代わりに UNSCHEDULED を使用する必要があります。 |
| **SKIPPED** | 停車地はスキップされます。つまり、車両はこの停車地には停車しません。到着と出発はオプションです。設定されている場合、 `SKIPPED` は同じルート内の後続の停車地には伝播されません (つまり、車両はルート内の後続の停車地にも停止しますが、それらの停車地にも`schedule_relationship: SKIPPED`の ` `stop_time_update`がある場合には除きます)。ルート内の前の停車地からの遅延は`SKIPPED`停車地にも伝播します。つまり、 `SKIPPED`停車地後の停車地に対して`arrival`または`departure`予測を含む`stop_time_update`が設定されていない場合、 `SKIPPED`停車地の上流の予測は、後続の停車地の`stop_time_update`が提供されるまで、ルート内の`SKIPPED`停車地後の停車地と後続の停車地に伝播します。|
| **NO_DATA** | この停車地にはデータがありません。リアルタイムのタイミング情報がないことを示します。設定すると、NO_DATA は後続の停車地にも伝播されるため、リアルタイムのタイミング情報がない停車地を指定するには、この方法をお勧めします。NO_DATA が設定されている場合は、到着も出発も指定しないでください。|
| **UNSCHEDULED** | 車両は、頻度ベースの旅程 (GTFS frequencies.txtで exact_times = 0) を運行しています。この値は、GTFS frequencies.txtで定義されていない旅程、または GTFS frequencies.txtで exact_times = 1. の旅程には使用しないでください。`schedule_relationship : `schedule_relationship: UNSCHEDULED`の`stop_time_updates`を含む便では、 TripDescriptor `schedule_relationship: UNSCHEDULED`も設定する必要があります。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。

### _message_ StopTimeProperties 

GTFS stop_times.txt内で定義されている特定のプロパティのリアルタイム更新。

**注意:**このmessageはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。<br> 

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **assigned_stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | リアルタイムの停留所割り当てをサポートします。GTFS `stops.txt`で定義されている`stop_id`を参照します。<br>新しい`assigned_stop_id`によって、エンドユーザーの旅行体験が GTFS `stop_times.txt`で定義された`stop_id`と大幅に異なることはあってはなりません。言い換えれば、新しい停留所が追加のコンテキストなしでアプリ内に表示された場合は、エンドユーザーがこの新しい`stop_id`を`異常な変更`と見なすべきではありません。たとえば、このフィールドは、GTFS `stop_times.txt`で元々定義された停留所と同じ駅に属する`stop_id`を使用してプラットフォームの割り当てに使用することを目的としています。<br>リアルタイムの到着または出発の予測を提供せずに停留所を割り当てるには、このフィールドに値を入力し、 `StopTimeUpdate.schedule_relationship = NO_DATA`を設定します。<br>このフィールドに値を入力する場合は、 `StopTimeUpdate.stop_sequence`を入力する必要がありますが、 `StopTimeUpdate.stop_id`は入力しないでください。停車地の割り当ては、他の GTFS リアルタイム フィールドにも反映される必要があります (例: `VehiclePosition.stop_id`)。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |

### _message_ TripProperties 

旅行の更新されたプロパティを定義します

**注意:**このmessageはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。<br> .

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|---------------------------|----------------|-------------------|-------------------|
| **trip_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | (CSV) GTFS trips.txtで定義されている既存の旅行の複製であるが、異なるサービスdateおよび/または時刻 ( `TripProperties.start_date`および`TripProperties.start_time`を使用して定義) に開始する新しい旅行の識別子を定義します。(CSV) GTFS の`trips.trip_id`の定義を参照してください。その値は、(CSV) GTFS で使用されている値と異なる必要があります。このフィールドは、 `schedule_relationship`が`DUPLICATED`の場合に必須です。それ以外の場合、このフィールドに値を入力することはできず、コンシューマーによって無視されます。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **start_date** | [string](https:) | 条件付きで必須 | 1つ | 複製された旅行が実行されるサービスdate。YYYYMMDD 形式で提供するしなければならない。このフィールドは、 `schedule_relationship`が`DUPLICATED`の場合に必須です。それ以外の場合は、このフィールドに値を入力してはならず、コンシューマーによって無視されます。<br><br> **注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **start_time** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 | 重複している旅行の出発開始時刻を定義します。(CSV) GTFS の`stop_times.departure_time`の定義を参照してください。重複した旅行の予定到着時刻と出発時刻は、元の旅行の`departure_time`とこのフィールドのオフセットに基づいて計算されます。たとえば、GTFS の旅程に停車地 A の`departure_time`が`10:00:00` 、停車地 B の`departure_time`が`10:01:00`で、このフィールドに`10:30:00`の値が入力されている場合、複製された旅程の停車地 B のスケジュールされた`departure_time`は`10:31:00`になります。リアルタイム予測の`delay`値は、この計算されたスケジュール時間に適用され、予測時間を決定します。たとえば、停車地 B の出発`delay`が`30`の場合、予測される出発時刻は`10:31:30`です。リアルタイム予測の`time`値にはオフセットが適用されず、提供された予測時間を示します。たとえば、停留所 B の出発`time`が` 10:31:30 と指定されている場合、予測出発時刻は`10:31:30` になります。このフィールドは、 `schedule_relationship`が`DUPLICATED`の場合に必須です。それ以外の場合、このフィールドに値を入力することはできず、消費者によって無視されます。<br><br> **注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **shape_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | この旅程の車両移動経路の形状が元のものと異なる場合に、その形状を指定します。(CSV) GTFS で定義された形状、またはリアルタイム フィードの新しい形状エンティティを参照します。(CSV) GTFS の`trips.shape_id`の定義をご覧ください。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |

### _message_ VehiclePosition 

特定の車両のリアルタイム位置情報。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ*

*_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **trip** | [TripDescriptor](#message-tripdescriptor) |任意| 1 つ | この車両が運行する運行。特定の運行インスタンスで車両を識別できない場合は、空または一部を指定できます。 |
| **vehicle** | [VehicleDescriptor](#message-vehicledescriptor) |任意| 1 つ | この運行に運行する車両に関する追加情報。各エントリには、**一意の** 車両 ID が必要です。 |
| **position** | [Position](#message-position) |任意| 1 つ | この車両の現在の位置。 |
| **current_stop_sequence** | [uint32](https:) |任意| 1 つ |現在の停車地の停車シーケンス インデックス。current_stop_sequence (つまり、それが参照する停車地) の意味は、current_status によって決まります。current_status が指定されていない場合は、IN_TRANSIT_TO が想定されます。|
| **stop_id** | [string](https:) |任意| 1 つ | 現在の停車地を識別します。値は、対応する GTFS フィード内のstops.txtと同じである必要があります。`StopTimeProperties.assigned_stop_id` を使用して`stop_id`を割り当てる場合は、このフィールドに`stop_id`の変更も反映させる必要があります。|
| **current_status** | [VehicleStopStatus](#enum-vehiclestopstatus) |任意| 1 つ | 現在の停車地に関する車両の正確なステータス。current_stop_sequence が指定されていない場合は無視されます。|
| **timestamp** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 車両の位置が測定された瞬間。POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。 |
| **congestion_level** | [CongestionLevel](#enum-congestionlevel) |任意| 1 つ |
| **occupancy_status** | [OccupancyStatus](#enum-occupancystatus) | _オプション_ | 1 つ | 車両または客車の乗客の占有状態。multi_carriage_details に客車ごとのOccupancyStatusが設定されている場合、このフィールドは、乗客を受け入れるすべての客車を考慮して車両全体を記述する必要があります。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。|
| **occupancy_percentage** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 車両内の乗客の占有率を示すパーセンテージ値。値 100 は、座席と立席の両方の定員を含む、車両が設計された最大占有率を表し、現在の運行規則で許可されています。設計された最大定員よりも多くの乗客がいる場合、値は 100 を超えることがあります。occupancy_percentage の精度は、個々の乗客が車両に乗り降りするのを追跡できないほど低くする必要があります。multi_carriage_details に車両ごとの occupancy_percentage が設定されている場合、このフィールドは、乗客を受け入れるすべての車両を考慮して車両全体を記述する必要があります。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **multi_carriage_details** | [CarriageDetails](#message-carriagedetails) |任意| 多数 | この車両の複数の客車の詳細。最初の出現は、**現在の移動方向を前提として**、車両の最初の客車を表します。multi_carriage_details フィールドの出現回数は、車両の客車数を表します。また、機関車、保守用車両など、乗客がプラットフォームのどこに立つべきかに関する貴重な情報を提供する、乗車できない車両も含まれます。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |


### _enum_ VehicleStopStatus 

**値**

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| **INCOMING_AT** | 車両が停車場に到着しようとしています (停車場表示では、通常、車両のシンボルが点滅します)。 |
| **STOPPED_AT** | 車両が停車場に停止しています。 |
| **IN_TRANSIT_TO** | 車両が前の停車場を出発し、移動中です。 |

### _enum_ CongestionLevel 

この車両に影響を与えている混雑レベル。

**値**

| _**値**_ |
|-------------|
| **UNKNOWN_CONGESTION_LEVEL** |
| **RUNNING_SMOOTHLY** |
| **STOP_AND_GO** |
| **CONGESTION** |
| **SEVERE_CONGESTION** |

### _enum OccupancyStatus_

車両または客車の乗客の占有状態。

個々のプロデューサーは、すべてのOccupancyStatus値を公開しない場合があります。したがって、コンシューマーは、 OccupancyStatus値が線形スケールに従うと想定してはなりません。コンシューマーは、プロデューサーが示し意図した状態としてOccupancyStatus値を表す必要があります。同様に、プロデューサーは、実際の車両占有状態に対応するOccupancyStatus値を使用する必要があります。

線形スケールでの乗客の占有レベルを説明するには、 `occupancy_percentage`を参照してください。

**注意:**このフィールドはまだ **実験的** であり、変更される可能性があります。将来、正式に採用される可能性があります。

***値***

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| _ **EMPTY**_ | _ほとんどの基準では車両が空であるとみなされ、乗客はほとんどいないか、まったくいませんが、乗客を受け入れています。_ |
| _ **MANY_SEATS_AVAILABLE**_ | _車両または客車の空席数が多い。使用可能な総座席数のうち、このカテゴリに該当するほど空いている座席の数は、プロデューサーの裁量で決定されます。_ |
| _ **FEW_SEATS_AVAILABLE**_ | _車両または客車の空席数が少ない。使用可能な総座席数のうち、このカテゴリに該当するほど空いている座席の数は、プロデューサーの裁量で決定されます。_ |
| _ **STANDING_ROOM_ONLY**_ | _現在、車両または客車は立っている乗客のみを収容できます。_ |
| _ **CRUSHED_STANDING_ROOM_ONLY**_ | _現在、車両または客車は立っている乗客のみを収容でき、立っている乗客のためのスペースが限られています。_ |
| _ ****FULL** _ | _ほとんどの基準では車両は満席とみなされますが、乗客の乗車は許可されている可能性があります。_ |
| _ **NO_DATA_AVAILABLE****NOT_ACCEPTING_PASSENGERS**** _ | _車両または客車は乗客を受け入れていません。車両または客車は通常、乗客の乗車を受け入れます。_ |
| _ **NOT_BOARDABLE**_ | _車両または客車は乗車できず、乗客を受け入れることはありません。特別な車両や客車（エンジン、メンテナンス用客車など）に役立ちます。_ |


### _message_ CarriageDetails 

複数の客車で構成された車両に使用される、客車固有の詳細。

**注意:**このmessageはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 客車の ID。車両ごとに一意である必要があります。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **label** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 車両を識別するために乗客に表示される、ユーザーに表示されるラベル。例: "7712"、"Car ABC-32" など...<br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **occupancy_status** | [OccupancyStatus](#enum-occupancystatus) |任意| 1 つ | この車両のこの車両の乗車状況。デフォルトは`NO_DATA_AVAILABLE`に設定されています。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。|
| **occupancy_percentage** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 | この車両のこの車両の占有率。"VehiclePosition.occupancy_percentage" と同じルールに従います。この車両のデータが利用できない場合は -1 を使用します。<br><br> **注意:**このフィールドはまだ **実験的** であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **carriage_sequence** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 | 車両の CarriageStatus リスト内の他の車両に対するこの車両の順序を識別します。移動方向の最初の車両の値は1.である必要があります。2 番目の値は移動方向の 2 番目の車両に対応し、値 2 である必要があります。以下同様です。たとえば、移動方向の最初の車両の値は1.です。移動方向の 2 番目の車両の値が 3 の場合、コンシューマーはすべての車両のデータ (つまり、multi_carriage_details フィールド) を破棄します。データのないキャリッジは、有効な carrier_sequence 番号で表す必要があり、データのないフィールドは省略する必要があります (代わりに、それらのフィールドを含めて、`データなし`の値に設定することもできます)。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |

### _message_ Alert

公共交通機関ネットワークで何らかのインシデントが発生したことを示すアラート。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **active_period** | [TimeRange](#message-timerange) |任意| 複数 | アラートをユーザーに示す時間。指定しない場合は、フィードに表示される限りアラートが表示されます。複数の範囲が指定されている場合は、そのすべての範囲でアラートが表示されます。 |
| **informed_entity** | [EntitySelector](#message-entityselector) |必須| 複数 | このアラートをユーザーに通知する必要があるエンティティ。少なくとも 1 つの inform_entity を指定する必要があります。|
| **cause** | [Cause](#enum-cause) |条件付きで必須| 1 つ | cause_detail が含まれている場合は、Cause も含める必要があります。
| **cause_detail** | [TranslatedString](#message-translatedstring) |任意| 1 つ | アラートの原因の説明。機関固有の言語を使用できます。Cause よりも具体的です。cause_detail が含まれている場合は、Cause も含める必要があります。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。
| **effect** | [Effect](#enum-effect) |条件付きで必須| 1 つ | effect_detail が含まれている場合は、Effect も含める必要があります。
| **effect_detail** | [TranslatedString](#message-translatedstring) |任意| 1 つ | アラートの効果の説明。機関固有の言語を使用できます。Effect よりも具体的です。effect_detail が含まれている場合は、Effect も含める必要があります。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。
| **url** | [TranslatedString](#message-translatedstring) |任意| 1 つ | アラートに関する追加情報を提供する URL。|
| **header_text** | [TranslatedString](#message-translatedstring) |必須| 1 つ | アラートのヘッダー。このプレーン テキストstringは、たとえば太字で強調表示されます。|
| **description_text** | [TranslatedString](#message-translatedstring) |必須| 1 つ | アラートの説明。このプレーン テキストstringは、アラートの本文としてフォーマットされます (または、ユーザーによる明示的な`展開`要求で表示されます)。説明の情報は、ヘッダーの情報に追加される必要があります。|
| **tts_header_text** | [TranslatedString](#message-translatedstring) |任意| 1 つ |音声合成実装に使用されるアラートのヘッダーを含むText。このフィールドは、header_text の音声合成バージョンです。header_text と同じ情報を含める必要がありますが、音声合成として読み取れる形式にする必要があります (たとえば、省略形は削除、数字はスペルアウトなど)。|
| **tts_description_text** | [TranslatedString](#message-translatedstring) |任意| 1 つ | 音声合成実装に使用されるアラートの説明を含むText。このフィールドは、description_text の音声合成バージョンです。description_text と同じ情報を含める必要がありますが、音声合成として読み取れる形式にする必要があります (たとえば、省略形は削除、数字はスペルアウトなど)。|
| **severity_level** | [SeverityLevel](#enum-severitylevel) |任意| 1 つ | アラートの重大度。 |
| **image** | [TranslatedImage](#message-translatedimage) |任意| 1 つの | 警告テキストとともに表示されるTranslatedImage 。迂回、駅の閉鎖などの警告効果を視覚的に説明するために使用されます。画像は警告の理解を深めるものであり、重要な情報の唯一の場所であってはなりません。次の種類の画像は推奨されません : 主にテキストを含む画像、追加情報を含まないマーケティングまたはブランド画像。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **image_alternative_text** | [TranslatedString](#message-translatedstring) |任意| 1つ | `image`フィールドでリンクされた画像の外観を説明するText(たとえば、画像を表示できない場合や、アクセシビリティ上の理由でユーザーが画像を見ることができない場合など)。HTML [alt 画像のテキストの仕様](https:) を参照してください。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |


### _enum_ Cause

このアラートの原因。

**値**

| _**値**_ |
|-------------|
| ** **UNKNOWN_CAUSE** **OTHER_CAUSE** ** |
| **TECHNICAL_PROBLEM** |
| ** **STRIKE** **DEMONSTRATION** |
| **ACCIDENT** |
| ** **HOLIDAY** |
| **WEATHER** |
| **MAINTENANCE** |
| **CONSTRUCTION** |
| **POLICE_ACTIVITY** |
| **MEDICAL_EMERGENCY** |

### _enum_ Effect

この問題が影響を受けるエンティティに与える影響。

**Values**

| _**Value**_ |
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
| ** **ACCESSIBILITY_ISSUE** |

### _enum_ SeverityLevel 

アラートの重大度。

**注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来、正式に採用される可能性があります。

**値**

| _**値**_ |
|-------------|
| **UNKNOWN_SEVERITY** |
| **INFO** |
| **WARNING** |
| **SEVERE** |

### _message_ TimeRange 

時間間隔。`t` が開始時刻以上で終了時刻未満の場合、時間`t`で間隔はアクティブであると見なされます。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **start** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) |TimeRange付きで必須 | 1 つ | 開始時刻、POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。指定されていない場合、間隔はマイナス無限大で始まります。TimeRange が指定されている場合は、start または end のいずれかを指定する必要があります。両方のフィールドを空にすることはできません。|
| **end** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | 終了時刻、POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。指定されていない場合、TimeRangeはプラス無限大で終了します。TimeRange が指定されている場合は、start または end のいずれかを指定する必要があります。両方のフィールドを空にすることはできません。 |

### _message_Position

車両の地理的位置。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|---------------------------|----------------|-------------------|-------------------|
| **latitude** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 | WGS-84 座標系での北緯。 |
| **longitude** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 | WGS-84 座標系での東経。 |
| **bearing** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 真北から時計回りの度数で表した方位。つまり、0 は北、90 は東です。これはコンパス方位、または次の停止地点または中間地点への方向になります。これは、クライアントが以前のデータから計算できる以前の位置のシーケンスから推測されるべきではありません。 |
| **odometer** | [double](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 走行距離計の値 (メートル単位)。 |
| **speed** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 車両によって測定された瞬間速度 (メートル/秒単位)。 |

### _message_ TripDescriptor 

GTFS 旅行の単一のインスタンスを識別する記述子。

単一の旅行インスタンスを指定するには、多くの場合、 `trip_id`だけで十分です。ただし、次の場合には、単一の旅行インスタンスを解決するために追加の情報が必要です:

* frequencies.txtで定義されている旅行の場合、 `trip_id`に加えて`start_date`と`start_time` が必要です。
* 旅行が 24 時間以上続く場合、または翌日の予定旅行と重なるように遅れる場合は、 `trip_id`に加えて`start_date` が必要です。
* `trip_id`フィールドを指定できない場合は、 `route_id`、 `direction_id`、 `start_date`、および`start_time` をすべて指定する必要があります。

すべての場合において、 `trip_id`に加えて`route_id`を指定する場合、 `trip_id` `route_id`は` GTFS trips.txtで特定の旅行に割り当てられた`route_id`と同じである必要があります。

`trip_id` フィールドは、単独でも、または次のフィールドと組み合わせても、他のTripDescriptorフィールドは、複数の旅行インスタンスを識別するために使用できます。たとえば、GTFS frequencies.txt exact_times=0 の旅行の場合、 TripDescriptorはtrip_idを単独で指定しないでください。start_time も、特定の時刻に開始する単一の旅行インスタンスに解決される必要があるためです。TripDescriptorが単一の旅行インスタンスに解決されない場合 (つまり、0 個以上の旅行インスタンスに解決される場合)、エラーと見なされ、エラーのあるTripDescriptorを含むエンティティはコンシューマーによって破棄される場合があります。

trip_idが不明な場合は、 TripUpdateの駅シーケンス ID では不十分であり、stop_id も提供する必要があります。さらに、絶対的な到着/出発時刻も提供する必要がありますTripDescriptor.route_id は、ルートのすべての旅行に影響するルート全体のアラートを指定する Alert EntitySelector内では使用できません。代わりにEntitySelector.route_id を使用してください。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **trip_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | このセレクタが参照する GTFS フィードのtrip_id 。非定期運行の旅程 (GTFS frequencies.txtで定義されていない旅程) の場合、このフィールドだけで旅程を一意に識別できます。GTFS frequencies.txtで定義されている定期運行の旅程の場合、 trip_id、start_time、start_date はすべて必須です。スケジュールベースの旅程（GTFS frequencies.txtで定義されていない旅程）の場合、 trip_id を省略できるのは、 route_id、 direction_id 、 start_time 、 start_date の組み合わせによって旅程を一意に識別でき、それらのフィールドがすべて指定されている場合のみです。 schedule_relationship がTripUpdate内で DUPLICATED の場合、 trip_id は複製される静的 GTFS からの旅程を識別します。 schedule_relationship がVehiclePosition内で DUPLICATED の場合、 trip_idは複製される新しい旅程を識別し、対応するTripUpdateの値を含める必要があります。 TripProperties。 trip_id。 |
| **route_id** | [string](https:) | 条件付きで必須 | 1 つ | このセレクタが参照する GTFS からのroute_id 。 trip_idを省略した場合、 route_id 、 direction_id、 start_time、および schedule_relationship=SCHEDULED をすべて設定して、旅程インスタンスを識別する必要があります。ルートのすべての旅程に影響するルート全体のアラートを指定するために、 Alert EntitySelector内でTripDescriptor.route_idを使用しないでください。代わりにEntitySelector.route_id を使用してください。 |
| **direction_id** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | GTFS フィードのtrips.txtファイルの direction_id。このセレクタが参照する旅程の移動方向を示します。trip_idを省略した場合、 direction_id を指定する必要があります。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。<br> |
| **start_time** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 | この旅程インスタンスの当初の予定開始時刻。trip_idが非頻度ベースの旅程に対応する場合、このフィールドは省略するか、GTFS フィードの値と同じにする必要があります。trip_idがGTFS frequencies.txtで定義された頻度ベースの旅程に対応する場合、start_time は必須であり、旅程の更新と車両の位置のために指定する必要があります。旅程が exact_times=1 の GTFS レコードに対応する場合、start_time は対応する期間のfrequencies.txtの start_time より headway_secs の倍数 (0 を含む) 後にする必要があります。旅程が exact_times=0 に対応する場合、start_time は任意でかまいませんが、当初は旅程の最初の出発時刻になると予想されます。一度設定されると、この頻度ベースの exact_times=0 の旅程の start_time は、最初の出発時刻が変更された場合でも不変と見なす必要があります。その時間変更は、代わりにStopTimeUpdateに反映される場合があります。trip_idを省略する場合は、start_time を指定する必要があります。フィールドの形式とセマンティクスは、GTFS/frequencies.txt/start_time と同じです (例: 11:15:35 または 25:15:35)。|
| **start_date** | [string](https:) | 条件付きで必須 | 1 つ | この旅程インスタンスの開始date(YYYYMMDD 形式)。スケジュールされた旅程 (GTFS frequencies.txtで定義されていない旅程) の場合、翌日のスケジュールされた旅程と重なるほど遅れている旅程を明確にするために、このフィールドを指定する必要があります。たとえば、毎日 8:00 と 20:00 に出発し、12 時間遅れている列車の場合、同じ時間に 2 つの異なる旅行があることになります。このフィールドは指定できますが、このような衝突が不可能なスケジュールでは必須ではありません。たとえば、1 時間遅れている車両はスケジュールとは関係がないと見なされる、1 時間ごとのスケジュールで実行されるサービスなどです。このフィールドは、GTFS frequencies.txtで定義されている頻度ベースの旅行に必須です。trip_idが省略されている場合は、start_date を指定する必要があります。|
| **schedule_relationship** | [ScheduleRelationship](#enum-schedulerelationship_1) |任意| 1 つ | この旅行と静的スケジュールの関係。TripDescriptorがAlert `EntitySelector`で指定されている場合、一致する旅行インスタンスを識別するときに、 `schedule_relationship`フィールドはコンシューマーによって無視されます。

### _enum_ ScheduleRelationship 

この旅行と静的スケジュールの関係。旅程が GTFS に反映されていない臨時スケジュールに従って行われる場合、SCHEDULED ではなく ADDED としてマークする必要があります。

**値**

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| **SCHEDULED** | GTFS scheduleに従って実行されている旅程、またはスケジュールされた旅程に十分近いためそれに関連付けられている旅程。|
| **ADDED** | 故障した車両の交換や突然の乗客の増加に対応するためなど、実行スケジュールに加えて追加された旅程。*注: 現在、このモードを使用するフィードの動作は指定されていません。 GTFS GitHub [(1)](https://github.com/google/transit/issues/106) [(2)](https://github.com/google/transit/pull/221) [(3)](https://github.com/google/transit/pull/219) では、ADDED 旅行を完全に指定するか廃止するかについて議論されており、その議論が確定次第、ドキュメントが更新される予定です。* |
| **UNSCHEDULED** |スケジュールが関連付けられていない運行中の旅程です。この値は、GTFS frequencies.txtで exact_times = 0 と定義されている旅程を識別するために使用されます。GTFS frequencies.txtで定義されていない旅程や、GTFS frequencies.txtで exact_times = 1.と定義されている旅程を説明するために使用しないでください。`schedule_relationship : `schedule_relationship: UNSCHEDULED` の便では、すべての StopTimeUpdates も`schedule_relationship: UNSCHEDULED` に設定する必要があります。|
| **CANCELED** | スケジュールに存在していたが削除された旅程。|
| **DUPLICATED** | サービス開始dateを除き、既存のスケジュールされた旅程と同じ新しい旅程。 `TripUpdate.TripProperties.trip_id`、 `TripUpdate.TripProperties.start_date`、および`TripUpdate.TripProperties.start_time`と一緒に使用して、静的 GTFS から既存の旅程をコピーしますが、開始日は異なるサービスdateおよび/または時刻にします。(CSV) GTFS ( `calendar.txt`または`calendar_dates.txt`内) 内の元の旅程に関連するサービスが今後 30 日以内に運行される場合、旅程の複製が許可されます。複製する旅程は、 `TripUpdate.TripDescriptor.trip_id`によって識別されます。<br><br>この列挙は、 `TripUpdate.TripDescriptor.trip_id`によって参照される既存の旅程を変更しません。プロデューサーが元の旅程をキャンセルする場合は、CANCELED の値を持つ別の`TripUpdate`を公開する必要があります。GTFS `frequencies.txt`で定義されている便で、 `exact_times`が空または `0` に等しいものは複製できません。新しい旅程の`VehiclePosition.TripDescriptor.trip_id`には、`TripUpdate.TripProperties.trip_id`の一致する値が含まれている必要があり、 `VehiclePosition.TripDescriptor.ScheduleRelationship`も`DUPLICATED`に設定する必要があります。<br><br> *重複した旅行を表すために ADDED 列挙を使用していた既存のプロデューサーとコンシューマーは、[移行ガイド](../../realtime/examples//migration-duplicated) に従って DUPLICATED 列挙に移行する必要があります。* |
| **DELETED** | スケジュールに存在していたが削除された旅行で、ユーザーに表示してはいけません。<br><br>交通機関プロバイダーが、対応する旅行に関する情報を消費アプリケーションから完全に削除し、乗客に旅行がキャンセルされたと表示されないようにするには、CANCELED の代わりに DELETED を使用する必要があります。たとえば、旅行が別の旅行に完全に置き換えられる場合などです。この指定は、複数の旅行がキャンセルされ、代替サービスに置き換えられる場合に特に重要になります。消費者がキャンセルに関する明示的な情報を表示すると、より重要なリアルタイム予測が妨げられてしまいます。<br><br> **注意:**このフィールドはまだ **実験的** であり、変更される可能性があります。将来正式に採用される可能性があります。 |

### _message_ VehicleDescriptor 

旅行を実行する車両の識別情報。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 車両の内部システム ID。車両ごとに **一意** である必要があり、システム内を進む車両を追跡するために使用されます。この ID は、エンドユーザーには表示しないでください。そのためには、**label**フィールドを使用します |
| **label** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | ユーザーに表示されるラベル。つまり、正しい車両を識別するために乗客に表示する必要があるもの。 |
| **license_plate** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 車両のナンバー プレート。 |
| **wheelchair_accessible** | [WheelchairAccessible](#enum-wheelchairaccessible) |任意| 1 つ | 指定されている場合、静的 GTFS の *wheelchair_accessible* 値を上書きできます。 |

### _enum_ WheelchairAccessible 

特定の旅行が車椅子でアクセス可能かどうか。利用可能な場合、この値は静的 GTFS の _wheelchair_accessible_ 値を上書きします。

##### 値

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| **NO_VALUE** | 旅行には車椅子でのアクセスに関する情報がありません。これは **デフォルト** の動作です。静的 GTFS に _wheelchair_accessible_ 値が含まれている場合、上書きされません。|
| **UNKNOWN** | 旅行にはアクセシビリティ値が存在しません。この値は GTFS の値を上書きします。|
| **WHEELCHAIR_ACCESSIBLE** | 旅行は車椅子でアクセスできます。

s の値は GTFS の値を上書きします。 |
| **WHEELCHAIR_INACCESSIBLE** | 旅行は車椅子でアクセスできません。この値は GTFS の値を上書きします。 |

### _message_ EntitySelector 

GTFS フィード内のエンティティのセレクター。フィールドの値は、GTFS フィード内の適切なフィールドに対応している必要があります。少なくとも 1 つの指定子を指定する必要があります。複数指定した場合は、論理`AND`演算子で結合されていると解釈されます。また、指定子の組み合わせは、GTFS フィード内の対応する情報と一致する必要があります。つまり、GTFS 内のエンティティにアラートを適用するには、提供されているEntitySelectorフィールドのすべてと一致する必要があります。たとえば、フィールド`route_id: "5"`および`route_type: "3"`r` は、 `route_id: "5"`バスにのみ適用され、 `route_type: "3"`の他のルートには適用されません。プロデューサーがアラートを`route_id: "5"`と`route_type: "3"`の両方に適用する場合、 ` `route_id: "5"`" ` を参照する EntitySelector と ` `route_type: "3"`"` を参照する EntitySelector を別々に 2 つ提供する必要があります。

少なくとも 1 つの指定子を指定する必要があります。EntitySelector のすべてのフィールドを空にすることはできません。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **agency_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | このセレクタが参照する GTFS フィードの agency_id。
| **route_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | このセレクタが参照する GTFS のroute_idが指定されている場合は、 route_idも指定する必要があります。
| **route_type** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ |このセレクタが参照する GTFS の route_type。
| **direction_id** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | GTFS フィードtrips.txtファイルの direction_id。route_id で指定されたルートの 1 方向のすべてのルートを選択するために使用されますroute_idが指定されている場合は、 route_idも指定する必要があります。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。<br> |
| **trip** | [TripDescriptor](#message-tripdescriptor) | 条件付きで必須 | 1 つ | このセレクタが参照する GTFS の旅程インスタンス。このTripDescriptor は、GTFS データ内の単一の旅程インスタンスに解決される必要があります (たとえば、プロデューサーは exact_times=0 の旅程に対してtrip_idのみを提供することはできません)。このTripDescriptor内にScheduleRelationshipフィールドが設定されている場合、コンシューマーが GTFS の旅程を識別しようとすると無視されます。
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | このセレクタが参照する GTFS フィードの stop_id。

### _message_ TranslatedString 

テキストのスニペットまたは URL の言語別バージョンを含む国際化message。messageから文字列の 1 つが取得されます。解決は次のように進行します: UI 言語が翻訳の言語コードと一致する場合、最初に一致する翻訳が選択されます。デフォルトの UI 言語 (例: 英語) が翻訳の言語コードと一致する場合、最初に一致する翻訳が選択されます。翻訳に未指定の言語コードがある場合は、その翻訳が選択されます。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **translation** | [Translation](#message-translation) |必須| 多数 | 少なくとも 1 つの翻訳を指定する必要があります。|

### _message_ 翻訳

言語にマップされたローカライズされたstring。

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **text**string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ |messageを含む UTF-8string。 |
| **language** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1つ | BCP-47 言語コード。言語が不明な場合、またはフィードに対して国際化が行われていない場合は省略できます。最大で 1 つの翻訳に未指定の言語タグを指定できます。翻訳が複数ある場合は、言語を指定する必要があります。 |

### _メッセージ_ TranslatedImage 

言語ごとの画像を含む国際化されたmessage。messageからの画像が 1 つ取得されます。解決は次のように進行します: UI 言語が翻訳の言語コードと一致する場合、最初に一致する翻訳が選択されます。デフォルトの UI 言語 (例: 英語) が翻訳の言語コードと一致する場合、最初に一致する翻訳が選択されます。翻訳に未指定の言語コードがある場合は、その翻訳が選択されます。

**注意:**このmessageはまだ **実験的** であり、変更される可能性があります。将来、正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **localized_image** | [LocalizedImage](#message-localizedimage) |必須| 多数 | 少なくとも 1 つのローカライズされた画像を指定する必要があります。 |

### _message_ LocalizedImage 

言語にマップされたローカライズされたイメージの URL。

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **url** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | イメージにリンクする URL を含む文字列。リンクされるイメージは 2 MB 未満である必要があります。イメージが大幅に変更され、コンシューマー側で更新が必要になる場合、プロデューサーは URL を新しいものに更新する必要があります。<br><br> URL は http://または https://を含む完全修飾 URL である必要があり、URL 内の特殊文字は正しくエスケープする必要があります。完全修飾 URL 値の作成方法については、次の http://www.w3.org/Addressing/URL/4_URI_Recommentations.html を参照してください。 |
| **media_type** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | 表示する画像のタイプを指定するための IANA メディア タイプ。タイプは "image/" で始まる必要があります。 |
| **language** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件付きで必須 | 1 つ | BCP-47 言語コード。言語が不明な場合、またはフィードに対して国際化が行われていない場合は省略できます。最大で 1 つの翻訳に未指定の言語タグを指定できます。翻訳が複数ある場合は、言語を指定する必要があります。 |

### _message_ シェイプ

シェイプが (CSV) GTFS の一部ではない場合 (アドホック迂回など) に車両がたどる物理的な経路を説明します。ルート形状は便に属し、より効率的な送信のためにエンコードされたポリラインで構成されます。ルート形状は停留所等の位置を正確に横切る必要はありませんが、トリップ上のすべての停留所等は、そのトリップのシェイプからわずかな距離内、つまりシェイプ ポイントを結ぶ直線セグメントの近くに配置する必要があります。

<br><br> **注意:**このmessageはまだ**試験的**であり、変更される可能性があります。将来正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **shape_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | シェイプの識別子。(CSV) GTFS で定義されている`shape_id`とは異なるしなければならない。<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。 |
| **encoded_polyline** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | シェイプのエンコードされたポリライン表現。このポリラインには少なくとも 2 つのポイントが含まれている必要があります。エンコードされたポリラインの詳細については、https://developers.google.com/maps/documentation/utilities/polylinealgorithm をご覧ください。<br><br> **注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用される可能性があります。|

### _message_ 停留所

フィードに動的に追加された新しい停留所を表します。すべてのフィールドは、(CSV) GTFS 仕様で説明されているとおりです。新しい停留所の場所タイプは `0` (ルート可能な停留所) です。

<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | 停留所の識別子。(CSV) GTFS で定義されている`stop_id`と異なるしなければならない。|
| **stop_code** | [TranslatedString](#message-translatedstring) |任意| 1 つ | (CSV) GTFS の [stops.stop_code](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **stop_name** | [TranslatedString](#message-translatedstring) |必須| 1 つ | (CSV) GTFS の [stops.stop_name](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **tts_stop_name** | [TranslatedString](#message-translatedstring) |任意| 1 つ | (CSV) GTFS の [stops.tts_stop_name](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **stop_desc** | [TranslatedString](#message-translatedstring) |任意| 1 つ | (CSV) GTFS の [stops.stop_desc](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **stop_lat** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | (CSV) GTFS の [stops.stop_lat](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **stop_lon** | [float](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | (CSV) GTFS の [stops.stop_lon](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **zone_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | (CSV) GTFS の [stops.zone_id](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **stop_url** | [TranslatedString](#message-translatedstring) |任意| 1 つ | (CSV) GTFS の [stops.stop_url](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **parent_station** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | (CSV) GTFS の [stops.parent_station](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **stop_timezone** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | (CSV) GTFS の [stops.stop_timezone](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **wheelchair_boarding** | [WheelchairBoarding](#enum-wheelchairboarding) |任意| 1 つ | (CSV) GTFS の [stops.wheelchair_boarding](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
| **level_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | (CSV) GTFS の [stops.level_id](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |
| **platform_code** | [TranslatedString](#message-translatedstring) |任意| 1 つ | (CSV) GTFS の [stops.platform_code](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。 |

### _enum_ WheelchairBoarding 

**Values**

| _**Value**_ | _**Comment**_ |
|-------------|---------------|
| **UNKNOWN** | 停留所のアクセシビリティ情報がありません。 |
| **AVAILABLE** |この停留所の一部の車両には、車椅子の乗客が乗車できます。 |
| **NOT_AVAILABLE** | この停留所では車椅子での乗車はできません。 |

### _message_ TripModifications `TripModifications`messageは、迂回などの特定の変更の影響を受ける類似の旅行のリストを示します。

<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来、正式に採用される可能性があります。

[旅行の変更についての詳細...](../../../documentation/realtime/feed_entities/trip-modifications)

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **selected_trips** | [SelectedTrips](#message-selectedtrips) |必須| 多数 | このTripModificationsの影響を受ける選択された旅行のリスト。少なくとも 1 つの `SelectedTrips ` を含める必要があります。値 `start_times` が設定されている場合、1 つのtrip_idを持つ ` SelectedTrips ` を最大 1 つリストできます。 |
| **start_times** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 多数 | trip_ids で定義されたtrip_idのリアルタイム旅行記述子の開始時刻のリスト。頻度ベースの旅行でtrip_idの複数の出発をターゲットにするのに役立ちます。 |
| **service_dates** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 多数 | 変更が発生する日付 (YYYYMMDD 形式)。trip_idは、特定のサービスdateに実行される場合にのみ変更されます。旅行はすべてのサービス日に実行する必要はありません。プロデューサーは、次の 1 週間以内に発生する迂回のみを送信する必要がするべきである。提供された日付は、ユーザー向けの情報として使用しないでください。ユーザー向けの開始日と終了dateを提供する必要がある場合は、リンクされたサービスアラートで `service_alert_id` を使用して提供できます。 |
| **modifications** | [Modification](#message-modification) |必須| 多数 | 影響を受ける旅行に適用する変更のリスト。 |

### _message_Modification

`Modification`messageは、`start_stop_selector` から始まる、影響を受ける各旅行への変更について説明します。

<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。

<img src="../../../assets/trip_modification.png"> 

特定の旅行に対する変更の効果を示す例。この変更は、他のいくつかの旅行にも適用される場合があります。_

<img src="../../../assets/propagated_delay.png"> 

伝播された迂回遅延は、変更の終了後にすべての停車地に影響します。旅行に複数の変更がある場合、遅延は累積されます。_


**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **start_stop_selector** | [StopSelector](#message-stopselector) |必須| 1 つ | この変更によって影響を受ける元の旅行の最初の停車地の停車地セレクター。`end_stop_selector` と組み合わせて使用​​します。`start_stop_selector` は必須であり、`travel_time_to_stop` で使用される参照停車地を定義するために使用されます。詳細については、[`travel_time_to_stop`](#message-replacementstop) を参照してください |
| **end_stop_selector** | [StopSelector](#message-stopselector) | 条件付きで必須 | 1 つ | この変更によって影響を受ける元の旅行の最後の停車地の停車地セレクター。選択は包括的であるため、その変更によって 1 つの stop_time のみが置き換えられる場合は、`start_stop_selector` と `end_stop_selector` は同等である必要があります。stop_time が置き換えられない場合は、`end_stop_selector` を指定しないでください。それ以外の場合は必須です。 |
| **propagated_modification_delay** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | 変更によって挿入された最後の停車地の後のすべての出発時刻と到着時刻に追加する遅延の秒数。変更がシェイプのみに影響する場合 (つまり、`end_stop_selector` も `replacement_stops` も指定されていない場合)、遅延の伝播は `start_stop_selector` の後続の停車地から開始されます。正または負の数値を指定できます。同じ旅行に複数の変更が適用されると、旅行が進むにつれて遅延が蓄積されます。<br/><br/>値が指定されていない場合、コンシューマーは他のデータに基づいて `propagated_modification_delay` を補間または推測するしてもよい。 |
| **replacement_stops** | [ReplacementStop](#message-replacementstop) |任意| 複数 | 元の旅行の停留所を置き換える代替停留所のリスト。新しい停車時刻の長さは、置き換えられた停車時刻の数より短くなったり、同じになったり、長くなったりすることがあります。 |
| **service_alert_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | ユーザー向けの通信用にこのModificationを説明する`Alert`を含む`FeedEntity`messageからの`id`値。 |
| **last_modified_time** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ |このタイムスタンプは、変更が最後に行われた瞬間を識別します。POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数) です。|

### _message_ StopSelector 

停止のセレクター`stop_id`または`stop_sequence`のいずれか。2 つの値のうち少なくとも 1 つを指定する必要があります。

<br><br> **注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **stop_sequence** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1 つ | 対応する GTFS フィードのstop_times.txtと同じであるしなければならない。`StopSelector` 内では`stop_sequence`または`stop_id` のStopSelectorかを指定する必要があります。両方のフィールドを空にすることはできません。 `stop_sequence` は、同じ stop_id を複数回訪れるルート (ループなど) で、予測の対象となる停留所を明確にするために必要です。|
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1 つ | 対応する GTFS フィードのstops.txtと同じであるしなければならない。`StopSelector` 内では`stop_sequence`または`stop_id` のStopSelectorかを指定する必要があります。両方のフィールドを空にすることはできません。|

### _message_ SelectedTrips 

関連するシェイプを持つ選択されたルートのリスト。

<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **trip_ids** | [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 多数 | 1 つ | 元の (CSV) GTFS のtrip_idのリストで、含まれている置換によって影響を受けます。少なくとも 1 つのtrip_idを含める必要があります。|
| **shape_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ |このSelectedTripsで変更された旅程の新しいシェイプのID-RT Shapemessageを使用して追加された新しいシェイプ、または GTFS-Static フィードのshapes.txtで定義されている既存のシェイプを参照する場合があります。|

### _message_ ReplacementStop 

各`ReplacementStop`messageは、旅程で今後訪問する停留所を定義し、オプションで停留所までの推定移動時間を指定します。

<br><br> **注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。

<img src="../../../assets/first_stop_reference.png"> 

変更が旅程の最初の停車地に影響する場合、その停車地は変更の参照停車地としても機能します。_


**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **stop_id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | 旅程で今後訪問される代替の停車地ID-RT の`Stop`messageを使用して追加された新しい停車地、または (CSV) GTFS フィードの``stops.txt``で定義されている既存の停車地を参照する場合があります。停車地には``location_type=0`` (ルート可能な停車地) がしなければならない。|
| **travel_time_to_stop** | [int32](https:) |任意| 1 つ | この停留所への到着時間と参照停留所への到着時間の差 (秒単位)。参照停留所は、`start_stop_selector` の前の停留所です。変更が旅行の最初の停留所で開始される場合、旅行の最初の停留所が参照停留所になります。<br/><br/>この値は単調に増加するしなければならない、元の旅行の最初の停車地が参照停車地である場合にのみ負の数になる場合があります。<br/><br/>値が指定されていない場合、消費者は他のデータに基づいて `travel_time_to_stop` を補間または推測するしてもよい。|
