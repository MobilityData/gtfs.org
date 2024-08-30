# GTFS Scheduleの変更

GTFSGTFS Scheduleリファレンスは固定されたものではありません。GTFS を使用する交通機関、開発者、その他の関係者のコミュニティによって開発および保守されているオープン仕様です。GTFS データのプロデューサーとコンシューマーのこのコミュニティは、新しい機能を有効にするために仕様を拡張するための提案をすることが期待されています。

GTFS に貢献するには、[GTFS Schedule修正プロセス](../../../../community/governance/gtfs_schedule_amendment_process) を読み、GTFS Github リポジトリ ( <a href="https://github.com/google/transit" target="_blank">google/transit</a> ) の未解決の<a href="https://github.com/google/transit/issues" target="_blank">問題</a>と<a href="https://github.com/google/transit/pulls" target="_blank">プル リクエスト</a>での議論に従ってください。![](../../../assets/mark-github.svg)

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

## 最近採択された提案<img src="../../../../assets/pr-merged.svg" style="height:1em;"/>

最近統合された提案は、[公式GTFS Scheduleリファレンス](../../reference) の機能になりました。詳細については、完全な [改訂履歴](../revision_history) を参照してください。

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"> <a href="https://github.com/google/transit/pull/433" class="no-icon" target="_blank">GTFS Flexを採用</a></h3>
      <p class="maintainer">#433 by <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a>は 2024 年 3 月 19 日に統合されました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li> <a href="../../../../community/extensions/flex" class="no-icon" target="_blank">GTFS-Flex提案により、</a>乗客は旅行計画者で需要に応じたサービスを発見できるようになる。</li> 
   <li>仕様には、GTFSにGeoJsonを統合するlocations.geojsonを含む複数のファイルが追加されました。</li> 
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"> <a href="https://github.com/google/transit/pull/405" class="no-icon" target="_blank">networks.txtとroute_networks.txt を追加します。</a></h3> 
      <p class="maintainer">#406 by <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a>は 2023 年 11 月 28 日に統合されました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li>運賃に関連付けられたルートのネットワークを構築するための 2 つの新しいファイル ( <code>networks.txt</code>と<code>route_networks.txt</code>を追加します。</li> 
   <li>スケジュールと運賃ファイルを区別できるように、 <code>routes.network_id</code>の代替手段を提供します。</li> 
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"><a href="https://github.com/google/transit/pull/406" class="no-icon" target="_blank">ベストプラクティス: データセット公開ガイドラインを追加する<br>すべてのファイルに対する実践的な推奨事項</a></h3>
      <p class="maintainer"> <a href="https://github.com/Sergiodero" class="no-icon" target="_blank">Sergiodero</a>による#406 は 2023 年 11 月 16 日に統合されました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li> GTFS ベスト プラクティスの 2 つのセクション (データセット公開ガイドラインとすべてのファイルに対する実践推奨事項) を仕様に追加します。</li> 
            <li> Googleのトランジットフィードツールのマージ機能への参照を更新し、代わりにマージツールのリストを参照するようにしました。</li> 
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"><a href="https://github.com/google/transit/pull/386" class="no-icon" target="_blank">ベストプラクティス: 推奨プレゼンスを追加する</a></h3>
      <p class="maintainer">#386 by <a href="https://github.com/emmambd" class="no-icon" target="_blank">emmambd</a>は 2023 年 8 月 1 日に統合されました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li> RFC 規則に準拠した仕様に新しい推奨項目を追加します。</li> 
            <li>フィールドまたはファイルが必須ではないことを明確に示すことができますが、追加することは考慮すべきベストプラクティスです。</li> 
            <li> GTFS ベスト プラクティスに基づいて、複数のファイルとフィールドの推奨される存在を反映するように情報を更新します。</li> 
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"><a href="https://github.com/google/transit/pull/357" class="no-icon" target="_blank">時間や曜日によって変動する運賃を追加する</a></h3>
      <p class="maintainer"> <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a>による#357 は 2023 年 7 月 27 日に統合されました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li>時間変動運賃は<a href="../../../../community/extensions/fares-v2">、GTFS運賃v2拡張提案</a>の一部として開発された重要な機能です。</li> 
            <li>ピーク料金やオフピーク料金など、時間帯や曜日に基づいて異なる料金を表現できます。</li> 
            <li>運賃が適用される時間を定義するための新しいファイル<code>timeframes.txt</code>を追加します。</li> 
            <li> <code>fare_leg_rules.txt</code> <code>from_timeframe_id</code>と<code>to_timeframe_id</code>で拡張し、区間の開始または終了が指定された時間枠内にある場合にのみ運賃区間ルールが適用されることを指定します。</li> 
      </ul> 
   </div> 
</div> 

<div class="row"> 
   <div class="leftcontainer"> 
      <h3 class="title"><a href="https://github.com/google/transit/pull/355" class="no-icon" target="_blank">運賃メディアを追加</a></h3>
      <p class="maintainer"> <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a>による#355 は 2023 年 3 月 14 日に統合されました</p>
   </div> 
   <div class="featurelist"> 
      <ul> 
            <li>チケットメディアは<a href="../../../../community/extensions/fares-v2">GTFS運賃v2拡張提案</a>の重要な要素である</li>
            <li>これは、乗客が乗車を認証するために使用できるものを表します（例：交通カード、モバイルアプリ、または非接触型銀行カードを使用したタップして支払う）</li> 
            <li>運賃商品は特定のチケットメディアに関連付けることができます（例：月間パスは交通カードでのみ利用可能）</li> 
            <li>運賃商品の価格はチケットメディアに基づいて定義できます（例：モバイルアプリ経由で購入するとチケットが安くなります）</li> 
      </ul> 
   </div> 
</div> 

<div class="row"></div>