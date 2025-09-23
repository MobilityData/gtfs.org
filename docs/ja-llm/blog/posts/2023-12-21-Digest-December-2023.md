---
draft: false
pin: false
date:
  created: 2023-12-21
title: GTFS Digest - March 2024
description: Read this month's digest and stay up to date on GTFS development.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---
# [GTFS Digest] 2023年12月 - 2024年に向けて知っておくべきこと {: #gtfs-digest-december-2023-what-you-need-to-know-before-2024}

今号では、主要な貢献者への感謝、最近採択された提案の詳細、進行中の議論、今後のイベントについてご紹介します。また、重要なツールやGTFSコミュニティとつながる方法にもスポットを当てています。2024年に向けて最新情報を把握するためにぜひご覧ください。


<!-- more -->

**GTFS Digest** へようこそ。この月刊リソースは、[MobilityData](https://mobilitydata.org/) によって作成され、GTFSの最新動向をお届けします。

GTFSはコミュニティの貢献に支えられています。次号のダイジェストに向けて、皆さまの取り組みを [specifications@mobilitydata.org](mailto:specifications@mobiltydata.org) までぜひお寄せください。

この初回リリースに関する皆さまのご意見を大切にしています。[こちらのフォーム](https://forms.gle/GGefktvemnJD5Q9g8) にご記入いただき、このツールを改善し、最大限に活用できるようご協力をお願いいたします。

## 🏅 コントリビューターへの感謝 {: #contributor-shoutouts}


**gcamp**

* [GTFS Trip-Modifications](https://github.com/google/transit/pull/403) 提案を Pull Request 段階に移行し、コミュニティと協力して投票段階への進行を促進しました。これはまさに効果的なアドボカシーの実践です！

**barbagus**

* 初めての [issue #409](https://github.com/google/transit/issues/409) を非常に明確かつ詳細に記述してくれたことに感謝します。とても見事な表現でした！

**abyrd**

* 進行中の Pull Request に対して緻密なレビューを行ってくれたことに敬意を表します。[これはまさに貴重な貢献です](https://github.com/google/transit/pull/403#issuecomment-1841006022)!

**ponlawat-w**

* 初めての PR [#412](https://github.com/google/transit/pull/412) において、編集上の修正をコミュニティに提起してくれたことに感謝します。

## 🚀 最近採択されたもの {: #recently-adopted}


**[ベストプラクティス: データセット公開ガイドラインおよび全ファイルに関する推奨事項の追加 #406](https://github.com/google/transit/pull/406)**

この提案は、[データセット公開および一般的な実務ガイドライン](https://gtfs.org/schedule/best-practices/#dataset-publishing-general-practices)と、[全ファイルに関する推奨事項](https://gtfs.org/schedule/best-practices/#all-files)を GTFS 仕様のリファレンスファイルに追加することに焦点を当てています。これは、issue [#396](https://github.com/google/transit/issues/396) で示された、ベストプラクティスを GTFS 仕様に統合する第2段階を表しています。

**[[GTFS-Fares v2] networks.txt & route_networks.txt の追加 #405](https://github.com/google/transit/pull/405)**

GTFS-Schedule と GTFS-Fares v2 のデータは、必ずしも同じ組織や部門によって作成されるわけではなく、同じ頻度で更新されるわけでもありません。この提案により、運賃データと運行データを別々に作成することが可能になります。

## 🗳️ 現在投票中 {: #currently-voting}


**[ベストプラクティスの内容を仕様に統合したため削除 (フェーズ2) #60](https://github.com/MobilityData/GTFS_Schedule_Best-Practices/pull/60)**

[PR #406](https://github.com/google/transit/pull/406) によって特定のベストプラクティスが直接 GTFS 仕様に統合されたため、この提案ではベストプラクティス文書から重複する内容を削除し、単一の信頼できる情報源に統合します。**投票は 2023-12-26 に締め切られます。**

## 📂 アクティブな提案 {: #active-proposals}


**[GTFS-Flex #388](https://github.com/google/transit/pull/388)**

GTFS-Flex の提案は、乗客が旅程プランナー上でデマンド型サービスを発見できるようにするものです。これまでに複数回の議論を経ており、現在はコントリビューターによるレビュー中です。

* 直近の GTFS-Flex ワーキンググループ会議は 2023年11月1日に開催されました:
    * stop_times.txt に専用の外部キーを設けることに合意しました (google/transit#398)。
    * location_groups.txt の使用に戻し、location.geojson の id 参照を削除しました (google/transit#397)。
    * hail-and-ride/タクシー類似のユースケースに対して pickup_type=3 の制限を維持しました (google/transit#400)。
* [未解決の課題はこちら](https://github.com/google/transit/pull/388#issuecomment-1805958429) および [こちら](https://github.com/google/transit/pull/388#pullrequestreview-1766734999) をご確認ください。

**[GTFS Trip-Modifications #403](https://github.com/google/transit/pull/403)**

便の変更(Trip-Modifications)は、便(trip)のルート形状(shape)を変更したり、運行されない停留所等(stop)を削除したり、場合によっては一時的な停留所等(stop)を追加するために行われます。[便の変更は主に迂回路の可視化やリアルタイム予測の更新に使用されます。](https://blog.transitapp.com/how-transit-and-swiftly-put-bus-detours-on-the-map/)

**[[GTFS-Fares v2] fare_leg_rules.txt に rule_priority を追加 #418](https://github.com/google/transit/pull/418)**

rule_priority フィールドは、乗車区間(leg)に適用される一致ルールの優先順位を定義し、特定のルールが他のルールより優先されることを可能にします。このフィールドの存在はトリガーとして機能し、空のセマンティクスを「除外条件」から「マッチングに影響しない」に切り替えます。

## 🔥 最も活発な議論 {: #most-active-conversations}


**[GTFSガバナンスの修正: 段階的計画 #413](https://github.com/google/transit/issues/413)**

MobilityData は、正式な改正プロセスと非公式なガバナンスの両面を改善するための改良を提案しています。このイシューには、コミュニティで共通に指摘されている問題と、提案された段階的な計画が含まれています。

**[ルートレベルでの必須の交通手段の指定は柔軟性に欠ける可能性がある（マルチモーダルルート） #409](https://github.com/google/transit/issues/409)**

一部のルートは、便(trip)によって列車とバスの両方で運行されるように設計されています。現在のGTFS仕様では、「交通手段の種類」はルート・路線系統(route)の属性であり、そのためこのようなユースケースをうまく扱うことができません。

**[Slack の #mobilitydata での会話](https://mobilitydata-io.slack.com/archives/C0J4TJY8L/p1702318548285739)**

Melinda は、フィード利用者やアプリ開発者向けのベストプラクティスについて意見を求めています。彼女は次のように尋ねています：「これまでのベストプラクティスはすべて GTFS 作成者向けですよね？ GTFS データセットを扱う開発者向けの別のベストプラクティスを考えた人はいますか？」

**[Slack の #gtfs での会話](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1701735882006169)**

Steve は次の質問に答えるための助けを求めています：「GTFS ファイルを他の形式に変換せずに地図上で可視化できるツールやサービスを知っている人はいますか？」

## 📅 今後のイベント {: #upcoming-events}


**[Trip-Modifications - 提案の議論（会議）](https://www.eventbrite.ca/e/gtfs-flex-working-group-meeting-implementation-testing-tickets-780184602147)** | 2024年1月10日 午前11時（EST）

**[GTFS-Flex - ワーキンググループ会議](https://www.eventbrite.ca/e/gtfs-flex-working-group-meeting-implementation-testing-tickets-780184602147)** | 2024年1月17日 午前10時（EST）

## 🛠️ ツールの更新 {: #tools-update}


**[新リリース: Canonical GTFS Schedule Validator](https://gtfs-validator.mobilitydata.org/)**

このバリデータは最新の仕様追加に対応しており、検証レポートに新しいサマリーセクションが追加されています。そこでは、フィードに Blocks、Frequencies、または Fares v2 といった GTFS コンポーネントが含まれているかどうかを確認できるタグが表示されます。

## GTFS コミュニティに参加する {: #join-the-gtfs-community}


**[GitHub: google/transit](https://github.com/google/transit)**: アイデアをコミュニティと共有しましょう！公式の GTFS GitHub リポジトリに参加してください。

**[GTFS-changes](https://groups.google.com/g/gtfs-changes)**: 最新情報をすぐに入手できます。GTFS-changes Google グループに参加して、新しいプルリクエストや投票に関する情報を受け取りましょう。

**[GTFS-realtime](https://groups.google.com/g/gtfs-realtime)**: Realtime に関するすべてを話し合い、最新情報を入手しましょう。このグループでは GTFS Realtime について議論し、質問をしたり、変更を提案したりしています。

**[GTFS.org](https://gtfs.org/)**: 公式の GTFS ドキュメントサイトです。ここでは GTFS に関する最新のリソースを頻繁に更新しています。

**[MobilityData Slack](https://share.mobilitydata.org/slack)**: GTFS について質問がある、またはコミュニティとつながりたいですか？GTFS Slack の会話に参加してください。1,300 人以上のモビリティ愛好者がチャンネルで活動しており、質問に素早く答えてもらえる素晴らしい場所です。

**最初の GTFS Digest をお読みいただきありがとうございます！2024 年以降も最新の GTFS 情報をお届けできることを楽しみにしています。**
