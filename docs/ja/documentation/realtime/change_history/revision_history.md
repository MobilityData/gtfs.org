# GTFS realtime

### 改訂履歴

#### 2024年3月

* 旅程変更を採用しました。[ディスカッション](https://github.com/google/transit/pull/403)を参照してください。

#### 2022年11月

* 削除された便のサポートを追加しました。[ディスカッション](https://github.com/google/transit/pull/352)を参照してください。

#### 2022年07月

* cause_detail と effect_detail を追加しました。[ディスカッション](https://github.com/google/transit/pull/332)を参照してください。
* TripUpdate.VehicleDescriptor で wheels_accessible 値を指定できるようになりました。[ディスカッション](https://github.com/google/transit/pull/340)を参照してください。

#### 2021年9月

* アラートの機能/画像。[ディスカッション](https://github.com/google/transit/pull/283)を参照してください。

#### 2021年8月

* GTFS-NewShapes を試験的に追加。[ディスカッション](https://github.com/google/transit/pull/272)を参照してください。

#### 2021年4月

* TripUpdate に destination_occupancy_status を追加します。[ディスカッション](https://github.com/google/transit/pull/260)を参照してください。

#### 2021年2月

* GTFS realtime の乗車率の説明を明確化。 [ディスカッション](https://github.com/google/transit/pull/259)を参照してください。

#### 2020年9月

* 複数車両の混雑に対応しました。[ディスカッション](https://github.com/google/transit/pull/237)を参照してください。

#### 2020年4月

* 停留所の割り当てに対応しました。[ディスカッション](https://github.com/google/transit/pull/219)を参照してください。

#### 2020年7月

* 重複した便に対応しました。[ディスカッション](https://github.com/google/transit/pull/221)を参照してください。
* アラート tts_header_text、tts_description_text は試験運用ではなくなりました。 [ディスカッション](https://github.com/google/transit/pull/229)を参照してください。
* GTFS-RT ADDED の便を、完全に指定されていないものとしてラベル付けします。[ディスカッション](https://github.com/google/transit/pull/230)を参照してください。

#### 2020年4月

* SeverityLevel をfinal としてマークします。[ディスカッション](https://github.com/google/transit/pull/214)を参照してください。
* occupancy_percentage を追加します。[ディスカッション](https://github.com/google/transit/pull/213)を参照してください。

#### 2020年3月12日

* ブロック内の次の便についてTripUpdate予測を提供することを推奨します。 [ディスカッション](https://github.com/google/transit/pull/206)を参照してください。

#### 2019年8月

* trip_updates はフィード内でブロック順に発生する必要がないことを文書化します。[ディスカッション](https://github.com/google/transit/pull/176)を参照してください。
* StopTimeUpdate.ScheduleRelationship UNSCHEDULED 値を追加します。[ディスカッション](https://github.com/google/transit/pull/173)を参照してください。

#### 2019年してもよい

*アクセシビリティの問題アラート効果を追加します。[ディスカッション](https://github.com/google/transit/pull/164)を参照してください。

#### 2019年2月

* GTFS realtime サービス アラートに NO_EFFECT 効果オプションを追加します。 [ディスカッション](https://github.com/google/transit/pull/137)を参照してください。
* Service Alerts フィードに新しい任意フィールド SeverityLevel を追加します。[ディスカッション](https://github.com/google/transit/pull/136)を参照してください。
* Service Alerts フィードにテキスト読み上げ機能用の新しい任意フィールドを追加します。[ディスカッション](https://github.com/google/transit/pull/135)を参照してください。

#### 2018年4月

* SCHEDULED便の stop_time_update 到着と出発の要件を削除します。[ディスカッション](https: ://github.com/google/transit/pull/165)を参照してください。

#### 2017年8月

* GTFS realtime フィールドのセマンティック カーディナリティを定義します。 [ディスカッション](https://github.com/google/transit/pull/64)を参照してください。

#### 2015年1月30日

* プロトコル バッファ拡張名前空間を、まだ名前空間がない残りのすべての GTFS realtime メッセージ (`FeedMessage`や`FeedEntity`など)に追加しました。

#### 2015年1月28日

* `TripUpdate`に試験的なフィールド`delay`を追加しました ([ディスカッション](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8))。

#### 2015年1月16日

* `TripDescriptor.start_time`の説明を更新しました。

#### 2015年1月8日

* 実験的な列挙型 `OccupancyStatus` を定義しました。
* 実験的なフィールド `occupancy_status` を `VehiclePosition` に追加しました ([ディスカッション](https://groups.google.com/forum/#!topic/gtfs-realtime/_HtNTGp5LxM))。

#### 2014年してもよい22日

* `StopTimeUpdate` メッセージ内の `ScheduleRelationship` 列挙型の説明を更新しました ([ディスカッション](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI))。
* `TripDescriptor` メッセージ内の `ScheduleRelationship` 列挙型の値から REPLACEMENT を削除しました ([ディスカッション](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI))。

#### 2014年10月12日2012

* `TripUpdate`プ` フィールドを追加しました。

#### 2012年5してもよい30日

* 仕様に拡張機能に関する具体的な詳細を追加しました。

#### 2011年11月30日

* 仕様の拡張機能の記述を容易にするため、主要な GTFS realtime メッセージに Protocol Buffer 拡張名前空間を追加しました。

#### 2011年10月25日

* `alert`、`header_text`、`description_text` はどちらもプレーンテキスト値であることを明確にするためにドキュメントを更新しました。

#### 2011年8月20日

* `TimeRange` メッセージのセマンティクスを明確にするためにドキュメントを更新しました。

#### 2011年8月22日

* 初期バージョン。