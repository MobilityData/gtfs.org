# GTFS Realtime### 改訂履歴

#### 2024 年 3 月

* 旅程変更を採用しました。[ディスカッション](https://github.com/google/transit/pull/403) を参照してください。

#### 2022 年 11 月

* 削除された旅程のサポートを追加しました。[ディスカッション](https://github.com/google/transit/pull/352) を参照してください。

#### 2022 年 7 月

* cause_detail と effect_detail を追加しました。[ディスカッション](https://github.com/google/transit/pull/332) を参照してください。
* TripUpdate. VehicleDescriptorで wheels_accessible 値を指定できるようになりました。 [ディスカッション](https://github.com/google/transit/pull/340) を参照してください。

#### 2021 年 9 月

* アラートの機能/画像。[ディスカッション](https://github.com/google/transit/pull/283) を参照してください。

#### 2021 年 8 月

* GTFS-NewShapes を試験的に追加。[ディスカッション](https://github.com/google/transit/pull/272) を参照してください。

#### 2021 年 4 月

* TripUpdateに department_occupancy_status を追加します。[ディスカッション](https://github.com/google/transit/pull/260) を参照してください。

#### 2021 年 2 月

* GTFS Realtimeの乗車率の説明を明確化。 [ディスカッション](https:](https://github.com/google/transit/pull/237) を参照してください。

#### 2020 年 4 月

* 停留所の割り当てに対応しました。[ディスカッション](https://github.com/google/transit/pull/219) を参照してください。

#### 2020 年 7 月

* 重複した旅行に対応しました。[ディスカッション](https://github.com/google/transit/pull/221) を参照してください。
* アラート tts_header_text、tts_description_text は試験運用ではなくなりました。 [ディスカッション](https://github.com/google/transit/pull/229) を参照してください。
* GTFS-RT ADDED の旅行を、完全に指定されていないものとしてラベル付けします。[ディスカッション](https://github.com/google/transit/pull/230) を参照してください。

#### 2020 年 4 月

* SeverityLevel をfinal としてマークします。[ディスカッション](https://github.com/google/transit/pull/214) を参照してください。
* occupancy_percentage を追加します。[ディスカッション](https://github.com/google/transit/pull/213) を参照してください。

#### 2020 年 3 月 12 日

* ブロック内の次の旅行についてTripUpdate予測を提供することを推奨します。 [ディスカッション](https://github.com/google/transit/pull/206) を参照してください。

#### 2019 年 8 月

* trip_updates はフィード内でブロック順に発生する必要がないことを文書化しました。[ディスカッション](https://github.com/google/transit/pull/176) を参照してください。
* StopTimeUpdate. ScheduleRelationship UNSCHEDULED 値を追加します。[ディスカッション](https://github.com/google/transit/pull/173) を参照してください。

#### 2019 年 5 月

* アクセシビリティの問題アラート効果を追加します。[ディスカッション](https://github.com/google/transit/pull/164) を参照してください。

#### 2019 年 2 月

* GTFS リアルタイム サービス アラートに NO_EFFECT 効果オプションを追加します。 [ディスカッション](https://github.com/google/transit/pull/137) を参照してください。
* Service Alerts フィードに新しいオプション フィールドSeverityLevelを追加します。[ディスカッション](https://github.com/google/transit/pull/136) を参照してください。
* Service Alerts フィードにテキスト読み上げ機能用の新しいオプション フィールドを追加します。[ディスカッション](https://github.com/google/transit/pull/135) を参照してください。

#### 2018 年 4 月

* SCHEDULED ルートの stop_time_update 到着と出発の要件を削除します。[ディスカッション](https://github.com/google/transit/pull/165) を参照してください。

#### 2017 年 8 月

* GTFS リアルタイム フィールドのセマンティック カーディナリティを定義します。 [ディスカッション](https://github.com/google/transit/pull/64) を参照してください。

#### 2015 年 1 月 30 日

* 残りのすべての GTFS リアルタイム メッセージに Protocol Buffer 拡張名前空間を追加しました ( `FeedMessage`や`FeedEntity`など)。

#### 2015 年 1 月 28 日

* `TripUpdate`に試験的なフィールド`delay`を追加しました ([ディスカッション](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8))。

#### 2015 年 1 月 16 日

* `TripDescriptor.start_time`の説明を更新しました。

#### 2015 年 1 月 8 日

* 試験的な列挙型`OccupancyStatus`を定義しました。
* 試験的なフィールドを追加しました`occupancy_status`を`VehiclePosition`に変更しました ([ディスカッション](https://groups.google.com/forum/#!topic/gtfs-realtime/_HtNTGp5LxM))。

#### 2014 年 5 月 22 日

* `StopTimeUpdate`messageの`ScheduleRelationship`列挙型の説明を更新しました ([ディスカッション](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI))。
* `TripDescriptor`messageの`ScheduleRelationship`ら` REPLACEMENT を削除しました ([ディスカッション](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI))。

#### 2014 年 10 月 12 日2012

* `TripUpdate`プ` フィールドを追加しました。

#### 2012 年 5 月 30 日

* 仕様に拡張機能に関する具体的な詳細を追加しました。

#### 2011 年 11 月 30 日

* 仕様の拡張機能の記述を容易にするため、主要な GTFS リアルタイム メッセージに Protocol Buffer 拡張名前空間を追加しました。

#### 2011 年 10 月 25 日

* `alert`、 `header_text` 、 `description_text`ン` テキスト値であることを明確化するためにドキュメントを更新しました。

#### 2011 年 8 月 20 日

* `TimeRange`messageのセマンティクスを明確にするためにドキュメントを更新しました。

#### 2011 年 8 月 22 日

* 初期バージョン。