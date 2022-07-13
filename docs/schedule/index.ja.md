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

データセットは、ZIPファイル名を含む公開された恒久的なURLで公開されるべきである。(例:[GTFS/GTFS.zip">GTFS](<http://www.agency.org/\<glossary variable=>)。理想的には，消費するソフトウェア・アプリケーションによるダウンロードを容易にするため，ファイルにアクセスするためにログインを必要とせず，直接ダウンロードできるURLであるべきである．GTFSデータセットはオープンにダウンロードできるようにすることが推奨されるが（最も一般的な方法）、データ提供者がライセンスその他の理由でGTFSアクセスを制御する必要がある場合は、APIキーを用いてGTFSデータセットへのアクセスを制御し、自動ダウンロードを容易にすることが推奨される。

GTFSデータをホストするWebサーバーは、ファイルの更新日を正しく報告するように設定する必要があります（14.29項の「HTTP/1.1 - Request for Comments 2616」を参照）。

[ベストプラクティス](best-practices/#dataset-publishing-general-practices)"を参照してください。[データセットの公開](best-practices/#dataset-publishing-general-practices)」を参照してください。

## トレーニング

<hr/>

世界銀行オープンラーニングキャンパス（OLC）は、「[GTFS-and-informal-transit-system-mapping">Introduction to theGeneral Transit Feed Specification(GTFS](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)) and Informal Transit System Mapping」というセルフベースのオンラインコースを提供しています。このコースには、以下のセクションがあります。

* GTFS？歴史とファイル構造
* GTFS？可視化およびコミュニティ
* GTFSフィードのセットアップ
* GitHubとオープンソースツールの紹介
* 現場からの話
* トランジットデータをマッピングする方法
* 都市初のフィードのためのデータを収集する方法
* アプリ調査
* GTFS

他の[オンラインコースも](../resources/other/#on-line-courses)ご覧ください。

## ヘルプとコミュニティ

<hr/>

### メーリングリスト

公共交通機関のデータ、ソフトウェア、GTFS GTFSようなフォーマット、その他の問題について質問がある場合、良いリソースとなるメーリングリストが数多く存在します。

* [GTFS-changes">GTFS](<https://groups.google.com/group/\<glossary variable=>)変更：GTFS仕様の拡張に関する提案の議論。
* [MobilityDataのSlack](https://mobilitydata-io.slack.com/)。GTFSトピックに専念するチャンネルを持つSlackの「組織」です。[mobilitydata-io.slack.comへの招待は](https://share.mobilitydata.org/slack)こちらでリクエストしてください。
* [Transit Developers](https://groups.google.com/group/transit-developers): 一般的な交通機関開発者向けの議論。多くの交通機関は、その機関に特化した独自の開発者向けメーリングリストも持っています。たとえば
  * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
  * [ポートランド(OR)](https://groups.google.com/group/transit-developers-pdx)
  * [BART - サンフランシスコ、カリフォルニア州](https://groups.google.com/group/bart-developers)
  * [MassDOT](https://groups.google.com/group/massdotdevelopers)
  * [アトランタ（ジョージア州）地域](https://groups.google.com/forum/#!forum/atl-transit-developers)
  * [511 サンフランシスコ・ベイエリア開発者向けリソース](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)
* 地元の交通機関に問い合わせて、独自のメーリングリストがあるかどうか確認してください。

その他の[コミュニティ](../resources/community)リソースを見る
