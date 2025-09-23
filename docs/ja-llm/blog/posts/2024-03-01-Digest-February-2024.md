---
draft: false
pin: false
date:
  created: 2024-03-01
title: GTFS Digest - February 2024
description: Read this month's digest and stay up to date on GTFS development.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---
# [GTFSダイジェスト] 2024年2月 - 今年最初の投票の時が来ました！ {: #gtfs-digest-february-2024-its-time-for-the-first-vote-of-the-year}

ガバナンスの強化、言語コード標準、相乗り路線、リアルタイムの知見 - GTFSコミュニティで最も熱い議論に参加しましょう！


<!-- more -->

GTFSダイジェストは、[MobilityData](https://mobilitydata.org/) によって毎月発行されるリソースで、GTFSに関する最新の動向を概観するものです。  

私たちは皆さまからのフィードバックを大切にしており、私たちの取り組みについてご意見を伺いたいと考えています。ぜひ [このフォーム](https://forms.gle/GGefktvemnJD5Q9g8) にご記入いただき、このツールの可能性を最大限に引き出すためにご協力ください。

## 🏅 コントリビューターへの感謝 {: #contributor-shoutouts}


**AurelienC**

フランス国立アクセスポイントを代表して [相乗り路線の統合](https://github.com/google/transit/issues/430) に関する最初の issue を投稿しました。よく書かれ、よく考えられた issue です！ 

**Weston と Darwin**

この2人のアクティブなコントリビューターは、さらに一歩進んで初めての PR を投稿しました（[PR#432](https://github.com/google/transit/pull/432) & [PR#434](https://github.com/google/transit/pull/434)）。あなた方の貢献にはいつも感謝しています！ 

**Santiago Toso**

MobilityData の Slack に参加し、複数の会話を活発にしてくれました。ご参加いただけて嬉しいです。 

**Kayla Firestack**

なんて素晴らしいのでしょう！Kayla は [最初の PR](https://github.com/google/transit/pull/431) で編集上の誤りを指摘し、google/transit における40人目のユニークな PR 投稿者となりました！ 

**Juliet Eldred**

GTFS ドキュメントの不整合を [最初の issue](https://github.com/google/transit/issues/435) で指摘していただきありがとうございます！このような貢献が、仕様をよりアクセスしやすいものにする助けとなります。

## 📢 お知らせ {: #announcements}


**[GTFS/GBFS コミュニケーション調査](https://form.typeform.com/to/cSlJFtVc)**

短時間で参加できる GTFS/GBFS コミュニティ調査にご協力ください！

わずか4分の時間をいただければ、GTFS/GBFS コミュニティの未来に大きな影響を与えることができます！

## 🗳️ 現在投票中 {: #currently-voting}


**[GTFS Trip-Modifications #403](https://github.com/google/transit/pull/403)**

便の変更(Trip-Modifications)は、便(trip)のルート形状(shape)を変更したり、運行されない停留所等(stop)を削除したり、場合によっては一時的な停留所等(stop)を追加したりするための変更です。[便の変更(Trip-Modifications)は主に迂回路の可視化やリアルタイム予測の更新に使用されます。](https://blog.transitapp.com/how-transit-and-swiftly-put-bus-detours-on-the-map/)



* 実験的フィールドの投票は 2024-03-06 23:59:59 UTC に終了します。

## 📂 アクティブな提案 {: #active-proposals}


**[GTFS-Flex [投票版] #433 ](https://github.com/google/transit/pull/433)**

GTFS-Flex の提案は、乗客が旅程プランナー上でデマンド型サービスを発見できるようにするものです。これまでに複数回の議論を経ており、現在はコントリビューターによるレビュー中です。 



* このPRは **「PR#388 の投票版」** であり、PR#388 までの変更内容と完全に一致しています。唯一の違いは、このPRが現在の仕様に基づいているのに対し、PR#388 は昨年7月時点の仕様に基づいている点です。
* 投票に向けた初期導入者からのサポートリソースは近日中に公開される予定です。

**[FeedHeader に Feed Version と GTFS url を追加 #434](https://github.com/google/transit/pull/434)**

この Realtime の提案は、GTFS Realtime データと併用する GTFS スケジュールファイルに関する情報を提供するために、feed header に2つの新しいフィールドを追加するものです。feed_version は GTFS の feed_info.txt ファイル内の feed_version と一致し、GTFS_url は GTFS ファイルの URL を指します。この変更を実装する意思のあるプロデューサーが必要です。

**[route ベースの fare_rules における stops.zone_id の条件付き要件の明確化 #432](https://github.com/google/transit/pull/432)** \
この提案は、stops.zone_id の条件付き要件を修正し、停留所(stop)が trip_ids にのみ割り当てられており、その route_id が fare_id と route_id のみが定義された fare_rules.txt のレコードに存在する場合（route ベースの運賃）のシナリオを許容するようにするものです。

### その他の公開中の提案 {: #other-open-proposals}


[[GTFS-Fares v2] fare_leg_rules.txt に rule_priority を追加 #418](https://github.com/google/transit/pull/418)

[[GTFS-Fares v2] 同一チケット商品/チケットメディアの乗り継ぎ挙動 #423](https://github.com/google/transit/pull/423)<span style="text-decoration:underline;"> </span>

[[GTFS-Fares v2] 明確化: チケット商品の定義 #426](https://github.com/google/transit/pull/426)

## 🔥 最も活発な議論 {: #most-active-conversations}


**[[ガバナンス] フェーズ2: 投票とレビューの強化 #436](https://github.com/google/transit/issues/436)**

この GitHub Issue は、GTFS ガバナンスを強化するための継続的な取り組みの一環であり、特に 2023年12月に公開された [段階的計画](https://github.com/google/transit/issues/413) のフェーズ2で示された仕様改訂プロセスに焦点を当てています。変更点には以下が含まれます：



* 早期の投票段階の追加
    * MobilityData が議論のために2つの投票代替案を提案
* 後期の投票段階における多数決投票の導入
* 投票要件を3票から5票に増加
* レビューガイドラインの正式化
* Pull Request 前の手順の正式化
* 主要な役割と責任の正式化

**[translations.txt で使用される言語コードデータ標準に関する明確化 #435](https://github.com/google/transit/issues/435)**

Trillium の Juliet Eldred が、翻訳に使用されるコードデータ標準に関するドキュメントの不整合を指摘し、どこが信頼できる情報源なのかをコミュニティに明確化してほしいと提起しました。 

**[相乗り路線の統合 #430](https://github.com/google/transit/issues/430)**

フランスの National Access Point (NAP) の Aurélien が、相乗り路線をバス路線のようにモデル化する提案について議論するために GitHub Issue を立ち上げました。具体的な停留所等(stop)や目的地を持ちますが、この場合は一般のドライバーが運転し、運賃からの金銭的インセンティブを受け取るか、乗客と費用を分担することができます。議論のために2つの異なる解決策が提示されています。 

**[Slack の #gtfs-realtime での会話](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1706193156057089)**

Stefan Begerad が、TripUpdate エンティティをフィード内でどのくらいの期間保持すべきかについて、2つの具体的なケースを念頭に置いてコミュニティに助言を求めました。コミュニティは仕様を参照し、Stefan を助けるための有益な見解を提供しました。 

**[Slack の #gtfs-realtime での会話 (2)](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1708286157675929)**

Marcy が、各種経路検索アプリにおけるリアルタイム運行情報(alert)変数の表示に関する参照表やチャートを探しており、さらにこれらの変数を理解するためのベストプラクティスや追加リソースを求めました。コミュニティは Transit と Google のドキュメントを最も近いリソースとして紹介しました。 

**[Slack の #gtfs-realtime での会話](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1707413698834939)**

Santiago Toso が「CTA（シカゴ交通局）の gtfs-rt データが利用可能かどうか知っている人はいますか？」と質問しました。コミュニティは複数の有益なリソースへのリンクを共有し、CTA の Will Anderson が支援を申し出ました。

## 📅 今後のイベント {: #upcoming-events}


**[GTFS-Fares v2 月例会議](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057)** | 2024年3月26日 午前11時（EDT）

トピック : 未定

**[GTFS ガバナンス - 投票とレビューの強化](https://www.eventbrite.ca/e/gtfs-governance-enhancing-voting-and-reviews-11-am-edt-tickets-852341726047)** (1) | 2024年3月13日 午前11時（EDT）  

トピック: 提案された変更の概要と議論

**[GTFS ガバナンス - 投票とレビューの強化](https://www.eventbrite.ca/e/gtfs-governance-enhancing-voting-and-reviews-8-pm-edt-tickets-852357152187)** (2) | 2024年3月13日 午後8時（EDT）  

トピック: 提案された変更の概要と議論

## 💬 GTFS コミュニティに参加する {: #join-the-gtfs-community}


**[GitHub: google/transit](https://github.com/google/transit)**: コミュニティとアイデアを共有しましょう！公式の GTFS GitHub リポジトリに参加してください。

**[GTFS-changes](https://groups.google.com/g/gtfs-changes)**: 最新情報をすぐに入手できます。GTFS-changes Google グループに参加して、新しいプルリクエストや投票に関する情報を受け取りましょう。 

**[GTFS-realtime](https://groups.google.com/g/gtfs-realtime)**: Realtime に関するすべてを話し合い、最新情報を入手しましょう。このグループでは GTFS Realtime について議論し、質問をしたり、変更を提案したりしています。

**[GTFS.org](https://gtfs.org/)**: 公式の GTFS ドキュメントサイトです。ここでは GTFS に関する最新のリソースを頻繁に更新しています。 

**[MobilityData Slack](https://share.mobilitydata.org/slack)**: GTFS について質問がありますか？それともコミュニティとつながりたいですか？GTFS Slack の会話に参加してください。1,300人以上のモビリティ愛好者がチャンネルで活動しており、質問に素早く答えてもらえる素晴らしい場所です。 

**GTFS Digest 第3号をお読みいただきありがとうございます！2024年以降も最新の GTFS 情報をお届けできることを楽しみにしています。**
