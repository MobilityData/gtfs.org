# GTFS Realtime Protobuf
[gtfs-realtime.proto](gtfs-realtime.proto) ファイルをダウンロードし、それを使用して GTFS-realtime フィードをコンパイルします。ファイルの内容は、以下にインラインで示されています。
protobufs の使用の詳細については、[Protocol Buffers Developer Guide](https://developers.google.com/protocol-buffers/docs/overview) をご覧ください。
```protobuf
//Copyright 2015 The GTFS Specifications Authors.
//
//Apache License、バージョン 2.0 (以下`ライセンス`) に基づいてライセンス供与されます。
//ライセンスに準拠しない限り、このファイルを使用することはできません。
//ライセンスのコピーは、
//
//  http://www.apache.org/licenses/LICENSE-2.0 から入手できます。
//
//適用法で義務付けられている場合、または書面で同意されている場合を除き、ライセンスに基づいて配布されるソフトウェアは、
//`現状のまま`で配布され、
//明示的または黙示的ないかなる種類の保証または条件もありません。
//特定の言語については、ライセンスをご覧ください。ライセンスに基づく権限および
//制限を規定します。

//GTFSGTFS Realtimeのプロトコル定義ファイル。
//
//GTFS Realtimeを使用すると、交通機関は消費者に対して、サービスへの混乱 (駅の閉鎖、路線の運行停止、重大な遅延など)、車両の場所、到着予定時刻に関するリアルタイムの
//情報を提供できます。
//
//このプロトコルは、次の場所で公開されています:
//https://github.com/google/transit/tree/master/gtfs-realtime

syntax = "proto2";
option java_package = "com.google.transit.realtime";
package transit_realtime;

//フィードmessageの内容。
//フィードは、フィード メッセージの連続ストリームです。ストリーム内の各messageは、
//適切な HTTP GET リクエストへの応答として取得されます。
//リアルタイム フィードは常に、既存の GTFS フィードとの関連で定義されます。
//すべてのエンティティ ID は、GTFS フィードを基準にして解決されます。
//このファイルに記載されている`必須`および`オプション`は、セマンティック カーディナリティではなく、プロトコル
//バッファ カーディナリティを参照することに注意してください。フィールド
//セマンティック カーディナリティについては、https://github.com/google/transit/tree/master/gtfs-realtime の reference.md をご覧くださいmessage FeedMessage {
//このフィードとフィードmessageに関するメタデータ。
 required FeedHeader header = 1;

//フィードの内容。
 repeat FeedEntity entity = 2;

//拡張機能の名前空間により、サードパーティ デベロッパーは
//GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
 extensions 1000 to 1999;

//次の拡張機能 ID は、組織によるプライベート使用のために予約されています。
 extensions 9000 to 9999;
}

//フィード メッセージに含まれる、フィードに関するメタデータ。
 message FeedHeader {
//フィード仕様のバージョン。
//現在のバージョンは 2.0 です。有効なバージョンは`2.0`、`1.0`です。
 必須string gtfs_realtime_version = 1;

//現在のフェッチが増分かどうかを判断します。現在、
//DIFFERENTIAL モードはサポートされておらず、このモードを使用するフィードの動作は未指定です。GTFS GTFS Realtimeメーリング リスト
//で DIFFERENTIAL モードの動作を完全に指定することについて議論されており、
//議論が確定するとドキュメントが更新されます。
 enum Incrementality {
    FULL_DATASET = 0;
    DIFFERENTIAL = 1;
 }
 オプションIncrementality incrementality = 2 [default = FULL_DATASET];

//このタイムスタンプは、このフィードのコンテンツが作成された時刻 (サーバー時間) を識別します。 POSIX 時間（つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数）。
 オプションのuint64 timestamp = 3;

//extensions 名前空間により、サードパーティの開発者はGTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//以下の拡張 ID は、あらゆる組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//交通フィード内のエンティティの定義（または更新）。
 message FeedEntity {
//ID は増分サポートを提供するためだけに使用されます。ID はFeedMessage内で一意である必要があります。後続の FeedMessage には、同じ ID の FeedEntities を含めることができます。差分更新の場合、何らかの ID を持つ新しいFeedEntityが、同じ ID を持つ古いFeedEntityを置き換えます (または削除します - 下記の is_deleted を参照してください)。
//フィードによって参照される実際の G​​TFS エンティティ (駅、ルート、旅行など) は、明示的なセレクタによって指定する必要があります (詳細については、下記のEntitySelectorを参照してください)。
 必須string id = 1;

//このエンティティを削除するかどうか。増分フェッチにのみ関連します。
 オプションbool is_deleted = 2 [default = false];

//エンティティ自体に関するデータ。次のフィールドの 1 つが必ず存在する必要があります (エンティティが削除される場合を除く)。
 オプションTripUpdate trip_update = 3;
 オプションVehiclePosition automobile = 4;
 オプション Alert alert = 5;

//注: このフィールドはまだ試験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
 オプション Shape shape = 6;
 オプション Stop stop = 7;
 オプションTripModifications trip_modifications = 8;

//extensions 名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や
//仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//以下の拡張機能 ID は、あらゆる組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//
//フィードで使用されるエンティティ。
//

//旅程に沿った車両の進行状況のリアルタイム更新。
//ScheduleRelationshipの値に応じて、 TripUpdateでは以下を指定できます。
//- スケジュールに沿って進む旅程。
//- ルートに沿って進むが、固定スケジュールがない旅程。
//- スケジュールに関して追加または削除された旅程。
//
//更新は将来予測される到着/出発イベント、またはすでに発生した過去のイベントについてです。
//通常、イベントが現在の時間に近づくにつれて、更新はより正確で確実になります (以下の不確実性を参照)。
//それが不可能な場合でも、過去のイベントの情報は
//正確で確実である必要があります。特に、更新が過去の時間を指し示していても、その更新の不確実性が 0 でない場合、クライアントは更新が (間違った) 予測であり、旅行がまだ完了していないと結論付ける必要があります。
//
//更新は、すでに完了した旅行を記述する場合があることに注意してください。
//このためには、旅行の最後の停止の更新を提供すれば十分です。
//その時間が過去である場合、クライアントはそれから旅行全体が過去であると結論付けます (重要ではありませんが、前の停止の更新も提供できます)。
//このオプションは、スケジュールより早く完了した旅行に最も関連していますが、スケジュールによると、旅行は現在の時間でまだ進行中です。この旅程の更新を削除すると、クライアントは旅程がまだ進行中であると想定する可能性があります。
//フィード プロバイダーは過去の更新を削除することが許可されていますが、必須ではありません。これは、これが実際に役立つ場合の 1 つです。
 message TripUpdate {
//このmessageが適用される旅程。実際の旅程インスタンスごとに、最大で 1 つのTripUpdateエンティティを指定できます。
//ない場合は、予測情報がないことを意味します。
//旅程がスケジュールどおりに進んでいることを意味するわけではありません。
 required TripDescriptor trip = 1;

//この旅程を運行している車両に関する追加情報。
 optimal VehicleDescriptor automobile = 3;

//予測される単一のイベント (到着または出発) のタイミング情報。
//タイミングは、遅延および/または推定時刻、および不確実性で構成されます。
//- 予測が GTFS 内の既存のスケジュールと比較して提供される場合は、遅延を使用する必要があります。
//- 予測スケジュールがあるかどうかに関係なく、時間を指定する必要があります。 
// 時間と遅延の両方が指定されている場合は、時間が優先されます
// (ただし、通常、スケジュールされた旅行に対して時間が指定されている場合は、
// GTFS のスケジュールされた時間 + 遅延に等しくする必要があります)。
//
//不確実性は、時間と遅延の両方に等しく適用されます。
//不確実性は、実際の遅延の予想される誤差を大まかに指定します (ただし、
//正確な統計的意味はまだ定義していないことに注意してください)。
//コンピューターのタイミング制御下で運転される列車など、不確実性が 0 になる可能性もありますmessage StopTimeEvent {
  //遅延 (秒単位) は、正 (車両が遅れていることを意味する) または
  //負 (車両がスケジュールより進んでいることを意味する) になります。遅延が 0
    の場合、車両は時間どおりに到着していることを意味します。
    オプションのint32 delay = 1;

  //イベントは絶対時間として表されます。
  //Unix 時間 (つまり、1970 年 1 月 1 日 00:00:00
  //UTC からの秒数)。
    オプションのint64 time = 2;

  //不確実性が省略されている場合は、不明と解釈されます。
  //予測が不明または不確実すぎる場合は、遅延 (または時間) フィールド
  //は空にする必要があります。このような場合、不確実性フィールドは無視されます。
  //完全に確実な予測を指定するには、その不確実性を 0 に設定します。
    オプションint32不確実性 = 3;

  //拡張機能の名前空間により、サードパーティの開発者は
  //GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
    拡張機能 1000 ～ 1999;

  //次の拡張機能 ID は、組織によるプライベート使用のために予約されています。
    拡張機能 9000 ～ 9999;
 }

//旅行中の特定の停車地の到着イベントや出発イベントのリアルタイム更新。更新は、過去のイベントと将来のイベントの両方に提供できます。
//プロデューサーは、過去のイベントを削除することが許可されていますが、必須ではありません。
 message StopTimeUpdate {
  //更新はstop_sequenceまたは
  //stop_id のいずれかを介して特定の停車地にリンクされるため、以下のフィールドのいずれかが必ず設定されている必要があります。
  //詳細については、 TripDescriptorのドキュメントを参照してください。

  //対応する GTFS フィードのstop_times.txtと同じであるしなければならないがあります。
    オプション uint32 stop_sequence = 1;
  //対応する GTFS フィードのstops.txtと同じである必要がありしなければならない。
    オプションstring stop_id = 4;

    オプションStopTimeEvent arrive = 2;
    オプションStopTimeEvent departure = 3;

  //指定された停車地からの出発後の予想乗車率。
  //将来の停車地に対してのみ提供する必要があります。
  //到着または
  //出発の StopTimeEvent なしで destination_occupancy_status を提供するには、 ScheduleRelationshipをNO_DATA に設定します。
    オプションのVehiclePosition. OccupancyStatus destination_occupancy_status = 7;
    
  //StopTimeEvents と静的スケジュールの関係。
    enum ScheduleRelationship {
    //車両は、必ずしもスケジュールの時間に従っているわけではありませんが、静的なスケジュールに従って停車します。
    //到着と出発の少なくとも 1 つを指定する必要があります。この停車場のスケジュールに到着時間と出発時間の両方が含まれている場合は、この更新にも両方が含まれている必要があります。頻度ベースの旅程 (exact_times = 0 の GTFS frequencies.txt )
    //には SCHEDULED 値を指定せず、代わりに UNSCHEDULED を使用する必要があります。
      SCHEDULED = 0;

    //停車地はスキップされます。つまり、車両はこの停車地には停車しません。
    //到着と出発はオプションです。
      SKIPPED = 1;

    //この停車地には StopTimeEvents が指定されていません。
    //この値の主な目的は、旅程の一部についてのみ時間予測を提供することです。つまり、旅程の最後の更新に NO_DATA
    //指定子が含まれている場合、旅程の残りの停車地の StopTimeEvents も指定されていないと見なされます。
    //到着も出発も指定しないでください。
      NO_DATA = 2;

    //車両は GTFS で定義された旅程を運行していますfrequencies.txtで exact_times = 0と設定します。
    //この値は、GTFS frequencies.txtで定義されていない旅程、または GTFS frequencies.txtで exact_times = 1.と設定されている旅程には使用しないでください。ScheduleRelationship =UNSCHEDULED とScheduleRelationshipされた StopTimeUpdates
    //を含む便では、 TripDescriptorも設定する必要があります。ScheduleRelationship =UNSCHEDULED.
    //注: このフィールドはまだ試験段階であり、変更される可能性があります。将来的には正式に採用される可能性があります。
      UNSCHEDULED = 3;
    }
    オプションのScheduleRelationship schedule_relationship = 5
       [default = SCHEDULED];

  //停止時刻の更新された値を提供します。
  //注: このmessageはまだ試験段階であり、変更される可能性があります。将来的には正式に採用される可能性があります。
    message StopTimeProperties {
    //リアルタイムの停車地割り当てをサポートします。 GTFS のstops.txtで定義された stop_id を参照します。
    //新しい assignment_stop_id によって、エンド ユーザーの旅行体験が GTFS のstop_times.txtで定義された stop_id と比べて大幅に異なることはあってはなりません。つまり、新しい停留所が追加のコンテキストなしでアプリ内に表示された場合は、エンド ユーザーはこの新しい stop_id を`異常な変更`と見なすべきではありません。
    //たとえば、このフィールドは、GTFS stop_times.txtで最初に定義された停留所と同じ駅に属する stop_id を使用して、プラットフォームの割り当てに使用することを目的としています。
    //リアルタイムの到着または出発の予測を提供せずに停留所を割り当てるには、このフィールドに値を入力して、 StopTimeUpdate.schedule_relationship = NO_DATA を設定します。
    //このフィールドに値を入力する場合は、 `StopTimeUpdate.stop_id` を省略し、 `StopTimeUpdate.stop_sequence`のみを使用することをお勧めします。 
    //`StopTimeProperties.assigned_stop_id`と`StopTimeUpdate.stop_id` が設定されている場合、 `StopTimeUpdate.stop_id` は`assigned_stop_id`と一致する必要があります。
    //プラットフォームの割り当ては、他の GTFS リアルタイム フィールドにも反映される必要があります
    //(例: `VehiclePosition.stop_id`)。
    //注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
      optional string assignment_stop_id = 1;

    //extensions 名前空間により、サードパーティの開発者はGTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
      extensions 1000 ～ 1999;

    //次の拡張 ID は、組織によるプライベート使用のために予約されています。
      extensions 9000 ～ 9999;
    }

  //GTFS stop_times.txt内で定義されている特定のプロパティのリアルタイム更新 
  //注: このフィールドはまだ試験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
    オプションのStopTimeProperties stop_time_properties = 6;

  //extensions 名前空間により、サードパーティの開発者はGTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
    extensions 1000 から 1999;

  //以下の拡張 ID は、あらゆる組織による私的使用のために予約されています。
    extensions 9000 から 9999;
 }

//旅行の StopTimes への更新 (将来の予測と、場合によっては過去の予測、つまりすでに発生したものの両方)。
//更新はstop_sequenceで並べ替え、次に指定された停車地までの旅行のすべての停車地に適用する必要があります。
//
//例 1:
//停車地が 20 か所ある旅行の場合、到着遅延と出発遅延が 0 のStopTimeUpdate が現在の停車地のstop_sequence は、旅行が
//正確に時間通りであることを意味します。
//
//例 2:
//同じ旅行インスタンスに対して、3 つの StopTimeUpdate が提供されます:
//- stop_sequence 3 の遅延は 5 分
//- stop_sequence 8 の遅延は 1 分
//- stop_sequence 10 の遅延時間は未指定
//これは次のように解釈されます:
//- stop_sequences 3、4、5、6、7 の遅延は 5 分です。
//- stop_sequences 8、9 の遅延は 1 分です。
//- stop_sequences 10、...の遅延は不明です。
 StopTimeUpdateが繰り返されます stop_time_update = 2;

//車両のリアルタイムの進行状況が測定された最新の瞬間
//将来の StopTimes を推定します。過去の StopTimes が提供される場合、
//到着/出発時刻はこの値よりも早くなる可能性があります。 POSIX
//時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。
 オプションのuint64 timestamp = 4;

//旅行の現在のスケジュール偏差。遅延は
//GTFS の既存のスケジュール
//を基準に予測が与えられる場合にのみ指定する必要があります。
//
//遅延 (秒単位) は正 (車両が遅れていることを意味する) または
//負 (車両がスケジュールより進んでいることを意味する) になります。遅延が 0
//の場合、車両は時間どおりであることを意味します。
//
//StopTimeUpdates の遅延情報は、旅行レベルの遅延
//情報よりも優先されます。そのため、旅行レベルの遅延は、 StopTimeUpdate遅延値が指定された次の
//停車地までしか伝播されません。
//
//フィード プロバイダーは、データの鮮度を評価するために、遅延値が最後に更新された日時を示すTripUpdate.timestamp
//値を提供することを強くお勧めします。
//
//注: このフィールドはまだ実験段階であり、変更される可能性があります。将来
//正式に採用される可能性があります。
 オプションのint32 delay = 5;

//迂回がある場合の新しい shape_id など、旅行の更新されたプロパティを定義します。または、重複した旅行のtrip_id、 start_date、および start_time を定義します。
//注: このmessageはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性がありますmessage TripProperties {
  //(CSV) GTFS trips.txt 
    で定義されている既存の旅行の複製であるが、異なるサービスdateおよび/または時刻 ( TripProperties.start_date フィールドと 
  //TripProperties.start_time フィールドを使用して定義) に開始する新しい旅行の識別子を定義します。trips の定義を参照してください。(CSV) GTFS のtrip_id 。その値は、(CSV) GTFS で使用される値と異なる必要があります
  //。schedule_relationship=DUPLICATED の場合は必須。それ以外の場合は、このフィールドに値を入力してはならず、コンシューマーによって無視されます。
  //注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
    オプションのstring trip_id = 1;
  //DUPLICATED 旅行が実行されるサービスdate(YYYYMMDD 形式)。 
  //schedule_relationship=DUPLICATED の場合は必須。それ以外の場合は、このフィールドに値を入力してはならず、コンシューマーによって無視されます。
  //注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
    オプションのstringstart_date = 2;
  //複製された旅行の出発開始時刻を定義します。(CSV) GTFS の stop_times.departure_time
  //の定義を参照してください。複製された旅行の予定到着時刻と出発時刻は、元の旅行の出発時刻とこのフィールド間のオフセット
  //に基づいて計算されます。たとえば、GTFS 旅行の停留所 A の出発時刻が 10:00:00、停留所 B の出発時刻が 10:01:00 で、このフィールドに値
  //10:30:00 が設定されている場合、複製された旅行の停留所 B の予定出発時刻は 10:31:00 になります。リアルタイム予測
  //遅延値は、予測時間を決定するために、計算されたスケジュール時間に適用されます。たとえば、停留所 B の出発遅延が 30 の場合、予測される出発時間は 10:31:30 です。リアルタイム予測時間値にはオフセットが適用されず、提供された予測時間を示します。
  //たとえば、停留所 B の出発時間が 10:31:30 の場合、予測される出発時間は 10:31:30 です。このフィールドは、schedule_relationship が DUPLICATED の場合に必須です。それ以外の場合は、このフィールドに値を入力してはならず、コンシューマーによって無視されます。
  //注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
    オプションのstringstart_time = 3;
  //旅行の形状が
  //(CSV) GTFS で指定された形状と異なる場合に車両の移動経路の形状を指定します。または、乗客の需要に基づいて異なる経路を取る車両など、(CSV) GTFS によって提供されていない場合にリアルタイムで指定します。(CSV) GTFS の trips.shape_id の定義を参照してください。形状が (CSV) GTFS
  //でもリアルタイムでも定義されていない場合、形状は不明であると見なされます。このフィールドは、(CSV) GTFS のshapes.txt 
  //で定義された形状、または (protobuf) リアルタイム フィードの Shape を参照できます。この旅行の停車順序 (停車シーケンス) は
  //(CSV) GTFS と同じである必要があります。迂回が発生した場合など、元の旅行の一部であるが、今後は行かなくなる停留所等は、schedule_relationship=SKIPPED としてマークする必要があります。
  //注: このフィールドはまだ実験段階であり、変更される可能性があります。将来正式に採用される可能性があります。 
    オプションのstring shape_id = 4;

  //extensions 名前空間により、サードパーティの開発者は
  //GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
    extensions 1000 から 1999;

  //以下の拡張 ID は、あらゆる組織による私的使用のために予約されています。
    extensions 9000 から 9999;
 }
 オプションのTripProperties trip_properties = 6;

//extensions 名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//以下の拡張 ID は、あらゆる組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//特定の車両のリアルタイム位置情報。
 message VehiclePosition {
//この Trip が使用する Trip車両がサービスを提供している。
//特定の
//旅行インスタンスで車両を識別できない場合は、空または一部になることがあります。
 オプションのTripDescriptor trip = 1;

//この旅行を提供している車両に関する追加情報。
 オプションのVehicleDescriptor Vehicle = 8;

//この車両の現在位置。
 オプションのPosition position = 2;

//現在の停車地の停車シーケンス インデックス。
//current_stop_sequence (つまり、それが参照する停車地) の意味は
//current_status によって決まります。
//current_status がない場合、IN_TRANSIT_TO が想定されます。
 オプションの uint32 current_stop_sequence = 3;
//現在の停車地を識別します。値は、
//対応する GTFS フィード内のstops.txtと同じである必要があります。
 オプションのstring stop_id = 7;

 enum VehicleStopStatus {
  //車両が停車地に到着しようとしています (停車表示
  //では通常、車両のシンボルが点滅します)。
    INCOMING_AT = 0;

  //車両が停車地に停止しています。
    STOPPED_AT = 1;

  //車両が出発し、次の停車地に向かっています。
    IN_TRANSIT_TO = 2;
 }
//現在の停車地に関する車両の正確なステータス。
//current_stop_sequence が指定されていない場合は無視されます。
 オプションのVehicleStopStatus current_status = 4 [default = IN_TRANSIT_TO];

//車両の位置が測定された瞬間。 POSIX 時間
//(つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。
 オプションのuint64 timestamp = 5;

//この車両に影響を与えている混雑レベル。
 enum CongestionLevel {
    UNKNOWN_CONGESTION_LEVEL = 0;
    RUNNING_SMOOTHLY = 1;
    STOP_AND_GO = 2;
    CONGESTION = 3;
    SEVERE_CONGESTION = 4;//車を離れる人々。
 }
 オプションのCongestionLevel concentration_level = 6;

//車両または客車の乗客占有状態。
//個々のプロデューサーは、すべてのOccupancyStatus値を公開することはできません。したがって、コンシューマー
//は、 OccupancyStatusOccupancyStatusを表す必要があります。同様に、プロデューサーは、実際の車両の乗車状態に対応するOccupancyStatus値を使用する必要があります。
//乗客の乗車レベルを線形スケールで記述するには、 `occupancy_percentage`を参照してください。
//このフィールドはまだ実験段階であり、変更される可能性があります。将来正式に採用される可能性があります。
 enum OccupancyStatus {
  //車両または客車はほとんどの基準で空であると見なされ、乗客はほとんどまたはまったくいませんが、乗客はまだ受け入れています。
    EMPTY = 0;

  //車両または客車には多数の座席があります。
  //このカテゴリに該当するほど十分に大きいと見なされる利用可能な座席の総数に対する空席の数は、フィード プロデューサーの裁量で決定されます。
    MANY_SEATS_AVAILABLE = 1;

  //車両または客車には比較的少ない座席があります。
  //このカテゴリに該当するほど十分に小さいと見なされる利用可能な座席の総数に対する空席の数は、フィード プロデューサーの裁量で決定されます。
    FEW_SEATS_AVAILABLE = 2;

  //車両または客車は現在、立っている乗客のみを収容できます。
    STANDING_ROOM_ONLY = 3;

  //車両または客車は現在、立っている乗客のみを収容でき
  //スペースが限られています。
    CRUSHED_STANDING_ROOM_ONLY = 4;

  //車両または客車はほとんどの基準で満員と見なされますが、
  //乗客の乗車を許可している可能性があります。
    FULL = 5;

  //車両または客車は乗客を受け入れていませんが、通常は乗客の乗車を受け入れます。
    NOT_ACCEPTING_PASSENGERS = 6;

  //車両または客車には現在利用可能な占有データがありません。
    NO_DATA_AVAILABLE = 7;

  //車両または客車は乗車できず、乗客を受け入れることはありません。
  //特別な車両または客車（機関車、保守車両など）に役立ちます。
    NOT_BOARDABLE = 8;

 }
//multi_carriage_status に客車ごとのOccupancyStatusが設定されている場合、
//このフィールドは車両全体を記述する必要があります。乗客を受け入れるすべての車両を考慮します。
 オプションのOccupancyStatus occupancy_status = 9;

//車両内の乗客の占有率を示すパーセンテージ値。
//値は小数点なしの整数で表されます。0 は 0%、100 は 100% を意味します。
//値 100 は、座席と立席の両方の定員を含み、現在の運行規則で許可されている、車両が設計された最大占有率を表します。
//設計された最大定員よりも多くの乗客がいる場合、値は 100 を超えることがあります。
//occupancy_percentage の精度は、個々の乗客が車両に乗り降りするのを追跡できないほど低くする必要があります。
//multi_carriage_status に車両ごとの occupancy_percentage が設定されている場合、
//このフィールドは、乗客を受け入れるすべての車両を考慮した車両全体を記述する必要があります。
//このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
 オプション uint32 occupancy_percentage = 10;

//複数の客車で構成されている車両に使用される、客車固有の詳細
//このmessage/フィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
 message CarriageDetails {

  //客車の識別。車両ごとに一意である必要があります。
    オプションのstringid = 1;

  //客車を識別するために乗客に表示される、ユーザーに表示されるラベル。例: "7712"、"Car ABC-32" など...
  //このmessage/フィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
    オプションのstringlabel = 2;

  //この車両のこの客車の占有状況
  //このmessage/フィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
    オプションのOccupancyStatus occupancy_status = 3 [default = NO_DATA_AVAILABLE];

  //この車両のこの特定の車両の占有率。
  //`VehiclePosition.occupancy_percentage`と同じルールに従います
  //この特定の車両のデータが利用できない場合は -1 (それ以外の場合は protobuf のデフォルトが 0 になるため)
  //このmessage/フィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
    オプションint32 occupancy_percentage = 4 [default = -1];

  //車両のCarriageDetailsリスト内の他の車両に対するこの車両の順序を識別します。
  //移動方向の最初の車両の値は1.である必要があります。
  //2 番目の値は移動方向の 2 番目の車両に対応し、値 2 である必要があります。以下同様です。
  //たとえば、移動方向の最初の車両の値は1.です。
  //移動方向の 2 番目の車両の値が 3 の場合、
  //コンシューマーはすべての車両のデータ (つまり、multi_carriage_details フィールド) を破棄します。
  //データのない車両は、有効な carrier_sequence 番号で表す必要があり、データのないフィールドは省略する必要があります (または、それらのフィールドを含めて`データなし`に設定することもできます)。値)。
  //このmessage/フィールドはまだ実験段階であり、変更される可能性があります。将来正式に採用される可能性があります。
    オプション uint32 キャリッジ シーケンス = 5;

  //拡張機能の名前空間により、サードパーティの開発者は
  //GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
    拡張機能 1000 ～ 1999;

  //次の拡張機能 ID は、組織による私的使用のために予約されています。
    拡張機能 9000 ～ 9999;
 }

//この車両の複数の車両の詳細。
//最初の出現は、最初の車両を表します。


//現在の移動方向に基づいて、車両の車両を特定します。 
//multi_carriage_details 
//フィールドの出現回数は、車両の車両数を表します。
//これには、機関車や保守車両などの乗車不可の車両も含まれます。これらは、プラットフォームのどこに立つべきかについて乗客に貴重な情報を提供するためです。
//このmessageフィールドはまだ実験的なものであり、変更される可能性があります。将来、正式に採用される可能性があります。
 repeat CarriageDetails multi_carriage_details = 11;

//extensions 名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や
//仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//次の拡張機能 ID は、組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//公共交通機関ネットワークで何らかのインシデントが発生したことを示すアラート。
 message Alert {
//アラートをユーザーに示す時刻。指定されていない場合は、
//アラートはフィードに表示される限り表示されます。
//複数の範囲が指定されている場合は、そのすべての範囲でアラートが表示されます。
 repeat TimeRange active_period = 1;

//このアラートをユーザーに通知する必要があるエンティティ。
 repeat EntitySelector inform_entity = 5;

//このアラートの原因。 cause_detail が含まれている場合は、Cause も含める必要があります。
 enum Cause {
    UNKNOWN_CAUSE = 1;
    OTHER_CAUSE = 2;     //機械で表現できません。
    TECHNICAL_PROBLEM = 3;
    STRIKE = 4;           //公共交通機関の従業員が仕事を停止しました。
    DEMONSTRATION = 5;    //人々が道路を封鎖しています。
    ACCIDENT = 6;
    HOLIDAY = 7;
    WEATHER = 8;
    MAINTENANCE = 9;
    CONSTRUCTION = 10;
    POLICE_ACTIVITY = 11;
    MEDICAL_EMERGENCY = 12;
 }
 オプションの Cause cause = 6 [default = UNKNOWN_CAUSE];

//この問題が影響を受けるエンティティに与える影響はどのようなものですか。 effect_detail が含まれている場合は、Effect も含める必要があります。
 enum Effect {
    NO_SERVICE = 1;
    REDUCED_SERVICE = 2;

  //重大な遅延は考慮しません。検出が難しく、ユーザーへの影響が小さく、頻度が高すぎるため、結果が乱雑になります。
    SIGNIFICANT_DELAYS = 3;

    DETOUR = 4;
    ADDITIONAL_SERVICE = 5;
    MODIFIED_SERVICE = 6;
    OTHER_EFFECT = 7;
    UNKNOWN_EFFECT = 8;
    STOP_MOVED = 9;
    NO_EFFECT = 10;
    ACCESSIBILITY_ISSUE = 11;
 }
 オプションの Effect effect = 7 [default = UNKNOWN_EFFECT];

//パフォーマンスに関する追加情報を提供する URL alert.
 オプションのTranslatedString url = 8;

//アラート ヘッダー。アラート テキストの短い要約がプレーン テキストとして含まれています。
 オプションのTranslatedString header_text = 10;

//アラートの完全な説明がプレーン テキストとして含まれています。
//説明の情報は、ヘッダーの情報に追加する必要があります。
 オプションのTranslatedString description_text = 11;

//テキスト読み上げの実装で使用されるアラート ヘッダーのText。このフィールドは、header_text のテキスト読み上げバージョンです。
 オプションのTranslatedString tts_header_text = 12;

//テキスト読み上げの実装で使用されるアラートの完全な説明のText。このフィールドは、description_text の音声合成バージョンです。
 オプションのTranslatedString tts_description_text = 13;

//このアラートの重大度。
 enum SeverityLevel {
 UNKNOWN_SEVERITY = 1;
 INFO = 2;
 WARNING = 3;
 SEVERE = 4;
 }

 オプションのSeverityLevel severity_level = 14 [default = UNKNOWN_SEVERITY];

//アラート テキストとともに表示されるTranslatedImage 。迂回、駅の閉鎖などのアラート効果を視覚的に説明するために使用されます。画像はアラートの理解を深めるものでなければなりません。画像内で伝えられる重要な情報は、アラート テキストにも含まれている必要があります。
//次の種類の画像は推奨されません : 主にテキストを含む画像、追加情報を含まないマーケティングまたはブランド画像。
//注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
 オプションのTranslatedImage image = 15; 

//`image`フィールドでリンクされた画像の外観を説明するText(例: 画像を表示できない場合
//またはアクセシビリティ上の理由でユーザーが画像を見ることができない場合)。画像の代替テキストについては、HTML 仕様を参照してください - https://html.spec.whatwg.org/#alt.
//注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
 オプションのTranslatedString image_alternative_text = 16;
 
 
//アラートの原因の説明。Cause よりも具体的な機関固有の言語を使用できます。cause_detail が含まれている場合は、Cause も含める必要があります。
//注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
 オプションのTranslatedString cause_detail = 17;
 
//アラートの効果の説明。Effect よりも具体的な機関固有の言語を使用できます。 effect_detail が含まれる場合、Effect も含まれている必要があります。
//注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
 オプションのTranslatedString effect_detail = 18;

//extensions 名前空間により、サードパーティの開発者はGTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//次の拡張機能 ID は、あらゆる組織によるプライベート使用のために予約されています。
 extensions 9000 から 9999;
}

//
//上記で使用されている低レベルのデータ構造。
//

//時間間隔。 ’t’ が開始時刻以上で終了時刻未満の場合、その間隔は時刻 ’t’ にアクティブであるとみなされます。
 message TimeRange {
//開始時刻、POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。
//指定がない場合、間隔はマイナス無限大で始まります。
 省略可能なuint64 start = 1;

//終了時刻、POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。
//指定がない場合、間隔はプラス無限大で終了します。
 省略可能なuint64 end = 2;

//拡張機能の名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や
//仕様の変更を追加および評価できます。
 拡張機能 1000 から 1999;

//次の拡張機能 ID はプライベート用に予約されていますあらゆる組織で使用できます。
 extensions 9000 to 9999;
}

//位置。
 message Position {
//WGS-84 座標系での北度。
 required float latitude = 1;

//WGS-84 座標系での東度。
 required float longitude = 2;

//方位 (度単位、北から時計回り、つまり 0 が北、90 が東)。
//これはコンパス方位、または次の停車地または中間地点への方向になります。
//これは、以前の位置のシーケンスから推測される方向であってはなりません。これは、以前のデータから計算できます。
 オプションfloat bearing = 3;

//走行距離計の値 (メートル単位)。
 オプション double odometer = 4;
//車両によって測定された瞬間速度 (メートル/秒単位)。
 オプションfloat speed = 5;

//extensions 名前空間により、サードパーティ デベロッパーはGTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価します。
 拡張機能 1000 から 1999;

//以下の拡張機能 ID は、あらゆる組織による私的使用のために予約されています。
 拡張機能 9000 から 9999;
}

//GTFS 旅行のインスタンス、またはルートに沿った旅行のすべてのインスタンスを識別する記述子。
//- 単一の旅行インスタンスを指定するには、 trip_id (および必要な場合はstart_time) を設定します。route_id も設定する場合は、特定の旅行に対応するものと同じにする必要がありますroute_id//- 特定のルートに沿ったすべての旅行を指定するには、 route_idのみを設定します。trip_idが不明な場合は、 TripUpdateの停止シーケンス ID では不十分であり、stop_id も提供する必要があることに注意してください。 
// 加えて、絶対的な到着/出発時刻も提供する必要があります。
 message TripDescriptor {
//このセレクタが参照する GTFS フィードからのtrip_id//頻度ベースでない旅行の場合、このフィールドは旅行を一意に識別するのに十分です。頻度ベースの旅行の場合、start_time と start_date も
//必要になることがあります。schedule_relationship がTripUpdate内で DUPLICATED される場合、 trip_id は複製される
//静的 GTFS からの旅行を識別します。schedule_relationship がVehiclePosition内で DUPLICATED される場合、 trip_idは新しい複製旅行を識別し、対応するTripUpdateの値を含める必要があります。TripProperties。 trip_id.
 オプションのstringtrip_id = 1;

//このセレクタが参照する GTFS のroute_idオプションのstringroute_id = 5;

//GTFS フィードtrips.txtファイルの direction_id。
//このセレクタが参照する旅行の移動方向を示します。
 オプションの uint32 direction_id = 6;

//この旅行インスタンスの当初の予定開始時刻。
//trip_id が非頻度ベースの旅行に対応する場合、このフィールド
//は省略するか、GTFS フィードの値と同じにする必要があります。
//trip_id が頻度ベースの旅行に対応する場合、旅行の更新と車両の位置に対して start_time を指定する必要があります。旅行が exact_times=1 の GTFS レコードに対応する場合、start_time は対応する期間のfrequencies.txtの start_time より headway_secs の倍数
//(0 を含む) 後でなければなりません。旅行が exact_times=0 に該当する場合、start_time は任意で、当初は旅行の最初の出発時刻と想定されます。いったん確立されると、この頻度ベースの旅行の start_time は、最初の出発時刻が変更された場合でも不変と見なされます。その時間変更は、代わりにStopTimeUpdateに反映されます。
//フィールドの形式とセマンティクスは、GTFS/frequencies.txt/start_time と同じです (例: 11:15:35 または 25:15:35)。
 オプションのstringstart_time = 2;
//この旅行インスタンスの予定開始date。
//翌日の予定旅行と重なるほど遅れている旅行を明確にするために指定するしなければならない。たとえば、毎日 8:00
//と 20:00 に出発し、12 時間遅れている列車の場合、同じ時間に 2 つの異なる
//旅行が存在することになります。
//このフィールドは提供できますが、そのような
//衝突が不可能なスケジュールでは必須ではありません。たとえば、1 時間遅れの車両はスケジュールとは関係がないと見なされる、1 時間ごとの
//スケジュールで実行されるサービスなどです。
//YYYYMMDD 形式です。
 オプションのstringstart_date = 3;

//この旅行と静的スケジュールの関係。旅程が
//一時的なスケジュールに従って行われ、GTFS に反映されていない場合は、
//SCHEDULED としてマークするのではなく、おそらく ADDED としてマークします。
 enum ScheduleRelationship {
  //GTFS scheduleに従って実行されている旅程、または関連付けられるほどスケジュールされた旅程に近い
  //旅程。
    SCHEDULED = 0;

  //故障した車両の交換や突然の乗客の増加に対応するためなど、実行スケジュールに加えて追加された旅程。
  //注: 現在、このモードを使用するフィードの動作は指定されていません。 GTFS GitHub
  //[(1)](https://github.com/google/transit/issues/106) [(2)](https://github.com/google/transit/pull/221)
  //[(3)](https://github.com/google/transit/pull/219) では、ADDED の旅程を完全に指定するか廃止するかについて議論されており、
  //議論が確定した時点でドキュメントが更新されます。
    ADDED = 1;

  //スケジュールが関連付けられていない状態で運行されている旅程 (GTFS frequencies.txt exact_times=0)。
  //ScheduleRelationship =UNSCHEDULED の便では、すべての StopTimeUpdates も設定する必要があります。 ScheduleRelationship=UNSCHEDULED.
    UNSCHEDULED = 2;

  //スケジュールには存在していたが削除された旅程。
    CANCELED = 3;

  //使用しないでください。後方互換性のためだけに使用します。
    REPLACEMENT = 5 [deprecated=true];

  //故障した車両の交換や突然の乗客の増加に対応するためなど、TripPropertiesTripUpdateに加えて追加された旅程。TripUpdate.TripProperties.trip_id、 TripUpdate,
  //およびTripUpdateとともに使用して、静的 GTFS から既存の旅程をコピーしますが、開始日は別のサービスdateTripProperties/または時刻にtrip_idます。(CSV) GTFS
  //( TripPropertiesまたはcalendar_dates.txt内) の元の旅程に関連するサービスが今後 30 日以内に運行される場合、旅程の複製が許可されます。複製する旅程は、 TripUpdateによって識別trip_idれます。この列挙体は、 TripDescriptorによって参照される既存の旅程を変更しtrip_idん。プロデューサーが元の旅程をキャンセルする場合は、CANCELED または DELETED の値をTripUpdate別のTripUpdateを公開する必要があります。GTFS frequencies.txtで定義され、exact_times が空または 0 にTripDescriptor便は複製できません。新しい旅程のVehiclePositionには、 TripUpdateとtrip_idVehiclePositionの一致する値が含まれている必要があります。 ScheduleRelationship 
  //も DUPLICATED に設定する必要があります。
  //重複した旅行を表すために ADDED 列挙を使用していた既存のプロデューサーとコンシューマーは、
  //移行ガイド (https://github.com/google/transit/tree/master/gtfs-realtime/spec/en/examples/migration-duplicated.md)
  //に従って DUPLICATED 列挙に移行する必要があります。
  //注: このフィールドはまだ試験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
    DUPLICATED = 6;


  //スケジュールには存在していたが削除された旅行で、ユーザーには表示してはならない。
  //交通機関プロバイダーが、対応する旅行に関する情報を消費アプリケーションから完全に削除し、乗客に旅行がキャンセルされたと表示されないようにするには、CANCELED ではなく DELETED を使用する必要があります。たとえば、旅行が完全に別の旅行に置き換えられる場合などです。
  //この指定は、複数の旅行がキャンセルされ、代替サービスに置き換えられる場合に特に重要になります。
  //キャンセルに関する明示的な情報を消費者に示すと、より重要なリアルタイム予測が妨げられます。
  //注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
    DELETED = 7;
 }
 オプションScheduleRelationship schedule_relationship = 4;

 message ModifiedTripSelector {
  //含まれるTripModificationsオブジェクトがこの旅行に影響を与えるFeedEntityの ’id’。
    オプションstring modifications_id = 1;

  //modifications_id によって変更される GTFS フィードのtrip_idオプションstring affected_trip_id = 2;
 }
 オプション ModifiedTripSelector modified_trip = 7;

//extensions 名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や
//仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//次の拡張 ID は、あらゆる組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//実行中の車両の識別情報旅行。
 message VehicleDescriptor {
//車両の内部システム ID。車両ごとに一意である必要があり、システム内を移動する際に車両を追跡するために使用できます。
 オプションのstringid = 1;

//ユーザーに表示されるラベル。つまり、正しい車両を識別するために乗客に表示する必要があるもの。
 オプションのstringlabel = 2;

//車両のナンバー プレート。
 オプションのstringlicense_plate = 3;

 enum WheelchairAccessible {
  //旅行には車椅子でのアクセシビリティに関する情報がありません。
  //これは **デフォルト** の動作です。静的 GTFS に
  //_wheelchair_accessible_ 値が含まれている場合、上書きされません。
    NO_VALUE = 0;

  //旅行にアクセシビリティ値がありません。
  //この値により、GTFS の値が上書きされます。
    UNKNOWN = 1;

  //旅行に車椅子でアクセスできます。
  //この値により、GTFS の値が上書きされます。
    WHEELCHAIR_ACCESSIBLE = 2;

  //旅行に車椅子でアクセスできません。
  //この値により、GTFS の値が上書きされます。
    WHEELCHAIR_INACCESSIBLE = 3;
 }
 オプションWheelchairAccessible wheels_accessible = 4 [default = NO_VALUE];

//拡張機能の名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や
//仕様の変更を追加および評価できます。
 拡張機能1000 から 1999;

//次の拡張 ID は、あらゆる組織による私的使用のために予約されています。
 拡張 9000 から 9999;
}

//GTFS フィード内のエンティティのセレクターmessage EntitySelector {
//フィールドの値は、
//GTFS フィード内の適切なフィールドに対応している必要があります。
//少なくとも 1 つの指定子を指定する必要があります。複数指定した場合は、
//一致は指定されたすべての指定子に適用する必要があります。
 オプションのstringagency_id = 1;
 オプションのstringroute_id = 2;
//GTFS の route_type に対応します。
 オプションのint32 route_type = 3;
 オプションのTripDescriptor trip = 4;
 オプションのstringstop_id = 5;
//GTFS trips.txtの trip direction_id に対応します。指定されている場合は、
//route_idも指定する必要があります。
 オプション uint32 direction_id = 6;

//extensions 名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や
//仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//次の拡張 ID は、組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//テキストまたは URL のスニペットの言語ごとのバージョンを含む国際化message。
//messageから文字列の 1 つが取得されます。解決は次のように進行します:
//1. UI 言語が翻訳の言語コードと一致する場合、
//  最初に一致する翻訳が選択されます。
//2.デフォルトの UI 言語 (例: 英語) が翻訳の言語コードと一致する場合、
//  最初に一致する翻訳が選択されます。
//3.翻訳に言語コードが指定されていない場合は、その翻訳が選択されます。
 message TranslatedString {
 message Translation {
  //messageを含む UTF-8string。
    required string text = 1;
  //BCP-47 言語コード。言語が不明な場合、またはフィードに対して i18n がまったく行われない場合は省略できます。最大 1 つの翻訳に、未指定の言語タグを付けることができます。
    オプションのstringlanguage = 2;

  //extensions 名前空間により、サードパーティの開発者は
  //GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
    extensions 1000 から 1999;

  //以下の拡張 ID は、あらゆる組織による私的使用のために予約されています。
    extensions 9000 から 9999;
 }
//少なくとも 1 つの翻訳を指定する必要があります。
 繰り返し Translation translation = 1;

//extensions 名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//以下の拡張 ID は、あらゆる組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//国際化された画像には、画像にリンクする URL の言語別バージョン
//およびメタ情報
//messageの画像のうち 1 つだけがコンシューマーによって保持されます。解決は次のように行われます
//:
//1. UI 言語が翻訳の言語コードと一致する場合
//  最初に一致する翻訳が選択されます。
//2.デフォルトの UI 言語 (例: 英語) が翻訳の言語コードと一致する場合
//  最初に一致する翻訳が選択されます。
//3.翻訳に未指定の言語コードがある場合、その翻訳が選択されます
//  注: このフィールドはまだ実験段階であり、変更される可能性があります。将来正式に採用される可能性があります。
 message TranslatedImage {
 message LocalizedImage {
  //画像にリンクする URL を含む文字列
  //リンクされる画像は 2MB 未満である必要があります。 
  //画像が大幅に変更され、コンシューマー側で更新が必要になる場合、プロデューサーは URL を新しいものに更新する必要があります。
  //URL は http://または https://を含む完全修飾 URL である必要があり、URL 内のすべての特殊文字は正しくエスケープする必要があります。完全修飾 URL 値の作成方法については、次の http://www.w3.org/Addressing/URL/4_URI_Recommentations.html を参照してください。
    必須のstringurl = 1;

  //表示する画像のタイプを指定するための IANA メディア タイプ。
  //タイプは "image/" で始まる必要があります
    必須のstringmedia_type = 2;

  //BCP-47 言語コード。言語が不明な場合、またはフィードに対して i18n がまったく行われない場合は省略できます。最大で 1 つの翻訳に、未指定の言語タグを付けることができます。
    オプションのstringlanguage = 3;


  //extensions 名前空間により、サードパーティ デベロッパーは
  //GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
    extensions 1000 から 1999;

  //以下の拡張 ID は、あらゆる組織による私的使用のために予約されています。
    extensions 9000 から 9999;
 }
//ローカライズされた画像を少なくとも 1 つ提供する必要があります。
 repeat LocalizedImage localized_image = 1;

//extensions 名前空間により、サードパーティ デベロッパーは
//GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//以下の拡張 ID は、あらゆる組織による私的使用のために予約されています。
 extensions 9000 から9999;
}

//迂回など、車両が (CSV) GTFS の一部ではない場合に車両がたどる物理的な経路を記述します。ルート形状は便に属し、一連のシェイプ ポイントで構成されます。
//ポイントを順番にトレースすると、車両の経路が提供されます。ルート形状は停留所等の位置を正確に横切る必要はありませんが、旅行のすべての停留所等 は、その旅行のシェイプからわずかな距離内、つまりシェイプ ポイントを接続する直線セグメントの近くに配置する必要があります。
//注: このmessageはまだ実験段階であり、変更される可能性があります。将来正式に採用される可能性があります。
 message Shape {
//シェイプの識別子。 (CSV) GTFS で定義されている shape_id と異なるしなければならない。
//このフィールドは reference.md に従って必須ですが、"必須は永久に有効" であるため、ここではオプションとして指定する必要があります。
//https://developers.google.com/protocol-buffers/docs/proto#specifying_field_rules を参照してください。
//注: このフィールドはまだ試験段階であり、変更される可能性があります。将来正式に採用される可能性があります。
 オプションのstringshape_id = 1;
 
//シェイプのエンコードされたポリライン表現。このポリラインには少なくとも 2 つのポイントが含まれている必要があります。
//エンコードされたポリラインの詳細については、https://developers.google.com/maps/documentation/utilities/polylinealgorithm を参照してください
//このフィールドは reference.md に従って必須ですが、`必須は永久に有効`であるため、ここではオプションとして指定する必要があります
//https://developers.google.com/protocol-buffers/docs/proto#specifying_field_rules を参照してください
//注: このフィールドはまだ実験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
 オプションのstringencoding_polyline = 2;

//extensions 名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や
//仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//次の拡張 ID は、あらゆる組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//旅行が運行される停留所を記述します。すべてのフィールドは、GTFS-Static 仕様で説明されているとおりです。
//注: このmessageはまだ試験段階であり、変更される可能性があります。将来的には正式に採用される可能性があります。
 message Stop {
 enum WheelchairBoarding {
    UNKNOWN = 0;
    AVAILABLE = 1;
    NOT_AVAILABLE = 2;
   }

 オプションのstringstop_id = 1;
 オプションのTranslatedString stop_code = 2;
 オプションのTranslatedString stop_name = 3;
 オプションのTranslatedString tts_stop_name = 4;
 オプションのTranslatedString stop_desc = 5;
 オプションのfloat stop_lat = 6;
 オプションのfloat stop_lon = 7;
 オプションのstringzone_id = 8;
 オプションのTranslatedString stop_url = 9;
 オプションのstringparent_station = 11;
 オプションのstringstop_timezone = 12;
 オプションのWheelchairBoarding wheels_boarding = 13 [default = UNKNOWN];
 オプションのstringlevel_id = 14;
 オプションのTranslatedString platform_code = 15;

//extensions 名前空間を使用すると、サードパーティの開発者が
//GTFS Realtime仕様を拡張して、新機能や
//仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//以下の拡張 ID は、あらゆる組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//注: このフィールドはまだ試験段階であり、変更される可能性があります。将来、正式に採用される可能性があります。
 message TripModifications {
//`Modification`messageは、`start_stop_selector` から始まる、影響を受ける各旅程の n 個の停車時刻の範囲を置き換えます。
 message Modification {
  //この変更の影響を受ける元の旅程の最初の stop_time の停車セレクター。
  //`end_stop_selector` と組み合わせて使用​​します。 
  //`start_stop_selector` は必須であり、`travel_time_to_stop` で使用される参照停車地を定義するために使用されます。
    オプションのStopSelector start_stop_selector = 1;

  //この変更によって影響を受ける元の旅行の最後の停車地の停車地セレクター。
  //選択は包括的であるため、その変更によって 1 つの stop_time のみが置き換えられる場合は、`start_stop_selector` と `end_stop_selector` は同等である必要があります。
  //stop_time が置き換えられない場合は、`end_stop_selector` を指定しないでください。それ以外の場合は必須です。
    オプションのStopSelector end_stop_selector = 2;

  //この変更の終了後にすべての出発時刻と到着時刻に追加する遅延の秒数。
  //同じ旅行に複数の変更が適用されると、旅行が進むにつれて遅延が累積します。 
    オプションint32 propagated_modification_delay = 3 [デフォルト = 0];

  //元の旅行の停留所を置き換える代替停留所のリスト。
  //新しい停車時刻の長さは、置き換えられた停車時刻の数より短くなったり、同じになったり、長くなったりする場合があります。 
    繰り返しReplacementStop replacement_stops = 4;

  //ユーザー向けのコミュニケーション用にこのModificationを説明する`Alert`を含む`FeedEntity`messageの`id`値。
    オプションのstringservice_alert_id = 5;

  //このタイムスタンプは、変更が最後に変更された瞬間を識別します。
  //POSIX 時間 (つまり、1970 年 1 月 1 日 00:00:00 UTC からの秒数)。
    オプションのuint64 last_modified_time = 6;

  //拡張機能の名前空間により、サードパーティの開発者は
  //GTFS Realtime仕様を拡張して、新機能や
  //仕様の変更を追加および評価できます。
    拡張機能 1000 から 1999;

  //次の拡張機能 ID は、あらゆる組織によるプライベート使用のために予約されています。
    拡張機能 9000 から 9999;
 }

message SelectedTrips {
  //この置換の影響を受ける、新しい`shape_id`がすべて同じである旅行のリスト。
    繰り返しstringtrip_ids = 1;
  //このSelectedTrips内の変更された旅行の新しいシェイプのID//GTFS-RT Shapemessageを使用して追加された新しいシェイプ、または GTFS-Static フィードのshapes.txtで定義されている既存のシェイプを参照する場合があります。
    オプションのstringshape_id = 2;

  //extensions 名前空間により、サードパーティの開発者は
  //GTFS Realtime仕様を拡張して、新機能や
  //仕様の変更を追加および評価できます。
    extensions 1000 から 1999;

  //次の拡張 ID は、あらゆる組織によるプライベート使用のために予約されています。
    extensions 9000 から 9999;
}

 //このTripModificationsの影響を受ける選択された旅行のリスト。
 繰り返しSelectedTrips selected_trips = 1;

//trip_ids で定義されたtrip_idのリアルタイム旅行記述子の開始時刻のリスト。
//頻度ベースの旅行でtrip_idの複数の出発をターゲットにするのに便利です。
 repeated string start_times = 2;

//変更が発生する日付 (YYYYMMDD 形式)。プロデューサーは、今後 1 週間以内に発生する迂回のみを送信するするべきである。
//提供された日付はユーザー向けの情報として使用しないでください。ユーザー向けの開始日と終了dateを提供する必要がある場合は、リンクされたサービス アラートで `service_alert_id` を使用して提供できます。
 repeated string service_dates = 3;

//影響を受ける旅行に適用する変更のリスト。
 repeated Modification modifications = 4; 

//拡張機能の名前空間により、サードパーティの開発者は
//GTFS Realtime仕様を拡張して、新機能や
//仕様の変更を追加および評価できます。
 拡張機能 1000 から 1999;

//以下の拡張機能 ID は、

あらゆる組織による私的使用のために提供されます。
 拡張子 9000 から 9999;
}

//注: このフィールドはまだ実験段階であり、変更される可能性があります。将来正式に採用される可能性があります。
//停留所シーケンスまたは stop_id で停留所を選択します。 2 つの値のうち少なくとも 1 つは指定する必要があります。
 message StopSelector { 
//対応する GTFS フィードのstop_times.txtと同じであるしなければならない。
 オプションの uint32 stop_sequence = 1;
//対応する GTFS フィードのstops.txtと同じであるしなければならない。
 オプションのstring stop_id = 2;

//extensions 名前空間により、サードパーティのデベロッパーは
//GTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//次の拡張 ID は、あらゆる組織による私的使用のために予約されています。
 extensions 9000 から 9999;
}

//注: このフィールドはまだ試験段階であり、変更される可能性があります。将来正式に採用される可能性がありますmessage ReplacementStop {
//この停留所への到着時刻と参照停留所への到着時刻の差 (秒単位)。参照停留所は、start_stop_selector の前の停留所です。変更が旅程の最初の停車地から始まる場合、旅程の最初の停車地が参照停車地になります。
//この値は単調に増加するしなければならないがあり、元の旅程の最初の停車地が参照停車地である場合は負の数のみにすることができます。
 オプションint32 travel_time_to_stop = 1;

//旅程で訪問される代替の停車地ID-RT Stopmessageを使用して追加された新しい停車地、または GTFS-Static フィードのstops.txtで定義されている既存の停車地を参照する場合があります。停留所には location_type=0 (ルート可能な停留所)がしなければならない。
 オプションのstringstop_id = 2;

//extensions 名前空間により、サードパーティの開発者はGTFS Realtime仕様を拡張して、新機能や仕様の変更を追加および評価できます。
 extensions 1000 から 1999;

//次の拡張 ID は、あらゆる組織によるプライベート使用のために予約されています。
 extensions 9000 から 9999;
}
```

