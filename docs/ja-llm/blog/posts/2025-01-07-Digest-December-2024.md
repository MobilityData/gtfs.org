---
draft: false
pin: false
date:
  created: 2025-01-07
title: GTFS Digest - December 2024 - 2 Votes and 1 Adoption to celebrate the Digest’s 1-year anniversary!
description: Let's celebrate the Digest's 1-year anniversary with 2 votes and an adoption to the specification. The community is currently voting on a proposal to clarify the use of agency_fare_url and a proposal that specifies the behavior of ADDED, and un-deprecate REPLACEMENT in TripUpdates. We also recommend that you take a look at the latest adoption that adds fare_leg_join_rules.txt to the specification.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---
# [GTFS Digest] 2024年12月 - Digest 1周年を記念して2件の投票と1件の採用！ {: #gtfs-digest-december-2024-2-votes-and-1-adoption-to-celebrate-the-digests-1-year-anniversary}

Digest の1周年を、2件の投票と1件の仕様採用でお祝いしましょう。現在コミュニティでは、agency_fare_url の使用方法を明確化する提案と、便の更新(TripUpdates)における ADDED の挙動を規定し、REPLACEMENT の非推奨を解除する提案について投票が行われています。また、fare_leg_join_rules.txt を仕様に追加する最新の採用についてもぜひご覧ください。

<!-- more -->

GTFS Digest は、[MobilityData](https://mobilitydata.org/) によって毎月発行される、GTFS の最新動向をまとめたリソースです。  

私たちは皆さまからのフィードバックを大切にしています。ぜひ [このフォーム](https://forms.gle/GGefktvemnJD5Q9g8) にご記入いただき、このツールの可能性を最大限に引き出すためにご協力ください。

## 📢 お知らせ {: #announcements}


[**GTFS ガバナンス変更提案ドキュメントのレビューにご協力ください**](https://docs.google.com/document/d/1EyJFvgOXZ4Gq6d6GJ6Hibey8Gkwyh7M25ECGwarmsT8/edit?usp=sharing)  
このドキュメントは、ガバナンス作業部会ミーティングおよび 2023 年の MobilityData ワークショップでの議論を踏まえ、それらのセッションから得られた知見を反映しています。2025 年第 1 四半期に予定されている PR 公開を支援するため、ぜひレビューにご協力ください。

* *レビュー期間は 2025 年 1 月 17 日に終了します*

## 🏅 コントリビューターへの感謝 {: #contributor-shoutouts}


**Gcamp & Miklcct**   
それぞれのPRで投票を開始し、GTFSの発展に貢献してくださったことに大きな感謝を申し上げます。 

**Jeffkessler-keolis**  
とてもよく書かれたIssueであり、しかも初めての投稿とのこと！素晴らしいです！

## 🗳️ 現在投票中 {: #currently-voting}


[**agency_fare_url の使用方法の明確化 #524**](https://github.com/google/transit/pull/524)  
このPRは、agency_fare_url の定義を拡張し、チケット購入が可能なページだけでなく、運賃情報を含むURLページも対象に含めるものです。

* *投票期間は1月20日 23:59:59 UTCに終了します。*

[**TripUpdate.schedule_relationship = ADDED の挙動を明確化し、REPLACEMENT の非推奨を解除 #504**](https://github.com/google/transit/pull/504)  
このPRは、OpenTripPlanner の実装に基づき、ADDED の挙動を明確化し、REPLACEMENT の非推奨を解除するものです。OpenTripPlanner では、旅程全体を追加または置換することを指定しています。完全に新しい便を完全に指定するために、headsign や乗車／降車タイプといった追加のフィールドが必須として導入されています。

* *投票期間は1月15日 23:59:59 UTCに終了します。*

## 🚀 最近採択されたもの {: #recently-adopted}


[**fare_leg_join_rules.txt の追加 #439**](https://github.com/google/transit/pull/439)  
このプルリクエストでは、用語定義に *有効運賃区間(Effective Fare Leg)* の概念を導入し、有効運賃区間を定義するために fare_leg_join_rules.txt を追加し、さらに fare_leg_rules.txt 内の network_id、from_area_id、to_area_id、from_timeframe_group_id、to_timeframe_group_id フィールドをこの新しいアプローチに合わせて更新しています。

* *この提案は Ito World によって作成され、Google によって採用されています。*

## 📂 アクティブな提案 {: #active-proposals}


[**[GTFS Fares v2] rider_categories.txt の追加 #511**](https://github.com/google/transit/pull/511)  
rider_categories.txt ファイルは GTFS-Fares v2 提案の一部であり、特定の運賃に適用される乗客カテゴリをモデル化することを目的としています。

[**event_based_trips.txt の仕様への追加 #527**](https://github.com/google/transit/pull/527)  
このPRは [#526](https://www.google.com/url?q=https://github.com/google/transit/issues/526&sa=D&source=docs&ust=1736197802148598&usg=AOvVaw05zhgBG-OjK_VKMYBNuHju) に基づいており、event_based_trips.txt ファイルを追加して、該当する便(trip)がイベント後の臨時便であることを利用者や顧客に示すことを提案しています。


**その他のオープン提案:**

* [過去の Stop Time Events を保持するべき #502](https://github.com/google/transit/pull/502)  
* [stops.stop_access フィールドの追加 #515](https://github.com/google/transit/pull/515)  
* [[GTFS Fares v2] nonconsecutive_transfer_allowed フィールドの追加と fare_transfer_type の明確化 #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set のマッチング述語 #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] Fare product/media の乗り継ぎ挙動 #423](https://github.com/google/transit/pull/423)  

## 🔥 最も活発な議論 {: #most-active-conversations}


[**GTFS Service Alerts に communication_period と impact_period を追加する #521**](https://github.com/google/transit/issues/521)  
GTFS Realtime の Alert における active_period フィールドは曖昧であり、アラートの表示期間を意味するのか、運行障害の継続時間を意味するのかが不明確です。提案では、アラートの表示期間を示す communication_period と、運行障害の期間を示す impact_period を追加し、その用途を明確にすることが提案されています。

[**イベントベースの便に関する規定を追加する（「イベント終了後 x 分で出発する便」のモデリングをサポートするため） #526**](https://github.com/google/transit/issues/526)  
この課題では、イベント終了時刻に依存して復路便が運行されるイベントベースのルートをモデリングするための GTFS の方法が提案されています。提案では、event_based_trips.txt ファイルを追加し、該当する便がイベント終了後に運行される臨時便であることを利用者やシステムに示すことが提案されています。

[**ベストプラクティス: ユニーク ID の妥当な長さ #518**](https://github.com/google/transit/issues/518)  
この課題では、GTFS フィードで使用されるあらゆる ID に推奨される文字数制限を設け、値が 36 バイトを超える場合にバリデータが警告を出すというベストプラクティスを導入することが提案されています。

### #gtfs チャンネルでの Slack 会話 {: #slack-conversations-on-gtfs}


Leo は [GTFS データセットの外部で id を定義してデータセット同士をリンクする拡張機能](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1733497063149959) を探しました。

Evan は [カリフォルニア公共交通データガイドラインのバージョン4](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1733962711549929?thread_ts=1728590417.755079&cid=C3FFFKX9C) の最終化を発表しました。

Raffael は [parent_stations のベストプラクティス](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1734526282094799) について質問しました。

Michael は [ダウンロードした GTFS を使ってオフラインで動作するアプリ](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1734569332694509) について問い合わせました。

Stephanie は [スケジューリングのベストプラクティス](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1736198110045109) について質問しました。

### #gtfs-fares における Slack 上の会話 {: #slack-conversations-on-gtfs-fares}


Michael は [分割チケットのモデリング](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1733233599140119) について質問しました。

Michael は [駅ごとの制限を伴う運賃モデリング](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1733258324963899) について問い合わせました。

Michael は [ゾーン運賃における中間ゾーンの定義](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1733258582268919) について、より詳細を求めました。

Guillaume は [rider_categories PR を妨げているものがあるかどうか](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1734545159926479) を確認しました。

### #gtfs-realtime に関する Slack 上での会話 {: #slack-conversations-on-gtfs-realtime}


Michael が [削除された代替便を復活させる以前の PR](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1733354282636069) について質問しました。

## 💬 GTFS コミュニティに参加する {: #join-the-gtfs-community}


[**GitHub: google/transit**](https://github.com/google/transit): コミュニティとアイデアを共有しましょう！公式の GTFS GitHub リポジトリに参加してください。

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): 最新情報をすぐに入手できます。GTFS-changes Google グループに参加して、新しいプルリクエストや投票に関する情報を受け取りましょう。 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Realtime に関するすべてを話し合い、最新情報を入手しましょう。このグループでは GTFS Realtime について議論し、質問をしたり、変更を提案したりしています。

[**GTFS.org**](https://gtfs.org/): 公式の GTFS ドキュメントサイトです。ここでは GTFS に関する最新のリソースを頻繁に更新しています。 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): GTFS について質問がある、またはコミュニティとつながりたいですか？GTFS Slack の会話に参加しましょう。1,300 人以上のモビリティ愛好者がチャンネルで活動しており、質問に素早く答えてもらえる素晴らしい場所です。 

**GTFS Digest をお読みいただきありがとうございます！2025 年以降も最新の GTFS 情報をお届けできることを楽しみにしています。**
