## 移行ガイド - ADDED から NEW または DUPLICATED 便(trip)への移行 {: #migration-guide-transition-from-added-to-new-or-duplicated-trips}

GTFS-realtime の `trip.schedule_relationship` における `NEW` は、既存のスケジュールされた便(trip)とは無関係に運行される新しい便(trip)を表します。

GTFS-realtime の `trip.schedule_relationship` における `DUPLICATED` は、運行開始日と時刻を除いて既存のスケジュールされた便(trip)と同一の新しい便(trip)を表します。

この移行ガイドでは、`ADDED` 列挙型を使用していた既存のプロデューサーおよびコンシューマーが、`NEW` または `DUPLICATED` 列挙型へどのように移行すべきかを定義します。目的は、移行中にプロデューサーおよびコンシューマーへの影響を最小限に抑えることです。

*もしあなたがプロデューサーまたはコンシューマーであり、これまでに `ADDED` 列挙型を使用していない場合、対応は不要です。`ADDED` エンティティを生成/消費することなく、`NEW` および/または `DUPLICATED` 便(trip)を生成/消費することができます。*

`NEW` 列挙型の完全な履歴については、[GitHub 上の `NEW` および `REPLACEMENT` 提案](https://github.com/google/transit/pull/504)を参照してください。

`DUPLICATED` 列挙型の完全な履歴については、[GitHub 上の `DUPLICATED` 提案](https://github.com/google/transit/pull/221)を参照してください。

### どちらに移行すべきか {: #which-one-to-migrate-to}

`NEW` と `DUPLICATED` の両方の列挙型は、GTFS 静的データにおいて元々運行予定ではなかった便(trip)を指定するために使用されます。

便(trip)が既存の運行予定便をテンプレートとして表現できない場合は `NEW` を使用してください。例えば、その便が通常のルート・路線系統(route)の便とは異なる停留所等(stop)に停車する場合や、通常の便ではすべての停留所等(stop)で乗降可能であるにもかかわらず、追加便がルートの始点でのみ乗車可能な場合などです。

便(trip)が運行予定便のコピーであり、元の運行予定便と同じ時刻、または異なる時刻に運行される場合は `DUPLICATED` を使用してください。

### 同じフィード内での ADDED と NEW エンティティの使用 {: #using-added-and-new-entities-in-the-same-feed}

もし、スケジュールに関連しない便(trip)を指定するために `ADDED` 列挙型を使用している事業者である場合、既存の利用者への影響を避けるために、これらの便に対して引き続き `ADDED` エンティティを生成することが推奨されますが、同じ便に対して `NEW` エンティティも追加するべきです。

ただし、利用者が誤って同じ便を二重に追加してしまうのを防ぐために、同じ便を参照するエンティティは、同じ `trip_id`、`route_id`、および `start_date` を使用してリンクしなければなりません。  
さらに、`stop_time_update` の内容も同一でなければなりません。

#### プロデューサー {: #producers}


~~~
entity {
  id: "ei0"
  trip_update {
    trip: {
      trip_id: "1" // <-- 静的GTFSに存在しないtrip_id
      route_id: "A"
      schedule_relationship: ADDED
      start_date: "20200821" // <-- 新しい便の日付
      start_time: "11:30:00" // <-- 新しい便の時刻
    }
    stop_time_update {
	... // 便の全ての停車箇所のリスト
    }
  }
}

entity {
  id: "ei10"
  trip_update {
    trip: {
      trip_id: "1" // <-- 上記と同じtrip_id
      route_id: "A" // <-- 上記と同じroute_id
      schedule_relationship: NEW
      start_date: "20200821" // <-- 上記と同じ日付
      start_time: "11:30:00" // <-- 上記と同じ時刻
    }
    stop_time_update {
	... // <-- 上記と同じ内容
    }
  }
}
~~~

既存のコンシューマー（例: 開発者向けメーリングリスト経由）に対して、`ADDED` の使用が期限をもって廃止されることを通知し、コンシューマーは代わりに `NEW` の便を利用し始めるべきであることを伝えることが推奨されます。上記のように `ADDED` と `NEW` の便エンティティを対応付ける戦略についても言及し、この移行ガイドへのリンクを含めるべきです。期限が過ぎた後は、フィードから `ADDED` エンティティを削除し、新しく追加された便については `NEW` エンティティのみを公開することができます。

#### 消費者 {: #consumers}

前述のとおり、プロデューサーは新しい便(trip)ごとに同じ `trip_id` を使用して、最初に2つのエンティティを公開することで、`ADDED` から `NEW` の列挙型に移行します。

したがって、消費者が `NEW` 便(trip)のサポートを実装する際には、`NEW` 便(trip)の `trip_id` と同じ `trip_id` を持つ `ADDED` 便(trip)を無視することが重要です。

### 同一フィード内での ADDED および DUPLICATED エンティティの使用 {: #using-added-and-duplicated-entities-in-same-feed}

#### プロデューサー {: #producers}


もし、重複した便(trip)に対して `ADDED` 列挙型を使用しているプロデューサーである場合、既存のコンシューマーへの影響を避けるために、これらの便に対して引き続き `ADDED` エンティティを生成することが推奨されますが、同じ便に対して `DUPLICATED` エンティティも追加してください。  

ただし、コンシューマーが誤って同じ便を2回追加してしまうのを防ぐために、同じ便を参照するエンティティは、同じ `trip_id` を使用してリンクしなければなりません。2つのエンティティをリンクする方法は、次の2通りのうち **1つ** です:  

 1. 両方のエンティティの `trip.trip_id` が同じでなければなりません、または  
 2. `ADDED` 便の `trip.trip_id` が `DUPLICATED` 便の `trip_properties.trip_id` と同じでなければなりません。
 
以下は、最初の方法 (1) の例です。GTFS の `trip_id 1` を複製し、`ADDED` エンティティと `DUPLICATED` エンティティの `trip.trip_id` が一致しています:

~~~
entity {
  id: "ei0"
  trip_update {
    trip: {
      trip_id: "1" // <-- コピー元の静的GTFSのtrip_id
      schedule_relationship: ADDED
      start_date: "20200821" // <-- 新しい便の日付
      start_time: "11:30:00" // <-- 新しい便の時刻
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
      trip_id: "1" // <-- コピー元の静的GTFSのtrip_id
      schedule_relationship: DUPLICATED
    }
    trip_properties {
      trip_id: "NewTripId987" // <-- この便に固有の新しいtrip_id
      start_date: "20200821"  // <-- 新しい便の日付
      start_time: "11:30:00"  // <-- 新しい便の時刻
    }
    stop_time_update {
	...
    }
  }
}
~~~

以下は、2つ目の方法 (2) の例です。GTFS の `trip_id 1` を複製し、`ADDED` 便の `trip.trip_id` が `DUPLICATED` 便の `trip_properties.trip_id` と一致しています:

~~~
entity {
  id: "ei0"
  trip_update {
    trip: {
      trip_id: "NewTripId987" // <-- この便に固有の新しいtrip_id
      schedule_relationship: ADDED
      start_date: "20200821" // <-- 新しい便の日付
      start_time: "11:30:00" // <-- 新しい便の時刻
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
      trip_id: "1" // <-- コピー元の静的GTFSのtrip_id
      schedule_relationship: DUPLICATED
    }
    trip_properties {
      trip_id: "NewTripId987" // <-- ADDED trip.trip_id と一致
      start_date: "20200821"  // <-- 新しい便の日付
      start_time: "11:30:00"  // <-- 新しい便の時刻
    }
    stop_time_update {
	...
    }
  }
}
~~~

既存のコンシューマーに対して（例: 開発者向けメーリングリストを通じて）、`ADDED` の使用が特定の期限をもって廃止されること、そしてコンシューマーは代わりに `DUPLICATED` 便を利用し始めるべきであることを通知することが推奨されます。上記の `ADDED` と `DUPLICATED` 便エンティティを対応付ける戦略についても言及し、この移行ガイドへのリンクを含めるべきです。期限が過ぎた後は、フィードから `ADDED` エンティティを削除し、重複便に対しては `DUPLICATED` エンティティのみを公開することができます。

#### コンシューマー {: #consumers}

前述の通り、プロデューサーは重複した便(trip)ごとに2つのエンティティを公開し、エンティティ間のIDを一致させるために上記の2つのオプションのいずれかを使用することで、`ADDED` から `DUPLICATED` の列挙型へ移行します。

したがって、コンシューマーが `DUPLICATED` 便(trip)のサポートを実装する際には、以下が重要です:

1. `DUPLICATED` 便(trip)の `trip.trip_id` と同じ `trip.trip_id` を持つ `ADDED` 便(trip)を無視すること  
1. `DUPLICATED` 便(trip)の `trip_properties.trip_id` と同じ `trip.trip_id` を持つ `ADDED` 便(trip)を無視すること
