# GTFSデータセットの作成 {: #creating-a-gtfs-dataset}

## GTFSフィードの概要 {: #overview-of-a-gtfs-feed}

すべてのGTFSフィードは、GTFS Reference形式のデータセットから始まります。これは、`.txt`拡張子で保存された一連のCSVファイルです[^1]。最も基本的な実装では、GTFSデータセットは通常7つの基本ファイルから始まり、それらを`.zip`ファイルにまとめ、安定した公開URLでホストします。これがGTFSフィードです。

<img class="center" width="560" height="100%" src="../../../assets/create_001.png">

各ファイルは、複数のレコード（データ行）のリストで構成され、いくつかの情報フィールドを持ちます。例えば、[routes.txt](../../documentation/schedule/reference/#routestxt) に記載されている各行は公共交通のルート・路線系統(route)を表し、そのフィールドはルート名、説明、運行事業者など、そのルートに関する複数の要素を記述します。

<img class="center" width="560" height="100%" src="../../../assets/create_002.png">

GTFSデータセットの基本ファイルは次のように説明できます。GTFSスケジュールデータセットには1つ以上のルート・路線系統(route)（[routes.txt](../../documentation/schedule/reference/#routestxt)）があり、各ルートには1つ以上の便(trip)（[trips.txt](../../documentation/schedule/reference/#tripstxt)）があります。各便は、指定された時刻（[stop_times.txt](../../documentation/schedule/reference/#stop_timestxt)）に一連の停留所等(stop)（[stops.txt](../../documentation/schedule/reference/#stopstxt)）を訪れます。便と停車時刻(stop_time)には時刻情報のみが含まれ、どの日にその便が運行されるかはカレンダー（[calendar.txt](../../documentation/schedule/reference/#calendartxt) および [calendar_dates.txt](../../documentation/schedule/reference/#calendar_datestxt)）によって決定されます。さらに、複数の事業者（[agency.txt](../../documentation/schedule/reference/#agencytxt)）が複数のルートを運行することができます。これらのファイルは、相互参照されるフィールドによって互いにリンクされています。

<img class="center" width="560" height="100%" src="../../../assets/create_003.png">

これらのファイルを設定して基本的なGTFSデータセットを作成した後、追加の（任意の）ファイルを加えることで、交通事業者とベンダー間の他の機能や特定のニーズに対応することができます。これらのファイルの例としては以下のものがあります：

- [shapes.txt](../../documentation/schedule/reference/#shapestxt)：便のルート形状(shape)をグラフィカルに表現することができます。  
- [pathways.txt](../../documentation/schedule/reference/#pathwaystxt)：利用者が駅構内を移動する際の経路案内を生成できる情報を提供します。  
- [frequencies.txt](../../documentation/schedule/reference/#frequenciestxt)：停車時刻(stop_time)を指定する代替方法を提供します。  

有効化できるすべてのGTFS機能については、[「GTFSでできること」](../features/overview/) セクションをご覧ください。  

GTFSスケジュールデータセットは、車両位置情報(vehicle position)や運行情報(alert)などのリアルタイム情報で補完することができます。そのためには、既存のGTFSスケジュールデータセットとは別にGTFS Realtimeフィードを作成する必要があります。  

GTFS Realtimeフィードは、HTTP経由で配信され頻繁に更新される通常のバイナリファイルで構成されます。任意の種類のWebサーバーがこのファイルをホストして配信することができます。GTFS Realtimeのデータ交換形式は、構造化データをシリアライズするための言語・プラットフォーム中立の仕組みである [Protocol Buffers](https://developers.google.com/protocol-buffers/) に基づいています。GTFS Realtimeは、便の更新(trip update)、運行情報(alert)、車両位置情報(vehicle position)の3種類の情報を提供することができ、伝達する必要のある運行情報に応じてこれらを組み合わせることができます。  

GTFS Realtimeは車両群の実際の運行状況を提示できるため、フィードは定期的に更新する必要があります。理想的には、サービスの自動車両位置情報システムから新しいデータが入るたびに更新するべきです。GTFSスケジュールデータセットとGTFS Realtimeフィードを組み合わせることで、利用アプリケーションは乗客に正確で最新の情報を提供できるようになります。詳細については技術文書をご参照ください。  

## 初めてのGTFSフィードを作成するには？ {: #producing-your-first-gtfs-feed}

事業者として初めてGTFSフィードを作成しようとしている場合、最初に行うべきことは既存のドキュメントを読むことです。

まずは ["GTFSでできること"](../features/overview) セクションを参照し、GTFSフォーマットを使って表現したい自社の交通サービスのさまざまな機能を確認してください。さらに詳しく調べるには、[GTFS Schedule](../../documentation/schedule/reference) および [GTFS Realtime](../../documentation/realtime/reference) の公式リファレンスドキュメントを参照することで、これらの機能をどのようにモデル化し、準拠を確保するかについての詳細なガイダンスを得ることができます。

次に、自社のシステムからすべての必須データを収集してください。これには、すべての停留所(stop)、ルート・路線系統(route)、時刻表、運賃などの情報が含まれます。これらの多くはGTFSデータセットを構成する入力データとなります。

システムの規模や複雑さに応じて、データを自社で作成するか、外部のGTFSベンダーに依頼してGTFSフォーマットに変換してもらうかを選択することができます。

一部の小規模な事業者では、少数のルート・路線系統を対象に、スプレッドシートやテキストエディタといった一般的に利用可能なソフトウェアを使って自分たちでデータを作成しています。

一方で、より大規模なシステムを扱う場合、多くの事業者は専門ベンダーから専用のGTFS管理ソフトウェアを導入しますが、自社で独自の内部ツールを開発する場合もあります。最終的に、システムの特性が複雑で事業者自身でデータセットを作成するのが困難な場合、GTFSデータの作成を専門に行う企業に全面的にアウトソースすることも可能です。

<a href="https://www.flaticon.com/authors/freepik" title="Icons by Freepik">アイコン作成者: Freepik - Flaticon</a>

[^1]: テキストファイルに加えて、[GeoJSON](https://geojson.org/) フォーマットもGTFSでサポートされており、デマンド型サービスの一部要素を表現するために利用できます。
