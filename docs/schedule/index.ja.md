# GTFS Schedule概要

<div class="landing-page">
   <a class="button" href="reference">参考資料</a>
   <a class="button" href="best-practices">ベストプラクティス</a>
   <a class="button" href="examples">事例紹介</a>
   <a class="button" href="changes">変更点</a>
</div>

## はじめに

GTFSフィードは、静的な交通情報を含むもので、1つのZIPファイルに含まれる多数のテキスト(.txt)ファイルから構成されています。各ファイルには、停留所、路線、旅行、運賃など、交通情報の特定の側面が記述されています。各ファイルの詳細については、GTFSリファレンスを参照してください。

GTFSフィードを作成するには、以下のステップに従います。

1. [GTFS Schedule](reference)リファレンスに記載されている必要なファイルをすべて作成します。オプションのファイルが必要な場合は、作成する。
1. すべてのファイルを.txtフォーマットで保存します。フィールドの値はカンマ区切りで、各行の終わりは改行する必要があります。ファイルの内容に関する詳細な情報は、GTFSリファレンスを参照してください。
1. すべてのテキストファイルをまとめてZip圧縮します。圧縮されたファイルは、フィードの1つのバージョンとなります。
1. 以下のオプションのいずれかを使用して、フィードを公開します。

## トランジットフィードを一般に公開する

<hr/>

データセットは、ZIPファイル名を含む公開された恒久的なURLで公開されるべきである。(例:www.agency.org/gtfs/gtfs.zip)。理想的には，消費するソフトウェア・アプリケーションによるダウンロードを容易にするため，ファイルにアクセスするためにログインを必要とせず，直接ダウンロードできるURLであるべきである．GTFSデータセットはオープンにダウンロードできるようにすることが推奨されるが（最も一般的な方法）、データ提供者がライセンスその他の理由でGTFSアクセスを制御する必要がある場合は、APIキーを用いてGTFSデータセットへのアクセスを制御し、自動ダウンロードを容易にすることが推奨される。

GTFSデータをホストするWebサーバーは、ファイルの更新日を正しく報告するように設定する必要があります（14.29項の「HTTP/1.1 - Request for Comments 2616」を参照）。

[ベストプラクティス](best-practices/#dataset-publishing-general-practices)"を参照してください。[データセットの公開](best-practices/#dataset-publishing-general-practices)」を参照してください。

## トレーニング

<hr/>

世界銀行オープンラーニングキャンパス（OLC）は、「[Introduction to the General Transit Feed Specification (GTFS) and Informal Transit System Mapping](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping)」というセルフベースのオンラインコースを提供しています。このコースには、以下のセクションがあります。

* GTFS？歴史とファイル構造
* GTFS？可視化およびコミュニティ
* GTFSフィードのセットアップ
* GitHubとオープンソースツールの紹介
* 現場からの話
* トランジットデータをマッピングする方法
* 都市初のフィードのためのデータを収集する方法
* アプリ調査
* GTFS-Realtime

他の[オンラインコースも](../resources/other/#on-line-courses)ご覧ください。

## ヘルプとコミュニティ

<hr/>

### メーリングリスト

公共交通機関のデータ、ソフトウェア、GTFS GTFSようなフォーマット、その他の問題について質問がある場合、良いリソースとなるメーリングリストが数多く存在します。

* GTFS Changes](https://groups.google.com/group/gtfs-changes): [GTFS Changes 文書](https://github.com/google/transit/blob/master/gtfs/CHANGES.md)に記載された GTFS 仕様の拡張案について議論します。
* GTFS Realtime](https://groups.google.com/group/gtfs-realtime): [GTFS-realtime specification](https://github.com/google/transit/tree/master/gtfs-realtime) について議論しました。
* [MobilityData Slack](https://mobilitydata-io.slack.com/): GTFSのトピックに特化したチャンネルを持つSlackの "組織"。[mobilitydata-io.slack.com への招待はこちら](https://share.mobilitydata.org/slack).
* transitfeed](https://groups.google.com/group/transitfeed): オープンソースの [transitfeed](https://groups.google.com/group/transitfeed) プロジェクトの議論と、GTFS仕様と関連ツールの議論です。
* [transit-developers](https://groups.google.com/group/transit-developers): 一般的な交通機関開発者の議論です。多くの交通機関は、その機関に特化した独自の開発者用メーリングリストも持っています。たとえば
    * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
    * [ポートランド、オレゴン](https://groups.google.com/group/transit-developers-pdx)
    * [BART - サンフランシスコ、カリフォルニア](https://groups.google.com/group/bart-developers)
    * [マスドット](https://groups.google.com/group/massdotdevelopers)
    * [ジョージア州アトランタ地域](https://groups.google.com/forum/#!forum/atl-transit-developers)
    * [511 サンフランシスコ・ベイエリア開発者リソース](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)

地元の交通機関が独自のメーリングリストを持っているかどうか、確認してみてください。


その他の[コミュニティ](../resources/community)リソースを見る
