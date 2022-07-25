# GTFS Realtimeリアルタイムリファレンス

GTFS RealtimeRealtime フィードにより、交通機関は、サービスの中断（駅の閉鎖、路線の運休、重要な遅延など）に関するリアルタイムの情報を消費者に提供することができます。

フィードの仕様のバージョン2.0については、このサイトで説明し、文書化されています。有効なバージョンは "2.0", "1.0 "です。

### 用語の定義

#### 必須

GTFS v2.0以降では、_Required_カラムは、トランジットデータが有効であり、消費するアプリケーションにとって意味をなすために、生産者が提供しなければならないフィールドを記述している。

_Required_欄には、以下の値が使用される。

*   Required（**必須**）。このフィールドは、GTFS フィード プロデューサーによって提供されなければならない。
*   **Conditionally required（条件付き必須**）。Conditionally required：このフィールドは特定の条件下で必須であり、その概要は「フィールドの_説明_」に記載されている。これらの条件以外では、このフィールドは任意である。
*   **オプション**。このフィールドはオプションであり、制作者が実装する必要はない。しかし、もしデータが基盤となる自動vehicle位置情報システム（例えば、VehiclePosition `timestamp`）で利用可能であれば、製作者は可能な限りこれらのオプションフィールドを提供することが推奨される。

_GTFSバージョン1.0ではセマンティック要件が定義されていないため、`gtfs_realtime_version` `1の`フィードはこれらの要件を満たさない可能性があることに注意する（詳細は[セマンティック要件に関する提案書を](https://github.com/google/transit/pull/64)_参照）。

#### カーディナリティ

_Cardinalityは_、特定のフィールドに提供できる要素の数を表し、以下の値がある。

*   **One**- このフィールドには、1つの要素を指定することができる。これは[プロトコルバッファの_必須(Required)_および_オプション(Optional)の_](https://developers.google.com/protocol-buffers/docs/proto#simple)カーディナリティに対応する。
*   **Many**- このフィールドには、多くの要素(0、1、またはそれ以上)が提供されるかもしれない。これは、プロトコルバッファの[ _繰り返し_](https://developers.google.com/protocol-buffers/docs/proto#simple)カーディナリティにマッピングされる。

フィールドが必須、条件付き必須、オプションのいずれであるかを確認するには、常に_Required_および_Description_フィールドを参照すること。プロトコルバッファのカーディナリティについては、[GTFS-realtime/proto/GTFS-realtime.proto">`GTFS`](<https://github.com/google/transit/blob/master/\<glossary variable=>).proto を参照してください。

#### プロトコルバッファーデータタイプ

以下のプロトコルバッファのデータ型は、フィードエレメントを記述するために使用されます。

*   **message**複合型
*   **enum**。固定値のリスト

#### 実験的なフィールド

**experimentalと**ラベル付けされたフィールドは、変更の可能性があり、まだ仕様に正式に採用されていない。**実験的な**フィールドは、将来的に正式に採用される可能性がある。

## 要素インデックス

*   [FeedMessage](#message-feedmessage)
    *   [FeedHeader](#message-feedheader)
        *   [Incrementality](#enum-incrementality)
    *   [FeedEntity](#message-feedentity)
        *   [TripUpdate](#message-tripupdate)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [VehicleDescriptor](#message-vehicledescriptor)
                *   [WheelchairAccessible](#enum-wheelchairaccessible)
            *   [StopTimeUpdate](#message-stoptimeupdate)
                *   [StopTimeEvent](#message-stoptimeevent)
                *   [ScheduleRelationship](#enum-schedulerelationship)
                *   [StopTimeProperties](#message-stoptimeproperties)
            *   [TripProperties](#message-tripproperties)
        *   [VehiclePosition](#message-vehicleposition)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship-1)
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
                    *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [Cause](#enum-cause)
            *   [Effect](#enum-effect)
            *   [TranslatedString](#message-translatedstring)
                *   [Translation](#message-translation)
            *   [SeverityLevel](#enum-severitylevel)

## 要素

## _message_ FeedMessage

フィードmessage内容。ストリーム内のmessage、適切な HTTP GET リクエストに対する応答として取得されます。リアルタイムフィードは、常に既存のGTFSフィードに関連して定義される。すべてのentityIDは、GTFSフィードを基準として解決される。

**フィールド**

| _**フィールド名**_ | _**タイプ**_                         | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                            |
| ------------ | --------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------- |
| **header**   | [FeedHeader](#message-feedheader) | 必須       | 1              | このフィードとフィードmessageメタデータ。                                                                                            |
| **entity**   | [FeedEntity](#message-feedentity) | 条件付きで必須  | 多くの            | フィードの内容。  輸送システムで利用可能なリアルタイム情報がある場合、このフィールドは提供されなければならない。  このフィールドがEMPTYである場合、消費者はシステムで利用可能なリアルタイム情報がないものと考えるべきである。 |

## _message_ FeedHeader

フィードに関するメタデータで、フィードメッセージに含まれる。

**フィールド**

| _**フィールド名**_              | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                                                                                                           |
| ------------------------- | -------------------------------------------------------------------------- | -------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **gtfs_realtime_version** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必須       | 1個             | フィードの仕様のバージョン。現在のバージョンは2.0である。                                                                                                                                                                                                     |
| **Incrementality**        | [Incrementality](#enum-incrementality)                                     | 必須       | 1個             |                                                                                                                                                                                                                                    |
| **timestamp**             | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必須       | 1個             | このtimestamp、このフィードのコンテンツが作成された時点 (サーバtime) を表します。POSIXtime(1970 年 1 月 1 日 00:00:00 UTC 以降の秒数) で指定します。リアルタイム情報を生成・消費するシステム間のtimeずれを避けるため、timestamp timeサーバから取得することを強く推奨します。数秒までのtime許容されるため、Stratum 3またはそれ以下の階層のサーバーを使用することは全く問題ない。 |

## _enum_ Incrementality

現在のフェッチがインクリメンタルであるかどうかを判断する。

*   **FULL_DATASET**: このフィードの更新は、それまでのフィードのリアルタイム情報をすべて上書きする。したがって、この更新はすべての既知のリアルタイム情報のFULLスナップショットを提供することが期待されます。
*   **DIFFERENTIAL**: 現在、このモードは**サポートされて**おらず、このモードを使用するフィードの動作は**指定されて**いません。[GTFS-realtime">GTFS Realtime](<https://groups.google.com/group/\<glossary variable=>)Realtime メーリングリストでは、DIFFERENTIALモードの挙動について議論されており、その議論がまとまった時点でドキュメントが更新される予定です。

**値**

| _**値**_          |
| ---------------- |
| **FULL_DATASET** |
| **DIFFERENTIAL** |

## _message_ FeedEntity

トランジットフィードにおけるentity定義(または更新)。entity削除されない場合は、trip_update',vehicle',Alert',Shape' フィールドのうち、ちょうど1つが入力されている必要があります。

**フィールド**

| _**フィールド名**_    | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                                                                      |
| --------------- | -------------------------------------------------------------------------- | -------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**          | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必須       | 1個             | このentityフィード固有識別子。この ID は、Incrementalityサポートを提供するためにのみ使用されます。フィードから参照される実際のエンティティは、 明示的なセレクタで指定する必要があります (INFO、以下のEntitySelectorを参照ください)。                                                     |
| **is_deleted**  | [bool](https://developers.google.com/protocol-buffers/docs/proto#scalar)   | オプション    | 一人             | このentity削除されるかどうか。DIFFERENTIALのIncrementality持つフィードに対してのみ指定する必要があります。 -FULL_DATASET のIncrementality持つフィードに対しては、このフィールドを指定してはいけません。                                                            |
| **trip_update** | [TripUpdate](#message-tripupdate)                                          | 条件付きで必須  | 一人             | tripリアルタイムのdeparture遅延に関するデータ。 trip_update、vehicle、Alert、Shapeフィールドのうち、少なくとも1つは提供されなければならない - これらすべてのフィールドをEMPTYすることはできない。                                                                    |
| **vehicle**     | [VehiclePosition](#message-vehicleposition)                                | 条件付きで必須  | 一人             | vehicleリアルタイムのPositionデータ。trip_update、vehicle、Alert、Shapeうち少なくとも1つのフィールドが提供されなければならない - これらすべてのフィールドをEMPTYすることはできない。                                                                          |
| **Alert**       | [Alert](#message-alert)                                                    | 条件付きで必須  | 一人             | リアルタイムのAlertデータ。trip_updatedate、vehicle、Alert、Shapeうち少なくとも1つのフィールドが提供されなければならない - これらすべてのフィールドをEMPTYすることはできない。                                                                                |
| **Shape**       | [Shape](#message-shape)                                                    | 条件付きで必須  | 一人             | DETOURようなリアルタイムのADDED形状に関するデータ。trip_update、vehicle、Alert、Shapeうち少なくとも1つのフィールドを指定する必要があります - これらすべてのフィールドをEMPTYすることはできません。 <br/><br/>**注意**この分野はまだ **実験的**であり、変更される可能性があります。将来、正式に採用される可能性がある。 |

## _message_ TripUpdate

trip中のvehicle進行状況をリアルタイムに表示します。[trip-updates">trip](</realtime/\<glossary variable=>)一般的な議論も参照してください。

ScheduleRelationship値に応じて、TripUpdate指定することができます。

*   スケジュールに沿って進行するtrip。
*   スケジュールに沿って進行するtrip。
*   スケジュールに関してADDEDまたは削除されたtrip。
*   静的なGTFSある既存のtripコピーである新しいtrip。TripProperties指定された運行time運行されます。

更新は、将来予測されるarrivalイベント、またはすでに発生した過去のイベントに対して行うことができます。多くの場合、過去のイベントに関する情報は測定値であるため、そのuncertainty値は0であることが推奨されます。しかし、そうでない場合もあるため、過去のイベントのuncertainty値が0と異なることは許容されます。更新のuncertainty性が0でない場合、その更新は完了していないtripおおよその予測であるか、測定が正確でないか、またはイベント発生後に検証されていない過去の予測であるかのいずれかである。

vehicle同じブロック内で複数のトリップに対応している場合（トリップとブロックの詳細については、[GTFS trips.txt](/schedule/reference/#tripstxt)参照してください）。

*   フィードには、そのvehicle現在担当しているtrip TripUpdateを含める必要があります。生産者は、このvehicleブロックの現在のtrip後に、1つ以上のトリップのTripUpdateを含めることが推奨されます（生産者が将来のtrip予測の品質に自信を持っている場合）。同じvehicle複数のTripUpdateを含めることで、vehicleあるtrip別の旅行に移行する際に利用者が予測の「ポップイン」を避けることができ、また、下流の旅行に影響を与える遅延を利用者に事前に知らせることができます（例：既知のdelay旅行間の計画された待ち時間を超える場合など）。
*   の場合、それぞれのTripUpdateエンティティは、ブロック内でSCHEDULEDされるのと同じ順序でフィードにADDEDされる必要はない。たとえば、`trip_id が`1、2、3 ですべて 1 つのブロックに属するトリップがあり、vehicle trip1、trip2、trip3 の順に移動する場合、`trip_update`エンティティは任意の順序で表示できます。たとえば、trip2、trip1、trip3 と追加してもよいことになっています。

更新は、すでに終了したtrip記述できることに注意する。最終目的地へのarrival time過去のものである場合、クライアントはtrip全体が過去のものであると判断する（重要ではないが、以前の目的地の更新も提供することは可能である）。このオプションは、予定より早く終了したtrip最も関連性があるが、スケジュール によると、trip現在のtime進行中である。このtrip更新を削除すると、クライアントはtripまだ進行中であると みなされる可能性がある。フィードプロバイダーは、過去の更新を削除することができるが、必須ではないことに注意。

**フィールド フィールド フィールド フィールド**

| _**フィールド名**_         | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                                                                                                                                                                                                                                                                            |
| -------------------- | -------------------------------------------------------------------------- | -------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**             | [TripDescriptor](#message-tripdescriptor)                                  | 必須       | 一人             | このmessage適用されるtrip。実際のtripごとに最大1つのTripUpdate entity存在することができる。1つもない場合は、利用可能な予測情報がないことを意味します。しかし _ない_tripスケジュール通りに進行していることを意味する。                                                                                                                                                                                                                                                                     |
| **vehicle**          | [VehicleDescriptor](#message-vehicledescriptor)                            | オプション    | 一人             | このtripサービスを提供しているvehicle追加情報。                                                                                                                                                                                                                                                                                                                                                                       |
| **stop_time_update** | [StopTimeUpdate](#message-stoptimeupdate)                                  | 条件付きで必要  | 多くの            | tripStopTimeの更新（未来のもの、つまり予測、場合によっては過去のもの、つまりすでに起こったものの両方）。更新はstop_sequenceソートされ、次に指定されたstop_time_update tripすべての次の停留所に適用される必要がある。  少なくとも1つのstop_time_update、schedule_relationship CANCELEDまたはDUPLICATEDでない限り、そのtrip提供されなければなりません。trip DUPLICATED場合、stop_time_updatesは新しいtripリアルタイム情報を示すために提供されるかもしれません。                                                                                             |
| **timestamp**        | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | 将来のStopTimesを推定するために、vehicleリアルタイム進捗を測定した直近の瞬間。過去の StopTimes が提供される場合、arrival時刻はこの値より早いかもしれない。POSIXtime（すなわち、1970年1月1日00:00:00 UTCからの秒数）。                                                                                                                                                                                                                                                           |
| **delay**            | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | オプション    | 一人             | delay、GTFS既存のスケジュールとの相対的な予測を行う場合にのみ指定する必要があります。<br/>delay delay(秒)は、正(vehicleいることを意味する)または負(vehicle予定より進んでいることを意味する)とすることができる。<br/>delay値が0であれば、車両は時間通りであることを意味します。StopTimeUpdatedelay情報は、trip delay情報よりも優先されます。<br/>フィード・プロバイダーは、データの鮮度を評価するために、delay値が最後に更新された日時を示すTripUpdate.timestamp値を提供することが強く推奨される。<br/><br/>**注意：注意：注意：注意：注意：注意：注意：注意**このフィールドはまだ **実験的**であり、変更される可能性がある。将来、正式に採用されるかもしれない。 |
| **trip_properties**  | [TripProperties](#message-tripproperties)                                  | オプション    | 一人             | trip更新されたプロパティを提供する。 <br/><br/>**注意：注意：注意：注意：注意：注意：注意：注意：注意**このmessageまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                                                                                                                                                |

## _message_ StopTimeEvent

単一の予測されたイベント（arrivalまたはdepartureいずれか）のためのタイミング情報。タイミングは、delay推定time、およびuncertaintyなる。

*   delay、予測がGTFS の既存のスケジュールと関連して与えられる場合に使用されるべきである。
*   timeは、予測されるスケジュールがあるなしにかかわらず、指定されるべきものです。time delay両方が指定された場合、time優先されます(ただし、通常、SCHEDULED trip time指定された場合、GTFS SCHEDULED time+delay等しくなるはずです)。

uncertainty time delay両方に等しく適用される。uncertainty性は、真のdelay予想誤差をおおまかに特定します（ただし、その正確な統計的意味はまだ定義されていません）。例えば、コンピュータのタイミング制御の下で運転される列車では、uncertaintyさが0になることもあり得ます。

**フィールド**

| _**フィールド名**_    | _**タイプ**_                                                                 | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                 |
| --------------- | ------------------------------------------------------------------------- | -------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| **delay**       | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | delay delay(秒)は、正の値(vehicleいることを意味する)と負の値(vehicle予定より進んでいることを意味する)がある。 delay timeどちらかをStopTimeEvent内で指定する必要があり、両方のフィールドをEMPTYすることはできません。 |
| **time**        | [int64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | 絶対timeイベント。POSIXtime（すなわち、1970年1月1日午前0時00分00秒UTCからの秒数）。delayまたはtimeいずれかがStopTimeEvent内で提供されなければならない - 両方のフィールドをEMPTY にすることはできない。         |
| **uncertainty** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | uncertainty省略された場合、unknownとして解釈されます。完全に確実な予測を指定するには、そのuncertainty性を0に設定します。                                                              |

## _message_ StopTimeUpdate

trip所定の停留所のarrival／またはdepartureイベントに関するリアルタイム更新。[message-tripdescriptor">TripDescriptor](<#\<glossary variable=>)および[trip-updates">trip](</realtime/\<glossary variable=>)updatesエンティティのドキュメントにある停車time更新の一般的な説明も参照し てください。

更新は過去と未来の両方のイベントに対して供給することができる。プロデューサは、必須ではありませんが、過去のイベントを削除することができます。

更新はstop_sequenceまたはstop_id特定のストップにリンクされるので、これらのフィールドのいずれかが必ず設定されなければならない。 同じstop_idを 1 つのtrip複数回訪れる場合は、そのtripそのstop_idのすべての StopTimeUpdate でstop_sequenceが提供される必要があります。

**分野**

| _**フィールド名**_                   | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**商品説明**_                                                                                                                                                                                                                                                                                                    |
| ------------------------------ | -------------------------------------------------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **stop_sequence**              | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | 対応するGTFSフィードのstop_times.txt同じである必要があります。 stop_sequence、同じstop_id2回以上訪れるトリップ（例：ループ）において、どの停留所の予測なのかを曖昧にしないために必要とされます。もし `StopTimeProperties.assigned_stop_id`が入力されている場合は `stop_sequence`は入力されていなければならない。                                                                                                       |
| **stop_id**                    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | 対応するGTFSフィードのstops.txt同じである必要があります。StopTimeUpdateでは、stop_sequenceとstop_idのどちらかを指定する必要があります。もし `StopTimeProperties.assigned_stop_id`が入力されている場合は、省略することが望ましい。 `stop_id`のみを使用します。 `stop_sequence`.もし `StopTimeProperties.assigned_stop_id`と `stop_id`が入力されている場合は、省略し `stop_id`と一致しなければなりません。 `assigned_stop_id`. |
| **arrival**                    | [StopTimeEvent](#message-stoptimeevent)                                    | 条件付きで必要  | 一人             | schedule_relationship EMPTYまたはSCHEDULED場合、arrivalまたはdepartureどちらかをStopTimeUpdate内で提供する必要があります - 両フィールドをEMPTYすることはできません。schedule_relationship SKIPPED場合、arrival departure両方ともEMPTYなる可能性があります。 schedule_relationshipNO_DATAの場合、arrival departure EMPTYでなければなりません。                                               |
| **departure**                  | [StopTimeEvent](#message-stoptimeevent)                                    | 条件付きで必要  | 一人             | schedule_relationship EMPTYまたはSCHEDULED場合、arrivalまたはdepartureどちらかがStopTimeUpdate内で提供されなければなりません - 両フィールドともEMPTYすることはできません。sschedule_relationship SKIPPED場合、arrival departure両方ともEMPTYすることができます。 schedule_relationshipNO_DATAの場合、arrival departure EMPTYでなければなりません。                                            |
| **departure_occupancy_status** | [OccupancyStatus](#enum-occupancystatus)                                   | オプション    | 一人             | 指定された停留所からdepartureした直後のvehicle予測される乗客の占有状況。提供する場合、stop_sequenceを指定する必要がある。リアルタイムのarrivalまたはdeparture予測を提供せずにdeparture_occupancy_status提供するために、このフィールドを入力し、StopTimeUpdate設定します。 <br/><br/>**注意：注意：注意：注意：注意：注意：注意：注意：注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                |
| **schedule_relationship**      | [ScheduleRelationship](#enum-schedulerelationship)                         | オプション    | 一人             | デフォルトの関係はSCHEDULEDである。                                                                                                                                                                                                                                                                                        |
| **stop_time_properties**       | [StopTimeProperties](#message-stoptimeproperties)                          | オプション    | 一人             | GTFS stop_times.txt内で定義された特定のプロパティに対するリアルタイム更新。 <br/><br/>**注意：注意：注意：注意：注意：注意：注意：注意：注意：注意**このフィールドはまだです **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                           |

## _enum_ ScheduleRelationship

このStopTimeと静的スケジュールとの関係。

**値**

| _**値**_         | _**コメント**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SCHEDULED**   | vehicle静的な停車スケジュールに従って進行しているが、必ずしもスケジュールの時間通りに進行している必要はない。これは **デフォルト**の動作である。arrival departure少なくとも一方は提供されなければならない。頻度ベースのトリップGTFS frequencies.txtで exact_times = 0）はSCHEDULED値を持つべきではなく、UNSCHEDULEDを代わりに使用する必要がある。                                                                                                                                                                                                                                                                     |
| **SKIPPED**     | この停留所はSKIPPEDであり、vehicleこの停留所には停車しない。設定された場合 `SKIPPED`は、同じtrip内の後続の停留所には伝搬されない(つまり、vehicle trip内の後続の停留所でも、その停留所が `stop_time_update`と `schedule_relationship: SKIPPED`を持たない限り、delay停車駅に停車する）。 _する_を越えて伝搬する。 `SKIPPED`となる。言い換えれば、もし `stop_time_update`が設定されている場合 `arrival`または `departure`が設定されていない場合，その停留所より上流の予測は `SKIPPED`の上流にある予測は `SKIPPED`が設定されていない場合、その上流の予測は、その停車駅の後の停車駅に伝搬されます。 `SKIPPED`が設定されるまで、その停留所以降の停留所に伝搬される。 `stop_time_update`が設定されるまで、その停車駅の上流にある予測は、その停車駅の次の停車駅に伝播します。 |
| **NO_DATA**     | この停留所のデータは与えられていない。これは、利用可能なリアルタイムのタイミング情報がないことを示す。NO_DATA を設定すると、後続の停留所に伝搬されるので、どの停留所からリアルタイムのタイミング情報がないかを指定する方法として推奨される。NO_DATA を設定した場合、arrival departureどちらも指定してはならない。                                                                                                                                                                                                                                                                                                               |
| **UNSCHEDULED** | vehicle周波数ベースのtripGTFS frequencies.txtで exact_times = 0)で運行中である。GTFS frequencies.txt で定義されていないトリップや、GTFS frequencies.txttxt で exact_times = 1 のトリップには、この値を使用してはならない。を含むトリップ `stop_time_updates`あり `schedule_relationship: UNSCHEDULED`は、TripDescriptorも設定する必要があります。 `schedule_relationship: UNSCHEDULED` <br/><br/>**注意**このフィールドはまだです **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                       |

## _message_ StopTimeProperties

GTFS stop_times.txt内で定義された特定のプロパティに対するリアルタイム更新。

**注意：**このmessageまだ**実験的な**ものであり、変更される可能性がある。将来、正式に採用される可能性がある。<br/>

**分野**

| _**フィールド名**_         | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**商品説明**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| -------------------- | -------------------------------------------------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **assigned_stop_id** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | リアルタイムの停止位置の割り当てをサポートします。を指す。 `stop_id`GTFSで定義されている `stops.txt`. <br/>新しい `assigned_stop_id`は、endユーザーのtrip体験を大きく変えるものであってはならない。 `stop_id`を含むトリップは、GTFSで定義されている `stop_times.txt`.言い換えれば、endユーザはこの新し `stop_id`新しい停留所が追加のコンテキストなしにアプリ内で提示された場合、"異常な変更 "と見なされる。例えば、このフィールドは、プラットフォーム割り当てのために、次のようなものを使用することを意図している。 `stop_id`は，もともとGTFS定義された停留所と同じ駅に属するものでなければなりません． `stop_times.txt`. <br/>リアルタイムのarrivalまたはdeparture予測を提供せずに停留所を割り当てるには、このフィールドに値を入力し、.NETを設定します。 `StopTimeUpdate.schedule_relationship = NO_DATA`. <br/>このフィールドが入力されている場合 `StopTimeUpdate.stop_sequence`は必ず入力し `StopTimeUpdate.stop_id`は入力してはならない。停車駅の割り当ては、他のGTFS・フィールドにも反映されるべきである（例． `VehiclePosition.stop_id`). <br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。 |

## _message_ TripProperties

trip更新されたプロパティを定義する

**注意：**このmessageまだ**実験的な**ものであり、変更される可能性がある。将来は正式に採用されるかもしれない。<br/>.

**分野**

| _**フィールド名**_   | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**商品説明**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| -------------- | -------------------------------------------------------------------------- | -------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | (CSV)GTFS trips.txt定義された既存のtrip重複するが、異なる運行日time（start_dateで定義） にstartする新しいtrip識別子を定義する。 `TripProperties.start_date`と `TripProperties.start_time`).の定義をご参照ください。 `trips.trip_id`の定義を参照してください。この値は、(CSV)GTFS で使用されている値とは異なるものでなければならない。の場合、このフィールドは必須である。 `schedule_relationship`は `DUPLICATED`それ以外の場合，このフィールドは入力してはならず，コンシューマはこのフィールドを無視します。 <br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **start_date** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | DUPLICATED trip実行されるサービス日。YYYYMMDD 形式で提供されなければならない。このフィールドは以下の場合に必要である。 `schedule_relationship`は `DUPLICATED`それ以外の場合、このフィールドは入力されてはならず、消費者によって無視される。 <br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **start_time** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | DUPLICATEDされるtrip departure start time定義する。の定義を参照。 `stop_times.departure_time`(CSV)GTFS における定義を参照のこと。DUPLICATED trip SCHEDULED arrival時刻およびdeparture時刻は、元のtripこのフィールドとの間のオフセットを基に計算される。 `departure_time`とこのフィールドのオフセットに基づいて計算されます。例えば、GTFS trip停留所Aに `departure_time`の `10:00:00`であり、停留所Bは `departure_time`の `10:01:00`という値が入力されている場合、このフィールドの値は `10:30:00`の値が入力されている場合、DUPLICATED trip停留所BにはSCHEDULED`departure_time`の `10:31:00`.リアルタイム予測 `delay`の値は、この計算されたスケジュールtime適用され、予測time決定する。例えば、停留所Bのdeparture時刻が `delay`の `30`が提供された場合、予測されるdeparture timeBとなる。 `10:31:30`.リアルタイム予測 `time`の値にはオフセットがかからず、提供された予測time示す。  例えば、10:31:30を表すdeparture提供された場合 `time`10:31:30 を表す出発が停留所 B に対して提供されている場合、予測されるdeparture time`10:31:30`.このフィールドは、以下の場合に必要である。 `schedule_relationship`は `DUPLICATED`それ以外の場合、このフィールドは入力してはならず、消費者によって無視される。 <br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。 |
| **shape_id**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | このtrip vehicle走行経路のShape、オリジナルと異なる場合に指定する。(CSV)GTFSで定義されたShape、またはリアルタイムフィードの新規Shape entity指す。の定義を参照。 `trips.shape_id`(CSV)GTFS に含まれる場合、このフィールドは必須です。 <br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

## _message_ VehiclePosition

あるvehicleリアルタイム測位情報。

**分野**

| _**フィールド名**_               | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**商品説明**_                                                                                                                                                                                                                                                                                                                                                                        |
| -------------------------- | -------------------------------------------------------------------------- | -------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**                   | [TripDescriptor](#message-tripdescriptor)                                  | オプション    | 一人             | このvehicleサービスを提供しているtrip。vehicle trip識別できない場合、EMPTYまたは partial を指定することができる。                                                                                                                                                                                                                                                                                                       |
| **vehicle**                | [VehicleDescriptor](#message-vehicledescriptor)                            | オプション    | 一人             | このtrip提供しているvehicle追加情報。各エントリには **一意**vehicle id。                                                                                                                                                                                                                                                                                                                                 |
| **Position**               | [Position](#message-position)                                              | オプション    | 一人             | このvehicle現在Position。                                                                                                                                                                                                                                                                                                                                                              |
| **current_stop_sequence**  | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | 現在の停車駅の停車駅シーケンスインデックス。current_stop_sequenceの意味（参照する停留所）はcurrent_status によって決定される。current_statusがない場合、IN_TRANSIT_TOと見なされる。                                                                                                                                                                                                                                                         |
| **stop_id**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | 現在の停車駅を特定する。対応するGTFSフィードのstops.txt同じ値である必要がある。もし `StopTimeProperties.assigned_stop_id`を割り当てるために使用される場合，このフィールドは `stop_id`を割り当てるために使用される場合、このフィールドは以下の変更も反映する必要がある。 `stop_id`.                                                                                                                                                                                                     |
| **current_status**         | [VehicleStopStatus](#enum-vehiclestopstatus)                               | オプション    | 一人             | 現在の停車位置に関するvehicle正確な状態。current_stop_sequenceが存在しない場合は無視される。                                                                                                                                                                                                                                                                                                                      |
| **timestamp**              | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | vehicle Position測定された瞬間。POSIXtime（1970年1月1日00:00:00 UTCからの秒数）。                                                                                                                                                                                                                                                                                                                    |
| **congestion_level**       | [CongestionLevel](#enum-congestionlevel)                                   | オプション    | 一人             |                                                                                                                                                                                                                                                                                                                                                                                   |
| **occupancy_status**       | [OccupancyStatus](#enum-occupancystatus)                                   | _オプション_  | 一人             | vehicleまたは車台の乗客の占有状態。multi_carriage_detailsにキャリッジごとのOccupancyStatus が設定されている場合、このフィールドは、乗客を受け入れているすべてのキャリッジを考慮した上で、vehicle全体を記述する必要がある。<br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                                     |
| **occupancy_percentage**   | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | vehicle搭乗率を示すパーセンテージ値。値100は、座席と立席の両方を含む、vehicle設計され、現行の運用規則で許容される最大乗員数の合計を表すべきである。設計上の最大定員を超える乗客がいる場合、値は100を超える可能性がある。occupancy_percentage精度は、個々の乗客の乗降を追跡できない程度に低くする必要がある。multi_carriage_detailscarriage毎のoccupancy_percentage入力されている場合、このフィールドは乗客を受け入れている全ての車両を考慮した上で、vehicle全体を記述する必要がある。<br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。 |
| **multi_carriage_details** | [CarriageDetails](#message-CarriageDetails)                                | オプション    | 多くの            | この与えられたvehicle複数のキャリッジの詳細。最初の出現は、そのvehicle最初のキャリッジを表す。 **現在の進行方向から見て**.multi_carriage_detailsフィールドの出現回数は、vehicle台車の数を表す。また、エンジンやMAINTENANCE車両など、乗車できない車両も含まれる。これは、プラットフォームでどこに立てばよいかという貴重な情報を乗客に提供するためである。<br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                  |

## _enum_ VehicleStopStatus

**値**

| _**値**_           | _**コメント**_                                               |
| ----------------- | -------------------------------------------------------- |
| **INCOMING_AT**   | vehicle停留所に到着するところである（停留所表示では、vehicleシンボルが点滅するのが一般的である）。 |
| **STOPPED_AT**    | vehicle停車駅に停車中である。                                       |
| **IN_TRANSIT_TO** | vehicle前の停留所を出発し、通過中である。                                 |

## _enum_ CongestionLevel

このvehicle影響を及ぼしているCONGESTIONレベル。

**値**

| _**値**_                      |
| ---------------------------- |
| **UNKNOWN_CONGESTION_LEVEL** |
| **RUNNING_SMOOTHLY**         |
| **STOP_AND_GO**              |
| **CONGESTION**               |
| **SEVERE_CONGESTION**        |

## _enum OccupancyStatus_

vehicleまたはキャリッジの乗客の占有状態。

個々の生産者は、すべてのOccupancyStatus値を公開しないかもしれません。したがって、消費者は、OccupancyStatus値が直線的な尺度に従うと仮定してはならない。消費者は、OccupancyStatus値を、製作者が示し、意図した状態として表現する必要がある。同様に、制作者は実際のvehicle占有状態に対応したOccupancyStatus値を使用しなければならない。

リニアスケールでの乗客の占有レベルの記述については、`occupancy_percentage` を参照のこと。

**注意：**このフィールドはまだ**実験的な**ものであり、変更される可能性がある。将来的には正式に採用される可能性がある。

_**値**_

| _**値**_                          | _**コメント**_                                                                           |
| -------------------------------- | ------------------------------------------------------------------------------------ |
| _**EMPTY**_                      | _このvehicleほとんどの指標でEMPTYみなされ、乗客はほとんど、あるいは全く乗っていないが、まだ乗客を受け入れている。_                     |
| _**MANY_SEATS_AVAILABLE**_       | _このvehicle客車には、多くの空席があります。このカテゴリに入るのに十分な大きさと見なされる、利用可能な全座席のうちの自由席の量は、製作者の裁量で決定されます。_ |
| _**FEW_SEATS_AVAILABLE**_        | _このvehicle・台車は、利用可能な座席数が少ない。このカテゴリーに該当するほど少ないとみなされる全座席のうち自由席の量は、製作者の裁量で決定されます。_      |
| _**STANDING_ROOM_ONLY**_         | _現在、vehicle客車は立っている乗客しか収容できない。_                                                      |
| _**CRUSHED_STANDING_ROOM_ONLY**_ | _現在、vehicle客車は立っている乗客しか乗せることができず、そのスペースは限られています。_                                    |
| _**FULL**_                       | _このvehicle、ほとんどの測定でFULLみなされますが、まだ乗客の搭乗を許可している可能性があります。_                              |
| _**NOT_ACCEPTING_PASSENGERS**_   | _このvehicleまたはキャリッジは乗客を受け入れていません。このvehicleまたはキャリッジは通常、乗客の乗車を受け入れています。_                |
| _**NO_DATA_AVAILABLE**_          | _そのvehicleまたはキャリッジは、time時点で利用可能な搭乗率データを持っていません。_                                     |
| _**NOT_BOARDABLE**_              | _そのvehicle客車は乗車可能ではなく、乗客を受け入れることはない。特殊な車両やキャリッジ（エンジン、MAINTENANCEキャリッジなど...）に有用である。_  |

## _message_ CarriageDetails

複数の客車で構成される車両に使用される、客車固有の詳細。

注意**:**このmessageまだ実験**的な**ものであり、変更される可能性があります。将来、正式に採用される可能性があります。

**分野**

| _**フィールド名**_             | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**商品説明**_                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------------ | -------------------------------------------------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **id**                   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | キャリッジの識別。vehicleごとにユニークであるべき。 <br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                                                                                                                                                                                                                   |
| **label**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | 車両を識別するために乗客に表示される可能性のある、ユーザーが見えるlabel。例"7712"、"車両ABC-32 "など... <br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                                                                                                                                                                                      |
| **occupancy_status**     | [OccupancyStatus](#enum-occupancystatus)                                   | オプション    | 一人             | このvehicle、このキャリッジの占有状況。デフォルトは `NO_DATA_AVAILABLE`.<br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                                                                                                                                                                                               |
| **occupancy_percentage** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | オプション    | 一人             | このvehicle、この車両の乗車率。VehiclePosition.occupancy_percentage "と同じルールに従う。このキャリッジのデータがない場合は、-1 を使用する。<br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。                                                                                                                                                                                                                                                                   |
| **carriage_sequence**    | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必須       | 一人             | CarriageStatus のvehicleリスト内の他の車両に対する、このキャリッジの順序を識別する。進行方向の最初のキャリッジは値 1 を持たなければならず、2 番目の値は進行方向の 2 番目のキャリッジに対応し、値 2 を持たなければならない、といった具合に。例えば、進行方向の1番目のキャリッジの値が1であり、進行方向の2番目のキャリッジの値が3である場合、消費者はすべてのキャリッジのデータ（すなわち、multi_carriage_detailsフィールド）を破棄する。データのない馬車は、有効なcarriage_sequence番号で表現されなければならず、データのないフィールドは省略されなければならない（代わりに、それらのフィールドを含めて「データなし」の値に設定することもできる）。 <br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。 |

## Alert

公共交通機関のネットワークで何らかのインシデントが発生したことを示すAlertです。

**フィールド**

| _**フィールド名**_               | _**タイプ**_                                     | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                                                                                                                                                                   |
| -------------------------- | --------------------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **active_period**          | [TimeRange](#message-timerange)               | オプション    | 多くの            | Alertユーザーに表示されるtime。指定しない場合は、フィードに表示されている間、Alert表示されます。複数の範囲が指定された場合、Alertそのすべての範囲に表示されます。                                                                                                                                                                                                 |
| **informed_entity**        | [EntitySelector](#message-entityselector)     | 必須       | 多数             | このAlertユーザに通知すべきエンティティ。  少なくとも1つのinformed_entity指定する必要があります。                                                                                                                                                                                                                               |
| **Cause**                  | [Cause](#enum-cause)                          | オプション    | 一人             |                                                                                                                                                                                                                                                                                            |
| **Effect**                 | [Effect](#enum-effect)                        | オプション    | 一人             |                                                                                                                                                                                                                                                                                            |
| **url**                    | [TranslatedString](#message-translatedstring) | オプション    | 一人             | Alert追加情報を提供するurl。                                                                                                                                                                                                                                                                         |
| **header_text**            | [TranslatedString](#message-translatedstring) | 必須       | 一人             | Alertheader。このプレーンテキストstring、太字などで強調表示されます。                                                                                                                                                                                                                                                |
| **description_text**       | [TranslatedString](#message-translatedstring) | 必須       | 一人             | Alertための説明。このプレーンテキストstring、Alert本文としてフォーマットされます(または、ユーザーによる明示的な "展開 "リクエストで表示されます)。説明の情報は、header情報に追加する必要があります。                                                                                                                                                                           |
| **tts_header_text**        | [TranslatedString](#message-translatedstring) | オプション    | 一人             | textの実装に使用されるAlert header含むtext。このフィールドは、header_text のtextバージョンです。header_text同じ情報を含むが、text合成で読めるようにフォーマットされている必要がある（例えば、略語の削除、数字のスペルアウトなど）。                                                                                                                                                |
| **tts_description_text**   | [TranslatedString](#message-translatedstring) | オプション    | 一人             | 音声text実装に使用されるAlert説明を含むtext。このフィールドは、description_text のtextバージョンである。description_textと同じ情報を含みますが、音声text用にフォーマットされている必要があります (例えば、省略形の削除、数字のスペルアウトなど)。                                                                                                                                      |
| **severity_level**         | [SeverityLevel](#enum-severitylevel)          | オプション    | 一人             | Alert深刻度。                                                                                                                                                                                                                                                                                  |
| **image**                  | [TranslatedImage](#message-translatedimage)   | オプション    | 一人             | text表示されるTranslatedImage。DETOUR、駅閉鎖などのAlert Effect視覚的に説明するために使用される。image Alert理解を深めるものでなければならず、重要な情報の唯一の場所であってはならない。以下のタイプの画像は推奨されない： 主にtext含むimage、マーケティング用またはブランド用の画像で、追加的な情報を提供しないもの。 <br/><br/>**注意**このフィールドはまだ **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。それは将来、正式に採用されるかもしれない。            |
| **image_alternative_text** | [TranslatedString](#message-translatedstring) | オプション    | 一人             | リンクされたimage外観を説明するtext。 `image`フィールドにリンクされた画像の外観を説明するテキスト（例：アクセシビリティ上の理由でimage表示できない場合、またはユーザーがimage見ることができない場合など）。alt画像テキストについては、HTML [の仕様を参照してください。](https://html.spec.whatwg.org/#alt). <br/><br/>**注意**this field is still **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。将来的に正式に採用される可能性があります。 |

## _enum_ Cause

このAlertCause

**値**

| _**値**_               |
| --------------------- |
| **UNKNOWN_CAUSE**     |
| **OTHER_CAUSE**       |
| **TECHNICAL_PROBLEM** |
| **STRIKE**            |
| **DEMONSTRATION**     |
| **ACCIDENT**          |
| **HOLIDAY**           |
| **WEATHER**           |
| **MAINTENANCE**       |
| **CONSTRUCTION**      |
| **POLICE_ACTIVITY**   |
| **MEDICAL_EMERGENCY** |

## _enum_ Effect

この問題が影響を受けるentity及ぼすEffect。

**値**

| _**値**_                 |
| ----------------------- |
| **NO_SERVICE**          |
| **REDUCED_SERVICE**     |
| **SIGNIFICANT_DELAYS**  |
| **DETOUR**              |
| **ADDITIONAL_SERVICE**  |
| **MODIFIED_SERVICE**    |
| **OTHER_EFFECT**        |
| **UNKNOWN_EFFECT**      |
| **STOP_MOVED**          |
| **NO_EFFECT**           |
| **ACCESSIBILITY_ISSUE** |

## _enum_ SeverityLevel

Alert重大度。

**注意：**このフィールドはまだ**実験的な**ものであり、変更される可能性がある。将来的には正式に採用される可能性がある。

**値**

| _**値**_              |
| -------------------- |
| **UNKNOWN_SEVERITY** |
| **INFO**             |
| **WARNING**          |
| **SEVERE**           |

## _message_ TimeRange

time間隔。時間間隔は、`tが` start time以上、end time未満であれば、time `tで`アクティブとみなされる。

**フィールド**

| _**フィールド名**_ | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                            |
| ------------ | -------------------------------------------------------------------------- | -------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| **start**    | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | start timePOSIXtime（すなわち、1970年1月1日午前0時00分00秒UTCからの秒数）です。これがない場合、間隔はマイナス無限大から始まる。 TimeRange指定する場合、startまたはendどちらかを指定する必要があり、両方のフィールドをEMPTYすることはできない。 |
| **end**      | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | POSIXtime（すなわち、1970年1月1日午前0時00分00秒（UTC）からの秒数）でのend timeです。これがない場合、区間はプラス無限大で終了する。TimeRange指定する場合、startまたはendどちらかを指定する必要があり、両方のフィールドをEMPTYすることはできない。 |

## _message_ Position

vehicle地理的なPosition。

**フィールド**

| _**フィールド名**_  | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                             |
| ------------- | -------------------------------------------------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| **latitude**  | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 必須       | 一人             | 北緯度、WGS-84座標系での値。                                                                                                                    |
| **longitude** | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 必須       | 一人             | 東経の度数、WGS-84座標系での値。                                                                                                                  |
| **bearing**   | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | オプション    | 一人             | bearing、度、真北から時計回り、つまり、0は北、90は東。これはコンパスのbearingであったり、次の停車駅や中間地点に向かう方位であったりする。これは、クライアントが以前のデータから計算することができる、以前の位置のシーケンスから推測されるべきではない。 |
| **odometer**  | [double](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | odometer値（メートル単位）。                                                                                                                   |
| **speed**     | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | オプション    | 一人             | vehicle計測した瞬間speed、単位はメートル毎秒。                                                                                                        |

## _message_ TripDescriptor

GTFS trip単一のインスタンスを識別するための記述子。

tripインスタンスは、多くの場合、`trip_id`のみで十分である。ただし、以下の場合は、trip特定するために追加情報が必要である。

* frequencies.txt定義されたトリップの場合、`trip_id`加え、`start_date` `start_time`必要である。
* trip24時間以上継続する場合、または翌日のSCHEDULED tripぶつかるような遅延がある場合、`trip_id` `start_date`必要です。
* `trip_id`フィールドを提供できない場合、`route_id`、`direction_id`、`start_date`、`start_time`のすべてを提供する必要がある。

いずれの場合も、`trip_id` に加えて`route_id`を指定する場合は、GTFS trips.txt で指定されたtrip同じ`route_id`を指定しなければならない。

`trip_id`フィールドは、単独で、または他のTripDescriptorフィールドと組み合わせて、複数のtrip識別するために使用することはできない。たとえば、GTFS frequencies.txtの exact_times=0 のトリップに対して、TripDescriptorはtrip_id単独で指定してはならない。これは、1 日のうち特定のtime始まる単一のtrip解決するためにstart_timeも必要であるためである。TripDescriptorが単一のtrip解決しない場合（すなわち、ゼロまたは複数のtripスタンスに解決する場合）、エラーと見なされ、誤ったTripDescriptorを含むentity消費者によって廃棄される可能性がある。

trip_idが不明な場合、TripUpdateのステーションシーケンス ID では不十分であり、stop_id も提供する必要があることに注意すること。さらに、絶対的なarrival出発時刻も提供されなければならない。

TripDescriptor.route_id Alert EntitySelector内で使用して、ルートのすべてのトリップに影響するルート全体のAlert指定することはでき ません - 代わりにEntitySelector.route_id使用してください。

**フィールド**

| _**フィールド名**_              | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ------------------------- | -------------------------------------------------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **trip_id**               | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | このセレクタが参照するGTFSフィードからのtrip_idです。頻度制でないトリップ（GTFS frequencies.txt定義されていないトリップ）の場合、このフィールドだけでtrip一意に特定できます。GTFS frequencies.txtxtで定義されているフリークエンシーベーストリップの場合、trip_id、start_time、start_dateすべて必須です。SCHEDULEDトリップ（GTFS frequencies.txt定義されていないトリップ）の場合、trip_id省略できるのは、route_id,direction_id,start_time,start_date組み合わせで、これらすべてのフィールドが提供されているtrip一意に識別できる場合のみである。TripUpdate schedule_relationshipがDUPLICATED場合、trip_id DUPLICATEDなる静的GTFS trip特定します。schedule_relationshipがVehiclePosition 内でDUPLICATEDの場合、trip_idは新たに重複するtrip識別し、対応するTripUpdate の値を含まなければならない。TripProperties.trip_id。                                                             |
| **route_id**              | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | このセレクタが参照するGTFSのroute_idを指定する。trip_idが省略された場合、trip識別するためにroute_id,direction_id,start_time, schedule_relationship=SCHEDULED がすべて設定されていなければならない。TripDescriptor.route_idroute_id Alert EntitySelector内で使用して、ルートのすべてのトリップに影響を与えるルート全体のAlert指定してはなりません。                                                                                                                                                                                                                                                                                                                                                                                         |
| **direction_id**          | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | GTFSフィードのtrips.txtファイルにあるdirection_idで、このセレクタが参照するトリップの進行方向を示しま す。trip_idが省略された場合は、direction_idを指定する必要があります。 <br/><br/>**注意**this field is still **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。将来的に正式に採用される可能性があります。<br/>                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **start_time**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | このtripインスタンスが最初にSCHEDULED start time。trip_id非頻度ベースのtrip対応する場合、このフィールドは省略されるか、GTFSフィードの値と等しくなければならない。trip_idがGTFS frequencies.txt で定義されたtrip対応する場合、start_timeは必須であり、trip更新とvehicle位置のために指定する必要がある。tripexact_times=1 のGTFSレコードに対応する場合、start_timeは、対応するtime帯のfrequencies.txt start_timeより headway_secs の倍数（0 を含む）遅くなければならない。exact_times=0に対応するtrip場合、そのstart_time任意であり、当初はtrip最初のdeparture時刻となることが予想される。一度設定された頻度ベースのexact_times=0trip start_time、最初のdeparture time変更されても、不変と考えるべきである -- そのtime変更は、代わりにStopTimeUpdate反映されるかもしれない。trip_idが省略された場合、start_timeが指定されなければならない。このフィールドのフォーマットと意味は、GTFSfrequencies.txtものと同じである（例：11:15:35、25:15:35）。 |
| **start_date**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | このtrip start日（YYYYMMDD形式）。SCHEDULEDトリップ（GTFS frequencies.txt定義されていないトリップ）の場合、このフィールドは、翌日のSCHEDULED trip衝突するほど遅いトリップを曖昧にしないために提供する必要があります。例えば、毎日8時と20時に出発する列車が12時間遅れた場合、同じtime2つの異なるトリップが存在することになる。このフィールドは、このような衝突が不可能なスケジュール、例えば、1時間単位で運行するサービスで、1時間遅れのvehicleもうスケジュールと関係ないと考えられる場合、提供可能ですが必須ではありません。GTFS frequencies.txt定義された頻度ベースのトリップの場合、このフィールドは必須である。trip_idが省略された場合、start_dateを指定する必要がある。                                                                                                                                                                                                                                           |
| **schedule_relationship** | [ScheduleRelationship](#enum-schedulerelationship-1)                       | オプション    | 一人             | trip静止スケジュールの関係。TripDescriptorがAlert提供される場合、このフィールドはコンシューマによって無視されます。 `EntitySelector`を指定した場合は `schedule_relationship`フィールドは、一致するtrip特定する際にコンシューマによって無視されます。                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |

## _enum_ ScheduleRelationship

このtrip静的なスケジュールとの関係。GTFS反映されていない一時的なスケジュールに従ってtrip行われる場合、それはSCHEDULEDマークされるべきではなく、ADDEDマークされるべきです。

**値**

| _**値**_         | _**コメント**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SCHEDULED**   | GTFS Schedule GTFS Scheduleのスケジュールに従って運行されているtrip、またはSCHEDULED trip関連づけられるほど近いトリップ。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **ADDED**       | 故障したvehicle交換や、急な乗客の増加に対応するため、走行中のスケジュールに追加してADDEDされたtrip。 _注：現在、このモードを使用するフィードの動作は規定されていない。GTFSGitHubで議論が行われています。 [(1)](https://github.com/google/transit/issues/106) [(2)](https://github.com/google/transit/pull/221) [(3)](https://github.com/google/transit/pull/219)にて、ADDEDトリップを完全に指定するか非推奨にするかの議論が行われており、その議論がまとまった時点でドキュメントが更新される予定です。_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **UNSCHEDULED** | この値は、GTFS frequencies.txtexact_times=0に定義されたtrip識別するために使用されます。GTFS frequencies.txt定義されていないトリップや、GTFS frequencies.txtexact_times=1のトリップを表すために使用すべきではありません。を持つトリップは `schedule_relationship: UNSCHEDULED`のトリップは、すべてのStopTimeUpdateを設定する必要があります。 `schedule_relationship: UNSCHEDULED`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| **CANCELED**    | スケジュール内に存在したが、削除されたtrip。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| **DUPLICATED**  | SCHEDULED trip同じで、start日とtime除いた新しいtripです。と共に使用します。 `TripUpdate.TripProperties.trip_id`, `TripUpdate.TripProperties.start_date`および `TripUpdate.TripProperties.start_time`と共に使用され、静的なGTFS既存のtripコピーしますが、サービスstart日および/またはtime異なります。trip複製は、(CSV)GTFS内の元のtrip関連するサービス(in) `calendar.txt`または `calendar_dates.txt`が今後30日以内に運行される場合、トリップの複製が可能です。DUPLICATEDなるtrip、以下の方法で特定される。 `TripUpdate.TripDescriptor.trip_id`. <br/><br/>によって参照される既存のtrip、この列挙によって変更されない。 `TripUpdate.TripDescriptor.trip_id`- 製作者が元のtripキャンセルしたい場合は、別途、CANCELED の値を持つトリップを発行する必要があります。 `TripUpdate`を発行しなければならない。GTFS定義されたトリップ `frequencies.txt`あり `exact_times`に定義されたトリップは、EMPTYそれと等しい場合、DUPLICATEDにすることはできません。 `0`のトリップは、DUPLICATEDすることができません。新しいトリップの `VehiclePosition.TripDescriptor.trip_id`には、新しいtrip一致する値が含まれていなければなりません。 `TripUpdate.TripProperties.trip_id`と `VehiclePosition.TripDescriptor.ScheduleRelationship`にも設定されていなければならない。 `DUPLICATED`.  <br/><br/>_DUPLICATEDトリップを表すためにADDED列挙を使用していた既存のプロデューサーとコンシューマーは、以下の移行ガイドに従わなければなりません。 [移行ガイド](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/examples/migration-duplicated.md)に従って、DUPLICATED列挙に移行しなければならない。_ |

## _message_ VehicleDescriptor

trip実行するvehicle識別情報。

**フィールド**

| _**フィールド名**_      | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                 |
| ----------------- | -------------------------------------------------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **id**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | vehicle内部システム識別。車両ごとにあるべき **一意**vehicleごとに存在すべきであり、システムを通過する際にvehicle追跡するために使用される。このidはend見えないようにする必要がある。 **label**フィールド |
| **label**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | ユーザー可視label、つまり正しいvehicle識別するために乗客に見せなければならないもの。                                                                         |
| **license_plate** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | オプション    | 一人             | vehicleナンバープレート。                                                                                                         |

## _message_ EntitySelector

GTFSフィード内のentityセレクタ。フィールドの値は、GTFSフィード内の適切なフィールドに対応する必要があります。少なくとも1つの指定子を指定する必要があります。複数指定した場合は、論理`AND`演算子で結合されたものとして解釈されます。 さらに、指定子の組み合わせは、GTFSフィードの対応する情報と一致しなければなりません。 言い換えれば、GTFS entity Alert適用するには、提供されたEntitySelectorフィールドのすべてに一致する必要があります。 たとえば、EntitySelectorに`route_id`.5 と route_type.5 のフィールドが含まれているとします。`5」`、「`route_type`:「`3 "という`フィールドを含む EntitySelector は、`route_id`"5 "のバスにのみ適用され、`route_type`.の他のルートには適用されません。"`3".` route`route_id`: "5 "とAlert_type: "3 "の他のルートには適用されません。`5 "`と "rout`route_type`:もし、製作者が`route_id`: "5" と route_type:`"3"` に警告を適用したい場合、2つの別々の EntitySelectors を提供する必要があります。5`"`を参照するものと、"route`route_type`"を参照するものです。`"3".`

少なくとも 1 つの指定子を指定する必要があります。EntitySelectorのすべてのフィールドをEMPTY にすることはできません。

**フィールド**

| _**フィールド名**_     | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                                                                                                   |
| ---------------- | -------------------------------------------------------------------------- | -------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **agency_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | このセレクタが参照するGTFSフィードからのagency_idです。                                                                                                                                                                                         |
| **route_id**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | このセレクタが参照するGTFSのroute_idです。direction_idを指定する場合、route_idも指定する必要がある。                                                                                                                                                         |
| **route_type**   | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 条件付きで必要  | 一人             | このセレクタが参照するGTFSのroute_typeを指定する。                                                                                                                                                                                           |
| **direction_id** | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | GTFSfeedtrips.txtから、route_id で指定された経路の一方向のトリップを全て選択するためのdirection_idを指定する。direction_idが指定された場合、route_idも指定されなければならない。 <br/><br/>**注意**this field is still **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。将来的に正式に採用される可能性があります。<br/> |
| **trip**         | [TripDescriptor](#message-tripdescriptor)                                  | 条件付きで必要  | 一人             | このセレクタが参照するGTFSからのtrip。このTripDescriptorはGTFSデータ内の単一のtrip解決する必要がある（例：プロデューサは exact_times=0 のトリップに対してtrip_idのみを提供することはできない）。このTripDescriptorにScheduleRelationshipフィールドが入力されている場合、コンシューマがGTFS trip識別しようとすると無視されます。            |
| **stop_id**      | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | このセレクタが参照するGTFSフィードからのstop_idです。                                                                                                                                                                                           |

## _message_ TranslatedString

text urlスニペットの言語ごとのバージョンを含む、国際化されたmessage。message文字列のひとつがピックアップされます。解決は次のように進みます。UIlanguage Translation languageコードと一致する場合、最初に一致したTranslationピックアップされます。デフォルトのUIlanguage(例: 英語) がTranslation languageコードと一致する場合、最初に一致するTranslation選ばれます。languageコードが指定されていないTranslationある場合、そのTranslation選択されます。

**フィールド**

| _**フィールド名**_    | _**タイプ**_                           | _**必須**_ | _**カーディナリティ**_ | _**説明**_                          |
| --------------- | ----------------------------------- | -------- | -------------- | --------------------------------- |
| **Translation** | [Translation](#message-translation) | 必須       | 多数             | 少なくとも1つのTranslation提供されなければなりません。 |

## _message_ Translation

languageマッピングされたローカライズされたstring。

| _**フィールド名**_ | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                                   |
| ------------ | -------------------------------------------------------------------------- | -------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **text**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必須       | 一人             | message含むUTF-8string列。                                                                                                                                     |
| **language** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | BCP-47のlanguageコード。language不明な場合、あるいはフィードの国際化がまったく行われていない場合は省略可能です。未指定のlanguageタグを持つことができるのは、最大でひとつのTranslationです。複数のTranslationある場合は、language指定する必要があります。 |

## _message_ TranslatedImage

言語ごとのimage含む、国際化されたmessage。message画像の1つがピックアップされます。解決は次のように進みます。UIlanguage Translation languageコードと一致する場合、最初に一致したTranslationピックアップされます。デフォルトのUIlanguage（例えば、英語）がTranslation languageコードと一致する場合、最初に一致するTranslation選ばれます。languageコードが指定されていないTranslationある場合、そのTranslation選択されます。

注意**:**このmessageまだ実験**的な**ものであり、変更される可能性があります。将来、正式に採用される可能性があります。

**フィールド**

| _**フィールド名**_        | _**タイプ**_                                 | _**必須**_ | _**カーディナリティ**_ | _**説明**_                           |
| ------------------- | ----------------------------------------- | -------- | -------------- | ---------------------------------- |
| **localized_image** | [LocalizedImage](#message-localizedimage) | 必須       | 多数             | 少なくとも1つのローカライズされたimage提供する必要があります。 |

## _message_ LocalizedImage

あるlanguageマップされたローカライズされたimage url。

| _**フィールド名**_   | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                                                                                                                                                                                |
| -------------- | -------------------------------------------------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **url**        | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必須       | 一人             | imageリンクurl含むstring。リンク先のimage2MB未満でなければなりません。消費者側で更新が必要なほどimage大幅に変更された場合、製作者はurlを新しいものに更新しなければなりません。<br/><br/>url、http:// または https:// を含む完全修飾urlでなければならず、url内の特殊文字は正しくエスケープされていなければなりません。以下を参照してください。 [url を参照してください。](https://www.w3.org/Addressing/URL/4_URI_Recommentations.html for)url参照してください。 |
| **media_type** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必須       | 一人             | 表示するimage種類を指定するための IANA メディアタイプ。タイプは "image/"でstart必要があります。                                                                                                                                                                                                                                            |
| **language**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 条件付きで必要  | 一人             | BCP-47 のlanguageコード。language不明な場合、あるいはフィードの国際化がまったく行われていない場合は省略可能です。未指定のlanguageタグを指定できるのは、最大でひとつのTranslationです。複数のTranslationある場合は、そのlanguage指定しなければなりません。                                                                                                                                             |

## _message_ Shape

アドホックDETOUR など、Shape(CSV)GTFS一部でない場合に、vehicle通る物理的な経路を記述する。シェイプはトリップに属し、より効率的な伝送のためにエンコードされたポリラインから構成される。 ShapeはStopの位置を正確に傍受する必要はないが、trip上のすべてのStopはそのtrip Shapeわずかな距離内にあるべきである、すなわち、Shape点を結ぶ直線セグメントに近い。

**注意：**このmessageまだ**実験的な**ものであり、変更される可能性がある。将来は正式に採用されるかもしれない。<br/>.

**フィールド**

| _**フィールド名**_         | _**タイプ**_                                                                  | _**必須**_ | _**カーディナリティ**_ | _**説明**_                                                                                                                                                                                                                                          |
| -------------------- | -------------------------------------------------------------------------- | -------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **shape_id**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必須       | 一人             | Shape識別子。CSVで定義されたものと異なっている必要がある。 `shape_id`(CSV)GTFS で定義されているものとは異なるものでなければならない。 <br/><br/>**注意**this field is still **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。将来的に正式に採用される可能性があります。                                                                 |
| **encoded_polyline** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必須       | 一人             | Shape符号化されたポリライン表現。このポリラインは少なくとも2点を含んでいなければならない。エンコードポリラインの詳細については <https://developers.google.com/maps/documentation/utilities/polylinealgorithm> <br/><br/>**注意**this field is still **実験的**将来、正式に採用されるかもしれないし、変更されるかもしれない。将来的に正式に採用される可能性があります。 |
