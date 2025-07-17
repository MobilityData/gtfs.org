# GTFS スケジュール

### 改訂履歴

#### 2025年6月
* `trips.txt`に `cars_allowed` フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/547)をご覧ください。

#### 2025年4月
* DRTサービスの `continuous_pickup/continuous_drop_off` の値に1を指定できるように明確化しました。[ディスカッション](https://github.com/google/transit/pull/558) を参照してください。

#### 2025年2月
* rider_categories.txtを追加しました。[ディスカッション](https://github.com/google/transit/pull/511) を参照してください。

#### 2025年1月
* agency_fare_url を更新して説明を拡張し、運賃情報のみを含めます。[ディスカッション](https://github.com/google/transit/pull/524) を参照してください。

#### 2024年12月
* `fare_leg_join_rules.txt` を追加し、実効運賃区間の概念を導入しました。[ディスカッション](https://github.com/google/transit/pull/439) を参照してください。

#### 2024年9月
* transfers.txt の from/to_stop_id および from/to_trip_id フィールドの存在と使用を明確にします。[ディスカッション](https://github.com/google/transit/pull/455) を参照してください。
* GeoJSON ファイルのポリゴンの有効性ルールを追加しました。[ディスカッション](https://github.com/google/transit/pull/476) を参照してください。

#### 2024年8月
* デマンドサービスのため、stops.txt の存在を変更します。[ディスカッション](https://github.com/google/transit/pull/472) を参照してください。
* stop_times.txt の timepoint の使用目的を明確にします。[ディスカッション](https://github.com/google/transit/pull/474) を参照してください。
* ヘッドサインが推奨されることを追加します。[ディスカッション](https://github.com/google/transit/pull/485) を参照してください。

#### 2024年7月
* feed_info.txt の要件を更新しました。[ディスカッション](https://github.com/google/transit/pull/460) を参照してください。
* 形状を含める必要があることを追加しました。[ディスカッション](https://github.com/google/transit/pull/470) を参照してください。

#### 2024年5月
* `fare_leg_rules.txt` に `rule_priority` フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/418) を参照してください。
* `stops.zone_id` の存在を明確にしました。[ディスカッション](https://github.com/google/transit/pull/432) を参照してください。

#### 2024年4月
* チケット商品の定義を明確にしました。[ディスカッション](https://github.com/google/transit/pull/426) を参照してください。

#### 2024年3月
* GTFS Flex を追加しました。[ディスカッション](https://github.com/google/transit/pull/433) をご覧ください。

#### 2023年11月
* ベスト プラクティス: すべてのファイルにデータセット公開ガイドラインと実践推奨事項を追加しました。[ディスカッション](https://github.com/google/transit/pull/406) をご覧ください。
* networks.txt と route_networks.txt を追加しました。[ディスカッション](https://github.com/google/transit/pull/405) をご覧ください。

#### 2023年8月
* fare_media_type=1 を追加しました。[ディスカッション](https://github.com/google/transit/pull/385) をご覧ください。

#### 2023年7月
* GTFS ファイル内のサブフォルダを禁止しました。[ディスカッション](https://github.com/google/transit/pull/379) をご覧ください。
* 時間または曜日による変動運賃を追加しました。[ディスカッション](https://github.com/google/transit/pull/357) を参照してください。
* stop_times.txt の暗黙のタイムゾーンを明確にしました。[ディスカッション](https://github.com/google/transit/pull/378) を参照してください。
* 停車時刻を指定します。shape_dist_traveled は、トリップ 形状の最大距離を超えてはいけません。[ディスカッション](https://github.com/google/transit/pull/380) を参照してください。
* ベスト プラクティス: 推奨プレゼンスを追加します。[ディスカッション](https://github.com/google/transit/pull/386) を参照してください。

#### 2023年3月14日

* 運賃メディアを追加しました。[ディスカッション](https://github.com/google/transit/pull/355) を参照してください。

#### 2022年7月26日

* 座席オプションによるトリップ間の乗り換えを追加しました。[ディスカッション](https://github.com/google/transit/pull/303) を参照してください。

#### 2022年5月17日

* GTFS-Fares v2 ベースの実装。[ディスカッション](https://github.com/google/transit/pull/286) を参照してください。

#### 2021年10月22日

* プライマリ ID フィールドと外部 ID フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/278) を参照してください。

#### 2021年10月5日

* トリップ間およびルート間の乗り換えを追加しました。[ディスカッション](https://github.com/google/transit/pull/284) を参照してください。

#### 2021年9月15日

* 運賃ゲート (pathway_mode=6) を双方向にできるようにしました。[ディスカッション](https://github.com/google/transit/pull/276) を参照してください。

#### 2021年9月13日

* `stop_name` のベスト プラクティスを更新しました。[ディスカッション](https://github.com/google/transit/pull/282) を参照してください。

#### 2021年8月27日

* GTFS スケジュールを [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119) に更新しました。[ディスカッション](https://github.com/google/transit/pull/277) を参照してください。

#### 2021年1月4日

* `stop_times.stop_id` の説明を明確化しました。[ディスカッション](https://github.com/google/transit/pull/258) を参照してください。

* 正および非ゼロのフィールド符号を定義しました。[ディスカッション](https://github.com/google/transit/pull/251) を参照してください。

#### 2020年10月2日

* `frequencies.headway_secs` のフィールド タイプを非負から正の整数に変更しました。 [ディスカッション](https://github.com/google/transit/pull/249) を参照してください。

#### 2020年5月25日

* `pathways.txt`、`levels.txt`、`attributions.txt` を翻訳可能なテーブルとして定義しました。多言語の `signposted_as` 値を翻訳するための推奨事項を追加しました。[ディスカッション](https://github.com/google/transit/pull/220) を参照してください。

#### 2020年5月13日

* `routes.txt` と `stop_times.txt` に `continuous_pickup` と `continuous_drop_off` を追加しました。`shape_id` を「オプション」から「条件付きで必須」に変更しました。[ディスカッション](https://github.com/google/transit/pull/208) を参照してください。

#### 2020年3月24日

* テキスト読み上げフィールドを定義し、`stops.txt` に `tts_stop_name` を追加しました。[ディスカッション](https://github.com/google/transit/pull/49) を参照してください。

#### 2020年2月5日

* トロリーバスとモノレールの `route_types` を追加しました。[ディスカッション](https://github.com/google/transit/pull/174) を参照してください。

#### 2020年1月9日

* `translations.txt` を追加しました。[ディスカッション](https://github.com/google/transit/pull/180) を参照してください。

#### 2019年12月26日

* `route_type` のケーブル トラムと高所作業車の定義を更新しました。 [ディスカッション](https://github.com/google/transit/pull/186) を参照してください。

#### 2019年12月20日

* `attributions.txt` を追加しました。[ディスカッション](https://github.com/google/transit/pull/192) を参照してください。

#### 2019年8月26日

* `stop_lat` と `stop_lon` を、乗客が車両に搭乗するのを待つ場所に配置するように指定しました。[ディスカッション](https://github.com/google/transit/pull/179) を参照してください。

#### 2019年7月9日

* 到着時間と出発時間のベスト プラクティスを追加しました。[ディスカッション](https://github.com/google/transit/pull/165) を参照してください。

* ヘッドサインのベスト プラクティスを追加しました。[ディスカッション](https://github.com/google/transit/pull/167) を参照してください。
* `stop_id` のベスト プラクティスを追加しました。[ディスカッション](https://github.com/google/transit/pull/169) を参照してください。

#### 2019年6月25日

* 形状 ポイントと停留所の関係を明確にしました。[ディスカッション](https://github.com/google/transit/pull/39) を参照してください。

#### 2019年4月4日

* `stops.txt` に `platform_code` フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/146) を参照してください。

#### 2019年3月27日

* `pathways.txt` と `levels.txt` を追加しました。[ディスカッション](https://github.com/google/transit/pull/143) を参照してください。

#### 2019年2月6日

* わかりやすくするために編集とフォーマットを変更しました。 [ディスカッション](https://github.com/google/transit/pull/120) を参照してください。

#### 2018年10月2日

* フィールド タイプを因数分解しました。[ディスカッション](https://github.com/google/transit/pull/104) を参照してください。

#### 2018年9月14日

* 「条件付きで必須」の概念を追加しました。[ディスカッション](https://github.com/google/transit/pull/100) を参照してください。

#### 2018年9月4日

* `agency_lang` と `feed_lang` の定義を統合しました。[ディスカッション](https://github.com/google/transit/pull/98) を参照してください。

#### 2018年8月27日

* `CHANGES.md` と最終更新日を更新しました。 [ディスカッション](https://github.com/google/transit/pull/99) を参照してください。

#### 2018年8月22日

* `feed_info.txt` ファイルに `feed_contact_email` フィールドと `feed_contact_url` フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/31) を参照してください。

#### 2017年12月11日

* `routes.txt` に `route_sort_order` を追加しました。[ディスカッション](https://github.com/google/transit/pull/83) を参照してください。

#### 2017年3月15日

* 提案者の投票は合計にカウントされないことを明確にしました。[ディスカッション](https://github.com/google/transit/pull/50) を参照してください。
* 投票を呼び出す前に、少なくとも 1 つの GTFS プロデューサーと 1 つの GTFS コンシューマーが提案された変更を実装する必要があることを明記しました。[ディスカッション](https://github.com/google/transit/pull/46) を参照してください。

#### 2017年2月7日

* `block_id` と `service_id` の関係を明確にしました。[ディスカッション](https://github.com/google/transit/pull/44) を参照してください。
* 頻度ベースのサービスは車両の出発時に開始されることを明確にしました。[ディスカッション](https://github.com/google/transit/pull/42) を参照してください。
* `stop_id` と `stop_code` の説明を明確にしました。[ディスカッション](https://github.com/google/transit/pull/40) を参照してください。

#### 2017年12月11日

* `routes.txt` ファイルに `route_sort_order` フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/83) を参照してください。

#### 2016年11月27日

* `stops.location_type` として駅の入口を追加しました。[ディスカッション](https://github.com/google/transit/pull/30) を参照してください。

#### 2016年9月2日

* ドキュメントを更新し、`fare_attributes.txt` の下に `agency_id` を追加しました。[ディスカッション](https://github.com/google/transit/pull/27) を参照してください。

#### 2016年3月16日

* GTFS ドキュメントを https://github.com/google/transit の Github に移行

#### 2016年2月3日

* `agency_email` を `agency.txt` に追加しました。仕様に提案: [ディスカッション](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

#### 2015年2月2日

* stop_times.txt の 'timepoint' 提案を仕様に追加しました。[ディスカッション](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

#### 2014年2月17日

* trips.txt の 'bikes_allowed' 提案を仕様に追加しました。 [ディスカッション](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

#### 2012年10月15日

仕様に trips.txt の「wheelchair_accessible」提案を追加しました: [ディスカッション](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

#### 2012年6月20日

* 仕様に「wheelchair_boarding」提案を追加しました: [ディスカッション](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

#### 2012年2月2日

* 仕様に「stop_timezone」提案を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)

#### 2012年1月18日

* ドキュメントを古い code.google.com から新しい場所である developer.google.com に移行しました。

#### 2011年9月26日

* 仕様に「feed_info」提案を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

#### 2011年9月6日

* 仕様に「agency_fare_url」提案を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
* 仕様に「exact_times」提案を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

#### 2009年3月30日

* 交通事業者フィードを一般公開するための新しいセクション。これは、データの解釈方法や記述方法に厳密に変更を加えるものではないため、これまでグループで議論されていませんでした。ただし、GTFS 形式のデータを使用できるアプリケーションが増えているため、Google 以外の GTFS の使用に関する議論を含めることが有益であると考える Google スタッフもいました。
* CSV 形式の明確化: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk)。
* route_color フィールドと route_text_color フィールドの説明で対照的な色を選択する方法に関する追加のガイダンス。
* trip_short_name。これらのスレッドで提案され、テストされたとおり: a および b。
* ドキュメントの最後に含まれているサンプル データの軽微なエラーの修正 (stop S7 に parent_station S8 を指定)。
* コメント期間中に Marcy が提案したように、ドキュメントの末尾のサンプル データに「agency_lang」情報を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0)。
* サイドバーの OCTA の GTFS フィードへのリンクを更新しました
* [元の要約](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw) を参照してください。

#### 2009年2月26日

* 現時点では GTFS データを使用するアプリケーションが他にも多数あるため、Google 固有のフィード送信手順のほとんどを削除しました。
* サイドバーの Orange County OCTA のパブリック フィードへのリンクが壊れていた問題を修正しました。

#### 2008年8月7日

* 8月6日のバージョンで誤って省略されていた stop_url フィールドを復元しました
* サンプル データに agency_phone を追加しました
* Google にフィードを送信する際のデータ使用契約に関する記述を追加しました

#### 2008年8月6日

* transfers.txt ファイルを追加しました。フィード パブリッシャーが望ましい乗り換え動作に関するヒントを提供できるようにしました ([元の提案](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw))
* stops.txt に location_type および parent_station フィールドを追加しました。これにより、停留所点を駅にグループ化できるようになりました ([元の提案](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw))
* 代理店の音声電話番号を提供する agency_phone フィールドを追加しました ([元の提案](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw))提案](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA))
* オープンソースのテスト ツールについて言及した「フィードのテスト」セクションを追加
* CSV 形式、agency_timezone、agency_lang、route_color、route_text_color、arrival_time、departure_time、calendar.txt と calendar_dates.txt、運賃表、frequencies.txt についての説明を追加
* フィード履歴ドキュメントへのリンクを追加し、いくつかのパブリック フィード リンクを修正
* 現在の Google マップ UI を表すサンプル画像を更新
* ドキュメントのサンプル データを更新/修正

#### 2008年2月29日

* 乗客向けの停止コードを指定できるように、stops.txt に stop_code フィールドを追加 ([元の提案](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc))
* route.txt の route_short_name と route_long_name
* stop_times.txt の arrive_time と department_time の説明を明確にしました
* サンプル データ セクションのタイプミスを修正しました

#### 2007年11月20日

* block_id の説明を明確化
* 言語を変更して Google Transit を強調しないようにしました (Google 以外のアプリケーションは GTFS を使用しており、交通事業者のルーティングは Google マップの統合機能になったため)。また、さまざまなタイプミスを修正しました
* 現在の Google マップ UI での GTFS フィールドの表示を反映するようにサンプルのスクリーンショットを更新しました
* 交通事業者データ プロバイダの Google 連絡先メール アドレスを更新しました
* 書式を更新しました

#### 2007年10月5日

* stop_sequence と shape_pt_sequence を変更して、負でない整数の増加に対応できるようにしました
* 説明を明確化し、タイプミスを修正しました

#### 2007年5月31日

* ページ スタイルを更新し、HTML をよりわかりやすくアクセスしやすくしました
* パブリック フィード サンプルやその他の便利なサイトへのリンクを追加しました
* 個々のフィールドの説明からサンプルを削除しました

#### 2007年4月9日

* に関するセクションを追加しました[フィードの送信](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle)。
* [デモ交通事業者フィードの例](https://developers.google.com/transit/gtfs/examples/gtfs-feed)を追加しました。
* すべてのサービス日付がcalendar_dates.txtで定義されている場合はcalendar.txtを省略できるという注記を追加しました。
* agency_idフィールドを1つの事業者のみを含むフィードでオプションにしました。これにより、agency_idのない既存のフィードを有効なままにすることができます。
* agency_url、stop_url、route_urlのより完全な仕様と、これらのフィールドの追加のサンプル値を追加しました。
* 有効なroute_type値として6 (ゴンドラ)と7 (ケーブルカー)を追加しました。

#### 2007年3月8日

* 2月28日の更新で誤って指定されていたstop_urlフィールドをstop_times.txtから、本来あるべきstops.txtに移動するための小さな編集を行いました。

#### 2007年3月5日

* route_long_name フィールドの説明を明確にするための小さな編集。

#### 2007年2月28日

* ヘッドウェイ ベースのスケジュールをサポートするために frequencies.txt を追加しました。

* 同じフィードで複数の事業者が許可されるようになりました。また、agencys.txt とroutes.txt の両方に新しい agency_id フィールドが追加され、どのルートをどの事業者が運行するかを指定できるようになりました。

* ルートごとおよび停留所ごとの URL を追加しました。

* trips.txt に direction_id フィールドを追加しました。

* stop_times.txt に stop_headsign フィールドを追加して、途中での行先標識の変更をサポートしました。

* オプションの route_color と route_text_color をroutes.txt に追加して、ルートの色をサポートしました。

* 住所を使用して停留所を指定する機能を削除しました。以前のバージョンの仕様では、stop_street、stop_city、stop_region、stop_postcode、stop_country の各フィールドで住所を使用して交通事業者の停留所の場所を指定できました。現在は、緯度には stop_lat、経度には stop_lon を使用して停留所の場所を指定する必要があります。これは、ほとんどのアプリケーションでより便利です。
* ケーブルカーの車両タイプを、routes.txt の route_type フィールドに追加しました。
* 変更の概要については、元の [Headway ブログ投稿](http://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/) を参照してください。

#### 2006年11月29日

* shapes.txt によるトリップ 形状情報のサポートを追加
* stop_sequence の定義を明確化
* pickup_type と drop_off_type をオプションとしてマーク

#### 2006年10月31日

* 運賃情報のサポートを追加
* 個々のファイル名から日付を削除
* route_type 値の定義を変更
* サービス期間が重複しない限り、複数のフィード ファイルを同時投稿できるようにしました
* trips.txt の block_id を修正し、オプションとして正しくマークされるようにしました
* 列ヘッダーを含める必要があることを注記

#### 2006年9月29日

* 例のいくつかのエラーを修正するための小さな編集。

#### 2006年9月25日

* 初期バージョン。