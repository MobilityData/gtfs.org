# 旅行の変更`TripModifications`messageは、迂回などの特定の変更の影響を受ける (CSV) GTFS からの類似の`trip_ids`のリストを識別します。

<br><br> **注意:**このエンティティはまだ**実験的**であり、変更される可能性があります。将来正式に採用される可能性があります。

## SLO: サービス レベル目標

データ更新の頻度は、約 1 時間ごと (1 日あたり約 24 回) になると予想されます。取り込み時間は、影響を受ける旅行の合計数によって異なる場合があります。コンシューマーは、1 つの TripModification を 5 分以内に、数百の迂回を含むフィードを 20 分以内に取り込むことが期待されます。

## TripModifications `TripModifications` は、フィードから削除されるまで、リストされているすべての service\_dates で有効です。特定のサービスdateでは、旅行を複数の`TripModifications`オブジェクトに割り当てるしてはいけない。

特定の停車パターンには、複数の`TripModifications` が存在するしてもよいます。迂回中に `propagated_modification_delay` が大幅に変更される場合など、旅程を複数の変更に分割することが望ましい場合があります。

GTFS- TripModificationsを通じて作成された旅程は、指定された各`trip_id`を変更して置き換え、コピーや追加の運行は作成しません。変更は、静的な GTFS (CSV) が変更された場合と同様に、スケジュール情報に適用されます。

各代替旅程の予定停車時刻は、変更にリストされている変更を実行することで、影響を受ける旅程の予定停車時刻から作成されます。すべての停車時刻の`stop_sequence` は、最初の stop_time の 1 から始まり、旅程内の停車ごとに 1 ずつ増加する、 1 ～ nの新しい値に置き換えられます。代替旅程のリアルタイムの到着/出発時刻を公開するには、 `TripUpdate`messageを提供する必要があります。


## TripUpdates へのリンク

* TripUpdateは、TripUpdate の`TripDescriptor`内の `ModifiedTripSelector` を使用して提供するするべきである。
    * TripUpdateが代替旅程を参照する場合、コンシューマーは、静的 GTFS がTripModifications (代替停車地の`arrival_time`、 `departure_time`、 `stop_sequence`、 `stop_id`など) で変更されたかのように動作する必要があります。
    * `ModifiedTripSelector` を提供する場合、 `TripDescriptor`の他のフィールドは空のままにして、`ModifiedTripSelector` 値を探していないコンシューマーによる混乱を避けるしなければならない。 
    * `ModifiedTripSelector` で更新情報を提供するTripUpdateフィードには、 TripModificationsをサポートしていないクライアントを対象とするTripUpdateも含めるするべきである。つまり、2 つの TripUpdate が必要です。1 つは変更された旅程を持つクライアント用 ( `TripModifications`あり)、もう 1 つは元の変更されていない GTFS を持つクライアント用 ( `TripModifications`なし) です。
    * `ModifiedTripSelector` でTripUpdateを提供することが、代替の停車地で予測を作成する唯一の方法です。
* このようなTripUpdateが見つからない場合は、元の`trip_id`の` TripUpdate が変更された旅程に適用されます。
    * この場合、使用される静的 GTFS 情報は、 TripModificationsが適用される前の静的 GTFS からのものである必要があります。
    * 前の旅程と新しい変更された旅程の共通の停車地では、リアルタイムの情報を利用できます。ただし、代替の停車地では到着予定時刻は利用できません。

##Modification

`Modification`messageは、`start_stop_selector` から始まる、影響を受ける各旅行への変更を説明します。`Modification` によって置き換えられる停車時間は、0、1、または 1 個以上である可能性があります。変更の範囲は重複してはなりません。範囲は連続していてはしなければならないません。この場合、2 つの変更は 1 つにマージされるしなければならない。これらの停車時刻は、 `replacement_stops` によって記述される代替の停車地ごとに新しい停車時間に置き換えられます。

`replacement_stops` のシーケンスは任意の長さにすることができます。たとえば、状況に応じて、3 つの停車地を 2 つ、4 つ、または 0 つの停車地に置き換えることができます。

![](/../assets/trip_modification.png)

特定の旅行に対する変更の効果を示す例。この変更は、他の複数の旅行にも適用される場合があります。_

![](/../assets/propagated_delay.png)

伝播された迂回遅延は、変更の終了後にすべての停車地に影響します。旅行に複数の変更がある場合、遅延は累積されます。_

## ReplacementStop 

各`ReplacementStop``ReplacementStop`は、旅行で訪問する停車地を定義し、オプションで停車地までの推定移動時間を指定します。`ReplacementStop`messageは、停車地のスケジュールされた`stop_time`を作成するために使用されます。

`travel_time_to_stop` が指定されている場合、 `arrival_time`は元の旅行の参照停車地から計算され、`travel_time_to_stop` のオフセットが加算されます。それ以外の場合は、元の旅程の変更の合計所要時間に基づいて`arrival_time`を補間できます。

`departure_time`は常に`arrival_time`と同じです。

(CSV) GTFS 仕様の [`stop_times.txt`](../../../schedule/reference/#stop_timestxt) のオプション フィールドはすべてデフォルト値に設定されています。

![](/../assets/first_stop_reference.png)

変更が旅程の最初の停車地に影響する場合、その停車地は変更の参照停車地としても機能します。_
