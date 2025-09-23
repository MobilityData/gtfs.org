# リソース概要 {: #resources-overview}


!!! info "このセクションはレビュー中です" 

    このセクションは現在、awesome-transit リストの内容を反映しています。一部の外部リンクが古くなっている可能性があることにご注意ください。このリストの内容に関してフィードバックを提供する場合は、[awesome-transit リポジトリ](https://github.com/MobilityData/awesome-transit) に issue または pull request を作成してください。このセクションのレビュー済みバージョンは将来的に公開される予定です。

### 公共交通のオープンソース技術に関するデータ標準、API、アプリ、ツール、データセット、研究のコミュニティリスト {: #community-list-of-data-standards-apis-apps-tools-datasets-and-research-around-open-source-technology-of-public-transit}


オープン技術は、さまざまな関係者が協力して公共交通を改善する機会を提供します。

オープン技術の要素には以下が含まれます:
- オープン標準
- オープンデータ
- オープンソースソフトウェア（OpenTripPlanner のような利用者向けアプリや、GTFS Validator のような開発者向けツールの両方）

このリストは、公共交通におけるオープン技術のエコシステムに焦点を当てています。含まれる技術は、それ自体がオープンソースである場合や、オープン標準やオープンデータに依存している場合があります。

追加や変更がありますか？ [MobilityData/awesome-transit](https://github.com/MobilityData/awesome-transit) の [pull request](https://github.com/MobilityData/awesome-transit/pulls) または [issue](https://github.com/MobilityData/awesome-transit/issues) を開いてください。


[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome) [![RSS](https://img.shields.io/badge/Subscribe-RSS-blue.svg)](https://github.com/MobilityData/awesome-transit/commits/master.atom)

------------------------------

## 目次 {: #table-of-contents}

- [データの作成](../producing-data)
  - [GTFS](../producing-data/#gtfs)
    - [GTFS ライブラリ](../producing-data/#gtfs-libraries)
    - [GTFS コンバータ](../producing-data/#gtfs-converters)
    - [GTFS データ収集・保守ツール](../producing-data/#gtfs-data-collection-and-maintenance-tools)
    - [GTFS マージツール](../producing-data/#gtfs-merge-tools)
    - [GTFS 分析ツール](../producing-data/#gtfs-analysis-tools)
    - [GTFS 時刻表公開ツール](../producing-data/#gtfs-timetable-publishing-tools)
    - [GTFS バリデータ](../producing-data/#gtfs-validators)
  - [GTFS Realtime](../producing-data/#gtfs-realtime)
    - [GTFS Realtime ライブラリ & デモアプリ](../producing-data/#gtfs-realtime-libraries--demo-apps)
    - [GTFS Realtime バリデータ](../producing-data/#gtfs-realtime-validators)
    - [GTFS Realtime（およびその他リアルタイム API）アーカイブツール](../producing-data/#gtfs-realtime-and-other-real-time-api-archival-tools)
    - [GTFS Realtime コンバータ](../producing-data/#gtfs-realtime-convertors)
    - [GTFS Realtime ユーティリティ](../producing-data/#gtfs-realtime-utilities)
  - [SIRI](../producing-data/#siri)
  - [その他のマルチモーダルデータ形式](../producing-data/#other-multimodal-data-formats)
- [データの共有](../sharing-data)
- [データの利用](../using-data)
  - [利用者向けアプリ](../using-data/#consumer-apps)
    - [Web アプリ（オープンソース）](../using-data/#web-apps-open-source)
    - [Web アプリ（クローズドソース）](../using-data/#web-apps-closed-source)
    - [ネイティブアプリ（オープンソース）](../using-data/#native-apps-open-source)
    - [ネイティブアプリ（クローズドソース）](../using-data/#native-apps-closed-source)
  - [ハードウェア](../using-data/#hardware)
  - [API 作成用ソフトウェア](../using-data/#software-for-creating-apis)
  - [SDK](../using-data/#sdks)
  - [可視化](../using-data/#visualizations)
  - [事業者向けツール](../using-data/#agency-tools)
- [その他のリソース](../other)
  - [コミュニティ](../other/#community)

## ライセンス {: #license}


[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/)

法律の範囲内で可能な限り、[MobilityData](https://mobilitydata.org/)、[University of South Florida](http://www.usf.edu/) の [Center for Urban Transportation Research](https://www.cutr.usf.edu/)、および [Luqmaan Dawoodjee](https://github.com/luqmaan) は、この作品に対するすべての著作権および関連または隣接する権利を放棄しています。

## 概要 {: #about}

これは情報提供のみを目的としたコミュニティリソースです。プロジェクトや製品の掲載は推奨を意味するものではありません。

このリストは、あなたのようなオープンソースコミュニティの貢献者によって構築・維持されています！ [MobilityData](https://mobilitydata.org/) がこのプロジェクトを管理しています。  

Awesome-transit はもともと [Luqmaan Dawoodjee](https://github.com/luqmaan) によって作成され、[University of South Florida](http://www.usf.edu/) の [Center for Urban Transportation Research](https://www.cutr.usf.edu/) によって数年間管理された後、MobilityData に移管されました。
