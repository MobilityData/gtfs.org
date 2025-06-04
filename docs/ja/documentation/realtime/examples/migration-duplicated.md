## 移行ガイド - ADDED から NEW または DUPLICATED の便への移行 

GTFS リアルタイムの `trip.schedule_relationship` が `NEW` の場合、既存の定期旅程とは無関係のスケジュールで運行される新しい旅程を表します。

GTFS リアルタイムの `trip.schedule_relationship` の `DUPLICATED` は、サービス開始日時を除いて既存のスケジュールされた便と同じ新しい便を表します。

この移行ガイドでは、 `ADDED`列挙を使用していた既存のプロデューサーとコンシューマーが、`NEW` または`DUPLICATED`列挙に移行するべきである方法を定義します。移行中のプロデューサーとコンシューマーの混乱を最小限に抑えることが目標です。 

* `ADDED` `ADDED`列挙型を**使用していない**プロデューサーまたはコンシューマーの場合、何もする必須はありません。`ADDED` エンティティを生成/消費することなく、`NEW` または`DUPLICATED` の便を生成/消費できます。* 

`NEW` 列挙型の完全な履歴については、[GitHub の `NEW` および `REPLACEMENT` 提案](https://github.com/google/transit/pull/504) をご覧ください。

`DUPLICATED` 列挙の完全な履歴については、[GitHub の `DUPLICATED` 提案](https://github.com/google/transit/pull/221) をご覧ください。

### どちらに移行するか

`NEW`列挙型と`DUPLICATED`列挙型はどちらも、元々 GTFS 静的に実行がスケジュールされていなかった旅行を指定するために使用されます。

`NEW` を使用する予定されて便をテンプレートとして使用して旅行を説明できない場合。たとえば、ルートの通常の便とは異なる停留所に寄る場合や、通常の便ではすべての停留所で乗車と降車の両方が許可されているのに、追加の旅行ではルートの開始時にのみ乗車する場合などです。

旅行がスケジュール済みの旅行のコピーである場合は、 `DUPLICATED` を使用します。このコピーは、元のスケジュール済みの旅行と同じ時間、または異なる時間に実行されるしてもよい。

### 同じフィードで ADDED エンティティと NEW エンティティを使用する

スケジュールに関係のない旅行を指定するために `ADDED` 列挙を使用しているプロデューサーの場合は、既存のコンシューマーの混乱を避けるために、これらの旅行に対して `ADDED` エンティティを引き続き生成し、同じ旅行に対して `NEW` エンティティも追加することをお勧めします。

ただし、コンシューマーが誤って同じ旅行を 2 回追加するのを防ぐために、同じ旅行を参照するエンティティは、同じ`trip_id`、 `route_id` 、および`start_date`を使用してリンクされているしなければならない。
さらに、コンテンツ`stop_time_update`も同じであるしなければならない。

#### プロデューサー

~~~
entity {
 ID: "ei0"
 trip_update {
    trip: {
       trip_id: "1"//&lt;-- 静的 GTFS に見つからないtrip_id route_id: "A"
      schedule_relationship: ADDED
      start_date: "20200821"//&lt;-- 新しい旅行date
      start_time: "11:30:00"//&lt;-- 新しい旅行時刻
    }
    stop_time_update {
...//旅行の停車地点の完全なリスト
    }
 }
}

entity {
 ID: "ei10"
 trip_update {
    trip: {
       trip_id: "1"//&lt;-- 上記と同じtrip_id route_id: "A"//&lt;-- 上記と同じroute_id : NEW
      start_date: "20200821"//&lt;-- 上記と同じdate
      start_time: "11:30:00"//&lt;-- 上記と同じ時刻
    }
    stop_time_update {
...//&lt;-- 上記と同じコンテンツ
    }
 }
}
~~~

既存のコンシューマーに対して、設定された期限までに`ADDED`の使用が廃止され、代わりに `NEW`便の使用を開始するするべきであることを通知することをお勧めします (開発者メーリング リストなど経由)。`ADDED`と`NEW` 旅行エンティティを一致させるために使用されている上記の戦略についても言及するべきである、この移行ガイドへのリンクを含めるするべきである。期限が過ぎると、フィードから `ADDED` エンティティを削除し、新しく追加された便の `NEW` エンティティのみを公開できます。

#### コンシューマー

前述のように、プロデューサーは、最初に同じ`trip_id`に` 2 つのエンティティを公開することにより、 `ADDED`列挙から `NEW` 列挙に移行します。

したがって、コンシューマーが `NEW`便のサポートを実装する場合、コンシューマーが `NEW` 旅行の`trip_id`を持つ`trip_id` `ADDED`便を無視することが重要です。


### 同じフィードでの ADDED エンティティと DUPLICATED エンティティの使用

#### プロデューサー

重複した便に`ADDED`列挙を使用しているプロデューサーの場合、既存のコンシューマーの混乱を避けるため、これらの便に対して`ADDED`エンティティを生成し続けながら、同じ便に対して`DUPLICATED`エンティティも追加することを推奨。 

ただし、ユーザーが誤って同じ便を 2 回追加するのを防ぐために、同じ便を参照するエンティティは同じ`trip_id` を使用してリンクされているしなければならない。2 つのエンティティは、次の 2 つの方法のいずれかでリンクできます。

1. 両方のエンティティの `trip.trip_id` は同じである必要があります。または
2. `ADDED` 便の `trip.trip_id` は `DUPLICATED` 便の `trip_properties.trip_id` と同じである必要があります。

以下は、GTFS ` trip_id 1` を `trip.trip_id` を使用して複製する最初のオプション (1) の例です。 `ADDED`および`DUPLICATED`エンティティの`trip_id`の一致:

~~~
entity {
  id: "ei0"
  trip_update {
    trip: {
      trip_id: "1" // <-- trip_id from static GTFS to copy
      schedule_relationship: ADDED
      start_date: "20200821" // <-- New trip date
      start_time: "11:30:00" // <-- New trip time
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
      trip_id: "1" // <-- trip_id from static GTFS to copy
      schedule_relationship: DUPLICATED
    }
    trip_properties {
      trip_id: "NewTripId987" // <-- New trip_id unique to this trip
      start_date: "20200821"  // <-- New trip date
      start_time: "11:30:00"  // <-- New trip time
    }
    stop_time_update {
	...
    }
  }
}
~~~

以下は、GTFS `trip_id 1` を複製する 2 番目のオプション (2) の例です。`ADDED` 旅程の `trip.trip_id` が `DUPLICATED` 旅程の `trip_properties.trip_id` と一致します。

~~~
entity {
  id: "ei0"
  trip_update {
    trip: {
      trip_id: "NewTripId987" // <-- New trip_id unique to this trip
      schedule_relationship: ADDED
      start_date: "20200821" // <-- New trip date
      start_time: "11:30:00" // <-- New trip time
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
      trip_id: "1" // <-- trip_id from static GTFS to copy
      schedule_relationship: DUPLICATED
    }
    trip_properties {
      trip_id: "NewTripId987" // <-- Matches the ADDED trip.trip_id
      start_date: "20200821"  // <-- New trip date
      start_time: "11:30:00"  // <-- New trip time
    }
    stop_time_update {
	...
    }
  }
}
~~~

既存のコンシューマー（開発者メーリングリストなど）に、 `ADDED`の使用は期限までに廃止され、代わりに`ADDED` `DUPLICATED` の便を使用するするべきであることを通知することをお勧めします。`ADDED` と ` `DUPLICATED` の旅行エンティティを一致させるために使用されている上記の戦略についても言及するべきである、この移行ガイドへのリンクを含めるするべきである。期限が過ぎると、フィードから`ADDED`エンティティを削除し、重複した便の`DUPLICATED`エンティティのみを公開できます。

#### コンシューマー

前述のように、プロデューサーは、エンティティ間の ID を一致させるために上記の 2 つのオプションのいずれかを使用して、最初に重複した便ごとに 2 つのエンティティを公開することで、`ADDED` 列挙から `DUPLICATED` 列挙に移行します。

したがって、コンシューマーが `DUPLICATED` 便のサポートを実装する場合、コンシューマーが次の点に注意することが重要です:

1. `DUPLICATED` 便 `trip.trip_id` と同じ `trip.trip_id` を持つ `ADDED` 便を無視する

1. `DUPLICATED` 便 `trip_properties.trip_id` と同じ `trip.trip_id` を持つ `ADDED` 便を無視する