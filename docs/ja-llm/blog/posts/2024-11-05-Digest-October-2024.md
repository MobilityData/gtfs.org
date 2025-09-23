---
draft: false
pin: false
date:
  created: 2024-11-05
title: GTFS Digest - October 2024 - The Global GTFS Community united in Montreal 
description: Key updates from the October 2024 GTFS Digest include a vote on adding a `feed_version` field to GTFS Realtime feeds, the adoption of trip modification adjustments for Realtime, and ongoing proposals like enhancements to station modeling and rider categories in GTFS-Fares v2. Conversations across GTFS channels focused on implementation questions, validator updates, and evolving best practices. The 2024 International Mobility Data Summit in Montreal also brought together global GTFS community members for impactful exchanges and collaboration.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---
# [GTFS Digest] 2024年10月 - モントリオールで結集したグローバルGTFSコミュニティ {: #gtfs-digest-october-2024-the-global-gtfs-community-united-in-montreal}


2024年10月のGTFS Digestの主な更新内容には、GTFS Realtimeフィードに `feed_version` フィールドを追加する投票、Realtimeにおける便の変更(trip modification)調整の採用、駅モデルの強化やGTFS-Fares v2における乗客カテゴリなどの進行中の提案が含まれています。GTFSチャンネル全体での会話は、実装に関する質問、バリデータの更新、進化するベストプラクティスに焦点を当てていました。また、モントリオールで開催された2024年国際モビリティデータサミットでは、グローバルGTFSコミュニティのメンバーが集まり、意義深い交流と協力が行われました。

<!-- more -->

GTFS Digestは、[MobilityData](https://mobilitydata.org/) によって毎月作成されるリソースで、GTFSに関する最新の動向を概観しています。  

私たちは皆様からのフィードバックを非常に重視しており、今回の内容についてのご意見を伺いたいと考えています。ぜひ [このフォーム](https://forms.gle/GGefktvemnJD5Q9g8) にご記入いただき、このツールの可能性を最大限に引き出すためにご協力ください。

## 📢 お知らせ {: #announcements}


[**2024年 国際 MobilityData サミットは成功裏に終了しました！**](https://mobilitydata.org/mobilitydata-strengthens-montreals-sustainable-mobility-ecosystem/)  
先週モントリオールで開催された 2024年 国際 Mobility Data サミットには、世界中から180名以上の参加者が集まりました。参加者は [GTFS トラック](https://mobilitydata.org/the-2024-international-mobility-data-summit-new/) で提案されたパネルやワークショップに積極的に参加し、ネットワーキングの機会を活用して、長期的な関係構築のための強固な基盤を築きました。

## 🏅 コントリビューターへの感謝 {: #contributor-shoutouts}


**Caltrans の Evan Siroki さん**  
Evan さんは今月、Issue #516 と #512 の作成方法について素晴らしいお手本を示してくださり、さらに複数の Slack チャンネルでも非常に活発に活動してくださいました。🙇

**SKI+ (SBB) の David Rudi さん**  
PR #434 において最初のプロデューサーになってくださりありがとうございます！コミュニティはあなたの献身に感謝しています！

**Transee の Darwin O'Connor さん**  
PR #434 を現実のものに近づけてくださり、さらにテスト段階で最初のコンシューマーにもなってくださいました。素晴らしい仕事です！

**UIUC の Saipraneeth Devunuri さん**  
バリデータの問題の原因を発見し、Issue #1912 を提起してくださいました！素晴らしい仕事です！

## 🗳️ 現在投票中 {: #currently-voting}


[**GTFS Realtime の FeedHeader に GTFS Feed Version を追加 #434**](https://github.com/google/transit/pull/434)  
この Realtime 提案は、GTFS Realtime データと併せて使用する GTFS スケジュールファイルに関する情報を提供するために、feed header に新しいフィールドを追加するものです。feed_version は、GTFS の feed_info.txt ファイル内の feed_version と一致します。

この提案は SKI+ (SBB) によって作成され、TransSee によって利用されています。  

* *投票期間は 11月16日 23:59:59 UTC に終了します。*

## 🚀 最近採用されたもの {: #recently-adopted}


[**便の変更(trip modification)に関する調整 #497**](https://github.com/google/transit/pull/497)  
このPRは、便の変更(trip modification)に関するGTFS Realtimeのドキュメントを明確化し、頻度ベースのサービスへの対応を追加し、.protoファイルに不足していた拡張フィールドを追加し、さらにドキュメントをより包括的かつファイル間で一貫性のあるものにしています。

## 📂 アクティブな提案 {: #active-proposals}


[**[GTFS Fares v2] rider_categories.txt の追加 #511**](https://github.com/google/transit/pull/511)  
rider_categories.txt ファイルは GTFS-Fares v2 提案の一部であり、特定の運賃に適用される乗客カテゴリをモデル化することを目的としています。

[**stops.stop_access フィールドの追加 #515**](https://github.com/google/transit/pull/515)  
このPRでは、stops.txt に stop_access フィールドを追加し、特定の駅における停留所等(stop)へのアクセス方法を示します。詳細については[この提案](https://docs.google.com/document/d/1huTq9I6Bs38ZGtcG-7Cpns0kT1njV3PoUCjnjEE0Y1E/edit?tab=t.0#heading=h.4jjq7xol2izb)を参照してください。このフィールドの追加は、駅のモデル化を改善するための3段階計画の第1段階でもあります。

[**TripUpdate.schedule_relationship = ADDED の挙動を明確化し、REPLACEMENT の非推奨を解除 #504**](https://github.com/google/transit/pull/504)  
このPRでは、OpenTripPlanner の実装に基づき、ADDED の挙動を明確化し、REPLACEMENT の非推奨を解除します。OpenTripPlanner では、旅程(journey)全体を追加または置換することを指定しています。完全に新しい便(trip)を仕様に沿って定義するために、行先表示(headsign)や乗降タイプなどの追加フィールドが必須として導入されます。

**その他のオープンな提案:**

* [過去の Stop Time Events を保持するべき #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] Area Set のマッチング述語 #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] fare_leg_join_rules.txt の追加（初回イテレーション）#439](https://github.com/google/transit/pull/439)  
* [FeedHeader に Feed Version と GTFS URL を追加 #434](https://github.com/google/transit/pull/434)  
* [[GTFS-Fares v2] チケット商品/チケットメディアの乗継挙動 #423](https://github.com/google/transit/pull/423)  

## 🔥 最も活発な議論 {: #most-active-conversations}


[**timeframes.txt に開始日と終了日を追加できるようにする #506**](https://github.com/google/transit/issues/506)  
Evan は、特別日の運賃変更に対して開始日と終了日を追加することを提案しています。この提案は、GTFS-Fares v2 ワーキンググループの10月のセッションで議論されました。詳細については、[こちら](https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit?usp=sharing)の会議メモをご参照ください。

[**仕様ドキュメント内で、休日情報を含めるべきであることを明示する #512**](https://github.com/google/transit/issues/512)  
この提案は、GTFS 仕様の記述内で、事前に把握されており毎年繰り返されることが一般的な休日運行を、すべての GTFS Schedule フィードにおいて明示的に期待される要素とすることを明確にするものです。

### #gtfs における Slack 上の会話 {: #slack-conversations-on-gtfs}


Walter Jenkins が [セントルイス市における GTFS でのバス自転車便の実装](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1725502423179069) について質問しています。

Evan Siroky が [カリフォルニア州の公共交通データガイドライン第4版](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1728590417755079) に関するフィードバックを求めています。

Pablo B が [複数の事業者が存在する地域での停留所(stop)の定義](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1729072406562529) について質問しています。

Alvaro T が [国際的なバス路線を、乗換ハブや異なる乗車制限を含めてモデリングする方法](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1730128316025739) についてのヒントを求めています。

### #gtfs-flex に関する Slack 上での会話 {: #slack-conversations-on-gtfs-flex}


Josh Drucker は [Flex をパラトランジット向けにも構築すべきか](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1728316827975629) を質問しました。

Josh Drucker は [オンデマンドサービスに関するいくつかの質問](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1728931281007179) を共有しました。

### #gtfs-validators における Slack 上での会話 {: #slack-conversations-on-gtfs-validators}


Evan Siroky が [fare_transfer_rules における境界的なケース](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1728080625895539) について質問しています。

Jeff Maki は [GTFS validator に関する問題](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1729270266359879) に直面しており、これはコミュニティで議論され、Praneeth によって次回の validator リリース 7.0 で対処すべき課題として提起されました。

Pablo B は [GTFS 公開におけるベストプラクティス](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1729589637103559) について質問しています。

## 📅 今後のイベント {: #upcoming-events}


[**GTFS-Fares v2 – 月例会議**](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-769939809697) | 2024年11月26日 午前11時（EST）

トピック : GTFS-Fares v2 拡張ワーキンググループ会議

## 🛠️ ツールのアップデート {: #tools-update}


[**新しい GTFS Schedule Validator リリース: Flex の部分的サポート**](https://github.com/MobilityData/gtfs-validator/releases/tag/v6.0.0)  
GTFS Schedule Validator バージョン 6.0 のリリースでは、GTFS-Flex フィードに対する誤検知通知が削除され、テキストに無効な文字が含まれている場合の新しいエラーが追加され、timepoints および translations に関する新しい仕様の明確化に基づいて検証ルールが更新されました。 

[質問やフィードバックは、こちらのディスカッションスレッドで共有してください。](https://github.com/MobilityData/gtfs-validator/discussions/1909)

## 💬 GTFS コミュニティに参加する {: #join-the-gtfs-community}


[**GitHub: google/transit**](https://github.com/google/transit): コミュニティとアイデアを共有しましょう！公式の GTFS GitHub リポジトリに参加してください。

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): 最新情報をすぐに入手できます。GTFS-changes Google グループに参加して、新しいプルリクエストや投票に関する情報を受け取りましょう。 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Realtime に関するすべてを話し合い、最新情報を入手しましょう。このグループでは GTFS Realtime について議論し、質問をしたり、変更を提案したりしています。

[**GTFS.org**](https://gtfs.org/): 公式の GTFS ドキュメントサイトです。ここでは GTFS に関する最新のリソースを頻繁に更新しています。 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): GTFS について質問がある、またはコミュニティとつながりたいですか？GTFS Slack の会話に参加してください。1,300 人以上のモビリティ愛好者がチャンネルで活動しており、質問に素早く答えてもらえる素晴らしい場所です。 

**GTFS Digest をお読みいただきありがとうございます！2024 年以降も最新の GTFS 情報をお届けできることを楽しみにしています。**
