---
title: 始めに
description: GTFS の基本、重要性、作成方法、主な機能について説明します。
---

# GTFS: 公共交通機関のデータを誰でもアクセス可能にする

## 交通機関の乗客情報のオープン データ標準

GTFS とも呼ばれるGeneral Transit Feed Specification は、公共交通事業者がスケジュール、停留所等、運賃などのサービスの詳細を記述するための構造を提供する標準化されたデータ形式です。

これにより、公共交通事業者は、さまざまなソフトウェア アプリケーション (最も一般的なのは旅行計画者)で使用できる形式で交通データを公開できます。つまり、ユーザーはスマートフォンなどのデバイスを使用して、公共交通機関のサービスにアクセスするための移動情報を簡単に入手できます。

<img class="center" width="560" height="100%" src="../../../assets/what_is_gtfs_001.png"> 

今日、GTFS は世界中の何千もの公共交通機関にとって頼りになる [オープン スタンダード](https://www.interoperablemobility.org/definitions/#open_standard) です。一部の機関は独自にこのデータを作成しますが、他の機関はベンダーにデータの作成と管理を委託しています。

## 静的データと動的データのサポート

GTFS は、[GTFS schedule](../../documentation/schedule/reference) と [GTFS realtime](../../documentation/realtime/reference) という 2 つの主要部分で構成されています。

<img class="center" width="560" height="100%" src="../../../assets/what_is_gtfs_002.png"> 

GTFS schedule には、ルート・路線系統、スケジュール、運賃、地理的な交通機関の詳細など、さまざまな機能に関する情報が含まれており、シンプルなTextファイル [^1] で提供されます。このわかりやすい形式により、複雑なソフトウェアや独自のソフトウェアに頼ることなく、簡単に作成および保守できます。

GTFS realtimeには、[プロトコル バッファ](https://developers.google.com/protocol-buffers/) 形式を使用した、旅行の更新、車両の位置、サービス アラートが含まれています。GTFS のこの部分は、 GTFS scheduleと連携して、乗客にサービスの中断や到着時刻の更新を通知します。

GTFS GTFS scheduleとGTFS realtime のリファレンス ドキュメントは、[技術ドキュメント セクション](../../documentation/overview) で入手できます。

<iframe class="center" width="560" height="315" src="https://www.youtube-nocookie.com/embed/SDz2460AjNo?si=wFsaN4_Hr3ypxWdp" title="YouTubeビデオプレーヤー" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> 

<a href="https://www.flaticon.com/authors/freepik" title="アイコンはFreepikによるものです">アイコンは Freepik- Flaticon によって作成されました</a>

[^1]: テキストファイルに加えて、デマンド応答型サービスの特定の要素を表すために、[GeoJSON](https://geojson.org/) 形式も GTFS でサポートされるようになりました。