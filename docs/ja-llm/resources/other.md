# その他のリソース {: #other-resources}

## コミュニティ {: #community}


質問をしたり、他のコミュニティリソースを見つける場所です。

- [MobilityData Slack チャット](https://share.mobilitydata.org/slack) - #gtfs、#gtfs-validators、#mobility-database、#gtfs-realtime、#gtfs_best-practices、#gtfs-pathways、#gtfs-fares、#gtfs-flex、#trb-transit-data といったチャンネルを含むチャットルームです。
- [Transit Developers メーリングリスト](https://groups.google.com/forum/#!forum/transit-developers)
- [OpenTripPlanner](https://github.com/opentripplanner/OpenTripPlanner) コミュニティ
    - [OpenTripPlanner ユーザーメーリングリスト](https://groups.google.com/forum/#!forum/opentripplanner-users)
    - [OpenTripPlanner 開発者メーリングリスト](https://groups.google.com/forum/#!forum/opentripplanner-dev)
- OneBusAway
    - [OneBusAway 開発者メーリングリスト](http://groups.google.com/group/onebusaway-developers)
    - [OneBusAway API メーリングリスト](http://groups.google.com/group/onebusaway-api)

### ローカルおよび地域グループ {: #local-and-regional-groups}

- [Transit Techies NYC](https://transittechies.nyc/) - NYCを拠点とする対面/オンラインのハイブリッドミートアップ。[スピーカーリスト](https://transittechies.nyc/past)には、このリポジトリへの多くの貢献者が含まれています。
- [German Open Transport Meetup](https://github.com/transportkollektiv/meetup/wiki) - ドイツ語圏のオープントランスポートコミュニティによる[隔週](https://hackmd.okfn.de/opentransportmeetup#)オンラインミートアップ。
- [German Open Transport Data Quality Meetup](https://github.com/transportkollektiv/meetup/wiki) - データ品質に特化したドイツ語圏のオープントランスポートコミュニティによる隔月オンラインミートアップ。

## 調査と解説 {: #research-and-commentary}


オープンな公共交通データに関連するブログ記事やレポート。

### ブログ記事 {: #blog-posts}


- [When(ish) is my bus? Data and code](https://github.com/mjskay/when-ish-is-my-bus) - 「Whenish is my bus?」の背後にあるデータとコード（R）。データには3日分の過去の車両位置情報と調査結果が含まれています。
- ["Legacy AVL system? It's okay, join the club." by Kurt Raschke](https://kurtraschke.com/2015/01/legacy-avl-export) - レガシーAVLシステムのデータをGTFS-realtime形式に変換するための選択肢についての議論。
- ["GTFS Best Practices now available!" by Sean Barbeau](https://medium.com/@sjbarbeau/gtfs-best-practices-now-available-88ac67194233) - GTFSのようなオープンデータ形式における課題と、データ品質の改善を目的として2017年初頭に公開されたGTFS Best Practicesについての解説。
- ["What's new in GTFS-realtime v2.0" by Sean Barbeau](https://medium.com/@sjbarbeau/whats-new-in-gtfs-realtime-v2-0-cd45e6a861e9) - GTFS-realtime v1.0の不足点と、v2.0での改善点についての解説。
- ["AVL, CAD, and Real-Time Passenger Info for Beginners" by Tony Laidig](http://transitdata.net/avl-cad-and-real-time-passenger-info-for-beginners/) - 車両を追跡するために使用される技術の一般的な紹介。
- ["Visualizing Better Transportation: Data & Tools" by Steve Pepple](https://medium.com/@stevepepple/visualizing-better-transportation-data-tools-e48b8317a21c) - サンフランシスコ・ベイエリアや北米の他都市向けに収集された交通関連のデータとツールのコレクション。もともとは2018年にサンフランシスコのARUPで開催されたTransit Weekイベントで収集・議論されたものです。
- ["How to use GTFS data to track transit vehicles in realtime" by Tom Camp](https://www.ably.io/blog/gtfs-data-track-transit-vehicles-realtime) - GTFSとGTFS Realtimeを使用して、継続的なリアルタイム更新を提供する方法。

### 学術論文 {: #academic-papers}


- [Tang ほか - "Ridership effects of real-time bus information system: A case study in the City of Chicago"](https://www.sciencedirect.com/science/article/pii/S0968090X12000022) - イリノイ州シカゴでの実験では、乗客がテキストメッセージやメールを通じてリアルタイム情報にアクセスできる場合、利用者数がわずかに増加することが示されました。
- [Kay ほか - "When(ish) is my bus? User-centered Visualizations of Uncertainty in Everyday, Mobile Predictive Systems"](https://www.mjskay.com/papers/chi_2016_uncertain_bus.pdf) - 本論文は「交通予測における不確実性をどのように伝えるか？」という問いに答えようとしています。問題点、既存の解決策を説明し、[乗客がバス停に到着すべきタイミングを知らせるためのより良いインターフェース](https://github.com/mjskay/when-ish-is-my-bus/blob/master/quantile-dotplots.md#quantile-dotplots)を設計しています。
- [Watkins ほか - "Where Is My Bus? Impact of mobile real-time information on the perceived and actual wait time of transit riders"](https://www.sciencedirect.com/science/article/pii/S0965856411001030) - ワシントン州シアトルでの実験では、乗客がモバイルアプリを通じてリアルタイム情報にアクセスできる場合、待ち時間が短く感じられることが示されました。
- [Brakewood ほか - “An experiment evaluating the impacts of real-time transit information on bus riders in Tampa, Florida”](https://www.sciencedirect.com/science/article/pii/S0965856414002146) - フロリダ州タンパでの統制実験では、モバイルアプリを通じてリアルタイム情報にアクセスできる乗客は、アクセスできない乗客と比べて待ち時間が約2分短く感じられることが示されました。リアルタイム情報を利用できる乗客は、不安や苛立ちが減少し、事業者への評価も向上しました。
- [Brakewood ほか - "The impact of real-time information on bus ridership in New York City"](https://www.sciencedirect.com/science/article/pii/S0968090X15000297) - ニューヨーク市での実験では、リアルタイム情報が乗客に提供された場合、長距離ルートでの利用者数が増加することが示されました。
- [Brakewood および Watkins - "A literature review of the passenger benefits of real-time transit information"](https://www.tandfonline.com/doi/full/10.1080/01441647.2018.1472147?scroll=top&needAccess=true) (2018) - リアルタイム交通情報の利点に関するさまざまな研究を概観しています。
- [Gramacki ほか - "gtfs2vec - Learning GTFS Embeddings for comparing Public Transport Offer in Microregions"](2021) - Uber の H3 空間インデックスと機械学習を用いて、都市内の「類似した」公共交通サービス品質の地域を特定する手法。ソースコードは [GitHub](https://github.com/pwr-inf/gtfs2vec) で公開されています。
- [Higgins ほか - "Calculating place-based transit accessibility: Methods, tools and algorithmic dependence" (2022)](https://doi.org/10.5198/jtlu.2022.2012) - ArcGIS Pro、Emme、R5R、OpenTripPlanner を含む徒歩および公共交通によるアクセシビリティ計算のためのソフトウェアツールを比較しています。
- [Aemmer ほか - "Measurement and classification of transit delays using GTFS-RT data"](https://link.springer.com/article/10.1007/s12469-022-00291-7) - General Transit Feed Specification のリアルタイム(GTFS-RT)コンポーネントから交通パフォーマンス指標を抽出し、それを道路区間ごとに集約する手法を提示しています。[Transit Vis](https://github.com/zackAemmer/transit_vis) と併用され、[こちら](https://www.transitvis.com/)で閲覧可能です。

### 政府レポート {: #government-reports}

- [APTA Policy Development and Research - Public Transportation Embracing Open Data](http://www.apta.com/resources/reportsandpublications/Documents/APTA-Embracing-Open-Data.pdf) - 公共交通オープンデータの利点と課題についての APTA による議論（以下の TCRP レポートの短い要約）。
- [TCRP Synthesis 115 - Open Data: Challenges and Opportunities for Transit Agencies](http://onlinepubs.trb.org/Onlinepubs/tcrp/tcrp_syn_115.pdf) (2015) - 公共交通オープンデータの利点と課題を包括的に検討したレポート。
- [TCRP Research Report 213: Data Sharing Guidance for Public Transit Agencies – Now and in the Future](http://www.trb.org/Main/Blurbs/180188.aspx) (2020) - 事業者がデータ共有に関する意思決定を行う際に役立つよう設計されたレポートで、利点、コスト、リスクの評価方法を含む。
- [TCRP G-16 Development of Transactional Data Specifications for Demand-Responsive Transportation (進行中)](http://apps.trb.org/cmsfeed/TRBNetProjectDisplay.asp?ProjectID=4120) - この研究の目的は、デマンド型交通を提供する事業体向けのトランザクションデータに関する技術仕様を策定することです。完了予定日は2018年末。

### コミュニティによって維持されているリスト {: #community-maintained-lists}

- [GTFS 作成/維持管理サービスを提供するベンダー](https://docs.google.com/spreadsheets/u/1/d/1Gc9mu4BIYC8ORpv2IbbVnT3q8VQ3xkeY7Hz068vT_GQ/pubhtml) - 新しいベンダーを追加する場合は[こちら](http://goo.gl/forms/YDbPSPmufS)。
- [交通ソフトウェア開発コンサルティングサービスを提供する組織](https://docs.google.com/spreadsheets/u/1/d/1n44CNMCK1vt1nyrsdYz-KD_hYxUMNIm6Me69M6ROBIg/pubhtml) - 新しい組織を追加する場合は[こちら](http://goo.gl/forms/cc6kcVERuP)。
