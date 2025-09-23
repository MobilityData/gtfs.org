---
draft: false
pin: false
date:
  created: 2024-12-03
title: GTFS Digest - November 2024 - Governance Proposal and Rider Categories - Your Input Needed
description: November’s highlights include the Governance Changes Proposal, a new GTFS Realtime feature linking feed versions to schedules, and voting on fare leg join rules. Active proposals and discussions tackled rider categories, flexible pathways, and demand-based frequencies,
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---
# [GTFSダイジェスト] 2024年11月 - ガバナンス提案と乗客カテゴリ: ご意見をお聞かせください {: #gtfs-digest-november-2024-governance-proposal-and-rider-categories-your-input-needed}


11月の注目点には、ガバナンス変更提案、新しい GTFS Realtime 機能であるフィードバージョンとスケジュールのリンク、そして運賃区間結合ルールに関する投票が含まれます。活発な提案や議論では、運賃の乗客カテゴリ、柔軟な構内通路(pathway)、需要に基づく運行頻度が取り上げられました。

<!-- more -->

GTFSダイジェストは、[MobilityData](https://mobilitydata.org/) によって毎月発行されるリソースで、GTFSに関する最新の動向をまとめています。  

私たちは皆さまからのフィードバックを大切にしており、今回の内容についてのご意見を伺いたいと考えています。ぜひ [このフォーム](https://forms.gle/GGefktvemnJD5Q9g8) にご記入いただき、このツールの可能性を最大限に引き出すためにご協力ください。

## 📢 お知らせ {: #announcements}


[**GTFS ガバナンス変更提案ドキュメントのレビューにご協力ください**](https://docs.google.com/document/d/1EyJFvgOXZ4Gq6d6GJ6Hibey8Gkwyh7M25ECGwarmsT8/edit?usp=sharing)  
このドキュメントは、ガバナンス作業部会ミーティングおよび 2023 年の MobilityData ワークショップでの議論を踏まえて作成され、それらのセッションから得られた知見を反映しています。2025 年第 1 四半期に予定されている PR 公開を支援するため、ぜひレビューにご協力いただけますようお願いいたします。

## 🏅 コントリビューターへの感謝 {: #contributor-shoutouts}


**Saipraneeth Devunuri (University of Illinois Urbana-Champaign)**  
Saipraneeth さんの [研究](https://findingspress.org/article/116694-a-survey-of-errors-in-gtfs-static-feeds-from-the-united-states) では、MobilityData の GTFS バリデータを用いて、アメリカ合衆国の GTFS フィードにおけるエラーの調査が行われました。

**miklcct**   
11月に Shape と Pathway に関して 3 件の issue をオープンしました！ 

**Konstantinos**  
Slack で初めて貢献し、ギリシャにおける [フェリーに関するユースケース](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1732189321118949) を共有しました。  

**Steven White**   
GitHub ([#514](https://github.com/google/transit/issues/514) & [#482](https://github.com/google/transit/pull/482#issuecomment-2498646379)) や Slack で、コミュニティメンバーを助けるために詳細な回答を行いました。  

## 🗳️ 現在投票中 {: #currently-voting}


[**fare_leg_join_rules.txt の追加 #439**](https://github.com/google/transit/pull/439)  
このプルリクエストは、用語定義に *有効運賃区間(Effective Fare Leg)* の概念を導入し、有効運賃区間を定義するために fare_leg_join_rules.txt を追加し、さらに fare_leg_rules.txt 内の network_id、from_area_id、to_area_id、from_timeframe_group_id、to_timeframe_group_id フィールドをこの新しいアプローチに合わせて更新します。

この提案は Ito World によって作成され、Google によって利用されています。 

* *投票期間は 12月3日 23:59:59 UTC に終了します。*

## 🚀 最近採択された提案 {: #recently-adopted}


[**GTFS Realtime の FeedHeader に GTFS Feed Version を追加 #434**](https://github.com/google/transit/pull/434)  
この Realtime 提案は、GTFS Realtime データと併用する GTFS Schedule ファイルに関する情報を提供するために、feed header に新しいフィールドを追加します。feed_version は、GTFS の feed_info.txt ファイル内の feed_version と一致します。

## 📂 アクティブな提案 {: #active-proposals}


[**[GTFS Fares v2] rider_categories.txt の追加 #511**](https://github.com/google/transit/pull/511)  
rider_categories.txt ファイルは GTFS-Fares v2 提案の一部であり、特定の運賃に適用される乗客カテゴリをモデル化することを目的としています。

[**stops.stop_access フィールドの追加 #515**](https://github.com/google/transit/pull/515)  
このPRでは、stops.txt に stop_access フィールドを追加し、特定の駅における停留所等(stop)へのアクセス方法を示します。詳細については[この提案](https://docs.google.com/document/d/1huTq9I6Bs38ZGtcG-7Cpns0kT1njV3PoUCjnjEE0Y1E/edit?tab=t.0#heading=h.4jjq7xol2izb)を参照してください。このフィールドの追加は、駅のモデル化を改善するための3段階計画の第1段階でもあります。

**その他のオープンな提案:**

* [過去の Stop Time Events を保持するべき #502](https://github.com/google/transit/pull/502)  
* [[GTFS Fares v2] nonconsecutive_transfer_allowed フィールドの追加と fare_transfer_type の明確化 #498](https://github.com/google/transit/pull/498)  
* [[GTFS Fares v2] Area Set のマッチング述語 #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] Fare product/media の乗り継ぎ挙動 #423](https://github.com/google/transit/pull/423)  

## 🔥 最も活発な議論 {: #most-active-conversations}


[GTFS Service Alerts に communication_period と impact_period を追加する #521](https://github.com/google/transit/issues/521)  
GTFS Realtime の Alert における active_period フィールドは曖昧であり、アラートの表示期間を意味するのか、運行障害の継続時間を意味するのかが不明確です。提案では、アラートの表示用に communication_period を、運行障害の期間を示すために impact_period を追加し、その用途を明確にすることが示されています。

[frequencies.txt の主キー: end_time, headway_secs, exact_times を追加するか？ #514](https://github.com/google/transit/issues/514)  
この課題では、frequencies.txt の主キーを拡張し、時間帯が重複する便や、異なる headway_secs（ラッシュ時の増便など）、または異なる exact_times を持つ便をカバーすることが提案されています。

[外部からはアクセスできないが、乗り換え目的ではアクセス可能なプラットフォームに wheelchair_boarding を指定する #516](https://github.com/google/transit/issues/516)  
この課題では、pathways.txt に wheelchair_accessible フィールドを追加し、構内通路(pathway)がバリアフリーであるかどうかを明示的に示せるようにし、駅構内で車椅子利用者が利用可能なルートを特定できるようにすることが提案されています。

[pathways.txt における「ロックされていないプラットフォームが存在しない」という要件を削除する #517](https://github.com/google/transit/issues/517)  
この課題では、すべてのプラットフォームが少なくとも1つの入口/出口に構内通路(pathway)の連鎖で接続されていなければならないという要件を削除し、pathway に関する要件をより柔軟にすることが提案されています。

[ベストプラクティス: ユニークIDの妥当な長さ #518](https://github.com/google/transit/issues/518)  
この課題では、GTFS フィードで使用されるすべての ID に推奨される文字数制限を設け、36バイトを超える値が存在する場合にバリデータが警告を出すというベストプラクティスを導入することが提案されています。

[GTFS フィードにライセンス情報を追加する #519](https://github.com/google/transit/issues/519)  
ライセンス情報を追加することで、GTFS フィードの取り込みプロセスを迅速化し、GTFS 提供者による法的義務や制約に直接アクセスできるようになります。

[shapes.txt にトンネルなどの特徴を指定する #520](https://github.com/google/transit/issues/520)  
この課題では、shapes.txt に新しいフィールドを追加し、トンネルなどの経路上の特徴を指定できるようにすることが提案されています。複数の貢献者から、この情報を GTFS 内で表現するための複数の選択肢が提示されています。

[frequencies.txt の exact_times フィールドに需要ベースの頻度を追加する #522](https://github.com/google/transit/issues/522)  
この課題では、カイロのミニバスのような事例を用いて、乗客の需要などの要因に基づいて出発する便を指定するために、exact_times に新しいオプションを追加することが提案されています。

["header.incrementality: DIFFERENTIAL" のコンシューマー/プロデューサーの挙動を定義する #84](https://github.com/google/transit/issues/84)  
この再燃した課題では、便の更新(trip update)における CANCELED/SKIPPED と、運行情報(alert)における NO_SERVICE の役割を明確にすることに焦点が当てられています。最新の議論では、CANCELED が経路検索に影響を与える一方で、NO_SERVICE は乗客に運行障害を通知することを保証する点に注目しています。

### #gtfs チャンネルでの Slack 会話 {: #slack-conversations-on-gtfs}


Weston が [静的な便(trip)計画における timepoint の使用](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1731105469421269) について質問しました

Konstantinos が [agency.txt ファイルに運賃 URL を追加する](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1732189321118949) 方法について助けを求めました

Elias が Statistics Canada に関する [GTFS を活用した研究](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1732119975757499) を共有しました

### #gtfs-flex に関する Slack 上での会話 {: #slack-conversations-on-gtfs-flex}


Matthew は [Via の料金から GTFS-Flex を生成する](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1730991630563329)ためのヒントを求め、さらに [GTFS-Flex 用のバリデータの存在](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1731012710942629)について質問しました。

### #gtfs-validators における Slack 上の会話 {: #slack-conversations-on-gtfs-validators}


Jeff は [GTFS validator が Flex フォーマットを完全に認識しているかどうか](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1730911388951229) を質問しました。

Krysttian は [Praneeth の記事を共有しました](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1730988293903099)。この記事では GTFS Validator を使用してエラーの調査を作成していました。

### #gtfs-fares におけるSlackでの会話 {: #slack-conversations-on-gtfs-fares}


Evan が面白い [good dog-bad dog 運賃ポリシー](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1731565332639069) を共有しました。

Daniel が [fare rule が紐づいていない fare attribute をどのように扱うべきか](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1732231109425179) について助言を求めました。

### #gtfs-realtime における Slack 上の会話 {: #slack-conversations-on-gtfs-realtime}


Graeme は [pacebus の GTFS-Realtime ソース](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1732734051456289) を探していました。

Holger は [GTFS-Realtime のベストプラクティスに関する質問と提案](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1732871254059609) をいくつか持っていました。

## 🛠️ ツールのアップデート {: #tools-update}


[**新しい GTFS Schedule Validator リリース: Flex の部分的サポート**](https://github.com/MobilityData/gtfs-validator/releases/tag/v6.0.0)  
GTFS Schedule Validator バージョン 6.0 のリリースでは、GTFS-Flex フィードに対する誤検知通知が削除され、テキストに無効な文字が含まれている場合の新しいエラーが追加され、timepoints および translations に関する新しい仕様の明確化に基づいて検証ルールが更新されました。 

[質問やフィードバックは、こちらのディスカッションスレッドで共有してください。](https://github.com/MobilityData/gtfs-validator/discussions/1909)

## 💬 GTFS コミュニティに参加する {: #join-the-gtfs-community}


[**GitHub: google/transit**](https://github.com/google/transit): コミュニティとアイデアを共有しましょう！公式の GTFS GitHub リポジトリに参加してください。

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): 最新情報をすぐに入手できます。GTFS-changes Google グループに参加して、新しいプルリクエストや投票に関する情報を受け取りましょう。 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Realtime に関するすべてを話し合い、最新情報を入手しましょう。このグループでは GTFS Realtime について議論し、質問をしたり、変更を提案したりしています。

[**GTFS.org**](https://gtfs.org/): 公式の GTFS ドキュメントサイトです。ここでは GTFS に関する最新のリソースを頻繁に更新しています。 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): GTFS について質問がある、またはコミュニティとつながりたいですか？GTFS の Slack 会話に参加しましょう。1,300 人以上のモビリティ愛好者がチャンネルで活動しており、質問に素早く答えてくれる素晴らしい場所です。 

**GTFS Digest をお読みいただきありがとうございます！2024 年以降も最新の GTFS 情報をお届けできることを楽しみにしています。**
