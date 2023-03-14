<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# GTFS-Fares v2

Fares v2 は、[Fares v1](/schedule/examples/fares-v1) の制限に対処することを目的とした GTFS スケジュール拡張プロ ジェクトです。

Fares v2が表現する予定の主なコンセプトは以下の通りです。

- 運賃商品（例：チケットとパス）
- ライダーカテゴリー（例：高齢者、子供）
- 運賃の支払い方法（例：銀行カード、クレジットカード）
- 運賃の上限設定

これらのコンセプトにより、データ作成者はゾーンベース、時間依存、および機関間運賃をモデル化することができます。この拡張プロジェクトは、反復して採用されている。

現在、採用されているFares v2の基本実装は、以下のユースケースで機能します。

- 交通機関の運賃を定義する
- 同じ運賃帯でのサービス位置の記述
- シングルレッグの旅に関するルールの作成
- 乗り換えのルール作成

[ここでは](/schedule/examples/fares-v2)、採用されたFares v2の基本実装を使って、どのようなモデリングが可能かを示す[例を](/schedule/examples/fares-v2)見ることができます。

Fares v1と技術的な矛盾がないため、制作者はFares v1と同じデータセットにFares v2を実装することができます。消費者はどちらのバージョンを使うか、独立して選択することができる。Fares v2が採用され、十分な支持を得た場合、Fares v1は将来的に非推奨となる可能性があります。

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/gtfs-fares-v2">提案の全文を見る</a>

## 進行中のFares v2作業

[運賃メディア（旧運賃コンテナ）の提案が通り](https://github.com/google/transit/pull/355#issuecomment-1468326858)、正式に仕様に採用されました

Fares V2ワーキングミーティングでは、今後、[時間変動運賃のモデリングと](https://github.com/google/transit/pull/357)採用に焦点を当てます。

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/slack">Slack の #gtfs-fares に参加する</a><a class="button no-icon" target="_blank" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057">ミーティングスケジュールを</a><a class="button no-icon" target="_blank" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit">見るミーティングノートを見る</a>

## ファーストアダプター

🎉 Fares v2 のファースト・アダプターに拍手!少なくとも1つのデータ生産者と1つの消費者は、公式仕様に追加するための一般投票が行われる前に、実験的な機能を実装することを約束しなければなりません。これらの組織は、GTFSが進化し続けるために、実験的な変更に多大な時間とエネルギーを投じています。

採用された基本実装の場合、ファーストアダプターは以下の通りです。

- プロデューサーの皆さん[Interline](https://www.interline.io/)、[Maryland Department of Transportation](https://www.mta.maryland.gov/developer-resources)、[Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- 消費者[Transit](https://transitapp.com/)

現在議論されているfare mediaナ機能については、ファーストアダプターは以下の通りです。

- 生産者[Interline](https://www.interline.io/)、 [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- 消費者[Apple](https://www.apple.com/)

<a class="button no-icon" target="_blank" href="https://docs.google.com/spreadsheets/d/1jpKjz6MbCD2XPhmIP11EDi-P2jMh7x2k-oHS-pLf2vI/edit?usp=sharing">Fares v2ファイルおよびフィールドの使用者を見る</a>

## 議論されている運賃の機能

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## 歴史

- **2017:**業界調査、データモデリング
- **2021年10月** [ベースとなる実装を起案し、共有](https://github.com/google/transit/pull/286#issue-1026848880)
- **2021年**12月[公開投票 #1 → 通過せず](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **2022**年3月：[公開投票#2 → 通過せず](https://github.com/google/transit/pull/286#issuecomment-1080716109)
- **2022**年5月：[公開投票#3→ 可決された](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **2022年8**月：[Fares v2の次のフェーズについてコミュニティで議論開始](https://github.com/google/transit/issues/341)
- **2022**年12月：[コミュニティは、イテレーションの優先順位を決めるために、機能のスタック順位を特定する](https://github.com/google/transit/issues/341#issuecomment-1339947915)
