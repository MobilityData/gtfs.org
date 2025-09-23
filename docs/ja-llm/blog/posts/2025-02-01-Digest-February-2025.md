---
draft: false
pin: false
date:
  created: 2025-03-06
title: GTFS Digest - February 2025 - Rider Categories, Adopted!
description: This month’s update highlights the adoption of rider_categories.txt in GTFS-Fares v2, a clarification on continuous pickup/dropoff rules for demand-responsive transit currently up for a vote, and new discussions shaping the specification. The community is debating whether a null fare_media_id should act as a wildcard for transfer rules, whether the StopTimeEvent timestamp should shift from int64 to uint64, and why GTFS field names use singular forms even for multi-value relationships. 
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---
# [GTFS Digest] 2025年2月 - Rider Categories、採択！ {: #gtfs-digest-february-2025-rider-categories-adopted}


今月の更新では、GTFS-Fares v2 における rider_categories.txt の採択、現在投票中のデマンド型サービスにおける連続乗降ルールの明確化、そして仕様を形作る新たな議論について取り上げます。コミュニティでは、null の fare_media_id が乗り換えルールにおけるワイルドカードとして機能すべきかどうか、StopTimeEvent の timestamp を int64 から uint64 に変更すべきかどうか、そして GTFS のフィールド名が複数値の関係であっても単数形を使用している理由について議論が行われています。 

<!-- more -->

GTFS Digest は、[MobilityData](https://mobilitydata.org/) によって毎月発行されるリソースで、GTFS に関する最新の動向を概観するものです。  

私たちは皆さまからのフィードバックを大切にしており、今回の内容についてのご意見を伺いたいと考えています。ぜひ [このフォーム](https://forms.gle/GGefktvemnJD5Q9g8) にご記入いただき、このツールの可能性を最大限に引き出すためにご協力ください。

## 🏅 コントリビューターへの感謝 {: #contributor-shoutouts}


**Max Buchholz**  
GTFS Realtime の proto ファイルにおけるいくつかの誤字を修正する[初めての PR](https://github.com/google/transit/pull/541)を投稿してくださいました。ご貢献ありがとうございます！ 

**Felix Gündling & Scott Berkley**  
GTFS コミュニティへようこそ。GTFS Fares に関するご質問やご意見を共有していただきありがとうございます。  

**Wojciech Kulesza**  
Fares に大きな関心を寄せていただき、ワーキンググループミーティングにご参加いただきありがとうございます。  

**Jerome Le Lan & lolpro11**  
GTFS Github リポジトリに初めての issue を投稿していただきありがとうございます。皆さまのご貢献に感謝いたします！  

## 🗳️ 現在投票中 {: #currently-voting}


[**continuous pickup/dropoff の値と booking_rules.txt におけるフィールド型に関する明確化 #528**](https://github.com/google/transit/pull/528)  
このPRは、特にデマンド型サービス(DRT)向けの明確化を導入し、start_pickup_drop_off_window/end_pickup_drop_off_window が指定されている場合に continuous_pickup/continuous_drop_off に値 1 を使用できるようにします。また、booking_rules.txt 内の4つのフィールドのデータ型を正の整数に更新します。

## 🚀 最近採用されたもの {: #recently-adopted}


[**[GTFS Fares v2] rider_categories.txt の追加 #511**](https://github.com/google/transit/pull/511)  
rider_categories.txt ファイルは GTFS-Fares v2 提案の一部であり、特定の運賃の対象となる乗客カテゴリをモデル化することを目的としています。

## 📂 アクティブな提案 {: #active-proposals}


[**gtfs-realtime.proto のタイプミス修正 #541**](https://github.com/google/transit/pull/541)  
1Maxnet1 が Realtime 用の Proto ファイルにあるいくつかのタイプミスを指摘し、修正を提案しました。これはドキュメントの保守的な変更であり、マージ前に他のコミュニティメンバーによるレビューが有益となる可能性があります。 

[**GTFS Schedule と Realtime に original_trip_id を追加 #534**](https://github.com/google/transit/pull/534)  
Davider1234 は、Google Transit 拡張から `original_trip_id` を GTFS Schedule と GTFS Realtime の両方に採用することを提案しています。これにより、SIRI や NeTEx など、同様の概念を持つ他の標準との間で便(trip)をシームレスに参照できるようになります。

[**stops.stop_access フィールドの追加 #515**](https://github.com/google/transit/pull/515)  
この PR では、stops.txt に stop_access フィールドを追加し、特定の駅における停留所等(stop)へのアクセス方法を示せるようにします。詳細については [この提案](https://docs.google.com/document/d/1huTq9I6Bs38ZGtcG-7Cpns0kT1njV3PoUCjnjEE0Y1E/edit?tab=t.0#heading=h.4jjq7xol2izb) を参照してください。このフィールドの追加は、駅のモデリングを改善するための3段階計画の第1段階でもあります。

[**TripUpdate.schedule_relationship = ADDED を非推奨化し、GTFS static に存在しない便を指定するために TripUpdate.schedule_relationship = NEW / REPLACEMENT を追加 #504**](https://github.com/google/transit/pull/504)  
この PR の元の提案は投票で否決された後に変更されました。更新された提案では、GTFS Realtime における TripUpdate.schedule_relationship = ADDED を非推奨とし、GTFS Schedule に存在しない完全に新しい便を示すために TripUpdate.schedule_relationship = NEW を導入することに焦点を当てています。この新しい値は実験的としてフラグ付けされます。次回の投票前に、できるだけ多くの人々が議論に参加し、変更がコミュニティによって十分に検討されることを期待しています。

**その他のオープンな提案:**

* [停留所単位で車両の搭載可否を指定するための乗車許可の導入 #533](https://github.com/google/transit/pull/533)  
* [仕様に event_based_trips.txt を追加 #527](https://github.com/google/transit/pull/527)  
* [過去の Stop Time Events を保持するべき #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] nonconsecutive_transfer_allowed フィールドの追加と fare_transfer_type の明確化 #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set のマッチング述語 #483](https://github.com/google/transit/pull/483)  
* [CANCELED/SKIPPED TripUpdates と NO_SERVICE Alerts の明確化 #482](https://github.com/google/transit/pull/482)  
* [[GTFS-Fares v2] チケット商品/チケットメディアの乗り継ぎ挙動 #423](https://github.com/google/transit/pull/423)  

## 🔥 最も活発な議論 {: #most-active-conversations}


[**fare_media_id for fare_transfer_rules: ワイルドカードか明示的な列挙か？ #538**](https://github.com/google/transit/issues/538)   
Jerome は、fare_products において null の fare_media_id がすべてのチケットメディアに対して自由な乗り換えを許可するワイルドカードとして機能するのか、それとも各チケットメディアごとに明示的に重複を記述する必要があるのかについて明確化を求めています。

[**GTFS Realtime Stop Time Updates Timestamp 型 #537**](https://github.com/google/transit/issues/537)  
lolpro11 は、現在 int64 である StopTimeEvent の time フィールドを、他の GTFS Realtime のタイムスタンプフィールドとの一貫性のために uint64 に変更すべきかどうかを質問しています。 

[**フィールド名の複数形化？ #536**](https://github.com/google/transit/issues/536)  
Nina は、GTFS において「複数」の多重度(cardinality)を持つフィールドが、なぜ複数形ではなく単数形の名前を与えられているのかを疑問に思っています。これに対する回答では、CSV の各行には単一の外部キー参照しか含まれないため、列名はコレクションを表すのではなく個々の行に適用されるからだと説明されています。

[**ベストプラクティス: 一意の ID の妥当な長さ #518**](https://github.com/google/transit/issues/518)   
Stefan は、GTFS フィードで使用される任意の ID に推奨される文字数制限を設け、値が 36 バイトを超える場合にバリデータが警告を出すようにするベストプラクティスを導入することを提案しています。

[**相乗り路線の統合 #430**](https://github.com/google/transit/issues/430)   
フランスの National Access Point (NAP) の Aurélien が、バス路線のように正確な停留所等(stop)や目的地を持つ相乗り路線をモデル化する提案について GitHub Issue を立ち上げました。この場合、運転は一般のドライバーが行い、運賃から金銭的なインセンティブを受け取ったり、乗客と費用を分担したりすることができます。議論のために 2 つの異なる潜在的な解決策が提示されています。

### #gtfs チャンネルでのSlack会話 {: #slack-conversations-on-gtfs}


Holger が [OpenTransportMeetupでの今後のプレゼンテーション](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1738683307201049) を共有しました

Matthew が [Google Maps の Transit Layer における GTFS および GTFS-RT の取り込み](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1738781861988599) について質問しました

Antoine が [service_id と route_id の関連付けに関する議論](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1739215527531599) を提起しました

Emma が [GTFS-Pathways データを生成するソフトウェアベンダー](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1740067288244449) を探しました

Weston が [Google Maps における頻度ベースのサービスを含めることの影響](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1741026771607149) について質問しました

### #gtfs-realtime における Slack 上の会話 {: #slack-conversations-on-gtfs-realtime}


Paul は [GTFS-RT のマッチングに関する利用者の意見](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1738939691099549) を求めました。

Usamam は [GTFS-RT データを保存するためのユーザーフレンドリーなツール](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1739988659801339) を探しました。

### #gtfs-flex に関する Slack 上での会話 {: #slack-conversations-on-gtfs-flex}


Isabelle が [Flex を相乗りに利用できるかどうか](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1739462251045339) について質問を共有しました。

### #gtfs-fares における Slack 上での会話 {: #slack-conversations-on-gtfs-fares}


Wojciech が [距離制運賃に関する詳細](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740055815487029) を求めました。

Felix は Fares v2 の実装に関連して、[fare_leg_rules.txt](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740687333979029)、[fare_transfer_rules.txt](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740744467147399)、[fare_leg_join_rules.txt](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740743816951809)、および [timeframes.txt](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740387033618589) に関して複数の質問をしました。

Weston は [Fares ワーキンググループ会議での距離制運賃に関する質問](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1740509127859989) についてフォローアップしました。

## 📅 今後のイベント {: #upcoming-events}


[**GTFS-Fares v2 – 月例会議**](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-1230505989539?utm-campaign=social&utm-content=attendeeshare&utm-medium=discovery&utm-term=listing&utm-source=cp&aff=ebdsshcopyurl) | 2025年3月25日 午前11時（EST）

議題 : GTFS-Fares v2 拡張ワーキンググループ会議

## 💬 GTFS コミュニティに参加する {: #join-the-gtfs-community}


[**GitHub: google/transit**](https://github.com/google/transit): コミュニティとアイデアを共有しましょう！公式の GTFS GitHub リポジトリに参加してください。

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): 最新情報をすぐに入手できます。GTFS-changes Google グループに参加して、新しいプルリクエストや投票に関する情報を受け取りましょう。 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Realtime に関するすべてを話し合い、最新情報を入手しましょう。このグループでは GTFS Realtime について議論し、質問をしたり、変更を提案したりしています。

[**GTFS.org**](https://gtfs.org/): 公式の GTFS ドキュメントサイトです。ここでは GTFS に関する最新のリソースを頻繁に更新しています。 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): GTFS について質問がある、またはコミュニティとつながりたいですか？GTFS Slack の会話に参加してください。1,300 人以上のモビリティ愛好家がチャンネルで活動しており、質問に素早く答えてもらえる素晴らしい場所です。 

**GTFS Digest をお読みいただきありがとうございます！2025 年以降も最新の GTFS 情報をお届けできることを楽しみにしています。**
