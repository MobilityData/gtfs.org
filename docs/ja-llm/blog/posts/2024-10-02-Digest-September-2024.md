---
draft: false
pin: false
date:
  created: 2024-10-02
title: GTFS Digest - September 2024 - Loads of new conversations
description: The September 2024 GTFS Digest highlights recent contributions, including adopted proposals on validity rules for polygons and clarifications for from/to\_stop\_id in transfers.txt. It also features active proposals like adjustments to trip modifications and updates to nonconsecutive transfers in GTFS-Fares v2. This edition showcases a surge of new conversations, sparking discussions on HTTPS best practices, route deviation, and more.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---
# [GTFS Digest] 2024年9月 - 新しい議論が多数開始 {: #gtfs-digest-september-2024-loads-of-new-conversations}


2024年9月の GTFS Digest では、ポリゴンの妥当性ルールに関する採択済みの提案や、transfers.txt における from/to_stop_id の明確化など、最近の貢献を取り上げています。また、便の変更(trip modification)の調整や、GTFS-Fares v2 における非連続乗り換えの更新といった進行中の提案も紹介しています。今号では、新しい議論が急増しており、HTTPS のベストプラクティス、ルート逸脱、その他のテーマについて活発な議論が展開されています。

<!-- more -->

## 🏅 コントリビューターへの感謝 {: #contributor-shoutouts}


**Uriel Fojas**  
初めての Slack スレッドを投稿していただきありがとうございます！

**Evan Siroki, Stefan de Konink, & Weston Shippy**  
先月それぞれ2件の新しいイシューを投稿し、継続的にGTFSの開発を支援していただき感謝します！

**Philip Cline**  
GTFSのマージツールに関する素晴らしい議論を引き起こしていただきました！これが何かにつながることを願っています。

## 🚀 最近採用されたもの {: #recently-adopted}


[**locations.geojson におけるポリゴンの有効性ルールを追加 #476**](https://github.com/google/transit/pull/476)  
このPRでは、GTFSにおいてポリゴンが無効となるすべての方法を記述する代わりに、OpenGIS Simple Features Specification のセクション6.1.11を参照することで、flexポリゴンの有効性ルールを改善することを提案しています。

[**[明確化] transfers.txt における from/to_stop_id および from/to_trip_id の説明 #455**](https://github.com/google/transit/pull/455)  
このPRでは、transfers.txt における from/to_stop_id および from/to_trip_id の説明を、元の意味を変更することなく明確化しています。

## 📂 アクティブな提案 {: #active-proposals}


[**便の変更(trip modification)に関する調整 #497**](https://github.com/google/transit/pull/497)  
このPRは、便の変更(trip modification)に関するGTFS Realtimeドキュメントを明確化し、頻度ベースのサービスへの対応を追加し、.protoファイルに不足していた拡張フィールドを追加し、異なるファイル間でのドキュメントをより包括的かつ一貫性のあるものにします。

[**[GTFS Fares v2] nonconsecutive_transfer_allowed フィールドの追加と fare_transfer_type の明確化 #498**](https://github.com/google/transit/pull/498)  
このPRは、fare_transfer_rules.txt に nonconsecutive_transfer_allowed フィールドを追加し、乗り継ぎルールが非連続の乗り継ぎに適用可能かどうかを示すようにします。また、複数回の乗り継ぎを含む旅程(journey)における fare_transfer_type の説明を明確化します。

[**過去の停車時刻(stop_time)イベントは保持するべき #502**](https://github.com/google/transit/pull/502)  
このPRは、StopTimeUpdates における説明を「過去の停車時刻(stop_time)を保持することを許可する」から「保持することを推奨する」に変更します。

[**TripUpdate.schedule_relationship = ADDED の挙動を明確化し、REPLACEMENT の非推奨を解除 #504**](https://github.com/google/transit/pull/504)  
このPRは、OpenTripPlanner の実装に基づき、ADDED の挙動を明確化し、REPLACEMENT の非推奨を解除します。OpenTripPlanner では、旅程(journey)全体を追加または置換することを指定しています。完全に新しい便(trip)を仕様としてサポートするために、行先表示(headsign)や乗車/降車タイプなどの追加フィールドが必須として導入されます。

**その他のオープンな提案:**

* [[GTFS Fares v2] Area Set のマッチング述語 #483](https://github.com/google/transit/pull/483)  
* [[GTFS-Fares v2] fare_leg_join_rules.txt の追加（初回イテレーション）#439](https://github.com/google/transit/pull/439)  
* [GTFS Realtime の FeedHeader に Feed Version と GTFS URL を追加 #434](https://github.com/google/transit/pull/434)  
* [[GTFS-Fares v2] チケット商品/チケットメディアの乗り継ぎ挙動 #423](https://github.com/google/transit/pull/423)  

## 🔥 最も活発な議論 {: #most-active-conversations}


[**HTTPS を使用するベストプラクティスの追加... もしくは少なくとも SSL の健全性を確保すること？ #496**](https://github.com/google/transit/issues/496)  
Evan は、SSL 証明書の健全性を保った上で HTTPS を使用することを推奨するベストプラクティスを追加することを提案しています。

[**Flex が提供する現在の Route Deviation の解決策は十分か？ #499**](https://github.com/google/transit/issues/499)  
Weston は、ポリゴンデータを作成せずに stop_times.txt 内で直接迂回ルートをモデリングする方法を提案しています。

[**transfer_type = 1 #500**](https://github.com/google/transit/issues/500)  
Stefan は、transfers.txt における transfer_type = 1 の説明に関する明確化の必要性を指摘し、このアプローチでは不足している可能性のあるユースケースについて質問しています。

[**timeframes.txt に開始日と終了日を追加できるようにする #506**](https://github.com/google/transit/issues/506)  
Evan は、無料運賃の週末など一時的な運賃ポリシーをモデリングするために、timeframes.txt に start_date と end_date の列を追加することを提案しています。

[**continuous_pickup/continuous_drop_off の禁止に関する文言はどのように解釈されるべきか？ 値 1 を明示的に許可するよう調整すべきか？ #507**](https://github.com/google/transit/issues/507)  
Weston は、stop_times.txt において stop_times.end_pickup_drop_off_window を使用するデマンド型サービスをモデリングする際に、continuous_pickup/continuous_drop_off の使用を明確化することを提案しています。これにより、事業者が連続乗車または降車を許可しないことを指定できるようにすることを目的としています。

[**既存の GTFS における「停留所/駅の概念的なグループ化」を定義する機能の欠如 #438**](https://github.com/google/transit/issues/438)  
MobilityData は駅のモデリングを改善するための [3段階の計画](https://github.com/google/transit/issues/438#issuecomment-2289511429) を提案しており、この計画に関するフィードバックを求めています。大きな異論がなければ、まもなく第1段階に進む予定です。

[**trips.txt に cars_allowed フィールドを追加する #466**](https://github.com/google/transit/issues/466)  
最近のコメントでは、trips.txt に cars_allowed を追加する代わりに boarding_permissions.txt を使用する方向に傾いていますが、各停留所で車の乗降が許可されているかどうかを把握できる利便性が、特別な対応の必要性を正当化する可能性があることも指摘されています。

### #gtfs チャンネルでの Slack 会話 {: #slack-conversations-on-gtfs}


Walter Jenkins が [**セントルイス市における GTFS でのバス自転車便の実装**](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1725502423179069) について質問しています。

Philip Cline が質問しています: [**事業者は、時刻ポイントを失ったり、デフォルトで block ID を変更したりすることなく、サービス変更のために GTFS フィードをマージする際に何を使用していますか？**](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1726493345923399)

Uriel Fojas が助言を求めています: [**州全体の計画のために、州レベルで停留所等の設備データを一元化するプロジェクト**](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1726786680320179)

Josh Druker が質問しています: [**通常運行から緊急／減便運行（天候による緊急事態など）に切り替える方法について、何か考えはありますか？**](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1726925502813659)

### #gtfs-fares における Slack 上の会話 {: #slack-conversations-on-gtfs-fares}


Evan Siroki が次のように述べています: [**「"FARE FREE week"（運賃無料週間）をモデル化できるように、いくつかの例外を追加したいのですが、そのためには新しい service_id を作成する必要があり、結果として Fares v2 の領域外のファイルに影響を与えることになりそうです。」**](https://mobilitydata-io.slack.com/archives/C01KL7PR170/p1727195591059179)

### #gtfs-flex に関する Slack 上での会話 {: #slack-conversations-on-gtfs-flex}


Daniel Michalov が質問しました: [**OTP におけるフレックス便(trip)の最大長を制限している他の要因はありますか？**](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1725553302355079)

Marcy Jaffe が質問しました: [**有効な GTFS-schedule を持つ事業者が、新たに GTFS-Flex を用いたルート(route)を生成した場合（Spare Labs に感謝します）、2つのデータセットを1つに統合する必要がありますか？どのデータ要素を一致させる必要があるかについてのチュートリアルはありますか？**](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1725714575720539)

Fabian Braun が質問しました: [**Google の GTFS-Flex に関する計画について何か分かっていますか？私が見逃した公開発表はありましたか？**](https://mobilitydata-io.slack.com/archives/CSP7HDF37/p1726481999646599)

## 📅 今後のイベント {: #upcoming-events}


[**GTFS-Fares v2 – 月例会議**](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-769939809697) | 2024年10月22日 午前11時（EDT）

トピック : GTFS-Fares v2 拡張ワーキンググループ会議

## 💬 GTFS コミュニティに参加する {: #join-the-gtfs-community}


[**GitHub: google/transit**](https://github.com/google/transit): コミュニティとアイデアを共有しましょう！公式の GTFS GitHub リポジトリに参加してください。

[**GTFS-changes**](https://groups.google.com/g/gtfs-changes): 最新情報をすぐに入手できます。GTFS-changes Google グループに参加して、新しいプルリクエストや投票に関する情報を受け取りましょう。 

[**GTFS-realtime**](https://groups.google.com/g/gtfs-realtime): Realtime に関するすべてを話し合い、最新情報を入手しましょう。このグループでは GTFS Realtime について議論し、質問をしたり、変更を提案したりしています。

[**GTFS.org**](https://gtfs.org/): 公式の GTFS ドキュメントサイトです。ここでは GTFS に関する最新のリソースを頻繁に更新しています。 

[**MobilityData Slack**](https://share.mobilitydata.org/slack): GTFS について質問がある、またはコミュニティとつながりたいですか？GTFS Slack の会話に参加してください。1,300 人以上のモビリティ愛好家がチャンネルで活動しており、質問に素早く答えてもらえる素晴らしい場所です。 

**GTFS Digest をお読みいただきありがとうございます！2024 年以降も最新の GTFS 情報をお届けできることを楽しみにしています。**
