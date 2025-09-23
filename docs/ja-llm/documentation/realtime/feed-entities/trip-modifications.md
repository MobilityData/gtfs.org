# 便の変更(trip modification) {: #trip-modifications}


`TripModifications` メッセージは、(CSV) GTFS 内の類似した `trip_ids` の一覧を特定し、それらが迂回などの特定の変更によってすべて影響を受けることを示します。

<br><br>**注意:** このエンティティはまだ **実験的** なものであり、変更される可能性があります。将来的に正式に採用される可能性があります。

## SLO: サービスレベル目標 {: #slo-service-level-objective}

データ更新の頻度はおおよそ1時間ごと（1日あたり約24回）であることが期待されています。取り込み時間は影響を受ける便(trip)の総数に依存する可能性があります。利用者は、1つの便の変更(trip modification)を5分以内に取り込み、数百件の迂回情報を含むフィードを20分以内に取り込むことが期待されています。

## TripModifications {: #tripmodifications}

`TripModifications` は、リストされたすべての service_date に対して有効であり、フィードから削除されるまで適用されます。任意の service date において、1つの便(trip)が複数の `TripModifications` オブジェクトに割り当てられてはいけません。

特定の停留所等(stop)パターンに対して、複数の `TripModifications` が存在することがあります。例えば、迂回の過程で `propagated_modification_delay` が大きく変化する場合、便を複数の変更に分割することが望ましい場合があります。

GTFS-TripModifications を通じて作成された便は、指定された各 `trip_id` を変更・置換し、コピーや追加の運行を作成するものではありません。変更は、静的な GTFS (CSV) が修正されたかのように、スケジュール情報に適用されます。

各代替便の予定停車時刻(stop_time)は、影響を受ける便の停車時刻を基に、変更で指定された内容を適用して作成されます。すべての停車時刻(stop_time)の `stop_sequence` は、新しい値に置き換えられ、最初の停車時刻を 1 とし、便内の各停留所等(stop)ごとに 1 ずつ増加します。代替便の実際の到着・出発時刻を公開するために、`TripUpdate` メッセージを提供しなければなりません。

## TripUpdates との連携 {: #linkage-to-tripupdates}


* TripUpdate は、TripUpdate の `TripDescriptor` 内で `ModifiedTripSelector` を使用して提供するべきです。  
    * TripUpdate が代替便を参照する場合、利用者は静的 GTFS が TripModifications によって変更されたかのように扱うべきです（例: 代替停留所における `arrival_time`、`departure_time`、`stop_sequence`、`stop_id`）。  
    * `ModifiedTripSelector` を提供する場合、`TripDescriptor` の `trip_id`、`route_id`、`direction_id`、`start_time`、`start_date` フィールドは空にしなければなりません。これは、`ModifiedTripSelector` の値を参照しない利用者に混乱を与えないためです。  
    * `ModifiedTripSelector` を用いた更新を提供する TripUpdate フィードは、TripModifications をサポートしないクライアント向けの TripUpdate も含めるべきです。言い換えると、TripUpdate は 2 つ存在するべきです：修正された便（`TripModifications` を含む）向けのものと、元の未修正の GTFS（`TripModifications` を含まない）向けのものです。  
    * `ModifiedTripSelector` を含む TripUpdate を提供することは、代替停留所における予測を作成する唯一の方法です。  
* そのような TripUpdate が見つからない場合、元の `trip_id` に対する TripUpdates が修正後の便に適用されます。  
    * この場合、使用される静的 GTFS 情報は、TripModifications が適用される前の静的 GTFS からのものでなければなりません。  
    * リアルタイム情報は、以前の便と新しい修正後の便の共通停留所に対しては利用可能ですが、代替停留所における到着予測（ETA）は利用できません。  

## Modification {: #modification}

`Modification` メッセージは、`start_stop_selector` から始まる各影響を受ける便(trip)に対する変更を記述します。`Modification` によって置き換えられる停車時刻(stop_time)は、0個、1個、または複数個存在することがあります。変更の区間は重複してはいけません。区間は連続していない場合もあり、その場合は2つの変更を1つに統合しなければなりません。これらの停車時刻(stop_time)は、`replacement_stops` で記述された各置換停留所(stop)に対応する新しい停車時刻(stop_time)に置き換えられます。

`replacement_stops` の並びは任意の長さにすることができます。例えば、3つの停留所(stop)を、状況に応じて2つ、4つ、または0に置き換えることができます。

![](/../assets/trip-modification.png)

_特定の便(trip)に対する変更の効果を示す例。この変更は他の複数の便(trip)にも適用される可能性があります。_

![](/../assets/propagated-delay.png)

_迂回による遅延は、変更の終了以降のすべての停留所(stop)に影響します。便(trip)に複数の変更がある場合、遅延は累積されます。_

## ReplacementStop {: #replacementstop}

各 `ReplacementStop` メッセージは、便(trip)が新たに停車する停留所等(stop)を定義し、任意でその停留所等(stop)までの推定所要時間を指定します。`ReplacementStop` メッセージは、その停留所等(stop)の予定された `stop_time` を構築するために使用されます。

`travel_time_to_stop` が指定されている場合、`arrival_time` は元の便(trip)における基準となる停留所等(stop)からの時刻に、`travel_time_to_stop` のオフセットを加えて計算されます。指定されていない場合、`arrival_time` は元の便(trip)における変更全体の所要時間に基づいて補間されます。

`departure_time` は常に `arrival_time` と同じになります。

(CSV) GTFS 仕様における [`stop_times.txt`](../../../schedule/reference/#stop_timestxt) の任意フィールドは、すべてデフォルト値に設定されます。

![](/../assets/first-stop-reference.png)

_便(trip)の最初の停留所等(stop)に変更が影響する場合、その停留所等(stop)は変更の基準停留所等(stop)としても使用されます。_
