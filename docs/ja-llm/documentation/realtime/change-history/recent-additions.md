# GTFS Realtime の変更 {: #gtfs-realtime-changes}

GTFS Realtime リファレンスは固定されたものではありません。代わりに、GTFS Realtime を利用する交通事業者、開発者、その他の関係者のコミュニティによって開発・維持されているオープンな仕様です。この GTFS Realtime データの提供者と利用者のコミュニティが、新しい機能を実現するために仕様拡張の提案を行うことが期待されています。

GTFS Realtime に貢献するには、[GTFS Realtime Amendment Process](../../../../community/governance/gtfs_realtime_amendment_process) を読み、GTFS の Github リポジトリ (<a href="https://github.com/google/transit" target="_blank">google/transit</a>) 上の公開された <a href="https://github.com/google/transit/issues" target="_blank">issue</a> や <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a> の議論をフォローしてください。 ![](../../../assets/mark-github.svg)

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Add cause_detail and effect_detail to Alerts</a></h3>
        <p class="maintainer">#332 opened on May 31, 2022 by <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">現在、GTFS Realtime に関するアクティブな提案はありません。</h3>
        <p class="prompt">提案がありますか？ &ensp;➜&ensp; <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a> を作成してください。</p>
    </div>
</div>
<div class="row"></div> -->

## 最近採択された提案 &ensp;<img src="../../../../assets/pr-merged.svg" style="height:1em;"/> {: #recently-adopted-proposals-ensp}


最近マージされ、現在 [公式 GTFS Realtime リファレンス](../../reference) の機能となっている提案です。詳細は [Revision History](../revision_history) をご覧ください。


<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/403" class="no-icon" target="_blank">Trip modifications の追加</a></h3>
        <p class="maintainer">#332 by <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> が 2024年3月11日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>複数の便に影響を与える迂回を記述するために使用される実験的機能として Trip modifications を追加しました。</li>
            <li>便の変更(trip modification)は、特定の停留所等(stop)をキャンセルしたり、便の時刻を調整したり、便が通る新しいルート形状(shape)を提供したり、途中の仮設停留所等(stop)の位置を提供することができます。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/352" class="no-icon" target="_blank">schedule_relationship に DELETED enum を追加</a></h3>
        <p class="maintainer">#332 by <a href="https://github.com/mads14" class="no-icon" target="_blank">mads14</a> が 2022年11月30日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>新しい実験的な <code>DELETED</code> trip schedule_relationship enum を追加しました</li>
            <li>これは、事業者が便を公開アプリケーションから完全に削除する意図があることを伝えるために使用することができます</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Alerts に cause_detail と effect_detail を追加</a></h3>
        <p class="maintainer">#332 by <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> が 2022年6月26日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>運行情報(alert)の原因と影響に説明を追加しました</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt: 車椅子利用可否の更新</a></h3>
        <p class="maintainer">#340 by <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> が 2022年7月25日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>便のアクセシビリティに関するリアルタイム情報を追加しました</li>
            <li>提供された場合、GTFS Schedule データセット内の <code>trips.wheelchair_accessible</code> を上書きします</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">運行情報(alert)に画像を追加</a></h3>
        <p class="maintainer">#283 by <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> が 2021年11月26日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>運行情報(alert)に表示される画像（例: 写真や地図）への URL リンクのフィールドを追加し、運行情報の理解を向上させました</li>
            <li>変更点には、画像のサイズ制限の強制、1つの運行情報(alert)につき1つの画像、画像の内容や言語が変更された場合に URL が変更されることの保証が含まれます</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">GTFS-NewShapes を実験的に追加</a></h3>
        <p class="maintainer">#272 by <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> が 2021年8月30日にマージされました</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>迂回を反映するためにルート形状(shape)をリアルタイムで更新できる機能を追加しました</li>
            <li>ルート更新は、既存の <code>shape_id</code> を参照するか、またはリアルタイムで新しいルート形状(shape)をエンコードされたポリラインとして定義することで反映されます</li>
        </ul>
    </div>
</div>

<div class="row"></div>
