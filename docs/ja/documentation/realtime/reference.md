---
title: GTFS realtimeリファレンス ドキュメント
description: GTFS realtimeを詳しく調べて、リファレンス ドキュメントを参照してください。
---

# GTFS realtimeリファレンス

GTFSGTFS realtimeフィードを使用すると、交通事業者は、サービスへの混乱 (駅の閉鎖、路線の運行停止、重大な遅延など)、車両の位置、到着予定時刻に関するリアルタイム情報を消費者に提供できます。

フィード仕様のバージョン 2.0 については、このサイトで説明され、ドキュメント化されています。有効なバージョンは`2.0`、`1.0`です。

## 用語の定義

### 必須

GTFS リアルタイム v2.0 以降では、*必須* 列は、交通事業者データが有効で、使用するアプリケーションにとって意味をなすためにプロデューサーが提供するしなければならないフィールドを示します。

*必須* フィールドでは次の値が使用されます:

* **必須**: このフィールドは、GTFS リアルタイム フィード プロデューサーが提供するしなければならない。
* **条件付きで必須**: このフィールドは、フィールド *説明* で概説されている特定の条件下では必須です。これらの条件以外では、フィールドは任意です。
* **条件付きで禁止**: このフィールドは、*説明*フィールドに記載されている特定の条件下では禁止されています。これらの条件以外では、フィールドは任意です。
* **任意**: このフィールドは任意であり、プロデューサーが実装する必須はありません。ただし、基礎となる自動車両位置システム（例： VehiclePosition `timestamp` ）でデータが利用可能な場合は、可能であればプロデューサーがこれらの任意フィールドを提供することが推奨 *セマンティック要件は GTFS リアルタイム バージョン 1.0 では定義されていないため、`gtfs_realtime_version`が`1`のフィードはこれらの要件を満たさないしてもよいがあることに注意してください（詳細については、[セマンティック要件の提案](https://github.com/google/transit/pull/64)を参照してください）。*

### カーディナリティ

* カーディナリティ*は、特定のフィールドに提供してもよい要素の数を表し、次の値を持ちます。
* **1**- このフィールドには 1つの要素を指定してもよい。これは、[プロトコル バッファの *必須* および *任意* 基数](https://developers.google.com/protocol-buffers/docs/proto#simple) にマップされます。
* **多数**- このフィールドには多数の要素 (0、1、またはそれ以上) を指定してもよい。これは、[プロトコル バッファの *繰り返し* 基数](https://developers.google.com/protocol-buffers/docs/proto#simple) にマップされます。

フィールドが必須、条件付きで必須、または任意 であるかどうかを確認するには、常に *必須* フィールドと *説明* フィールドを参照してください。プロトコル バッファのカーディナリティについては、[`gtfs-realtime.proto`](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) を参照してください。

### プロトコル バッファのデータ型

フィード要素の記述には、次のプロトコル バッファのデータ型が使用されます:

* **message**: 複合型
* **enum**: 固定値のリスト

### 試験的なフィールド**試験的**というラベルの付いたフィールドは変更される可能性があり、まだ正式に仕様に採用されていません。**実験的**フィールドは、将来正式に採用されるしてもよい。

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
            

##要素

### _message_ FeedMessage 

フィードmessageの内容。ストリーム内の各messageは、適切な HTTP GET リクエストへの応答として取得されます。リアルタイム フィードは常に、既存の GTFS フィードとの関連で定義されます。すべてのエンティティ ID は、GTFS フィードを基準にして解決されます。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **header**| [FeedHeader](#message-feedheader) | 必須 | 1つ | このフィードとフィードmessageに関するメタデータ。 |
| **entity**| [FeedEntity](#message-feedentity) | 条件付きで必須 | 複数 | フィードの内容。交通システムに関するリアルタイム情報がある場合は、このフィールドを指定するしなければならない。このフィールドが空の場合、ユーザーはシステムに関するリアルタイム情報がないものと想定するするべきである。 |

### _message_ FeedHeader 

フィード メッセージに含まれる、フィードに関するメタデータ。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **gtfs_realtime_version** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | フィード仕様のバージョン。現在のバージョンは 2.0 です。 |
| **incrementality** | [Incrementality](#enum-incrementality) | 必須 | 1 |
| **timestamp** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1 | このタイムスタンプは、このフィードの内容が作成された瞬間を識別します (サーバー時間)。POSIX 時間 (つまり、1970年1月1日 00:00:00UTC からの秒数)。リアルタイム情報を生成するシステムと消費するシステム間の時間のずれを回避するには、タイム サーバーからタイムスタンプを取得することを強くお勧めします。数秒までの時間差は許容されるため、Stratum 3 またはそれより低い Strata サーバーを使用することはまったく問題ありません。 |
|**feed_version**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | リアルタイム データのベースとなる GTFS フィードの `feed_info.feed_version` に一致する文字列。ユーザーはこれを使用して、現在アクティブな GTFS フィードや、ダウンロード可能な新しいフィードを識別できます。 |

### _enum_ Incrementality

現在のフェッチが増分かどうかを決定します。

* **FULL_DATASET**: このフィード更新により、フィードの以前のすべてのリアルタイム情報が上書きされます。したがって、このアップデートでは、既知のすべてのリアルタイム情報の完全なスナップショットが提供される予定です。
* **DIFFERENTIAL**: 現在、このモードは**サポートされていません**。このモードを使用するフィードの動作は**未指定**です。[GTFS realtimeメーリング リスト](http://groups.google.com/group/gtfs-realtime)で、DIFFERENTIAL モードの動作を完全に指定することについて議論されており、その議論が完了した時点でドキュメントが更新されます。

**値**

| _**値**_ |
|-------------|
|**FULL_DATASET**|
|**DIFFERENTIAL**|

### _message_ FeedEntity 

交通フィード内のエンティティの定義 (または更新)。エンティティが削除されない場合は、`trip_update`、`vehicle`、`alert`、`shape`、`stop`、または `trip_modification` か1つを入力する必要があります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
| **id** | [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 必須 | 1つ | このエンティティのフィード固有の識別子。ID はIncrementalityサポートを提供するためだけに使用されます。フィードによって参照される実際のエンティティは、明示的なセレクターによって指定するしなければならない(詳細については、以下のEntitySelector を参照してください)。|
| **is_deleted** | [bool](https://protobuf.dev/programming-guides/proto2/#scalar) | 任意 | 1つ | このエンティティを削除するかどうか。Incrementalityが DIFFERENTIAL のフィードに対してのみ指定する必要がするべきである。このフィールドは、Incrementalityが FULL_DATASET のフィードには指定するべきではない。 |
| **trip_update** | [TripUpdate](#message-tripupdate) | 条件付きで必須 | 1つ | 便の出発遅延に関するリアルタイムのデータ。trip_update、vehicle、alert、または shape のフィールドのうち少なくとも 1つを指定するしなければならない。これらのフィールドすべてを空にすることはできません。 |
| **vehicle** | [VehiclePosition](#message-vehicleposition) | 条件付きで必須 | 1つ | 車両のリアルタイムのPositionに関するデータ。trip_update、vehicle、alert、または shape のフィールドのうち少なくとも 1つを指定するしなければならない。これらのフィールドすべてを空にすることはできません。 |
| **alert** | [アラート](#message-alert) | 条件付きで必須 | 1つ | リアルタイム アラートに関するデータ。trip_update、vehicle、alert、shape のフィールドのうち少なくとも 1つを指定するしなければならない。これらのフィールドすべてを空にすることはできません。|
| **shape** | [形状](#message-shape) | 条件付きで必須 | 1つ | 迂回路などのリアルタイムで追加されたルート形状に関するデータ。trip_update、vehicle、alert、shape のフィールドのうち少なくとも 1つを指定するしなければならない。これらのフィールドすべてを空にすることはできません。<br><br>**注意:** このフィールドはまだ**試験的**であり、変更される可能性があります。将来、正式に採用されるしてもよいがあります。 |
|**stop**| [Stop](#message-stop) | 条件付きで必須 | 1つ |新しい停留所がフィードに動的に追加されました。<br><br>**注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |
|**trip_modifications**| [TripModifications](#message-tripmodifications) | 条件付きで必須 | 1つ | 迂回などの特定の変更によって影響を受ける旅行のリスト。<br><br>**注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 | 


### _message_ TripUpdate 

便中の車両の進行状況に関するリアルタイム更新。[便更新エンティティ](../../../documentation/realtime/feed-entities/trip-updates) の一般的な説明も参照してください。

ScheduleRelationship の値に応じて、TripUpdate では以下を指定できます。

* スケジュールに沿って進む便。
* ルートに沿って進むが、スケジュールは固定されていない便。
* スケジュールに関して追加または削除された便。
* 静的 GTFS 内の既存の旅程を置き換える旅程。
* 静的 GTFS の既存の便のコピーである新しい便。TripProperties で指定されたサービス日時で実行されます。

更新は、将来の予測到着/出発イベント、またはすでに発生した過去のイベントに対して行うことができます。ほとんどの場合、過去のイベントに関する情報は測定値であるため、その不確実性の値は 0 にすることを推奨。ただし、これが当てはまらない場合もあり、その場合は過去のイベントの不確実性の値が 0 以外になることが許可されます。更新の不確実性が 0 でない場合、更新は完了していない便のおおよその予測であるか、測定が正確でないか、更新はイベント発生後に検証されていない過去の予測であったかのいずれかです。

車両が同じブロック内で複数の便を提供している場合 (便とブロックの詳細については、[GTFS trips.txt](../../schedule/reference/#tripstxt)を参照してください):

* フィードには、車両が現在提供している便の TripUpdate を含める必要があります。プロデューサーは、将来の便の予測の品質に自信がある場合は、この車両のブロックに現在の便の後の 1つ以上の便の TripUpdate を含めることが推奨されます。同じ車両に複数の TripUpdate を含めると、車両が 1つの便から別の便に移行する際に乗客に予測が「突然表示される」のを回避でき、また、下流の便に影響する遅延 (既知の遅延が便間の予定の乗り継ぎ時間を超える場合など) を乗客に事前に通知できます。
* それぞれの TripUpdate エンティティは、ブロックでスケジュールされている順序と同じ順序でフィードに追加する必要はありません。たとえば、`trip_ids` が 1、2、3 で、すべて 1つのブロックに属する便があり、車両が便 1、便 2、便 3 の順に移動する場合は、`trip_update` エンティティは任意の順序で表示できます。たとえば、便 2、便 1、便 3 の順で追加できます。

更新では、すでに完了した旅程を記述できることに注意してください。このためには、旅程の最後の停留所の更新を提供すれば十分です。最後の停留所への到着時刻が過去である場合、クライアントは便全体が過去であると結論付けます (重要ではありませんが、先行する停留所等の更新も提供できます)。このオプションは、スケジュールより早く完了したが、スケジュールによると現時点で便がまだ進行中である便に最も関連しています。この便の更新を削除すると、クライアントは便がまだ進行中であると想定する可能性があります。フィード プロバイダーは過去の更新を消去できますが、必須ではないことに注意してください。これは、これが実際に役立つ 1つのケースです。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|-----------|----------------|-------------------|-------------------|
| **trip** | [TripDescriptor](#message-tripdescriptor) | 必須 | 1つ | このmessageが適用される便。実際の便インスタンスごとに最大 1つのTripUpdateエンティティが存在します。存在しない場合は、予測情報が利用できないことを意味します。便がスケジュールどおりに進んでいることを意味するわけではありません。 |
| **vehicle** | [VehicleDescriptor](#message-vehicledescriptor) |任意| 1つ | この便にサービスを提供する車両に関する追加情報。 |
|**stop_time_update**| [StopTimeUpdate](#message-stoptimeupdate) |条件付きで必須| 多数 | 旅程の StopTimes の更新（将来の予測と、場合によっては過去の停止時刻（すでに発生したもの）の両方）。更新はstop_sequenceで並べ替え、次に指定された stop_time_update までの旅程の後続のすべての停留所に適用するしなければならない。<br> trip.schedule_relationship が SCHEDULED または UNSCHEDULED の場合、旅行に対して少なくとも 1 つの stop_time_update を指定するしなければならない。<br> trip.schedule_relationship が `NEW` または `REPLACEMENT` の場合、過去の時刻の停留所も含め、新規または代替の旅程のすべての停留所に対して stop_time_updates を指定するしなければならないがあり、静的 GTFS の停車時刻は使用されません。<br>旅程がキャンセルまたは削除された場合、stop_time_updates を指定する必要はありません。キャンセルまたは削除された旅程に stop_time_updates が指定されている場合、trip.schedule_relationship は、stop_time_updates および関連する Schedule_relationship よりも優先されます。旅程が重複している場合は、新しい旅程のリアルタイム情報を示すために stop_time_updates を指定してもよい。|
| **timestamp** | [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 将来の StopTimes を推定するために車両のリアルタイムの進行状況が測定された最新の瞬間。過去の StopTimes が指定されている場合、到着/出発時刻はこの値よりも早くなるしてもよい。 POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。 |
| **delay** | [int32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 便の現在のスケジュールの偏差。遅延は、予測が GTFS の既存のスケジュールと比較して指定される場合にのみ指定するするべきである。<br>遅延 (秒単位) は、正 (車両が遅れていることを意味する) または負 (車両が予定より進んでいることを意味する) になります。遅延が 0 の場合、車両は正確に時間通りであることを意味します。<br> StopTimeUpdates の遅延情報は、便レベルの遅延情報よりも優先されるため、便レベルの遅延は、 StopTimeUpdate遅延値が指定された便の次の停留所までのみ伝播されます。<br>フィード プロバイダーは、データの鮮度を評価するために、遅延値が最後に更新された日時を示すTripUpdate.timestamp 値を提供することを強くお勧めします。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|
| **trip_properties** | [TripProperties](#message-tripproperties) | 任意 | 1つ | 便の更新されたプロパティを提供します。<br><br>**注意:** このmessageはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |

### _message_ StopTimeEvent 

単一の予測イベント（到着または出発）の時刻情報。時刻は、遅延および／または推定時刻、および不確実性で構成されます。 `NEW`、`REPLACEMENT`、または`DUPLICATED` の便にもスケジュール時刻を追加できます。

*   遅延は、GTFS の既存のスケジュールを基準にして予測が示される場合に使用するべきである。
*   予測されたスケジュールがあるかどうかにかかわらず、時間を与えられ、新規または交換旅行のために与えられる必要があります。時間と遅延の両方が指定されている場合、時間が優先されます（通常、時間は、予定されている旅行に与えられた場合、GTFS +遅延のスケジュールされた時間に等しくなければなりません）。
*   旅行が新しい、交換または重複した旅行である場合、スケジュールされた時間が与えられる場合があります。

不確実性は、時間と遅延の両方に等しく適用されます。不確実性は、実際の遅延の予想される誤差を大まかに指定します (ただし、その正確な統計的意味はまだ定義されていません)。たとえば、コンピューターのタイミング制御下で運転される列車の場合、不確実性が 0 になることがあります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**delay**| [int32](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1 つ |遅延（秒単位）は、正（車両が遅れていることを意味する）または負（車両が予定より進んでいることを意味する）の値になります。遅延が0の場合、車両は正確に時間通りに到着していることを意味します。<br> StopTimeUpdate.schedule_relationship が NO_DATA の場合、**禁止**です。<br>**必須**時刻が指定されていない場合は必須です。|
|**time**| [int64](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1 | 推定または実際のイベントの絶対時刻。POSIX時間（1970年1月1日 00:00:00 UTCからの秒数）で表されます。<br> StopTimeUpdate.schedule_relationship が NO_DATA の場合、**禁止**です。<br>**必須**遅延が指定されていない場合は必須です。|
|**scheduled_time**| [int64](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで禁止| 1 | スケジュールされた時刻。POSIX時間（1970年1月1日 00:00:00 UTCからの秒数）で表されます。<br>**任意**TripUpdateが `NEW`、`REPLACEMENT`、または`DUPLICATED` の場合、**省略可能**。それ以外の場合は**禁止**。|
|**uncertainty**| [int32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 不確実性が省略された場合は、不明と解釈されます。完全に確実な予測を指定するには、不確実性を0に設定してください。<br> StopTimeUpdateが NO_DATA の場合は**禁止**です。|

### _message_ StopTimeUpdate 

便中の特定の停留所の到着イベントや出発イベントのリアルタイム更新。[TripDescriptor](#message-tripdescriptor) および [便更新エンティティ](../../../documentation/realtime/feed-entities/trip-updates) ドキュメントの停車時間更新に関する一般的な説明も参照してください。

更新は、過去のイベントと将来のイベントの両方に対して提供できます。プロデューサーは、` TripUpdate`が `NEW` または `REPLACEMENT` である場合を除き、過去のイベントを削除できますが、必須ではありません。この場合、過去の停留所は車両が走行する旅程を定義するため、旅程全体が完了するまで削除してはしてはいけない。
更新はstop_sequenceまたは stop_id のいずれかを介して特定の停留所にリンクされるため、これらのフィールドのいずれかが必ず設定されているしなければならないます。1つの旅程で同じ stop_id を複数回訪れる場合は、その旅程のその stop_id のすべての StopTimeUpdates でstop_sequence を指定するするべきである。

新しい旅程または代替の便では、GTFS 静的データ内の既存の旅程を参照せずに、旅程で訪問する停留所を指定するために更新が使用されます。このような便では、 `stop_id`、 `stop_sequence`、 `departure` 、 `arrival`をすべて設定するしなければならない。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**stop_sequence**| [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | 対応する GTFS フィードのstop_times.txtと同じであるしなければならないStopTimeUpdateではstop_sequenceまたは stop_id のいずれかを指定するしなければならない。両方のフィールドを空にすることはできません。stop_sequenceは、同じ stop_id を複数回訪れる便（ループなど）で、予測の対象となる停留所を明確にするために必須です。`StopTimeProperties.assigned_stop_id` が設定されている場合は、 `stop_sequence``StopTimeProperties.assigned_stop_id`設定するしなければならない。**必須**`TripUpdate.schedule_relationship` が `NEW` または `REPLACEMENT` の場合、値は旅程に沿って増加するしなければならない。|
|**stop_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1 つ | 対応する GTFS フィードのstops.txtと同じであるしなければならない。StopTimeUpdate ではstop_sequenceまたは stop_id のいずれかを指定するしなければならない。両方のフィールドを空にすることはできませんStopTimeUpdateが設定されている場合は、 `stop_id`を省略して`stop_sequence`のみを使用する`StopTimeProperties.assigned_stop_id`をお勧めします。`StopTimeProperties.assigned_stop_id` と`stop_id`が設定されている場合、 `stop_id` は`assigned_stop_id`と一致するしなければならない。**必須**`TripUpdate.schedule_relationship` が `NEW` または `REPLACEMENT` の場合。 |
|**arrival**| [StopTimeEvent](#message-stoptimeevent) |条件付きで必須| 1 | Schedule_relationship が空または SCHEDULED の場合、 StopTimeUpdate内で arrived または departure のいずれかを指定するしなければならない。両方のフィールドを空にすることはできません。schedule_relationship が SKIPPED の場合、arrival と departure の両方を空にするしてもよい。**必須**`TripUpdate.schedule_relationship` が `NEW` または `REPLACEMENT` の場合。 |
|**departure**| [StopTimeEvent](#message-stoptimeevent) |条件付きで必須| 1 | Schedule_relationship が空または SCHEDULED の場合、 StopTimeUpdate内で arrived または departure のいずれかを指定するしなければならない。両方のフィールドを空にすることはできません。schedule_relationship が SKIPPED の場合、arrival と departure の両方を空にするしてもよい。**必須**`TripUpdate.schedule_relationship` が `NEW` または `REPLACEMEN`T` の場合。|
|**departure_occupancy_status**| [OccupancyStatus](#enum-occupancystatus) |任意| 1つ | 指定された停留所から出発した直後の車両の乗客の占有状況の予測。指定されている場合は、 stop_sequence を指定するしなければならない。リアルタイムの到着または出発の予測を提供せずに、departure_occupancy_status を提供するには、このフィールドに値を入力し、 StopTimeUpdate.schedule_relationship = NO_DATA を設定します。<br><br>**注意:** このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|
|**schedule_relationship**| [ScheduleRelationship](#enum-schedulerelationship) |任意| 1つ | デフォルトの関係は SCHEDULED です。|
|**stop_time_properties**| [StopTimeProperties](#message-stoptimeproperties) |任意| 1つ | GTFS stop_times.txt内で定義されている特定のプロパティのリアルタイム更新<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |

### _enum_ ScheduleRelationship 

この StopTime と静的スケジュールの関係。

**値**

| _**値**_ | _**コメント**_ |
|-------------|---------------|
|**SCHEDULED**| 車両は、必ずしもスケジュールの時刻に従っているわけではありませんが、静的な停留所等スケジュールに従って進んでいます。これが**デフォルト**の動作です。到着と出発の少なくとも1つを指定するしなければならない。頻度ベースの便(exact_times = 0 の GTFS frequencies.txt) には SCHEDULED 値を指定するべきではない、代わりに UNSCHEDULED を使用するするべきである。 |
|**SKIPPED**| 停留所はスキップされます。つまり、車両はこの停留所には停車しません。到着と出発は任意です。設定されている場合、`SKIPPED` は同じルート内の後続の停留所等には伝播されません (つまり、車両はルート内の後続の停留所等にも停止しますが、それらの停留所等にも`schedule_relationship: SKIPPED`の`stop_time_update`がある場合には除きます)。ルート内の前の停留所からの遅延は ` `SKIPPED`停留所にも伝播します。つまり、`SKIPPED`停留所後の停留所に対して`arrival`または`departure`予測を含む`stop_time_update`が設定されていない場合、`SKIPPED`停留所の上流の予測は、後続の停留所の`stop_time_update`が提供されるまで、ルート内の ` `SKIPPED`停留所後の停留所と後続の停留所等地に伝播します。|
|**NO_DATA**| この停留所にはリアルタイム データがありません。これは、リアルタイムのタイミング情報が利用できないことを示します。設定されている場合、NO_DATA は後続の停留所にも伝播されるため、リアルタイムのタイミング情報がない停留所を指定するには、この方法を使用することを推奨。NO_DATA が設定されている場合は、` TripDescriptor.schedule_relationship` が `NEW` または `REPLACEMENT` でない限り、到着または出発を指定してはいけない。その場合は、予測ではなく、スケジュールされた時刻のみを指定するしなければならない。 `TripDescriptorが `NEW` または `REPLACEMENT` の場合でも、 StopTimeUpdate が旅程の停留所リストを定義するため、 `arrival`と`departure`にはスケジュール時刻を指定するしなければならない。この場合、スケジュールは静的な GTFS とは無関係ですが、リアルタイム予測はまだ利用できないことを示しています。|
|**UNSCHEDULED**| 車両は、頻度ベースの旅程 (GTFS frequencies.txtで exact_times = 0) を運行しています。この値は、GTFS frequencies.txtで定義されていない便、または GTFS frequencies.txtで exact_times = 1.の便には使用しないでください。`schedule_relationship : `schedule_relationship: UNSCHEDULED`の`stop_time_updates`を含む便では、 TripDescriptor `schedule_relationship: UNSCHEDULED`も設定するしなければならない。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。

### _message_ StopTimeProperties 

GTFS stop_times.txt内で定義されている特定のプロパティのリアルタイム更新。
**注意:** このmessageはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。<br>

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|---------------------------|----------------|-------------------|-------------------|
|**assigned_stop_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | リアルタイムの停留所割り当てをサポートします。GTFS `stops.txt`で定義されている`stop_id`を参照します。<br>新しい`assigned_stop_id`によって、エンドユーザーの乗車体験が GTFS `stop_times.txt`で定義された`stop_id`と大幅に異なることはするべきではない。言い換えれば、新しい停留所が追加のコンテキストなしでアプリ内に表示された場合は、エンドユーザーがこの新しい`stop_id` を`異常な変更`と見なすべきではするべきではないん。たとえば、このフィールドは、GTFS `stop_times.txt`で元々定義された停留所と同じ駅に属する`stop_id` を使用してプラットフォームの割り当てに使用することを目的としています。<br>リアルタイムの到着または出発の予測を提供せずに停留所を割り当てるには、このフィールドに値を入力し、`StopTimeUpdate.schedule_relationship = NO_DATA`を設定します。<br>このフィールドに値を入力する場合は、`StopTimeUpdate.stop_sequence`を入力するしなければならないが、`StopTimeUpdate.stop_id` は入力するべきではない。停留所の割り当ては、他の GTFS リアルタイム フィールドにも反映されるするべきである(例: `VehiclePosition.stop_id`)。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。 |
|**stop_headsign**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 停留所における車両の更新された行先表示。<br><br>**注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|
|**drop_off_type**| [DropOffPickupType](#enum-dropoffpickuptype) |任意| 1つ | 停留所における車両の降車場所の更新値。<br><br>**注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|
|**pickup_type**| [DropOffPickupType](#enum-dropoffpickuptype) |任意| 1つ | 停留所での車両の最新のピックアップ。<br><br>**注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来、正式に採用されるしてもよい。 |

## _enum_ DropOffPickupType

**Values**

| _**Value**_                | _**Comment**_                                             |
|----------------------------|--------------------------------------------------------|
|**REGULAR**| 定期的にスケジュールされた集荷/降車。                |
|**NONE**| 集荷/降車はありません。                           |
|**PHONE_AGENCY**| 集荷/降車を手配するには、事業者に電話するしなければならない。          |
|**COORDINATE_WITH_DRIVER**| 集荷/降車を手配するには、ドライバーと調整するしなければならない。 |

### _message_ TripProperties 

便の更新されたプロパティを定義します

**注意:** このmessageはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。<br> .

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|---------------------------|----------------|-------------------|-------------------|
|**trip_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1 | (CSV) GTFS trips.txtで定義されている既存の便の複製であるが、異なるサービスdateおよび/または時刻 ( `TripProperties.start_date`および`TripProperties.start_time`を使用して定義) に開始する新しい便の識別子を定義します。(CSV) GTFS の`trips.trip_id`の定義を参照してください。その値は、(CSV) GTFS で使用されている値と異なる必要がしなければならない。このフィールドは、`schedule_relationship`が`DUPLICATED`の場合に必須です。それ以外の場合、このフィールドに値を入力することはしてはいけない、コンシューマーによって無視されます。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |
|**start_date**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | 複製された便が実行されるサービスdate。YYYYMMDD 形式で提供するしなければならない。このフィールドは、`schedule_relationship`が`DUPLICATED`の場合に必須です。それ以外の場合は、このフィールドに値を入力してはしてはいけない、コンシューマーによって無視されます。<br><br>**注意:** このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |
|**start_time**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1 | 重複している便の出発開始時刻を定義します。(CSV) GTFS の`stop_times.departure_time`の定義を参照してください。重複した便の予定到着時刻と出発時刻は、元の便の`departure_time`とこのフィールドのオフセットに基づいて計算されます。たとえば、GTFS の旅程に停留所 A の`departure_time`が`10:00:00` 、停留所 B の`departure_time`が`10:01:00`で、このフィールドに`10:30:00`の値が入力されている場合、複製された旅程の停留所 B のスケジュールされた`departure_time`は`10:31:00`になります。リアルタイム予測の`delay`値は、この計算されたスケジュール時間に適用され、予測時間を決定します。たとえば、停留所 B の出発`delay`が`30`の場合、予測される出発時刻は`10:31:30`です。リアルタイム予測の`time`値にはオフセットが適用されず、提供された予測時間を示します。たとえば、停留所 B の出発`time`が` 10:31:30 と指定されている場合、予測出発時刻は`10:31:30` になります。このフィールドは、`schedule_relationship`が`DUPLICATED`の場合に必須。それ以外の場合、このフィールドに値を入力するしてはいけない、消費者によって無視されます。<br><br>**注意:** このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。 |
|**trip_headsign**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 つ | この旅行の行先表示が元のものと異なる場合に、それを指定します。<br><br>**注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|
|**trip_short_name**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | この旅行の名前が元の旅行と異なる場合に指定します。<br><br>**注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|
|**shape_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 旅行の形状が (CSV) GTFS で指定された形状と異なる場合、または乗客の需要に基づいて異なる経路を取る車両など、(CSV) GTFS で提供されていない場合にリアルタイムで指定する場合に、車両の旅行経路の形状の識別子を指定します。(CSV) GTFS の`trips.shape_id`の定義をご覧ください。<br>シェイプが（CSV）GTFSでもリアルタイムでも定義されていない場合、そのシェイプは不明とみなされます。このフィールドは、（CSV）GTFSのshapes.txtで定義されたシェイプ、または同じ（protobuf）リアルタイムフィード内の`Shape`を参照できます。この旅程の停留所順序（停車シーケンス）は、（CSV）GTFSと同じであるしなければならない。同じリアルタイムフィード内の`Shape`エンティティを参照する場合、このフィールドの値は、エンティティ内の`shape_id`の1つであり、 `FeedEntity`の`id`ではするべきであるん。<br>迂回が発生した場合など、元の旅行の一部であったが、今後は行わない停留所は、schedule_relationship=SKIPPED としてマークするか、 `TripModifications`messageを介して詳細を提供するするべきである。<br><br>**注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|

### _message_ VehiclePosition 

特定の車両のリアルタイム位置情報。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|---------------------------|----------------|-------------------|-------------------|
|**trip**| [TripDescriptor](#message-tripdescriptor) |任意| 1つ | この車両がサービスを提供している便。特定の便インスタンスで車両を識別できない場合は、空または一部にすることができます。|
|**vehicle**| [VehicleDescriptor](#message-vehicledescriptor) |任意| 1つ | この便を提供している車両に関する追加情報。各エントリには、**一意の**車両IDがするべきである。|
|**position**| [Position](#message-position) |任意| 1つ | この車両の現在のPosition。|
|**current_stop_sequence**| [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 現在の停留所の停車シーケンス インデックス。current_stop_sequence の意味 (つまり、それが参照する停留所) は、current_status によって決まります。current_status が指定されていない場合は、IN_TRANSIT_TO が指定されたものとみなされます。|
|**stop_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 現在の停留所を識別します。値は、対応する GTFS フィード内のstops.txtの値と同じであるしなければならない。`StopTimeProperties.assigned_stop_id` を使用して`StopTimeProperties.assigned_stop_id` `stop_id` を割り当てる場合、このフィールドも`stop_id`の変更を反映するするべきである。|
|**current_status**| [VehicleStopStatus](#enum-vehiclestopstatus) |任意| 1つ | 現在の停止に関する車両の正確な状態。current_stop_sequence がない場合は無視されます。 |
|**timestamp**| [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 車両のPositionが測定された瞬間。POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。 |
|**congestion_level**| [CongestionLevel](#enum-congestionlevel) |任意| 1つ |
|**occupancy_status**| [OccupancyStatus](#enum-occupancystatus) | _オプション_ | 1つ | 車両または客車の乗客の占有状態。 multi_carriage_details に車両ごとのOccupancyStatusが設定されている場合、このフィールドは、乗客を受け入れるすべての車両を考慮して車両全体を記述するするべきである。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |
|**occupancy_percentage**| [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 車両内の乗客の占有率を示すパーセンテージ値。値 100 は、座席と立席の両方の定員を含む、車両が設計された最大占有率を表し、現在の運行規則で許可されています。設計された最大定員よりも多くの乗客がいる場合、値は 100 を超えることがありしてもよい。occupancy_percentage の精度は、個々の乗客が車両に乗り降りするのを追跡できないほど低くするするべきである。multi_carriage_details に車両ごとの occupancy_percentage が設定されている場合、このフィールドは、乗客を受け入れるすべての車両を考慮して車両全体を記述するするべきである。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。 |
|**multi_carriage_details**| [CarriageDetails](#message-carriagedetails) |任意| 多数 | この車両の複数の客車の詳細。最初の出現は、**現在の移動方向を前提として**、車両の最初の客車を表します。multi_carriage_details フィールドの出現回数は、車両の客車数を表します。また、事業者車、保守用車両など、乗客がプラットフォームのどこに立つべきかに関する貴重な情報を提供する、乗車できない車両も含まれます。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |


### _enum_ VehicleStopStatus

**Values**

| _**Value**_ | _**Comment**_ |
|-------------|---------------|
|**INCOMING_AT**| 車両が停車場に到着しようとしています (停車場表示では、通常、車両シンボルが点滅します)。 |
|**STOPPED_AT**| 車両が停車場に停止しています。 |
|**IN_TRANSIT_TO**| 車両が前の停車場を出発し、移動中です。 |

### _enum_ CongestionLevel 

この車両に影響を与えている混雑レベル。

**Values**

| _**Value**_ |
|-------------|
|**UNKNOWN_CONGESTION_LEVEL**|
|**RUNNING_SMOOTHLY**|
|**STOP_AND_GO**|
|**CONGESTION**|
|**SEVERE_CONGESTION**|

### _enum OccupancyStatus_

車両または客車の乗客の占有状態。

個々のプロデューサーは、すべてのOccupancyStatus値を公開しないしてもよい。したがって、コンシューマーは、 OccupancyStatus値が線形スケールに従うと想定してはしてはいけない。コンシューマーは、プロデューサーが示し意図した状態としてOccupancyStatus値を表すするべきである。同様に、プロデューサーは、実際の車両占有状態に対応するOccupancyStatus値を使用するしなければならない。

線形スケールでの乗客の占有階・フロアを説明するには、`occupancy_percentage`を参照してください。

**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来、正式に採用されるしてもよい。

**値**

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| _**EMPTY**_ | _ほとんどの基準では車両が空であるとみなされ、乗客はほとんどいないか、まったくいませんが、乗客を受け入れています。_ |
| _**MANY_SEATS_AVAILABLE**_ | _車両または客車の空席数が多い。使用可能な総座席数のうち、このカテゴリに該当するほど空いている座席の数は、プロデューサーの裁量で決定されます。_ |
| _**FEW_SEATS_AVAILABLE**_ | _車両または客車の空席数が少ない。使用可能な総座席数のうち、このカテゴリに該当するほど空いている座席の数は、プロデューサーの裁量で決定されます。_ |
| _**STANDING_ROOM_ONLY**_| _現在、車両または客車は立っている乗客のみを収容できます。_ |
| _**FULL**_ | _ほとんどの基準では車両は満員と見なされますが、乗客の乗車を許可している可能してもよいがあります。_ |
| _**NOT_ACCEPTING_PASSENGERS**_ | _車両または客車は乗客を受け入れていません。車両または客車は通常、乗客の乗車を受け入れます。_ |
| _**NO_DATA_AVAILABLE**_ | _その時点で、車両または客車に利用可能な占有データがありません。_ |
| _**NOT_BOARDABLE**_ | _車両または客車は乗車できず、乗客を受け入れることはありません。特別な車両や客車（エンジン、メンテナンス用客車など）に役立ちます。_ |


### _message_ CarriageDetails 

複数の客車で構成された車両に使用される、客車固有の詳細。

**注意:** このmessageはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 客車の ID。車両ごとに一意であるするべきである。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |
|**label**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 車両を識別するために乗客に表示さしてもよい、ユーザーに表示されるラベル。例: "7712"、"Car ABC-32" など...<br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |
|**occupancy_status**| [OccupancyStatus](#enum-occupancystatus) |任意| 1つ | この車両のこの車両の乗車状況。デフォルトは`NO_DATA_AVAILABLE`に設定されています。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|
|**occupancy_percentage**| [int32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1 | この車両のこの車両の占有率。"VehiclePosition.occupancy_percentage" と同じルールに従います。この車両のデータが利用できない場合は -1 を使用します。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |
|**carriage_sequence**| [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 | 車両の CarriageStatus リスト内の他の車両に対するこの車両の順序を識別します。移動方向の最初の車両の値は1.である必要がしなければならない。2 番目の値は移動方向の 2 番目の車両に対応し、値 2 であるしなければならないがあります。以下同様です。たとえば、移動方向の最初の車両の値は1.です。移動方向の 2 番目の車両の値が 3 の場合、コンシューマーはすべての車両のデータ (つまり、multi_carriage_details フィールド) を破棄します。データのないキャリッジは、有効な carrier_sequence 番号で表すしなければならない、データのないフィールドは省略するするべきである(代わりに、それらのフィールドを含めて、`データなし`の値に設定することもできます)。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |

### _message_ Alert

公共交通事業者ネットワークで何らかのインシデントが発生したことを示すアラート。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**active_period**| [TimeRange](#message-timerange) |任意| 複数 | アラートをユーザーにするべきである時間。指定しない場合は、フィードに表示される限りアラートが表示されます。複数の範囲が指定されている場合は、そのすべての範囲でアラートが表示されます。 |
|**informed_entity**| [EntitySelector](#message-entityselector) |必須| 複数 | このアラートをユーザーに通知するするべきであるエンティティ。少なくとも 1つの inform_entity を指定するしなければならない。|
|**cause**| [Cause](#enum-cause) |条件付きで必須| 1つ | cause_detail が含まれている場合は、Cause も含める必要がしなければならない。
|**cause_detail**| [TranslatedString](#message-translatedstring) |任意| 1つ | アラートの原因の説明。事業者固有の言語を使用できます。Cause よりも具体的です。cause_detail が含まれている場合は、Cause も含めるしなければならない。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。
|**effect**| [Effect](#enum-effect) |条件付きで必須| 1つ | effect_detail が含まれている場合は、Effect も含めるしなければならない。
|**effect_detail**| [TranslatedString](#message-translatedstring) |任意| 1つ | アラートの効果の説明。事業者固有の言語を使用できます。Effect よりも具体的です。effect_detail が含まれている場合は、Effect も含めるしなければならない。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい性があります。
|**url**| [TranslatedString](#message-translatedstring) |任意| 1つ | アラートに関する追加情報を提供する URL。|
|**header_text**| [TranslatedString](#message-translatedstring) |必須| 1つ | アラートのヘッダー。このプレーン テキスト文字stringは、たとえば太字で強調表示されます。|
|**description_text**| [TranslatedString](#message-translatedstring) |必須| 1つ | アラートの説明。このプレーン テキスト文字stringは、アラートの本文としてフォーマットされます (または、ユーザーによる明示的な`展開`要求で表示されます)。説明の情報は、ヘッダーの情報に追加されるするべきである。|
|**tts_header_text**| [TranslatedString](#message-translatedstring) |任意| 1つ |テキスト読み上げの実装に使用されるアラートのヘッダーを含むText。このフィールドは、header_text のテキスト読み上げバージョンです。header_text と同じ情報を含めるするべきであるが、テキスト読み上げとして読み取れる形式にする必要があります (たとえば、省略形は削除、数字はスペルアウトなど)。|
|**tts_description_text**| [TranslatedString](#message-translatedstring) |任意| 1つ |テキスト読み上げの実装に使用されるアラートの説明を含むText。このフィールドは、description_text のテキスト読み上げバージョンです。description_text と同じ情報を含めるするべきであるが、テキスト読み上げとして読み取れる形式にする必要があります (たとえば、省略形は削除、数字はスペルアウトなど)。|
|**severity_level**| [SeverityLevel](#enum-severitylevel) | 任意 | 1つ | アラートの重大度。 |
|**image**| [TranslatedImage](#message-translatedimage) | 任意 | 1つ | アラートTextに沿って表示される 1つのTranslatedImage 。迂回、駅の閉鎖などのアラート効果を視覚的に説明するために使用されます。画像はアラートの理解を深めるするべきである、重要な情報の唯一の場所であってはしてはいけない。次の種類の画像は推奨されません : 主にTextを含む画像、追加情報を含まないマーケティングまたはブランド画像。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |
|**image_alternative_text**| [TranslatedString](#message-translatedstring) | 任意 | 1つ | `image`フィールドでリンクされた画像の外観を説明するText(たとえば、画像を表示できない場合や、アクセシビリティの理由でユーザーが画像を見ることができない場合など)。HTML [alt 画像のTextの仕様](https://html.spec.whatwg.org/#alt) を参照してください。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。 |


### _enum_ Cause

このアラートの原因。

**値**

| _**値**_ |
|-------------|
|**UNKNOWN_CAUSE**|
|**OTHER_CAUSE**|
|**TECHNICAL_PROBLEM**|
|**STRIKE**|
|**DEMONSTRATION**|
|**ACCIDENT**|
|**HOLIDAY**|
|**WEATHER**|
|**MAINTENANCE**|
|**CONSTRUCTION**|
|**POLICE_ACTIVITY**|
|**MEDICAL_EMERGENCY**|

### _enum_ Effect

この問題が影響を受けるエンティティに与える影響。

**値**

| _**値**_ |
|-------------|
|**NO_SERVICE**|
|**REDUCED_SERVICE**|
|**SIGNIFICANT_DELAYS**|
|**DETOUR**|
|**ADDITIONAL_SERVICE**|
|**MODIFIED_SERVICE**|
|**OTHER_EFFECT**|
|**UNKNOWN_EFFECT**|
|**STOP_MOVED**|
|**NO_EFFECT**|
|**ACCESSIBILITY_ISSUE**|

### _enum_ SeverityLevel 

アラートの重大度。

**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来、正式に採用されるしてもよい。

**値**

| _**値**_ |
|-------------|
|**UNKNOWN_SEVERITY**|
|**INFO**|
|**WARNING**|
|**SEVERE**|

### _message_ TimeRange 

時間間隔。`t` が開始時刻以上で終了時刻より小さい場合、間隔は時刻 `t` でアクティブであると見なされます。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**start**| [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | 開始時刻、POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。指定されていない場合、間隔はマイナス無限大で始まります。TimeRangeが指定されている場合は、start または end のいずれかを指定するしなければならない。両方のフィールドを空にすることはできません。|
|**end**| [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | 終了時刻、POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。指定されていない場合、間隔はプラス無限大で終了します。TimeRangeが指定されている場合は、start または end のいずれかを指定するしなければならない。両方のフィールドを空にすることはできません。 |

### _message_ Position

車両の地理的Position。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|---------------------------|----------------|-------------------|-------------------|
|**latitude**| [float](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 | WGS-84 座標系での北緯。 |
|**longitude**| [float](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 | WGS-84 座標系での東経。 |
|**bearing**| [float](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 真北から時計回りの度数で表した方位。つまり、0 は北、90 は東です。これはコンパス方位、または次の停止地点または中間地点への方向になります。これは、クライアントが以前のデータから計算できる以前の位置のシーケンスから推測されるするべきではない。 |
|**odometer**| [double](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 走行距離計の値 (メートル単位)。 |
|**speed**| [float](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 車両によって測定された瞬間速度 (メートル/秒単位)。 |

### _message_ TripDescriptor 

GTFS 旅行の単一のインスタンスを識別する記述子`schedule_relationship`が `NEW` の場合は、追加する旅行の新しいインスタンスを指定します。

単一の便インスタンスを指定するには、多くの場合、`trip_id`だけで十分です。ただし、次の場合には、単一の便インスタンスを解決するために追加の情報が必要です:

* frequencies.txtで定義されている便の場合、`trip_id`に加えて`start_date`と`start_time`が必須。
* 便が 24 時間以上続く場合、または翌日の予定便と重なるように遅れる場合は、`trip_id`に加えて`start_date`が必須です。
* `trip_id`フィールドを指定できない場合は、`route_id`、`direction_id`、`start_date`、および`start_time` をすべて指定するしなければならない。

すべての場合において、`trip_id`に加えて`trip_id` `route_id`を指定する場合、`route_id`は` GTFS trips.txtで特定の便に割り当てられた`route_id`と同じであるしなければならないがあります。

`trip_id` フィールドは、単独でも、または次のフィールドと組み合わせても、他のTripDescriptorフィールドは、複数の便インスタンスを識別するために使用できます。たとえば、GTFS frequencies.txt exact_times=0 の便では、 TripDescriptor でtrip_id を単独で指定しないでするべきである。start_time も、特定の時刻に開始する単一の便インスタンスに解決される必須があるためです。TripDescriptorが単一の便インスタンスに解決されない場合 (つまり、0 個以上の便インスタンスに解決される場合)、エラーと見なされ、エラーのあるTripDescriptorを含むエンティティはコンシューマーによって破棄されるしてもよい。

trip_idが不明な場合は、 TripUpdateの駅シーケンス ID では不十分であり、stop_id も提供するしなければならない。さらに、絶対的な到着/出発時刻も提供するしなければならないTripDescriptor.route_id は、ルートのすべての便に影響するルート全体のアラートを指定する Alert EntitySelector内では使用できません。代わりにEntitySelector.route_idを使用してください。

`schedule_relationship`が `NEW` の場合は、旅行をルートに関連付けるために、 `trip_id` をしなければならないフィードにリストされていない値に設定し、 `route_id`を` GTFS スタティックの`routes.txt`にリストされている値に設定するしなければならない。新しい旅程には`start_date`を設定するするべきである、 `direction_id`を設定してもよい。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**trip_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1 | このセレクタが参照する GTFS フィードからのtrip_id 。運行頻度に基づいていない便（GTFS frequencies.txtで定義されていない便）の場合、このフィールドだけで旅程を一意に識別できます。GTFS frequencies.txtで定義されている運行頻度に基づく便の場合、 trip_id、start_time、start_date はすべて必須です。スケジュールベースの便（GTFS frequencies.txtで定義されていない便）の場合、 trip_idを省略できるのは、 route_id、 direction_id 、 start_time 、 start_date の組み合わせで旅程を一意に識別でき、かつそれらのフィールドがすべて指定されている場合のみです。schedule_relationship が NEW の場合は、 GTFS 静的に定義されていない一意の値で指定するしなければならない。schedule_relationship が `REPLACEMENT` の場合、 trip_id は置換される静的 GTFS からの旅程を識別します。 TripUpdate内で schedule_relationship が`DUPLICATED`の場合、 trip_id は複製される静的 GTFS からの旅程を識別します。 VehiclePosition内で schedule_relationship が`DUPLICATED`の場合、 trip_id は複製される新しい旅程をしなければならないし、対応するTripUpdate. TripProperties.trip_id. |
|**route_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | このセレクタが参照する GTFS のroute_idを省略した場合、 trip_id 、 route_id、 start_time 、および schedule_relationship=SCHEDULED をすべて設定して、旅程インスタンスを識別するしなければならない。 Alert EntitySelector内で、ルートのすべての便に影響するルート全体のアラートを指定するためにTripDescriptor.route_idを使用しするべきではない。代わりにEntitySelector.route_id を使用してください。schedule_relationship が NEW の場合、新しい旅程が属するルートのroute_idを指定するしなければならない。|
|**direction_id**| [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | GTFS フィードのtrips.txtファイルの direction_id。このセレクタが参照する便の移動方向を示しますtrip_idを省略した場合、 direction_id を指定するしなければならない。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。<br> |
|**start_time**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1 | この旅程インスタンスの当初の予定開始時刻。trip_idが非頻度ベースの旅程に対応する場合、このフィールドは省略するか、GTFS フィードの値と同じにするするべきである。trip_idがGTFS frequencies.txtで定義された頻度ベースの旅程に対応する場合、start_time は必須であり、旅程の更新と車両の位置のために指定するしなければならない。旅程が exact_times=1 の GTFS レコードに対応する場合、start_time は対応する期間のfrequencies.txt のstart_time より headway_secs の倍数 (0 を含む) 後にするしなければならない。旅程が exact_times=0 に対応する場合、start_time は任意でかまいませしてもよいが、当初は旅程の最初の出発時刻になると予想されます。一度設定されると、この頻度ベースの exact_times=0 の旅程の start_time は、最初の出発時刻が変更された場合でも不変と見なすするべきである。その時間変更は、代わりにStopTimeUpdateに反映されるしてもよいtrip_idを省略する場合は、 start_time を指定するしなければならない。フィールドの形式とセマンティクスは、GTFS/frequencies.txt/start_time と同じです (例: 11:15:35 または 25:15:35)。|
|**start_date**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | この旅程インスタンスの開始date(YYYYMMDD 形式)。スケジュールされた便(GTFS frequencies.txtで定義されていない便) の場合、翌日のスケジュールされた旅程と重なるほど遅れている便を明確にするために、このフィールドを指定するしなければならない。たとえば、毎日 8:00 と 20:00 に出発し、12 時間遅れている列車の場合、同じ時間に 2つの異なる便が存在することになります。このフィールドは指定できますが、このような衝突が不可能なスケジュールでは必須ではありません。たとえば、1 時間遅れている車両はスケジュールとは関係がないと見なされる、1 時間ごとのスケジュールで実行されるサービスなどです。このフィールドは、GTFS frequencies.txtで定義されている頻度ベースの便では必須。trip_idが省略されている場合は、start_date を指定するしなければならない。|
|**schedule_relationship**| [ScheduleRelationship](#enum-schedulerelationship_1) |任意| 1つ | この便と静的スケジュールの関係。TripDescriptorがAlert `EntitySelector`で指定されている場合、一致する便インスタンスを識別するときに、`schedule_relationship`フィールドはコンシューマーによって無視されます。
|**modified_trip**| [ModifiedTripSelector](#message-modifiedtripselector) |任意| 1つ | この旅行に対して行われた変更へのリンク (形状の変更、停車地の削除または追加)。このフィールドを指定する場合、 `TripDescriptor`の`trip_id`、 `route_id`、 `direction_id`、 `start_time`、 `start_date`フィールドは、`ModifiedTripSelector` 値を探していない消費者による混乱を避けるために、空のままにしておく必要があります。|

### _enum_ ScheduleRelationship 

この旅程と静的スケジュールの関係。新しい旅程が GTFS に反映されない一時的なスケジュールに従って行われる場合、その旅程は SCHEDULED ではなく NEW としてマークする必要があります。旅程が GTFS に反映されていない変更されたスケジュールに従って行われる場合、その旅程は`SCHEDULED`ではなく `REPLACEMENT` としてマークする必要があります。

**値**

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| **SCHEDULED** | GTFS スケジュールに従って運行されている、またはスケジュールされた運行に十分近いため関連付けられている運行。 |
| **ADDED** | *注: この値は動作が指定されていないため非推奨になりました。開始dateを除いてスケジュール済みの旅程と同じ追加の旅程の場合は**DUPLICATED**を使用し、既存の旅程とは無関係な追加の旅程の場合は**NEW**を使用してください。* |
| **UNSCHEDULED** | スケジュールが関連付けられていない運行中の旅程 - この値は、GTFS frequencies.txt で exact_times = 0 に定義されている旅程を識別するために使用されます。GTFS frequencies.txt で定義されていない旅程や、GTFS frequencies.txt で exact_times = 1 に定義されている旅程を説明するために使用しないでください。`schedule_relationship: UNSCHEDULED` の旅程では、すべての StopTimeUpdates も `schedule_relationship: UNSCHEDULED` に設定する必要があります。|
| **CANCELED** | スケジュールに存在していたが削除された旅程。|
|**REPLACEMENT**| 変更されたスケジュールや迂回ルートなどにより、既存のスケジュール済みの旅程を置き換える旅程。代替旅行の完全な行程は`StopTimeUpdate`で指定するしなければならない、GTFS 静的からの元のスケジュールは、置き換えられたインスタンスには使用されません。<br> `REPLACEMENT` は、旅行が修正されたスケジュールで運行されている場合に使用できますが、車両が静的 GTFS の`stop_times.txt`にリストされているスケジュールに従うことを目的としている場合は、リアルタイムのスケジュールの逸脱 (予測) を伝えるために使用するしてはいけない。<br><br>**注意:**このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|
| **DUPLICATED** | サービス開始日時を除き、既存のスケジュールされた旅程と同じ新しい旅程。 `TripUpdate.TripProperties.trip_id`、`TripUpdate.TripProperties.start_date`、および `TripUpdate.TripProperties.start_time` と一緒に使用して、静的 GTFS から既存の旅程をコピーしますが、開始日は異なるサービス日付および/または時刻にします。(CSV) GTFS (`calendar.txt` または `calendar_dates.txt`) 内の元の旅程に関連するサービスが今後 30 日以内に運行される場合、旅程の複製が許可されます。複製する旅程は、`TripUpdate.TripDescriptor.trip_id` によって識別されます。<br><br> この列挙では、`TripUpdate.TripDescriptor.trip_id` によって参照される既存の旅程は変更されません。プロデューサーが元の旅程をキャンセルする場合は、CANCELED の値を持つ別の `TripUpdate` を公開する必要があります。 GTFS の `frequencies.txt` で定義されている、`exact_times` が空または `0` に等しい旅程は複製できません。新しい旅程の `VehiclePosition.TripDescriptor.trip_id` には、`TripUpdate.TripProperties.trip_id` の一致する値が含まれている必要があり、`VehiclePosition.TripDescriptor.ScheduleRelationship` も `DUPLICATED` に設定する必要があります。<br><br>*重複した旅程を表すために ADDED 列挙を使用していた既存のプロデューサーとコンシューマーは、[移行ガイド](../../realtime/examples//migration-duplicated) に従って DUPLICATED 列挙に移行する必要があります。* |
|**NEW**| 既存の便とは無関係な追加の旅程。例えば、急激な乗客増加に対応するために使用します。新しい旅程の全行程（停留所と時刻を含む）は、 `StopTimeUpdate`で指定するしなければならない。<br><br> *静的 GTFS に関連しない新しい便を表すために`ADDED`列挙を使用していた既存のプロデューサーとコンシューマーは、[移行ガイド](/gtfs-realtime/spec/en/examples/migration-duplicated.md) に従って NEW 列挙に移行するしなければならない。*<br><br>**注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。|
| **DELETED** | スケジュールに存在していたが削除された旅程で、ユーザーに表示してはいけません。 <br><br> 交通事業者プロバイダーが、対応する便に関する情報を消費アプリケーションから完全に削除し、乗客に便がキャンセルされたと表示されないようにするには、CANCELED ではなく DELETED を使用する必要があります。たとえば、便が別の便に完全に置き換えられる場合などです。この指定は、複数の便がキャンセルされ、代替サービスに置き換えられる場合に特に重要になります。消費者がキャンセルに関する明確な情報を表示すると、より重要なリアルタイム予測が妨げられます。<br><br>**注意:** このフィールドはまだ **実験的** であり、変更される可能性があります。将来正式に採用される可能性があります。|

## _message_ ModifiedTripSelector

サービスが旅行の変更の影響を受ける場合、`ModifiedTripSelector` を使用して旅行を選択します。詳細については、[旅行のModification](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-modifications.md#linkage-to-tripupdates)仕様を参照してください。

**値**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|-------------|---------------|-------------|---------------|-------------|
|**modifications_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ |含まれる`TripModifications`オブジェクトがこの旅程に影響を与える`FeedEntity`の`id` |
|**affected_trip_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ | `modifications_id` によって変更される GTFS フィードからの`trip_id` |
|**start_time**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 頻度に基づいて変更された旅程に適用される、この旅程インスタンスの当初のスケジュール開始時刻。[TripDescriptor](#message-tripdescriptor) の**start_time**と同じ定義です。|
|**start_date**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ |変更された旅行に適用される、この旅行インスタンスの開始date(YYYYMMDD 形式)。[TripDescriptor](#message-tripdescriptor) の**start_date**と同じ定義です。|

### _message_ VehicleDescriptor 

便を実行する車両の識別情報。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 車両の内部システム ID。車両ごとに**一意**でするべきである、システム内を進む車両を追跡するために使用されます。このID は、エンドユーザーには表示しするべきではない。そのためには、**label**フィールドを使用します |
|**label**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | ユーザーに表示されるラベル。つまり、正しい車両を識別するために乗客に表示するしなければならないもの。 |
|**license_plate**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | 車両のナンバー プレート。 |
|**wheelchair_accessible**| [WheelchairAccessible](#enum-wheelchairaccessible) |任意| 1つ | 指定されている場合、静的 GTFS の *wheelchair_accessible* 値を上書きできます。 |

### _enum_ WheelchairAccessible 

特定の便が車椅子でアクセス可能かどうか。利用可能な場合、この値は静的 GTFS の _wheelchair_accessible_ 値を上書きするべきである。

**値**

| _**値**_ | _**コメント**_ |
|-------------|---------------|
| **NO_VALUE** | 便には車椅子でのアクセスに関する情報がありません。これは**デフォルト**の動作です。静的 GTFS に _wheelchair_accessible_ 値が含まれている場合、上書きされません。|
| **UNKNOWN** | 便にはアクセシビリティ値がありません。この値により、GTFS の値が上書きされます。|
| **WHEELCHAIR_ACCESSIBLE** | 便には車椅子でアクセスできます。この値により、GTFS の値が上書きされます。|
| **WHEELCHAIR_INACCESSIBLE** | 便には車椅子でアクセスできません。この値により、GTFS の値が上書きされます。|

### _message_ EntitySelector 

GTFS フィード内のエンティティのセレクター。フィールドの値は、GTFS フィード内の適切なフィールドに対応している必要があります。少なくとも 1つの指定子を指定する必要があります。複数の指定子を指定する場合、それらは論理 `AND` 演算子で結合されていると解釈されます。さらに、指定子の組み合わせは、GTFS フィード内の対応する情報と一致している必要があります。つまり、アラートを GTFS 内のエンティティに適用するには、提供されているすべての EntitySelector フィールドと一致する必要があります。たとえば、`route_id: "5"` および `route_type: "3"` フィールドを含む EntitySelector は、`route_id: "5"` バスにのみ適用され、`route_type: "3"` の他のルートには適用されません。プロデューサーがアラートを `route_id: "5"` と `route_type: "3"` の両方に適用する場合、`route_id: "5"` を参照する EntitySelector と `route_type: "3"` を参照する EntitySelector の 2 つを別々に提供する必要があります。

少なくとも 1つの指定子を指定するしなければならない。EntitySelectorのすべてのフィールドを空にすることはできません。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**agency_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | このセレクタが参照する GTFS フィードの agency_id。
|**route_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) | 条件条件付きで必須| 1つ | このセレクタが参照する GTFS のroute_idが指定されている場合は、 route_idも指定するしなければならない。
|**route_type**| [int32](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ |このセレクタが参照する GTFS の route_type。
|**direction_id**| [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | GTFS フィードtrips.txtファイルの direction_id。route_id で指定されたroute_idの 1 方向のすべての便を選択するために使用されます。direction_id が指定されている場合は、 route_idも指定するしなければならない。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。<br> |
|**trip**| [TripDescriptor](#message-tripdescriptor) |条件付きで必須| 1つ | このセレクタが参照する GTFS の旅程インスタンス。このTripDescriptor は、GTFS データ内の単一の旅程インスタンスに解決されるしなければならない(たとえば、プロデューサーは exact_times=0 の便に対してtrip_idのみを提供することはできません)。このTripDescriptor内にScheduleRelationshipフィールドが設定されている場合、コンシューマーが GTFS の旅程を識別しようとすると無視されます。
|**stop_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | このセレクタが参照する GTFS フィードの stop_id。

### _message_ TranslatedString 

Textのスニペットまたは URL の言語別バージョンを含む国際化message。messageから文字列の 1つが取得されます。解決は次のように進行します: UI 言語が翻訳の言語コードと一致する場合、最初に一致する翻訳が選択されます。デフォルトの UI 言語 (例: 英語) が翻訳の言語コードと一致する場合、最初に一致する翻訳が選択されます。翻訳に未指定の言語コードがある場合は、その翻訳が選択されます。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**translation**| [Translation](#message-translation) |必須| 多数 | 少なくとも1つの翻訳を指定するしなければならない。|

### _message_ Translation

言語にマップされたローカライズされたstring。

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**text**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ |messageを含む UTF-8string。 |
|**language**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | BCP-47 言語コード。言語が不明な場合、またはフィードに対して国際化が行われていない場合は省略できます。最大で 1つの翻訳に未指定の言語タグを指定できます。翻訳が複数ある場合は、言語を指定するしなければならない。 |

### _message_ TranslatedImage 

言語ごとの画像バージョンを含む国際化されたmessage。messageからの画像が 1つ取得されます。解決は次のように進行します: UI 言語が翻訳の言語コードと一致する場合、最初に一致する翻訳が選択されます。デフォルトの UI 言語 (例: 英語) が翻訳の言語コードと一致する場合、最初に一致する翻訳が選択されます。翻訳に未指定の言語コードがある場合は、その翻訳が選択されます。

**注意:** このmessageはまだ**実験的**であり、変更される可能性があります。将来、正式に採用されるしてもよい。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**localized_image**| [LocalizedImage](#message-localizedimage) |必須| 多数 | 少なくとも 1つのローカライズされた画像を指定するしなければならない。 |

### _message_ LocalizedImage 

言語にマップされたローカライズされたイメージのURL。

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**url**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ | イメージにリンクする URL を含むstring。リンクされるイメージは 2 MB 未満でしなければならない。イメージが大幅に変更され、コンシューマー側で更新が必須場合、プロデューサーは URL を新しいものに更新するしなければならない。<br><br> URL は http://または https://を含む完全修飾 URL でするべきである、URL 内の特殊文字は正しくエスケープするしなければならない。完全修飾 URL 値の作成方法については、次の http://www.w3.org/Addressing/URL/4_URI_Recommentations.html を参照してください。 |
|**media_type**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ | 表示する画像の種類を指定するための IANA メディア タイプ。タイプは "image/" で始まるしなければならない。 |
|**language**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | BCP-47 言語コード。言語が不明な場合、またはフィードに対して国際化が行われていない場合は省略できます。最大で 1つの翻訳に未指定の言語タグを指定できます。翻訳が複数ある場合は、言語を指定するしなければならない。 |

### _message_ Shape

形状が (CSV) GTFS の一部ではない場合 (アドホック迂回など) に車両がたどる物理的な経路を説明します。ルート形状は便に属し、より効率的な送信のためにエンコードされたポリラインで構成されます。ルート形状は停留所等の位置を正確に横切る必要はありませんが、トリップ上のすべての停留所等は、そのトリップの形状からわずかな距離内、つまり形状 ポイントを結ぶ直線セグメントの近くに配置するするべきである。

**注意:** このmessageはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**shape_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ | 形状の識別子。(CSV) GTFS で定義されている`shape_id`とは異なる必要がしなければならない。<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |
|**encoded_polyline**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ | 形状のエンコードされたポリライン表現。このポリラインは少なくとも2つのポイントを含み、使用されるルートの完全な形状を表すしなければならない。エンコードされたポリラインの詳細については、https://developers.google.com/maps/documentation/utilities/polylinealgorithm をご覧ください。<br><br>**注意:**このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよい。 |

### _message_ Stop

フィードに動的に追加された新しい停留所を表します。すべてのフィールドは、(CSV) GTFS 仕様で説明されているとおりです。新しい停留所の場所タイプは `0` (ルート可能な停留所) です。

**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**stop_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ | 停留所の識別子。(CSV) GTFS で定義されている`stop_id`と異なる必要がしなければならない。|
|**stop_code**| [TranslatedString](#message-translatedstring) |任意| 1つ | (CSV) GTFS の [停留所等.stop_code](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**stop_name**| [TranslatedString](#message-translatedstring) |必須| 1つ | (CSV) GTFS の [停留所等 .stop_name](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**tts_stop_name**| [TranslatedString](#message-translatedstring) |任意| 1つ | (CSV) GTFS の [停留所等.tts_stop_name](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**stop_desc**| [TranslatedString](#message-translatedstring) |任意| 1つ | (CSV) GTFS の [停留所等.stop_desc](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**stop_lat**| [float](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ | (CSV) GTFS の [停留所等.stop_lat](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**stop_lon**| [float](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1つ | (CSV) GTFS の [停留所等.stop_lon](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**zone_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | (CSV) GTFS の [停留所等.zone_id](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**stop_url**| [TranslatedString](#message-translatedstring) |任意| 1つ | (CSV) GTFS の [停留所等.stop_url](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**parent_station**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | (CSV) GTFS の [停留所等.parent_station](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**stop_timezone**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | (CSV) GTFS の [停留所等](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**wheelchair_boarding**| [WheelchairBoarding](#enum-wheelchairboarding) |任意| 1つ | (CSV) GTFS の [停留所等](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**level_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | (CSV) GTFS の [停留所等](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|
|**platform_code**| [TranslatedString](#message-translatedstring) |任意| 1つ | (CSV) GTFS の [停留所等](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stopstxt) の定義を参照してください。|

### _enum_ WheelchairBoarding

**Values**

| _**Value**_ | _**Comment**_ |
|-------------|---------------|
|**UNKNOWN**| 停留所のアクセシビリティ情報がありません。|
|**AVAILABLE**|この停留所の一部の車両には、車椅子の乗客が乗車できます。 |
|**NOT_AVAILABLE**| この停留所では車椅子での乗車はできません。 |

### _message_ TripModifications 

「TripModifications」メッセージは、迂回などの特定の変更によって影響を受ける類似の便のリストを識別します。

**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。
 
[便の変更についての詳細...](../../../documentation/realtime/feed-entities/trip-modifications)

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**selected_trips**| [SelectedTrips](#message-selectedtrips) |必須| 多数 | このTripModificationsの影響を受ける選択された便のリスト。少なくとも 1つの ` SelectedTrips ` を含める必要があります。値 `start_times` が設定されている場合、1つのtrip_idを持つ `SelectedTrips` を最大 1つリストできます。 |
|**start_times**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 多数 | trip_ids で定義されたtrip_idのリアルタイム便記述子の開始時刻のリスト。頻度ベースの便でtrip_idの複数の出発をターゲットにするのに役立ちます。 |
|**service_dates**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 多数 |Modificationが発生する日付 (YYYYMMDD 形式)。trip_idは、特定のサービスdateに実行される場合にのみ変更されます。便はすべての運行日に実行する必須はありません。プロデューサーは、次の 1 週間以内に発生する迂回のみを送信する必要がするべきである。提供された日付は、ユーザー向けの情報として使用しするべきではない。ユーザー向けの開始日と終了dateを提供する必要がある場合は、リンクされたサービスアラートで `service_alert_id` を使用して提供できます。 |
|**modifications**| [Modification](#message-modification) |必須| 多数 | 影響を受ける便に適用する変更のリスト。 |

### _message_ Modification

`Modification`メッセージは、`start_stop_selector` から始まる、影響を受ける各便に対する変更を説明します。

**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。

<img src="../../../assets/trip-modification.png"> 

特定の便に対するModificationの効果を示す例。このModificationは、他のいくつかの便にも適用されるしてもよい。_

<img src="../../../assets/propagated-delay.png"> 

伝播された迂回遅延は、Modificationの終了後にすべての停留所等に影響します。便に複数の変更がある場合、遅延は累積されます。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**start_stop_selector**| [StopSelector](#message-stopselector) |必須| 1つ | このModificationによって影響を受ける元の便の最初の停留所の停留所セレクター。`end_stop_selector` と組み合わせて使用​​します。`start_stop_selector` は必須であり、`travel_time_to_stop` で使用される参照停留所を定義するために使用されます。詳細については、[`travel_time_to_stop`](#message-replacementstop) を参照してください |
|**end_stop_selector**| [StopSelector](#message-stopselector) |条件付きで必須| 1つ | このModificationによって影響を受ける元の便の最後の停留所の停留所セレクター。選択は包括的であるため、そのModificationによって 1つの stop_time のみが置き換えられる場合は、`start_stop_selector` と `end_stop_selector` は同等であるしなければならない。stop_time が置き換えられない場合は、`end_stop_selector` を指定ししてはいけない。それ以外の場合は必須。 |
|**propagated_modification_delay**| [int32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ |Modificationによって挿入された最後の停留所の後のすべての出発時刻と到着時刻に追加する遅延の秒数。Modificationが形状のみに影響する場合 (つまり、`end_stop_selector` も `replacement_stops` も指定されていない場合)、遅延の伝播は `start_stop_selector` の後続の停留所で始まります。正または負の数値を指定できます。同じ便に複数の変更が適用されると、便が進むにつれて遅延が蓄積されます。<br/><br/>値が指定されていない場合、コンシューマーは他のデータに基づいて `propagated_modification_delay` を補間または推測するしてもよいがあります。 |
|**replacement_stops**| [ReplacementStop](#message-replacementstop) |任意| 複数 | 元の便の停留所を置き換える、代替の停留所等のリスト。新しい停車時刻の長さは、置き換えられた停車時刻の数よりも短くなったり、同じになったり、長くなったりするしてもよい。 |
|**service_alert_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | ユーザー向けの通信用にこのModificationを説明する`Alert`を含む`FeedEntity`messageからの`id`値。 |
|**last_modified_time**| [uint64](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ |このタイムスタンプは、Modificationが最後に行われた瞬間を識別します。POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数) です。|

### _message_ StopSelector 

停止のセレクター`stop_id`または`stop_sequence`のいずれか。2つの値のうち少なくとも 1つを指定するしなければならない。

**注意:** このフィールドはまだ**試験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**stop_sequence**| [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | 対応する GTFS フィードのstop_times.txtと同じであるしなければならないがあります。`StopSelector` 内では`stop_sequence`または`stop_id` のStopSelectorかを指定するしなければならない。両方のフィールドを空にすることはできません。 `stop_sequence` は、同じ stop_id を複数回訪れる便(ループなど) で、予測の対象となる停留所を明確にするために必須です。|
|**stop_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |条件付きで必須| 1つ | 対応する GTFS フィードのstops.txtと同じであるしなければならないがあります。`StopSelector` 内では`stop_sequence`または`stop_id` のStopSelectorかを指定するしなければならない。両方のフィールドを空にすることはできません。|

### _message_ SelectedTrips 

関連する形状を持つ選択された便のリスト。

<br><br>**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**trip_ids**| [uint32](https://protobuf.dev/programming-guides/proto2/#scalar) | 多数 | 1 | 包含する置換によって影響を受ける元の（CSV）GTFS のtrip_idのリスト。少なくとも 1 つのtrip_idを含める必要があります。`schedule_relationship=REPLACEMENT` が指定された`TripUpdate`が、この旅行にまだ存在してはしてはいけない。 |
|**shape_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 | このSelectedTrips内の変更された便の新しいシェイプのID 。同じ GTFS-RT フィード内の`Shape`messageを使用して追加された新しいシェイプ、または GTFS-Static フィードのshapes.txtで定義されている既存のシェイプを参照する場合がしてもよい。リアルタイム フィード内の`Shape`エンティティを参照する場合、このフィールドの値はエンティティ内の`shape_id`のいずれかであり、 `FeedEntity`の`id`ではありするべきであるん。|

### _message_ ReplacementStop 

各 `ReplacementStop` メッセージは、便で訪問する停留所を定義し、オプションで停留所までの推定移動時間を指定します。

**注意:** このフィールドはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。

<img src="../../../assets/first-stop-reference.png"> 

Modificationが旅程の最初の停留所に影響する場合、その停留所はModificationの参照停留所としても機能します。

**フィールド**

| _**フィールド名**_ | _**タイプ**_ | _**必須**_ | _**カーディナリティ**_ | _**説明**_ |
|------------------|------------|----------------|-------------------|-------------------|
|**stop_id**| [string](https://protobuf.dev/programming-guides/proto2/#scalar) |必須| 1 つ | 旅程で今後訪問される代替の停留所ID 。同じGTFS-RTフィード内のGTFS-RT `Stop`messageを使用して追加された新しい停留所、または（CSV）GTFSフィードの`stops.txt`で定義されている既存の停留所を参照する場合がしてもよい。リアルタイムフィード内の`Shape`エンティティを参照する場合、このフィールドの値はエンティティ内の`stop_id`のいずれかでするべきである、 `FeedEntity`の`id`ではありません。停留所は`location_type=0` （ルート可能な停留所）であるしなければならない。|
|**travel_time_to_stop**| [int32](https://protobuf.dev/programming-guides/proto2/#scalar) |任意| 1つ | この停留所への到着時間と参照停留所への到着時間の差 (秒単位)。参照停留所は、`start_stop_selector` の前の停留所です。Modificationが便の最初の停留所で開始される場合、便の最初の停留所が参照停留所になります。<br/><br/>この値は単調に増加するしなければならないがあり、元の便の最初の停留所が参照停留所である場合にのみ負の数になるしてもよい。<br/><br/>値が指定されていない場合、消費者は他のデータに基づいて `travel_time_to_stop` を補間または推測するしてもよい。|
