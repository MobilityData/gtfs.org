# GTFS Schedule

### 改訂履歴

#### 2024 年 8 月
* 需要対応型サービスのため、 stops.txt の存在を変更します。[ディスカッション](https://github.com/google/transit/pull/472)を参照してください。
* stop_times.txtの timepoint の使用目的を明確にします。[ディスカッション](https://github.com/google/transit/pull/474)を参照してください。
* 行頭標識が推奨されることを追加します。[ディスカッション](https://github.com/google/transit/pull/485)を参照してください。

#### 2024 年 7 月
* feed_info.txtの要件を更新します。[ディスカッション](https://github.com/google/transit/pull/460)を参照してください。
* シェイプを含める必要があることを追加します。 [ディスカッション](https://github.com/google/transit/pull/470) を参照してください。

#### 2024 年 5 月
* `fare_leg_rules.txt`に `rule_priority` フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/418) を参照してください。
 * `stops.zone_id`の存在を明確にしました。[ディスカッション](https://github.com/google/transit/pull/432) を参照してください。

#### 2024 年 4 月
* 運賃商品の定義を明確にしました。[ディスカッション](https://github.com/google/transit/pull/426) を参照してください。

#### 2024 年 3 月
* GTFS Flex を追加しました。 [ディスカッション](https://github.com/google/transit/pull/433) を参照してください。

#### 2023 年 11 月
* ベスト プラクティス: すべてのファイルにデータセット公開ガイドラインと実践推奨事項を追加します。[ディスカッション](https://github.com/google/transit/pull/406) を参照してください。
* networks.txtとroute_networks.txtを追加します。[ディスカッション](https://github.com/google/transit/pull/405) を参照してください。

#### 2023 年 8 月
* fare_media_type= 1.を追加します。[ディスカッション](https:)を参照してください。

#### 2023 年 7 月
* GTFS ファイル内のサブフォルダを禁止します。 [ディスカッション](https://github.com/google/transit/pull/379) を参照してください。
* 時間または曜日による変動運賃を追加しました。[ディスカッション](https://github.com/google/transit/pull/357) を参照してください。
* stop_times.txtの暗黙のタイムゾーンを明確にしました。[ディスカッション](https://github.com/google/transit/pull/378) を参照してください。
 * 停車時刻を指定します。shape_dist_traveled は、旅行シェイプの最大距離を超えてはいけません。[ディスカッション](https://github.com/google/transit/pull/380) を参照してください。
* ベスト プラクティス: 推奨プレゼンスを追加します。[ディスカッション](https://github.com/google/transit/pull/386) を参照してください。

#### 2023 年 3 月 14 日

* 運賃メディアを追加しました。 [ディスカッション](https://github.com/google/transit/pull/355) を参照してください。

#### 2022 年 7 月 26 日

* 座席オプションによる旅行間の乗り換えを追加しました。[ディスカッション](https://github.com/google/transit/pull/303) を参照してください。

#### 2022 年 5 月 17 日

* GTFS-Fares v2ベースの実装。[ディスカッション](https://github.com/google/transit/pull/286) を参照してください。

#### 2021 年 10 月 22 日

* プライマリ ID フィールドと外部 IDフィールドを追加しました。[ディスカッション](https:](https:)を参照してください。

#### 2021 年 10 月 5 日

* 旅行間の乗り換えとルート間の乗り換えを追加しました。 [ディスカッション](https://github.com/google/transit/pull/284) を参照してください。

#### 2021 年 9 月 15 日

* 改札ゲート (pathway_mode=6) を双方向にできるようになりました。[ディスカッション](https://github.com/google/transit/pull/276) を参照してください。

#### 2021 年 9 月 13 日

* `stop_name` のベスト プラクティスを更新しました。[ディスカッション](https://github.com/google/transit/pull/282) を参照してください。

#### 2021 年 8 月 27 日

* GTFS Scheduleを [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119) に更新しました。 [ディスカッション](https://github.com/google/transit/pull/277) を参照してください。

#### 2021 年 1 月 4 日

* `stop_times.stop_id`の説明を明確にしました。[ディスカッション](https://github.com/google/transit/pull/258) を参照してください。
* 正および非ゼロのフィールド符号を定義しました。[ディスカッション](https://github.com/google/transit/pull/251) を参照してください。

#### 2020 年 10 月 2 日

* `frequencies.headway_secs` のフィールド タイプを非負から正の整数に変更しました。 [ディスカッション](https://github.com/google/transit/pull/249) を参照してください。

#### 2020 年 5 月 25 日

* `pathways.txt`、 `levels.txt` 、 `attributions.txt`を翻訳可能なテーブルとして定義しました。多言語`signposted_as`値を翻訳するための推奨事項を追加しました。[ディスカッション](https://github.com/google/transit/pull/220) を参照してください。

#### 2020 年 5 月 13 日

* `routes.txt`と`stop_times.txt`に`continuous_pickup`と`continuous_drop_off` を追加しました。`shape_id`を`任意`から`条件付きで必須`に変更しました。 [ディスカッション](https://github.com/google/transit/pull/208) を参照してください。

#### 2020 年 3 月 24 日

* テキスト読み上げフィールドを定義し、 `stops.txt`に`tts_stop_name`を追加しました。[ディスカッション](https://github.com/google/transit/pull/49) を参照してください。

#### 2020 年 2 月 5 日

* トロリーバスとモノレールの `route_types` を追加しました。[ディスカッション](https:](https:)を参照してください。

#### 2020 年 1 月 9 日

* `translations.txt`を追加しました。 [ディスカッション](](https://github.com/google/transit/pull/180) を参照してください。

#### 2019年12月26日

* `route_type`のケーブルトラムと高所作業車の定義を更新しました。[ディスカッション](https://github.com/google/transit/pull/186) を参照してください。

#### 2019年12月20日

* `attributions.txt`を追加しました。[ディスカッション](https://github.com/google/transit/pull/192) を参照してください。

#### 2019年8月26日

* `stop_lat`と`stop_lon`を、乗客が車両に搭乗するまで待つ場所に配置することを指定しました。 [ディスカッション](https://github.com/google/transit/pull/179) を参照してください。

#### 2019 年 7 月 9 日

* 到着時間と出発時間のベスト プラクティスを追加しました。[ディスカッション](https://github.com/google/transit/pull/165) を参照してください。
* 行先標識のベスト プラクティスを追加しました。[ディスカッション](https://github.com/google/transit/pull/167) を参照してください`stop_id` のベスト プラクティスを追加しました。[ディスカッション](https://github.com/google/transit/pull/169) を参照してください。

#### 2019 年 6 月 25 日

* シェイプ ポイントと停留所の関係を明確にしました。 [ディスカッション](https://github.com/google/transit/pull/39) を参照してください。

#### 2019 年 4 月 4 日

* `stops.txt`に`platform_code`フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/146) を参照してください。

#### 2019 年 3 月 27 日

* `pathways.txt`と`levels.txt`を追加しました。[ディスカッション](https:](](https://github.com/google/transit/pull/120) を参照してください。

#### 2018 年 10 月 2 日

* フィールド タイプを因数分解しました。 [ディスカッション](https://github.com/google/transit/pull/104) を参照してください。

#### 2018 年 9 月 14 日

* `条件付きで必須`の概念を追加しました。[ディスカッション](https://github.com/google/transit/pull/100) を参照してください。

#### 2018 年 9 月 4 日

* `agency_lang`と`feed_lang`の定義を統合しました。[ディスカッション](https://github.com/google/transit/pull/98) を参照してください。

#### 2018 年 8 月 27 日

* `CHANGES.md` と最終更新dateを更新しました。 [ディスカッション](](https://github.com/google/transit/pull/99) を参照してください。

#### 2018 年 8 月 22 日

* `feed_info.txt`ファイルに`feed_contact_email`フィールドと`feed_contact_url`フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/31) を参照してください。

#### 2017 年 12 月 11 日

* `routes.txt`に`route_sort_order`を追加しました。[ディスカッション](https://github.com/google/transit/pull/83) を参照してください。

#### 2017 年 3 月 15 日

* 提案者の投票は合計にカウントされないことを明確にしました。 [ディスカッション](https://github.com/google/transit/pull/50) を参照してください。
* 投票を呼びかける前に、少なくとも 1 つの GTFS プロデューサーと 1 つの GTFS コンシューマーが提案された変更を実装する必要があることを明記しました。[ディスカッション](https://github.com/google/transit/pull/46) を参照してください。

#### 2017 年 2 月 7 日

* `block_id`と`service_id`の関係を明確にしました。[ディスカッション](https://github.com/google/transit/pull/44) を参照してください。
* 頻度ベースのサービスは車両の出発時に開始されることを明確にしました。[ディスカッション](https:](https:)を参照してください。
* `stop_id`と`stop_code`の説明を明確にしました。 [ディスカッション](https://github.com/google/transit/pull/40) を参照してください。

#### 2017 年 12 月 11 日

* `routes.txt`ファイルに`route_sort_order`フィールドを追加しました。[ディスカッション](https://github.com/google/transit/pull/83) を参照してください。

#### 2016 年 11 月 27 日

* `stops.location_type`として駅の入口を追加しました。[ディスカッション](https://github.com/google/transit/pull/30) を参照してください。

#### 2016 年 9 月 2 日

* ドキュメントを更新し、 `fare_attributes.txt`の下に`agency_id`を追加しました。 [ディスカッション](https://github.com/google/transit/pull/27) を参照してください。

#### 2016 年 3 月 16 日

* GTFS ドキュメントを Github (https://github.com/google/transit) に移行

#### 2016 年 2 月 3 日

* `agency_email`を`agency.txt`に追加しました。仕様への提案: [ディスカッション](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

#### 2015 年 2 月 2 日

* stop_times.txtの ’timepoint’ の提案を仕様に追加しました: [ディスカッション](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

#### 2015 年 2 月2014 年 17 月 17 日

* trips.txtの`bikes_allowed`提案を仕様に追加しました: [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

#### 2012 年 10 月 15 日trips.txtの`wheelchair_accessible`提案を仕様に追加しました: [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

#### 2012 年 6 月 20 日

* ’wheelchair_boarding’ 提案を仕様に追加しました: [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

#### 2012 年 2 月 2 日2012

* 仕様に`stop_timezone`提案を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)

#### 2012 年 1 月 18 日

* ドキュメントを古い code.google.com から新しい場所である developer.google.com に移行しました。

#### 2011 年 9 月 26 日

* 仕様に`feed_info`提案を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

#### 2011 年 9 月 6 日

* 仕様に`agency_fare_url`提案を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
* 仕様に`exact_times`提案を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

#### 2009 年 3 月 30 日

* 交通フィードを一般公開するための新しいセクション。これは、データの解釈方法や記述方法に厳密に変更を加えるものではないため、これまでグループで議論されていませんでした。ただし、GTFS 形式のデータを利用できるアプリケーションが増えているため、Google 以外の GTFS の使用に関する説明を含めることが有益であると考える Google スタッフもいました。
* CSV 形式の明確化: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk)。
* route_color フィールドと route_text_color フィールドの説明で対照的な色を選択する方法に関する追加ガイダンス。
* trip_short_name は、次のスレッドで提案およびテストされています: a および b。
* ドキュメントの末尾に含まれるサンプル データの軽微なエラーを修正しました (stop S7 に parent_station S8 が割り当てられています)。
* コメント期間中に Marcy から提案されたように、ドキュメントの末尾のサンプル データに`agency_lang`情報を追加しました: [ディスカッション](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0)。
* サイドバーの OCTA の GTFS フィードへのリンクを更新しました
* [オリジナルの概要](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw) を参照してください。

#### 2009 年 2 月 26 日

* 現時点では GTFS データを使用するアプリケーションが他にも多数あるため、Google 固有のフィード送信手順のほとんどを削除しました。
* サイドバーの Orange County OCTA のパブリック フィードへの壊れたリンクを修正しました。

#### 2008 年 8 月 7 日

* 8 月 6 日のバージョンで誤って省略されていた stop_url フィールドを復元しました
* サンプル データに agency_phone を追加しました
* Google にフィードを送信する際のデータ使用契約についての言及を追加しました

#### 2008 年 8 月 6 日2008

* transfers.txtファイルを追加し、フィード発行者が望ましい乗り換え動作に関するヒントを提供できるようにしました ([元の提案](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw))
* locations_type および parent_station フィールドをstops.txtに追加し、停車地点を駅にグループ化できるようにしました ([元の提案](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw))
* agency_phone フィールドを追加し、代理店の音声電話番号を指定できるようにしました ([元の提案](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA))
* オープンソースのテスト ツールについて言及した`フィードのテスト`セクションを追加しました
* CSV 形式、agency_timezone、agency_lang についての説明を追加しましたroute_color、route_text_color、arrival_time、departure_time、 calendar.txtとcalendar_dates.txtの比較、運賃表、 frequencies.txt 
* フィード履歴ドキュメントへのリンクを追加し、一部のパブリック フィード リンクを修正しました
* 現在の Google マップ UI を表すようにサンプル画像を更新しました
* ドキュメントのサンプル データを更新/修正しました

#### 2008 年 2 月 29 日

* 乗客向けの停止コードを指定できるように、 stops.txtに stop_code フィールドを追加しました ([元の提案](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc))
* routes.txtの route_short_name と route_long_name の説明を明確にしました 
* stop_times.txtの arrive_time と destination_time の説明を明確にしました 
* サンプル データ セクションのタイプミスを修正しました

#### 2007 年 11 月 20 日

* block_id の説明を明確化しました
* Google Transit を強調しないように言語を変更しました (Google 以外のアプリケーションは GTFS を使用しており、交通機関のルーティングは Google マップの統合機能になったため)。また、さまざまなタイプミスを修正しました
* 現在の Google マップ UI での GTFS フィールドの表示を反映するようにサンプルのスクリーンショットを更新しました
* 交通機関データ プロバイダの Google 連絡先メール アドレスを更新しました
* 書式を更新しました

#### 2007 年 10 月 5 日

* stop_sequenceと shape_pt_sequence を変更し、増加する非負の整数を使用できるようにしました
* 説明を明確化し、タイプミスを修正しました

#### 2007 年 5 月 31 日

* ページ スタイルを更新し、HTML をよりわかりやすくアクセスしやすくしました
* 公開フィード サンプルやその他の便利なサイトへのリンクを追加しました
* 個々のフィールドの説明からサンプルを削除しました

#### 2007 年 4 月 9 日

* [フィードの送信](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle).
* [サンプル デモ交通事業者フィード](https://developers.google.com/transit/gtfs/examples/gtfs-feed) を追加しました。
* すべてのサービス日付がcalendar_dates.txtで定義されている場合は、 calendar.txt を省略できるという注記を追加しました。
* 1 つの交通機関のみを含むフィードでは agency_id フィールドをオプションにしました。これにより、agency_id のない既存のフィードが有効なままになります。
* agency_url、stop_url、route_url のより完全な仕様と、これらのフィールドの追加の例の値を追加しました。
* 有効な route_type 値として 6 (ゴンドラ) と 7 (ケーブルカー) を追加しました。

#### 2007 年 3 月 8 日

* 2 月 28 日の更新で誤って指定されたstop_times.txtの stop_url フィールドを、適切な位置にあるstops.txtに移動するための軽微な編集を行いました。

#### 2007 年 3 月 5 日

* route_long_name フィールドの説明を明確にするための軽微な編集を行いました。

#### 2007 年 2 月 28 日

* ヘッドウェイベースのスケジュールをサポートするためにfrequencies.txtを追加しました。
* 同じフィードで複数の機関が許可されるようになりました。また、agencys.txtとroutes.txtの両方に新しい agency_id フィールドが追加され、どのルートがどの機関によって運営されているかを指定できるようになりました。
* ルートごとおよび停留所ごとの URL の追加。
* trips.txtに direction_id フィールドが追加されました。
* stop_times.txtに stop_headsign フィールドが追加され、途中での行先標識の変更がサポートされるようになりました。
* routes.txtにオプションの route_color と route_text_color が追加され、ルートの色をサポートできるようになりました。
* 住所を使用して停留所を指定する機能が削除されました。以前のバージョンの仕様では、stop_street、stop_city、stop_region、stop_postcode、stop_country フィールドで住所を使用して交通機関の停留所の場所を指定できました。現在は、停車地は緯度に stop_lat、経度に stop_lon を使用して指定する必要があります。これは、ほとんどのアプリケーションでより便利です。
* routes.txtの route_type フィールドにケーブルカーの車両タイプを追加しました。
*変更の概要については、元の [Headway ブログ投稿](http://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/) を参照してください。

#### 2006 年 11 月 29 日

* shapes.txtによる旅行形状情報のサポートを追加しました 
* stop_sequenceの定義を明確化しました 
* pickup_typeとdrop_off_type をオプションとしてマークしました

#### 2006 年 10 月 31 日

*運賃情報のサポートを追加しました
*個々のファイル名から日付を削除しました
* route_type 値の定義を変更しました
*サービス期間が重複しない限り、複数のフィード ファイルを同時に投稿できるようにしました
* trips.txt を修正して、正しく任意マークされるようにしました。
* 列ヘッダーを含める必要があることに注意しました

#### 2006 年 9 月 29 日

* 例のいくつかのエラーを修正するために、小さな編集を行いました。

#### 2006 年 9 月 25 日

* 最初のバージョン。