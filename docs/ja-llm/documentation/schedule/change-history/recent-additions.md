# GTFS Schedule の変更 {: #gtfs-schedule-changes}


GTFS Schedule リファレンスは固定されたものではありません。代わりに、GTFS を利用する交通事業者、開発者、その他の関係者のコミュニティによって開発・維持されるオープンな仕様です。この GTFS データの提供者と利用者のコミュニティが、新しい機能を実現するために仕様拡張の提案を行うことが期待されています。

GTFS に貢献するには、[GTFS Schedule Amendment Process](../../../../community/governance/gtfs_schedule_amendment_process) を読み、GTFS の Github リポジトリ (<a href="https://github.com/google/transit" target="_blank">google/transit</a>) 上の公開された <a href="https://github.com/google/transit/issues" target="_blank">issue</a> や <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a> の議論をフォローしてください。 ![](../../../assets/mark-github.svg)

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add trip-to-trip transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">現在、GTFS Schedule に関するアクティブな提案はありません。</h3>
        <p class="prompt">提案がありますか？ &ensp;➜&ensp; <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a> を作成してください。</p>
    </div>
</div>
<div class="row"></div> -->

## 最近採用された提案 &ensp;<img src="../../../../assets/pr-merged.svg" style="height:1em;"/> {: #recently-adopted-proposals-ensp}


最近マージされ、現在 [公式 GTFS Schedule Reference](../../reference) の機能となっている提案です。詳細は [Revision History](../revision_history) をご覧ください。

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/433" class="no-icon" target="_blank">GTFS Flex の採用</a></h3>
        <p class="maintainer">#433 by <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> が 2024年3月19日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li><a href="../../../../community/extensions/flex" class="no-icon" target="_blank">GTFS-Flex 提案</a>により、乗客は便検索ツールでデマンド型サービスを見つけることができます</li>
	    <li>複数のファイルが仕様に追加され、その中には GeoJson を GTFS に統合する <code>locations.geojson</code> も含まれています</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/405" class="no-icon" target="_blank">networks.txt & route_networks.txt の追加</a></h3>
        <p class="maintainer">#406 by <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> が 2023年11月28日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>新しい2つのファイル <code>networks.txt</code> と <code>route_networks.txt</code> を追加し、運賃に関連付けられたルートのネットワークを構築できるようにしました</li>
	    <li><code>routes.network_id</code> の代替手段を提供し、運行スケジュールファイルと運賃ファイルを分離できるようにしました</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/406" class="no-icon" target="_blank">ベストプラクティス: データセット公開ガイドラインと全ファイルの推奨事項の追加</a></h3>
        <p class="maintainer">#406 by <a href="https://github.com/Sergiodero" class="no-icon" target="_blank">Sergiodero</a> が 2023年11月16日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>GTFS ベストプラクティスの2つのセクション「データセット公開ガイドライン」と「全ファイルの推奨事項」を仕様に追加しました</li>
            <li>Google の transitfeed ツールのマージ機能への参照を更新し、代わりにマージツールの一覧を参照するようにしました</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/386" class="no-icon" target="_blank">ベストプラクティス: 推奨される存在の追加</a></h3>
        <p class="maintainer">#386 by <a href="https://github.com/emmambd" class="no-icon" target="_blank">emmambd</a> が 2023年8月1日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>RFC の規約に準拠した新しい「推奨される存在」を仕様に追加しました</li>
            <li>フィールドやファイルが必須ではないが、追加することがベストプラクティスであることを明確に示すことができます</li>
            <li>複数のファイルやフィールドの情報を更新し、GTFS ベストプラクティスに基づいた推奨される存在を反映しました</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/357" class="no-icon" target="_blank">時間帯や曜日による可変運賃の追加</a></h3>
        <p class="maintainer">#357 by <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> が 2023年7月27日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>時間帯による可変運賃は <a href="../../../../community/extensions/fares-v2">GTFS Fares-v2 拡張提案</a> の一部として開発された重要な機能です</li>
            <li>ピーク運賃やオフピーク運賃のように、時間帯や曜日に基づいて区別された運賃を表現することができます</li>
            <li>新しいファイル <code>timeframes.txt</code> を追加し、運賃が適用される時間帯を定義できるようにしました</li>
            <li><code>fare_leg_rules.txt</code> を拡張し、<code>from_timeframe_id</code> および <code>to_timeframe_id</code> を追加して、乗車区間の開始または終了が特定の時間帯にある場合にのみ運賃規則が適用されるようにしました</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/355" class="no-icon" target="_blank">チケットメディアの追加</a></h3>
        <p class="maintainer">#355 by <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> が 2023年3月14日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>チケットメディアは <a href="../../../../community/extensions/fares-v2">GTFS Fares-v2 拡張提案</a> の重要な要素です</li>
            <li>乗客が乗車を認証するために使用できるもの（例: 交通系ICカード、モバイルアプリ、非接触型銀行カードによるタッチ決済）を表します</li>
            <li>チケット商品は特定のチケットメディアに関連付けることができます（例: 月額定期券は交通系ICカードでのみ利用可能）</li>
            <li>チケット商品の価格はチケットメディアに基づいて定義することができます（例: モバイルアプリで購入するとチケットが安くなる）</li>
        </ul>
    </div>
</div>

<div class="row"></div>
