# GTFS Realtime 仕様の変更点

GTFS Realtime 仕様は、決まったものではありません。その代わり、オープンな仕様で、交通機関、開発者、その他の関係者がGTFS Realtimeを使用し、開発、維持をしています。GTFS Realtime データの生産者と消費者のコミュニティは、新しい機能を実現するために、仕様を拡張する提案をすることが期待されています。

GTFS Realtime に貢献するには、[仕様変更](../process)プロセスを読み、GoogleのTransit Github リポジトリ[(google/transit](https://github.com/google/transit)) の[オープンイシューや](https://github.com/google/transit/issues) [プルリクエストでの](https://github.com/google/transit/pulls)議論をフォローしてください。![](../../assets/mark-github.svg)

!!! note ""

    本仕様書、参考資料、ドキュメント類は英語で書かれています。他言語への翻訳英語の原文と異なる場合は、後者が優先されます。すべてのコミュニケーションは英語で行われます。

<!-- <br><div class="landing-page">
    <a class="button" href="../process">仕様変更プロセス</a><a class="button" href="../guiding-principles">指導方針</a><a class="button" href="../revision-history">改訂履歴</a><a class="button" href="../extensions">リアルタイム拡張機能</a>
</div> -->

## アクティブなプロポーザル &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

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

## 最近マージされたプロポーザル &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

最近マージされたプロポーザルは、[公式のGTFS Realtime 仕様](../reference)として機能するようになりました。詳しくは[リビジョンヒストリーを](../process#revision-history)ご覧ください。

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Alertsにcause_detailとeffect_detailを追加しました。</a></h3>
        <p class="maintainer"><a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a>による #332 は 2022 年 6 月 26 日にマージされました。</p>
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
        <p class="maintainer">#340 by<a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a>は2022年7月25日にマージされました。</p>
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
        <p class="maintainer"><a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a>さんの#283は2021年11月26日にマージされました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>アプリのサービスアラートに表示する画像（写真や地図など）のURLリンクのフィールドを追加し、アラートの理解度を向上させる</li>
            <li>変更点は、画像のサイズ制限の強化、1つのアラートにつき1つの画像、画像の内容や言語が変更された場合のURLの変更を保証すること、などです。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">GTFS-NewShapesを実験的に追加した。</a></h3>
        <p class="maintainer"><a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a>さんの #272 は 2021 年 8 月 30 日にマージされました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>ルート形状をリアルタイムに更新して迂回路を反映する機能</li>
            <li>ルートの更新は、既存の<code>shape_id</code>を参照するか、エンコードされたポリラインとして新しいシェイプをリアルタイムで定義することで反映される</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">TripUpdateにdeparture_occupancy_statusの追加</a></h3>
        <p class="maintainer"><a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoareによる</a>#260は2021年4月14日にマージされました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>現在または過去のデータに基づいて、将来の停車駅における輸送車両の予測された占有率を提供する</li>
        </ul>
    </div>
</div>

<div class="row"></div>
