# GTFS データセットの作成

## GTFS フィードの概要
すべての GTFS フィードは、GTFS リファレンス形式のデータセットから始まります。これは、 .txtファイル拡張子で保存された一連の CSV ファイルです[^1]。最も基本的な実装では、GTFS データセットは通常、7 つのベースファイルから始まり、安定したパブリック URL でホストされる .zip ファイルにまとめられます。これが GTFS フィードです。

<img class="center" width="560" height="100%" src="../../../assets/create_001.png"> 

各ファイルは、複数の情報フィールドを持つ複数のレコード（データ行）のリストで構成されています。たとえば、[routes.txt](../../documentation/schedule/reference/#routestxt) にリストされている各行は公共交通機関のルートを表し、そのフィールドはルートの名前、説明、運行事業者など、ルートの複数の要素を記述します。

<img class="center" width="560" height="100%" src="../../../assets/create_002.png"> 

GTFS データセットのベースファイルは、次のように記述できます。GTFSGTFS scheduleデータセットには 1 つ以上のルート・路線系統([routes.txt](../../documentation/schedule/reference/#routestxt)) が含まれ、各ルートには 1 つ以上の便([trips.txt](../../documentation/schedule/reference/#tripstxt)) が含まれ、各旅行は指定された時間 ([stops.txt](../../documentation/schedule/reference/#stop_timestxt)) に一連の停留所等([stop_times.txt](../../documentation/schedule/reference/#stopstxt)) を訪問します。便と停車時刻には時刻情報のみが含まれます。カレンダーは、特定の旅行が実行される日を決定するために使用されます ([calendar.txt](../../documentation/schedule/reference/#calendartxt) および [calendar_dates.txt](../../documentation/schedule/reference/#calendar_datestxt))。さらに、複数の機関 ([agency.txt](../../documentation/schedule/reference/#agencytxt)) が複数のルート・路線系統を運行できます。これらのファイルは、相互参照されるフィールドによって互いにリンクされています。

<img class="center" width="560" height="100%" src="../../../assets/create_003.png"> 

これらのファイルを設定し、基本的な GTFS データセットを作成したら、その他の機能や交通機関とベンダー間の特定のニーズに対応するために、追加の (任意) ファイルを追加できます。これらのファイルの例としては、次のようなものがあります。

- [shapes.txt](../../documentation/schedule/reference/#shapestxt) は、旅行の経路をグラフィカルに表現できます。
- [pathways.txt](../../documentation/schedule/reference/#pathwaystxt) は、ユーザーが駅をナビゲートするのに役立つ道順を生成するための情報を提供します。
- [frequencies.txt](../../documentation/schedule/reference/#frequenciestxt) は、停車時刻を指定するための別の方法を提供します。

有効にできるすべての GTFS 機能の詳細については、[“GTFS で何ができるのか?”](../機能/overview/) セクションを参照してください。 GTFS scheduleデータセットは、車両の位置やサービス更新などのリアルタイム情報で補完できます。そのためには、既存のGTFS realtimeGTFS scheduleデータセットとは別にGTFS realtimeフィードを作成する必要があります。

GTFS realtimeフィードは、HTTP 経由で提供され、頻繁に更新される通常のバイナリ ファイルで構成されており、あらゆる種類のウェブサーバーでファイルをホストして提供できます。GTFS リアルタイム データ交換形式は、[プロトコル バッファ](https:) に基づいています。これは、構造化データをシリアル化する言語およびプラットフォームに依存しないメカニズムです。GTFSGTFS realtimeは、ルート更新、サービス アラート、車両位置の 3 種類の情報を提供できます。これらは、通信する必要があるサービス情報に応じて組み合わせることができますGTFS realtimeでは車両の実際の状態を表示できるため、フィードは定期的に更新する必要があります。サービスの自動車両位置システムから新しいデータが届くたびに更新するのが理想的です。 GTFS scheduleデータセットとGTFS realtimeフィードを組み合わせることで、アプリケーションは正確で最新の情報を乗客に提供できるようになります。詳細については、技術ドキュメントを参照してください。

## 最初の GTFS フィードを作成しますか?

最初の GTFS フィードを作成しようとしている事業者の場合、まず既存のドキュメントを読む必要があります。

まず、["GTFS で何ができますか?"](../features/overview) セクションで GTFS の機能を調べ、GTFS 形式を使用して表現する交通サービスのさまざまな機能を決定します。さらに詳しく調べるには、[GTFS schedule](../../documentation/schedule/reference) と [GTFS realtime](../../documentation/realtime/reference) の公式リファレンス ドキュメントに、これらの機能をモデル化してコンプライアンスを確保するための詳細なガイダンスが記載されています。

次に、システムから必須データをすべて収集します。これには、すべての停留所等、ルート・路線系統、時刻表、運賃などの情報が含まれます。これらの詳細の多くは、GTFS データセットに入力される情報です。

システムの規模と複雑さに応じて、社内でデータを作成するか、外部の GTFS ベンダーに依頼してデータを GTFS 形式に変換するかを選択できます。

場合によっては、ルート・路線系統が少数しかない小規模な機関が、スプレッドシートやTextエディタなどの一般に入手可能なソフトウェアを使用して自分でデータを作成します。

より大規模なシステム範囲を扱う場合、ほとんどの機関は専門のベンダーから専用の GTFS 管理ソフトウェアを購入しますが、独自の社内ツールを開発することを選択する機関もあります。最後に、システムの特性上、機関が独自にデータセットを作成することが難しいことが判明した場合は、GTFS データの作成を専門とする企業に完全に外注することができます

<a href="https://www.flaticon.com/authors/freepik" title="アイコンはFreepikによるものです">。Icons created by Freepik- Flaticon</a> 

[^1]: Textファイルに加えて、デマンドレスポンシブサービスの特定の要素を表すために、[GeoJSON](https://geojson.org/) 形式も GTFS でサポートされるようになりました。
