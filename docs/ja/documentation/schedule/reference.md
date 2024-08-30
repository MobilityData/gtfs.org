##General Transit Feed Specificationリファレンス

**2024 年 8 月 16 日に改訂されました。詳細については、[改訂履歴](../change_history/revision_history)を参照してください。**

このドキュメントでは、GTFS データセットを構成するファイルの形式と構造を定義します。

## 目次

 1. [ドキュメントの規則](#document-conventions)
 2. [データセット ファイル](#dataset-files)
 3. [ファイル要件](#file-requirements)
 4. [データセットの公開と一般的な慣行](#dataset-publishing-general-practices)
 5. [フィールド定義](#field-definitions)
    -   [agency.txt](#agencytxt)
    -   [stops.txt](#stopstxt)
    -   [routes.txt](#routestxt)
    -   [trips.txt](#tripstxt)
    -   [stop\_times.txt](#stop_timestxt)
    -   [calendar.txt](#calendartxt)
    -   [calendar\_dates.txt](#calendar_datestxt)
    -   [fare\_attributes.txt](#fare_attributestxt)
    -   [fare\_rules.txt](#fare_rulestxt)
    -   [timeframes.txt](#timeframestxt)    
    -   [fare\_media.txt](#fare_mediatxt)
    -   [fare\_products.txt](#fare_productstxt) 
    -   [fare\_leg\_rules.txt](#fare_leg_rulestxt)
    -   [fare\_transfer\_rules.txt](#fare_transfer_rulestxt)
    -   [areas.txt](#areastxt)
    -   [stop_areas.txt](#stop_areastxt)
    -   [networks.txt](#networkstxt)
    -   [route_networks.txt](#route_networkstxt)
    -   [shapes.txt](#shapestxt)
    -   [frequencies.txt](#frequenciestxt)
    -   [transfers.txt](#transferstxt)
    -   [pathways.txt](#pathwaystxt)
    -   [levels.txt](#levelstxt)
    -   [location_groups.txt](#location_groupstxt)
    -   [location_group_stops.txt](#location_group_stopstxt)
    -   [locations.geojson](#locationsgeojson)
    -   [booking_rules.txt](#booking_rulestxt)
    -   [translations.txt](#translationstxt)
    -   [feed\_info.txt](#feed_infotxt)
    -   [attributions.txt](#attributionstxt)

## ドキュメントの規則
このドキュメント内のキーワード`しなければならない`、`してはいけない`、`必須`、`しなければならない`、`してはならない`、`するべきである`、`するべきではない`、`推奨される`、`してもよい`、および`任意`は、[RFC 2119](https:)で説明されているとおりに解釈されます。


### 用語の定義

このセクションでは、このドキュメント全体で使用される用語を定義します。

* **データセット** - この仕様リファレンスによって定義されるファイルの完全なセット。データセットを変更すると、データセットの新しいバージョンが作成されます。データセットは、zip ファイル名を含むパブリックの永続的な URL で公開する必要があります (例: https://www.agency.org/gtfs/gtfs.zip)。
* **レコード** - 単一のエンティティ (交通機関、停留所、ルートなど) を説明するさまざまなフィールド値で構成される基本データ構造。テーブルでは行として表されます。
* **フィールド** - オブジェクトまたはエンティティのプロパティ。テーブルでは列として表されます。フィールドは、ファイルにヘッダーとして追加された場合に存在します。フィールド値が定義されている場合と、定義されていない場合があります。
* **フィールド値** - フィールド内の個々のエントリ。テーブルでは 1 つのセルとして表されます。
* **サービス日** - サービス日は、ルートのスケジュールを示すために使用される期間です。サービス日の正確な定義は機関によって異なりますが、サービス日は多くの場合、暦日と一致しません。サービスが 1 日に開始され、翌日に終了する場合、サービス日は 24:00:00 を超えることがあります。たとえば、金曜日の 08:00:00 から土曜日の 02:00:00 まで実行されるサービスは、1 つのサービス日に 08:00:00 から 26:00:00 まで実行されると示される場合があります。
* **音声合成フィールド** - フィールドには、親フィールド (空の場合はフォールバックされるフィールド) と同じ情報が含まれている必要があります。これは音声合成で読み上げられることを目的としているため、省略形は削除するか (`St`は`Street`または`Saint`と読み上げ、`h` I`は`h` the first`と読み上げます)、そのまま読み上げます (`K` Airport`は省略されているとされています)。
* **区間** - 乗客が旅行中の 2 つの連続する場所の間で乗り降りする旅行。
* **旅程** - 出発地から目的地までの全体的な旅行。途中のすべての区間と乗り換えを含みます。
* **サブ旅程** - 旅程のサブセットを構成する 2 つ以上の区間。
* **運賃商品** - 旅行の支払いや検証に使用できる購入可能な運賃商品。

### 存在
フィールドとファイルに適用される存在条件:

* **必須** - フィールドまたはファイルはデータセットに含まれ、各レコードに有効な値が含まれている必要があります。
* **任意** - フィールドまたはファイルは、データセットから省略できます。
* **条件付きで必須** - フィールドまたはファイルは、フィールドまたはファイルの説明に記載されている条件に従って含める必要があります。
* **条件付きで禁止** - フィールドまたはファイルは、フィールドまたはファイルの説明に記載されている条件に従って含めないでください。
* **推奨** - フィールドまたはファイルはデータセットから省略できますが、含めることがベストプラクティスです。このフィールドまたはファイルを省略する前に、ベストプラクティスを慎重に評価し、省略による影響を完全に理解する必要があります。

### フィールドタイプ

- **色** - 6桁の16進数としてエンコードされた色。有効な値を生成するには、[https://htmlcolorcodes.com](https://htmlcolorcodes.com) を参照してください (先頭の`#`を含めることはできません)。<br> *例: 白の場合は`FFFFFF` 、黒の場合は `000000`、NYMTA の A、C、E ラインの場合は `0039A6`。*
- **通貨コード** - ISO 4217 アルファベット順の通貨コード。現在の通貨のリストについては、[https://en.wikipedia.org/wiki/ISO_4217#Active\_codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) を参照してください。<br> *例: カナダドルの場合は`CAD` 、ユーロの場合は`EUR` 、日本円の場合は`JPY` 。*
- **通貨金額** - 通貨金額を示す小数値。小数点以下の桁数は、付随する通貨コードの [ISO 4217](https:) で指定されています。すべての財務計算は、データの使用に使用するプログラミング言語に応じて、小数点、通貨、または財務計算に適した同等の型として処理する必要があります。計算中に金銭の損益が発生する可能性があるため、通貨金額をfloatとして処理することは推奨されません。
- **日付** - YYYYMMDD 形式のサービス日。サービス日内の時刻は 24:00:00 を超える場合があるため、サービス日には後続の日の情報が含まれることがあります。<br> *例: 2018 年 9 月 13 日の場合は`20180913`。*
- **電子メール** - 電子メール アドレス。<br> *例: `example@example.com`*
- **Enum** - `説明`列で定義された定義済み定数のセットからのオプション。<br> *例: `route_type`フィールドには、路面電車の場合は `0`、地下鉄の場合は`1` が含まれます...*
- **ID** - IDフィールドの値は内部IDであり、乗客に表示されるものではなく、UTF-8 文字のシーケンスです。印刷可能な ASCII 文字のみを使用することをお勧めします。ファイル内で一意である必要がある ID には、`一意のID`というラベルが付けられます。1 つの.txtファイルで定義されたIDは、別の.txtファイルで参照されることがよくあります。別のテーブルのIDを参照する ID には、`外部ID `というラベルが付けられます。<br> *例: [stops.txt](#stopstxt) の`stop_id`フィールドは`一意のID `です。[stops.txt](#stopstxt) の`parent_station`フィールドは` `stops.stop_id`を参照する外部ID `です。*
- **言語コード** - IETF BCP 47 言語コード。IETF BCP 47 の概要については、[http://www.rfc-editor.org/rfc/bcp/bcp47 .txt](http://www.rfc-editor.org/rfc/bcp/bcp47 .txt) および [http://www.w3.org/International/articles/language-tags/](http ://www.w3.org/International/articles/language-tags/) を参照してください。<br> *例: 英語の場合は`en` 、アメリカ英語の場合は`en-US` 、ドイツ語の場合は `de`。*
- **緯度** - 10 進度での WGS84 緯度。値は -90.0 以上 90.0 以下である必要があります。 *<br>例: ローマのコロッセオの場合は `41.890169`。*
- **経度** - 10 進度での WGS84 経度。値は -180.0 以上 180.0 以下である必要があります。<br> *例: ローマのコロッセオの場合は `12.492269`。*
- **Float** - 浮動小数点数。
- **Integer** - 整数。
- **Phone number** - 電話番号。
- **Time** - HH:MM:SS 形式の時間 (H:MM:SS も使用可能)。時間は、サービス日の`ら` 12 時間を引いた時間`から測定されます (夏時間の変更が行われる日を除いて、実質的には真夜中)。サービス日の真夜中以降に発生する時間については、HH:MM:SS で 24:00:00 より大きい値として時間を入力します。<br> *例: 午後 2:30 の場合は `14:30:00`、翌日の午前 1:35 の場合は `25:35:00`。*
- **Text** - UTF-8 文字のstring。表示を目的としているため、人間が判読できる必要があります。
- **タイムゾーン** - [https://www.iana.org/time-zones](https://www.iana.org/time-zones) の TZ タイムゾーン。タイムゾーン名にはスペース文字は含まれませんが、アンダースコアは含めることができます。有効な値の一覧については、[http://en.wikipedia.org/wiki/List\_of\_tz\_zones](http://en.wikipedia.org/wiki/List\_of\_tz\_zones) を参照してください。<br> *例: `Asia/Tokyo`、 `America/Los_Angeles` 、 `Africa/Cairo`。*
- **URL** - http://または https://を含む完全修飾 URL。URL 内の特殊文字は正しくエスケープする必要があります。完全修飾 URL 値の作成方法については、次の [http://www.w3.org/Addressing/URL/4\_URI\_Recommentations.html](http://www.w3.org/Addressing/URL/4\_URI\_Recommentations.html) を参照してください。

### フィールド記号
Float または Integer フィールド タイプに適用される記号:

* **非負** - 0 以上。
* **非ゼロ** - 0 と等しくない。
* **正** - 0 より大きい。

例: **非負float** - 0 以上の浮動小数点数。_

### データセット属性
データセットの **主キー** は、行を一意に識別するフィールドまたはフィールドの組み合わせです。`y` key (*)` は、ファイルに提供されたすべてのフィールドを使用して行を一意に識別するときに使用されます。 `y` key (none)` は、ファイルで 1 行のみが許可されることを意味します。

例: `trip_id`フィールドと`stop_sequence`フィールドは [stop_times.txt](#stop_timestxt) の主キーになります。_

## データセット ファイル

この仕様では、次のファイルを定義します:

| ファイル名 | 存在 | 説明 |
|------|------|------|
| [agency.txt](#agencytxt) | **必須** | このデータセットで表されるサービスを提供する交通機関。|
| [stops.txt](#stopstxt) | **条件付きで必須** | 車両が乗客を乗降させる停留所等。駅と駅の入口も定義します。<br><br>条件付きで必須:<br> - [locations.geojson](#locationsgeojson ) で需要対応ゾーンが定義されている場合は任意。<br> - **それ以外の場合は必須**。 |
| [routes.txt](#routestxt) | **必須** | 交通機関のルート。ルートは、乗客に単一のサービスとして表示される旅行のグループです。 |
| [trips.txt](#tripstxt) | **必須** | 各ルートの便。旅行とは、特定の期間内に発生する 2 つ以上の停留所のシーケンスです。 |
| [stop_times.txt](#stop_timestxt) | **必須** | 各旅行で車両が停留所に到着および出発する時刻。 |
| [calendar.txt](#calendartxt) | **条件付きで必須** | 開始日と終了日を含む週次スケジュールを使用して指定された運行日。<br><br>条件付きで必須:<br> - [calendar_dates.txt](#calendar_datestxt) ですべてのサービス日付が定義されていない限り、**必須** です。<br> - それ以外の場合は任意。 |
| [calendar_dates.txt](#calendar_datestxt) | **条件付きで必須** | [calendar.txt](#calendartxt) で定義されたサービスの例外。<br><br>条件付きで必須:<br> - ** [calendar.txt](#calendartxt) が省略されている場合は必須。その場合、[calendar_dates.txt](#calendar_datestxt) にはサービスの日付がすべて含まれている必要があります。<br> - それ以外の場合は任意。 |
| [fare_attributes.txt](#fare_attributestxt) |任意| 交通機関のルートの運賃情報。 |
| [fare_rules.txt](#fare_rulestxt) |任意| 旅程に運賃を適用するルール。 |
| [timeframes.txt](#timeframestxt) |任意|dateと時間の要因に依存する運賃の運賃ルールで使用する日付と時間の期間。 |
| [fare_media.txt](#fare_mediatxt) |任意| 運賃製品を使用するために使用できる運賃メディアを説明します。<br><br>ファイル [fare_media.txt](#fare_mediatxt) は、[fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) に示されていない概念について説明します。そのため、[fare_media.txt](#fare_mediatxt) の使用は、ファイル [fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) とは完全に独立しています。|
| [fare_products.txt](#fare_productstxt) |任意| 乗客が購入できるさまざまな種類のチケットまたは運賃について説明します。<br><br>ファイル [fare_products.txt](#fare_productstxt) には、[fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) に示されていない運賃商品が記載されています。そのため、[fare_products.txt](#fare_productstxt) の使用は、ファイル [fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) とは完全に独立しています。|
| [fare_leg_rules.txt](#fare_leg_rulestxt) |任意| 個々の旅行区間の運賃規則。<br><br>ファイル [fare_leg_rules.txt](#fare_leg_rulestxt) は、運賃構造をモデル化するためのより詳細な方法を提供します。そのため、[fare_leg_rules.txt](#fare_leg_rulestxt) の使用は、ファイル [fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) とは完全に別です。 |
| [fare_transfer_rules.txt](#fare_transfer_rulestxt) |任意| 旅行区間間の乗り継ぎに関する運賃規則。<br><br> [fare_leg_rules.txt](#fare_leg_rulestxt) とともに、ファイル [fare_transfer_rules.txt](#fare_transfer_rulestxt) は、運賃構造をモデル化するより詳細な方法を提供します。そのため、[fare_transfer_rules.txt](#fare_transfer_rulestxt) の使用は、ファイル [fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) とは完全に別です。 |
| [areas.txt](#areastxt) |任意| 場所のエリアグループ化。 |
| [stop_areas.txt](#stop_areastxt) |任意| 停留所をエリアに割り当てるルール。 |
| [networks.txt](#networkstxt) | **条件付きで禁止** | ルートのネットワークグループ化。<br><br>条件付きで禁止:<br> - [routes.txt](#routestxt)に`network_id`が存在する場合は**禁止**です。<br> - それ以外の場合は任意。 |
| [route_networks.txt](#route_networkstxt) | **条件付きで禁止** | ネットワークにルートを割り当てるルール。<br><br>条件付きで禁止:<br> - [routes.txt](#routestxt)に`network_id`が存在する場合は**禁止**です。<br> - それ以外の場合は任意。 |
| [shapes.txt](#shapestxt) |任意| 車両の移動経路をマッピングするためのルール。ルート配置と呼ばれることもあります。 |
| [frequencies.txt](#frequenciestxt) |任意| ヘッドウェイベースのサービスのヘッドウェイ (旅行間の時間)、または固定スケジュールサービスの圧縮表現。 |
| [transfers.txt](#transferstxt) |任意| ルート間の乗り換えポイントでの接続を確立するためのルール。 |
| [pathways.txt](#pathwaystxt) |任意| 駅内の場所をリンクする構内通路。 |
| [levels.txt](#levelstxt) | **条件付きで必須** | 駅内の階・フロア。<br><br>条件付きで必須:<br> - エレベーター付きの経路を記述する場合 ( `pathway_mode=5` ) **必須**。<br> - それ以外の場合は任意。 |
| [location_groups.txt](#location_groupstxt) |任意| 乗客が乗車または降車をリクエストできる場所を示す停車地のグループ。 |
| [location_group_stops.txt](#location_group_stopstxt) |任意| 停車地を場所グループに割り当てるルール。 |
| [locations.geojson](#locationsgeojson) |任意| オンデマンド サービスによる乗客の乗車または降車リクエストのゾーン。GeoJSON ポリゴンとして表されます。 |
| [booking_rules.txt](#booking_rulestxt) |任意| 乗客がリクエストしたサービスの予約情報。 |
| [translations.txt](#translationstxt) |任意| 顧客向けのデータセット値の翻訳。 |
| [feed_info.txt](#feed_infotxt) | **条件付きで必須** | 発行者、バージョン、有効期限情報を含むデータセットのメタデータ。<br><br>条件付きで必須:<br> - [translations.txt](#translationstxt) が提供されている場合は**必須**です。<br> - それ以外の場合は推奨。|
| [attributions.txt](#attributionstxt) |任意| データセットの帰属表示。|

## ファイル要件

データセット ファイルの形式と内容には、次の要件が適用されます。

* すべてのファイルは、カンマ区切りのテキストとして保存する必要があります。
* 各ファイルの最初の行には、フィールド名が含まれている必要があります。[フィールド定義](#field-definitions) セクションの各サブセクションは、GTFS データセット内のファイルの 1 つに対応し、そのファイルで使用できるフィールド名をリストします。
* すべてのファイル名とフィールド名は、大文字と小文字が区別されます。
* フィールド値には、タブ、復帰改行、または改行を含めることはできません。
* 引用符またはカンマを含むフィールド値は、引用符で囲む必要があります。また、フィールド値内の各引用符の前には引用符を付ける必要があります。これは、Microsoft Excel がカンマ区切り (CSV) ファイルを出力する方法と一致しています。 CSV ファイル形式の詳細については、[http://tools.ietf.org/html/rfc4180](http://tools.ietf.org/html/rfc4180) を参照してください。
次の例は、フィールド値がコンマ区切りファイルでどのように表示されるかを示しています。
 * **元のフィールド値:** ``引用符`、コンマ、およびテキストが含まれています`
 * **CSV ファイル内のフィールド値:** `"`引用符`、コンマ、およびテキストが含まれています"`
* フィールド値には、HTML タグ、コメント、またはエスケープ シーケンスを含めることはできません。
* フィールド間またはフィールド名間の余分なスペースは削除する必要があります。多くのパーサーは、スペースを値の一部と見なすため、エラーが発生する可能性があります。
* 各行は、CRLF または LF 改行文字で終了する必要があります。
* すべての Unicode 文字をサポートするには、ファイルを UTF-8 でエンコードする必要があります。Unicode バイト オーダー マーク (BOM) 文字を含むファイルは許容されます。 BOM 文字と UTF-8 の詳細については、[http://unicode.org/faq/utf_bom.html#BOM](http://unicode.org/faq/utf_bom.html#BOM) を参照してください。
* すべてのデータセット ファイルは、まとめて zip 圧縮する必要があります。ファイルは、サブフォルダーではなく、ルート レベルに直接配置する必要があります。
* 顧客向けのすべてのテキスト文字列 (停留所名、ルート名、行先標識を含む) では、小文字を表示できるディスプレイで地名を大文字にするローカル規則に従い、大文字と小文字を混在させる必要があります (例: “Brighton Churchill Square”、“Villiers-sur-Marne”、“Market Street”)。
* フィード全体で、名前やその他のテキストの略語の使用は避けてください (例: Street の代わりに St.)。ただし、場所が略称で呼ばれる場合は除きます (例: “JFK Airport”)。略語は、スクリーン リーダー ソフトウェアや音声ユーザー インターフェイスによるアクセシビリティに問題が生じる可能性があります。使用ソフトウェアは、完全な単語を略語に確実に変換して表示するように設計できますが、略語から完全な単語に変換すると、エラーが発生するリスクが高くなります。

## データセットの公開と一般的な方法

* データセットは、zip ファイル名を含むパブリックの永続的な URL で公開する必要があります。(例: www.agency.org/gtfs/gtfs.zip) 理想的には、使用ソフトウェア アプリケーションによるダウンロードを容易にするために、ファイルにアクセスするためにログインする必要なく、URL を直接ダウンロードできる必要があります。 GTFS データセットはオープンにダウンロードできるようにすることが推奨されています（そして最も一般的な方法です）が、データ プロバイダーがライセンスやその他の理由で GTFS へのアクセスを制御する必要がある場合は、自動ダウンロードを容易にする API キーを使用して GTFS データセットへのアクセスを制御することが推奨されます。
* GTFS データは、安定した場所にある 1 つのファイルに、交通機関（または機関群）のサービスの最新の公式説明が常に含まれるように、反復して公開する必要があります。
* データセットは、可能な限り、データの反復をまたいで`stop_id`、 `route_id`、および`agency_id`の永続的な識別子（id フィールド）を維持する必要があります。
* 1 つの GTFS データセットには、現在のサービスと今後のサービスを含める必要があります（`統合`データセットと呼ばれることもあります）。 2 つの異なる GTFS フィードから結合されたデータセットを作成するために使用できる [マージ ツール](../../../resources/gtfs/#gtfs-merge-tools) が複数あります。
    * 公開された GTFS データセットは、いつでも少なくとも今後 7 日間は有効である必要があります。理想的には、運行会社がスケジュールが継続して運用されると確信している限り有効です。
    * 可能であれば、GTFS データセットは少なくとも今後 30 日間のサービスをカバーする必要があります。
 * 古いサービス (期限切れのカレンダー) はフィードから削除する必要があります。
 * サービスの変更が 7 日以内に有効になる場合は、このサービスの変更は、静的な GTFS データセットではなく、GTFS リアルタイム フィード (サービス アドバイザリまたは旅行更新) を通じて表現する必要があります。
 * GTFS データをホストする Web サーバーは、ファイル変更dateを正しく報告するように構成する必要があります ([HTTP/1.1- Request for Comments 2616、セクション 14.29 を参照)。](https://tools.ietf.org/html/rfc2616#section-14.29)).

## フィールド定義

### agency.txt 

ファイル: **必須**

主キー(`agency_id`)

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `agency_id` |ユニーク ID | **条件付きで必須** | 多くの場合、交通機関と同義である交通ブランドを識別します。 1 つの機関が複数の個別のサービスを運営している場合など、機関とブランドは異なる場合があることに注意してください。 このドキュメントでは、`ブランド`の代わりに`機関`という用語を使用します。 データセットには、複数の機関のデータが含まれる場合があります。<br><br>条件付きで必須:<br> - データセットに複数の交通機関のデータが含まれている場合は**必須**です。<br> - それ以外の場合は推奨。 |
| `agency_name` |Text| **必須** | 交通機関の正式名称。 |
| `agency_url` | URL | **必須** | 交通機関の URL。 |
| `agency_timezone` | タイムゾーン | **必須** | 交通機関が所在するタイムゾーン。データセットで複数の機関が指定されている場合、それぞれに同じ`agency_timezone`が必要です。 |
| `agency_lang` | 言語コード |任意| この交通機関が使用する主な言語。GTFS のユーザーがデータセットの大文字と小文字の規則やその他の言語固有の設定を選択できるようにするために提供する必要があります。 |
| `agency_phone` | 電話番号 |任意| 指定された機関の音声電話番号。このフィールドは、機関のサービスエリアの一般的な電話番号を表すstring値です。数字をグループ化するために句読点を含めることができます。ダイヤル可能なテキスト (TriMet の`503-238-RIDE`など) は許可されていますが、フィールドにはその他の説明テキストを含めることはできません。 |
| `agency_fare_url` | URL |任意| 乗客がその機関のチケットやその他の運賃手段をオンラインで購入できる Web ページの URL。 |
| `agency_email` | 電子メール |任意| 機関のカスタマー サービス部門によってアクティブに監視されている電子メール アドレス。この電子メール アドレスは、交通機関の乗客が機関のカスタマー サービス担当者に連絡できる直接の連絡先である必要があります。 |

### stops.txt 

ファイル: **条件付きで必須**

主キー(`stop_id`)

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `stop_id` |ユニーク ID | **必須** |場所を識別します: 停留所/プラットフォーム、駅、入口/出口、汎用ノード、または乗車エリア ( ``location_type``を参照)。<br><br> ID は、すべての`stops.stop_id`、 locations.geojson `id`、および`location_groups.location_group_id`値にわたって一意である必要があります。<br><br>複数のルートで同じ`stop_id`が使用される場合があります。 |
| `stop_code` |Text|任意| 乗客に対して場所を識別する短いテキストまたは番号。これらのコードは、多くの場合、電話ベースの交通情報システムで使用され、または乗客が特定の場所の情報を入手しやすくするために標識に印刷されます。 `stop_code` は、一般向けである場合は`stop_id`と同じになることがあります。乗客にコードが提示されない場所では、このフィールドは空白のままにしてください。 |
| `stop_name` |Text| **条件付きで必須** | 場所の名前。 `stop_name` は、時刻表に印刷されているか、オンラインで公開されているか、標識に表示されている、機関の乗客向けの場所の名前と一致する必要があります。他の言語に翻訳するには、[translations.txt](#translationstxt) を使用します。<br><br>場所が乗車エリアの場合 (`location_type=4`)、 `stop_name` には、機関が表示する乗車エリアの名前を含める必要があります。これは、1 文字だけの場合 (一部のヨーロッパの都市間鉄道駅のように) もあれば、`車椅子乗車エリア`(ニューヨーク市の地下鉄) や`短距離列車の先頭`(パリの RER) のようなテキストの場合もあります。<br><br>条件付きで必須:<br> - 停留所 ( `location_type=0`)、駅 (`location_type=1`)、または入口/出口 (`location_type=2` ) の場所の場合は **必須** です。<br> - 汎用ノード ( `location_type=3`) または乗車エリア (`location_type=4` ) の場所の場合は任意。|
| `tts_stop_name` |Text|任意| `stop_name`の読み取り可能なバージョン。詳細については、[用語の定義](#term-definitions)の`テキスト読み上げフィールド`を参照してください。|
| `stop_desc` |Text|任意| 有用で質の高い情報を提供する場所の説明。`stop_name` と重複してはいけません。|
| `stop_name` `stop_lat` | 緯度 | **条件付きで必須** | 場所の緯度。<br><br>停留所/プラットフォーム (`location_type=0`) および乗車エリア (`location_type=4`) の場合、座標はバスポール (存在する場合) の座標でなければならず、そうでない場合は旅行者が車両に乗車する場所 (車両が停止する道路や線路ではなく、歩道またはプラットフォーム) の座標でなければなりません。<br><br>条件付きで必須:<br> - 停留所 ( `location_type=0`)、駅 (`location_type=1`)、または入口/出口 (`location_type=2` ) の場所の場合は **必須** です。<br> - 汎用ノード ( `location_type=3`) または乗車エリア (`location_type=4` ) の場所の場合は任意。|
| `stop_lon` | 経度 | **条件付きで必須** | 場所の経度。<br><br>停留所/プラットフォーム (`location_type=0`) および乗車エリア (`location_type=4`) の場合、座標はバスポール (存在する場合) の座標でなければならず、そうでない場合は旅行者が車両に乗車する場所 (車両が停止する道路や線路ではなく、歩道またはプラットフォーム) の座標でなければなりません。<br><br>条件付きで必須:<br> - 停留所 ( `location_type=0`)、駅 (`location_type=1`)、または入口/出口 (`location_type=2` ) の場所の場合は **必須** です。<br> - 汎用ノード ( `location_type=3`) または乗車エリア (`location_type=4` ) の場所の場合は任意。|
| `zone_id` | ID |任意| 停車場の料金ゾーンを識別します。このレコードが駅または駅の入口を表す場合、 `zone_id`は無視されます。|
| `stop_url` | URL |任意| 場所に関する Web ページの URL。これは、`agency.agency_url`および`routes.route_url`フィールド値とは異なる必要があります。|
| `location_type` | 列挙型 |任意| 場所の種類。有効なオプションは次のとおりです。<br><br> `0` (または空白) - **停留所** (または **プラットフォーム**)。乗客が交通機関の車両に乗車`parent_station`降車する場所です。`parent_station` 内で定義されている場合はプラットフォームと呼ばれます。<br> `1` - **駅**。1 つ以上のプラットフォームを含む物理的な構造またはエリア。<br> `2` - **入口/出口**。乗客が通りから駅に出入りできる場所です。入口/出口が複数の駅に属している場合、両方の駅に経路でリンクされている可能性がありますが、データ プロバイダーはそのうちの 1 つを親として選択する必要があります。<br> `3` - **汎用ノード**。他の`location_type`に一致しない駅内の場所。[pathways.txt](#pathwaystxt) で定義された経路をリンクするために使用できます。<br> `4` - **乗車エリア**。乗客が車両に乗ったり降車したりできるプラットフォーム上の特定の場所です。|
| `parent_station` | `stops.stop_id`部` ID | **条件付きで必須** | [stops.txt](#stopstxt) で定義されているさまざまな場所間の階層を定義します。次のように、親の場所のIDが含まれます。<br><br> - **停車駅/プラットフォーム** (`location_type=0`): `parent_station`フィールドには駅のIDが含まれます。<br> - **駅** (`location_type=1`): このフィールドは空でなければなりません。<br> - **入口/出口** (`location_type=2`) または **汎用ノード** (`location_type=3`): `parent_station`フィールドには駅のIDが含まれます (`location_type=1`)<br> - **乗車エリア** (`location_type=4`): `parent_station`フィールドにはプラットフォームのIDが含まれます。<br><br>条件付きで必須:<br> - ** 入口 ( `location_type=2`)、汎用ノード (`location_type=3`)、または搭乗エリア (`location_type=4` ) の場所の場合は **必須** です。<br> - 停留所/プラットフォームの場合は任意(`location_type=0`)。<br> - 駅 (`location_type=1`) では禁止されています。|
| `stop_timezone` | タイムゾーン |任意| 場所のタイムゾーン。場所に親駅がある場合は、独自のタイムゾーンを適用する代わりに、親駅のタイムゾーンを継承します。 `stop_timezone`が空の駅と親のない停留所は、 `agency.agency_timezone`で指定されたタイムゾーンを継承します。[stop_times.txt](#stop_timestxt) で提供される時間は、 ` `stop_timezone` `agency.agency_timezone`で指定されたタイムゾーンです。これにより、旅行がどのタイムゾーンを通過するかに関係なく、旅行の途中で旅行の時間値が常に増加することが保証されます。|
| `wheelchair_boarding` | 列挙型 |任意| 場所から車椅子で乗車できるかどうかを示します。有効なオプションは次のとおりです。<br><br>保護者のいない場合の停止:<br> `0` または空 - 停留所のアクセシビリティ情報がありません。<br> `1` - この停留所の一部の車両は

車椅子に乗ったライダーが乗っています。<br> `2` - この停留所では車椅子での乗車はできません。<br><br>チャイルドストップの場合:<br> `0` または空 - 親ステーションで指定されている場合、停留所は親ステーションから`wheelchair_boarding`動作を継承します。<br> `1` - 駅の外から特定の停留所/プラットフォームまでアクセス可能な経路が存在します。<br> `2` - 駅の外から特定の停留所/プラットフォームまでアクセス可能な経路が存在しません。<br><br>駅の出入口について：<br> `0` または空 - 親に指定されている場合、駅の入口は親駅の`wheelchair_boarding`動作を継承します。<br> `1` - 駅の入り口は車椅子でアクセス可能です。<br> `2` - 駅の入口から停留所/プラットフォームへのアクセス経路がありません。 |
| `level_id` | `levels.level_id`部` ID |任意| 場所のレベル。同じレベルが、リンクされていない複数の駅で使用される場合があります。|
| `platform_code` |Text|任意| プラットフォーム停留所 (駅に属する停留所) のプラットフォーム識別子。これは、プラットフォーム識別子のみである必要があります (例: "G" または "3")。`プラットフォーム`や`トラック`などの単語 (またはフィードの言語固有の同等語) を含めないでください。これにより、フィード コンシューマーは、プラットフォーム識別子を他の言語に国際化およびローカライズしやすくなります。 |


### routes.txt 

ファイル: **必須**

主キー(`route_id`)

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `route_id` |ユニーク ID | **必須** | ルートを識別します。 |
| `agency_id` | `agency.agency_id`部` ID | **条件付きで必須** | 指定されたルートの事業者。<br><br>条件付きで必須:<br> - [agency.txt](#agencytxt ) に複数の代理店が定義されている場合は**必須**です。<br> - それ以外の場合は推奨。 |
| `route_short_name` |Text| **条件付きで必須** | ルートの短縮名。多くの場合、乗客がルートを識別するために使用する短い抽象的な識別子 (例: "32"、"100X"、"緑")。`route_short_name` と`route_long_name` の`route_short_name`を定義できます。<br><br>条件付きで必須:<br> - ** `routes.route_long_name`が空の場合は必須** です。<br> - 簡単なサービス指定がある場合に推奨。これは、サービスの一般的な乗客名である必要があり、12 文字以内にする必要があります。|
| `route_long_name` |Text| **条件付きで必須** | ルートの完全な名前。この名前は通常、 `route_short_name`よりも説明的で、ルートの目的地または停車地が含まれることがよくあります。`route_short_name` と`route_long_name` の両方を定義できます。<br><br>条件付きで必須:<br> - ** `routes.route_short_name`が空の場合は必須** です。<br> - それ以外の場合は任意。 |
| `route_desc` |Text|任意| 有用で質の高い情報を提供するルートの説明。 `route_short_name`または`route_long_name`と重複してはいけません。<hr> _例: `A`列車は、マンハッタンの Inwood-207 St とクイーンズの Far Rockaway-Mott Avenue の間を常時運行しています。また、午前 6 時頃から深夜頃まで、追加の`A`が` Inwood-207 St と Lefferts Boulevard の間を運行しています (列車は通常、Lefferts Blvd と Far Rockaway の間を交互に運行します)。_ |
| `route_type` | Enum | **必須** | ルートで使用される交通機関の種類を示します。有効なオプションは次のとおりです。<br><br> `0` - 路面電車、路面電車、ライトレール。大都市圏内のライトレールまたはストリートレベルのシステム。<br> `1` - 地下鉄。大都市圏内のあらゆる地下鉄システム。<br> `2` - 鉄道。都市間または長距離の移動に使用されます。<br> `3` - バス。短距離および長距離のバス路線に使用されます。<br> `4` - フェリー。短距離および長距離の船舶サービスに使用されます。<br> `5` - ケーブル トラム。ケーブルが車両の下を走る路面電車に使用されます (例: サンフランシスコのケーブルカー)。<br> `6` - 空中リフト、吊り下げ式ケーブルカー（例：ゴンドラリフト、空中ケーブルウェイ）。キャビン、車両、ゴンドラ、またはオープンチェアが 1 本以上のケーブルによって吊り下げられているケーブル輸送。<br> `7` - ケーブルカー。急勾配向けに設計された鉄道システム。<br> `11` - トロリーバス。ポールを使用して架空線から電力を供給する電気バス。<br> `12` - モノレール。線路が単一のレールまたはビームで構成される鉄道。 |
| `route_url` | URL |任意| 特定のルートに関する Web ページの URL。`agency.agency_url` 値とは異なる必要があります。 |
| `route_color` | 色 |任意| 公開資料に一致するルートの色の指定。省略または空のままにした場合、デフォルトで白 (`FFFFFF`) になります。 `route_color`と`route_text_color`の色の違いは、白黒`agency.agency_url`で表示したときに十分なコントラストを提供する必要があります。 |
| `route_text_color` | 色 |任意| `route_color`の背景に描画されるテキストに使用する判読可能な色。省略または空のままにした場合、デフォルトで黒 (`000000`) になります。 `route_color`と`route_text_color`の色の違いは、白黒画面で表示したときに十分なコントラストを提供する必要があります。 |
| `route_sort_order` | 負でない整数 |任意| 顧客への提示に最適な方法でルートを並べ替えます。`route_sort_order` 値が小さいルート・路線系統が最初に表示されます。 |
| `continuous_pickup` | 列挙型 | **条件付きで禁止** | ルートのすべての旅行で、[shapes.txt](# `route_sort_order` ) で説明されているように、乗客が車両の移動経路に沿った任意の地点で交通機関の車両に乗車できることを示します。有効なオプションは次のとおりです。<br><br> `0` - 連続停止ピックアップ。<br> `1`または空 - 連続停止ピックアップなし。<br> `2` - 継続的な停車ピックアップを手配するには代理店に電話するしなければならない。<br> `3` - 連続停止ピックアップを手配するにはドライバーと調整するしなければならない。<br><br> `routes.continuous_pickup`の値は、ルート沿いの特定の`stop_time`に対して`stop_times.continuous_pickup`の値を定義することによって上書きできます。<br><br> **条件付きで禁止**:<br> - このルートのいずれかの旅行に `stop_times.start_pickup_drop_off_window` または `stop_times.end_pickup_drop_off_window` が定義されている場合は**禁止**です。<br> - それ以外の場合は任意。 |
| `continuous_drop_off` | 列挙型 | **条件付きで禁止** | 乗客がルートのすべての旅行で、[shapes.txt](#shapestxt) で説明されているように、車両の移動経路に沿った任意の地点で交通機関の車両から降車できることを示します。有効なオプションは次のとおりです。<br><br> `0` - 連続停止ドロップオフ。<br> `1`または空 - 連続停止ドロップオフなし。<br> `2` - 連続停車降車を手配するには代理店に電話するしなければならない。<br> `3` - 連続停車降車を手配するには、ドライバーと調整するしなければならない。<br><br> `routes.continuous_drop_off`の値は、ルート沿いの特定の`stop_time`に対して`stop_times.continuous_drop_off`の値を定義することによって上書きできます。<br><br> **条件付きで禁止**:<br> - このルートのいずれかの旅行に `stop_times.start_pickup_drop_off_window` または `stop_times.end_pickup_drop_off_window` が定義されている場合は**禁止**です。<br> - それ以外の場合は任意。 |
| `network_id` | ID | **条件付きで禁止** | ルートのグループを識別します。[routes.txt](#routestxt) 内の複数の行に同じ`network_id`が含まれる場合があります。<br><br>条件付きで禁止:<br> - [route_networks.txt](#route_networkstxt) ファイルが存在する場合は**禁止**です。<br> - それ以外の場合は任意。 

### trips.txt 

ファイル: **必須**

主キー(`trip_id`)

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `route_id` | `routes.route_id`部` ID | **必須** | ルートを識別します。 |
| `service_id` | `calendar.service_id`または`calendar_dates.service_id`部` ID | **必須** | 1 つ以上のルートでサービスが利用可能な日付のセットを識別します。 |
| `trip_id` |ユニーク ID | **必須** | 旅行を識別します。 |
| `trip_headsign` |Text|任意| 乗客に旅行の目的地を示す標識に表示されるText。このフィールドは、ルート内の旅行を区別するために使用できる、車両にヘッドサイン テキストが表示されるすべてのサービスに推奨されます。<br><br>旅行中にヘッドサインが変わる場合、旅行中の特定の`stop_time`の ` `stop_times.stop_headsign`の値を定義することで、 `trip_headsign`の値を上書きできます。 |
| `trip_short_name` |Text|任意| 通勤電車の列車番号を識別するなど、乗客に旅行を識別するために使用される一般向けのテキスト。乗客が旅行名をあまり使用しない場合は、 `trip_short_name` `trip_short_name`を空にする必要があります。`trip_short_name` 値を指定する場合、サービス日内の旅行を一意に識別する必要があります。目的地名や特急/急行の指定には使用しないでください。 |
| `direction_id` | 列挙型 |任意| 旅行の移動方向を示します。このフィールドはルーティングには使用しないでください。時刻表を公開するときに方向別に旅行を分ける方法を提供します。有効なオプションは次のとおりです。<br><br> `0` - 一方向への移動（例：往路）。<br> `1` - 反対方向に移動します（例：入線）。<hr> *例: `trip_headsign`と`direction_id`フィールドを一緒に使用して、一連の旅行の各方向への旅行に名前を割り当てることができます。[trips.txt](#tripstxt) ファイルには、時刻表で使用するために次のレコードを含めることができます。*<br> `trip_id,..., 旅行の見出し, 方向 ID`<br> `1234,...,空港,0`<br> `1505,...,Downtown,1` |
| `block_id` | ID |任意| 旅行が属するブロックを識別します。ブロックは、共有のサービス日と`block_id`によって定義される、同じ車両を使用して行われる単一の旅行または複数の連続した旅行で構成されます。 `block_id`には、異なるサービス日の旅行が含まれる場合があり、個別のブロックが作成されます。[以下の例](#example-blocks-and-service-day)を参照してください。座席内乗り換え情報を提供するには、代わりに`transfer_type` `4` の [transfers](#transferstxt) を指定する必要があります。 |
| `shape_id` | `shapes.shape_id`部` ID | **条件付きで必須** | 旅行の車両移動経路を説明する地理空間シェイプを識別します。<br><br>条件付きで必須:<br> - 旅行に [routes.txt](#routestxt) または [stop_times.txt](#stop_timestxt) のいずれかで定義された連続的な乗車または降車動作がある場合、**必須** です。<br> - それ以外の場合は任意です。 |
| `wheelchair_accessible` | 列挙型 |任意| 車椅子でのアクセス可能性を示します。有効なオプションは次のとおりです:<br><br> `0` または空 - 旅行のアクセシビリティ情報はありません。<br> `1` - この特定の旅行で使用される車両には、少なくとも 1 人の車椅子の乗客を収容できます。<br> `2` - この旅行では車椅子の乗客は乗車できません。 |
| `bikes_allowed` | 列挙型 |任意| 自転車が許可されているかどうかを示します。有効なオプションは次のとおりです:<br><br> `0` または空 - 旅行の自転車情報がありません。<br> `1` - この特定の旅行で使用される車両には、少なくとも 1 台の自転車を収容できます。<br> `2` - この旅行では自転車は許可されていません。 |

#### 例: ブロックとサービス日

以下の例は有効で、曜日ごとに異なるブロックがあります。

| route_id | trip_id | service_id                      | block_id | <span style="font-weight:normal">*(最初の停止時刻)*</span> | <span style="font-weight:normal">*(最後の停止時刻)*</span> |
|----------|---------|--------------------------------|-----------|-----------------------------------------|-----------------------------------------|
| red      | trip_1 | mon-tues-wed-thurs-fri-sat-sun | red_loop | 22:00:00                               | 22:55:00                |
| red      | trip_2 | fri-sat-sun                   | red_loop | 23:00:00                            | 23:55:00                |
| red      | trip_3 | fri-sat                        | red_loop | 24:00:00                            | 24:55:00             |
| red      | trip_4 | mon-tues-wed-thurs          | red_loop | 20:00:00                            | 20:50:00             |
| red      | trip_5 | mon-tues-wed-thurs          | red_loop | 21:00:00                            | 21:50:00                |

上記表に関する注記:

* たとえば、金曜日から土曜日の朝にかけて、1 台の車両が`trip_1`、 `trip_2`、および`trip_3`を運行します (午後 10 時から午前 12 時 55 分まで)。最後の運行は土曜日の午前 12 時から午前 12 時 55 分までですが、時刻が 24:00:00 から 24:55:00 であるため、金曜日の`​​運行日`の一部であることに注意してください。
* 月曜日、火曜日、水曜日、および木曜日には、1 台の車両が午後 8 時から午後 10 時 55 分までのブロックで`trip_1`、 `trip_4`、および`trip_5` を運行します。

### stop_times.txt 

ファイル: **必須**

主キー(`trip_id`、 `stop_sequence`)

| フィールド名 |タイプ | 存在 | 説明 |
|------|------|------|------|
| `trip_id` | `trips.trip_id`部` ID | **必須** | 旅行を識別します。 |
| `arrival_time` | 時間 | **条件付きで必須** | `stops.stop_timezone`ではなく`agency.agency_timezone`ム` ゾーンでの、特定の旅行 ( `stop_times.stop_id`で定義) の停留所 ( `stop_times.trip_id` stop_times.stop_id` で定義) への到着時刻。<br><br>停留所での到着時間と出発時間が別々でない場合は、 `arrival_time`と`departure_time` は同じである必要があります。<br><br>サービス日の深夜以降の時間については、HH:MM:SS 形式で 24:00:00 より大きい値を入力します。<br><br>正確な到着時刻と出発時刻 (`timepoint=1`) が利用できない場合は、推定または補間された到着時刻と出発時刻 (`timepoint=0`) を指定する必要があります。<br><br>条件付きで必須:<br> - **旅行の最初と最後の停車地に必須** ( `stop_times.stop_sequence`で定義)。<br> - ** ` timepoint=1 ` の場合は必須** です。<br> - `start_pickup_drop_off_window`または`end_pickup_drop_off_window`が定義されている場合は**禁止**です。<br> - それ以外の場合は任意。|
| `departure_time` | 時間 | **条件付きで必須** | `stops.stop_timezone`ではなく`agency.agency_timezone`で指定されたタイムゾーンでの、特定の旅行 ( `stop_times.trip_id`で定義) からの出発時刻。<br><br>停留所での到着時間と出発時間が別々でない場合は、 `arrival_time`と`departure_time` は同じである必要があります。<br><br>サービス日の深夜以降の時間については、HH:MM:SS 形式で 24:00:00 より大きい値を入力します。<br><br>正確な到着時刻と出発時刻 (`timepoint=1`) が利用できない場合は、推定または補間された到着時刻と出発時刻 (`timepoint=0`) を指定する必要があります。<br><br>条件付きで必須:<br> - ** ` timepoint=1 ` の場合は必須** です。<br> - `start_pickup_drop_off_window`または`end_pickup_drop_off_window`が定義されている場合は**禁止**です。<br> - それ以外の場合は任意。 |
| `stop_id` | `stops.stop_id`部` ID | **条件付きで必須** | サービス対象の停留所を識別します。旅行中にサービスされるすべての停留所は、[stop_times.txt](#stop_timestxt) に記録されている必要があります。参照される場所は停留所/プラットフォームである必要があります。つまり、 `stops.location_type`値は `0` または空である必要があります。同じ旅行で停留所が複数回サービスされる場合があり、複数の旅行とルートが同じ停留所にサービスを提供する場合があります。<br><br>停留所を使用するオンデマンド サービスは、それらの停留所でサービスが利用できる順序で参照する必要があります。データ コンシューマーは、各 stop_time の`pickup/drop_off_type`と各`start/end_pickup_drop_off_window`の時間制約によって禁止されていない限り、ある停留所または場所から旅行中の後の任意の停留所または場所への移動が可能であると想定する必要があります。<br><br>条件付きで必須:<br> - **必須** `stop_times.location_group_id`と`stop_times.location_id`が定義されていない場合。<br> - `stop_times.location_group_id`または`stop_times.location_id`が定義されている場合は**禁止**です。|
| `location_group_id` | `location_groups.location_group_id`部` ID | **条件付きで禁止** | 乗客が乗車または降車をリクエストできる停留所のグループを示すサービス対象の場所グループを識別します。旅行中にサービスされるすべての場所グループは、[stop_times.txt](#stop_timestxt) に記録されている必要があります。複数の旅行とルートが同じ場所グループにサービスを提供できます。<br><br>ロケーション グループを使用するオンデマンド サービスは、それらのロケーション グループでサービスが利用可能な順序で参照する必要があります。データ コンシューマーは、各 stop_time の`pickup/drop_off_type`と各`start/end_pickup_drop_off_window`の時間制約によって禁止されていない限り、ある停留所または場所から旅行中の後の任意の停留所または場所への移動が可能であると想定する必要があります。<br><br> **条件付きで禁止**:<br> - `stop_times.stop_id`または`stop_times.location_id`が定義されている場合は**禁止**です。|
| `location_id` | `locations.geojson`から`id`部` ID | **条件付きで禁止** | 乗客が乗車または降車をリクエストできるサービス提供ゾーンに対応する GeoJSON ロケーションを識別します。旅行中にサービス提供されるすべての GeoJSON ロケーションは、[stop_times.txt](#stop_timestxt) に記録されている必要があります。複数の旅行とルートで同じ GeoJSON ロケーションにサービスを提供できます。<br><br>場所内のオンデマンド サービスは、その場所でサービスが利用できる順序で参照する必要があります。データ コンシューマーは、各 stop_time の`pickup/drop_off_type`と各`start/end_pickup_drop_off_window`の時間制約によって禁止されていない限り、ある停留所または場所から旅行中の後の任意の停留所または場所への移動が可能であると想定する必要があります。<br><br> **条件付きで禁止**:<br> - `stop_times.stop_id`または`stop_times.location_group_id`が定義されている場合は**禁止**です。 |
| `stop_sequence` | 負でない整数 | **必須** | 特定の旅行の停車地、場所グループ、または GeoJSON の場所の順序。値は旅行に沿って増加する必要がありますが、連続している必要はありません。<hr> *例: 旅行の最初の場所には`stop_sequence`= `1`、旅行の 2 番目の場所には`stop_sequence`=`23` 、3 番目の場所には`stop_sequence`=`40` などとなります。*<br><br>同じ場所グループまたは GeoJSON の場所内での移動には、[stop_times.txt](#stop_timestxt) に同じ`location_group_id`または`location_id`つ` 2 つのレコードが必要です。 |
| `stop_headsign` |Text|任意| 乗客に旅行の目的地を示す標識に表示されるText。このフィールドは、停留所間でヘッドサインが変わるときに、デフォルトの`trips.trip_headsign`を上書きします。ヘッドサインが旅行全体にわたって表示される場合は、代わりに`trips.trip_headsign`を使用する必要があります。<br><br> 1 つの`stop_time`に指定された`stop_headsign`値は、同じ旅行内の後続の`stop_time`には適用されません。同じ旅行内の複数の`stop_time`の`trip_headsign`を上書きする場合は、各`stop_time`行で`stop_headsign`値を繰り返す必要があります。|
| `start_pickup_drop_off_window` | 時間 | **条件付きで必須** | GeoJSON の場所、場所グループ、または停留所でオンデマンド サービスが利用可能になる時間。<br><br> **条件付きで必須**:<br> - `stop_times.location_group_id`または`stop_times.location_id`が定義されている場合は **必須** です。<br> - ** `end_pickup_drop_off_window`が定義されている場合は必須。<br> - `arrival_time`または`departure_time`が定義されている場合は**禁止**です。<br> - それ以外の場合は任意。 |
| `end_pickup_drop_off_window` | 時間 | **条件付きで必須** | GeoJSON の場所、場所グループ、または停留所でオンデマンド サービスが終了する時間。<br><br> **条件付きで必須**:<br> - `stop_times.location_group_id`または`stop_times.location_id`が定義されている場合は **必須** です。<br> - ** `start_pickup_drop_off_window`が定義されている場合は必須。<br> - `arrival_time`または`departure_time`が定義されている場合は**禁止**です。<br> - それ以外の場合は任意。 |
| `pickup_type` | 列挙型 | **条件付きで禁止** | ピックアップ方法を示します。有効なオプションは次のとおりです:<br><br> `0` または空 - 定期的にスケジュールされたピックアップ。<br> `1` - ピックアップできません。<br> `2` - 代理店に電話して集荷を手配するしなければならない。<br> `3` - ピックアップを手配するにはドライバーと調整するしなければならない。<br><br> **条件付きで禁止**:<br> - `start_pickup_drop_off_window`または`end_pickup_drop_off_window`が定義されている場合、` pickup_type =0` は**禁止**です。<br> - `start_pickup_drop_off_window`または`end_pickup_drop_off_window`が定義されている場合、` pickup_type =3` は**禁止** です。<br> - それ以外の場合は任意。 |
| `drop_off_type` | 列挙型 | **条件付きで禁止** | ドロップオフ方法を示します。有効なオプションは次のとおりです:<br><br> `0` または空 - 定期的に予定されている降車。<br> `1` - ドロップオフは利用できません。<br> `2` - 降車手配のため代理店に電話するしなければならない。<br> `3` - 降車手配についてはドライバーと調整するしなければならない。<br><br> **条件付きで禁止**:<br> - `start_pickup_drop_off_window`または`end_pickup_drop_off_window`が定義されている場合、` drop_off_type =0` は**禁止**です。<br> - それ以外の場合は任意。 |
| `continuous_pickup` | 列挙型 | **条件付きで禁止** | 乗客は、[shapes.txt](#shapestxt) で説明されているように、この`stop_time`から旅行の`stop_sequence`の次の`stop_time`まで、車両の移動経路に沿った任意の時点で交通機関の車両に乗車できることを示します。有効なオプションは次のとおりです。<br><br> `0` - 連続停止ピックアップ。<br> `1`または空 - 連続停止ピックアップなし。<br> `2` - 継続的な停車ピックアップを手配するには代理店に電話するしなければならない。<br> `3` - 連続停止ピックアップを手配するには、ドライバーと調整するしなければならない。<br><br>このフィールドに値が入力されている場合は、[routes.txt](#routestxt) で定義されている連続ピックアップ動作が上書きされます。このフィールドが空の場合、 `stop_time`は [routes.txt](#routestxt) で定義されている連続ピックアップ動作を継承します。<br><br> **条件付きで禁止**:<br> - `start_pickup_drop_off_window`または`end_pickup_drop_off_window`が定義されている場合は**禁止**です。<br> - それ以外の場合は任意。 |
| `continuous_drop_off` | 列挙型 | **条件付きで禁止** | 乗客は、[shapes.txt](#shapestxt) で説明されているように、この`stop_time`から旅行の`stop_sequence`の次の`stop_time`まで、車両の移動経路に沿った任意の地点で交通機関の車両から降車できることを示します。有効なオプションは次のとおりです。<br><br> `0` - 連続停止ドロップオフ。<br> `1`または空 - 連続停止ドロップオフなし。<br> `2` - 連続停車降車を手配するには代理店に電話するしなければならない。<br> `3` - 連続停車降車を手配するには、ドライバーと調整するしなければならない。<br><br>このフィールドに値が入力されている場合は、[routes.txt](#routestxt) で定義されている連続降車動作が上書きされます。このフィールドが空の場合、 `stop_time`は [routes.txt](#routestxt) で定義されている連続降車動作を継承します。<br><br> **条件付きで禁止**:<br> - `start_pickup_drop_off_window`または`end_pickup_drop_off_window`が定義されている場合は**禁止**です。<br> - それ以外の場合は任意。 |
| `shape_dist_traveled` | 非負のfloat|任意| 最初の停車地からこのレコードで指定された停車地までの、関連付けられたシェイプに沿って実際に移動した距離。このフィールドは、旅行中に任意の 2 つの停車地間に描画するシェイプの量を指定します。[shapes.txt](#shapestxt) で使用されているのと同じ単位にするしなければならない。 `shape_dist_traveled`に使用する値は`stop_sequence`とともに増加する必要があります。ルートに沿った逆方向の移動を示すために使用してはなりません。<br><br>ループまたはインライン（車両が 1 回の移動で同じ線形部分を横断または移動する）があるルートに推奨。[`shapes.shape_dist_traveled`](#shapestxt) を参照してください。<hr> *例: バスがシェイプの開始から停留所まで 5.25 キロメートルの距離を移動する場合、 `shape_dist_traveled`=`5.25` となります。*|
| `timepoint` | 列挙型 |任意| 停留所の到着時間と出発時間が車両によって厳密に遵守されているか、または概算時間や補間時間であるかを示します。このフィールドにより、GTFS プロデューサーは、概算時間であることを示すとともに、補間された停留所時間を提供できます。有効なオプションは次のとおりです。<br><br> `0` - 時間はおおよそのものとみなされます。<br> `1` - 時間は正確であるとみなされます。<br><br>到着時刻または出発時刻が定義されている [stop_times.txt](#stop_timestxt) のすべてのレコードには、タイムポイント値が入力されている必要があります。タイムポイント値が指定されていない場合は、すべての時刻が正確であるとみなされます。 |
| `pickup_booking_rule_id` | `booking_rules.booking_rule_id` を参照する外部 ID |任意| この停車時刻での搭乗予約ルールを識別します。<br><br> ` pickup_type =2 ` の場合に推奨。 |
| `drop_off_booking_rule_id` | `booking_rules.booking_rule_id` を参照する外部 ID |任意| この停車時間における降車予約ルールを識別します。<br><br> ` drop_off_type =2` の場合に推奨。|

#### オンデマンド サービスのルーティング動作
- 出発地と目的地の間のルーティングまたは移動時間を提供する場合、データ コンシューマーは、 `start_pickup_drop_off_window`および`end_pickup_drop_off_window`が定義されている同じ`trip_id`を持つ中間のstop_times.txtレコードを無視する必要があります。無視する必要がある内容の例については、[データ例のページ](../examples/flex/#ignoring-intermediate-stop-times-records-with-pickupdrop-off-windows) を参照してください。
- 同じ`trip_id`つ` 2 つ以上のstop_times.txtレコード間で、 locations.geojson `id`ジオメトリ、 `start/end_pickup_drop_off_window`時間、および`pickup_type`または`drop_off_type`が同時に重複することは禁止されています。禁止されている内容の例については、[データ例ページ](../examples/flex/#zone-overlap-constraint)を参照してください。

### calendar.txt 

ファイル: **条件付きで必須**

主キー(`service_id`)

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `service_id` |ユニーク ID | **必須** | 1 つ以上のルートでサービスが利用可能な日付のセットを識別します。 |
| `monday` | 列挙型 | **必須** | `start_date`フィールドと`end_date`フィールドで指定されたdate範囲のすべての月曜日にサービスが実行されるかどうかを示します。特定の日付の例外は [calendar_dates.txt](#calendar_datestxt) にリストされていることに注意してください。有効なオプションは次のとおりです。<br><br> `1` - サービスはdate範囲内のすべての月曜日に利用できます。<br> `0` -date範囲内の月曜日にはサービスは利用できません。 |
| `tuesday` | 列挙型 | **必須** | 火曜日に適用される点を除き、 `monday`と同じように機能します |
| `wednesday` | 列挙型 | **必須** | 水曜日に適用される点を除き、 `monday`と同じように機能します |
| `thursday` | 列挙型 | **必須** | 木曜日に適用される点を除き、 `monday`と同じように機能します |
| `friday` | 列挙型 | **必須** | 金曜日に適用される点を除き、 `monday`と同じように機能します |
| `saturday` | 列挙型 | **必須** | 土曜日に適用される点を除き、 `monday`と同じように機能します。 |
| `sunday` | 列挙型 | **必須** | 日曜日に適用される点を除き、 `monday`と同じように機能します。 |
| `start_date` | 日付 | **必須** | サービス間隔の開始サービス日。 |
| `end_date` | 日付 | **必須** | サービス間隔の終了サービス日。このサービス日は間隔に含まれます。 |

### calendar_dates.txt 

ファイル: **条件付きで必須**

主キー(`service_id`、 `date`)

[calendar_dates.txt](#calendar_datestxt) テーブルは、dateによってサービスを明示的に有効または無効にします。2 つの方法で使用できます。

*推奨: [calendar_dates.txt](#calendar_datestxt) を [calendar.txt](#calendartxt) と組み合わせて使用​​し、[calendar.txt](#calendartxt) で定義されているデフォルトのサービス パターンの例外を定義します。サービスが通常定期的で、明示的な日付にいくつかの変更がある場合 (たとえば、特別なイベント サービスや学校のスケジュールに対応するため)、これは適切なアプローチです。この場合、 `calendar_dates.service_id`は`calendar.service_id`を参照する外部IDです。
* 代替: [calendar.txt](#calendartxt) を省略し、[calendar_dates.txt](#calendar_datestxt) で各サービスのdateを指定します。これにより、かなりのサービスバリエーションが可能になり、通常の週次スケジュールのないサービスに対応できます。この場合、 `service_id`はIDです。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `service_id` | `calendar.service_id`部` IDまたはID | **必須** | 1 つ以上のルートでサービス例外が発生する日付のセットを識別します。 [calendar_dates.txt](#calendartxt) と [calendar_dates.txt](#calendar_datestxt) を併用する場合、各 ( `service_id`、`date `service_id` ) ペアは [calendar.txt](#calendartxt) と [calendar_dates.txt](#calendar_datestxt) の両方に出現する場合、[calendar_dates.txt](#calendar_datestxt) の情報によって [calendar.txt](#calendartxt) で指定されたサービス情報が変更されます。|
| `date` | 日付 | **必須** | サービス例外が発生した日付。|
| `exception_type` | 列挙型 | **必須** |dateフィールドで指定されたdateにサービスが利用可能かどうかを示します。有効なオプションは次のとおりです。<br><br> `1` - 指定されたdateにサービスが追加されました。<br> `2` - 指定されたdateのサービスが削除されました。<hr> *例: ルートに休日に利用できる一連の旅行と、それ以外の日に利用できる一連の旅行があるとします。1 つの`service_id` が通常のサービス スケジュールに対応し、別の`service_id` が休日スケジュールに対応します。特定の休日については、[calendar_dates.txt](#calendar_datestxt) ファイルを使用して休日を休日`service_id`に追加し、通常の`service_id`スケジュールから休日を削除できます。* |

### fare_attributes.txt 

ファイル: **任意**

主キー(`fare_id`)

**バージョン**<br> 
運賃を記述するためのモデル化オプションは2つあります。GTFS-運賃V1は、最小限の運賃情報を記述するための従来のオプションです。GTFS-運賃V2は、機関の運賃構造をより詳細に記述できる更新された方法です。どちらも広告に表示できます。

ataset ですが、特定のデータセットに対してデータ コンシューマーが使用する方法は 1 つだけです。GTFS-Fares V2 を GTFS- 運賃V1よりも優先することをお勧めします。<br><br> GTFS- 運賃V1に関連付けられているファイルは次のとおりです。<br> - [fare_attributes.txt](#運賃属性txt)<br> - [fare_rules.txt](#運賃規則txt)<br><br> GTFS-Fares V2 に関連付けられているファイルは次のとおりです。<br> - [fare_media.txt](#fare_mediatxt)<br> - [fare_products.txt](#fare_productstxt)<br> - [fare_leg_rules.txt](#運賃規則txt)<br> - [fare_transfer_rules.txt](#運賃振替ルールtxt)

<br> 

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `fare_id` |ユニーク ID | **必須** | 運賃クラスを識別します。 |
| `price` | 負でないfloat| **必須** | `currency_type`で指定された単位の運賃。 |
| `currency_type` | 通貨コード | **必須** | 運賃の支払いに使用する通貨。 |
| `payment_method` | 列挙型 | **必須** | 運賃を支払う必要がある時期を示します。有効なオプションは次のとおりです。<br><br> `0` - 運賃は乗車時に支払われます。<br> `1` - 乗車前に運賃を支払う必要があります。 |
| `transfers` | Enum | **必須** | この運賃で許可される乗り換え回数を示します。有効なオプションは次のとおりです:<br><br> `0` - この運賃では乗り換えは許可されません。<br> `1` - ライダーは 1 回乗り換えることができます。<br> `2` - ライダーは2回乗り換えることができます。<br>空 - 無制限の転送が許可されます。 |
| `agency_id` | `agency.agency_id`部` ID | **条件付きで必須** | 運賃の関連代理店を識別します。<br><br>条件付きで必須:<br> - [agency.txt](#agencytxt ) に複数の代理店が定義されている場合は**必須**です。<br> - それ以外の場合は推奨。 |
| `transfer_duration` | 負でない整数 |任意|`transfers`が期限切れになるまでの時間 (秒単位)。`transfers` =`0` の場合、このフィールドはチケットの有効期間を示すために使用されるか、空のままにすることができます。 |

### fare_rules.txt 

ファイル: **任意**

主キー(`*`)

[fare_rules.txt](#fare_rulestxt) テーブルは、[fare_attributes.txt](#fare_attributestxt) の運賃が旅程にどのように適用されるかを指定します。ほとんどの運賃体系では、次のルールの組み合わせが使用されます。

* 運賃は出発駅または到着駅によって異なります。
* 運賃は、旅程が通過するゾーンによって異なります。
* 運賃は、旅程が使用するルートによって異なります。

[fare_rules.txt](#fare_rulestxt) および [fare_attributes.txt](#fare_attributestxt) を使用して運賃体系を指定する方法を示す例については、GoogleTransitDataFeed オープンソース プロジェクト wiki の [FareExamples](https://web.archive.org/web/20111207224351/https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) をご覧ください。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `fare_id` | `fare_attributes.fare_id`部` ID | **必須** | 運賃クラスを識別します。 |
| `route_id` | `routes.route_id`部` ID |任意| 運賃クラスに関連付けられたルートを識別します。同じ運賃属性を持つルートが複数存在する場合は、ルートごとに [fare_rules.txt](#fare_rulestxt) にレコードを作成します。<hr> *例: 運賃クラス`b`がルート`TSW`と`TSE`で有効な場合、[fare_rules.txt](#fare_rulestxt) ファイルには運賃クラスに関する次のレコードが含まれます。*<br> ` 運賃ID、route_id`<br> `b,TSW`<br> `b,TSE`|
| `origin_id` | `stops.zone_id`部` ID |任意| 出発地ゾーンを識別します。運賃クラスに複数の出発地ゾーンがある場合は、[fare_rules.txt](#fare_rulestxt) に各`origin_id`のレコードを作成します。<hr> *例: 運賃クラス`b`がゾーン`2`またはゾーン`8`から出発するすべての旅行に有効な場合、[fare_rules.txt](#fare_rulestxt) ファイルには運賃クラスに関する次のレコードが含まれます。*<br> `運賃ID,...,原産地ID`<br> `b,...,2`<br> `b,...,8` |
| `destination_id` | `stops.zone_id`部` ID |任意| 目的地ゾーンを識別します。運賃クラスに複数の目的地ゾーンがある場合は、[fare_rules.txt](#fare_rulestxt) に各`destination_id`のレコードを作成します。<hr> *例: `origin_id`フィールドと`destination_id`フィールドを一緒に使用して、運賃クラス`b`ン` 3 と 4 の間の旅行に有効であることを指定できます。ゾーン 3 と 5 の間の旅行の場合、[fare_rules.txt](#fare_rulestxt) ファイルには、運賃クラスに関する次のレコードが含まれます。*<br> `運賃ID、...、出発地ID、目的地ID`<br> `b,...,3,4`<br> `b,...,3,5` |
| `contains_id` | `stops.zone_id`部` ID |任意| 特定の運賃クラスを使用しているときに乗客が進入するゾーンを識別します。一部のシステムで正しい運賃クラスを計算するために使用されます。<hr> *例: 運賃クラス`c`ン` 5、6、7 を通過する GRT ルートのすべての旅行に関連付けられている場合、[fare_rules.txt](#fare_rulestxt) には次のレコードが含まれます。*<br> `fare_id, route_id,...,contains_id`<br> `c,GRT,...,5`<br> `c,GRT,...,6`<br> `c,GRT,...,7`<br> *運賃を適用するには、すべての`contains_id`ゾーンが一致している必要があるため、ゾーン 5 と 6 は通過するがゾーン 7 は通過しない旅程には運賃クラス`c`はありません。詳細については、GoogleTransitDataFeed プロジェクト wiki の [https://code.google.com/p/googletransitdatafeed/wiki/FareExamples](https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) をご覧ください。* |

### timeframes.txt 

ファイル: **任意**

主キー(`*`)

時間帯、曜日、または特定の日に基づいて変動する運賃を記述するために使用されます。タイムフレームは、[fare_leg_rules.txt](#fare_leg_rulestxt) で運賃商品に関連付けることができます。<br> 
同じ`timeframe_group_id`値と`service_id`値に重複する時間間隔があってはなりません。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `timeframe_group_id` | ID | **必須** | 時間枠または時間枠のセットを識別します。|
| `start_time` | 時間 | **条件付きで必須** | 時間枠の開始を定義します。間隔には開始時刻が含まれます。<br> `24:00:00` より大きい値は禁止されています。`start_time` の値が空の`start_time`は `00:00:00` とみなされます。<br><br>条件付きで必須:<br> - ** `timeframes.end_time`が定義されている場合は必須。<br> - **それ以外の場合は禁止** |
| `end_time` | 時間 | **条件付きで必須** | 時間枠の終了を定義します。間隔には終了時刻は含まれません。<br> `24:00:00` より大きい値は禁止されています。`end_time` の値が空の`end_time`は `24:00:00` とみなされます。<br><br>条件付きで必須:<br> - ** `timeframes.start_time`が定義されている場合は必須。<br> - それ以外の場合は**禁止** |
| `service_id` | `calendar.service_id`または`calendar_dates.service_id`部` ID | **必須** | タイムフレームが有効な日付のセットを識別します。 |

#### タイムフレームのローカル時間セマンティクス
- 運賃イベントの時間を [timeframes.txt](#timeframestxt) に対して評価する場合、イベント時間は、運賃イベントの停車駅または親駅の`stop_timezone`(指定されている場合) によって決定されるローカル タイムゾーンを使用してローカル時間で計算されます。指定されていない場合は、フィードの代理店のタイムゾーンを代わりに使用する必要があります。
- `現在の日`は、ローカル タイムゾーンを基準に計算された運賃イベントの時間の現在のdateです。 `当日`は、特に深夜を過ぎる旅行の場合、運賃区間の旅行のサービス日とは異なる場合があります。
- 運賃イベントの`時刻`は、GTFS 時間フィールドタイプのセマンティクスを使用して、`当日`を基準として計算されます。

### fare_media.txt 

ファイル: **任意** 

主キー(`fare_media_id`)

運賃商品の使用に使用できるさまざまな運賃メディアを説明します。運賃メディアは、運賃商品の表示や検証に使用される物理的または仮想的なホルダーです。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `fare_media_id` |ユニーク ID | **必須** | 運賃メディアを識別します。|
| `fare_media_name` |Text|任意| 運賃メディアの名前。<br><br>交通カード (`fare_media_type =2`) またはモバイル アプリ (`fare_media_type =4`) などの運賃メディアの場合、 `fare_media_name`を含める必要があり、それを配信する組織が使用する乗客向けの名前と一致する必要があります。 |
| `fare_media_type` | Enum | **必須** | 運賃メディアのタイプ。有効なオプションは次のとおりです。<br><br> `0` - なし。物理的なチケットが提供されずに運転手または車掌に現金で支払うなど、運賃商品の購入または検証に運賃媒体が関与しない場合に使用されます。<br> `1` - 乗客が一定期間内に、事前に購入した一定数の旅行、または無制限の旅行のいずれかを利用できる物理的な紙のチケット。<br> `2` - チケット、パス、または金銭的価値が保存されている物理的な交通カード。<br> `3` - アカウントベースのチケット発行用のオープンループ トークン コンテナとしての cEMV (非接触型 Europay、Mastercard、Visa)。<br> `4` - 仮想交通カード、チケット、パス、または金銭的価値を保存したモバイル アプリ。|

### fare_products.txt 

ファイル: **任意**

主キー(`fare_product_id`、 `fare_media_id`)

乗客が購入可能な運賃の範囲を記述したり、乗り換えコストなど、複数の区間を含む旅程の合計運賃を計算するときに考慮したりするために使用されます。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `fare_product_id` | ID | **必須** | 運賃商品または運賃商品のセットを識別します。<br><br> [fare_products.txt](#fare_productstxt) 内の複数のレコードが同じ`fare_product_id`を共有する場合があります。その場合、別のファイルから参照されたときに、そのIDを持つすべてのレコードが取得されます。<br><br>複数のレコードが同じ`fare_product_id`を共有していても、異なる`fare_media_id`を持つ場合があります。これは、運賃商品を使用するために利用できるさまざまな方法 (潜在的に異なる価格) を示します。|
| `fare_product_name` |Text|任意| 乗客に表示される運賃商品の名前。|
| `fare_media_id` | `fare_media.fare_media_id`部` ID |任意| 旅行中に運賃商品を使用するために使用できる運賃メディアを識別します。`fare_media_id` が空の場合、運賃メディアは不明であると見なされます。|
| `amount` | 通貨金額 | **必須** | 運賃商品のコスト。乗り継ぎ割引を表す場合は負の値になる場合があります。無料の運賃商品を表す場合はゼロになる場合があります。|
| `currency` | 通貨コード | **必須** | 運賃商品のコストの通貨。 |


### fare_leg_rules.txt 

ファイル: **任意**

主キー(`network_id, from_area_id, to_area_id, from_timeframe_group_id, to_timeframe_group_id, fare_product_id`)

旅行の各区間の運賃規則。

 [`fare_leg_rules.txt`](#fare_leg_rulestxt) の運賃は、乗客が移動する区間に一致する規則を見つけるために、ファイル内のすべてのレコードをフィルタリングして照会する必要があります。

区間のコストを処理するには:

 1.ファイル [fare_leg_rules.txt](#fare_leg_rulestxt) は、旅行の特性を定義するフィールドでフィルタリングする必要があります。これらのフィールドは次のとおりです:
    - `fare_leg_rules.network_id` 
    - `fare_leg_rules.from_area_id` 
    - `fare_leg_rules.to_area_id` 
    - `fare_leg_rules.from_timeframe_group_id` 
    - `fare_leg_rules.to_timeframe_group_id` 
<br/> 

 2.旅行の特性に基づいて、区間が [fare_leg_rules.txt](#fare_leg_rulestxt) のレコードと完全に一致する場合、そのレコードを処理して区間のコストを決定する必要があります。このファイルは、空のエントリを 2 つの方法で処理します: 空のセマンティクスまたはルールの優先順位。
<br/> 

 3.完全一致が見つからず、`rule_priority` フィールドが存在しない場合は、 `fare_leg_rules.network_id`、 `fare_leg_rules.from_area_id`、および`fare_leg_rules.to_area_id`の空のエントリをチェックして、区間のコストを処理する必要があります。
    - `fare_leg_rules.network_id`の空のエントリは、[routes.txt](#routestxt) または [networks.txt](#networkstxt) で定義されているすべてのネットワークに対応しますが、 `fare_leg_rules.network_id`の下にリストされているネットワークは除きます。

    - `fare_leg_rules.from_area_id`の空のエントリは、 `areas.area_id`で定義されているすべてのエリアに対応しますが、`fare_leg_rules.from_area_id`の下にリストされているエリアは除きます。
    - 空の`fare_leg_rules.to_area_id`のエントリは、 `fare_leg_rules.to_area_id`の下にリストされているものを除いて、 `areas.area_id`で定義されているすべてのエリアに対応します 
<br/> 

 4. `rule_priority` フィールドが存在する場合、
    - `fare_leg_rules.network_id`のエントリが空の場合、区間のネットワークはこのルールのマッチングには影響しません。
    - `fare_leg_rules.from_area_id`のエントリが空の場合、区間の出発エリアはこのルールのマッチングには影響しません。
    - `fare_leg_rules.to_area_id`のエントリが空の場合、区間の到着エリアはこのルールのマッチングには影響しません。
<br/> 
      
 5.区間が上記の規則のいずれにも一致しない場合は、運賃は不明です。

<br/> 

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `leg_group_id` | ID |任意| [fare_leg_rules.txt](#fare_leg_rulestxt) 内のエントリのグループを識別します。<br><br> `fare_transfer_rules.from_leg_group_id`と`fare_transfer_rules.to_leg_group_id`間の運賃振替ルールを記述するために使用されます。<br><br> [fare_leg_rules.txt](#fare_leg_rulestxt) 内の複数のエントリが同じ`fare_leg_rules.leg_group_id`に属している場合があります。<br><br> [fare_leg_rules.txt](#fare_leg_rulestxt) 内の同じエントリ ( `fare_leg_rules.leg_group_id`は含まない) は、複数の`fare_leg_rules.leg_group_id`に属してはなりません。|
| `network_id` | ` `routes.network_id`または`networks.network_id`部` ID |任意| 運賃区間ルールに適用されるルート ネットワークを識別します。<br><br> `rule_priority` フィールドが存在せず、フィルタリングされている`network_id`に一致する`fare_leg_rules.network_id`値がない場合、デフォルトで空の`fare_leg_rules.network_id`が一致します。<br><br> `fare_leg_rules.network_id`の空のエントリは、[routes.txt](#routestxt) または [networks.txt](#networkstxt) で定義されているすべてのネットワークに対応しますが、 `fare_leg_rules.network_id`の下にリストされているネットワークは除きます。<br><br>ファイルに `rule_priority` フィールドが存在する場合、空の`fare_leg_rules.network_id`は、区間のルート ネットワークがこのルールのマッチングに影響しないことを示します。 |
| `from_area_id` | `areas.area_id`部` ID |任意| 出発エリアを識別します。<br><br> `rule_priority` フィールドが存在せず、フィルタリングされている`area_id`に一致する`fare_leg_rules.from_area_id`値がない場合、デフォルトで空の`fare_leg_rules.from_area_id`が一致します。<br><br> `fare_leg_rules.from_area_id`の空のエントリは、 `fare_leg_rules.from_area_id`の下にリストされているものを除く、 `areas.area_id`で定義されているすべてのエリアに対応します。<br><br>ファイルに `rule_priority` フィールドが存在する場合、空の`fare_leg_rules.from_area_id`は、区間の出発エリアがこのルールのマッチングに影響しないことを示します。 |
| `to_area_id` | `areas.area_id`部` ID |任意| 到着エリアを識別します。<br><br> `rule_priority` フィールドが存在せず、フィルタリングされている`area_id`に一致する`fare_leg_rules.to_area_id`値がない場合、デフォルトで空の`fare_leg_rules.to_area_id`が一致します。<br><br> `fare_leg_rules.to_area_id`の空のエントリは、 `fare_leg_rules.to_area_id`の下にリストされているものを除く、 `areas.area_id`で定義されているすべてのエリアに対応します。<br><br>ファイルに `rule_priority` フィールドが存在する場合、空の`fare_leg_rules.to_area_id`は、区間の到着エリアがこのルールのマッチングに影響しないことを示します。 |
| `from_timeframe_group_id` | `timeframes.timeframe_group_id`部` ID |任意| 運賃区間の開始時に運賃検証イベントのタイムフレームを定義します。<br><br>運賃区間の`開始時間`は、イベントの発生が予定されている時間です。たとえば、乗客が乗車して運賃を確認する運賃区間の開始時のバスの予定出発時刻がその時間になります。以下のルール マッチング セマンティクスでは、開始時間は [timeframes.txt](#timeframestxt) の [ローカル時間セマンティクス](#timeframe-local-time-semantics) によって決定されるローカル時間で計算されます。運賃区間の出発イベントの停留所または駅は、必要に応じてタイムゾーン解決に使用する必要があります。<br><br> `from_timeframe_group_id`を指定する運賃区間ルールの場合、[timeframes.txt](#timeframestxt) に以下の条件がすべて満たされるレコードが少なくとも 1 つ存在する場合、そのルールは特定の区間と一致します。<br> - `timeframe_group_id`の値は`from_timeframe_group_id`の値と同じです。<br> - レコードの`service_id`によって識別される日のセットには、運賃区間の開始時刻の`現在の日`が含まれます。<br> - 運賃区間の開始時間の`時刻`は、レコードの`timeframes.start_time`値以上であり、 `timeframes.end_time`値未満です。<br><br>空の`fare_leg_rules.from_timeframe_group_id`は、区間の開始時刻がこのルールの一致に影響しないことを示します。 |
| `to_timeframe_group_id` | `timeframes.timeframe_group_id`部` ID |任意| 運賃区間の終了時の運賃検証イベントの期間を定義します。<br><br>運賃区間の`終了時間`は、イベントの発生が予定されている時間です。たとえば、乗客が降りて運賃を確認する運賃区間の終了時にバスが到着する予定の時刻が、その時間になります。以下のルール マッチング セマンティクスでは、終了時間は [timeframes.txt](#timeframestxt) の [ローカル時間セマンティクス](#timeframe-local-time-semantics) によって決定されるローカル時間で計算されます。運賃区間の到着イベントの停留所または駅は、必要に応じてタイムゾーン解決に使用する必要があります。<br><br> `to_timeframe_group_id`を指定する運賃区間ルールの場合、[timeframes.txt](#timeframestxt) に以下の条件がすべて満たされるレコードが少なくとも 1 つ存在する場合、そのルールは特定の区間と一致します。<br> - `timeframe_group_id`の値は`to_timeframe_group_id`の値と同じです。<br> - レコードの`service_id`によって識別される日のセットには、運賃区間の終了時刻の`現在の日`が含まれます。<br> - 運賃区間の終了時間の`時刻`は、レコードの`timeframes.start_time`値以上であり、 `timeframes.end_time`値未満です。<br><br>空の`fare_leg_rules.to_timeframe_group_id`は、区間の終了時刻がこのルールの一致に影響しないことを示します。 |
| `fare_product_id` | `fare_products.fare_product_id`部` ID | **必須** | 区間を旅行するために必要な運賃商品。 |
| `rule_priority` | 負でない整数 |任意| 一致ルールが区間に適用される優先順位を定義し、特定のルールが他のルールよりも優先されるようにします。 `fare_leg_rules.txt`内の複数のエントリが一致する場合、`rule_priority` の値が最も高いルールまたはルール セットが選択されます。<br><br> `rule_priority` の値が空の場合、ゼロとして扱われます。 |

### fare_transfer_rules.txt 

ファイル: **任意**

主キー(`from_leg_group_id, to_leg_group_id, fare_product_id, transfer_count, duration_limit`)

[`fare_leg_rules.txt`](#fare_leg_rulestxt) で定義された旅行区間間の乗り換えの運賃規則。

複数区間の旅程の費用を処理するには:

 1. `fare_leg_rules.txt`で定義された適用可能な運賃区間グループは、乗客の旅程に基づいて、すべての個々の旅行区間に対して決定する必要があります2.ファイル [fare_transfer_rules.txt](#fare_transfer_rulestxt) は、乗り換えの特性を定義するフィールドでフィルタリングする必要があります。これらのフィールドは次のとおりです:
    - `fare_transfer_rules.from_leg_group_id` 
    - `fare_transfer_rules.to_leg_group_id`<br/> 
   <br/> 

 3.乗り換えの特性に基づいて、乗り換えが [fare_transfer_rules.txt](#fare_transfer_rulestxt) のレコードと完全に一致する場合、そのレコードを処理して乗り換えコストを決定する必要があります。
 4.完全に一致するものが見つからない場合は、乗り換えコストを処理するために、 `from_leg_group_id`または`to_leg_group_id`の空のエントリを確認する必要があります。
    - `fare_transfer_rules.from_leg_group_id`の空のエントリは、 `fare_leg_rules.leg_group_id`で定義されているすべての区間グループに対応しますが、 `fare_transfer_rules.from_leg_group_id`にリストされているものを除きます。
    - `fare_transfer_rules.to_leg_group_id`の空のエントリは、`fare_leg_rules.leg_group_id` で定義されているすべての区間グループに対応しますが、 `fare_leg_rules.leg_group_id`にリストされているものを除きます。 `fare_transfer_rules.to_leg_group_id`<br/> 
   <br/> 
 5.移籍が上記のいずれの規則にも該当しない場合は、移籍の取り決めはなく、各レグは別個のものとみなされます。

<br/> 

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `from_leg_group_id` | `fare_leg_rules.leg_group_id`部` ID |任意| 転送前の運賃区間ルールのグループを識別します。<br><br>フィルタリングされている`leg_group_id`に一致する`fare_transfer_rules.from_leg_group_id`値がない場合、デフォルトで空の`fare_transfer_rules.from_leg_group_id`が一致します。<br><br> `fare_transfer_rules.from_leg_group_id`の空のエントリは、`fare_leg_rules.leg_group_id`にリストされているものを除く、 `fare_transfer_rules.from_leg_group_id`で定義されているすべての区間グループに対応します |
| `to_leg_group_id` | `fare_leg_rules.leg_group_id`部` ID |任意| 転送後の運賃区間ルールのグループを識別します。<br><br>フィルタリングされている`leg_group_id`に一致する`fare_transfer_rules.to_leg_group_id`値がない場合、デフォルトで空の`fare_transfer_rules.to_leg_group_id`が一致します。<br><br> `fare_transfer_rules.to_leg_group_id`の空のエントリは、`fare_transfer_rules.to_leg_group_id` にリストされているものを除く、 `fare_transfer_rules.to_leg_group_id`で定義されているすべての区間グループに対応します |
| `transfer_count` | ゼロ以外の整数 | **条件付きで禁止** | 乗り換えルールを適用できる連続乗り換えの数を定義します。<br><br>有効なオプションは次のとおりです。<br> `-1` - 制限なし。<br> `1`以上 - 転送ルールが適用される転送の数を定義します。<br><br>サブジャーニーが異なる`transfer_count`を持つ複数のレコードと一致する場合、サブジャーニーの現在の転送カウント以上の最小`transfer_count`を持つルールが選択されます。<br><br>条件付きで禁止:<br> - `fare_transfer_rules.from_leg_group_id`が`fare_transfer_rules.to_leg_group_id`と等しくない場合は**禁止**です。<br> - **必須** `fare_transfer_rules.from_leg_group_id`が`fare_transfer_rules.to_leg_group_id`と等しい場合。 |
| `duration_limit` | 正の整数 |任意| 乗り換えの期間制限を定義します。<br><br>秒単位の整数増分で表現するしなければならない。<br><br>期間制限がない場合は、 `fare_transfer_rules.duration_limit`は空にする必要があります。 |
| `duration_limit_type` | 列挙型 | **条件付きで必須** | `fare_transfer_rules.duration_limit`の相対的な開始と終了を定義します。<br><br>有効なオプションは次のとおりです。<br> `0` - 現在の区間の出発運賃の検証と次の区間の到着運賃の検証の間。<br> `1` - 現在の区間の出発運賃の検証と次の区間の出発運賃の検証の間。<br> `2` - 現在の区間の到着運賃の検証と次の区間の出発運賃の検証の間。<br> `3` - 現在の区間の到着運賃の検証と次の区間の到着運賃の検証の間。<br><br>条件付きで必須:<br> - ** `fare_transfer_rules.duration_limit`が定義されている場合は必須。<br> - `fare_transfer_rules.duration_limit`が空の場合は**禁止**です。 |
| `fare_transfer_type` | 列挙型 | **必須** | 旅程中の区間間の乗り換えのコスト処理方法を示します。<br> ![](../../assets/2-leg.svg)<br>有効なオプションは次のとおりです。<br> `0` - 出発区間`fare_leg_rules.fare_product_id`と`fare_transfer_rules.fare_product_id`を加算したもの。A + AB。<br> `1` - 出発区間の`fare_leg_rules.fare_product_id`と`fare_transfer_rules.fare_product_id`と到着区間の`fare_leg_rules.fare_product_id`を加算します。A + AB + B。<br> `2` - `fare_transfer_rules.fare_product_id`; AB.<br><br>旅程中の複数の転送間のコスト処理のやり取り:<br> ![](../../assets/3-leg.svg)<br><table><thead><tr><th> `fare_transfer_type`</th><th>処理A > B</th><th>処理B > C</th></tr></thead><tbody><tr><td> `0`</td><td> A + A +B プラス</td><td>S + BC</td></tr><tr><td> `1`</td><td> A + AB + B</td><td> S + BC + C</td></tr><tr><td> `2`</td><td> AB</td><td> S + BC</td></tr></tbody></table>ここで、S は、前の区間と乗り換えの合計処理コストを示します。 |
| `fare_product_id` | `fare_products.fare_product_id`部` ID |任意| 2 つの運賃区間間の乗り換えに必要な運賃商品。空の場合、乗り換えルールのコストは 0 です。|


### areas.txt 

ファイル: **任意**

主キー(`area_id`)

エリア識別子を定義します。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `area_id` |ユニーク ID | **必須** | エリアを識別します。[areas.txt](#areastxt) 内で一意であるしなければならない。 |
| `area_name` |Text| **任意** | 乗客に表示されるエリアの名前。 |

### stop_areas.txt 

ファイル: **任意**

主キー(`*`)

[stops.txt](#stopstxt) からエリアに停留所を割り当てます。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `area_id` | `areas.area_id`部` ID | **必須** | 1 つまたは複数の`stop_id`が属するエリアを識別します。同じ`stop_id` が複数の`area_id`で定義される場合があります。 |
| `stop_id` | `stops.stop_id`部` ID | **必須** | 停留所を識別します。このフィールドで駅（つまり、 `stops.location_type=1`の停留所）が定義されている場合、そのすべてのプラットフォーム（つまり、この駅が ` `stops.parent_station` `stops.location_type=0`のすべての停留所）は同じエリアの一部であると見なされます。この動作は、プラットフォームを他のエリアに割り当てることで上書きできます。 |

### networks.txt 

ファイル: **条件付きで禁止**

主キー(`network_id`)

運賃区間ルールに適用されるネットワーク識別子を定義します。 

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `network_id` |ユニーク ID | **必須** | ネットワークを識別します。[networks.txt](#networkstxt) 内で一意であるしなければならない。 |
| `network_name` |Text| **任意** |運賃区間の規則に適用されるネットワークの名前。これは、地方機関とその乗客によって使用されます。

### route_networks.txt 

ファイル: **条件付きで禁止**

主キー(`route_id`)

[routes.txt](#routestxt) からのルートをネットワークに割り当てます。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `network_id` | `networks.network_id`部` ID | **必須** | 1 つまたは複数の`route_id`が属するネットワークを識別します。`route_id` は、1 つの`network_id`でのみ定義できます。|
| `route_id` | `routes.route_id`部` ID | **必須** | ルートを識別します。 |

### shapes.txt 

ファイル: **任意**

主キー(`shape_id`、 `shape_pt_sequence`)

ルート形状は、車両がルート線形に沿って移動するパスを説明し、ファイルshapes.txtで定義されます。ルート形状は便に関連付けられ、車両が順番に通過する一連のポイントで構成されます。ルート形状は停留所等の位置を正確にインターセプトする必要はありませんが、トリップのすべての停留所等は、そのトリップのシェイプからわずかな距離内、つまりシェイプポイントを接続する直線セグメントの近くに配置する必要があります。 shapes.txtファイルは、すべてのルートベースのサービス (ゾーンベースのデマンドレスポンシブサービスではありません) に含める必要があります。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `shape_id` | ID | **必須** | シェイプを識別します。 |
| `shape_pt_lat` |緯度 | **必須** | シェイプ ポイントの緯度。[shapes.txt](#shapestxt) 内の各レコードは、シェイプを定義するために使用されるシェイプ ポイントを表します。|
| `shape_pt_lon` | 経度 | **必須** | シェイプ ポイントの経度。|
| `shape_pt_sequence` | 負でない整数 | **必須** | シェイプ ポイントが接続してシェイプを形成するシーケンス。値は移動に沿って増加する必要がありますが、連続している必要はありません。<hr> *例: 図形`A_shp`に` 3 つの点がある場合、[shapes.txt](#shapestxt) ファイルには図形を定義する次のレコードが含まれる可能性があります。*<br> `shape_id、shape_pt_lat、shape_pt_lon、shape_pt_sequence`<br> `A_shp,37.61956,-122.48161,0`<br> `A_shp,37.64430,-122.41070,6`<br> `A_shp,37.65863,-122.30839,11` |
| `shape_dist_traveled` | 非負のfloat|任意| 最初のシェイプ ポイントからこのレコードで指定されたポイントまでのシェイプに沿った実際の移動距離。旅行計画者がマップ上にシェイプの正しい部分を表示するために使用します。値は`shape_pt_sequence`とともに増加する必要があります。ルートに沿った逆方向の移動を示すために使用してはなりません。距離の単位は [stop_times.txt](#stop_timestxt) で使用されている単位と一致している必要があります。<br><br>ループまたはインライン (車両が 1 回の移動で同じ線形部分を横断または移動する) があるルートに推奨。 <br><img src="../../../assets/inlining.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;"><br>車両が後退したり、 

旅行の途中でルートの線形を横切るポイントがある場合、 `shape_dist_traveled` は、[shapes.txt](#shapestxt) 内のポイントの並び方が [stop_times.txt](#stop_timestxt) 内のレコードとどのように対応しているかを明確にするために重要です。<hr> *例: バスが上記で A_shp に定義された 3 つのポイントに沿って移動する場合、追加の`shape_dist_traveled`値 (ここではキロメートル単位で表示) は次のようになります。*<br> `shape_id、shape_pt_lat、shape_pt_lon、shape_pt_sequence、shape_dist_traveled`<br> `A_shp,37.61956,-122.48161,0,0`<br> `A_shp,37.64430,-122.41070,6,6.8310`<br> `A_shp,37.65863,-122.30839,11,15.8765` |

### frequencies.txt 

ファイル: **任意**

主キー(`trip_id`、 `start_time`)

[Frequencies.txt](#frequenciestxt) は、一定のヘッドウェイ (旅行間の時間) で動作する旅行を表します。このファイルは、2 つの異なるタイプのサービスを表すために使用できます。

* 頻度ベースのサービス (`exact_times`=`0`)。このサービスでは、サービスは 1 日を通して固定のスケジュールに従いません。代わりに、オペレーターは旅行に対して事前に決定されたヘッドウェイを厳密に維持しようとします。
* スケジュール ベースのサービス (`exact_times`= `1`) の圧縮表現。指定された期間の旅行に対してまったく同じヘッドウェイを持ちます。スケジュール ベースのサービスでは、オペレーターはスケジュールに厳密に従おうとします。


| フィールド名 | タイプ |存在 | 説明 |
|------|------|------|------|
| `trip_id` | ` `trips.trip_id`部` ID | **必須** | 指定されたサービス間隔が適用される旅行を識別します。 |
| `start_time` | 時間 | **必須** | 最初の車両が指定された間隔で旅行の最初の停車地から出発する時刻。 |
| `end_time` | 時間 | **必須** | 旅行の最初の停車地でサービスが別の間隔に変更される (または停止する) 時刻。 |
| `headway_secs` | 正の整数 | **必須** | `start_time`と`end_time`で指定された時間間隔中に、旅行の同じ停車地 (間隔) から出発する間隔 (秒単位)。同じ旅行に複数の間隔を定義できますが、重複することはできません。新しい運行間隔は、前の運行間隔が終了した正確な時間に開始される場合があります。 |
| `exact_times` | 列挙型 |任意| 旅行のサービスの種類を示します。詳細については、ファイルの説明を参照してください。有効なオプションは次のとおりです。<br><br> `0` または空 - 頻度ベースの旅行。<br> `1` - 一日を通してまったく同じヘッドウェイのスケジュールベースの旅行。この場合、 `end_time`値は、最後の希望旅行`start_time`より大きく、最後の希望旅行 start_time + `headway_secs`より小さくする必要があります。|

### transfers.txt 

ファイル: **任意**

主キー(`from_stop_id`、 `to_stop_id`、 `from_trip_id`、 `to_trip_id`、 ` `from_route_id`、 `to_route_id`)

旅程を計算する際、GTFS を使用するアプリケーションは、許容される時間と停留所の近接性に基づいて乗り換えを補間します。 [Transfers.txt](#transferstxt) は、選択した乗り換えに対する追加のルールとオーバーライドを指定します。

`from_trip_id`、 `to_trip_id`、 `from_route_id` 、および`to_route_id` を使用すると、乗り換えルールの詳細度をさらに高めることができます。 `from_stop_id`と`to_stop_id`に加えて、詳細度の順位付けは次のようになります:

 1.両方の`trip_id`が定義されています: `from_trip_id`と`to_trip_id`。
 2. 1 つの`trip_id`と`route_id`セットが定義されています: (`from_trip_id`と`to_route_id`) または (`from_route_id`と`to_trip_id`) 。
 3. 1 つの`trip_id`が定義されています: `from_trip_id`または`to_trip_id`。
 4.両方の`route_id`が定義されています: `from_route_id`と`to_route_id`。
 5. 1 つの`route_id`が定義されています: `from_route_id`または`to_route_id`。
 6..`from_stop_id`および`to_stop_id`が定義されています: ルートまたは旅行関連のフィールドは設定されていません。

到着旅行と出発旅行の順序付けられたペアが指定されている場合、これら 2 つの旅行間に適用される最も詳細度の高い乗り換えが選択されます。どの旅行のペアにも、適用可能な最大詳細度が同等の 2 つの乗り換えが存在することはできません。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `from_stop_id` | ` `stops.stop_id`部` ID | **条件付きで必須** | ルート間の接続が開始される停留所または駅を識別します。このフィールドが駅を参照する場合、乗り換えルールはそのすべての子停留所に適用されます。`transfer_types` 4 および5.では駅の参照は禁止されています。|
| `to_stop_id` | `stops.stop_id`部` ID | **条件付きで必須** |ルート間の接続が終了する停留所または駅を識別します。このフィールドが駅を参照する場合、転送ルールはすべての子停留所に適用されます。`transfer_types` 4 および5.では、駅の参照は禁止されています。|
| `from_route_id` | `routes.route_id`部` ID |任意| 接続が始まるルートを識別します。<br><br> `from_route_id`が定義されている場合、乗り換えは指定された`from_stop_id`のルート上の到着旅行に適用されます。<br><br> `from_trip_id`と`from_route_id` の両方が定義されている場合、 `trip_id` は`route_id`に属している必要があり、 `from_trip_id`が優先されます。 |
| `to_route_id` | `routes.route_id`部` ID |任意| 接続が終了するルートを識別します。<br><br> `to_route_id`が定義されている場合、乗り換えは指定された`to_stop_id`のルートの出発便に適用されます。<br><br> `to_trip_id`と`to_route_id` の両方が定義されている場合、 `trip_id` は`route_id`に属している必要があり、 `to_trip_id`が優先されます。 |
| `from_trip_id` | `trips.trip_id`部` ID | **条件付きで必須** | ルート間の接続が始まる旅行を識別します。<br><br> `from_trip_id`が定義されている場合、乗り換えは指定された`from_stop_id`の到着旅行に適用されます。<br><br> `from_trip_id`と`from_route_id`の両方が定義されている場合、 `trip_id` は`route_id`に属している必要があり、 `from_trip_id`が優先されます。 `transfer_type`が `4` または `5` の場合は必須。 |
| `to_trip_id` | `trips.trip_id`部` ID | **条件付きで必須** | ルート間の接続が終了する旅行を識別します。<br><br> `to_trip_id`が定義されている場合、乗り換えは指定された`to_stop_id`の出発旅行に適用されます。<br><br> `to_trip_id`と`to_route_id`の両方が定義されている場合、 `trip_id` は`route_id`に属している必要があり、 `to_trip_id`が優先されます。 `transfer_type`が `4` または `5` の場合は必須。 |
| `transfer_type` | Enum | **必須** | 指定された (`from_stop_id`、 `to_stop_id`) ペアの接続タイプを示します。有効なオプションは次のとおりです。<br><br> `0` または空 - ルート間の推奨乗り換えポイント。<br> `1` - 2 つのルート間の時間指定の乗り換えポイント。出発車両は到着車両を待機し、乗客がルート間を乗り換えるのに十分な時間を残すことが求められます。<br> `2` - 乗り継ぎを確実に行うには、到着から出発までの間に最低限の時間が必要です。乗り継ぎに必要な時間は`min_transfer_time`で指定します。<br> `3` - その場所ではルート間の乗り換えはできません。<br> `4` - 乗客は同じ車両に乗車したまま、ある旅行から別の旅行へ乗り換えることができます (`座席内乗り換え`)。このタイプの乗り換えの詳細については、[以下](#linked-trips) を参照してください。<br> `5` - 連続する旅行間での座席内乗り換えは許可されません。乗客は車両から降りて再び乗車する必要があります。このタイプの乗り換えの詳細については、[下記](#linked-trips)を参照してください。 |
| `min_transfer_time` | 負でない整数 |任意| 指定された停留所でルート間の乗り換えを許可するために必要な時間 (秒単位)。`min_transfer_time` は、各ルートのスケジュール変更に対応するためのバッファ時間を含め、一般的な乗客が 2 つの停留所間を移動するのに十分な時間である必要があります。 |

#### リンク`min_transfer_time`れた旅行

以下は、座席内乗り換えの有無にかかわらず、旅行をリンクするために使用される `transfer_type=4` および `=5` に適用されます。

リンクされた旅行は、同じ車両で運行されるしなければならない。車両は、他の車両と連結することも、連結を解除することもしてもよい。

リンクされたトリップ転送と block_id の両方が提供され、矛盾する結果が生成される場合は、リンクされたトリップ転送を使用する必要があります。

`from_trip_id` の最後の停車地は、 `from_trip_id` `to_trip_id`の最初の停車地に地理的に近いするべきであるがあり、 `from_trip_id`の最後の到着時刻は、` `to_trip_id`の最初の出発時刻より前であるが近いするべきである。`to_trip_id` トリップが次の運行日に発生する場合、 `from_trip_id`の最後の到着時刻は、`to_trip_id` `to_trip_id`の最初の出発時刻より遅くてもかまいしてもよい。

 通常の場合、便は1 対 1 でリンクできしてもよいが、より複雑なトリップの継続を表すために、1 対 n、n 対 1、または n 対 n でリンクすることもしてもよい。たとえば、2 つの列車の旅程 (下の図の旅程 A と旅程 B) は、共通の駅で車両連結操作を行った後、1 つの列車の旅程 (旅程 C) に統合できます。

- 1 対 n の継続では、各`to_trip_id`の`trips.service_id`は同一であるしなければならないがあります。
- n 対 1 の継続では、各`from_trip_id`の`trips.service_id`は同一であるしなければならない。
- n 対 n の継続では、両方の制約を尊重する必要があります。
- `trip.service_id`がどのサービス日でも重複してはしてはいけないという条件で、便は複数の異なる継続の一部としてリンクできます。

<pre> 
旅行 A
───────────────────\
                   \    旅行 C
                     ──────────────
旅行 B           /
───────────────────/
</pre> 

### pathways.txt 

ファイル: **任意**

主キー(`pathway_id`)

ファイル [pathways.txt](#pathwaystxt) と [levels.txt](#levelstxt) は、グラフ表現を使用して地下鉄や電車の駅を記述します。グラフ表現では、ノードが場所を、エッジが経路を表します。

駅の出入口 (場所として`location_type=2`で表されるノード) からプラットフォーム (場所として`location_type=0`または空で表されるノード) に移動するには、通路、改札口、階段、および経路として表されるその他のエッジを通過します。汎用ノード (場所として`location_type=3`で表されるノード) は、駅全体の経路を接続するために使用できます。

構内通路は、駅内で網羅的に定義する必要があります。経路が定義されている場合は、駅全体のすべての経路が表されているものとみなされます。したがって、次のガイドラインが適用されます:

- ぶら下がっている場所はありません: 駅内のいずれかの場所に経路がある場合は、その駅内のすべての場所に経路が必要です。ただし、乗車エリア (`location_type=4` 、以下のガイドラインを参照) があるプラットフォームは除きます。
- 乗車エリアのあるプラットフォームには経路はありません: 乗車エリア ( `location_type= `location_type=4` ) があるプラットフォーム ( `location_type=0`または空) は、ポイントではなく親オブジェクトとして扱われます。このような場合、プラットフォームに経路を割り当ててはなりません。すべての経路は、プラットフォームの各乗車エリアに割り当てる必要があります。
- ロックされたプラットフォームはありません: 各プラットフォーム ( `location_type=0`または空) または乗車エリア (`location_type=4`) は、経路のチェーンを介して少なくとも 1 つの入口/出口 (`location_type=2`) に接続されている必要があります。特定のプラットフォームから駅の外への経路を許可しない駅はまれです。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `pathway_id` |ユニーク ID | **必須** | 経路を識別します。システムによってレコードの内部識別子として使用されます。データセット内で一意であるしなければならない。<br><br>異なる経路では、 `from_stop_id`と`to_stop_id`の値が同一になる場合があります。<hr> _例: 2 つのエスカレーターが反対方向に並んでいる場合、または階段セットとエレベーターが同じ場所から同じ場所に行く場合、異なる`pathway_id` が同じ`from_stop_id`および`to_stop_id`値を持つことがあります。_|
| `from_stop_id` | ` `stops.stop_id`部` ID | **必須** | 経路が始まる場所。<br><br>プラットフォーム ( `location_type=0`または空)、入口/出口 (`location_type=2`)、汎用ノード (`location_type=3`)、または乗車エリア (`location_type=4` ) を識別する`stop_id`を含めるしなければならない。<br><br>駅を識別する`stop_id`の値 (`location_type=1`) は禁止されています。|
| `to_stop_id` | `stops.stop_id`部` ID | **必須** | 経路が終了する場所。<br><br>プラットフォーム ( `location_type=0`または空)、入口/出口 (`location_type=2`)、汎用ノード (`location_type=3`)、または乗車エリア (`location_type=4` ) を識別する`stop_id`を含めるしなければならない。<br><br>駅を識別する`stop_id`の値 (`location_type=1`) は禁止されています。|
| `pathway_mode` | 列挙型 | **必須** | 指定された (`from_stop_id`、 `to_stop_id`) ペア間の経路のタイプ。有効なオプションは次のとおりです。<br><br> `1` - 歩道。<br> `2` - 階段。<br> `3` - 動く歩道/動く歩道。<br> `4` - エスカレーター。<br> `5` - エレベーター。<br> `6` - 改札口 (または支払いゲート): 駅のエリアに渡る通路で、通過するには支払いの証明が必要です。改札口は、駅の有料エリアと無料エリアを分けたり、同じ駅内の異なる支払いエリアを互いに分けたりします。この情報を使用すると、乗客に不要な支払いを要求する近道を使って駅を経由するルートを回避できます。たとえば、バス専用通路に到達するために地下鉄のプラットフォームを歩くように乗客を誘導するなどです。<br> `7`- 出口ゲート: 有料エリアから、支払い証明がなくても通過できる無料エリアへの通路。|
| `is_bidirectional` | 列挙型 | **必須** | 通路の方向を示します。<br><br> `0` - `from_stop_id`から`to_stop_id`までのみ使用できる一方向の経路。<br> `1` - 両方向に使用できる双方向経路。<br><br>出口ゲート (`pathway_mode=7`) は双方向にすることはできません。|
| `length` | 非負のfloat数 |任意| 出発地 ( `from_stop_id`で定義 ) から目的地 ( `to_stop_id`で定義 ) までの経路の水平方向の長さ (メートル単位)。<br><br>このフィールドは、歩道 (`pathway_mode=1`)、改札口 (`pathway_mode=6`)、出口ゲート (`pathway_mode=7`) に推奨されます。|
| `traversal_time` | 正の整数 |任意| 出発地 ( `from_stop_id`で定義 ) から目的地 ( `to_stop_id`で定義 ) までの経路を歩くのに必要な平均時間 (秒単位)。<br><br>このフィールドは、動く歩道 (`pathway_mode=3`)、エスカレーター (`pathway_mode=4`)、エレベーター (`pathway_mode=5`) に推奨されます。|
| `stair_count` | null 以外の整数 |任意| 通路の階段の数。<br><br> `stair_count`が正の場合、乗客は`from_stop_id`から`to_stop_id`まで歩いて上がることを意味します。また、 `stair_count`が負の場合、乗客は`from_stop_id`から`to_stop_id`まで歩いて下がることを意味します。<br><br>このフィールドは階段 (`pathway_mode=2`) に推奨されます。<br><br>推定階段数しか提供できない場合は、1 フロアあたり 15 段と見積もることをお勧めします。|
| `max_slope` | Float |任意| 通路の最大傾斜率。有効なオプションは次のとおりです。<br><br> `0` または空 - 傾斜なし。<br> `Float` - 経路の傾斜比。上向きの場合は正、下向きの場合は負。<br><br>このフィールドは、歩道 (`pathway_mode=1`) および動く歩道 (`pathway_mode=3`) でのみ使用してください。<hr> _例: 米国では、手動車椅子の最大傾斜率は 0.083 (8.3% とも表記) で、1 メートルごとに 0.083 メートル (つまり 8.3 cm) 増加することを意味します。_|
| `min_width` | 正のfloat|任意| 通路の最小幅 (メートル単位)。<br><br>最小幅が 1 メートル未満の場合は、このフィールドが推奨されます。|
| `signposted_as` |Text|任意| 乗客に見える物理的な標識からの一般向けのテキスト。<br><br> `標識に従ってください`など、乗客にテキストに`singposted_as`指示を提供するために使用できます。`singposted_as` 内のテキストは、標識に印刷されているとおりに表示されます。<br><br>物理的な標識が多言語の場合、このフィールドは、`feed_info.feed_lang`のフィールド定義の`stops.stop_name`の例に従って入力および翻訳できます。|
| `reversed_signposted_as` |Text|任意| `signposted_as`と同じですが、経路が`to_stop_id`から`from_stop_id`に使用される場合です。|

### levels.txt 

ファイル: **条件付きで必須**

主キー(`level_id`)

駅の階を説明します。[pathways.txt](#pathwaystxt) と併用すると便利です。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|------|
| `level_id` |ユニーク ID | **必須** | 駅の階を識別します。|
| `level_index` | Float | **必須** | 相対的な位置を示すレベルの数値インデックス。<br><br>地上レベルのインデックスは `0` で、地上レベルは正のインデックスで示され、地下レベルは負のインデックスで示されます。|
| `level_name` |Text|任意| 建物または駅内の乗客から見たレベルの名前。<hr> _例: エレベーターで`中二階`または`プラットフォーム`または`-1`まで行きます。_|

### location_groups.txt 

ファイル: **任意**

主キー(`location_group_id`)

乗客が乗車または降車をリクエストできる停留所のグループである場所グループを定義します。

| フィールド名 | タイプ | 存在 | 説明 |
|----------|----|------------|-----------|
| `location_group_id` |ユニーク ID | **必須** | 場所グループを識別します。IDは、すべての`stops.stop_id`、 locations.geojson `id`、および`location_groups.location_group_id`値で一意である必要があります。<br><br>ロケーション グループとは、乗客が乗車または降車をリクエストできるロケーションを示す停留所のグループです。 | 
| `location_group_name` |Text|任意| 乗客に表示されるロケーション グループの名前。 |

### location_group_stops.txt 

ファイル: **任意**

主キー(`*`)

stops.txt のstops.txtをロケーション グループに割り当てます。

| フィールド名 | タイプ | 存在 | 説明 |
|----------|----|------------|-----------|
| `location_group_id` | ` `location_groups.location_group_id`部` ID | **必須** | 1 つまたは複数の`stop_id`ン` グループを識別します。同じ`stop_id` が複数の`location_group_id`で定義される場合があります。 | 
| `stop_id` | `stops.stop_id`部` ID | **必須** | 場所グループに属する停留所を識別します。 |


### locations.geojson 

ファイル: **任意**

乗客がオンデマンド サービスによる乗車または降車をリクエストできるゾーンを定義します。これらのゾーンは、GeoJSON ポリゴンとして表されます。

- このファイルは、[RFC 7946](https:)で説明されている GeoJSON 形式のサブセットを使用します。
- `locations.geojson`ファイルには、 `FeatureCollection`が含まれている必要があります。
- `FeatureCollection`は、乗客が乗車または降車をリクエストできるさまざまな停留所の場所を定義します。
- すべての GeoJSON `Feature`には`id` が必要です。 `id` は、すべての`stops.stop_id`、 locations.geojson `id`、および`location_group_id`値で一意である必要があります。
- すべての GeoJSON `Feature`には、次の表に従ってオブジェクトと関連キーが必要です:

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
|- `type` | 文字列 | **必須** | 場所の `"FeatureCollection"`。 |
|- `features` | 配列 | **必須** | 場所を説明する `"Feature"` オブジェクトのコレクション。 |
| \- `type` | 文字列 | **必須** | `"Feature"` |
| \- `id` | 文字列 | **必須** | 場所を識別します。 ID は、すべての`stops.stop_id`、 locations.geojson `id`、および`location_groups.location_group_id`値で一意である必要があります。 |
| \- `properties` | オブジェクト | **必須** | 場所のプロパティ キー。 |
| \- `stop_name` | 文字列 |任意| 乗客に表示される場所の名前を示します。 |
| \- `stop_desc` | 文字列 |任意| 乗客の方向を示すための場所のわかりやすい説明。 |
| \- `geometry` | オブジェクト | **必須** | 場所のジオメトリ。 |
| \- `type` | 文字列 | **必須** | 次のタイプであるしなければならない:<br> - `ポリゴン`<br> - `"MultiPolygon"` |
| \- `coordinates` | 配列 | **必須** | 場所のジオメトリを定義する地理座標 (緯度と経度)。 |

### booking_rules.txt 

ファイル: **任意**

主キー(`booking_rule_id`)

乗客が要求するサービスの予約ルールを定義します

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `booking_rule_id` |ユニーク ID | **必須** | ルールを識別します。 |
| `booking_type` | 列挙型 | **必須** | どのくらい前に予約できるかを示します。有効なオプションは次のとおりです。<br><br> `0` - リアルタイム予約。<br> `1` - 事前連絡で当日予約まで。<br> `2` - 最大で前日の予約まで。 |
| `prior_notice_duration_min` | 整数 | **条件付きで必須** | 旅行前にリクエストを行う最小時間 (分)。<br><br> **条件付きで必須**:<br> - ** ` booking_type =1` の場合は必須**。<br> - **それ以外の場合は禁止**。 |
| `prior_notice_duration_max` | 整数 | **条件付きで禁止** | 旅行前に予約リクエストを行う最大分数。<br><br> **条件付きで禁止**:<br> - `booking_type=0` および `booking_type =2` の場合は**禁止**です。<br> - ` booking_type =1` の場合は任意。|
| `prior_notice_last_day` | 整数 | **条件付きで必須** | 予約リクエストを行う旅行前の最終日。<br><br>例: `は` 1 日前の午後 5 時までに予約する必要があります`は、`prior_notice_last_day=1` としてエンコードされます。<br><br> **条件付きで必須**:<br> - ** ` booking_type =2` の場合は必須** です。<br> - それ以外の場合は**禁止**。 |
| `prior_notice_last_time` | 時間 | **条件付きで必須** | 旅行前最終日に予約リクエストを行う最終時間。<br><br>例: `は` 1 日前の午後 5 時までに予約する必要があります`は、`prior_notice_last_time=17:00:00` としてエンコードされます。<br><br> **条件付きで必須**:<br> - ** `prior_notice_last_day`が定義されている場合は必須。<br> - **それ以外の場合は禁止**。 |
| `prior_notice_start_day` | 整数 | **条件付きで禁止** | 予約リクエストを行う旅行前の最も早い日。<br><br>例: `で` 1 週間前の深夜に予約できます`は、`prior_notice_start_day=7` としてエンコードされます。<br><br> **条件付きで禁止**:<br> - `booking_type =0` の場合は**禁止**です。<br> - `prior_notice_duration_max`が定義されている場合、` booking_type =1` では**禁止** です。<br> - それ以外の場合は任意。 |
| `prior_notice_start_time` | 時間 | **条件付きで必須** | 予約リクエストを行う旅行の最も早い日の最初の時間。<br><br>例: `で` 1 週間前の深夜に予約できます`は、`prior_notice_start_time=00​​:00:00` としてエンコードされます。<br><br> **条件付きで必須**:<br> - ** `prior_notice_start_day`が定義されている場合は必須。<br> - それ以外の場合は**禁止**。 |
| `prior_notice_service_id` | `calendar.service_id`部` ID | **条件付きで禁止** | `prior_notice_last_day`または`prior_notice_start_day`がカウントされるサービス日を示します。<br><br>例: 空の場合、`prior_notice_start_day=2` は 2 暦日前になります。営業日 (休日のない平日) のみを含む`service_id`として定義されている場合、`prior_notice_start_day=2` は 2 営業日前になります。<br><br> **条件付きで禁止**:<br> - ` booking_type =2` の場合は任意。<br> - それ以外の場合は**禁止**。 |
| `message` |Text|任意| オンデマンドのピックアップとドロップオフを予約するときに、 `stop_time`でサービスを利用する乗客へのメッセージ。ユーザーインターフェイス内で送信される、サービスを利用するために乗客が実行する必要があるアクションに関する最小限の情報を提供することを目的としています。 |
| `pickup_message` |Text|任意| `message`と同じように機能しますが、乗客がオンデマンドのピックアップのみを利用する場合に使用されます。 |
| `drop_off_message` |Text|任意| `message`と同じように機能しますが、乗客がオンデマンドのドロップオフのみを利用する場合に使用されます。 |
| `phone_number` | 電話番号 |任意| 予約リクエストを行うために電話する電話番号。 |
| `info_url` | URL |任意| 予約ルールに関する情報を提供する URL。 |
| `booking_url` | URL |任意| 予約リクエストを行うことができるオンラインインターフェイスまたはアプリへの URL。 |

### translations.txt 

ファイル: **任意**

主キー(`table_name`、 `field_name`、 `language`、 `record_id`、 `record_sub_id`、 `field_value`)

複数の公用語がある地域では、交通機関/運営者は通常、言語固有の名前とウェブページを持っています。それらの地域の乗客に最適なサービスを提供するために、データセットにこれらの言語に依存する値を含めることは有用です。

2 つの異なる行で同じ値を翻訳するために (`record_id`、 `record_sub_id`) と`field_value`の両方の参照方法が使用されている場合、 (`record_id`、 `record_sub_id`) で提供される翻訳が優先されます。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `table_name` | Enum | **必須** | 翻訳するフィールドを含むテーブルを定義します。許可される値は次のとおりです:<br><br> - `agency`<br> - `stops`<br> - `routes`<br> - `trips`<br> - `stop_times`<br> - `pathways`<br> - `levels`<br> - `feed_info`<br> - `attributions`<br><br> GTFS に追加されたファイルには、上記のファイル名と同等の`table_name`値が含まれます (つまり、`.txt` ファイル拡張子は含まれません)。 |
| `field_name` |Text| **必須** | 翻訳するフィールドの名前。`Text` タイプのフィールドは翻訳できます`URL`、 `Email` 、 `e` number`タイプのフィールドも、正しい言語でリソースを提供するために`翻訳`できます。その他のタイプのフィールドは翻訳しないでください。 |
| `language` | 言語コード | **必須** | 翻訳の言語。<br><br>言語が`feed_info.feed_lang`と同じ場合、フィールドの元の値は、特定の翻訳のない言語で使用するデフォルト値であると見なされます ( `default_lang` で別途指定されていない場合)。<hr> _例: スイスでは、公式にバイリンガルの州にある都市は正式には`ビール/ビエンヌ`と呼ばれますが、フランス語では単に`ビエンヌ`、ドイツ語では`ビール`と呼ばれます。_ |
| `translation` |Text、URL、メール、電話番号 | **必須** | 翻訳された値。 |
| `record_id` |外部 ID | **条件付きで必須** | 翻訳するフィールドに`record_id`するレコードを定義します。`record_id` の値は、各テーブルの主キー属性で定義されているように、テーブルの主キーの最初のフィールドまたは唯一のフィールドである必要があります。<br><br> - [agency.txt] の`agency_id` (#agencytxt )<br> - [stops.txt](#stopstxt) の`stop_id`<br> - [routes.txt](#routestxt) の`route_id` ;<br> - [trips.txt](#tripstxt) の`trip_id`<br> - [stop_times.txt](#stop_timestxt) の`trip_id` ;<br> - [pathways.txt](#pathwaystxt) の`pathway_id` ;<br> - [levels.txt](#levelstxt) の`level_id` ;<br> - [attributions.txt](#attributionstxt ) の`attribution_id` 。<br><br>上記で定義されていないテーブル内のフィールドは翻訳しないでください。ただし、プロデューサーが公式仕様外のフィールドを追加する場合があり、これらの非公式フィールドは翻訳される可能性があります。以下は、これらのテーブルで`record_id`を使用するための推奨方法です。<br><br> - [calendar.txt](#calendartxt) の`service_id` ;<br> - [calendar_dates.txt](#calendar_datestxt) の`service_id` ;<br> - [fare_attributes.txt](#fare_attributestxt) の`fare_id` ;<br> - [fare_rules.txt](#fare_rulestxt) の`fare_id` ;<br> - [shapes.txt](#shapestxt) の`shape_id` ;<br> - [frequencies.txt](#frequenciestxt ) の`trip_id` ;<br> - [transfers.txt](#transferstxt) の`from_stop_id` 。<br><br>条件付きで必須:<br> - `table_name`が`feed_info`の場合は**禁止**です。<br> - `field_value`が定義されている場合は**禁止**です。<br> - **必須** `field_value`が空の場合。 |
| `record_sub_id` |外部 ID | **条件付きで必須** | テーブルに一意のIDがない場合に、フィールドを含むレコードを翻訳するのに役立ちます。したがって、 `record_sub_id`の値は、次の表で定義されているように、テーブルのセカンダリIDです。<br><br> - [agency.txt](#agencytxt) にはなし。<br> - [stops.txt](#stopstxt) にはなし<br>- [routes.txt](#routestxt) にはなし。<br> - [trips.txt](#tripstxt) にはありません。<br> - [stop_times.txt](#stop_timestxt) の`stop_sequence` ;<br> - [pathways.txt](#pathwaystxt) にはなし。<br> - [levels.txt](#levelstxt) にはなし<br>- [attributions.txt](#attributionstxt) にはありません。<br><br>上記で定義されていないテーブル内のフィールドは翻訳しないでください。ただし、プロデューサーが公式仕様外のフィールドを追加する場合があり、これらの非公式フィールドは翻訳される可能性があります。以下は、これらのテーブルで`record_sub_id`を使用するための推奨方法です。<br><br> - [calendar.txt](#calendartxt) にはなし<br>- [calendar_dates.txt](#calendar_datestxt) の ` date `<br> - [fare_attributes.txt](#fare_attributestxt) にはなし<br>- [fare_rules.txt](#fare_rulestxt) の`route_id` ;<br> - [shapes.txt](#shapestxt) にはなし<br>- [frequencies.txt](#frequenciestxt ) の`start_time` ;<br> - [transfers.txt](#transferstxt) の`to_stop_id` 。<br><br>条件付きで必須:<br> - `table_name`が`feed_info`の場合は**禁止**です。<br> - `field_value`が定義されている場合は**禁止**です。<br> - **必須** `table_name=stop_times` の場合、

 `record_id`が定義されています。 |
| `field_value` |Text、URL、メール、電話番号 | **条件付きで必須** | `record_id`と`record_sub_id`を使用してどのレコードを翻訳するかを定義する代わりに、このフィールドを使用して翻訳する値を定義できます。これを使用すると、 `table_name`と`field_name`で識別されるフィールドに、field_value で定義された値とまったく同じ値が含まれている場合に翻訳が適用されます。<br><br>フィールドには、 `field_value`で定義された値と **正確に** 一致している必要があります。値のサブセットのみが`field_value`と一致する場合、翻訳は適用されません。<br><br> 2 つの翻訳ルールが同じレコードに一致する場合 (1 つは`field_value`、もう 1 つは`record_id`)、 `record_id`のルールが優先されます。<br><br>条件付きで必須:<br> - `table_name`が`feed_info`の場合は**禁止**です。<br> - `record_id`が定義されている場合は**禁止**です。<br> - **必須** `record_id`が空の場合。 |

### feed_info.txt 

ファイル: **条件付きで必須**

Primary key (none) 

ファイルには、データセットが記述するサービスではなく、データセット自体に関する情報が含まれます。場合によっては、データセットの発行者が機関とは異なるエンティティであることがあります。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `feed_publisher_name` |Text| **必須** | データセットを公開する組織のフルネーム。これは、 `agency.agency_name`値のいずれかと同じである可能性があります。 |
| `feed_publisher_url` | URL | **必須** | データセットを公開する組織の Web サイトの URL。これは、 `agency.agency_url`値のいずれかと同じである可能性があります。 |
| `feed_lang` |言語コード | **必須** | このデータセットのテキストに使用されるデフォルトの言語。この設定は、GTFS のユーザーがデータセットの大文字化ルールやその他の言語固有の設定を選択するのに役立ちます。テキストをデフォルト以外の言語に翻訳する必要がある場合は、ファイル`translations.txt`を使用できます。<br><br>元のテキストが複数の言語であるデータセットの場合、デフォルトの言語は多言語になることがあります。このような場合、 `feed_lang`に` ISO 639-2 規格で定義されている言語コード`mul`を含め、データセットで使用されている各言語の翻訳を`translations.txt`で提供する必要があります。データセット内の元のテキストがすべて同じ言語である場合は、 `mul` を使用しないでください。<hr>例: スイスのような多言語国家のデータセットを考えてみましょう。元の`stops.stop_name`フィールドに、さまざまな言語の停留所名が入力されています。各停留所名は、その停留所の地理的位置で主流の言語に従って記述されます。たとえば、フランス語圏の都市ジュネーブの場合は`Genève` 、ドイツ語圏の都市チューリッヒの場合は`Zürich` 、バイリンガルの都市ビール/`Biel/Bienne`です。データセットの`feed_lang` は`mul`である必要があり、翻訳は`translations.txt`で提供されます。ドイツ語の場合: `Genf`、 `Zürich` 、 `Biel`。フランス語の場合: `Genève`、 `Zurich` 、 `Bienne`。イタリア語の場合: `Ginevra`、 `Zurigo` 、 `Bienna`。英語では、 ``Geneva``、 ``Zurich`` 、 ``Biel/Bienne`。_ |
| `default_lang` | 言語コード |任意| データ利用者が乗客の言語を知らない場合に使用する言語を定義します。多くの場合、 `en` (英語) になります。 |
| `feed_start_date` | 日付 |推奨| データセットは、 `feed_start_date`日の開始から`feed_end_date`日の終了までの期間のサービスの完全で信頼性の高いスケジュール情報を提供します。両方の日付が利用できない場合は空白のままにすることができます。両方が指定されている場合、 `feed_end_date`dateは`feed_start_date`dateより前にしてはなりません。データセットプロバイダーは、今後のサービスの可能性を通知するためにこの期間外のスケジュールデータを提供することが推奨されますが、データセット利用者はそれが正式なものではないことに留意して扱う必要があります。 `feed_start_date`または`feed_end_date` が[calendar.txt](#calendartxt) および [calendar_dates.txt](#calendar_datestxt) で定義されている有効なカレンダーの日付を超える場合、データセットは、 `feed_start_date`または`feed_end_date`の範囲内で、有効なカレンダーの日付に含まれない日付にはサービスがないことを明示的に主張しています。 |
| `feed_end_date` | 日付 |推奨| (上記を参照) |
| `feed_version` |Text|推奨| GTFS データセットの現在のバージョンを示す文字列。GTFS を使用するアプリケーションはこの値を表示して、データセットの公開者が最新のデータセットが組み込まれているかどうかを判断できるようにします。 |
| `feed_contact_email` | メール |任意| GTFS データセットとデータ公開方法に関する連絡用のメール アドレス。`feed_contact_email`は、GTFS を使用するアプリケーションの技術担当者の連絡先です。 [agency.txt](#agencytxt ) を通じてカスタマー サービスの連絡先情報を提供します。`feed_contact_email` または`feed_contact_url`も` 1 つを指定することをお勧めします。 |
| `feed_contact_url` | URL |任意| GTFS データセットとデータ公開方法に関する連絡用の連絡先情報、ウェブフォーム、サポート デスク、またはその他のツールの URL。`feed_contact_url`は、GTFS を利用するアプリケーションの`feed_contact_url`担当者の連絡先です。 [agency.txt](#agencytxt ) を通じてカスタマー サービスの連絡先情報を提供します。`feed_contact_url` または`feed_contact_email`も` 1 つを指定することをお勧めします。 |

### attributions.txt 

ファイル: **任意**

主キー(`attribution_id`)

このファイルは、データセットに適用される属性を定義します。

| フィールド名 | タイプ | 存在 | 説明 |
|------|------|------|------|
| `attribution_id` |ユニーク ID |任意| データセットまたはそのサブセットの帰属を識別します。これは主に翻訳に役立ちます。 |
| `agency_id` | `agency.agency_id`部` ID |任意| 帰属が適用される事業者。<br><br> `agency_id`、 `route_id`、または`trip_id`属性のいずれかが定義されている場合、その他は空にする必要があります。いずれも指定されていない場合、属性はデータセット全体に適用されます。 |
| ` `route_id` | `routes.route_id`部` ID |任意| 属性がルートに適用されることを除いて、 `agency_id`と同じように機能します。同じルートに複数の属性を適用できます。 |
| ` `trip_id` | `trips.trip_id`部` ID |任意| 属性が旅行に適用されることを除いて、 `agency_id`と同じように機能します。同じ旅行に複数の属性を適用できます。 |
| `organization_name` |Text| **必須** | データセットの帰属先となる組織の名前。 |
| `is_producer` | 列挙型 |任意| 組織の役割はプロデューサーです。有効なオプションは次のとおりです。<br><br> `0` または空 - 組織にはこの役割がありません。<br> `1` - 組織にはこの役割があります。<br><br> `is_producer`、 `is_operator`、または`is_authority`も` 1 つを`1`に設定する必要があります。 |
| `is_operator` | 列挙型 |任意| 組織の役割がオペレータであることを除いて、 `is_producer`と同じように機能します。 |
| `is_authority` | 列挙型 |任意| 組織の役割が権限であることを除いて、 `is_producer`と同じように機能します。 |
| `attribution_url` | URL |任意| 組織の URL。 |
| `attribution_email` | 電子メール |任意| 組織の電子メール。 |
| `attribution_phone` | 電話番号 |任意| 組織の電話番号。 |
