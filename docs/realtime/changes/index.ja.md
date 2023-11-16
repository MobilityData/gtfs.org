# GTFS リアルタイム 仕様の変更点

GTFS リアルタイムの仕様は確定したものではありませんが、 GTFS リアルタイムを使用する交通機関、開発者、その他の関係者のコミュニティによって開発および維持されるオープン仕様です。  このコミュニティでは、新しい機能を実現するために仕様を拡張するための提案を期待されています。

GTFS リアルタイムに貢献するには、仕様変更プロセスを確認し、Google の Transit Github リポジトリ (google/transit) の オープンイシューや プルリクエストをフォローしてください。

!!! note ""

    本仕様書、リファレンス、ドキュメント類は英語で記載されています。他言語の翻訳と英語の原文の間に齟齬がある場合には、英文が優先します。また、すべてのコミュニケーションは英語で行われます。

<!-- <br><div class="landing-page">
    <a class="button" href="../process">仕様変更プロセス</a><a class="button" href="../guiding-principles">指導方針</a><a class="button" href="../revision-history">改訂履歴</a><a class="button" href="../extensions">リアルタイム拡張機能</a>
</div> -->

## アクティブな提案 &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- GTFS Realtime新機能の提案を積極的に行っています。  -->

[Githubでの](https://github.com/google/transit/pulls)議論に参加してください

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Alertにcause_detail effect_detail追加。</a></h3>
        <p class="maintainer">2022年5月31日に開設された#332による<a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">現在、GTFS Realtime有効な提案はありません。</h3>
        <p class="prompt">企画書をお持ちの方 &ensp;➜&ensp; を開く <a href="https://github.com/google/transit/pulls" target="_blank">プルリクエスト</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## 最近追加された提案 &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

最近追加された提案は、[公式のGTFS Realtime 仕様](../reference)として機能するようになりました。詳しくは[リビジョンヒストリー](../process#revision-history)をご覧ください。

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Alertsにcause_detailとeffect_detailを追加しました。</a></h3>
        <p class="maintainer"><a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a>による #332 は 2022 年 6 月 26 日に追加されました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>アラートの原因と効果に説明を追加しました。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : 車椅子アクセスの更新</a></h3>
        <p class="maintainer">#340 by<a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a>は2022年7月25日に追加されました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>トリップのアクセシビリティに関する情報をリアルタイムで追加</li>
            <li>提供された場合、GTFSスケジュールデータセットの<code>trips.wheelchair_accessible</code>に上書きされます。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">アラートにおける機能/画像</a></h3>
        <p class="maintainer"><a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a>さんの#283は2021年11月26日に追加されました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>アプリのサービスアラートに表示する画像（写真や地図など）のURLリンクのフィールドを追加し、アラートの理解度を向上させる</li>
            <li>変更点は画像のサイズ制限の強化、1つのアラートにつき1つの画像、画像の内容や言語が変更された場合のURLの変更が含まれています。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">GTFS-NewShapesを実験的に追加した。</a></h3>
        <p class="maintainer"><a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a>さんの #272 は 2021 年 8 月 30 日に追加されました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>ルート形状をリアルタイムに更新して迂回路を反映する機能</li>
            <li>ルートの更新は、既存の<code>shape_id</code>を参照するか、エンコードされたポリラインとして新しいシェイプをリアルタイムで定義することによって反映されます。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">TripUpdateにdeparture_occupancy_statusの追加</a></h3>
        <p class="maintainer"><a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoareによる#260は2021年4月14日に追加されました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>現在または過去のデータに基づいて、将来の停車駅における車両の予測された占有率を提供する</li>
        </ul>
    </div>
</div>

<div class="row"></div>
