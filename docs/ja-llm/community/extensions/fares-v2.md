# GTFS-Fares v2 {: #gtfs-fares-v2}


Fares v2 は、[Fares v1](../../../documentation/schedule/examples/fares-v1/) の制約に対応することを目的とした GTFS Schedule の拡張プロジェクトです。

Fares v2 が表現することを計画している主な概念は以下の通りです。

- チケット商品 (例: 乗車券や定期券)
- 乗客カテゴリ (例: 高齢者や子供)
- チケットメディア (例: 交通系ICカード、紙の乗車券、非接触型銀行カード)
- 運賃上限制度 (fare capping)

これらの概念により、事業者はゾーン制、時間依存制、複数事業者間の運賃をモデル化することができるようになります。この拡張プロジェクトは段階的に採用が進められています。  

GTFS で正式に採用された内容を用いてどのようなモデル化が可能かを示す [例はこちら](../../../documentation/schedule/examples/fares-v2) で確認できます。  

Fares v2 は Fares v1 と技術的な競合がないため、同じデータセット内で両方を実装することができます。利用者は、どちらのバージョンを使用するかを互いに独立して選択することができます。Fares v2 の採用が進み、十分に支持されれば、将来的に Fares v1 は廃止される可能性があります。  

[完全な提案はこちら](https://share.mobilitydata.org/gtfs-fares-v2){ .md-button .md-button--primary }

## 会話に参加する {: #participate-in-the-conversation}

Slack チャンネルや定期的なワーキンググループの会議に参加することで、Fares v2 に関する最新情報を入手し、議論に参加することができます。

[Slack の #gtfs-fares に参加する](https://share.mobilitydata.org/slack){ .md-button .md-button--primary} [会議スケジュールを見る](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057){ .md-button .md-button--primary } [会議メモを見る](https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit){ .md-button .md-button--primary }

## 最初の採用者 {: #first-adopters}


🎉 Fares v2 の最初の採用者に感謝します！公式仕様に追加するための公開投票が開始される前に、少なくとも1つのデータ提供者と1つの利用者が実験的な機能の実装を約束しなければなりません。これらの組織は、GTFS が進化し続けることを確実にするために、実験的な変更に多大な時間と労力を投資しています。

- 提供者: <a href="https://www.interline.io/" target="_blank">Interline</a>、<a href="https://www.mta.maryland.gov/developer-resources" target="_blank">Maryland Department of Transportation</a>、<a href="https://dot.ca.gov/cal-itp/cal-itp-gtfs" target="_blank">Cal-ITP</a>、<a href="https://trilliumtransit.com/" target="_blank">Trillium Solutions</a>、<a href="https://www.itoworld.com/" target="_blank">ITO World</a>、<a href="https://www.mbta.com/" target="_blank">MBTA</a>、<a href="http://www.pvta.com/" target="_blank">PVTA</a>  
- 利用者: <a href="https://transitapp.com/" target="_blank">Transit</a>、<a href="https://www.apple.com/">Apple Maps</a>

## 採用トラッカー {: #adoption-tracker}

### 現在 {: #current}


<iframe class="airtable-embed" src="https://airtable.com/embed/shrZzYzPYao7iExlW?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

[変更をリクエスト](https://airtable.com/shr8aT0K9bpncmy0V){ .md-button .md-button--primary } [組織を追加（利用者）](https://airtable.com/shr5B6Pl1r9KH9qMX){ .md-button .md-button--primary } [組織を追加（提供者）](https://airtable.com/shrn0Afa3TPNkOAEh){ .md-button .md-button--primary }

### 今後の予定 {: #future}

<iframe class="airtable-embed" src="https://airtable.com/embed/shrUrgZTO1noUF66R?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

[今後の予定を追加](https://airtable.com/shrvnI40zuFXmDsQI){ .md-button .md-button--primary }

## 検討中の Fares v2 機能 {: #fares-v2-features-under-discussion}


<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px;"></iframe>

## 履歴 {: #history}


- **2017年**: 業界調査とデータモデリング
- **2021年10月**: <a href="https://github.com/google/transit/pull/286#issue-1026848880" target="_blank">基本実装が作成され共有される</a>
- **2021年12月**: <a href="https://github.com/google/transit/pull/286#issuecomment-990258396" target="_blank">公開投票 #1 → 否決</a>
- **2022年3月**: <a href="https://github.com/google/transit/pull/286#issuecomment-1080716109" target="_blank">公開投票 #2 → 否決</a>
- **2022年5月**: <a href="https://github.com/google/transit/pull/286#issuecomment-1121392932" target="_blank">公開投票 #3 → 可決</a>
- **2022年8月**: <a href="https://github.com/google/transit/issues/341" target="_blank">Fares v2 の次の段階に関するコミュニティディスカッション開始</a>
- **2022年11月**: <a href="https://github.com/google/transit/pull/355" target="_blank">チケットメディアに関するドラフトのプルリクエストが公開され、フィードバック募集</a>
- **2022年12月**: <a href="https://github.com/google/transit/issues/341#issuecomment-1339947915" target="_blank">コミュニティが優先的に反復すべき機能の順位付けを決定</a>
- **2023年3月**: <a href="https://github.com/google/transit/pull/355#issuecomment-1468326858" target="_blank">チケットメディアが可決</a>
- **2023年7月**: <a href="https://github.com/google/transit/pull/357#issuecomment-1653561813" target="_blank">時間・曜日によって変動する運賃が可決</a>
- **2023年11月**: <a href="https://github.com/google/transit/pull/405#issuecomment-1830665141" target="_blank">ネットワークを定義する専用ファイルが導入</a>
