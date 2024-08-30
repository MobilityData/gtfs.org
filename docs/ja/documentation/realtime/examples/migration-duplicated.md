## 移行ガイド - ADDED から DUPLICATED の旅行への移行 

GTFS リアルタイムの `trip.schedule_relationship` の`DUPLICATED`は、サービス開始dateを除いて既存のスケジュールされた旅行と同じ新しい旅行を表します。

この移行ガイドでは、重複した旅行を表すために`ADDED`列挙を使用していた既存のプロデューサーとコンシューマーが`DUPLICATED`列挙に移行する方法を定義します。目標は、移行中にプロデューサーとコンシューマーの混乱を最小限に抑えることです。 

*重複した旅行を記述するために`ADDED`列挙を **使用していない** プロデューサーまたはコンシューマーの場合、アクションは必要ありません。`ADDED` エンティティを生成/消費することなく、 `ADDED` `DUPLICATED`旅行を生成/消費できます。* 

`DUPLICATED` 列挙の完全な履歴については、[GitHub の`DUPLICATED` `DUPLICATED`提案](https://github.com/google/transit/pull/221) を参照してください。

### 同じフィードでの ADDED エンティティと DUPLICATED エンティティの使用

#### プロデューサー

重複した旅行に`ADDED`列挙を使用しているプロデューサーの場合、既存のコンシューマーの混乱を避けるため、これらの旅行に対して`ADDED`エンティティを生成し続けながら、同じ旅行に対して`DUPLICATED`エンティティも追加することをおすすめします。 

ただし、ユーザーが誤って同じ旅行を 2 回追加するのを防ぐために、同じ旅行を参照するエンティティは同じ`trip_id`を使用してリンクされている必要があります。2 つのエンティティは、次の 2 つの方法のいずれかでリンクできます。

 1.両方のエンティティの `trip.trip_id` が同じである必要があります。または
 2. `ADDED`旅行の `trip.trip_id ` は、 `DUPLICATED`旅行の `trip_properties.trip_id` と同じである必要があります。
 
以下は、GTFS `d` 1` を `trip.trip_id ` で複製する最初のオプション (1) の例です。 `ADDED`および`DUPLICATED`エンティティのtrip_id ` の一致:

~~~
entity {
 id: "ei0"
 trip_update {
    trip: {
       trip_id: "1"//&lt;-- 静的 GTFS からのtrip_idをコピー
      schedule_relationship: ADDED
      start_date: "20200821"//&lt;-- 新しい旅行date
      start_time: "11:30:00"//&lt;-- 新しい旅行時刻
    }
    stop_time_update {
...
    }
 }
}

entity {
 id: "ei10"
 trip_update {
    trip: {
       trip_id: "1"//&lt;-- 静的 GTFS からのtrip_idをコピー
      schedule_relationship: DUPLICATED
    }
    trip_properties {
       trip_id: "NewTripId987"//&lt;-- この旅行に固有の新しいtrip_id : "20200821"//&lt;-- 新しい旅行date
      start_time: "11:30:00"//&lt;-- 新しい旅行時刻
    }
    stop_time_update {
...
    }
 }
}
~~~

以下は、GTFS `d` 1` を複製する 2 番目のオプション (2) の例です。`ADDED` 旅行の `trip.trip_idは、 `ADDED` `DUPLICATED`旅行の `s`. と一致します。 trip_id`:

~~~
entity {
 id: "ei0"
 trip_update {
    trip: {
       trip_id: "NewTripId987"//&lt;-- このtrip_idに固有の新しい trip_id
      schedule_relationship: ADDED
      start_date: "20200821"//&lt;-- 新しい旅行date
      start_time: "11:30:00"//&lt;-- 新しい旅行時刻
    }
    stop_time_update {
...
    }
 }
}

entity {
 id: "ei10"
 trip_update {
    trip: {
       trip_id: "1"//&lt;-- コピーする静的 GTFS のtrip_id : DUPLICATED
    }
    trip_properties {
       trip_id: "NewTripId987"//&lt;-- ADDED の旅行と一致します。 trip_id 
      start_date: "20200821"//&lt;-- 新しい旅行date
      start_time: "11:30:00"//&lt;-- 新しい旅行時刻
    }
    stop_time_update {
...
    }
 }
}
~~~

重複した旅行に対する`ADDED`の使用は設定された期限までに廃止されるため、代わりに`DUPLICATED` の旅行を使用するように既存の消費者に通知することをお勧めします (開発者のメーリング リストなどを通じて) `ADDED`と`DUPLICATED`の旅行エンティティを一致させるために使用されている上記の戦略についても言及し、この移行ガイドへのリンクを含める必要があります。期限が過ぎると、フィードから`ADDED` `ADDED`エンティティを削除し、重複した旅行の`DUPLICATED`エンティティのみを公開できます。

#### コンシューマー

前述のように、プロデューサーは、エンティティ間の ID を一致させるために上記の 2 つのオプションのいずれかを使用して、最初に各重複旅行の 2 つのエンティティを公開することにより、 `ADDED`列挙から ` `DUPLICATED`列挙に移行します。
 
したがって、コンシューマーが`DUPLICATED`旅行のサポートを実装する場合、コンシューマーが次の点に注意することが重要です。

 1. `DUPLICATED`旅行 `trip.trip_id ` 
 1. `DUPLICATED`旅行 `trip_properties.trip_id `を持つ`ADDED`旅行を無視します。