# 拡張機能 {: #extensions}


=== "GTFS Schedule"

    GTFS Schedule データセットには、事業者とソフトウェアベンダー間でやり取りされるさまざまなアプリケーション固有のニーズに対応するために、追加のファイルやフィールドを拡張することができます。これらのフィールドは [公式仕様](../../../documentation/schedule/reference) に含まれていない場合でも利用可能です。
    
    以下は実装可能な GTFS Schedule 拡張機能の一覧です。
    
    !!! info "仕様における拡張機能を公式化する方法" 

        拡張機能はアクティブな提案となり、その後 [仕様改訂プロセス](../../governance/gtfs_schedule_amendment_process/) を通じて [公式仕様に統合](../../../documentation/schedule/change-history/recent_additions/) されることがあります。

    !!! note "このリストへの貢献"

        GTFS コミュニティと共有したい拡張機能がありますか？ GTFS.org に拡張機能を追加するリクエストは <a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">こちら</a> から行えます。

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="http://bit.ly/gtfs-pathways" class="no-icon" target="_blank">GTFS-Pathways</a></h3>
            <p class="maintainer"><a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a> によって管理されています</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>経路計画や案内のために、交通駅内の場所をつなぐ構内通路(pathway)に焦点を当てたアクセシビリティ対応。</li>
            <li>GTFS-Pathways のコア仕様は完全に GTFS に統合されていますが、読み上げ用フィールド(text-to-speech field)の指示、車椅子支援情報、設備故障の報告、計画的または予定された出入口の閉鎖、エレベーターやエスカレーターの故障などの追加情報を加える必要があります。</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <a href="../fares-v2" class="no-icon" target="_blank"><h3 class="title">GTFS-Fares v2</h3></a>
            <p class="maintainer"><a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a> によって管理されています</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>旅程計画アプリが乗客に料金情報を表示できるようにします。</li>
            <li>GTFS-Fares v2 の基本実装は最近 GTFS に統合されることが承認されましたが、ゾーン/距離ベースの運賃、乗客カテゴリ、運賃上限や範囲、運賃バンドルパスやコンテナ、ラッシュアワー/休日料金、乗り継ぎシーケンス、単一路線の挙動など、まだ残っている機能があります。</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <a href="../flex" class="no-icon" target="_blank"><h3 class="title">GTFS-Flex</h3></a>
            <p class="maintainer"><a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a> によって管理されています</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>固定停留所(stop)に必ずしも従わない、迂回型の固定ルートやオンデマンド交通サービス機能をデータモデリングに含めることで GTFS を拡張します。</li>
            <li>この提案は 2 つの拡張で構成されています：サービス自体を記述する GTFS-FlexibleTrips と、GTFS-FlexibleTrips の予約情報を提供する GTFS-BookingRules です。</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="http://bit.ly/gtfs-occupancies" class="no-icon" target="_blank">GTFS-Occupancies</a></h3>
            <p class="maintainer"><a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a> によって管理されています</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>車両の乗客混雑度を通常または予測ベースで記述します。</li>
            <li>GTFS Realtime で記述される混雑情報の可用性を補完し、過去の傾向に基づく将来の便(trip)の静的予測を提供します。これにより、乗客は混雑度の好みや快適さに基づいて便を計画することができます。</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://developers.google.com/transit/gtfs/reference/gtfs-extensions" class="no-icon" target="_blank">Google Transit Extensions to GTFS</a></h3>
            <p class="maintainer"><a href="https://developers.google.com/transit" class="no-icon" target="_blank">Google</a> によって管理されています</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>翻訳サポートを提供し、ルートタイプを拡張し、より詳細な乗り継ぎルールを可能にし、その他多くの機能を追加します。</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://www.transitwiki.org/TransitWiki/index.php/File:GTFS%2B_Additional_Files_Format_Ver_1.7.pdf" class="no-icon" target="_blank">MTC GTFS+</a></h3>
            <p class="maintainer"><a href="https://mtc.ca.gov/" class="no-icon" target="_blank">MTC</a> によって管理されています</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>サンフランシスコ湾岸地域の Metropolitan Transportation Commission によって作成されました。追加のリアルタイム情報、経路案内、乗客カテゴリなどを追加します。</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://github.com/mbta/gtfs-documentation/" class="no-icon" target="_blank">MBTA</a></h3>
            <p class="maintainer"><a href="https://www.mbta.com/" class="no-icon" target="_blank">MBTA</a> によって管理されています</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>定時運行の追跡チェックポイント、駅や施設情報などを追加します。</li>
        </ul>
    </div>
    </div>
    <div class="row">
        <div class="leftcontainer">
                <h3 class="title"><a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">GTFS-Eligibilities</a></h3>
                <p class="maintainer"><a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">オレゴン州運輸局</a> によって管理されています</p>
        </div>
        <div class="featurelist">
            <p>GTFS-eligibilities は、ユーザーアカウントに基づいて運行するシステムが、便がユーザーアカウント情報に基づいて利用可能かどうかを理解できるようにするという概念に基づいています。これは、提案されたフィールドが以下を提供することを意味します：</p>
            <ul>
                <li>年齢、性別、会社所属、便の目的、提供される支援レベルなど、ユーザーアカウントに関連する共通属性。</li>
                <li>ローカルに定義された属性やステータスのカスタマイズ可能な認証。カスタムの利用資格が提供され、それがどのように認証されるかを理解する方法も提供されます。</li>
            </ul>
        </div>
    </div>
     <div class="row">
        <div class="leftcontainer">
                <h3 class="title"><a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">GTFS-Capabilities</a></h3>
                <p class="maintainer"><a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">オレゴン州運輸局</a> によって管理されています</p>
        </div>
        <div class="featurelist">
            <p>障害のある人や移動補助具を持つ人に対応するために、サービスが提供できる追加機能を記述します。</p>
            <ul>
                <li>運転手やその他の事業者提供の人的リソースなど、乗客に提供されるサービスに関する情報。</li>
                <li><a href="https://docs.google.com/document/d/156RiBjI6FnWJvO8_XWX11Q9nLdOiBdS_rilA-oamlv8/edit#heading=h.tosuo6e9e0z7">GTFS-VehicleCategories</a> 仕様でさらに拡張された車両情報は、GTFS-VehicleBoardings に含まれ、列車編成や推奨乗車エリアを表現します。<a href="https://docs.google.com/document/d/1mcQ-oEaP5WiGh46DmUQqmeS-rQ5W96L-c3TRKinGS0g/edit#heading=h.oxdoxruczgni">GTFS-seats</a> のドラフト拡張も参照してください。</li>
                <li>移動補助具に関連する車両設備の記述に重点を置き、それらの補助具での乗車が他の乗客や補助具の収容能力にどのように影響するかを説明します。</li>
            </ul>
        </div>
    </div>
    <div class="row"></div>

=== "GTFS Realtime"

    GTFS Realtime フィードには、事業者とソフトウェアベンダー間でやり取りされるさまざまなアプリケーション固有のニーズに対応するために、追加のファイルやフィールドを拡張することができます。これらのフィールドは [公式仕様](../../../documentation/realtime/reference) に含まれていない場合でも利用可能です。 
    
    以下は実装可能な GTFS Realtime 拡張機能の一覧です。
    
    !!! info "仕様における拡張機能を公式化する方法" 
        
        拡張機能はアクティブな提案となり、その後 [仕様改訂プロセス](../../governance/gtfs_realtime_amendment_process/) を通じて [公式仕様に統合](../../../documentation/realtime/change-history/recent_additions/) されることがあります。
    
    !!! note "このリストへの貢献"

        GTFS コミュニティと共有したい拡張機能がありますか？ GTFS.org に拡張機能を追加するリクエストは <a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">こちら</a> から行えます。

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://docs.google.com/document/d/1qJOTe4m_a4dcJnvXYt4smYj4QQ1ejZ8CvLBYzDM5IyM/edit#bookmark=id.av58okxmwekh" class="no-icon" target="_blank">GTFS-PathwayUpdates</a></h3>
            <p class="maintainer"><a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a> によって管理されています</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>エレベーターの停止や通路の閉鎖など、駅の構内通路(pathway)のリアルタイムの変更を記述します。</li>
        </ul>
    </div>
    </div>

    <div class="row">
    <div class="leftcontainer">
            <h3 class="title"><a href="https://github.com/google/transit/pull/212" class="no-icon" target="_blank">GTFS-OccupancyStatus</a></h3>
            <p class="maintainer"><a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a> によって管理されています</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>交通機関の車両の混雑状況をリアルタイムで提供します。</li>
        </ul>
    </div>
    </div>

    <div class="row"></div>

詳細については [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) までお問い合わせください。
