---
search:
  exclude: true
---

# GTFSのスケジュール変更

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

GTFSの仕様は確定しているわけではありません。むしろ、GTFSを使用する交通機関、開発者、その他の関係者のコミュニティによって開発・維持されているオープンな仕様です。このGTFSデータの生産者と消費者のコミュニティから、新しい機能を実現するための仕様拡張の提案がなされることが期待されています。

GTFSに貢献するには、[仕様修正](../process)プロセスを読み、GoogleのTransit Githubリポジトリ[（google/transit](https://github.com/google/transit)）の[オープンイシューや](https://github.com/google/transit/issues) [プルリクエストで](https://github.com/google/transit/pulls)議論に従ってください。![](../../assets/mark-github.svg)

!!!注意 ""

    本仕様書、参考資料、ドキュメント類は英語で書かれています。他言語へのTranslation英語の原文と異なる場合は、後者が優先されます。すべてのコミュニケーションは英語で行われます。


## アクティブなプロポーザル![](../../assets/pr-active.svg)

<!--
Active proposals for new features in GTFS Schedule.  -->

[Githubでの](https://github.com/google/transit/pulls)議論に参加してください

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

## 最近マージされたプロポーザル![](../../assets/pr-merged.svg)

最近マージされたプロポーザルで、現在では[公式のGTFSスケジュール仕様](../reference)の機能になっています。詳しくは[リビジョンヒストリーを](../process#revision-history)ご覧ください。

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">座席指定オプションでトリップ間転送を追加する</a></h3>
        <p class="maintainer"><a href="https://github.com/gcamp" class="no-icon" target="_blank">gcampによる</a>#303は2022年6月26日にマージされました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>同じ車両が2回連続で運行し、ユーザーが乗車したまま移動できる場合に、ユーザーが「座席内移動」を行えるかどうかを定義するために、トリップ間移動のための新しい<code>transfer_type`sを</code>追加しました。</li>
            <li>座席間移動はできないが、異なる2つのトリップを操作上リンクさせることができる場合を定義できる。
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank">GTFS-Fares v2基本実装</a></h3>
        <p class="maintainer"><a href="https://github.com/scmcca" class="no-icon" target="_blank">scmccaの</a>#286は2022年5月17日にマージされました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>トランジットの運賃とチケット</li>
            <li>複雑な運賃や乗り換え（マルチネットワーク、時間ベース、回数ベースの乗り換え）のためのコストモデリング</li>
            <li>停留所と運賃エリアを関連付けるモデル</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">トリップ間およびルート間の乗り換え</a></h3>
        <p class="maintainer"><a href="https://github.com/scmcca" class="no-icon" target="_blank">scmccaの</a>#284は2021年10月5日にマージされました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>停留所、トリップ、ルートのペア間の乗り換えルールをtransfers.txtで指定する。</li>
             <li>異なるペアの配置に基づく転送ルールの特異性をランク付けした</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops（連続停車駅</a></h3>
        <p class="maintainer">#208 by<a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a>は2020年5月13日にマージされました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>車両の移動経路のどこでもライダーのピックアップやドロップオフを可能にします。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3>
        <p class="maintainer"><a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a>による #180 は 2020 年 1 月 9 日にマージされました。</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>テキストフィールド、ローカライズされたURL、および連絡先情報の翻訳</li>
        </ul>
    </div>
</div>

<div class="row"></div>
