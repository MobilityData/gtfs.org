# GTFS: 公共交通データを普遍的にアクセス可能にする {: #gtfs-making-public-transit-data-universally-accessible}

## 交通利用者情報のためのオープンデータ標準 {: #an-open-data-standard-for-transit-passenger-information}

GTFS（General Transit Feed Specification）は、標準化されたデータフォーマットであり、事業者が運行スケジュール、停留所等(stop)、運賃などのサービスの詳細を記述するための構造を提供します。

これにより、事業者は自らの交通データを、幅広いソフトウェアアプリケーション（最も一般的には経路検索アプリ）で利用可能なフォーマットで公開することができます。つまり、利用者はスマートフォンや類似のデバイスを使って、公共交通サービスを利用するための旅行情報を簡単に取得できるということです。

<img class="center" width="560" height="100%" src="../../../assets/what-is-gtfs-001.png">

今日、GTFSは世界中の数千の公共交通事業者にとっての標準的な[オープン標準](https://www.interoperablemobility.org/definitions/#open_standard)となっています。事業者自身がこのデータを作成する場合もあれば、ベンダーに依頼してデータを作成・維持してもらう場合もあります。

## 静的データと動的データのサポート {: #support-for-static-and-dynamic-data}


GTFS は、[GTFS Schedule](../../documentation/schedule/reference) と [GTFS Realtime](../../documentation/realtime/reference) の2つの主要な部分で構成されています。

<img class="center" width="560" height="100%" src="../../../assets/what-is-gtfs-002.png">

GTFS Schedule には、ルート・路線系統(route)、時刻表、運賃、地理的な交通情報など多くの情報が含まれており、シンプルなテキストファイル[^1]で提供されます。このシンプルな形式により、複雑または独自のソフトウェアに依存することなく、容易に作成および維持することができます。

GTFS Realtime には、便の更新(trip update)、車両位置情報(vehicle position)、運行情報(alert) が含まれており、[Protocol Buffers](https://developers.google.com/protocol-buffers/) 形式を使用します。GTFS のこの部分は GTFS Schedule と連携して動作し、乗客に運行の中断や最新の到着時刻を知らせます。

GTFS Schedule および GTFS Realtime のリファレンスドキュメントは、[技術ドキュメントセクション](../../documentation/overview)で利用可能です。

<iframe class="center" width="560" height="315" src="https://www.youtube-nocookie.com/embed/SDz2460AjNo?si=wFsaN4_Hr3ypxWdp" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

<a href="https://www.flaticon.com/authors/freepik" title="Icons by Freepik">アイコン作成者 Freepik - Flaticon</a>

[^1]: テキストファイルに加えて、デマンド型サービスの特定の要素を表現するために [GeoJSON](https://geojson.org/) 形式も GTFS でサポートされるようになりました。
