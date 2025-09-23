---
draft: false
pin: false
date:
  created: 2024-02-01
title: GTFS Digest - January 2024
description: Read this month's digest and stay up to date on GTFS development.
authors: 
  - mobilitydata
categories:
  - GTFS Digest
---
# [GTFS Digest] 2024年1月 - 年初から最新情報を把握しましょう {: #gtfs-digest-january-2024-start-the-year-in-the-know}

保留中のベストプラクティスを GTFS 仕様に移行し、可視性を高め、価値ある改善についてコミュニティで議論できるようにします。GTFS ガバナンスの改善、短期的な運行変更、GTFS-realtime の活用、エンティティ・リレーションシップ・モデル(ERD)の採用についての議論にぜひご参加ください。 


<!-- more -->

GTFS Digest は [MobilityData](https://mobilitydata.org/) によって毎月発行されるリソースで、GTFS に関する最新の動向をまとめています。  

皆さまからのフィードバックを大切にしています。私たちの取り組みについてぜひご意見をお聞かせください。[こちらのフォーム](https://forms.gle/GGefktvemnJD5Q9g8)にご記入いただき、このツールの可能性を最大限に引き出すためにご協力をお願いいたします。

## 🏅 コントリビューターへの感謝 {: #contributor-shoutouts}


**Martijn Vanallemeersch**

Slack に参加し、初日に[列車の分割運行に関する活発な議論](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1704902620455499)を持ちかけてくださいました。 

**Marcy Jaffe**

いつも通り、小規模な交通事業者に目を向けてくださり、[GTFS validator に関する重要なポイント](https://mobilitydata-io.slack.com/archives/C03E10N96QL/p1703074450467169)を共有していただきありがとうございます。 

**doconnoronca**

[短期的な運行変更についての明確化を求めてくださったこと](https://github.com/google/transit/issues/425)に感謝します。貴重なやり取りを生み出してくださいました。

## 📢 お知らせ {: #announcements}


**[未解決のベストプラクティスに関する issue と PR の移行 #421](https://github.com/google/transit/issues/421) **

GTFS ベストプラクティスを仕様に移行する一環として、MobilityData は未解決の issue と PR をすべて GTFS 仕様リポジトリに移行しました。[Issue #421](https://github.com/google/transit/issues/421) では、移行プロセスの詳細な説明と今後の提案されるステップについて説明しています。これにより、保留中のベストプラクティスに関する提案により多くの注目を集め、議論を再開し、コミュニティが価値があると考える改善を前進させることを期待しています。

## 📂 アクティブな提案 {: #active-proposals}


**[GTFS-Flex #388](https://github.com/google/transit/pull/388)** 

GTFS-Flex の提案は、乗客が旅程プランナー上でデマンド型サービスを発見できるようにするものです。これまでに複数回の議論が行われ、現在はコントリビューターによるレビュー中です。 



* 直近の GTFS-Flex ワーキンググループ会議は 2024年1月17日に開催されました:
    * location_groups の正規化を別ファイルに追加することに合意
    * ファイル名に関する合意:
        * locations.geojson - この名前を維持
        * 既存の location_groups.txt → location_group_stops.txt
        * 新しい正規化ファイル → location_groups.txt

**[GTFS Trip-Modifications #403](https://github.com/google/transit/pull/403)**

便の変更(Trip-Modifications)は、便(trip)のルート形状(shape)を変更したり、運行されない停留所等(stop)を削除したり、場合によっては一時的な停留所等(stop)を追加するために行われます。[便の変更は主に迂回路の可視化やリアルタイム予測の更新に使用されます。](https://blog.transitapp.com/how-transit-and-swiftly-put-bus-detours-on-the-map/)

初回の会議は 2024年1月10日に開催され、以下の項目が議論されました:



* GTFS-TripModifications と GTFS-NewTrips の比較
    * TripModifications によるデータサイズの利点が十分に大きいため、この解決策を進めるべきだという合意がありました。
* 停留所等(stop)の選択を停留所等の順序のみで行うか、stop_id を用いた選択を可能にする変更を行うか
    * stop_id を使用することの有用性（および生成の容易さ）が十分に強いため、変更を行うべきだという合意がありました。Transit が具体的な提案を作成する予定です。

**[[GTFS-Fares v2] fare_leg_rules.txt に rule_priority を追加 #418](https://github.com/google/transit/pull/418)**

rule_priority フィールドは、乗車区間(leg)に適用される一致ルールの優先順位を定義し、特定のルールが他のルールより優先されることを可能にします。このフィールドの存在はトリガーとして機能し、空のセマンティクスを「何でも除外」から「一致に影響しない」に切り替えます。

**[[GTFS-Fares v2] 同一チケット商品/チケットメディアでの乗り継ぎ挙動](https://github.com/google/transit/pull/423)** \
2つの乗車区間(leg)間の特定の乗り継ぎルールが、同一のチケット商品またはチケットメディアの使用を必要とするかどうかを区別する仕組みです。この仕組みにより、「チケットベースのシステム」（例: パスに類似した商品）と「ストアドバリューシステム」（例: 一般的な利用ごとの支払い商品）を区別することができます。 \

## 🔥 最も活発な議論 {: #most-active-conversations}


**[GTFSガバナンスの修正: 段階的計画 #413](https://github.com/google/transit/issues/413)**

MobilityData は、GTFS ガバナンスの正式な改正プロセスと非公式な側面の両方を改善するための改良を提案しています。この課題には、コミュニティが共通して特定した問題と、提案された段階的な計画が含まれています。


* フェーズ1は完了: 
    * [GitHub における Issue テンプレートの追加](https://github.com/google/transit/pull/417)
    * [GTFS Digest のリリース](https://github.com/google/transit/issues/419)
    * [GitHub におけるラベルの修正](https://github.com/google/transit/labels) 
* フェーズ2は進行中: 
    * 投票提案の開発中

**[エンティティ・リレーションシップモデルを決定的な参照として使用する #415](https://github.com/google/transit/issues/415)**

多くの議論はデータのフォーマット方法に関するものであり、構造自体の説明ではありません。誰もが参照できる明確で正式なモデルを持つことが提案されており、これにより議論が容易になり、混乱を避けることができます。提案は、dbdiagram.io のようなツールを使用して GTFS データモデルを視覚的に表現し、形式化することです。

**[なぜ短期的な運行変更は GTFS から除外することが推奨されているのか？ #425](https://github.com/google/transit/issues/425)**

この議論は、なぜ GTFS が1週間以内の運行変更に GTFS-realtime を使用することを推奨しているのかについてです。貢献者たちは、このバッファが利用者にフィードを消化する時間を与え、データ品質を確保し、エラーを修正し、新しい時刻表を適時に表示するのに役立つと述べています。また、多数の GTFS-realtime 更新を管理する方法についても議論しています。

**[Slack の #gtfs における会話](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1704902620455499)**

この議論では、Martijn が鉄道業界で一般的な運用方法をどのようにモデル化するかについてコミュニティに意見を求めています。それは「列車の分割、併合、連結」です。主に地域間または都市間の移動で使用されるこれらの運用は、列車の車両を分離または連結して異なる目的地に対応するものです。

**[Slack の #gtfs-realtime における会話](https://mobilitydata-io.slack.com/archives/C3D321CKB/p1704895869851189)**

Joel は次の質問に対する助けを求めています: 「前の停留所等(stop)で SKIPPED stop update があった場合、その更新はデータに更新がない次の停留所等(stop)にも伝播されるべきですか？」

**[Slack の #gtfs における会話](https://mobilitydata-io.slack.com/archives/C3FFFKX9C/p1705020453309289)**

Evan は次の質問をしています: 「frequencies.txt を使用し、特に Frequency-based service (exact_times=0) に従うフィードを作成・利用している人にとって、次の文言をどの程度厳密に解釈していますか？」

## 📅 今後のイベント {: #upcoming-events}


**[GTFS-Fares v2 月例会議](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057)** | 2024年1月23日 午前11時（EST）

議題 : バックログの確認 & 1つのルートの挙動

## GTFS コミュニティに参加する {: #join-the-gtfs-community}


**[GitHub: google/transit](https://github.com/google/transit)**: コミュニティとアイデアを共有しましょう！公式の GTFS GitHub リポジトリに参加してください。

**[GTFS-changes](https://groups.google.com/g/gtfs-changes)**: 最新情報をすぐに入手できます。GTFS-changes Google グループに参加して、新しいプルリクエストや投票に関する情報を受け取りましょう。 

**[GTFS-realtime](https://groups.google.com/g/gtfs-realtime)**: Realtime に関するすべてを話し合い、最新情報を入手しましょう。このグループでは GTFS Realtime について議論し、質問をしたり、変更を提案したりしています。

**[GTFS.org](https://gtfs.org/)**: 公式の GTFS ドキュメントサイトです。ここでは GTFS に関する最新のリソースを頻繁に更新しています。 

**[MobilityData Slack](https://share.mobilitydata.org/slack)**: GTFS について質問がありますか？それともコミュニティとつながりたいですか？GTFS Slack の会話に参加してください。1,300人以上のモビリティ愛好者がチャンネルで活動しており、質問に素早く答えてもらえる素晴らしい場所です。 

**GTFS Digest 第2版をお読みいただきありがとうございます！2024年以降も最新の GTFS 情報をお届けできることを楽しみにしています。**
