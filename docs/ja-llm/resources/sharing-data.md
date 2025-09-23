# データ共有 {: #sharing-data}

GTFSやその他の公共交通およびマルチモーダルデータのコレクションにアクセスできる場所。

### サードパーティによる GTFS URL ディレクトリ {: #3rd-party-gtfs-url-directories}

- [The Mobility Database](https://mobilitydatabase.org/) - 世界中の 2000 以上のモビリティデータセットを収録した JSON および CSV ファイルが [GitHub](https://github.com/MobilityData/mobility-database-catalogs) 上で公開されています。OpenMobilityData/TransitFeeds.com の内容を含みます。
- [Transitland](https://transit.land/) - 多くの交通事業者の GTFS データセットをコミュニティで編集可能なリストとして提供しています。また、データにアクセスするための JSON/GeoJSON API や、データを試すためのプレイグラウンドも提供しています。
- [TransitData.io](https://transitdata.io/) - ラテンアメリカの一部地域における GTFS データのリストです。フィードは公開されていないため、アクセスするにはウェブサイトの管理者に直接連絡しなければなりません。
- [~~OpenMobilityData~~ (非推奨)](https://openmobilitydata.org/) - GTFS および [GTFS-RT](https://openmobilitydata.org/search?q=gtfsrt) フィードのリストです。GTFS フィードを [アーカイブおよび検証](https://openmobilitydata.org/p/capital-metro/24) し、ブラウザ上で [GTFS](https://openmobilitydata.org/p/capital-metro/24/latest) および [GTFS-RT](https://openmobilitydata.org/p/capital-metro/495) をプレビューすることができます。以前は TransitFeeds.com として知られていました。[MobilityData によって発表](https://database.mobilitydata.org/#h.u71vp6xgkckf) された通り、2022 年初頭にサービス終了が決定され、シャットダウン日程は未定です。

### 交通事業者データアーカイブ {: #transit-agency-data-archives}

- [CapMetrics](https://github.com/scascketta/CapMetrics) - オースティンの交通事業者 (CapMetro) の過去の車両位置情報。データは Go デーモンである [capmetricsd](https://github.com/scascketta/capmetricsd) によって収集されています。
- [Bus Observatory API](https://api.busobservatory.org/) - 世界中の交通システムから収集された、車両の移動および状態に関するリアルタイムデータの公開アーカイブ。

### 国の政府データセット {: #national-government-datasets}

- [National Transit Database (アメリカ)](https://www.transit.dot.gov/ntd) - アメリカ合衆国の公共交通システムに関する情報と統計。連邦交通局によって運営されています。
- [transport.data.gouv (フランス)](https://transport.data.gouv.fr/) - フランスの交通エコシステム向けのデータプラットフォーム。
- [欧州長距離交通事業者 (EU) *(非公式)*](https://github.com/public-transport/european-transport-operators) - 利用可能な API エンドポイント、GTFS フィード、クライアントライブラリの非公式リスト

### 独自（非標準）ベンダーAPI {: #proprietary-non-standard-vendor-apis}

- [Transport API](https://www.transportapi.com/) - イギリスの公共交通データを集約したREST API。有料アクセス。
- [NextBus API](http://www.nextbus.com/xmlFeedDocs/NextBusXMLFeed.pdf) - NextBusのハードウェアおよび/またはソフトウェアを購入した事業者向けの、リアルタイム車両、ルート・路線系統(route)、停留所等(stop)、到着データのREST API。
- [Navitia.io](http://www.navitia.io/) - 米国およびEUにおける旅程(journey)計画、停留所等(stop)の時刻表、等時線などを提供するREST API。[Navitia](https://github.com/hove-io/navitia)は、このライブAPIの背後にあるオープンソースエンジンです。
- [CityBikes](http://api.citybik.es) - 世界中のシェア自転車データを集約したREST API。[pyBikes](https://github.com/eskerda/pybikes)によって提供されています。
- [HAFAS](https://de.wikipedia.org/wiki/HAFAS) – [HaCon](https://www.hacon.de)による独自の公共交通管理ソフトウェア（[エンドポイント一覧](https://gist.github.com/derhuerst/2b7ed83bfa5f115125a5)）。
- [Citymapper API](https://docs.external.citymapper.com/api/) - 旅程(journey)計画、リアルタイム交通データ、徒歩・自転車・スクーターの移動時間を提供するREST API。
- [TripGo API](https://developer.tripgo.com) - [SkedGo](https://skedgo.com)によるマルチモーダル旅程(journey)計画とリアルタイムデータのREST API。

### クラウドソースによる交通データ {: #crowdsourced-transit-data}

- [Citylines.co](https://www.citylines.co) - 交通システムを地図化するための協働プラットフォームで、その歴史的な進化に重点を置いています。データは [citylines.co/data](https://www.citylines.co/data) から GeoJSON または CSV 形式でダウンロードすることができます。
- [OpenStreetMap (OSM)](https://www.openstreetmap.org) - 世界を地図化するための協働プラットフォームで、交通、公共交通、経路探索データを含みます。
- [GTFS-Hub](https://github.com/mfdz/gtfs-hub) - コミュニティによってテストされ、おそらく品質や内容が強化され、部分的に統合またはフィルタリングされた（現在はドイツの）交通事業者の GTFS フィード。 [MITFAHR|DE|ZENTRALE](https://github.com/mfdz) によって管理されています。

### ソフトウェアテストに使用されるサンプル GTFS および GTFS Realtime データセット {: #sample-gtfs-and-gtfs-realtime-datasets-used-for-software-testing}

- [sample-gtfs-feed](https://github.com/public-transport/sample-gtfs-feed) - テスト用に使用される架空の GTFS データセット。
- [transitfeed unit tests](https://github.com/google/transitfeed/tree/master/tests/data) - Google が開発した元の [Python GTFS validator](https://github.com/google/transitfeed/wiki/FeedValidator) 用に作成されたテストデータ。
- [Transitland GTFS and GTFS Realtime unit tests](https://github.com/interline-io/transitland-lib) - Transitland 向けに GTFS および GTFS Realtime のパースとバリデーションを処理する [transitland-lib](https://github.com/interline-io/transitland-lib) ライブラリのテスト用:
    - [GTFS - 単一行レベルでの「不正なエンティティ」](https://github.com/interline-io/transitland-lib/tree/master/test/data/bad-entities)
    - [GTFS - 1つ以上のファイルに含まれるエンティティに関連するバリデーションエラー](https://github.com/interline-io/transitland-lib/tree/master/test/data/validator/errors)
    - [GTFS - ベストプラクティス](https://github.com/interline-io/transitland-lib/tree/master/test/data/validator/best-practices)
- [gtfs-realtime-validator unit tests](https://github.com/MobilityData/gtfs-realtime-validator/tree/master/gtfs-realtime-validator-lib/src/test/) - いくつかの [GTFS データセット (zip ファイル)](https://github.com/MobilityData/gtfs-realtime-validator/tree/master/gtfs-realtime-validator-lib/src/test/resources) が含まれており、多数の GTFS RT メッセージが [Java でプログラム的に定義](https://github.com/MobilityData/gtfs-realtime-validator/tree/master/gtfs-realtime-validator-lib/src/test/java/edu/usf/cutr/gtfsrtvalidator/lib/test/rules) されています（gtfs-realtime-bindings ライブラリを使用）。
- [OpenTripPlanner unit tests](https://github.com/opentripplanner/OpenTripPlanner/tree/dev-2.x/src/test) - 一部の [GTFS データセット](https://github.com/opentripplanner/OpenTripPlanner/tree/dev-2.x/src/test/resources/gtfs) がユニットテスト用に定義されています（[GtfsTest](https://github.com/opentripplanner/OpenTripPlanner/blob/dev-2.x/src/test/java/org/opentripplanner/GtfsTest.java) および [mmri フォルダ](https://github.com/opentripplanner/OpenTripPlanner/tree/dev-2.x/src/test/java/org/opentripplanner/mmri)）。
