# GTFS-Fares v2 

Fares v2は、[Fares v1](../../../documentation/schedule/examples/fares-v1/) の制限に対処することを目的としたGTFS schedule拡張プロジェクトです。

Fares Fares v2で表現する予定の主な概念は次のとおりです。

- チケット商品(チケットやパスなど)
- 乗客カテゴリ (高齢者や子供など)
- 運賃メディア(交通パス、紙のチケット、非接触型銀行カードなど)
- 運賃上限

これらの概念により、データ作成者はゾーンベース、時間依存、および事業者間運賃をモデル化できるようになります。この拡張プロジェクトは、反復的に採用されています。 

GTFS で公式に採用されているものを使用してモデル化できる内容を示す [例](../../../documentation/schedule/examples/fares-v2) をここで確認できます。

プロデューサーは、 Fares v2 と Fares v1の間に技術的な競合がないため、同じデータセットにFares v2 を実装してもよい。コンシューマーは、他のバージョンとは関係なく、どちらのバージョンを使用するかを選択できます。 Fares v2が採用され、十分な支持が得られれば、将来的に Fares v1 は廃止されるしてもよい [提案の全文を見る](https://share.mobilitydata.org/gtfs-fares-v2){ .md-button .md-button--primary}

## 会話に参加する
Slack チャネルや定期的なワーキング グループ ミーティングに参加することで、 Fares v2に関するdate情報を入手し、議論に参加できます。

[Slack で #gtfs-fares に参加する](https://share.mobilitydata.org/slack){ .md-button .md-button--primary} [ミーティング スケジュールを見る](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057){ .md-button .md-button--primary} [会議メモを参照](https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit){ .md-button .md-button--primary}

## 最初の採用者

🎉 Fares v2 の最初の採用者に感謝！公式仕様に追加するための公開投票が開始される前に、少なくとも1人のデータプロデューサーと 1 人のコンシューマーが実験的な機能を実装することを約束するしなければならない。これらの組織は、GTFS が進化し続けるように、実験的な変更に多大な時間と労力を費やしています。

- プロデューサー: <a href="https://www.interline.io/" target="_blank">Interline</a> 、<a href="https://www.mta.maryland.gov/developer-resources" target="_blank">メリーランド州運輸省</a>、 <a href="https://dot.ca.gov/cal-itp/cal-itp-gtfs" target="_blank">Cal-ITP</a> 、 <a href="https://trilliumtransit.com/" target="_blank">Trillium Solutions</a> 、 <a href="https://www.itoworld.com/" target="_blank">ITO World</a> 、 <a href="https://www.mbta.com/" target="_blank">MBTA</a> 、 <a href="http://www.pvta.com/" target="_blank">PVTA</a> 
- コンシューマー: <a href="https://transitapp.com/" target="_blank">Transit</a> 、 <a href="https://www.apple.com/">Apple Maps</a> 

## 採用トラッカー
### 現在

<iframe class="airtable-embed" src="https://airtable.com/embed/shrZzYzPYao7iExlW?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

[Request a change](https://airtable.com/shr8aT0K9bpncmy0V){ .md-button .md-button--primary} [Add your organization (consumers)](https://airtable.com/shr5B6Pl1r9KH9qMX){ .md-button .md-button--primary} [Add your organization (producers)](https://airtable.com/shrn0Afa3TPNkOAEh){ .md-button .md-button--primary}

### 将来
<iframe class="airtable-embed" src="https://airtable.com/embed/shrUrgZTO1noUF66R?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

[Add your future plans](https://airtable.com/shrvnI40zuFXmDsQI){ .md-button .md-button--primary}

## 議論中のFares v2の機能

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px;"></iframe>

## 履歴

-**2017**: 業界調査とデータモデリング
-**2021年10月**: <a href="https://github.com/google/transit/pull/286#issue-1026848880" target="_blank">ベース実装の草案作成と共有</a>
-**2021年12月**: <a href="https://github.com/google/transit/pull/286#issuecomment-990258396" target="_blank">オープン投票#1 → 不成立</a>
-**2022年3月**: <a href="https://github.com/google/transit/pull/286#issuecomment-1080716109" target="_blank">オープン投票#2 → 不成立</a>
-**2022年してもよい**: <a href="https://github.com/google/transit/pull/286#issuecomment-1121392932" target="_blank">オープン投票#3 → 成立</a>
-**2022年8月**: <a href="https://github.com/google/transit/issues/341" target="_blank">Fares v2の次のフェーズに関するコミュニティの議論開始</a>
-**2022年11月**: <a href="https://github.com/google/transit/pull/355" target="_blank">運賃メディアドラフトのプルリクエストがフィードバック用に公開</a>
-**2022年12月**: <a href="https://github.com/google/transit/issues/341#issuecomment-1339947915" target="_blank">コミュニティが機能のスタックランク付け順序を特定し、反復の優先順位を決定</a>
-**2023年3月**: <a href="https://github.com/google/transit/pull/355#issuecomment-1468326858" target="_blank">運賃メディアパス</a>
-**2023年7月**: <a href="https://github.com/google/transit/pull/357#issuecomment-1653561813" target="_blank">時間/日によって異なる運賃パス</a>
-**2023年11月2023**: <a href="https://github.com/google/transit/pull/405#issuecomment-1830665141" target="_blank">ネットワークを定義するための専用ファイル</a>
