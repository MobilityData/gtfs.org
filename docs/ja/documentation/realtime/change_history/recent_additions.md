# GTFS Realtimeの変更

GTFSGTFS Realtimeリファレンスは固定されたものではありません。 GTFS Realtimeを使用する交通機関、開発者、その他の関係者のコミュニティによって開発および保守されているオープン仕様です。 GTFS Realtimeデータのプロデューサーとコンシューマーのこのコミュニティは、新しい機能を有効にするために仕様を拡張するための提案をすることが期待されていますGTFS Realtimeに貢献するには、[GTFS Realtime修正プロセス](../../../../community/governance/gtfs_realtime_amendment_process)を読み、GTFS Github リポジトリ ( <a href="https://github.com/google/transit" target="_blank">google/transit</a> ) の未解決の<a href="https://github.com/google/transit/issues" target="_blank">問題</a>と<a href="https://github.com/google/transit/pulls" target="_blank">プル リクエスト</a>での議論に従ってください。 ![](../../../assets/mark-github.svg)

 <!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Add cause_detail and effect_detail to Alerts</a></h3>
        <p class="maintainer">#332 opened on May 31, 2022 by <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> --> 

 <!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for GTFS Realtime.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> --> 

## 最近採択された提案<img src="../../../../assets/pr-merged.svg" style="height:1em;"/>

最近統合された提案は、[公式GTFS Realtimeリファレンス](../../reference) の機能になりました。詳細については、完全な [改訂履歴](../revision_history) を参照してください。


<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"><a href="https://github.com/google/transit/pull/403" class="no-icon" target="_blank">旅行の変更を追加する</a></h3>
      <p class="maintainer"> <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a>による#332 は 2024 年 3 月 11 日にマージされました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li>一連の旅行に影響する迂回路を説明するために使用される旅行変更を実験的な機能として追加します。</li> 
            <li>旅行の変更により、特定の停車地をキャンセルしたり、旅行のタイミングを調整したり、旅行の新しい形を提供したり、途中の一時的な停車地の場所を提供したりすることができます。</li> 
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"> <a href="https://github.com/google/transit/pull/352" class="no-icon" target="_blank">schedule_relationship に DELETED 列挙型を追加します。</a></h3> 
      <p class="maintainer"> <a href="https://github.com/mads14" class="no-icon" target="_blank">mads14</a>による#332 は 2022 年 11 月 30 日に統合されました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li>新しい実験的な<code>DELETED</code>旅行スケジュール関係列挙型を追加します</li>
            <li>これは、交通機関のプロバイダーが、公共向けアプリケーションから旅行を完全に消すことを意図していることを伝えるために使用できます。</li> 
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">アラートに cause_detail と effect_detail を追加する</a></h3>
      <p class="maintainer"> <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a>による#332 は 2022 年 6 月 26 日にマージされました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li>アラートの原因と影響の説明を追加します</li>
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"> <a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt: 車椅子アクセスのアップデート</a></h3>
      <p class="maintainer">#340 by <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a>は 2022 年 7 月 25 日に統合されました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li>旅行のアクセシビリティに関するリアルタイム情報を追加</li>
            <li>指定されている場合、 GTFS Scheduleデータセットの<code>trips.wheelchair_accessible</code>を上書きします。</li> 
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">アラート内の機能/画像</a></h3>
      <p class="maintainer"> <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a>による#283 は 2021 年 11 月 26 日にマージされました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li>アプリのサービスアラートに表示される画像（写真や地図など）へのURLリンクのフィールドを追加し、アラートの理解度を高めます。</li> 
            <li>変更内容: 画像のサイズ制限の強制、アラートごとに 1 つの画像、画像の内容や言語が変更された場合の URL の変更の保証</li>
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"> <a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">GTFS-NewShapes を実験的に追加</a></h3>
      <p class="maintainer">#272 by <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a>は2021年8月30日に統合されました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li>迂回ルートを反映するためにルート形状をリアルタイムで更新する機能</li>
            <li>ルートの更新は、既存の<code>shape_id</code>参照するか、エンコードされたポリラインとして新しいシェイプをリアルタイムで定義することによって反映されます。</li> 
      </ul> 
   </div> 
</div> 

<div class="row"></div> 
