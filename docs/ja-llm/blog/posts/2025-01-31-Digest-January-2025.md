---
draft: false
pin: false
date:
  created: 2025-01-31
title: GTFS Digest - January 2025 - A Vote on Rider Categories and a Proposal on Interoperable tripid see the light
description: The January GTFS Digest covers the ongoing vote on rider_categories.txt for GTFS-Fares v2, the adoption of agency_fare_url clarifications, and proposals like original_trip_id for trip referencing and boarding_permissions.txt for vehicle carriage rules. Discussions include GTFS Realtime versioning and best practices for unique IDs.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---
# [GTFS Digest] 2025年1月 - 乗客カテゴリーに関する投票と相互運用可能な “trip_id” の提案が公開される {: #gtfs-digest-january-2025-a-vote-on-rider-categories-and-a-proposal-on-interoperable-trip_ids-see-the-light}


2025年1月の GTFS Digest では、GTFS-Fares v2 における rider_categories.txt の継続中の投票、agency_fare_url の明確化の採用、original_trip_id による便(trip)参照や boarding_permissions.txt による車両搭載ルールといった提案を取り上げています。議論には、GTFS Realtime のバージョニングや一意な ID のベストプラクティスも含まれています。

<!-- more -->

GTFS Digest は、[MobilityData](https://mobilitydata.org/) によって毎月作成されるリソースで、GTFS に関する最新の動向を概観するものです。  

私たちは皆さまからのフィードバックを大切にしており、今回の内容についてのご意見を伺いたいと考えています。ぜひ [このフォーム](https://forms.gle/GGefktvemnJD5Q9g8) にご記入いただき、このツールの可能性を最大限に引き出すためにご協力ください。

## 🏅 コントリビューターへの感謝 {: #contributor-shoutouts}


**Harpreetkaur, Laurent, Stephanie Daniels, Wojciech, & Angela Teyvi**  
GTFS Slack に参加し、貴重なスレッドでコミュニティに貢献してくださりありがとうございます。 

**David1234**  
google/transit で初めての Pull Request を投稿してくださり感謝します。今後の展開を楽しみにしています！ 

**Miklcct**  
投票が不成立となった後も提案を続けてくださったことを称賛します。提案を推進することは難しく、合意形成には多くの忍耐が必要です。

## 🗳️ 現在投票中 {: #currently-voting}


[**[GTFS Fares v2] rider_categories.txt の追加 #511**](https://github.com/google/transit/pull/511)  
rider_categories.txt ファイルは GTFS-Fares v2 提案の一部であり、特定の運賃に適用される乗客カテゴリをモデル化することを目的としています。

* *投票は 2025-02-13 23:59:59 UTC に終了します。*

## 🚀 最近採用されたもの {: #recently-adopted}


[**agency_fare_url の使用方法の明確化 #524**](https://github.com/google/transit/pull/524)  
このPRは、agency_fare_url の定義を拡張し、チケット購入が可能なページだけでなく、運賃情報を含むURLページも対象に含めるようにしました。

## 📂 アクティブな提案 {: #active-proposals}


[**GTFS Schedule および Realtime に original_trip_id を追加する提案 #534**](https://github.com/google/transit/pull/534)  
Davidr1234 は、Google Transit 拡張から `original_trip_id` を GTFS Schedule と GTFS Realtime の両方に採用することを提案しています。これにより、SIRI や NeTEx など、同様の概念を持つ他の標準との間で便(trip)をシームレスに参照できるようになります。

[**停留所単位で車両の搭載可否を指定するための boarding permissions の導入 #533**](https://github.com/google/transit/pull/533)  
Miklcct は、公共交通サービスにおいて、あらゆる種類の車両を停留所単位で搭載・乗車・降車できるかどうかを指定するための汎用的な解決策を提案しています。これは、新しいファイル boarding_permissions.txt を導入し、stop_times.txt から参照することで実現されます。

[**booking_rules.txt における continuous pickup/dropoff 値とフィールド型の明確化 #528**](https://github.com/google/transit/pull/528)  
この PR は、特にデマンド型サービス(DRT)向けの明確化を導入し、start_pickup_drop_off_window/end_pickup_drop_off_window が指定されている場合に continuous_pickup/continuous_drop_off に値 1 を許可します。また、booking_rules.txt 内の4つのフィールドのデータ型を正の整数に更新します。

[**event_based_trips.txt の仕様への追加 #527**](https://github.com/google/transit/pull/527)  
この PR は [#526](https://github.com/google/transit/issues/526) に基づいており、イベント後の臨時便であることを利用者や顧客に示すために event_based_trips.txt ファイルを追加することを提案しています。

[**stops.stop_access フィールドの追加 #515**](https://github.com/google/transit/pull/515)  
この PR は、stops.txt に stop_access フィールドを追加し、特定の駅における停留所等(stop)へのアクセス方法を示すものです。詳細については [この提案](https://docs.google.com/document/d/1huTq9I6Bs38ZGtcG-7Cpns0kT1njV3PoUCjnjEE0Y1E/edit?tab=t.0#heading=h.4jjq7xol2izb) を参照してください。このフィールドの追加は、駅のモデリングを改善するための3段階計画の第1段階でもあります。

[**TripUpdate.schedule_relationship = ADDED を廃止し、TripUpdate.schedule_relationship = NEW / REPLACEMENT を追加して、GTFS Schedule に存在しない新規便や置換便を指定する #504**](https://github.com/google/transit/pull/504)  
この PR の当初の提案は投票で否決されたため変更されました。更新された提案では、GTFS Realtime における TripUpdate.schedule_relationship = ADDED を廃止し、GTFS Schedule に存在しない完全に新しい便を示すために TripUpdate.schedule_relationship = NEW を導入します。この新しい値は実験的としてフラグ付けされます。次回の投票前に、できるだけ多くの人々が議論に参加し、コミュニティ全体で十分に検討されることを期待しています。

**その他のオープンな提案:**

* [過去の Stop Time Events を保持するべき #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] nonconsecutive_transfer_allowed フィールドの追加と fare_transfer_type の明確化 #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set のマッチング述語 #483](https://github.com/google/transit/pull/483)  
* [CANCELED/SKIPPED TripUpdates と NO_SERVICE Alerts の明確化 #482](https://github.com/google/transit/pull/482)  
* [[GTFS-Fares v2] チケット商品/チケットメディアの乗継挙動 #423](https://github.com/google/transit/pull/423)  

## 🔥 最も活発な議論 {: #most-active-conversations}


[**[議論] GTFS Realtime のバージョニング #530**](https://github.com/google/transit/issues/530)  
GTFS Realtime に関する最近の議論において、コミュニティは合意形成に困難を抱えているようであり、その結果、最近の PR#504 でバージョニングの話題が取り上げられました。これに対応するため、本 issue を開き、GTFS Realtime のバージョニングについて議論を行います。

[**GTFS-RT TripUpdates フィードにおける GTFS-Static に存在しない trip_id の利用 #529**](https://github.com/google/transit/issues/529)  
Mpaine-act は新しい GTFS-Realtime TripUpdates フィードを構築しており、GTFS-Static に存在しない便(trip)の扱いについて指針を求めています。この issue では、後方互換性のために負の（偽の）trip_id を使用する方法と、trip_id を完全に省略する方法の 2 つのアプローチを比較しています。

[**GTFS Service Alerts に communication_period と impact_period を追加 #521**](https://github.com/google/transit/issues/521)  
GTFS Realtime Alert の active_period フィールドは曖昧であり、アラートの表示期間を意味するのか、障害の継続時間を意味するのかが不明確です。この問題を解決するために、アラートの表示期間を示す communication_period と、障害の時間枠を示す impact_period を追加する提案がなされています。

[**ベストプラクティス: 一意の ID の妥当な長さ #518**](https://github.com/google/transit/issues/518)  
この issue では、GTFS フィードで使用されるあらゆる ID に推奨される文字数制限を設け、値が 36 バイトを超えた場合にバリデータが警告を出すというベストプラクティスを導入することが提案されています。

[**グローバル trip id #462**](https://github.com/google/transit/issues/462)  
SKI+ の David は、NeTEx や HRDF などの他の標準との統合を改善するために、GTFS Schedule および Realtime に新しいフィールド "trip_global_id" を導入することを提案しています。これは 1 日有効な便(trip)識別子の必要性に対応するものであり、このグローバル ID によって異なるデータ形式間での旅行情報のマッピングが容易になります。

[**提案ベストプラクティス: SCHEDULED trips において TripDescriptor に常に trip_id を含める #465**](https://github.com/google/transit/issues/465)  
この提案では、GTFS Realtime において SCHEDULED trips の TripDescriptor に `trip_id` を必ず使用することを義務付けることを提案しています。これは、複数の識別子を用いる代替手法がしばしば問題を引き起こすため、データ統合を簡素化することを目的としています。

### #gtfs チャンネルでの Slack 会話 {: #slack-conversations-on-gtfs}


Guillaume は [Google が乗車エリアを使用しているかどうか](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736191393238099?thread_ts=1719341926.148069&cid=C3FFFKX9C) を質問しました。

Stephanie は [GTFS カレンダーに関するベストプラクティス](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736198110045109) について質問しました。

Wojciech は [GTFS における予定便のキャンセル](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736511997339379) について問い合わせました。

Aaron は [GTFS 利用者間での shape_dist_travelled に関する期待値](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736876535662269) について質問しました。

Angela は [OSM をクエリして GTFS を生成する方法](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1737478885517559) を求めました。

Harpreetkaur は [便の最終停留所における GTFS-RT TripUpdates に関するベストプラクティス](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1737492251744489) について助言を求めました。

### #gtfs-realtime における Slack 上の会話 {: #slack-conversations-on-gtfs-realtime}


Michael は [複数の GTFS-RT フィードを1つのフィードに統合するツール](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1737552364940779) を求めました。

Laurent は [まだ開始していない便(trip)に遅延を伝播させる方法](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1737741170127629) について助言を求めました。

## 📅 今後のイベント {: #upcoming-events}


[**GTFS-Fares v2 – 月例会議**](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-1230505989539?utm-campaign=social&utm-content=attendeeshare&utm-medium=discovery&utm-term=listing&utm-source=cp&aff=ebdsshcopyurl) | 2025年2月25日 午前11時（EST）

トピック : GTFS-Fares v2 拡張ワーキンググループ会議

## 💬 GTFS コミュニティに参加する {: #join-the-gtfs-community}


[**GitHub: google/transit**](https://github.com/google/transit): コミュニティとアイデアを共有しましょう！公式の GTFS GitHub リポジトリに参加してください。

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): 最新情報をすぐに入手できます。GTFS-changes Google グループに参加して、新しいプルリクエストや投票に関する情報を受け取りましょう。 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Realtime に関するすべてを話し合い、最新情報を入手しましょう。このグループでは GTFS Realtime について議論し、質問をしたり、変更を提案したりしています。

[**GTFS.org**](https://gtfs.org/): 公式の GTFS ドキュメントサイトです。ここでは GTFS に関する最新のリソースを頻繁に更新しています。 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): GTFS について質問がある、またはコミュニティとつながりたいですか？GTFS Slack の会話に参加しましょう。1,300 人以上のモビリティ愛好者がチャンネルで活動しており、質問に素早く答えてもらえる素晴らしい場所です。 

**GTFS Digest をお読みいただきありがとうございます！2025 年以降も最新の GTFS 情報をお届けできることを楽しみにしています。**
