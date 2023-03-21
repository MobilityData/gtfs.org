---
search:
  exclude: true
---

# 仕様の修正プロセス

GTFS仕様は確定したものではありません。その代わり、GTFSを使用する交通機関、開発者、その他の関係者のコミュニティによって開発・維持されるオープンな仕様となっています。GTFSデータの生産者と消費者からなるこのコミュニティは、新しい機能を実現するために仕様の拡張を提案することが期待されています。そのようなプロセスを管理するために、以下の手順とガイドラインが設定されています。

!!!note ""

    本仕様書、参考資料、ドキュメント類は英語で書かれています。他言語へのTranslation英語の原文と異なる場合は、後者が優先されます。すべてのコミュニケーションは英語で行われます。

1. プロトコル定義、仕様書、ドキュメントファイルの関連部分をすべて更新したgitブランチを作成する(翻訳を除く)。
1. <https://github.com/google/transit> にプルリクエストを作成します。プルリクエストには、パッチの拡張説明を含める必要があります。プルリクエストの作成者は、_支持_者になります。
1. プルリクエストが登録されたら、その支持者によって、[GTFS Changes メーリングリストに](https://groups.google.com/forum/#!forum/gtfs-changes)、プルリクエストへのリンクを含めて発表されなければなりません。発表された時点で、そのプルリクエストは提案とみなされます。 また、プルリクエストは、Googleグループでの発表へのリンクを含むように編集され、簡単に相互参照できるようにする必要があります。
   * 提唱者は貢献者であるため、プルリクエストを受け入れる前に[貢献者ライセンス](../CONTRIBUTING.md)契約に署名しなければなりません。
1. 提案の議論は以下の通りです。プルリクエストコメントを唯一の議論の場として使用する。
   * 議論は提唱者が必要と感じる限り続きますが、少なくとも7暦日以上でなければなりません。
   * 提案者は、自分が同意したコメントに基づいて、提案 (すなわちプルリクエスト) を適時に更新する責任があります。
   * 提唱者は、いかなる時点でも提案の放棄を主張することができます。
1. 提唱者は、議論に必要な最初の7日間の間隔が経過した後の任意の時点で、その提案のバージョンに対する投票を要求することができます。
   * 投票を求める前に、少なくとも1つのGTFSの生産者と1つのGTFSの消費者が、提案された変更を実行する必要があります。 また、GTFS利用者は、プルリクエスト・コメントにおいて、その変更を自明ではない方法で利用している(すなわち、新機能または改良機能をサポートしている)アプリケーションへのリンクを提供することが期待されています。
1. 投票は暦の上では7日、スイスの営業日では5日をカバーするのに十分な最小限の期間だけ行われます。投票は 23:59:59 UTC に終了します。
   * 投票者は投票開始時に具体的な終了時刻を発表すべきです。
   * 投票期間中は、提案の編集上の変更のみが許されます (誤字脱字、意味を変えない限り文言の変更は可能です)。
   * 誰でもプルリクエストにコメントする形で賛成・反対を投票することができ、投票期間の終了まで投票を変更することができます。
   投票者が投票を変更する場合、元の投票コメントを取り消し、新しい投票を書き込むことで更新することが推奨されます。
   * 投票期間開始前の投票は考慮されません。
   * 投票の開始と終了は、[GTFS Changes メーリングリスト](https://groups.google.com/forum/#!forum/gtfs-changes)上で告知されなければなりません。
1. 提案は、少なくとも3票を投じて全会一致の賛成が得られた場合に受理されます。
   * 提案者の票は3票の合計にカウントされません。たとえば、提案者Xがプルリクエストを作成して賛成票を投じ、ユーザYとZが賛成票を投じた場合、合計で2票の賛成票としてカウントされます。
   * 反対票は動機付けされたものでなければならず、理想的には実行可能なフィードバックを提供するものでなければなりません。
   * 投票が失敗した場合、支持者はその提案の作業を継続するか、あるいはその提案を放棄するかを選ぶことができます。
   提唱者のいずれの決定も、[GTFS Changes メーリングリストにおいて](https://groups.google.com/forum/#!forum/gtfs-changes)発表されなければならない。
   * 提唱者が提案の作業を継続する場合、いつでも新しい投票を呼びかけることができます。
1. 30暦日間、非アクティブのままのプルリクエストはクローズされます。プルリクエストが閉じられると、対応する提案は放棄されたとみなされます。提唱者は、会話を継続または維持したい場合、いつでもプルリクエストを再開することができます。
1. 提案が受理された場合
   * Googleは、投票されたバージョンのプルリクエストをマージし（貢献者が[CLAに](../CONTRIBUTING.md)署名していることが条件です）、5営業日以内にプルリクエストを実行することを約束します。
   * 翻訳は、元のプルリクエストに含めてはいけません。
   Google は最終的に関連する翻訳をサポートされている言語に更新する責任がありますが、コミュニティからの純粋な翻訳プルリクエストは歓迎され、すべての編集コメントが対処され次第、受理される予定です。
1. プルリクエストの最終結果（受理または放棄）は、プルリクエストが最初に発表されたのと同じGoogleグループのスレッドで発表されるべきです。

<hr>

## 指導方針

GTFSの当初のビジョンを維持するために、仕様を拡張する際に考慮すべきいくつかの指導原則が確立されています。

**フィードの作成と編集が容易であること**<br/>CSVを仕様のベースとして選んだのは、表計算ソフトやテキストエディタで簡単に表示・編集できるため、小規模な機関にとって<br/>便利だからです。<br/>また、ほとんどのプログラミング言語やデータベースから簡単に生成できるため、大規模なフィードを発行する場合にも適しています。<br/>

**フィードの解析が容易であることフィードの**<br/>読者は、できるだけ少ない作業で求めて<br/>いる情報を抽出できる必要があります。<br/>フィードの変更や追加は、できるだけ広範囲に渡って有用であるべきで、 フィードの読者が実装しなければならないコードパスの数を最小にしなければなりません。(ただし、最終的にはフィードの発行者がフィードの読者よりも多くなるため、 作成を簡単にすることが優先されるべきです)。<br/>

**旅客情報についての仕様であること**<br/>GTFSは、旅客情報を主な対象として<br/>います。<br/>つまり、ライダーのためのパワーツールに役立つ情報を、まず第一に仕様に盛り込むべきである。交通機関がシステム間で内部的に伝送したいと考える運用志向の情報は、潜在的に大量に存在する可能性があります。GTFSはそのためのものではなく、より適切な他のオペレーション指向のデータ標準が存在する可能性がある。<br/>

**仕様の変更は後方互換性を保つこと**<br/>仕様に機能を追加<br/>する**場合**、<br/>既存のフィードを無効に<br/>するような変更は避けたいと考えています。<br/>既存のフィード発行者がフィードに機能を追加するまでの作業を増やしたくありません。また、可能な限り、既存のパーサーが新しいフィードの古い部分を読み続けられるようにしたいものです。<br/>

**投機的な機能は推奨されない**<br/>新しい機能を追加するたびに、フィードの作成と読み込みが複雑に<br/>なります。<br/>したがって、有用であることが分かっている機能のみを追加するように注意したいと思います。理想的には、どのような提案であっても、その新機能を使用する実際の交通システムのデータを生成し、それを読み込んで表示するソフトウェアを作成することによって、テストされている必要があります。GTFSは、公式のパーサーやバリデーターが無視するような列やファイルを追加することで、フォーマットの拡張を容易に行えることに留意してください。<br/>

<hr>

## 改訂履歴

**2023年3月14日**<br/>

* 運賃メディアを追加しました。[ディスカッションを](https://github.com/google/transit/pull/355)ご覧ください。

**2022年7月26日**<br/>

* 座席内オプションでトリップ間移動ができるようになりました。 [ディスカッションを](https://github.com/google/transit/pull/303)参照。

**2022年5月17日**<br/>

* GTFS-Fares V2ベースの実装。 [ディスカッションを](https://github.com/google/transit/pull/286)参照。

**2021年10月22日**<br/>

* プライマリおよびフォーリンidフィールドを追加しました。 [ディスカッションを](https://github.com/google/transit/pull/278)参照。

**2021年10月05日**<br/>

* トリップ間、ルート間の転送を追加しました。 [ディスカッションを](https://github.com/google/transit/pull/284)参照。

**2021年9月15日**<br/>

* 運賃ゲート（pathway_mode=6）が双方向であることを許可しました。[ディスカッションを](https://github.com/google/transit/pull/276)参照してください。

**2021年9月13日**<br/>

* `stop_name`ベストプラクティスを更新しました。[ディスカッションを](https://github.com/google/transit/pull/282)参照。

**2021年8月27日**<br/>

* GTFSスケジュールを[RFC2119に](https://datatracker.ietf.org/doc/html/rfc2119)更新しました。[ディスカッションを](https://github.com/google/transit/pull/277)参照。

**2021年1月4日**<br/>

* `stop_times.stop_id`記述を明確化しました。詳細については、[「](https://github.com/google/transit/pull/258)ディスカッション」を参照してください。
* 正と非ゼロのフィールド符号を定義した。[ディスカッション](https://github.com/google/transit/pull/251)参照。

**2020年10月2日**<br/>

* `frequencies.headway_secs`フィールドタイプを非負の整数から正の整数に変更しました。[ディスカッションを](https://github.com/google/transit/pull/249)参照してください。

**2020年5月25日**<br/>

* `pathways.txt`、`levels.txt`、`attributions.txt`翻訳可能なテーブルとして定義しました。多言語の`signposted_as`値を翻訳するための推奨事項を追加しました。[ディスカッションを](https://github.com/google/transit/pull/220)参照してください。

**2020年5月13日**<br/>

* `routes.txt` `stop_times.txt` `continuous_pickup` `continuous_drop_off`追加しました。`shape_id`"Optional "から "Conditionally required "に変更しました。[ディスカッションを](https://github.com/google/transit/pull/208)参照。

**2020年3月24日**<br/>

* 音声合成のフィールドを定義し、`stops.txt` `tts_stop_name`追加しました。[ディスカッション](https://github.com/google/transit/pull/49)参照。

**2020年2月5日**<br/>

* トロリーバス、モノレールの`route_types`追加しました。[ディスカッション](https://github.com/google/transit/pull/174)参照。

**2020年1月9日**<br/>

* `translations.txt`追加しました。[ディスカッション](https://github.com/google/transit/pull/180)参照。

**2019年12月26日**<br/>

* `route_type`cable tramとaerial liftの定義を更新しました。[議論](https://github.com/google/transit/pull/186)参照。

**2019年12月20日**<br/>

* `attributions.txt`追加しました。[ディスカッション](https://github.com/google/transit/pull/192)参照。

**2019年8月26日**<br/>

* `stop_lat` `stop_lon`乗客が乗車するために待つ場所に配置されるように指定した。[ディスカッション](https://github.com/google/transit/pull/179)参照。

**2019年7月9日**<br/>

* 到着時刻と出発時刻のベストプラクティスを追加しました。[ディスカッション](https://github.com/google/transit/pull/165)参照。
* ヘッドサインのベストプラクティスを追加しました。[考察を](https://github.com/google/transit/pull/167)参照。
* `stop_id`ベストプラクティスを追加。[ディスカッションを](https://github.com/google/transit/pull/169)参照してください。

**2019年6月25日**<br/>

* シェイプポイントとストップの関係を明確にしました。[ディスカッションを](https://github.com/google/transit/pull/39)参照してください。

**2019年4月4日**<br/>

* `stops.txt` `platform_code`フィールドを追加しました。[ディスカッションを](https://github.com/google/transit/pull/146)参照。

**2019年3月27日**<br/>

* `pathways.txt` `levels.txt`を追加しました。[ディスカッションを](https://github.com/google/transit/pull/143)参照。

**2019年2月6日**<br/>

* 編集と書式を明確化するための変更。 [議論を](https://github.com/google/transit/pull/120)参照。

**2018年10月2日**<br/>

* 因数分解されたフィールドタイプ。[説明を](https://github.com/google/transit/pull/104)参照。

**2018年9月14日（金**<br/>

* "Conditionally required"の概念を追加。[説明を](https://github.com/google/transit/pull/100)参照。

**2018年9月4日**<br/>

* `agency_lang` `feed_lang`定義を統一しました。[議論を](https://github.com/google/transit/pull/98)参照。

**2018年8月27日（木**<br/>

* `CHANGES.md`最終更新日を更新。[考察を](https://github.com/google/transit/pull/99)参照。

**2018年8月22日（金**<br/>

* `feed_info.txt` `feed_contact_email` `feed_contact_url`フィールドを追加しました。[ディスカッションを](https://github.com/google/transit/pull/31)参照してください。

**2017年12月11日（木**<br/>

* `routes.txt` `route_sort_order`追加しました。[議論を](https://github.com/google/transit/pull/83)参照。

**2017年3月15日（木**<br/>

* 提案者の投票が合計にカウントされないことを明確にした。[議論](https://github.com/google/transit/pull/50)参照。
* 投票を呼び出す前に、少なくとも1つのGTFSプロデューサーと1つのGTFSコンシューマーが変更案を実装している必要があることを規定した。[議論](https://github.com/google/transit/pull/46)参照。

**平成29年2月7日**<br/>

* `block_id` `service_id`関係を明確にした。[考察を](https://github.com/google/transit/pull/44)参照。
* 頻度ベースのサービスは車両出発時に開始されることを明確化。[考察](https://github.com/google/transit/pull/42)参照。
* `stop_id` `stop_code`表記を明確にした。[ディスカッション](https://github.com/google/transit/pull/40)参照。

**2017年12月11日（木**<br/>

* `routes.txt` `route_sort_order`フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/83)参照。

**2016年11月27日（金**<br/>

* `stops.location_type`駅入口を追加しました。[ディスカッション](https://github.com/google/transit/pull/30)参照。

**2016年9月2日（金**<br/>

* `fare_attributes.txt`下に`agency_id`追加するようにドキュメントを更新しました。[ディスカッションを](https://github.com/google/transit/pull/27)参照してください。

**2016年3月16日（金**<br/>

* GTFSのドキュメントをGithub[（https://github.com/google/transit](https://github.com/google/transit)）へ移行。

**2016年2月3日（金**<br/>

* `agency.txt` `agency_email`追加 仕様への提案：[議論](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

**2015年2月2日（金**<br/>

* stop_times.txt 'timepoint'案を仕様に追加:[ディスカッション](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

**2014年2月17日**<br/>

* trips.txt 'bikes_allowed' の提案を仕様に追加：[議論](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

**2012年10月15日**<br/>

* trips.txt の 'wheelchair_accessible' 提案を仕様に追加：[議論](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2012年6月20日**<br/>

* wheelchair_boarding」案を仕様書に追加：[議論](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2012年2月2日**<br/>

* stop_timezone」案をspec:[discussionに](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)追加。

**2012年1月18日**<br/>

* 古いcode.google.comから新しいdevelopers.google.comにドキュメントを移行しました。

**2011年9月26日**<br/>

* 仕様書に'feed_info'案を追加：[議論](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

**2011年9月6日**<br/>

* 仕様書に'agency_fare_url'案を追加：[議論](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
* 仕様に'exact_times'案を追加：[議論](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

**2009年3月30日**<br/>

* トランジットフィードを一般に公開するための新しいセクションです。これは、厳密にはデータの解釈や書き方を変えるものではないので、以前はグループ内で議論されていませんでした。しかし、GTFS形式のデータを利用できるアプリケーションは増えているため、Google以外のGTFSの利用方法についての議論を含めることは有益であると、Googleの一部の人々は考えたのです。
* CSV形式の明確化：[検討](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk)
* route_color および route_text_color フィールドの説明に、対照的な色を選択する方法に関するガイダンスを追加しました。
* trip_short_name は、以下のスレッドで提案され、テストされています: a と b。
* ドキュメントの最後に含まれるサンプルデータの小さな誤り（停留所S7にparent_station S8を与える）の修正。
* コメント期間中にMarcyから提案された、ドキュメント末尾のサンプルデータへの「agency_lang」情報の追加：[議論](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0)。
* サイドバーのOCTAのGTFSフィードへのリンクを更新しました。
* [元の要約を](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw)参照。

**2009年2月26日**<br/>

* 現時点ではGTFSデータを消費する他の多くのアプリケーションが存在するため，Google固有のフィード送信に関する説明の大部分を削除しました．
* サイドバーのオレンジ郡OCTAの公開フィードへのリンクが壊れていたのを修正。

**2008年8月7日**<br/>

* 8月6日のバージョンで誤って省略されたstop_urlフィールドを復活させました。
* サンプルデータに agency_phone を追加
* Googleにフィードを送信する際に、データ利用規約について言及するようにしました。

**2008年8月6日**<br/>

* transfers.txtファイルを追加し、フィード発行者が好ましい転送動作に関するヒントを提供できるようにした[(原案](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw))
* stops.txtにlocation_typeとparent_stationフィールドを追加し、停車駅を駅にグループ化できるようにした[(](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw)原案)
* 代理店の音声電話番号を提供するためのagency_phoneフィールドを追加[（](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA)原案）。
* オープンソースのテストツールについて言及した「Testing Your Feeds」セクションを追加
* CSVフォーマット、agency_timezone、agency_lang、route_color、route_text_color、arrival_time、 departure_time、calendar.txt vs. calendar_dates.txt 、 fare tables、 frequencies.txt について説明文を追記しました。
* フィード履歴のドキュメントへのリンクを追加し、一部の公開フィードのリンクを修正しました。
* 現在のGoogle Maps UIを表現するためにサンプル画像を更新
* ドキュメント内のサンプルデータを更新・修正

**2008年2月29日**<br/>

* stops.txtにstop_codeフィールドを追加し、ライダー向けの停車駅コードを指定できるようにした[（](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc)原案）。
* routes.txtのroute_short_name、route_long_nameの記述の明確化
* stop_times.txtのarrival_timeとdeparture_timeの記述を明確にしました。
* サンプルデータの誤字を修正

**2007年11月20日**<br/>

* block_idの記述の明確化
* Google Transitを強調しない表現に変更（Google以外のアプリケーションもGTFSを使用しており、乗り換え案内はGoogle Mapsに統合されているため）、また誤字脱字を修正
* 現在のGoogle Maps UIにおけるGTFSフィールドの表示方法を反映するため、スクリーンショットの例を更新しました。
* 乗り換え案内データ提供者のGoogle連絡先メールアドレスを更新しました。
* 書式を更新

**2007年10月5日**<br/>

* stop_sequenceとshape_pt_sequenceを変更し、非負の整数を増加させることができるようにしました。
* 説明文の明確化、誤字の修正

**2007年5月31日**<br/>

* ページのスタイルを更新し、HTMLをよりすっきりさせ、よりアクセスしやすくしました。
* 公開されているフィードの例やその他の有用なサイトへのリンクを追加しました。
* 個々のフィールドの説明から例を削除

**2007年4月9日**<br/>

* [フィードの送信](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle)に関するセクションを追加
* [Example Demo Transit Agencyのフィードを](https://developers.google.com/transit/gtfs/examples/gtfs-feed)追加。
* すべてのサービスの日付がcalendar_dates.txtで定義されている場合、calendar.txtは省略可能であることを追記。
* 1つの機関のみを含むフィードでは、agency_idフィールドをオプションにしました。これにより、agency_id を持たない既存のフィードも有効であり続けることができる。
* agency_url、stop_url、route_url の詳細な指定と、これらのフィールドの値の例を追加した。
* 有効な route_type の値として、6（ゴンドラ）、7（フニクラ）を追加しました。

**2007年3月8日**<br/>

* 2月28日のアップデートでstop_urlフィールドが誤って指定されていたstop_times.txtからstops.txtに移動するマイナーエディットを行いました。

**2007年3月5日**<br/>

* route_long_nameフィールドの説明をより明確にするためのマイナー編集を行いました。

**2007年2月28日**<br/>

* ヘッドウェイベースのスケジュールサポートのために、frequencies.txtを追加しました。
* 同じフィードに複数のエージェンシーを含めることができるようになりました。agencies.txt と routes.txt に新しい agency_id フィールドを追加し、どのルートがどのエージェンシーによって運営されているかを指定できるようにしました。
* ルート単位、停留所単位のURLを追加しました。
* trips.txtにdirection_idフィールドを追加。
* stop_times.txtにstop_headsignフィールドを追加し、トリップ途中のヘッドサイン変更に対応。
* routes.txtにオプションでroute_colorとroute_text_colorを追加し、ルートの色をサポート。
* ストリートアドレスを使った停留所指定機能を削除した。前バージョンの仕様では、stop_street, stop_city, stop_region, stop_postcode, stop_country フィールドで、ストリートアドレスを使用して乗り換え駅の位置を指定することができました。現在は、stop_latで緯度、stop_lonで経度を指定する必要があり、この方が多くのアプリケーションで有用である。
* routes.txt の route_type フィールドにケーブルカーの車種を追加した。
* 変更点については、[Headwayブログの原案記事](https://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/)まとめをご覧ください。

**2006年11月29日**<br/>

* shapes.txt によるトリップ形状情報に対応した。
* stop_sequence の定義の明確化
* pickup_typeとdrop_off_typeをオプションでマークするようにした

**2006年10月31日**<br/>

* 運賃情報を追加しました
* 個別ファイル名から日付を削除
* route_type の値の定義を変更
* サービス期間が重ならない限り、複数のフィードファイルを同時に掲載できるようにした
* trips.txtのblock_idが正しくOptionalと表示されるよう修正
* カラムヘッダは必ず含めるようにした

**2006年9月29日**<br/>

* 例題のいくつかの誤りを修正するためにマイナーな編集を行いました。

**2006年9月25日**<br/>

* 初期バージョン。
