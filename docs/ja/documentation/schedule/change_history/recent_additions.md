# GTFS scheduleの変更

GTFS スケジュール リファレンスは、固定されたものではありません。GTFS を使用する交通機関、開発者、その他の関係者のコミュニティによって開発および保守されているオープン仕様です。GTFS データのプロデューサーとコンシューマーのこのコミュニティは、新しい機能を有効にするために仕様を拡張するための提案をすることが期待されています。

GTFS に貢献するには、[GTFS スケジュール修正プロセス](../../../../community/governance/gtfs_schedule_amendment_process) を読み、GTFS Github リポジトリ (<a href="https://github.com/google/transit" target="_blank">google/transit</a>) のオープンな <a href="https://github.com/google/transit/issues" target="_blank">問題</a> と <a href="https://github.com/google/transit/pulls" target="_blank">プル リクエスト</a> での議論に従ってください。 ![](../../../assets/mark-github.svg)

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add trip-to-trip transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for GTFS Schedule.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## 最近採択された提案 &ensp;<img src="../../../../assets/pr-merged.svg" style="height:1em;"/>

最近統合された提案は、[公式GTFS scheduleリファレンス](../../reference) の機能になりました。詳細については、完全な [改訂履歴](../revision_history) を参照してください。

<div class="row">
<div class="leftcontainer">
<h3 class="title"><a href="https://github.com/google/transit/pull/433" class="no-icon" target="_blank">GTFS Flex を採用</a></h3>
<p class="maintainer">#433 by <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> は 2024 年 3 月 19 日に統合されました</p>
</div>
<div class="featurelist">
<ul>
<li><a href="../../../../community/extensions/flex" class="no-icon" target="_blank">GTFS-Flex 提案</a> により、乗客は旅行プランナーで需要に応じたサービスを発見できます</li>
<li>複数のファイルが追加されました仕様、GeoJson を GTFS に統合する locations.geojson を含む </li>
</ul>
</div>
</div>

<div class="row">
<div class="leftcontainer">
<h3 class="title"><a href="https://github.com/google/transit/pull/405" class="no-icon" target="_blank">networks.txt と route_networks.txt を追加</a></h3>
<p class="maintainer">#406 by <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> は 2023 年 11 月 28 日にマージされました</p>
</div>
<div class="featurelist">
<ul>
<li>2 つの新しいファイル <code>networks.txt</code> と <code>route_networks.txt</code> を追加して、運賃に関連付けられたルート</li>
<li>スケジュールと運賃ファイルを区別できるように、<code>routes.network_id</code> の代替手段を提供します</li>
</ul>
</div>
</div>

<div class="row">
<div class="leftcontainer">
<h3 class="title"><a href="https://github.com/google/transit/pull/406" class="no-icon" target="_blank">ベスト プラクティス: <br>すべてのファイルに対するデータセット<br>公開ガイドラインと実践推奨事項を追加します</a></h3>
<p class="maintainer">#406 by <a href="https://github.com/Sergiodero" class="no-icon" target="_blank">Sergiodero</a> は 2023 年 11 月 16 日にマージされました</p>
</div>
<div class="featurelist">
<ul>
<li>GTFS の 2 つのセクションを追加します仕様のベスト プラクティス: すべてのファイルに対するデータセット公開ガイドラインと実践推奨事項</li>
<li>Google の transitfeed ツールのマージ関数への参照を更新し、代わりにマージ ツールのリストを参照するようにしました</li>
</ul>
</div>
</div>

<div class="row">
<div class="leftcontainer">
<h3 class="title"><a href="https://github.com/google/transit/pull/386" class="no-icon" target="_blank">ベスト プラクティス: 推奨プレゼンスを追加</a></h3>
<p class="maintainer">#386 by <a href="https://github.com/emmambd" class="no-icon" target="_blank">emmambd</a> は 2023 年 8 月 1 日にマージされました</p>
</div>
<div class="featurelist">
<ul>
<li>RFC に準拠する新しい推奨プレゼンスを仕様に追加しました規則</li>
<li>フィールドまたはファイルが必須ではないことを明確に記述できますが、追加することは検討すべきベスト プラクティスです</li>
<li>GTFS ベスト プラクティスに基づいて、複数のファイルとフィールドの情報を更新して、推奨される存在を反映させます</li>
</ul>
</div>
</div>

<div class="row">
<div class="leftcontainer">
<h3 class="title"><a href="https://github.com/google/transit/pull/357" class="no-icon" target="_blank">時間または曜日による変動運賃の追加</a></h3>
<p class="maintainer">#357 by <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> は 2023 年 7 月 27 日にマージされました</p>
</div>
<div class="featurelist">
<ul>
<li>時間変動運賃は、<a href="../../../../community/extensions/fares-v2">GTFS 運賃 v2 拡張提案</a> の一部として開発された重要な機能です</li>
<li>時間帯または曜日に基づいて異なる運賃を表現できます。ピーク料金やオフピーク料金などの曜日</li>
<li>新しいファイル <code>timeframes.txt</code> を追加して、料金が適用される時間帯を定義します</li>
<li><code>fare_leg_rules.txt</code> を <code>from_timeframe_id</code> と <code>to_timeframe_id</code> で拡張して、区間の開始または終了が指定された時間枠内にある場合にのみ料金区間ルールが適用されることを指定します</li>
</ul>
</div>
</div>

<div class="row">
<div class="leftcontainer">
<h3 class="title"><a href="https://github.com/google/transit/pull/355" class="no-icon" target="_blank">料金メディアを追加します</a></h3>
<p class="maintainer">#355 by <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> は 2023 年 3 月 14 日に統合されました</p>
</div>
<div class="featurelist">
<ul>
<li>運賃メディアは、<a href="../../../../community/extensions/fares-v2">GTFS 運賃 v2 拡張提案</a> の重要な要素です</li>
<li>乗客が乗車を検証するために使用できるものを表します (例:交通カード、モバイルアプリ、または非接触型銀行カードを使用したタップして支払う)</li>
<li>運賃商品は特定の運賃メディアに関連付けることができます (例: 月間パスは交通カードでのみ利用できます)</li>
<li>運賃商品の価格は運賃メディアに基づいて定義できます (例: モバイルアプリ経由で購入するとチケットが安くなります)</li>
</ul>
</div>
</div>

<div class="row"></div>