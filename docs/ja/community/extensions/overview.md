# 拡張機能

 <!-- GTFS is a community driven data format. Users can propose and vote on changes. For detailed information see the [GTFS Schedule](../schedule/process) and [GTFS Realtime](../realtime/process) amendment process.

Extensions that are currently in development can be found on MobilityData’s [roadmap](https://mobilitydata.org/roadmaps/#transit).

Extension proposals can be found in the following places:

- MobilityData maintains a [portal with a list of GTFS extension proposals](https://mobilitydata.org/roadmaps/#transit). The roadmap is based on their members’ prioritization. You can contribute ideas or extensions via the portal.
- TransitWiki.org contains a [list GTFS extension projects](https://www.transitwiki.org/TransitWiki/index.php/General_Transit_Feed_Specification#GTFS_Extensions).

For more information, contact [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) --> 

=== "GTFS schedule"

    追加のファイルとフィールドをGTFS scheduleデータセットに拡張して、交通事業者とソフトウェア ベンダーの間で伝えられるさまざまなアプリケーション固有のニーズに対応することがしてもよい。これらのフィールドが [公式仕様](../../../documentation/schedule/reference) に含まれていなくてもかまいません。
   
    以下は、実装できるGTFS schedule拡張機能の一覧です。
   
    !!! info "拡張機能を仕様で公式にする" 

        拡張機能はアクティブな提案になり、その後 [仕様修正プロセス](../../governance/gtfs_schedule_amendment_process/) によって公式仕様に [統合](../../../documentation/schedule/change_history/recent_additions/) されるしてもよい。

    !!! note "このリストへの貢献"

        GTFS コミュニティと共有したい拡張機能をお持ちですか?<a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">こちらから</a>GTFS.org に拡張機能を追加するようリクエストしてください。

<<<<<<< Updated upstream
    <div class="row"> 
    <div class="leftcontainer"> 
             <h3 class="title"> <a href="http://bit.ly/gtfs-pathways" class="no-icon" target="_blank">GTFS-Pathways</a></h3>
             <p class="maintainer"> <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>に て管理されています</p>
    </div> 
    <div class="featurelist"> 
       <ul> 
             <li>ルート計画や道案内のために、交通機関の駅内の場所を結ぶ構内通路のアクセシビリティに重点を置いています。</li> 
             <li> GTFS-Pathwaysのコア仕様は GTFS に完全に統合されていますが、テキスト読み上げ指示、車椅子支援情報、機器故障報告、計画または されている入口または出口の閉鎖、エレベーターやエスカレーターの停止などの追加情報を追加する必要があ ります。</li> 
       </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
             <a href="../fares-v2" class="no-icon" target="_blank"><h3 class="title"> GTFS-Fares v2</h3> 
             <p class="maintainer"> <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>に て管理されています</p>
    </div> 
    <div class="featurelist"> 
       <ul> 
             <li>旅行計画アプリが乗客に料金情報を表示できるようにします。</li> 
             <li> GTFS-Fares v2のベース実装は最近 GTFS に承認されましたが、この拡張機能の一部の機能はまだ残っており、ゾーン/距離ベースの運 乗客カテゴリ、運賃の上限と範囲、運賃バンドル パスとコンテナ、ラッシュ アワー/休日料金、乗り換えシーケンス、および 1 つのルートの動 含まれます。</li> 
       </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
             <a href="../flex" class="no-icon" target="_blank"><h3 class="title"> GTFSフレックス</h3>
             <p class="maintainer"> <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>に て管理されています</p>
    </div> 
    <div class="featurelist"> 
       <ul> 
             <li>固定の停留所等に対して必ずしも同じに従わない、逸脱した固定ルート・路線系統とオンデマンド輸送サービス機能をデータ モデリングに含 ことで、GTFS を拡張します。</li> 
             <li>この提案は、サービス自体を記述する GTFS-FlexibleTrips と、GTFS-FlexibleTrips の予約情報を提供する GTFS-BookingRules  2 つの拡張機能で構成されています。</li> 
       </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
             <h3 class="title"> <a href="http://bit.ly/gtfs-occupancies" class="no-icon" target="_blank">GTFS-Occupancies a></h3>
             <p class="maintainer"> <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>に て管理されています</p>
    </div> 
    <div class="featurelist"> 
       <ul> 
             <li>通常または予測に基づいて車両の乗客の混雑状況を説明します。</li> 
             <li>過去の傾向に基づいて将来の便の静的予測を提供することで、 GTFS realtimeで説明されている混雑情報の可用性を補完し、乗客が混雑の や快適さに基づいて便を計画するのに役立ちます。</li> 
       </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
             <h3 class="title"> <a href="https://developers.google.com/transit/gtfs/reference/gtfs-extensions class="no-icon" target="_blank">Google Transit の GTFS 拡張機能</a></h3>
             <p class="maintainer"> <a href="https://developers.google.com/transit" class="no-icon" target="_blank">Google</a> が管理</p>
    </div> 
    <div class="featurelist"> 
       <ul> 
             <li>翻訳サポートを提供し、ルート タイプを拡張し、より詳細な転送ルールを可能にし、その他多数の機能を追加します。</li> 
       </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
             <h3 class="title"> <a href="https://www.transitwiki.org/TransitWiki/index.ph File:GTFS%2B_Additional_Files_Format_Ver_1.7.pdf" class="no-icon" target="_blank">MTC GTFS+</a></h3> 
             <p class="maintainer"> <a href="https://mtc.ca.gov/" class="no-icon" target="_blank">MTC</a>によって管理されてい </p>
    </div> 
    <div class="featurelist"> 
       <ul> 
             <li>サンフランシスコ ベイエリア都市圏交通委員会によって作成されました。リアルタイム情報、道順、乗客のカテゴリなどが追加されます。 li> 
       </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
             <h3 class="title"> <a href="https://github.com/mbta/gtfs-documentation/" class="no-icon" target="_blank">MBTA</a></h3> 
             <p class="maintainer"> <a href="https://www.mbta.com/" class="no-icon" target="_blank">MBTA</a>によって管理され ます</p>
    </div> 
    <div class="featurelist"> 
       <ul> 
             <li>オンタイムパフォーマンス追跡チェックポイント、駅や施設の情報などを追加します。</li> 
       </ul> 
    </div> 
    </div> 
    <div class="row"> 
       <div class="leftcontainer"> 
                <h3 class="title"> <a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon target="_blank">GTFS-Eligibilities</a></h3>
                <p class="maintainer"><a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon target="_blank">オレゴン州運輸局</a>が管理</p>
       </div> 
       <div class="featurelist"> 
             <p> GTFS-Eligibilitiesは、ユーザー アカウントに基づいて動作するシステムが、ユーザー アカウント情報に基づいて旅行が適格かどうか 断できる方法を提供するという概念に基づいて形成されてするべきである。つまり、提案されているフィールドは次のものを提供します。</p> 
             <ul> 
                <li>年齢、性別、会社所属、旅行目的、提供される支援階・フロアなど、ユーザー アカウントに関連付けられた一般的な属性。</li> 
                <li>ローカルで定義された属性とステータスのカスタマイズ可能な認証。カスタム資格が提供されるほか、カスタム資格を認証する方法を理 る方法も提供されます。</li> 
             </ul> 
       </div> 
    </div> 
    <div class="row"> 
       <div class="leftcontainer"> 
                <h3 class="title"> <a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon target="_blank">GTFS-Capabilities</a></h3>
                <p class="maintainer"><a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">オレゴン州運輸局</a>が管理</p>
       </div> 
       <div class="featurelist"> 
             <p>障害のある人や移動装置を持つ人のためにサービスが提供してもよい追加機能について説明します。</p> 
             <ul> 
                <li>運転手や代理店が提供するその他のリソースなど、人から乗客に提供されるサービスに関する情報。</li> 
                <li>車両情報<a href="https://docs.google.com/document/d/156RiBjI6FnWJvO8_XWX11Q9nLdOiBdS_rilA-oamlvedit#heading=h.tosuo6e9e0z7">。GTFS-VehicleCategories</a>仕様（さらに拡張）で説明されています。<a href="https://docs.google.com/document/d/1mcQ-oEaP5WiGh46DmUQqmeS-rQ5W96L-c3TRKinGS0g/edit#heading=h.oxdoxruczgni"> GTFS-seats</a>ドラフト拡張も参照してください。</li> 
                <li>移動装置に関連する車両のアメニティと、それらの装置を携行して乗車すると他の乗客や装置の容量にどのような影響が及ぶかを説明す とに重点を置いています。</li> 
             </ul> 
       </div> 
    </div> 
    <div class="row"></div> 
=======
         <div class="row"> 
         <div class="leftcontainer"> 
                  <h3 class="title"> <a href="http://bit.ly/gtfs-pathways" class="no-icon" target="_blank">GTFS-Pathways</a></h3>
                  <p class="maintainer"> <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>によって管理されています</p>
         </div> 
         <div class="featurelist"> 
            <ul> 
                  <li>ルート計画や道案内のために、交通事業者の駅内の場所を結ぶ構内通路のアクセシビリティに重点を置いています。</li> 
                  <li> GTFS-Pathwaysのコア仕様は GTFS に完全に統合されていますが、テキスト読み上げ指示、車椅子支援情報、機器故障報告、計画または予定されている入口または出口の閉鎖、エレベーターやエスカレーターの停止などの追加情報を追加する必要があ ります。</li> 
            </ul> 
         </div> 
         </div> 

         <div class="row"> 
         <div class="leftcontainer"> 
                  <a href="../fares-v2" class="no-icon" target="_blank"><h3 class="title"> GTFS-Fares v2</h3> 
                  <p class="maintainer"> <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>によって管理されています</p>
         </div> 
         <div class="featurelist"> 
            <ul> 
                  <li>便計画アプリが乗客に料金情報を表示できるようにします。</li> 
                  <li> GTFS-Fares v2のベース実装は最近 GTFS に承認されましたが、この拡張機能の一部の機能はまだ残っており、ゾーン/距離ベースの運賃、乗客カテゴリ、運賃の上限と範囲、運賃バンドル パスとコンテナ、ラッシュ アワー/休日料金、乗り換えシーケンス、および 1 つのルートの動作が含まれます。</li> 
            </ul> 
         </div> 
         </div> 

         <div class="row"> 
         <div class="leftcontainer"> 
                  <a href="../flex" class="no-icon" target="_blank"><h3 class="title"> GTFSフレックス</h3>
                  <p class="maintainer"> <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>によって管理されています</p>
         </div> 
         <div class="featurelist"> 
            <ul> 
                  <li>固定の停留所等に対して必ずしも同じに従わない、逸脱した固定ルート・路線系統とオンデマンド輸送サービス機能をデータ モデリングに含めることで、GTFS を拡張します。</li> 
                  <li>この提案は、サービス自体を記述する GTFS-FlexibleTrips と、GTFS-FlexibleTrips の予約情報を提供する GTFS-BookingRules の 2 つの拡張機能で構成されています。</li> 
            </ul> 
         </div> 
         </div> 

         <div class="row"> 
         <div class="leftcontainer"> 
                  <h3 class="title"> <a href="http://bit.ly/gtfs-occupancies" class="no-icon" target="_blank">GTFS-Occupancies</a></h3>
                  <p class="maintainer"> <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>によって管理されています</p>
         </div> 
         <div class="featurelist"> 
            <ul> 
                  <li>通常または予測に基づいて車両の乗客の混雑状況を説明します。</li> 
                  <li>過去の傾向に基づいて将来の便の静的予測を提供することで、 GTFS realtimeで説明されている混雑情報の可用性を補完し、乗客が混雑の好みや快適さに基づいて便を計画するのに役立ちます。</li> 
            </ul> 
         </div> 
         </div> 

         <div class="row"> 
         <div class="leftcontainer"> 
                  <h3 class="title"> <a href="https://developers.google.com/transit/gtfs/reference/gtfs-extensions" class="no-icon" target="_blank">Google Transit の GTFS 拡張機能</a></h3>
                  <p class="maintainer"> <a href="https://developers.google.com/transit" class="no-icon" target="_blank">Google</a>が管理</p>
         </div> 
         <div class="featurelist"> 
            <ul> 
                  <li>翻訳サポートを提供し、ルート タイプを拡張し、より詳細な転送ルールを可能にし、その他多数の機能を追加します。</li> 
            </ul> 
         </div> 
         </div> 

         <div class="row"> 
         <div class="leftcontainer"> 
                  <h3 class="title"> <a href="https://www.transitwiki.org/TransitWiki/index.php/File:GTFS%2B_Additional_Files_Format_Ver_1.7.pdf" class="no-icon" target="_blank">MTC GTFS+</a></h3> 
                  <p class="maintainer"> <a href="https://mtc.ca.gov/" class="no-icon" target="_blank">MTC</a>によって管理されています</p>
         </div> 
         <div class="featurelist"> 
            <ul> 
                  <li>サンフランシスコ ベイエリア都市圏交通委員会によって作成されました。リアルタイム情報、道順、乗客のカテゴリなどが追加されます。</li> 
            </ul> 
         </div> 
         </div> 

         <div class="row"> 
         <div class="leftcontainer"> 
                  <h3 class="title"> <a href="https://github.com/mbta/gtfs-documentation/" class="no-icon" target="_blank">MBTA</a></h3> 
                  <p class="maintainer"> <a href="https://www.mbta.com/" class="no-icon" target="_blank">MBTA</a>によって管理されています</p>
         </div> 
         <div class="featurelist"> 
            <ul> 
                  <li>オンタイムパフォーマンス追跡チェックポイント、駅や施設の情報などを追加します。</li> 
            </ul> 
         </div> 
         </div> 
         <div class="row"> 
            <div class="leftcontainer"> 
                     <h3 class="title"> <a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">GTFS-Eligibilities</a></h3>
                     <p class="maintainer"><a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">オレゴン州運輸局</a>が管理</p>
            </div> 
            <div class="featurelist"> 
                  <p> GTFS-Eligibilitiesは、ユーザー アカウントに基づいて動作するシステムが、ユーザー アカウント情報に基づいて便が適格かどうかを判断できる方法を提供するという概念に基づいて形成されてするべきである。つまり、提案されているフィールドは次のものを提供します。</p> 
                  <ul> 
                     <li>年齢、性別、会社所属、便目的、提供される支援階・フロアなど、ユーザー アカウントに関連付けられた一般的な属性。</li> 
                     <li>ローカルで定義された属性とステータスのカスタマイズ可能な認証。カスタム資格が提供されるほか、カスタム資格を認証する方法を理解する方法も提供されます。</li> 
                  </ul> 
            </div> 
         </div> 
         <div class="row"> 
            <div class="leftcontainer"> 
                     <h3 class="title"> <a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">GTFS-Capabilities</a></h3>
                     <p class="maintainer"><a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">オレゴン州運輸局</a>が管理</p>
            </div> 
            <div class="featurelist"> 
                  <p>障害のある人や移動装置を持つ人のためにサービスが提供してもよい追加機能について説明します。</p> 
                  <ul> 
                     <li>運転手や代理店が提供するその他のリソースなど、人から乗客に提供されるサービスに関する情報。</li> 
                     <li>車両情報<a href="https://docs.google.com/document/d/156RiBjI6FnWJvO8_XWX11Q9nLdOiBdS_rilA-oamlv8/edit#heading=h.tosuo6e9e0z7">。GTFS-VehicleCategories</a>仕様（さらに拡張）で説明されています。GTFS <a href="https://docs.google.com/document/d/1mcQ-oEaP5WiGh46DmUQqmeS-rQ5W96L-c3TRKinGS0g/edit#heading=h.oxdoxruczgni">GTFS-seats</a>ドラフト拡張も参照してください。</li> 
                     <li>移動装置に関連する車両のアメニティと、それらの装置を携行して乗車すると他の乗客や装置の容量にどのような影響が及ぶかを説明することに重点を置いています。</li> 
                  </ul> 
            </div> 
         </div> 
         <div class="row"></div> 
>>>>>>> Stashed changes

=== "GTFS realtime"

    追加のファイルとフィールドをGTFS realtimeフィードに拡張して、交通事業者とソフトウェア ベンダーの間でやり取りされるさまざまなアプリケーション固有のニーズに対応することがしてもよい。これらのフィールドが [公式仕様](../../../documentation/realtime/reference) に含まれていなくてもかまいません。
   
    以下は、実装できるGTFS realtime拡張機能の一覧です。
   
    !!! info "拡張機能を仕様で公式にする" 
      
        拡張機能はアクティブな提案になり、その後 [仕様修正プロセス](../../governance/gtfs_realtime_amendment_process/) を経て公式仕様に [統合](../../../documentation/realtime/change_history/recent_additions/) されるしてもよいます。
   
    !!! note "このリストへの貢献"

        GTFS コミュニティと共有したい拡張機能をお持ちですか?<a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">こちらから</a>GTFS.org に拡張機能を追加するようリクエストしてください。

    <div class="row"> 
    <div class="leftcontainer"> 
             <h3 class="title"> <a href="https://docs.google.com/document/d/1qJOTe4m_a4dcJnvXYt4smYj4QQ1ejZ8CvLBYzDM5Iy edit#bookmark=id.av58okxmwekh" class="no-icon" target="_blank">GTFS-PathwayUpdates</a></h3>
             <p class="maintainer"> <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>に て管理されています</p>
    </div> 
    <div class="featurelist"> 
       <ul> 
             <li>エレベーターの停止や構内通路の閉鎖など、駅の構内通路の変更をリアルタイムで説明します。</li> 
       </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
             <h3 class="title"><a href="https://github.com/google/transit/pull/212" class="no-icon target="_blank">GTFS-OccupancyStatus</a></h3>
             <p class="maintainer"><a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>によ 管理されています</p>
    </div> 
    <div class="featurelist"> 
       <ul> 
             <li>交通機関の混雑状況をリアルタイムで提供します。</li> 
       </ul> 
    </div> 
    </div> 
    <div class="row"></div> 

<<<<<<< Updated upstream
詳細については、[specifications@mobilitydata.org](mailto:specifications@mobilitydata.org)までお問い合わせください
=======
         <div class="row"> 
         <div class="leftcontainer"> 
                  <h3 class="title"><a href="https://github.com/google/transit/pull/212" class="no-icon" target="_blank">GTFS-OccupancyStatus</a></h3>
                  <p class="maintainer"><a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a>によって管理されています</p>
         </div> 
         <div class="featurelist"> 
            <ul> 
                  <li>交通事業者の混雑状況をリアルタイムで提供します。</li> 
            </ul> 
         </div> 
         </div> 

         <div class="row"></div> 

詳細については、[specifications@mobilitydata.org](mailto:specifications@mobilitydata.org)までお問い合わせください
>>>>>>> Stashed changes
