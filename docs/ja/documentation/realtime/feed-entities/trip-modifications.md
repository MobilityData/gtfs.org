# 便の変更

`TripModifications` メッセージは、迂回などの特定の変更の影響を受ける、(CSV) GTFS からの類似の `trip_ids` のリストを識別します。

**注意:**このエンティティはまだ**実験的**であり、変更される可能性があります。将来正式に採用されるしてもよいがあります。

## SLO: Service-level objective (サービスレベル目標)

データ更新の頻度は、約 1 時間ごと(1 日あたり約24回)になると予想されます。取り込み時間は、影響を受ける便の総数によって異なります。消費者は、1つの TripModification を5分以内に、数百の迂回を含むフィードを20分以内に取り込むことが予想されます。

## TripModifications

`TripModifications` は、フィードから削除されるまで、リストされているすべての service\_dates で有効です。特定のサービス日付では、1 つの便を複数の `TripModifications` オブジェクトに割り当てることはできません。

特定の停車パターンに対して複数の `TripModifications` が存在する場合があります。たとえば、迂回中に `propagated_modification_delay` が大幅に変更された場合など、便を複数の変更に分割することが望ましい場合があります。

GTFS-TripModifications を通じて作成された便は、指定された各 `trip_id` を変更して置き換えますが、コピーや追加の実行は作成しません。変更は、静的 GTFS (CSV) が変更された場合のように、スケジュール情報に適用されます。

各代替便の予定停車時刻は、変更にリストされている変更を実行することで、影響を受ける便の予定停車時刻から作成されます。すべての停車時刻の `stop_sequence` は、1 から n までの新しい値に置き換えられます。最初の stop_time で 1 から始まり、旅程内の各停車ごとに 1 ずつ増加します。置き換え後の旅程のリアルタイムの到着/出発時刻を公開するには、`TripUpdate` メッセージを指定する必要があります。

## Linkage to TripUpdates (TripUpdatesへのリンク)

* TripUpdate は、TripUpdate の `TripDescriptor` 内の `ModifiedTripSelector` を使用して提供する必要があります。
    * TripUpdate が代替の旅程を参照する場合、消費者は静的 GTFS が TripModifications (代替の停留所の `arrival_time`、`departure_time`、`stop_sequence`、`stop_id` など) で変更されたかのように動作する必要があります。
    * `ModifiedTripSelector` を指定する場合、`ModifiedTripSelector` 値を探していないコンシューマーによる混乱を避けるため、 `TripDescriptor`の`trip_id`、 `route_id`、` `direction_id`、` `start_time`、 `start_date`フィールドは空のままにしておく必要があります。 
    * `ModifiedTripSelector` を使用して更新を提供する TripUpdate フィードには、TripModifications をサポートしていないクライアントを対象とする TripUpdate も含める必要があります。つまり、TripUpdate は 2 つあるはずです。1 つは変更された便 (`TripModifications` あり) を持つクライアント用、もう 1 つは変更されていない元の GTFS (`TripModifications` なし) を持つクライアント用です。
    * `ModifiedTripSelector` を含む TripUpdate を提供することが、代替の停留所で予測を作成する唯一の方法です。
* そのような TripUpdate が見つからない場合、元の `trip_id` の TripUpdate が変更後の便に適用されます。
    * この場合、使用される静的 GTFS 情報は、TripModifications が適用される前の静的 GTFS からのものである必要があります。
    * 以前の便と新しい変更後の便の間の共通の停留所ではリアルタイム情報を利用できますが、代替の停留所では ETA は利用できません。

## 変更

`Modification` メッセージは、`start_stop_selector` から始まる、影響を受ける各便の変更について説明します。`Modification` によって置き換えられる停留所の時間は、0、1、または 1 個以上である可能性があります。変更の範囲は重複してはなりません。範囲は連続していてはいけません。この場合、2つの変更を1つにマージする必要があります。これらの停車時間は、`replacement_stops` で記述された各代替停車時間の新しい停車時間に置き換えられます。

`replacement_stops` のシーケンスは任意の長さにすることができます。たとえば、状況に応じて、3つの停車場所を2つ、4つ、または0つの停車場所に置き換えることができます。

![](/../assets/trip-modification.png)

_特定の便に対する変更の効果を示す例。この変更は、他の複数の便にも適用できます。_

![](/../assets/propagated-delay.png)

_伝播された迂回遅延は、変更の終了後にすべての停車場所に影響します。旅程に複数の変更がある場合、遅延は累積されます。_

## ReplacementStop

各 `ReplacementStop` メッセージは、旅程で訪問する停留所を定義し、オプションで停留所までの推定移動時間を指定します。`ReplacementStop` メッセージは、停留所の予定 `stop_time` を作成するために使用されます。

`travel_time_to_stop` が指定されている場合、`arrival_time` は元の旅程の参照停留所から計算され、`travel_time_to_stop` のオフセットが加算されます。それ以外の場合、`arrival_time` は元の旅程の変更の合計所要時間に基づいて補間できます。

`departure_time` は常に `arrival_time` と同じです。

(CSV) GTFS 仕様の [`stop_times.txt`](../../../schedule/reference/#stop_timestxt) のオプション フィールドはすべてデフォルト値に設定されています。

![](/../assets/first-stop-reference.png)

変更が便の最初の停留所に影響する場合、その停留所は変更の参照停留所としても機能します。