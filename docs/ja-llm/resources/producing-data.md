# データの作成 {: #producing-data}

## GTFS {: #gtfs}


- 一般的な公共交通フィード仕様 (General Transit Feed Specification) の公式ドキュメントサイト [GTFS.org](https://gtfs.org)

### GTFS コース {: #gtfs-courses}


- [MobilityData - "Understanding GTFS: An intro and overview"](https://www.youtube.com/watch?v=SDz2460AjNo) - この動画では、General Transit Feed Specification (GTFS) の概要と、それが交通事業者、乗客、政策立案者にとってなぜ有用であるかを説明しています。 
- [World Bank - "Intro. to GTFS" オンラインコース](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping) - GTFS および GTFS-realtime について学ぶための、無料の自己学習型オンラインコースです。
- [Open Transit Data Toolkit](http://transitdatatoolkit.com/) - オープンな交通データを活用するための一連のレッスンです。
- [ArcGIS - Introduction to GTFS](https://www.youtube.com/watch?v=8OQKHhu1VgQ&t=148s)
- [GTFS-books](https://github.com/MobilityData/GTFS-books) - GTFS および GTFS Realtime に関する包括的なガイドです。これらの書籍は [Quentin Zervaas](https://github.com/HendX) によって執筆され、[MobilityData](https://mobilitydata.org/) に寄贈され、オープンアクセスとして公開されています。
- [MBTA GTFS Onboarding](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb) - MBTA によって作成された GTFS static 用のインタラクティブなチュートリアルです。[スタンドアロンの Docker イメージ](https://github.com/mbta/gtfs_onboarding) が GitHub で利用可能であり、また [ホスト型/インストール不要バージョン](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb) の Jupyter notebook も提供されています。
- [Planetizen "Building a Transit Map Web App" コース](https://courses.planetizen.com/course/building-transit-map-app) - コーディング経験がなくても、自分自身のウェブベースの地図アプリケーションを構築する方法を学べるビデオチュートリアルです。

### GTFS コンシューマーアプリ向けガイダンス {: #gtfs-consumer-app-guidance}


- [Google Transit Developers](https://developers.google.com/transit/gtfs/) - Google 固有の GTFS に関する追加ドキュメント。
- [Transit app Guidelines for Producing GTFS Static Data](https://resources.transitapp.com/article/458-guidelines-for-producing-gtfs-static-data-for-transit) - Transit app 固有の GTFS に関する追加ドキュメント。
- [Bing Maps Transit - Add your transit data to Bing Maps](https://www.bing.com/maps/transitcontentproviders) - Bing 固有の GTFS に関する追加ドキュメント。
- [Yandex Maps - Transport integration](https://yandex.ru/support/m-maps/transport.html?lang=en#connect-display) - Yandex 固有の GTFS に関する追加ドキュメント。

### GTFSライブラリ {: #gtfs-libraries}


さまざまな言語でGTFSデータを簡単に利用できるようにするソフトウェア。

#### C {: #c}

- [CGTFS](https://github.com/rakhack/cgtfs) - 静的なGTFSフィードを読み込むためのCライブラリです。展開済みのフィードをアプリケーションメモリまたはSQLiteデータベースに読み込むことをサポートしています。
- [RRRR Rapid Real-time Routing](https://github.com/bliksemlabs/rrrr) - RRRR（通常はR4と発音されます）は、RAPTOR公共交通ルーティングアルゴリズムのC言語による実装です。

#### C++ {: #c}

-  [just_gtfs](https://github.com/mesozoic-drones/just_gtfs) - GTFS の読み書きのための C++17 ヘッダオンリーライブラリ（[Valhalla](https://github.com/valhalla/valhalla) で使用されています）。主な機能: GTFS フィードの高速な読み書き、[拡張 GTFS route types](https://developers.google.com/transit/gtfs/reference/extended-route-types) のサポート、GTFS の日付および時刻フォーマットの簡単な操作。

#### C# {: #c}

- [ESRI public-transit-tools](https://github.com/Esri/public-transit-tools) - ArcGIS で公共交通データを扱うためのツール（ArcGIS のライセンスが必要です）。
- [GTFS Feed Parser](https://github.com/OsmSharp/GTFS) - GTFS パーサーの .Net/Mono 実装。

#### Go {: #go}

- [Go GTFS Parser](https://github.com/geops/gtfsparser) - Go 向けの GTFS パースライブラリ。

#### Java {: #java}

- [OneBusAway GTFS Modules](https://github.com/OneBusAway/onebusaway-gtfs-modules/wiki) - データベースサポートを含む、GTFS形式の公共交通データを読み込み、書き込み、変換するためのJavaベースのライブラリ。

#### JavaScript {: #javascript}

- [gtfs-sequelize](https://github.com/evansiroky/gtfs-sequelize) - sequelize.js を使用して静的 GTFS をモデリングする Node.js ライブラリです。
- [gtfs-utils](https://github.com/public-transport/gtfs-utils) – GTFS データセットを処理するためのユーティリティ（例: `calendar.txt` と `calendar_dates.txt` の「フラット化」、便(trip)の到着/出発時刻の計算）。
- [gtfs-via-postgres](https://github.com/derhuerst/gtfs-via-postgres) – PostgreSQL を使用して GTFS を処理するためのツールです。
- [Node-GTFS](https://github.com/BlinkTagInc/node-gtfs) - GTFS ファイルから交通データを読み込み、解凍して SQLite データベースに保存します。事業者、ルート・路線系統(route)、停留所等(stop)、時刻を検索するためのメソッドを提供します。

#### PostgreSQL {: #postgresql}

- [gtfs-schema](https://github.com/tyleragreen/gtfs-schema) - GTFSフィード用のPostgreSQLスキーマ。
- [gtfs-via-postgres](https://github.com/derhuerst/gtfs-via-postgres) – PostgreSQLを使用してGTFSを処理するための別のツール。

#### Python {: #python}

- [ESRI public-transit-tools](https://github.com/Esri/public-transit-tools) - ArcGIS で公共交通データを扱うためのツール（ArcGIS のライセンスが必要です）。
- [gtfsdb](https://github.com/OpenTransitTools/gtfsdb) - GTFS ファイルをリレーショナルデータベースに変換するための Python ライブラリ。
- [gtfs_functions](https://github.com/Bondify/gtfs_functions) - GTFS フィードから地理空間的な可視化を作成するための便利な関数を提供する Python パッケージ。
- [gtfs-segments](https://github.com/UTEL-UIUC/gtfs_segments) - バスの GTFS データをセグメントを用いて簡潔な表形式で表現する Python パッケージ。
- [gtfslib-python](https://github.com/afimb/gtfslib-python) - GTFS ファイルを読み込み、公共交通ネットワークに関するさまざまな統計や指標を計算するためのオープンソース Python ライブラリ。
- [gtfsman](https://github.com/geops/gtfsman) - 大量の GTFS フィードを管理・更新するためのリポジトリ風ツール（Python 製）。
- [gtfspy](https://github.com/CxAalto/gtfspy) - Python3 を用いた公共交通ネットワーク分析および所要時間計算。Postgres/PostGIS、Oracle、MySQL、SQLite に対応。[gtfspy-webviz](https://github.com/CxAalto/gtfspy-webviz) で利用されています。
- [GTFS Kit](https://github.com/mrcagney/gtfs_kit) - General Transit Feed Specification (GTFS) データを分析するための Python 3.8+ ツールキット。GTFSTK の後継。
- [Make GTFS](https://github.com/mrcagney/make_gtfs) - 基本的な路線情報から GTFS フィードを作成するための Python ライブラリ。
- [Mapzen GTFS](https://github.com/transitland/mapzen-gtfs) - 個別の GTFS テーブルの読み込みや、フィード内の各事業者を表すグラフの構築をサポートする Python GTFS ライブラリ。
- [multigtfs](https://github.com/tulsawebdevs/django-multi-gtfs) - GTFS をインポートおよびエクスポートするための Django アプリケーション。
- [partridge](https://github.com/remix/partridge) - pandas DataFrame 上に構築された、高速で柔軟な Python 製 GTFS リーダー。
- [transit_service_analyst](https://github.com/psrc/transit_service_analyst) - 公共交通サービス分析を支援する Python ライブラリ。
- [TransitGPT](https://github.com/UTEL-UIUC/TransitGPT) - Generative AI を活用したチャットボットで、自然言語による指示を通じて General Transit Feed Specification (GTFS) データにアクセス・分析することを可能にします。

#### R {: #r}

- [r-transit](https://github.com/r-transit) - R における GTFS のためのツール集。
- [gtfsio](https://github.com/r-transit/gtfsio) - R で GTFS を読み書きするための高速かつ柔軟な関数。
- [tidytransit](https://github.com/r-transit/tidytransit) - transit の停留所等(stop)やルート・路線系統(route)を地図化し、所要時間や運行頻度を計算し、フィードを検証するために tidytransit を使用します。tidytransit は General Transit Feed Specification を tidyverse および simple features のデータフレームに読み込みます。

#### Ruby {: #ruby}

- [GTFS-viz](https://github.com/vasile/GTFS-viz) - 一連の GTFS ファイルを SQLite データベースと GeoJSON に変換する Ruby スクリプト（[Transit Map](https://github.com/vasile/transit-map) Web アプリケーションで必要）

#### Rust {: #rust}

- [gtfs-structure](https://github.com/rust-transit/gtfs-structure) - このクレートは GTFS の構造体と、GTFS アーカイブを読み込むためのヘルパーを提供します。

### GTFS コンバータ {: #gtfs-converters}


さまざまな静的な時刻表フォーマットと GTFS との間の変換ツール。

- [Chouette](https://enroute.atlassian.net/wiki/spaces/PUBLIC/pages/539426886/Chouette+Convert) - フランスの Transmodel [NeTEX](https://transmodel-cen.eu/index.php/netex/) と GTFS の間で変換します。
- [extract-gtfs-pathways](https://github.com/derhuerst/extract-gtfs-pathways) – コマンドラインツールで、GTFS データセットから pathway を GeoJSON として抽出します。
- [extract-gtfs-shapes](https://github.com/derhuerst/extract-gtfs-shapes) – コマンドラインツールで、GTFS データセットから shape を GeoJSON として抽出します。
- [GTFS-OSM-Sync](https://github.com/CUTR-at-USF/gtfs-osm-sync) - GTFS フォーマットのデータを [OpenStreetMap.org](http://www.openstreetmap.org/) と同期する Java ツール。
- [gtfs-parser](https://github.com/ioTransit/gtfs-parser) - GTFS をパースし、クライアントまたはサーバー上で geojson を生成するための Javascript ライブラリ。
- [gtfs-service-area](https://github.com/cal-itp/gtfs-service-area) - 静的 GTFS から公共交通のサービスエリアを計算します。結果は単一レイヤーの .geojson ファイルとして出力されます。[gtfs-to-geojson](https://github.com/BlinkTagInc/gtfs-to-geojson) の Docker 化バージョン。
- [GTFS-route-shapes](https://github.com/kotrc/GTFS-route-shapes) - GTFS アーカイブ内の各公共交通ルートに対して単一の geoJSON shape を生成する Python スクリプト。
- [gtfs-to-geojson](https://github.com/BlinkTagInc/gtfs-to-geojson) - GTFS の shape と stop を geoJSON に変換する Javascript ツール。公共交通ルートの地図を作成するのに便利です。
- [gtfs2gps](https://github.com/ipeaGIT/gtfs2gps) - GTFS フォーマットの公共交通データを GPS 風の `data.table` レコードに変換する R パッケージ。各行は、特定の空間解像度における各車両のタイムスタンプを表します。
- [gtfs2emis](https://github.com/ipeaGIT/gtfs2emis) - GTFS データに基づいて公共交通車両の排出レベルを推定する R パッケージ。
- [gtsf](https://github.com/r-gtfs/gtsf) - R における general transit (GTFS) simple (geographic) features (sf)。GDAL を通じて GTFS から Shapefile、GeoJSON、その他のフォーマットに変換するために使用できます。
- [hafas-generate-gtfs](https://github.com/derhuerst/hafas-generate-gtfs) *(開発中)* – HAFAS エンドポイントから GTFS ダンプを生成する Javascript ツール。
- [Hafas2GTFS](https://github.com/geops/hafas2gtfs) - Python で書かれた Hafas2GTFS コンバータ。SBB HAFAS フィード向けに最適化されています。
- [kml-to-gtfs-shapes](https://github.com/bdferris/kml-to-gtfs-shapes/tree/gh-pages) - KML ファイルのポリラインを GTFS の shapes.txt ファイルに変換する Javascript ツール。GitHub 上で [こちら](http://bdferris.github.io/kml-to-gtfs-shapes/) にホストされています。
- [NeTEx-to-GTFS Converter Java](https://github.com/entur/netex-gtfs-converter-java) - NeTEX データセットを GTFS データセットに変換します。入力の NeTEX データセットは Nordic NeTEx Profile に従う必要があります。
- [o2g](https://github.com/hiposfer/o2g) - OpenStreetMap から GTFS フィードを抽出するシンプルなツール。
- [Open-Transport SYNTHESE Convertors](https://github.com/Open-Transport/synthese/wiki) - French-Transmodel、SIRI、NETeX、HAFAS、HASTUS、VDV452 などを変換します。
- [onebusaway-gtfs-to-barefoot](https://github.com/OneBusAway/onebusaway-gtfs-to-barefoot) - GTFS ファイルから [Barefoot](https://github.com/bmwcarit/barefoot) マップファイルを作成する Java ツール。
- [onebusaway-vdv-modules](https://github.com/OneBusAway/onebusaway-vdv-modules) - VDV フォーマットの公共交通データを扱う Java ライブラリ。VDV-452 の時刻表データを GTFS に変換する機能を含みます。
- [osm2gtfs](https://github.com/grote/osm2gtfs) - OpenStreetMap データと時刻表情報を GTFS に変換します。
- [transit_model](https://github.com/hove-io/transit_model) - Rust ライブラリで、以下のフォーマットとの相互変換を行います: GTFS、NTFS (Navitia 用、[API 作成用ソフトウェア](#software-for-creating-apis) を参照)、TransXChange (英国仕様)、KV1 (オランダ仕様)、NeTEx (EU 仕様)。
- [transloc-gtfs-rectifier](https://github.com/laidig/transloc-gtfs-rectifier) - GTFS の stop_id を [TransLoc](http://transloc.com/) の ID に割り当てようとする Python アプリケーション。[TransLoc](http://transloc.com/) は API で GTFS の `stop_ids` を提供していません。
- [Transmodel and IFF to GTFS](https://github.com/bliksemlabs/bliksemintegration) - (Transmodel) BISON Koppelvlak1、IFF (HP/EDS によって作成された ATCO CIF に類似したフォーマット) の時刻表をインポート・同期します。内部の疑似 NETeX データ構造により GTFS へのエクスポートが可能で、NETeX、GTFS、IFF など他のフォーマットへのエクスポートの概念実証もあります。
- [Transporter-Project transxchange-to-gtfs](https://github.com/Transporter-Project/transxchange-to-gtfs) - Objective-C で書かれた TransXChange から GTFS へのコンバータ。
- [TXC TransXChange publisher (UK Department for Transport)](https://www.gov.uk/government/publications/transxchange-publisher) - TXC TransXChange publisher は、TransXChange 準拠の XML ドキュメントを読みやすく印刷しやすいフォーマットで公開するためのスタンドアロンソフトウェアツールです。
- [UK2GTFS](https://itsleeds.github.io/UK2GTFS/) - 英国フォーマットの TransXchange (バス、地下鉄、トラム、フェリー) および CIF (鉄道) の時刻表を GTFS に変換する R パッケージ。

### GTFS データ収集および保守ツール {: #gtfs-data-collection-and-maintenance-tools}


- [AddTransit](https://addtransit.com/gtfs-transit-file.php) - GTFS 形式で時刻表を作成、編集、公開するための SaaS (Software as a Service) プラットフォーム。
- [bus-router](https://github.com/atlregional/bus-router) - [Google Maps Directions API](https://developers.google.com/maps/documentation/directions/) または [OSRM](https://github.com/Project-OSRM/osrm-backend/wiki/Server-api) を利用して GTFS の欠落している shapes.txt を生成する Python スクリプト。
- [gtfs-blocks-to-transfers](https://github.com/TransitApp/GTFS-blocks-to-transfers) - [trip.block\_id](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#example-blocks-and-service-day) によって定義された GTFS ブロックを、一連の [便間乗り換え (提案)](https://github.com/google/transit/pull/303) に変換する Python ツール。
- [GTFS Diff](https://transport.data.gouv.fr/tools/gtfs_diff) - transport.data.gouv.fr によって作成された仕様で、GTFS ファイル間の差分をシンプルかつ統一的に表現することを目的としています。
- [GTFS Editor](https://github.com/conveyal/gtfs-editor) - (セルフホスト型) Web ベースの GTFS 編集フレームワーク。（注: このプロジェクトは [IBI Data Tools](https://github.com/ibi-group/datatools-ui) に置き換えられています。）
- [GTFS Editor for Vagrant](https://github.com/laidig/vagrant-gtfs-editor) - [Vagrant](https://www.vagrantup.com/) を使用して上記の GTFS Editor を素早くセットアップ。
- [static-GTFS-manager](https://github.com/WRI-Cities/static-GTFS-manager) - (セルフホスト型) ブラウザベースのユーザーインターフェースで、静的 GTFS の作成、編集、エクスポートを行うツール（[関連投稿](https://groups.google.com/forum/#!topic/transit-developers/GFz5rTJTB0I) を参照）。
- [TransitWand](https://github.com/conveyal/transit-wand) - 公共交通データを収集するためのオープンソース Web およびモバイルアプリケーション。GTFS フィードの作成、乗客数の記録、GIS データセットの生成に利用可能。
- [IBI Data Tools](https://github.com/ibi-group/datatools-ui) - GTFS の編集、検証、品質チェック、OpenTripPlanner へのデプロイを行う Web アプリケーション。（廃止された [Gtfs Data Manager](https://github.com/conveyal/gtfs-data-manager) および [GTFS Editor](https://github.com/conveyal/gtfs-editor) の機能を統合・拡張。）
- [IBI Data Tools Infra](https://github.com/cal-itp/ibi-datatools-infra) - 上記 IBI Data Tools プロジェクトのローカルインスタンスを素早くセットアップして実行するためのツール。  
- [GTFS.html](https://gtfs.pleasantprogrammer.com) - 完全にブラウザベースで GTFS フィードを閲覧するツール。ルート、停留所、時刻表などを表示可能。
- [pfaedle](https://github.com/ad-freiburg/pfaedle) - OpenStreetMap データを利用した GTFS の高精度マップマッチング。
- [GTFS shape mapfit](https://github.com/HSLdevcom/gtfs_shape_mapfit) - GTFS の shape ファイルと停留所を指定された OSM マップファイルに適合させる Python ツール。[pymapmatch](https://github.com/tru-hy/pymapmatch) を利用してマッチングを実行。
- [GTFS Builder](http://nationalrtap.org/Web-Apps/GTFS-Builder) - GTFS ファイル作成を支援する無料の Web アプリケーション。National Rural Transit Assistance Program (RTAP) によって管理。
- [gtfs-station-builder](https://github.com/kostjerry/gtfs-station-builder) - 駅の内部構造（pathways.txt を含む）を構築するための UI ツール。
- [GTFS Text-to-Speech Tester](https://github.com/BlinkTagInc/node-gtfs-tts) - GTFS の停留所名を Text-to-Speech で読み上げ、stops.txt の tts_stop_name に Text-to-Speech 値が必要かどうかを判定するコマンドラインツール。
- [Spare GTFS-Flex Builder](https://sparelabs.com/en/spare-gtfs-flex-builder) - 交通事業者が GTFS-Flex 形式で交通データを簡単に作成、管理、エクスポートできる無料ツール。
- [Swiftly](https://goswift.ly/) - リアルタイム交通データを生成するツール。
- [Chouette SaaS](https://bitbucket.org/enroute-mobi/chouette-core) - GTFS Schedule データを生成するツール。
- [Ara SaaS](https://bitbucket.org/enroute-mobi/ara) - GTFS Realtime データを生成するツール。
- [Amarillo](https://github.com/mfdz/amarillo) - カープールの提供情報を集約・拡張し、GTFS(-RT) として公開するツール。

### GTFS マージツール {: #gtfs-merge-tools}

- [combine_gtfs_feeds](https://github.com/psrc/combine_gtfs_feeds) - 複数の GTFS フィードを1つのフィード/データセットに結合するための Python ツールです。
- [GTFS Kit](https://github.com/mrcagney/gtfs_kit) - General Transit Feed Specification (GTFS) データを分析およびマージするための Python 3.8+ ツールキットです。[フィードを集約およびクリーンアップする方法についてはこちら](https://mrcagney.github.io/gtfs_kit_docs/index.html#module-gtfs_kit.cleaners)をご覧ください。
- [Transitfeed merge function](https://github.com/google/transitfeed/wiki/Merge) - 2つの異なる GTFS フィードをマージする関数を備えた Python ライブラリです。
- [gtfsmerge](https://github.com/now8-org/gtfsmerge) - GTFS ZIP アーカイブを1つにマージするための Python スクリプトです。

### GTFS 分析ツール {: #gtfs-analysis-tools}


- [GTFS Kit](https://github.com/mrcagney/gtfs_kit) - General Transit Feed Specification (GTFS) データを分析するための Python 3.6+ ツールキットです。[GTFSTK](https://github.com/araichev/gtfstk) の後継です。
- [gtfstools](https://github.com/ipeaGIT/gtfstools) - R で GTFS 形式の交通フィードを編集・分析するための便利なツールセットです。
- [transit_service_analyst](https://github.com/psrc/transit_service_analyst) - 公共交通サービス分析を支援する Python ライブラリです。
- [Peartree](https://github.com/kuanb/peartree) - 公共交通データをネットワーク分析用の有向グラフに変換する Python ライブラリです。
- [R5: Rapid Realistic Routing on Real-world and Reimagined networks](https://github.com/conveyal/r5) - Conveyal によって開発された Java ベースのルーティングエンジンで、マルチモーダル（公共交通/自転車/徒歩/自動車）ネットワークに対応しています。シナリオ計画や分析のために、時間窓内で多数の便を計画することができます。関連する R ラッパーパッケージ ([r5r](https://github.com/ipeaGIT/r5r/)) は IPEA によって独自に開発されています。以下にリンクされている Higgins ら (2022) による性能比較も参照してください。
- [tidytransit](https://github.com/r-transit/tidytransit) - GTFS データを tibbles や simple features データフレームに読み込み、公共交通の停留所等やルートを地図化し、所要時間や運行頻度を計算し、フィードを検証するための R パッケージです。
- [transitr](https://github.com/tmelliott/transitr) - 公共交通ネットワークをリアルタイムで構築・モデリングし、車両の到着予測時刻 (ETA) を取得するための R パッケージです。
- [transit-intensity](https://github.com/ioTransit/transit-intensity) - 公共交通の強度を測定するためのシンプルな Go 言語プロジェクトです。
- [Busbuzzard](https://github.com/bmander/busbuzzard) - 公共交通車両に関する実データから確率的な時刻表を推定します。
- [ESRI ArcGIS Public Transit Tools (GTFS)](https://github.com/Esri/public-transit-tools) - ArcGIS で公共交通データを扱うためのツールです。
- [GTFS-to-Chart](https://github.com/BlinkTagInc/gtfs-to-chart) - GTFS データから、公共交通ルート上のすべての車両を示すストリングラインチャートを作成します。
- [GTFS Display](https://codeberg.org/dancingCycle/gtfs-display) - GTFS データを分析・監視・維持するためのツールです（[実例](https://www.swingbe.de/activity/gtfs-display/)）。
- [PTNA](https://wiki.openstreetmap.org/wiki/Public_Transport_Network_Analysis) - Public Transit Network Analysis は、OSM にマッピングされた公共交通路線に関する情報を検索・集約するためのオープンソースシステムです。

### GTFS 時刻表公開ツール {: #gtfs-timetable-publishing-tools}


- [GTFS-to-HTML](https://gtfstohtml.com) - GTFS から直接、人間が読みやすい HTML または PDF 形式の時刻表を生成します。
- [Timetable Kit](https://github.com/neroden/timetable_kit) - [GTFS Kit](https://github.com/mrcagney/gtfs_kit) に依存するオープンソースの Python 3.10 モジュールおよびスクリプトで、柔軟なレイアウトを持つ複雑な印刷用/PDF 時刻表を作成するために設計されています。現在は Amtrak の GTFS に対してのみすぐに利用可能ですが、活発に開発が進められています。 
- [TimeTablePublisher (TTPUB)](https://github.com/OpenTransitTools/ttpub) - TriMet によって開発されたウェブ公開システムで、交通事業者が生の運行データを確認、修正、変換し、利用者向けの読みやすい時刻表にすることを可能にします。

### GTFS バリデータ {: #gtfs-validators}


- [Conveyal の gtfs-validator](https://github.com/conveyal/gtfs-validator) - OneBusAway GTFS Modules に基づいた Java ベースの GTFS バリデータで、Java 上で動作し、Google 提供のものより高速です。
- [Conveyal の gtfs-lib](https://github.com/conveyal/gtfs-lib/) - Conveyal が自らの [gtfs-validator](https://github.com/conveyal/gtfs-validator) の後継として開発した Java ベースのライブラリで、任意のサイズの GTFS フィードをディスクバックストレージを用いて読み込み・保存することができます。
- [Google の feedValidator](https://github.com/google/transitfeed/wiki/FeedValidator) - Google がサポートする Python ベースの GTFS バリデータです。
- [GTFS Data Package Specification](https://github.com/Stephen-Gates/GTFS) - Good Tables を用いてバリデーションを行う Data Package 仕様です。データパッケージ、スキーマ、テストを含み、サンプルとして South East Queensland の GTFS データを使用しています。
- [gtfstidy](https://github.com/patrickbr/gtfstidy) - GTFS フィードを整理・検証する Go ベースのツールです。
- [gtfsclean](https://github.com/public-transport/gtfsclean) - GTFS フィードのチェック、サニタイズ、最小化を行うツールです。gtfstidy のフォークで、まだ上流にマージされていない追加修正が含まれています。
- [gtfs-validator-api](https://github.com/cal-itp/gtfs-validator-api) - [MobilityData/gtfs-validator](https://github.com/MobilityData/gtfs-validator) をラップする Python パッケージで、中間ファイルの処理や出力ファイルの特定を行い、特定の名前を付けたり文字列として返すことができます。
- [GTFSVTOR](https://github.com/mecatran/gtfsvtor) - [Mecatran](https://www.mecatran.com/) によってメンテナンスされている、GPLv3 ライセンスの Java 実装によるオープンソース GTFS バリデータです。
- [MobilityData の gtfs-validator](https://github.com/MobilityData/gtfs-validator) - GTFS 仕様に準拠した正統なオープンソース GTFS バリデータで、Java によって実装され、Apache v2.0 ライセンスの下で [MobilityData](https://mobilitydata.org/) によってメンテナンスされています。
- [Reflect GTFS Validator (Foursquare ITP によってホスト)](https://reflect.foursquareitp.com) - [Foursquare ITP](https://www.foursquareitp.com) による交通時刻表および GTFS バリデーションプラットフォームで、[gtfs-lib](https://github.com/conveyal/gtfs-lib/) に基づいた無料の Web ベース GTFS バリデータを含みます。
- [Transit App の gtfs-fares-v2-validator](https://github.com/TransitApp/gtfs-fares-v2-validator) - [ドラフト仕様](https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#) に基づいて GTFS-Fares-v2 データを検証する Python ツールです。
- [Transport Validator](https://github.com/etalab/transport-validator/) - [Rust](https://www.rust-lang.org/) で実装されたオープンソースのバリデータです。[フランス国立アクセスポイント](https://transport.data.gouv.fr/validation/) によって使用されています。
- [gtfs-accessiblity-validator](https://github.com/BlinkTagInc/gtfs-accessibility-validator) - GTFS ファイル内のアクセシビリティ関連フィールドやファイルの存在を検証します。コマンドラインツールまたは node.js パッケージとして利用できます。

## GTFS Realtime {: #gtfs-realtime}


- [GTFS-realtime ドキュメント](https://github.com/google/transit/tree/master/gtfs-realtime)
- [GTFS-realtime Autodoc](https://laidig.github.io/gtfs-rt-autodoc/index.html) - 公式の [GTFS-realtime protocol buffer specification](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成されたいくつかの拡張を含む、GTFS-realtime の自動生成ドキュメント

### GTFS Realtime ライブラリ & デモアプリケーション {: #gtfs-realtime-libraries-demo-apps}


- [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) - 公式の [GTFS-realtime protocol buffer specification](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成された Java、.NET、Node.js、Python、Ruby 用の公式バインディングです。
- [gtfs-rt](https://crates.io/crates/gtfs-rt) - GTFS-Realtime データを読み取り、書き込み、操作するための Rust クレートです。
- [GTFS-realtime Exporter](https://github.com/OneBusAway/onebusaway-gtfs-realtime-exporter/wiki) - GTFS-realtime フィードの生成と共有を支援する Java ベースのツールです。
- [GTFS-realtime Alerts Producer Demo](https://github.com/OneBusAway/onebusaway-gtfs-realtime-alerts-producer-demo/wiki) - GTFS-realtime 運行情報(alert)を生成するための Java ベースのデモプロジェクトです。
- [GTFS-realtime Alerts Producer Web Application](https://github.com/OneBusAway/onebusaway-service-alerts) - GTFS-realtime 運行情報(alert)を生成するための Java ベースの Web アプリケーションです。
- [GTFS-realtime TripUpdates & VehiclePositions Producer Demo](https://github.com/OneBusAway/onebusaway-gtfs-realtime-trip-updates-producer-demo/wiki) - GTFS-realtime 便の更新(trip update)（到着予測）および車両位置情報(vehicle position)を生成するための Java ベースのデモプロジェクトです。
- [GTFS-realtime Vehicle Positions Consumer/Visualizer Demo](https://github.com/OneBusAway/onebusaway-gtfs-realtime-visualizer) - GTFS-realtime 車両位置情報(vehicle position)フィードを取得し、その情報を地図上に表示する Java ベースのデモプロジェクトです。

### GTFS Realtime バリデータ {: #gtfs-realtime-validators}


- [gtfs-realtime-validator](https://github.com/MobilityData/gtfs-realtime-validator) - 元々はサウスフロリダ大学の [Center for Urban Transportation Research](https://www.cutr.usf.edu/) によって開発され、現在は [MobilityData](https://mobilitydata.org/) によって保守されている GTFS Realtime 検証ツールです。

### GTFS Realtime（およびその他のリアルタイム API）アーカイブツール {: #gtfs-realtime-and-other-real-time-api-archival-tools}


- [GTFS-realtime to SQL](https://github.com/OpenMobilityData/GtfsRealTimeToSql) - GTFS-Realtime フィードを SQL データベースに解析します（[OpenMobilityData.org](https://openmobilitydata.org) で使用されています）
- [gtfsrdb](https://github.com/CUTR-at-USF/gtfsrdb) - GTFS-realtime フィードをデータベースに読み込み・アーカイブすることをサポートする Python ツール
- [retro-gtfs](https://github.com/SAUSy-Lab/retro-gtfs) - Nextbus API からリアルタイムデータを収集し、GTFS 形式にアーカイブする Python アプリケーション（すなわち、回顧的 GTFS）
- [Transi](https://gitlab.com/cutr-at-usf/transi) - クラウドネイティブな GTFS-RT/GTFS アーカイブシステム
- [GTFS-Realtime-Capsule](https://github.com/tsdataclinic/gtfs-realtime-capsule) - リアルタイムの公共交通データをスクレイピング、正規化、アーカイブするコマンドラインツール
- [gtfsdb_realtime](https://github.com/OpenTransitTools/gtfsdb_realtime) - リアルタイム GTFS データベースローダーおよび ORM ライブラリ

### GTFS Realtime コンバータ {: #gtfs-realtime-convertors}


- [SIRI to GTFS-realtime](https://github.com/OneBusAway/onebusaway-gtfs-realtime-from-siri-cli) - [SIRI format](https://www.siri.org.uk/) から GTFS-realtime へ変換する Java ベースのコマンドラインユーティリティ
- [OrbCAD SQL Server to GTFS-realtime](https://github.com/CUTR-at-USF/HART-GTFS-realtimeGenerator/) - OrbCAD SQL Server から車両位置情報(vehicle positions)と便の更新(trip updates)情報を抽出し、GTFS-realtime の TripUpdates および VehiclePositions フォーマットにエクスポートする Java ベースのコマンドラインユーティリティ
- [NextBus API to GTFS-realtime](https://github.com/OneBusAway/onebusaway-gtfs-realtime-from-nextbus-cli/wiki) - [NextBus API format](http://www.nextbus.com/xmlFeedDocs/NextBusXMLFeed.pdf) から GTFS-realtime へ変換する Java ベースのコマンドラインユーティリティ。なお、NextBus は現在、製品向けに直接 GTFS-realtime API を提供しています。[Cubic site](http://nextbus.cubic.com/Products/Real-Time-Rider-Information) および [この FAQ](https://medium.com/omnimodal/want-more-riders-open-up-your-nextbus-api-with-gtfs-realtime-7387c80f31e1#.pkuzizhl5) を参照してください。
- [Syncromatics API to GTFS-realtime](https://github.com/CUTR-at-USF/bullrunner-gtfs-realtime-generator) - [Syncromatics API](http://www.syncromatics.com/) フォーマットから GTFS-realtime TripUpdates および VehiclePositions へ変換する Java ベースのコマンドラインユーティリティ
- [KV6,15,17, and ARNU to GTFS-realtime](https://github.com/bliksemlabs/bliksemintegration-realtime) - KV6,15,17 および ARNU を処理し、RID 統合データベースに存在する静的な交通データと照合する Java ベースのツール。その後、このデータを ARNU RITinfo、GTFS(realtime)、KV78turbo としてエクスポートします。
- [WMATA BusPositions API to GTFS-realtime](https://github.com/kurtraschke/wmata-gtfsrealtime) - WMATA の [BusPositions API](https://developer.wmata.com/docs/services/54763629281d83086473f231/operations/5476362a281d830c946a3d68) および [MetroAlerts](http://www.wmata.com/rider_tools/metro_service_status/rail_bus.cfm?) の Alert RSS フィードを GTFS-realtime TripUpdates、VehiclePositions、Alerts フィードに変換する Java ベースのツール
- [SEPTA API to GTFS-realtime](https://github.com/kurtraschke/septa-gtfsrealtime) - [SEPTA](http://www.septa.org/) の [リアルタイムバス・鉄道データ](http://www3.septa.org/hackathon/) を GTFS-realtime に変換する Java ベースのツール
- [CTA API to GTFS-realtime](https://github.com/kurtraschke/ctatt-gtfsrealtime) - [CTA](http://www.transitchicago.com/) の [Train Tracker データ](http://www.transitchicago.com/developers/traintracker.aspx) を GTFS-realtime に変換する Java ベースのツール
- [Detroit DOT to GTFS-realtime](https://github.com/prashtx/ddot-avl) - [DDOT](http://www.detroitmi.gov/How-Do-I/Locate-Transportation/Bus-Schedules) の TransitMaster インストール（データベース）からリアルタイム情報を抽出し、GTFS-realtime に変換
- [Live Transit Event Trigger](https://github.com/ipublic/live_transit_event_trigger) - [Ride On](http://www.montgomerycountymd.gov/dot-transit/) の OrbCAD データベースからデータを抽出し、GTFS-realtime としてエクスポート
- [SoundTransit to GTFS-realtime](https://github.com/bdferris/onebusaway-sound-transit-realtime) - [Sound Transit](http://www.soundtransit.org/) のテキストファイルフィードを GTFS-realtime に変換
- [Civic Transit](https://github.com/jestin/CivicTransit) - [KCATA](http://www.kcata.org/) の TransitMaster WebWatch インストールをスクリーンスクレイピングし、GTFS-realtime フィードを生成
- [GTFS-realtime VehiclePositions to GTFS-realtime TripUpdates (TransitClock)](https://thetransitclock.github.io/) - 生の車両位置情報(vehicle positions)を取り込み、GTFS-realtime などのフォーマットで予測時刻を生成できる Java アプリケーション。以前は "Transitime" として知られていました。
- [gtfs-realtime-translators](https://github.com/Intersection/gtfs-realtime-translators) - カスタム到着 API フォーマットを GTFS-realtime に変換する Python ベースのツール。2019年7月時点で LA Metro と SEPTA をサポートしています。
- [Transloc API to GTFS-realtime](https://github.com/jonathonwpowell/transloc-to-gtfs-real-time) - Transloc API を GTFS-realtime に変換する Node.js ベースのツール
- [hafas-gtfs-rt-feed](https://github.com/derhuerst/hafas-gtfs-rt-feed) – HAFAS エンドポイントから GTFS Realtime フィードを生成する Javascript ツール
- [GTFS-realtime to SIRI-Lite](https://github.com/etalab/transpo-rt/) - 複数の GTFS-RT フィードを SIRI-Lite API に変換する [Rust](https://www.rust-lang.org/) 製の Web サーバ

### GTFS Realtime ユーティリティ {: #gtfs-realtime-utilities}


- [bus_kalman](https://github.com/cmoscardi/bus_kalman) - NYC MTA のリアルタイムデータを使用してバスの走行時間を補間するためのカルマンフィルタ。
- [Concentrate](https://github.com/mbta/concentrate) - 複数のソースからのリアルタイム交通情報を単一の出力ファイルに統合します。[Massachusetts Bay Transportation Authority (MBTA)](https://github.com/mbta) によって保守されています。
- [gtfs-realtime-test-service](https://github.com/CUTR-at-USF/gtfs-realtime-test-service) - GTFS-realtime フィードの内容をモック化するためのツール（例: GTFS-realtime を利用するアプリケーションのテスト用）。
- [GTFS-realtime Munin Plugin](https://github.com/OneBusAway/onebusaway-gtfs-realtime-munin-plugin) - GTFS-realtime フィードに関する情報を記録するための [Munin](http://munin-monitoring.org/) プラグインを提供します。
- [GTFS-realtime Nagio Plugin](https://github.com/OneBusAway/onebusaway-gtfs-realtime-nagios-plugin) - GTFS-realtime フィードを監視するための [Nagios](https://www.nagios.org/) プラグインを提供します。
- [GTFS-realtime Printer](https://github.com/laidig/gtfs-rt-printer) - GTFS-realtime ファイルまたは URL から情報を出力する Java ベースのユーティリティ。
- [gtfs-rt-admin](https://github.com/conveyal/gtfs-rt-admin) - GTFS-RT サービスアラートを管理するための管理ツール（JavaScript および Java）。
- [gtfs-rt-differential-to-full-dataset](https://github.com/derhuerst/gtfs-rt-differential-to-full-dataset) – 連続的な GTFS Realtime ストリームの `DIFFERENTIAL` 増分データを `FULL_DATASET` ダンプに変換する JavaScript ツール。
- [gtfs-rt-dump](https://github.com/kurtraschke/gtfs-rt-dump) - プロトコルバッファ形式をプレーンテキストに変換し、GTFS-realtime フィードをプレーンテキストで簡単に閲覧できるようにします（デバッグ目的）。
- [gtfs-rt-inspector](https://public-transport.github.io/gtfs-rt-inspector/) – 任意の（CORS 対応の）GTFS Realtime フィードを検査・分析する Web アプリ。[GitHub](https://github.com/public-transport/gtfs-rt-inspector) でオープンソース公開。
- [GTFS Data Pipeline for TfNSW Bus Datasets](https://github.com/teckkean/GTFS-Data-Pipeline-TfNSW-Bus) - TfNSW の GTFS 静的データおよびリアルタイムデータセット用に開発されたデータパイプライン。このパイプラインで生成されたデータセットは、TfNSW の公共交通情報・優先システム (PTIPS) を介した信号優先リクエストの性能検証に使用されています。
- [manual-gtfsrt](https://github.com/pailakka/manual-gtfsrt) - 編集可能な JSON から作成された GTFS-RT フィードを提供する Go ベースのツール。
- [print-gtfs-rt-cli](https://github.com/derhuerst/print-gtfs-rt-cli) – 標準入力から GTFS Realtime フィードを読み込み、人間が読みやすい形式または JSON として出力する JavaScript ツール。
- [transitcast](https://github.com/OpenTransitTools/transitcast) - GTFS および GTFS-RT 車両位置情報フィードを使用し、各車両が予定された停留所等(stop)から次の停留所等(stop)へ移動する推定所要時間を生成し、これを "observed_stop_time" テーブルに記録します。これらの記録は後に機械学習モデルの訓練に使用され、車両の走行予測を行うことができます。TriMet によって [FTA IMI プロジェクト](https://trimet.org/imi/program.htm) の一環として作成されました。
- [transit-feed-quality-calculator](https://github.com/CUTR-at-USF/transit-feed-quality-calculator) - [gtfs-realtime-validator](https://github.com/CUTR-at-USF/gtfs-realtime-validator) を使用して多数の交通フィードの品質を評価する Java プロジェクト。フィードの URL はグローバルディレクトリ ([TransitFeeds.com/OpenMobilityData.org](https://openmobilitydata.org/)) から取得します。
- [Transit Network Model](https://github.com/tmelliott/TransitNetworkModel) - GTFS-realtime VehiclePositions、パーティクルフィルタ、およびカルマンフィルタを使用して予測を生成するツール。
- [GTFS Realtime Display](https://codeberg.org/dancingCycle/gtfs-rt-display) - GTFS Realtime データを分析、監視、維持します。[サンプルインスタンス](https://www.swingbe.de/activity/gtfs-rt-display/)
- [GTFS Realtime Prediction Accuracy metrics](https://docs.google.com/document/d/1-AOtPaEViMcY6B5uTAYj7oVkwry3LfAQJg3ihSRTVoU/edit#heading=h.j27shba7rlk6) - GTFS-Realtime の有用な性能指標。

## SIRI {: #siri}


- [SIRI API](https://github.com/OneBusAway/onebusaway/wiki/SIRI-Resources) - v1.0 および v1.3 の [SIRI](https://www.siri.org.uk/) スキーマから生成された Java クラス。
- [SIRI 2.0 API](https://github.com/laidig/siri-20-java) - v2.0 の [SIRI](https://www.siri.org.uk/) スキーマから生成された Java クラス。
- [SIRI to GTFS-realtime](https://github.com/OneBusAway/onebusaway-gtfs-realtime-from-siri-cli/wiki) - [SIRI フォーマット](https://www.siri.org.uk/) から GTFS-realtime へ変換する Java ベースのコマンドラインユーティリティ。
- [SIRI 2.0 Autodoc](https://laidig.github.io/siri-20-java/doc/) - 非常に詳細に注釈された SIRI 2.0 スキーマ定義から自動生成されたドキュメント。
- [King County Metro Legacy AVL to SIRI](https://github.com/bdferris/onebusaway-king-county-metro/tree/master/onebusaway-king-county-metro-legacy-avl-to-siri) - [King County Metro](http://metro.kingcounty.gov/) のレガシー AVL フォーマットを SIRI に変換する Java ベースのツール。
- [SIRI REST Client](https://github.com/CUTR-at-USF/SiriRestClient/wiki) - リアルタイム交通データの RESTful SIRI インターフェースとやり取りするためのオープンソース Android ライブラリ。現在 [MTA Bus Time API](http://bustime.mta.info/wiki/Developers/SIRIIntro) で使用されています。
- [SIRI 1.3 POJOs (Android-compatible)](https://github.com/CUTR-at-USF/onebusaway-siri-api-v13-pojos/wiki) - SIRI v1.3 API のレスポンスをデータバインディング（XML/JSON のデシリアライズ）するための Android 互換 Plain Old Java Objects (POJOs)。 [SIRI REST Client](https://github.com/CUTR-at-USF/SiriRestClient/wiki) で使用されています。
- [pysiri2validator](https://github.com/laidig/pysiri2validator) - Python 3 で書かれたシンプルな SIRI 2.0 バリデータ。
- [Edwig](https://github.com/af83/edwig) - SIRI プロトコルを使用したリアルタイム公共交通データ交換のための golang サーバー。
- [BISON](https://bison.dova.nu/standaarden/nederlands-siri-profiel) - オランダにおける SIRI の実装。

## その他のマルチモーダルデータ形式 {: #other-multimodal-data-formats}

### 広く採用されているもの {: #widely-adopted}

- [APDS](https://www.allianceforparkingdatastandards.org/) - Alliance for Parking Data Standards: [International Parking Institute (IPI)](https://www.parking.org/)、[British Parking Association (BPA)](http://www.britishparking.co.uk/)、[European Parking Association (EPA)](http://www.europeanparking.eu/) によって設立されました。APDS は非営利組織であり、世界中のプラットフォーム間で駐車データを共有できるようにするための統一されたグローバル標準を開発、推進、管理、維持することを使命としています。
- [DATEX](https://datex2.eu/) - 道路交通および旅行情報のための EU データ標準。
- [GBFS](https://gbfs.org/) - General Bikeshare Feed Specification: 自転車シェア、スクーターシェア、モペットシェア、カーシェアに関するリアルタイム情報のためのオープンデータ標準。
    - [gbfs R package](https://github.com/simonpcouch/gbfs) - R で GBFS フィードと連携するための関数群で、指定した都市や自転車シェアプログラムの tidy な .rds データセットを保存・蓄積することができます。
- [MDS](https://github.com/openmobilityfoundation/mobility-data-specification) - Mobility Data Specification: 自治体やモビリティ・アズ・ア・サービス事業者のために、リアルタイムデータの共有、測定、規制を実装するためのフォーマットです。政府が事業者を監督、評価、管理できるようにすることを目的としています。[Open Mobility Foundation](https://www.openmobilityfoundation.org/) によって維持されています。
- [NeTex](http://netex-cen.eu/) - [CEN 標準化プロセス](https://www.cencenelec.eu/european-standardization/european-standards/) によって管理される分散システム間で、複雑な静的交通データを交換するために設計された汎用 XML フォーマット。
- [TODS](https://ods.calitp.org/) - Transit Operational Data Standard: 運転手、配車係、計画担当者が交通運行を実施するために使用する、交通スケジュールを表現する標準フォーマット。
- [TOMP](https://github.com/TOMP-WG/TOMP-API) - Transport Operator Mobility-as-a-service Provider API: 交通事業者およびモビリティ・アズ・ア・サービス事業者が、事業者の発見、旅程計画、エンドユーザーとのやり取り、予約、支払いのために使用する API 標準。

### パイロットまたは開発段階 {: #pilot-or-development-stage}

- [CurbLR](https://github.com/curblr/curblr-spec) - 路側規制のための仕様。
- [Dyno-Demand](https://github.com/osplanning-data-standards/dyno-demand) - サンフランシスコ郡交通局、LMZ LLC、UrbanLabs LLC によって開発された、個々の乗客の *需要* に焦点を当てた、動的ネットワークモデリングに適した GTFS ベースの交通需要データ形式。
- [Dyno-Path](https://github.com/osplanning-data-standards/dyno-path) - （開発中 - [この投稿](https://github.com/osplanning-data-standards/GTFS-PLUS/pull/52#issuecomment-331231000) を参照）個々の乗客の *軌跡* のためのデータ。
- [GTFS-plus](https://github.com/osplanning-data-standards/GTFS-PLUS) - ピュージェットサウンド地域評議会、UrbanLabs LLC、LMZ LLC、サンフランシスコ郡交通局によって開発された、動的交通モデリングに適した *車両および輸送能力データ* のための GTFS ベースの交通ネットワーク形式。
- [GTFS-ride](https://github.com/ODOT-PTS/GTFS-ride) - オレゴン州交通局とオレゴン州立大学のパートナーシップを通じて開発された、固定ルート型公共交通の利用者数データ標準。
- [GTFS-stat](https://github.com/osplanning-data-standards/GTFS-STAT) - UrbanLabs LLC とサンフランシスコ郡交通局によって開発された、パフォーマンスデータを含む追加ファイルを備えた GTFS 交通ネットワークの拡張。
- [GMNS](https://github.com/zephyr-data-specs/GMNS) - General Modeling Network Specification: マルチモーダルな静的および動的交通計画・運用モデルで使用するために設計された、経路探索可能な道路ネットワークファイルを共有するための形式。Volpe/FHWA と Zephyr Foundation のパートナーシップ。
- [GTNS](https://zephyrtransport.org/trb17projects/7-general-travel-network-specification/) - General Travel Network Specification: 交通需要モデルネットワークを共有するために計画されたデータ仕様。
- [IXSI](https://github.com/RWTH-i5-IDSG/ixsi) - 交通情報システムとシェアリングシステム（カーシェア、バイクシェア）の間で情報を交換するためのインターフェース。
- [MTLFS](https://github.com/vta/Managed-and-Tolled-Lanes-Feed-Specification) - Managed and Tolled Lanes Feed Specification: [Santa Clara Valley Transportation Authority](http://www.vta.org/) によって開発された、管理車線および有料車線の料金フィード仕様 (MTLFS) を構成し、それらのファイルで使用されるフィールドを定義するスキーマの提案。
- [MaaS API](https://github.com/maasglobal/maas-tsp-api/blob/master/specs/Booking.md) - MaaS 互換 API を定義する一連のオープンドキュメントとテストスイート。
- [NCHRP 08-119 Developing Data Standards and Guidance for Transportation Planning and Traffic Operations - Phase 1 (Anticipated)](http://apps.trb.org/cmsfeed/TRBNetProjectDisplay.asp?ProjectID=4543) - この研究の目的は、交通計画および運用のために、静的およびリアルタイムデータを収集、管理、共有する際に交通分野で使用・採用される標準やガイダンスを開発することです。
- [OMX: The Open Matrix data file format](https://github.com/osPlanning/omx) - 交通モデリング業界での利用を想定した、二次元配列オブジェクトと関連メタデータの構造化コレクション。
- [OJP](https://github.com/VDVde/OJP) - Open Journey Planner。
- [OSDM](https://github.com/UnionInternationalCheminsdeFer/OSDM) - Open Sales and Distribution Model: 鉄道便の顧客にとって予約プロセスを大幅に簡素化し、販売業者や鉄道事業者にとって複雑さと流通コストを削減することを目的としています。オフラインモデルとオンライン API の仕様を含みます。[国際鉄道連合 (UIC)](https://github.com/UnionInternationalCheminsdeFer) によって管理されています。
- [SAE Shared and Digital Mobility Committee](http://articles.sae.org/15799/) - カーシェアや交通ネットワーク企業 (TNC) / ライドシェアのためのデータ標準に取り組んでいるようです。
- [shared-row](https://github.com/d-wasserman/shared-row) - SharedStreets Reference のための道路占用権 (ROW) の仕様。
- [TCRP G-16 Development of Transactional Data Specifications for Demand-Responsive Transportation (In progress)](http://apps.trb.org/cmsfeed/TRBNetProjectDisplay.asp?ProjectID=4120) - この研究の目的は、デマンド型交通を提供する事業体のための取引データに関する技術仕様を開発することです。完了予定日は 2018 年末です。
- [TIDES](https://github.com/TIDES-transit/TIDES) - Transit ITS Data Exchange Specification (TIDES) は、AVL、APC、AFC データを含む過去の交通 ITS データのための標準データ構造、API、データ管理ツールを作成することを目的とした提案です。

## API を作成するためのソフトウェア {: #software-for-creating-apis}

交通およびマルチモーダルデータに対して API を提供するためにセットアップできるソフトウェアです。

- [GraphHopper Routing Engine](https://github.com/graphhopper/graphhopper/#public-transit) OpenStreetMap 用のオープンソースルーティングエンジン。Java ライブラリまたはサーバーとして使用できます。
- [gtfs-server](https://github.com/denysvitali/gtfs-server) - Rust で書かれた Web サーバーで、PostGIS をバックエンドとして使用し、HTTP エンドポイント経由で GTFS データを提供します。
- [hafas-rest-api](https://github.com/public-transport/hafas-rest-api) – [HAFAS](https://de.wikipedia.org/wiki/HAFAS) エンドポイントを REST API として公開します。
- [Linked Connections](http://linkedconnections.org/) - オープンソースでスケーラブルなインターモーダル経路探索エンジン。サーバーではなくクライアント側で経路探索アルゴリズムを実行できるようにします。GTFS データを使用します。
- [Mobroute](http://sr.ht/~mil/mobroute) - Mobroute は汎用の FOSS 公共交通ルーター（例: 経路検索）で、Go ライブラリおよび CLI として提供されます。交通事業者自身が提供する時刻表 (GTFS) データを直接取り込み（[Mobility Database](https://database.mobilitydata.org/) から取得）、GTFS データに基づいた経路検索リクエストをデバイス上で素早く実行・テストすることができます（CLI 経由）。また、ライブラリとして組み込むことで既存のナビゲーションアプリに GTFS ルーティングを追加することも可能です。
- [MOTIS](https://github.com/motis-project/motis) - C++ および Java で書かれた Multi Objective Travel Information System。GTFS または HAFAS 形式の時刻表データや、GTFS-RT（および Deutsche Bahn の独自形式 RISML）によるリアルタイム情報を入力データとして利用できます。徒歩ルーティング（Per Pedes Routing により処理）や自動車ルーティング（OSRM により処理）には OpenStreetMap データを使用します。
- [Navitia](https://github.com/hove-io/navitia) は [Navitia.io](http://www.navitia.io/) ライブ API の背後にあるオープンソースエンジンです。
- [OneBusAway](http://onebusaway.org/) - GTFS および GTFS-Realtime（[その他の形式](https://github.com/OneBusAway/onebusaway-application-modules/wiki/Real-Time-Data-Configuration-Guide)も含む）を取り込み、使いやすい REST API に変換する Java アプリです。
- [OpenTripPlanner](http://www.opentripplanner.org/) - マルチモーダルかつ複数事業者に対応した旅程計画のためのオープンソースプラットフォームであり、GTFS や [OpenStreetMap](http://www.openstreetmap.org/) などのデータソースを利用してマルチモーダルグラフに関する情報を返すこともできます。
- [pyBikes](https://github.com/eskerda/pybikes) - 世界中のシェアサイクルシステム情報を提供する [CityBikes](http://api.citybik.es) を支えるソフトウェア。
- [Simple Transit Api](https://github.com/ioTransit/simple-transit-api) - Golang で GTFS API を簡単に始める方法。
- [TransitClock](https://thetransitclock.github.io/) - 生の車両位置情報を取り込み、GTFS-realtime などの形式で予測時刻を生成する Java アプリケーション。以前は "Transitime" として知られていました。
- [Transitous](https://transitous.org) - コミュニティ運営による無料かつオープンな公共交通ルーティングサービス。
