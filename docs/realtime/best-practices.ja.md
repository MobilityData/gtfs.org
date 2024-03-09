---
search:
  exclude: true
---

# GTFS Realtime

## はじめに

[GTFS Realtime](../reference)データフォーマットで、公共交通機関のRealtime情報を記述する際の推奨事項です。

### 文書構成

推奨されるプラクティスは、主に2つのセクションに分かれています。

* __メッセージ別[推奨](#practice-recommendations-organized-by-message)__事項GTFS Realtimeの公式リファレンスに記載されている順番で、メッセージとフィールドごとに整理されています。
* __[ケース](#practice-recommendations-organized-by-use-case)__別推奨事項：ケース別に推奨事項をまとめました。頻度ベースのサービス(対Scheduleサービス)のような特定のケースでは、複数のメッセージとフィールド、および対応するGTFS Scheduleデータにわたって適用する必要がある場合があります。そのような推奨事項をこのセクションにまとめました。

### フィードの公開と一般的なプラクティス

* フィードは、公開された恒久的なURLで公開されるべきです。
* この URL は、フィードにアクセスするためにログインすることなく直接アクセスできるようにする必要があります。必要に応じて API キーを使用することもできますが、API キーの登録は自動化され、誰でも使用できるようにする必要があります。
* GTFS Realtimeフィード内の永続的な識別子 (id フィールド) (`FeedEntity.id`,`VehicleDescriptor.id`,`CarriageDetails.id` など) は、フィードの繰り返しにわたって維持される。
* GTFS Realtimeフィードは、少なくとも 30 秒に一度、またはフィード内の情報 (車両の位置) が変化するたびに、リフレッシュされる必要があります。VehiclePosition は他のフィードエンティティよりも頻繁に変更される傾向があるため、できるだけ頻繁に更新する必要があります。コンテンツに変更がない場合は、フィードの`FeedHeader.timestamp`を更新し、 その時点の情報がまだ適切であることを示すようにします。
* GTFS Realtimeフィード内のデータは、Trip Updates と Vehicle Position は 90 秒以上、Service Alerts は 10 分未満である必要があります。例えば、生産者が`FeedHeader.timestamp`のタイムスタンプを 30 秒ごとに更新し続けている場合でも、そのフィード内の VehiclePosition は 90 秒より古くならないようにする必要があります。
* GTFS Realtimeデータをホストするサーバーは、信頼性が高く、常に有効なフォーマットのprotobuf-encodedレスポンスを返す必要があります。無効なレスポンス（protobufエラーまたはフェッチエラー）は1%未満でなければならない。
* GTFS Realtimeデータをホストするウェブサーバーは、ファイルの修正日を正しく報告するように設定されるべきです。(セクション 14.29 の HTTP/1.1 - Request for Comments 2616 を参照) そのため、消費者は`If-Modified-Since`HTTP header を利用することができます。これにより、プロデューサとコンシューマは、変更されていないフィードコンテン ツの転送を避けることができ、帯域幅を節約することができる。
* フィードは、与えられたURLのHTTPリクエストで照会されたとき、デフォルトでプロトコルバッファでエンコードされたフィードコンテンツを提供すべきです。 - 消費者は、プロトコルバッファでエンコードされたコンテンツを受け取るために特別なHTTP acceptヘッダーを定義する必要はないはずです。
* プロトコルバッファは[オプションの値を](https://developers.google.com/protocol-buffers/docs/proto#optional)エンコードするため、GTFS Realtimeフィードからデータを読み込む前に、プロトコルバッファが生成する`hasX()`メソッドで値の存在を確認し、`hasX()`が真の場合のみ値を使用しなければなりません(`Xは`フィールド名です)。`hasX() が` `false` を返した場合、`GTFS`.proto の値で定義されたそのフィールドのデフォルト値が仮定されるべきである。コンシューマが`hasX()`メソッドを確認せずにその値を使用した場合、プロデューサが意図的に公開したのではないデフォルトデータを読み込んでいる可能性がある。
* フィードは、フィードの完全性を確保するために、HTTPの代わりにHTTPSを使用する必要があります（暗号化なし）。
* フィードは、関連する静的なGTFSデータセットに含まれる旅行の大部分をカバーする必要がある。特に、高密度で交通量の多い市街地や交通量の多い路線のデータを含むべきである。

## 推奨されるプラクティス（メッセージ別

### フィードヘッダ

| フィールド名                  | レコメンデーション                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gtfs_realtime_version` | 現在のバージョンは "2.0 "です。 GTFS Realtime Realtime初期バージョンでは、乗り換えの状況を表現するのに必要なフィールドがすべて揃っていないため、すべてのGTFS Realtimeフィードは "2.0" 以降であるべきです。                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `timestamp`             | このタイムスタンプは、連続した2回のフィードの間で減少してはならない。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|                         | フィードの内容が変更された場合は、このタイムスタンプの値も常に変更されるべきである。 `timestamp`.<br/><br/>*よくある間違い*- ロードバランサーの後ろにGTFS Realtimefeedのインスタンスが複数ある場合、それぞれのインスタンスがRealtimeデータソースから情報を取得し、コンシューマーに公開する際に同期していない可能性があります。GTFS Realtimeコンシューマが2つのリクエストを同時に行った場合、それぞれのリクエストは異なるGTFS Realtimefeedインスタンスによって処理され、同じフィードコンテンツが異なるタイムスタンプでコンシューマに返される可能性があります。<br/><br/>*可能な解決策*- プロデューサは `Last-Modified`HTTP ヘッダを提供し、コンシューマはその最新の `If-Modified-Since`HTTP ヘッダーを渡す必要があります。<br/><br/>*可能な解決策*- HTTPヘッダーを使用できない場合は、スティッキーセッションなどのオプションを使用して、各コンシューマーが同じプロデューサーサーバーにルーティングされるようにすることができます。 |

### フィードエンティティ

GTFS Realtimeフィードからエンティティを削除するのは、ユーザーとの関連性がなくなったときだけです。フィードはステートレスであると考えられており、各フィードがトランジットシステムのリアルタイムな状態を反映することを意味します。あるフィードのインスタンスで提供されたエンティティが、その後のフィードの更新で削除された場合、そのエンティティにはリアルタイムの情報はないと考えるべきです。

| フィールド名 | レコメンデーション                   |
| ------ | --------------------------- |
| `id`   | 旅行期間全体にわたって安定した状態に保たれるべきである |

### TripUpdate

トリップキャンセルのための一般的なガイドライン。

* 何日もかけてトリップをキャンセルする場合、制作者は、与えられた`trip_` `idと` `start_datesを` `CANCELEDとして`参照するTripUpdateと、キャンセルについてライダーに説明する`NO_SERVICEと` `TimeRangeを`参照するAlert（例：迂回）を提供すべきです。
* トリップ内の停留所を訪問しない場合、すべての`stop_time_updateを` `SKIPPEDとして`マークする代わりに、トリップを`CANCELEDに`する必要があります。

| フィールド名             | レコメンデーション                                                                                                                                                                                                                                                                                                                                                                              |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip`             | 参照 [メッセージ TripDescriptor](#TripDescriptor).                                                                                                                                                                                                                                                                                                                                            |
|                    | 分離されている場合 `VehiclePosition`そして `TripUpdate`フィードが提供されている場合。 [TripDescriptor](#TripDescriptor)そして [車両記述子（VehicleDescriptor](#VehicleDescriptor)ID値のペアは、2つのフィードの間で一致する必要があります。<br/><br/>例えば `VehiclePosition`エンティティは `vehicle_id:A`そして `trip_id:4`である場合，対応する `TripUpdate`のエンティティも持つべきです。 `vehicle_id:A`そして `trip_id:4`.もし `TripUpdate`を持つ `trip_id:4`および任意の `vehicle_id`が4以外の場合、エラーとなります。 |
| `vehicle`          | 参照 [メッセージ VehicleDescriptor](#VehicleDescriptor).                                                                                                                                                                                                                                                                                                                                      |
|                    | 別の `VehiclePosition`そして `TripUpdate`フィードが提供されます。 [TripDescriptor](#TripDescriptor)そして [VehicleDescriptor](#VehicleDescriptor)ID値のペアは、2つのフィード間で一致させる必要があります。<br/><br/>例えば、ある `VehiclePosition`があります。 `vehicle_id:A`そして `trip_id:4`がある場合、対応する `TripUpdate`を持つべきである。 `vehicle_id:A`そして `trip_id:4`.もしあれば `TripUpdate`を持つエンティティは `trip_id:4`と任意の `vehicle_id`4 以外の場合，エラーとする。               |
| `stop_time_update` | `stop_time_updates`は、与えられた `trip_id`は，増加することによって厳密に並べられなければならない。 `stop_sequence`であり `stop_sequence`は繰り返されるべきです。                                                                                                                                                                                                                                                                        |
|                    | 旅行が進行している間、すべての `TripUpdates`には、少なくとも1つの `stop_time_update`は、将来の到着時刻または出発時刻が予測されるものでなければならない。なお [GTFS Realtime仕様](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates)では、プロデューサは過去の `StopTimeUpdate`を削除してはならない、と述べている。                                                                                                               |
| `timestamp`        | このトリップの予測が更新された時間を反映する必要がある。                                                                                                                                                                                                                                                                                                                                                           |
| `delay`            | `TripUpdate.delay`は、Schedule偏差、すなわち、車両がどの程度Schedule進んでいるか／遅れているかの過去の観測値を表すべきである。将来の停車駅の予測は、以下のように提供されるべきである。 `StopTimeEvent.delay`または `StopTimeEvent.time`.                                                                                                                                                                                                                            |

### TripDescriptor

`VehiclePositionと` `TripUpdateの`フィードが別々に提供されている場合、[TripDescriptorと](#TripDescriptor) [VehicleDescriptorの](#VehicleDescriptor)ID値の組は2つのフィード間で一致する必要があります。

例えば、`VehiclePosition`エンティティが`vehicle_id:A`と`trip_id`:4 を持つ場合、対応する`TripUpdate`エンティティは`vehicle_id:A`と`trip_id`:4 も持つべきである。

| フィールド名                  | レコメンデーション                                         |
| ----------------------- | ------------------------------------------------- |
| `schedule_relationship` | トリップの動作は `ADDED`trip の動作は特定されておらず、この列挙の使用は推奨されない。 |

### VehicleDescriptor

別々の`VehiclePosition`および`TripUpdate`フィードが提供される場合、[TripDescriptor](#TripDescriptor)および[VehicleDescriptor](#VehicleDescriptor)ID値の組合せは、2つのフィード間で一致することが望ましい。

例えば、`VehiclePosition`エンティティが`vehicle_id:A`と`trip_id`:4 を持つ場合、対応する`TripUpdate`エンティティは`vehicle_id:A`と`trip_id`:4 を持つ必要がある。

| フィールド名 | レコメンデーション                            |
| ------ | ------------------------------------ |
| `id`   | トリップ期間全体にわたって、車両を一意にかつ安定的に識別する必要がある。 |

### StopTimeUpdate

| フィールド名          | レコメンデーション                                                                                                                                                                     |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `stop_sequence` | 提供する `stop_sequence`とは異なり、GTFS停止時刻に一意に解決されるため、可能な限り、この列挙を使用すること。 `stop_times.txt`とは異なり `stop_id`ループルートなど）。                                                                    |
| `arrival`       | 連続した停車駅間の到着時間は増加すべきである-同じであってはならないし、減少してもならない。                                                                                                                                |
|                 | 到着時刻 `time`(で指定 [停止時間イベント（StopTimeEvent](#StopTimeEvent)で指定された）到着時刻は、出発時刻より前でなければならない。 `time`待ち時間または滞在時間が予想される場合は、同じ停留所の到着時刻は出発時刻より前でなければならない。 `time`は、出発と同じであるべきである。 `time`. |
| `departure`     | 連続する停留所間の出発時間は増加すべきである-同じか減少すべきではない。                                                                                                                                          |
|                 | 出発 `time`(で指定）。 [停止時間イベント（StopTimeEvent](#StopTimeEvent)は到着と同じであるべきである。 `time`と同じでなければなりません。 `time`は到着の後でなければならない。 `time`.                                                    |

### ストップタイムイベント（StopTimeEvent

| フィールド名  | レコメンデーション                                                                                                                                                                                                                                                                                 |
| ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `delay` | もし `delay`のみが提供される場合 `stop_time_update` `arrival`または `departure`(が指定されている場合（そして `time`)であれば，GTFS[`stop_times.txt`](https://gtfs.org/reference/static#stopstxt)には `arrival_times`と `departure_times`を含むべきである。A `delay`Realtimeフィードの値は、GTFS追加する時刻がない限り意味がありません。 `stop_times.txt`ファイルを作成します。 |

### 車両位置

VehiclePostionsフィードに含まれるべき推奨フィールドは以下のとおりです。

| フィールド名               | 備考                                                                                                                          |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `entity.id`          | 旅行期間全体にわたって安定に保たれるべきである                                                                                                     |
| `vehicle.timestamp`  | 車両位置が測定されたタイムスタンプを提供することを強く推奨する。そうでない場合、消費者はメッセージのタイムスタンプを使用しなければならず、最後のメッセージが個々の位置よりも頻繁に更新された場合、ライダーにとって誤解を招く結果になることがあります。 |
| `vehicle.vehicle.id` | トリップ期間全体にわたって、車両を一意にかつ安定的に識別する必要がある。                                                                                        |

### 位置情報

車両位置は、この`trip_id` `DETOURの`効果を持つアラートがない限り、現在のトリップのGTFS `shapes.txt`データから200m以内であるべきである。

### 注意事項

アラートに関する一般的なガイドライン

* `trip_id` `start_time` `exact_time=1`間隔である場合、`start_time`間隔の始まりより`headway_secsの`倍数だけ遅くなっていなければならない。
* 何日もかけて旅行をキャンセルする場合、製作者は、指定された`trip_idと` `start_datesを` `CANCELEDとして`参照するTripUpdateを提供するとともに、キャンセルについてライダーに説明する`NO_SERVICEと` `trip_id`および`TimeRangeを`参照するAlert（例：遠回り）を提示しなければなりません。
* 警告がライン上のすべての停留所に影響する場合、停留所ベースの警告の代わりにラインベースの警告を使用します。ラインのすべての停留所に警告を適用しないでください。
* サービスアラートには文字数の制限はありませんが、交通機関の利用者はモバイルデバイスでアラートを見ることが多いでしょう。簡潔な表現にしてください。

| フィールド名             | レコメンデーション                        |
| ------------------ | -------------------------------- |
| `description_text` | サービスアラートを読みやすくするために、改行を使用してください。 |

## ユースケース別に分類された実践的な推奨事項

### 頻度ベースのトリップ

頻度ベースのトリップは、固定Schedule従わないが、所定のヘッドウェイを維持しようとする。[GTFS.org/reference/static/#frequenciestxt">GTFS](<https://\<glossary variable=>)frequency.txtでは、`exact_times=0と`するか、`exact_times`フィールドを省略することでこのようなトリップを表します（`exact_times=1の`トリップは、frequency-based trip*ではない*ことに注意してください -`frequent_times=1`の`frequencies.txt`は単にSchedule旅をよりコンパクトに保存するための便宜上使われています）。頻度ベースのトリップのGTFS Realtimeフィードを構築する際に、留意すべきベストプラクティスがいくつかあります。

* [TripUpdate.StopTimeUpdateでは](#StopTimeUpdate)、`到着と` `出発の` [StopTimeEventに](#StopTimeEvent) `遅延を`含めないようにします。代わりに、到着/出発予測を示す`時間が`提供されるべきである。

* [TripUpdate](#TripUpdate)や[VehiclePosition](#VehiclePosition)で[TripDescriptor](#TripDescriptor) を用いて`トリップを`記述する場合、`trip_id`,`start_time`,`start_date`の全てを記述することが仕様で規定されている。また、`schedule` `_relationship`は`UNSCHEDULED` とする。

(例: 再強化トリップ).

## この文書について

### 目的

GTFS Realtime維持する目的は、次のとおりです。

* 公共交通アプリケーションにおけるエンドユーザーの顧客体験を向上させる。
* ソフトウェア開発者によるアプリケーション、製品、およびサービスの展開と拡張を容易にする。

### 公開されているGTFS Realtime提案・修正方法

GTFSアプリケーションや運用は進化していくので、このドキュメントも随時修正する必要があります。このドキュメントを修正する場合は、[ GTFS Realtime](https://github.com/MobilityData/GTFS_Realtime_Best-Practices)Best Practices GitHub リポジトリでプルリクエストを作成し、変更を提案してください。

### この文書へのリンク

GTFS Realtimeデータを正しく形成するためのガイダンスをフィードメーカーに提供するために、ここにリンクを貼ってください。各勧告にはアンカーリンクがあります。推奨事項をクリックすると、ページ内アンカーリンクのURLが表示されます。

GTFS Realtime を使用するアプリケーションが、ここに書かれていないGTFS Realtimeデータに関する要求や推奨をする場合、これらの共通のベストプラクティスを補足するために、それらの要求や推奨を記載したドキュメントを公開することが推奨されます。