## General Transit Feed Specification Reference {: #general-transit-feed-specification-reference}


**2025年7月9日改訂。詳細は [Revision History](../change-history/revision-history) を参照してください。**

この文書は、GTFS データセットを構成するファイルの形式と構造を定義します。

## 目次 {: #table-of-contents}


1.  [文書の規約](#document-conventions)  
2.  [データセットファイル](#dataset-files)  
3.  [ファイル要件](#file-requirements)  
4.  [データセットの公開と一般的な運用](#dataset-publishing-general-practices)  
5.  [フィールド定義](#field-definitions)  
    -   [agency.txt](#agencytxt)  
    -   [stops.txt](#stopstxt)  
    -   [routes.txt](#routestxt)  
    -   [trips.txt](#tripstxt)  
    -   [stop_times.txt](#stop_timestxt)  
    -   [calendar.txt](#calendartxt)  
    -   [calendar_dates.txt](#calendar_datestxt)  
    -   [fare_attributes.txt](#fare_attributestxt)  
    -   [fare_rules.txt](#fare_rulestxt)  
    -   [timeframes.txt](#timeframestxt)  
    -   [rider\_categories.txt](#rider_categoriestxt)  
    -   [fare_media.txt](#fare_mediatxt)  
    -   [fare_products.txt](#fare_productstxt)  
    -   [fare_leg_rules.txt](#fare_leg_rulestxt)  
    -   [fare_leg_join_rules.txt](#fare_leg_join_rulestxt)  
    -   [fare_transfer_rules.txt](#fare_transfer_rulestxt)  
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
    -   [feed_info.txt](#feed_infotxt)  
    -   [attributions.txt](#attributionstxt)  

## 文書の規約 {: #document-conventions}

この文書における "MUST"、"MUST NOT"、"REQUIRED"、"SHALL"、"SHALL NOT"、"SHOULD"、"SHOULD NOT"、"RECOMMENDED"、"MAY"、"OPTIONAL" というキーワードは、[RFC 2119](https://tools.ietf.org/html/rfc2119) に記載されている通りに解釈されるものとします。

### 用語の定義 {: #term-definitions}

このセクションでは、本ドキュメント全体で使用される用語を定義します。

* **Dataset** - 本仕様で定義されるファイルの完全なセットです。データセットを変更すると、新しいバージョンのデータセットが作成されます。データセットは、zipファイル名を含む公開かつ永続的なURLで公開するべきです。（例: https://www.agency.org/gtfs/gtfs.zip）。
* **Record** - 単一のエンティティ（例: 交通事業者、停留所等(stop)、ルート・路線系統(route) など）を記述する複数のフィールド値から構成される基本的なデータ構造です。テーブルでは行として表されます。
* **Field** - オブジェクトまたはエンティティの属性です。テーブルでは列として表されます。ファイルにヘッダーとして追加されるとフィールドが存在します。フィールド値が定義されている場合もあれば、されていない場合もあります。
* **Field value** - フィールド内の個別のエントリです。テーブルでは単一のセルとして表されます。
* **Service day** - 運行日(service day)は、ルートの運行スケジュールを示すために使用される時間区分です。運行日の正確な定義は事業者ごとに異なりますが、運行日はしばしば暦日とは一致しません。運行日は、運行がある日から翌日にまたがる場合、24:00:00を超えることがあります。例えば、金曜日の08:00:00から土曜日の02:00:00まで運行する場合、単一の運行日として08:00:00から26:00:00までと表すことができます。
* **Text-to-speech field** - このフィールドには、親フィールド（空の場合に参照される）と同じ情報を含めるべきです。音声読み上げ用に設計されているため、省略形は削除するか（例: "St" は "Street" または "Saint" と読むべき、"Elizabeth I" は "Elizabeth the first" とするべき）、そのまま略語として読まれるように保持するべきです（例: "JFK Airport" は略語のまま読み上げられます）。
* **Leg** - 乗客が便(trip)の途中で一対の連続する地点間で乗車し、降車する移動区間です。
* **Journey** - 出発地から目的地までの全体の移動で、すべての乗車区間(leg)と乗り換えを含みます。
* **Sub-journey** - 旅程(journey)の部分を構成する2つ以上の乗車区間(leg)です。
* **Fare product** - 旅行の支払いまたは認証に使用できる購入可能なチケット商品です。
* **Effective Fare Leg** - 運賃計算の目的で、[fare_leg_rules.txt](#fare_leg_rulestxt) におけるマッチングルールにおいて単一の乗車区間(leg)として扱うべき、2つ以上の乗車区間(leg)からなる部分旅程(sub-journey)です。

### 存在条件 {: #presence}

フィールドおよびファイルに適用される存在条件:

* **必須 (Required)** - フィールドまたはファイルはデータセットに含めなければならず、各レコードに対して有効な値を持たなければなりません。
* **任意 (Optional)** - フィールドまたはファイルはデータセットから省略することができます。
* **条件付き必須 (Conditionally Required)** - フィールドまたはファイルは、フィールドまたはファイルの説明に記載された条件下で含めなければなりません。
* **条件付き禁止 (Conditionally Forbidden)** - フィールドまたはファイルは、フィールドまたはファイルの説明に記載された条件下で含めてはいけません。
* **推奨 (Recommended)** - フィールドまたはファイルはデータセットから省略することができますが、含めることがベストプラクティスです。このフィールドまたはファイルを省略する前に、そのベストプラクティスを慎重に評価し、省略による影響を十分に理解する必要があります。

### フィールド型 {: #field-types}


- **Color** - 6桁の16進数でエンコードされた色です。有効な値を生成するには [https://htmlcolorcodes.com](https://htmlcolorcodes.com) を参照してください（先頭の "#" は含めてはいけません）。<br> *例: 白は `FFFFFF`、黒は `000000`、NYMTA の A,C,E 線は `0039A6`。*
- **Currency code** - ISO 4217 のアルファベット通貨コードです。現在の通貨コード一覧は [https://en.wikipedia.org/wiki/ISO_4217#Active\_codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) を参照してください。<br> *例: カナダドルは `CAD`、ユーロは `EUR`、日本円は `JPY`。*
- **Currency amount** - 通貨額を示す10進数値です。小数点以下の桁数は、対応する Currency code に対して [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) で規定されています。すべての金額計算は、使用するプログラミング言語に応じて、decimal、currency、または金融計算に適した同等の型で処理するべきです。float での通貨額の処理は、計算中に金額の増減が発生するため推奨されません。
- **Date** - YYYYMMDD 形式の運行日(service day)です。運行日内の時刻は 24:00:00 を超える場合があるため、運行日には翌日以降の情報が含まれることがあります。<br> *例: `20180913` は 2018年9月13日。*
- **Email** - 電子メールアドレスです。<br> *例: `example@example.com`*
- **Enum** - 「Description」列で定義された定数の集合から選択するオプションです。<br> *例: `route_type` フィールドは、トラムの場合は `0`、地下鉄の場合は `1` を含みます...*
- **ID** - ID フィールド値は内部 ID であり、乗客に表示することを意図したものではなく、任意の UTF-8 文字の並びです。印字可能な ASCII 文字のみを使用することが推奨されます。ID が「unique ID」とラベル付けされている場合、そのファイル内で一意でなければなりません。1つの .txt ファイルで定義された ID は、別の .txt ファイルで参照されることがよくあります。他のテーブルの ID を参照する ID は「foreign ID」とラベル付けされます。<br> *例: [stops.txt](#stopstxt) の `stop_id` フィールドは「unique ID」です。[stops.txt](#stopstxt) の `parent_station` フィールドは「foreign ID referencing `stops.stop_id`」です。*
- **Language code** - IETF BCP 47 言語コードです。IETF BCP 47 の概要については [http://www.rfc-editor.org/rfc/bcp/bcp47.txt](http://www.rfc-editor.org/rfc/bcp/bcp47.txt) および [http://www.w3.org/International/articles/language-tags/](http://www.w3.org/International/articles/language-tags/) を参照してください。<br> *例: 英語は `en`、アメリカ英語は `en-US`、ドイツ語は `de`。*
- **Latitude** - WGS84 の緯度を10進数で表したものです。値は -90.0 以上 90.0 以下でなければなりません。<br> *例: ローマのコロッセオは `41.890169`。*
- **Longitude** - WGS84 の経度を10進数で表したものです。値は -180.0 以上 180.0 以下でなければなりません。<br> *例: ローマのコロッセオは `12.492269`。*
- **Float** - 浮動小数点数です。
- **Integer** - 整数です。
- **Phone number** - 電話番号です。
- **Time** - HH:MM:SS 形式の時刻です（H:MM:SS も許容されます）。時刻は運行日(service day)の「正午 - 12時間」（実質的には深夜。ただし夏時間の切り替えがある日は例外）から計測されます。運行日深夜以降の時刻は、HH:MM:SS で 24:00:00 を超える値として入力します。<br> *例: `14:30:00` は午後2時30分、`25:35:00` は翌日午前1時35分。*
- **Text** - UTF-8 文字列で、人間が読めるように表示されることを目的としています。
- **Timezone** - [https://www.iana.org/time-zones](https://www.iana.org/time-zones) に基づく TZ タイムゾーンです。タイムゾーン名にはスペースは含まれず、アンダースコアを含むことがあります。有効な値の一覧は [http://en.wikipedia.org/wiki/List\_of\_tz\_zones](http://en.wikipedia.org/wiki/List_of_tz_zones) を参照してください。<br> *例: `Asia/Tokyo`、`America/Los_Angeles`、`Africa/Cairo`。*
- **URL** - http:// または https:// を含む完全修飾 URL です。URL 内の特殊文字は正しくエスケープされていなければなりません。完全修飾 URL 値の作成方法については [http://www.w3.org/Addressing/URL/4\_URI\_Recommentations.html](http://www.w3.org/Addressing/URL/4_URI_Recommentations.html) を参照してください。

### フィールドの符号 {: #field-signs}

Float または Integer 型のフィールドに適用される符号:

* **Non-negative（非負）** - 0 以上。
* **Non-zero（非ゼロ）** - 0 ではない。
* **Positive（正）** - 0 より大きい。

_例: **Non-negative float（非負の浮動小数点数）** - 0 以上の浮動小数点数。_

### データセットの属性 {: #dataset-attributes}

**主キー(primary key)** とは、行を一意に識別するフィールド、またはフィールドの組み合わせのことです。ファイル内のすべての提供されたフィールドを使用して行を一意に識別する場合は `Primary key (*)` が使用されます。`Primary key (none)` は、そのファイルが1行のみを許可することを意味します。

_例: `trip_id` フィールドと `stop_sequence` フィールドは、[stop_times.txt](#stop_timestxt) の主キーを構成します。_

## データセットファイル {: #dataset-files}


この仕様では、以下のファイルを定義しています:

|  ファイル名 | 出現条件 | 説明 |
|  ------ | ------ | ------ |
|  [agency.txt](#agencytxt) | **必須** | このデータセットに含まれる運行サービスを提供する事業者。 |
| [stops.txt](#stopstxt) | **条件付き必須** | 車両が乗客を乗降させる停留所等(stop)。また、駅や駅の入口も定義します。<br><br>条件付き必須:<br> - [locations.geojson](#locationsgeojson) にデマンド型サービスのゾーンが定義されている場合は任意。<br>- それ以外の場合は **必須**。 |
|  [routes.txt](#routestxt) | **必須** | 交通機関のルート・路線系統(route)。ルートは、乗客に単一のサービスとして表示される便(trip)のグループです。 |
|  [trips.txt](#tripstxt)  | **必須** | 各ルートの便(trip)。便は、特定の時間帯に運行される2つ以上の停留所等(stop)の並びです。 |
|  [stop_times.txt](#stop_timestxt) | **必須** | 各便(trip)における車両の停留所等(stop)到着時刻および出発時刻。 |
|  [calendar.txt](#calendartxt)  | **条件付き必須** | 運行日(service day)を開始日と終了日を持つ週間スケジュールで指定します。<br><br>条件付き必須:<br> - すべての運行日(service day)が [calendar_dates.txt](#calendar_datestxt) に定義されていない限り **必須**。<br> - それ以外の場合は任意。 |
|  [calendar_dates.txt](#calendar_datestxt)  | **条件付き必須** | [calendar.txt](#calendartxt) で定義された運行日の例外。<br><br>条件付き必須:<br> - [calendar.txt](#calendartxt) が省略される場合は **必須**。その場合、[calendar_dates.txt](#calendar_datestxt) にはすべての運行日(service day)を含めなければなりません。<br> - それ以外の場合は任意。 |
|  [fare_attributes.txt](#fare_attributestxt)  | 任意 | 事業者のルートに関する運賃情報。 |
|  [fare_rules.txt](#fare_rulestxt)  | 任意 | 旅程に運賃を適用するためのルール。 |
|  [timeframes.txt](#timeframestxt)  | 任意 | 日付や時間に依存する運賃ルールで使用する日付・時間帯。 |
| [rider_categories.txt](#rider_categoriestxt) | 任意 | 乗客のカテゴリ（例: 高齢者、学生）を定義。 |
|  [fare_media.txt](#fare_mediatxt)  | 任意 | チケット商品を利用するために使用できるチケットメディアを記述します。<br><br>[fare_media.txt](#fare_mediatxt) は、[fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) では表現されない概念を記述します。そのため、[fare_media.txt](#fare_mediatxt) の利用は [fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) とは完全に独立しています。 |
|  [fare_products.txt](#fare_productstxt)  | 任意 | 乗客が購入できるさまざまな種類のチケット商品や運賃を記述します。<br><br>[fare_products.txt](#fare_productstxt) は、[fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) では表現されないチケット商品を記述します。そのため、[fare_products.txt](#fare_productstxt) の利用は [fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) とは完全に独立しています。 |
|  [fare_leg_rules.txt](#fare_leg_rulestxt)  | 任意 | 個々の乗車区間(leg)に対する運賃ルール。<br><br>[fare_leg_rules.txt](#fare_leg_rulestxt) は、運賃体系をより詳細にモデル化する方法を提供します。そのため、[fare_leg_rules.txt](#fare_leg_rulestxt) の利用は [fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) とは完全に独立しています。 |
|  [fare_leg_join_rules.txt](#fare_leg_join_rulestxt)  | 任意 | 2つ以上の乗車区間(leg)を、[fare_leg_rules.txt](#fare_leg_rulestxt) のルールに照らして1つの**有効運賃区間(effective fare leg)** として扱うためのルール。 |
|  [fare_transfer_rules.txt](#fare_transfer_rulestxt)  | 任意 | 乗車区間(leg)間の乗り換えに関する運賃ルール。<br><br>[fare_leg_rules.txt](#fare_leg_rulestxt) とともに、[fare_transfer_rules.txt](#fare_transfer_rulestxt) は運賃体系をより詳細にモデル化する方法を提供します。そのため、[fare_transfer_rules.txt](#fare_transfer_rulestxt) の利用は [fare_attributes.txt](#fare_attributestxt) および [fare_rules.txt](#fare_rulestxt) とは完全に独立しています。 |
|  [areas.txt](#areastxt) | 任意 | ロケーションのエリアグループ。 |
|  [stop_areas.txt](#stop_areastxt) | 任意 | 停留所等(stop)をエリアに割り当てるルール。 |
|  [networks.txt](#networkstxt) | **条件付き禁止** | ルートのネットワークグループ。<br><br>条件付き禁止:<br>- [routes.txt](#routestxt) に `network_id` が存在する場合は **禁止**。<br>- それ以外の場合は任意。 |
|  [route_networks.txt](#route_networkstxt) | **条件付き禁止** | ルートをネットワークに割り当てるルール。<br><br>条件付き禁止:<br>- [routes.txt](#routestxt) に `network_id` が存在する場合は **禁止**。<br>- それ以外の場合は任意。 |
|  [shapes.txt](#shapestxt)  | 任意 | 車両の走行経路をマッピングするルール。ルートの線形とも呼ばれます。 |
|  [frequencies.txt](#frequenciestxt)  | 任意 | 頻度ベースのサービスにおける便間隔（ヘッドウェイ）、または固定スケジュールサービスの圧縮表現。 |
|  [transfers.txt](#transferstxt)  | 任意 | ルート間の乗り換え地点での接続ルール。 |
|  [pathways.txt](#pathwaystxt)  | 任意 | 駅構内のロケーションを結ぶ構内通路(pathway)。 |
|  [levels.txt](#levelstxt)  | **条件付き必須** | 駅構内の階層。<br><br>条件付き必須:<br>- エレベーター (`pathway_mode=5`) を含む構内通路(pathway)を記述する場合は **必須**。<br>- それ以外の場合は任意。 |
|  [location_groups.txt](#location_groupstxt)  | 任意 | 乗客が乗降をリクエストできる停留所等(stop)のグループ。 |
|  [location_group_stops.txt](#location_group_stopstxt)  | 任意 | 停留所等(stop)をロケーショングループに割り当てるルール。 |
|  [locations.geojson](#locationsgeojson)  | 任意 | デマンド型サービスによる乗降リクエストのゾーンを GeoJSON ポリゴンで表現。 |
|  [booking_rules.txt](#booking_rulestxt)  | 任意 | 乗客リクエスト型サービスの予約情報。 |
|  [translations.txt](#translationstxt)  | 任意 | 利用者向けデータセット値の翻訳。 |
| [feed_info.txt](#feed_infotxt) | **条件付き必須** | データセットのメタデータ（発行者、バージョン、有効期限など）。<br><br>条件付き必須:<br>- [translations.txt](#translationstxt) が提供される場合は **必須**。<br>- それ以外の場合は推奨。|
|  [attributions.txt](#attributionstxt)  | 任意 | データセットの帰属情報。 |

## ファイル要件 {: #file-requirements}

以下の要件は、データセットファイルの形式および内容に適用されます:

* すべてのファイルはカンマ区切りテキストとして保存しなければなりません。
* 各ファイルの最初の行にはフィールド名を含めなければなりません。[Field Definitions](#field-definitions) セクションの各小節は、GTFS データセット内の 1つのファイルに対応しており、そのファイルで使用できるフィールド名を列挙しています。
* すべてのファイル名およびフィールド名は大文字小文字を区別します。
* フィールド値にタブ、キャリッジリターン、改行を含めてはいけません。
* フィールド値に引用符またはカンマが含まれる場合は、引用符で囲まなければなりません。さらに、フィールド値内の各引用符は引用符でエスケープしなければなりません。これは Microsoft Excel がカンマ区切り (CSV) ファイルを出力する方法と一致しています。CSV ファイル形式の詳細については [http://tools.ietf.org/html/rfc4180](http://tools.ietf.org/html/rfc4180) を参照してください。  
次の例は、カンマ区切りファイル内でフィールド値がどのように表現されるかを示しています:
  * **元のフィールド値:** `Contains "quotes", commas and text`
  * **CSV ファイル内のフィールド値:** `"Contains ""quotes"", commas and text"`
* フィールド値に HTML タグ、コメント、エスケープシーケンスを含めてはいけません。
* フィールドやフィールド名の間に余分なスペースがあれば削除するべきです。多くのパーサーはスペースを値の一部と見なすため、エラーの原因となる可能性があります。
* 各行は CRLF または LF の改行文字で終わらなければなりません。
* すべてのファイルは UTF-8 でエンコードするべきです。これによりすべての Unicode 文字をサポートできます。Unicode バイトオーダーマーク (BOM) 文字を含むファイルも許容されます。BOM 文字と UTF-8 の詳細については [http://unicode.org/faq/utf_bom.html#BOM](http://unicode.org/faq/utf_bom.html#BOM) を参照してください。
* すべてのデータセットファイルは zip 形式でまとめなければなりません。ファイルはサブフォルダではなく、ルートレベルに直接配置しなければなりません。
* すべての利用者向けテキスト文字列（停留所名、路線名、行先表示など）は、すべて大文字ではなく混在大文字小文字 (Mixed Case) を使用するべきです。これは小文字を表示できるディスプレイにおける地名の大文字小文字のローカル規則に従うものです（例: “Brighton Churchill Square”, “Villiers-sur-Marne”, “Market Street”）。
* 略語の使用は、フィード全体で名前やその他のテキストにおいて避けるべきです（例: Street を St. と省略するなど）。ただし、場所が略称で呼ばれている場合（例: “JFK Airport”）は例外です。略語はスクリーンリーダーソフトウェアや音声ユーザーインターフェースにおけるアクセシビリティの問題となる可能性があります。利用側のソフトウェアは完全な単語を略語に変換することは信頼性高く実装できますが、略語から完全な単語に変換することは誤りのリスクが高くなります。

## データセット公開と一般的な運用慣行 {: #dataset-publishing-general-practices}


* データセットは、zipファイル名を含む公開かつ恒久的なURLで公開するべきです。（例: www.agency.org/gtfs/gtfs.zip）。理想的には、ファイルにアクセスするためにログインを必要とせず、直接ダウンロード可能なURLとすることで、利用するソフトウェアアプリケーションによるダウンロードを容易にするべきです。GTFSデータセットをオープンにダウンロード可能とすることが推奨され（また最も一般的な慣行です）、データ提供者がライセンスやその他の理由でGTFSへのアクセスを制御する必要がある場合は、自動ダウンロードを容易にするためにAPIキーを用いてGTFSデータセットへのアクセスを制御することが推奨されます。
* GTFSデータは反復的に公開され、安定した場所にある単一のファイルが常に事業者（または複数の事業者）の最新の公式運行情報を含むようにするべきです。
* データセットは、可能な限りデータの反復を通じて `stop_id`、`route_id`、`agency_id` の永続的な識別子(idフィールド)を維持するべきです。
* 1つのGTFSデータセットには、現在および今後の運行情報（「マージされた」データセットと呼ばれることもあります）を含めるべきです。2つの異なるGTFSフィードからマージされたデータセットを作成するために使用できる[マージツール](../../../resources/gtfs/#gtfs-merge-tools)が複数存在します。
    * 公開されるGTFSデータセットは、常に少なくとも今後7日間は有効であるべきであり、理想的には事業者がその運行スケジュールが継続されると確信できる限り有効であるべきです。
    * 可能であれば、GTFSデータセットは少なくとも今後30日間の運行をカバーするべきです。
 * 古い運行情報（期限切れのカレンダー）はフィードから削除するべきです。
 * 7日以内に運行変更が発効する場合、この運行変更は静的なGTFSデータセットではなく、GTFS-realtimeフィード（運行情報や便の更新）を通じて表現するべきです。
 * GTFSデータをホスティングするWebサーバーは、ファイルの更新日を正しく報告するように設定しなければなりません（[HTTP/1.1 - Request for Comments 2616, セクション14.29](https://tools.ietf.org/html/rfc2616#section-14.29) を参照）。

## フィールド定義 {: #field-definitions}

### agency.txt {: #agencytxt}


ファイル: **必須**

主キー (`agency_id`)

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `agency_id` | 一意のID | **条件付き必須** | 交通事業者ブランドを識別します。これはしばしば交通事業者と同義です。ただし、1つの事業者が複数の独立したサービスを運営している場合など、事業者とブランドが区別されることもあります。本ドキュメントでは「agency」という用語を「brand」の代わりに使用します。1つのデータセットには複数の事業者のデータを含めることができます。<br><br>条件付き必須:<br>- データセットに複数の交通事業者のデータが含まれる場合は **必須**。<br>- それ以外の場合は推奨。 |
|  `agency_name` | テキスト | **必須** | 交通事業者の正式名称。 |
|  `agency_url` | URL | **必須** | 交通事業者のURL。 |
|  `agency_timezone` | タイムゾーン | **必須** | 交通事業者が所在するタイムゾーン。データセットに複数の事業者が指定されている場合、それぞれが同じ `agency_timezone` を持たなければなりません。 |
|  `agency_lang` | 言語コード | 任意 | この交通事業者で使用される主要言語。GTFS利用者がデータセットに対して大文字小文字の規則やその他の言語固有の設定を選択するのに役立つため、提供するべきです。 |
|  `agency_phone` | 電話番号 | 任意 | 指定された事業者の音声通話用電話番号。このフィールドは文字列値であり、事業者のサービスエリアで一般的な形式で電話番号を表します。番号の桁を区切るために句読点を含めることができます。ダイヤル可能なテキスト（例: TriMet の "503-238-RIDE"）は許可されますが、その他の説明文を含めてはいけません。 |
|  `agency_fare_url` | URL | 任意 | 乗客がその事業者のチケットやその他の運賃媒体を購入できるウェブページ、またはその事業者の運賃に関する情報を含むウェブページのURL。 |
|  `agency_email` | メールアドレス | 任意 | 事業者のカスタマーサービス部門が積極的に監視しているメールアドレス。このメールアドレスは、乗客が事業者のカスタマーサービス担当者に直接連絡できる窓口であるべきです。 |

### stops.txt {: #stopstxt}


ファイル: **条件付き必須**

主キー (`stop_id`)

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `stop_id` | 一意のID | **必須** | 停留所等(stop)/プラットフォーム、駅、出入口、汎用ノード、または乗車エリアを識別します（`location_type` を参照）。<br><br>IDはすべての `stops.stop_id`、locations.geojson の `id`、および `location_groups.location_group_id` の値の中で一意でなければなりません。<br><br>複数のルート・路線系統(route)が同じ `stop_id` を使用することができます。 |
|  `stop_code` | テキスト | 任意 | 乗客向けにその場所を識別する短いテキストまたは番号。このコードは、電話ベースの交通情報システムや標識に印刷され、乗客が特定の場所の情報を得やすくするために使用されることが多いです。`stop_code` は公開される場合、`stop_id` と同じであっても構いません。乗客に提示されるコードがない場所については、このフィールドは空にするべきです。 |
|  `stop_name` | テキスト | **条件付き必須** | 場所の名称。`stop_name` は、時刻表、オンライン公開情報、標識などに表示される事業者の乗客向け名称と一致するべきです。他言語への翻訳には [translations.txt](#translationstxt) を使用してください。<br><br>場所が乗車エリア (`location_type=4`) の場合、`stop_name` には事業者が表示する乗車エリアの名称を含めるべきです。これは1文字（ヨーロッパの一部の都市間鉄道駅のように）や「車椅子乗車エリア」（NYC地下鉄）、「短編成列車先頭」（パリRER）のようなテキストである場合があります。<br><br>条件付き必須:<br>- **必須**: 停留所等(stop) (`location_type=0`)、駅 (`location_type=1`)、出入口 (`location_type=2`)。<br>- 任意: 汎用ノード (`location_type=3`)、乗車エリア (`location_type=4`)。|
|  `tts_stop_name` | テキスト | 任意 | `stop_name` の読み上げ用フィールド(text-to-speech field)。詳細は [用語定義](#term-definitions) の「Text-to-speech field」を参照してください。 |
|  `stop_desc` | テキスト | 任意 | 有用で質の高い情報を提供する場所の説明。`stop_name` の重複であってはいけません。|
|  `stop_lat` | 緯度 | **条件付き必須** | 場所の緯度。<br><br>停留所等(stop)/プラットフォーム (`location_type=0`) および乗車エリア (`location_type=4`) の場合、座標はバスポール（存在する場合）の位置、存在しない場合は乗客が車両に乗車する場所（歩道やプラットフォーム上であり、車両が停車する車道や線路上ではない）の位置でなければなりません。<br><br>条件付き必須:<br>- **必須**: 停留所等(stop) (`location_type=0`)、駅 (`location_type=1`)、出入口 (`location_type=2`)。<br>- 任意: 汎用ノード (`location_type=3`)、乗車エリア (`location_type=4`)。|
|  `stop_lon` | 経度 | **条件付き必須** | 場所の経度。<br><br>停留所等(stop)/プラットフォーム (`location_type=0`) および乗車エリア (`location_type=4`) の場合、座標はバスポール（存在する場合）の位置、存在しない場合は乗客が車両に乗車する場所（歩道やプラットフォーム上であり、車両が停車する車道や線路上ではない）の位置でなければなりません。<br><br>条件付き必須:<br>- **必須**: 停留所等(stop) (`location_type=0`)、駅 (`location_type=1`)、出入口 (`location_type=2`)。<br>- 任意: 汎用ノード (`location_type=3`)、乗車エリア (`location_type=4`)。 |
|  `zone_id` | ID | 任意 | 停留所等(stop) の運賃ゾーンを識別します。このレコードが駅または駅の出入口を表す場合、`zone_id` は無視されます。|
|  `stop_url` | URL | 任意 | 場所に関するウェブページのURL。これは `agency.agency_url` や `routes.route_url` のフィールド値とは異なるべきです。 |
|  `location_type` | Enum | 任意 | 場所の種類。有効なオプションは以下の通りです:<br><br>`0`（または空） - **停留所等(stop)**（または **プラットフォーム**）。乗客が交通機関の車両に乗降する場所。`parent_station` 内で定義される場合はプラットフォームと呼ばれます。<br>`1` - **駅**。1つ以上のプラットフォームを含む物理的な構造またはエリア。<br>`2` - **出入口**。乗客が通りから駅に出入りできる場所。出入口が複数の駅に属する場合、両方に通路(pathway)で接続することができますが、データ提供者はそのうち1つを親として選ばなければなりません。<br>`3` - **汎用ノード**。駅内の場所で、他の `location_type` に該当せず、[pathways.txt](#pathwaystxt) で定義された通路(pathway)を接続するために使用されることがあります。<br>`4` - **乗車エリア**。プラットフォーム上の特定の場所で、乗客が車両に乗降できる場所。|
|  `parent_station` | 外部ID（`stops.stop_id` を参照） | **条件付き必須** | [stops.txt](#stopstxt) で定義された異なる場所間の階層を定義します。親の場所のIDを含みます。<br><br>- **停留所等(stop)/プラットフォーム** (`location_type=0`): `parent_station` フィールドには駅のIDを含みます。<br>- **駅** (`location_type=1`): このフィールドは空でなければなりません。<br>- **出入口** (`location_type=2`)、**汎用ノード** (`location_type=3`): `parent_station` フィールドには駅 (`location_type=1`) のIDを含みます。<br>- **乗車エリア** (`location_type=4`): `parent_station` フィールドにはプラットフォームのIDを含みます。<br><br>条件付き必須:<br>- **必須**: 出入口 (`location_type=2`)、汎用ノード (`location_type=3`)、乗車エリア (`location_type=4`)。<br>- 任意: 停留所等(stop)/プラットフォーム (`location_type=0`)。<br>- 禁止: 駅 (`location_type=1`)。|
|  `stop_timezone` | タイムゾーン | 任意 | 場所のタイムゾーン。場所に親駅がある場合、その駅のタイムゾーンを継承し、自身のタイムゾーンは適用されません。駅および親を持たない停留所等(stop)で `stop_timezone` が空の場合、`agency.agency_timezone` で指定されたタイムゾーンを継承します。[stop_times.txt](#stop_timestxt) で提供される時刻は `stop_timezone` ではなく `agency.agency_timezone` で指定されます。これにより、便(trip)がどのタイムゾーンをまたいでも、便内の時刻値は常に増加することが保証されます。 |
|  `wheelchair_boarding` | Enum | 任意 | 車椅子での乗降が可能かどうかを示します。有効なオプションは以下の通りです:<br><br>親を持たない停留所等(stop)の場合:<br>`0` または空 - アクセシビリティ情報なし。<br>`1` - 一部の車両はこの停留所等(stop)で車椅子乗客が乗降可能。<br>`2` - この停留所等(stop)では車椅子乗降不可。<br><br>子の停留所等(stop)の場合:<br>`0` または空 - 親駅の `wheelchair_boarding` の値を継承（親に指定されている場合）。<br>`1` - 駅外から特定の停留所等(stop)/プラットフォームまでアクセシブルな経路が存在する。<br>`2` - 駅外から特定の停留所等(stop)/プラットフォームまでアクセシブルな経路が存在しない。<br><br>駅の出入口の場合:<br>`0` または空 - 親駅の `wheelchair_boarding` の値を継承（親に指定されている場合）。<br>`1` - 出入口は車椅子で利用可能。<br>`2` - 出入口から停留所等(stop)/プラットフォームまでアクセシブルな経路が存在しない。 |
|  `level_id` | 外部ID（`levels.level_id` を参照） | 任意 | 場所の階層。複数の非連結駅で同じ階層を使用することができます。|
|  `platform_code` | テキスト | 任意 | プラットフォーム停留所等(stop)（駅に属する停留所等(stop)）のプラットフォーム識別子。これは単なるプラットフォーム識別子（例: "G" または "3"）であるべきです。「platform」や「track」といった単語（またはフィードの言語における同等の表現）は含めるべきではありません。これにより、フィード利用者はプラットフォーム識別子を他言語に容易に国際化・ローカライズすることができます。 |

### routes.txt {: #routestxt}


ファイル: **必須**

主キー (`route_id`)

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `route_id` | 一意ID | **必須** | ルート・路線系統(route)を識別します。 |
|  `agency_id` | 外部ID（`agency.agency_id` を参照） | **条件付き必須** | 指定されたルート・路線系統(route)の事業者。<br><br>条件付き必須:<br>- [agency.txt](#agencytxt) に複数の事業者が定義されている場合は **必須**。<br>- それ以外の場合は推奨。 |
|  `route_short_name` | テキスト | **条件付き必須** | ルート・路線系統(route)の短い名称。多くの場合、乗客がルートを識別するために使用する短く抽象的な識別子（例: "32", "100X", "Green"）。`route_short_name` と `route_long_name` の両方を定義することができます。<br><br>条件付き必須:<br>- `routes.route_long_name` が空の場合は **必須**。<br>- 短いサービス名称がある場合は推奨。これは一般的に知られている乗客向けの名称であり、12文字以内であるべきです。 |
|  `route_long_name` | テキスト | **条件付き必須** | ルート・路線系統(route)の正式名称。通常、`route_short_name` よりも説明的で、行先や停留所等(stop)を含むことが多いです。`route_short_name` と `route_long_name` の両方を定義することができます。<br><br>条件付き必須:<br>- `routes.route_short_name` が空の場合は **必須**。<br>- それ以外の場合は任意。 |
|  `route_desc` | テキスト | 任意 | ルート・路線系統(route)に関する有用で質の高い情報を提供する説明。`route_short_name` や `route_long_name` の重複であってはいけません。<hr> _例: "A" 列車は常時、マンハッタンの Inwood-207 St とクイーンズの Far Rockaway-Mott Avenue の間を運行します。また、午前6時頃から深夜まで、追加の "A" 列車が Inwood-207 St と Lefferts Boulevard の間を運行します（列車は通常、Lefferts Blvd と Far Rockaway の間で交互に運行します）。_ |
|  `route_type` | 列挙型 | **必須** | ルート・路線系統(route)で使用される交通手段の種類を示します。有効な選択肢は以下の通りです:<br><br>`0` - トラム、ストリートカー、ライトレール。都市圏内のライトレールまたは地上鉄道システム。<br>`1` - 地下鉄、メトロ。都市圏内の地下鉄システム。<br>`2` - 鉄道。都市間または長距離移動に使用。<br>`3` - バス。短距離および長距離のバス路線に使用。<br>`4` - フェリー。短距離および長距離の船舶サービスに使用。<br>`5` - ケーブルトラム。車両の下にケーブルが走る地上鉄道車両（例: サンフランシスコのケーブルカー）。<br>`6` - ロープウェイ、吊り下げ式ケーブルカー（例: ゴンドラリフト、エアトラム）。1本以上のケーブルによりキャビンやゴンドラ、オープンチェアが吊り下げられる輸送手段。<br>`7` - フニクラー。急勾配用に設計された鉄道システム。<br>`11` - トロリーバス。架線からポールを使って電力を供給される電気バス。<br>`12` - モノレール。単一のレールまたはビームで構成される鉄道。 |
|  `route_url` | URL | 任意 | 特定のルート・路線系統(route)に関するウェブページのURL。`agency.agency_url` の値とは異なるべきです。 |
|  `route_color` | 色 | 任意 | 公開資料に一致するルート・路線系統(route)の色指定。省略または空の場合は白 (`FFFFFF`) がデフォルト。`route_color` と `route_text_color` の色の差は、白黒画面で見ても十分なコントラストを提供するべきです。 |
|  `route_text_color` | 色 | 任意 | `route_color` の背景に対して読みやすい文字色。省略または空の場合は黒 (`000000`) がデフォルト。`route_color` と `route_text_color` の色の差は、白黒画面で見ても十分なコントラストを提供するべきです。 |
|  `route_sort_order` | 非負整数 | 任意 | 乗客に提示する際に理想的な順序でルート・路線系統(route)を並べるための値。`route_sort_order` の値が小さいルートから先に表示されるべきです。 |
|  `continuous_pickup` | 列挙型 | **条件付き禁止** | 乗客が、[shapes.txt](#shapestxt) で記述された車両の走行経路上の任意の地点で、ルート・路線系統(route)のすべての便(trip)において乗車できることを示します。有効な選択肢は以下の通りです:<br><br>`0` - 連続停車での乗車可。<br>`1` または空 - 連続停車での乗車不可。<br>`2` - 事業者に電話して連続停車での乗車を手配する必要あり。<br>`3` - 運転手と調整して連続停車での乗車を手配する必要あり。<br><br>`routes.continuous_pickup` の値は、ルート上の特定の `stop_time` に対して `stop_times.continuous_pickup` を定義することで上書きすることができます。<br><br>**条件付き禁止**:<br>- このルートのいずれかの便(trip)で `stop_times.start_pickup_drop_off_window` または `stop_times.end_pickup_drop_off_window` が定義されている場合、`1` または空以外の値は **禁止**。<br>- それ以外の場合は任意。 |
|  `continuous_drop_off` | 列挙型 | **条件付き禁止** | 乗客が、[shapes.txt](#shapestxt) で記述された車両の走行経路上の任意の地点で、ルート・路線系統(route)のすべての便(trip)において降車できることを示します。有効な選択肢は以下の通りです:<br><br>`0` - 連続停車での降車可。<br>`1` または空 - 連続停車での降車不可。<br>`2` - 事業者に電話して連続停車での降車を手配する必要あり。<br>`3` - 運転手と調整して連続停車での降車を手配する必要あり。<br><br>`routes.continuous_drop_off` の値は、ルート上の特定の `stop_time` に対して `stop_times.continuous_drop_off` を定義することで上書きすることができます。<br><br>**条件付き禁止**:<br>- このルートのいずれかの便(trip)で `stop_times.start_pickup_drop_off_window` または `stop_times.end_pickup_drop_off_window` が定義されている場合、`1` または空以外の値は **禁止**。<br>- それ以外の場合は任意。 |
| `network_id` | ID | **条件付き禁止** | 複数のルート・路線系統(route)をまとめるグループを識別します。[routes.txt](#routestxt) の複数行が同じ `network_id` を持つことができます。<br><br>条件付き禁止:<br>- [route_networks.txt](#route_networkstxt) ファイルが存在する場合は **禁止**。<br>- それ以外の場合は任意。 |

### trips.txt {: #tripstxt}


ファイル: **必須**

主キー (`trip_id`)

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `route_id` | `routes.route_id` を参照する外部ID | **必須** | ルート・路線系統(route)を識別します。 |
|  `service_id` | `calendar.service_id` または `calendar_dates.service_id` を参照する外部ID | **必須** | 1つ以上のルート・路線系統(route)に対して運行が提供される日付の集合を識別します。 |
|  `trip_id` | 一意のID | **必須** | 便(trip)を識別します。 |
| `trip_headsign` | テキスト | 任意 | 乗客に便(trip)の行先を示すために表示されるテキストです。このフィールドは、車両に行先表示(headsign)が表示され、ルート・路線系統(route)内の便(trip)を区別するために使用される可能性があるすべてのサービスに推奨されます。<br><br> 便(trip)の途中で行先表示(headsign)が変わる場合、`trip_headsign` の値は、便(trip)の特定の停車時刻(stop_time)に対して `stop_times.stop_headsign` に値を定義することで上書きすることができます。 |
|  `trip_short_name` | テキスト | 任意 | 乗客に便(trip)を識別させるために使用される公開用テキストです。例えば、通勤鉄道の便(trip)における列車番号を識別するために使用されます。乗客が通常、便(trip)名に依存しない場合、`trip_short_name` は空にするべきです。`trip_short_name` の値が提供される場合、運行日(service day)内で便(trip)を一意に識別するべきです。行先名や快速/各停などの区別に使用してはいけません。 |
|  `direction_id` | 列挙型 | 任意 | 便(trip)の運行方向を示します。このフィールドは経路探索には使用するべきではなく、時刻表を公開する際に方向ごとに便(trip)を分ける方法を提供します。有効な値は以下の通りです:<br><br>`0` - 一方向の運行（例: 郊外方面）。<br>`1` - 反対方向の運行（例: 都心方面）。<hr>*例: `trip_headsign` と `direction_id` フィールドを組み合わせて、一連の便(trip)に対して方向ごとに名前を割り当てることができます。[trips.txt](#tripstxt) ファイルには、時刻表で使用するために以下のようなレコードを含めることができます:* <br> `trip_id,...,trip_headsign,direction_id` <br> `1234,...,Airport,0` <br> `1505,...,Downtown,1` |
|  `block_id` | ID | 任意 | 便(trip)が属するブロックを識別します。ブロックは、同じ車両を使用して運行日(service day)と `block_id` を共有する1つまたは複数の連続した便(trip)で構成されます。`block_id` は異なる運行日(service day)を持つ便(trip)を含むことができ、その場合は別々のブロックとなります。[以下の例](#example-blocks-and-service-day)を参照してください。座席に座ったままの乗り継ぎ情報を提供するには、代わりに `transfer_type` が `4` の [transfers](#transferstxt) を提供するべきです。 |
|  `shape_id` | `shapes.shape_id` を参照する外部ID | **条件付き必須** | 便(trip)の車両の走行経路を記述する地理空間的なルート形状(shape)を識別します。<br><br>条件付き必須: <br>- **必須**: 便(trip)が [routes.txt](#routestxt) または [stop_times.txt](#stop_timestxt) で定義された連続乗車または降車の挙動を持つ場合。<br>- それ以外は任意。 |
|  `wheelchair_accessible` | 列挙型 | 任意 | 車椅子での利用可否を示します。有効な値は以下の通りです:<br><br>`0` または空 - 便(trip)に関するアクセシビリティ情報はありません。<br>`1` - この便(trip)で使用される車両は、少なくとも1人の車椅子利用者を収容できます。<br>`2` - この便(trip)では車椅子利用者を収容できません。 |
|  `bikes_allowed` | 列挙型 | 任意 | 自転車の持ち込み可否を示します。有効な値は以下の通りです:<br><br>`0` または空 - 便(trip)に関する自転車情報はありません。<br>`1` - この便(trip)で使用される車両は、少なくとも1台の自転車を収容できます。<br>`2` - この便(trip)では自転車を持ち込むことはできません。 |
|  `cars_allowed` | 列挙型 | 任意 | 自動車の持ち込み可否を示します。有効な値は以下の通りです:<br><br>`0` または空 - 便(trip)に関する自動車情報はありません。<br>`1` - この便(trip)で使用される車両は、少なくとも1台の自動車を収容できます。<br>`2` - この便(trip)では自動車を持ち込むことはできません。 |

#### 例: ブロックと運行日(service day) {: #example-blocks-and-service-day}


以下の例は有効であり、曜日ごとに異なるブロックを持っています。

| route_id | trip_id | service_id                     | block_id | <span style="font-weight:normal">*(最初の停車時刻(stop_time))*</span> | <span style="font-weight:normal">*(最後の停車時刻(stop_time))*</span> |
|----------|---------|--------------------------------|----------|-----------------------------------------|-------------------------|
| red      | trip_1  | mon-tues-wed-thurs-fri-sat-sun | red_loop | 22:00:00                                | 22:55:00                |
| red      | trip_2  | fri-sat-sun                    | red_loop | 23:00:00                                | 23:55:00                |
| red      | trip_3  | fri-sat                        | red_loop | 24:00:00                                | 24:55:00                |
| red      | trip_4  | mon-tues-wed-thurs             | red_loop | 20:00:00                                | 20:50:00                |
| red      | trip_5  | mon-tues-wed-thurs             | red_loop | 21:00:00                                | 21:50:00                |

上記の表に関する注記:

* 金曜日から土曜日の朝にかけて、例えば 1台の車両が `trip_1`、`trip_2`、`trip_3` を運行します (午後10:00から午前0:55まで)。最後の便は土曜日の午前0:00から午前0:55に運行されますが、時刻が 24:00:00 から 24:55:00 であるため、金曜日の「運行日(service day)」に含まれます。
* 月曜日、火曜日、水曜日、木曜日には、1台の車両が `trip_1`、`trip_4`、`trip_5` を午後8:00から午後10:55までのブロックで運行します。

### stop_times.txt {: #stop_timestxt}


ファイル: **必須**

主キー (`trip_id`, `stop_sequence`)

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `trip_id` | `trips.trip_id` を参照する外部ID | **必須** | 便(trip)を識別します。 |
|  `arrival_time` | 時刻 | **条件付き必須** | 特定の便(`stop_times.trip_id` で定義)における停留所等(`stop_times.stop_id` で定義)での到着時刻を、`stops.stop_timezone` ではなく `agency.agency_timezone` で指定します。<br><br>停留所等で到着時刻と出発時刻が別々に存在しない場合、`arrival_time` と `departure_time` は同じであるべきです。<br><br>運行日(service day)の深夜0時以降の時刻は、HH:MM:SS 形式で 24:00:00 より大きい値として入力してください。<br><br>正確な到着・出発時刻 (`timepoint=1`) が利用できない場合、推定または補間された到着・出発時刻 (`timepoint=0`) を提供するべきです。<br><br>条件付き必須:<br>- 便の最初と最後の停留所等(`stop_times.stop_sequence` で定義)では **必須**。<br>- `timepoint=1` の場合は **必須**。<br>- `start_pickup_drop_off_window` または `end_pickup_drop_off_window` が定義されている場合は **禁止**。<br>- それ以外は任意。|
|  `departure_time` | 時刻 | **条件付き必須** | 特定の便(`stop_times.trip_id` で定義)における停留所等(`stop_times.stop_id` で定義)からの出発時刻を、`stops.stop_timezone` ではなく `agency.agency_timezone` で指定します。<br><br>停留所等で到着時刻と出発時刻が別々に存在しない場合、`arrival_time` と `departure_time` は同じであるべきです。<br><br>運行日(service day)の深夜0時以降の時刻は、HH:MM:SS 形式で 24:00:00 より大きい値として入力してください。<br><br>正確な到着・出発時刻 (`timepoint=1`) が利用できない場合、推定または補間された到着・出発時刻 (`timepoint=0`) を提供するべきです。<br><br>条件付き必須:<br>- `timepoint=1` の場合は **必須**。<br>- `start_pickup_drop_off_window` または `end_pickup_drop_off_window` が定義されている場合は **禁止**。<br>- それ以外は任意。 |
|  `stop_id` | `stops.stop_id` を参照する外部ID | **条件付き必須** | サービス対象の停留所等を識別します。便でサービスされるすべての停留所等は [stop_times.txt](#stop_timestxt) にレコードを持たなければなりません。参照される場所は停留所またはプラットフォームでなければならず、`stops.location_type` の値は `0` または空である必要があります。1つの便で同じ停留所等を複数回サービスすることができ、複数の便やルート・路線系統(route)が同じ停留所等をサービスすることもあります。<br><br>停留所等を利用するデマンド型サービスは、その停留所等でサービスが利用可能となる順序で参照されるべきです。データ利用者は、各停車時刻(stop_time)の `pickup/drop_off_type` や `start/end_pickup_drop_off_window` の時間制約で禁止されていない限り、便の後続の停留所等や場所への移動が可能であると仮定するべきです。<br><br>条件付き必須:<br>- `stop_times.location_group_id` および `stop_times.location_id` が定義されていない場合は **必須**。<br>- `stop_times.location_group_id` または `stop_times.location_id` が定義されている場合は **禁止**。 |
|  `location_group_id` | `location_groups.location_group_id` を参照する外部ID | **条件付き禁止** | 乗客が乗降をリクエストできる停留所等のグループを示すサービス対象のロケーショングループを識別します。便でサービスされるすべてのロケーショングループは [stop_times.txt](#stop_timestxt) にレコードを持たなければなりません。複数の便やルート・路線系統(route)が同じロケーショングループをサービスすることもあります。<br><br>ロケーショングループを利用するデマンド型サービスは、そのロケーショングループでサービスが利用可能となる順序で参照されるべきです。データ利用者は、各停車時刻(stop_time)の `pickup/drop_off_type` や `start/end_pickup_drop_off_window` の時間制約で禁止されていない限り、便の後続の停留所等や場所への移動が可能であると仮定するべきです。<br><br>**条件付き禁止**:<br>- `stop_times.stop_id` または `stop_times.location_id` が定義されている場合は **禁止**。 |
|  `location_id` | `locations.geojson` の `id` を参照する外部ID | **条件付き禁止** | 乗客が乗降をリクエストできるサービス対象のゾーンに対応する GeoJSON ロケーションを識別します。便でサービスされるすべての GeoJSON ロケーションは [stop_times.txt](#stop_timestxt) にレコードを持たなければなりません。複数の便やルート・路線系統(route)が同じ GeoJSON ロケーションをサービスすることもあります。<br><br>ロケーション内でのデマンド型サービスは、そのロケーションでサービスが利用可能となる順序で参照されるべきです。データ利用者は、各停車時刻(stop_time)の `pickup/drop_off_type` や `start/end_pickup_drop_off_window` の時間制約で禁止されていない限り、便の後続の停留所等や場所への移動が可能であると仮定するべきです。<br><br>**条件付き禁止**:<br>- `stop_times.stop_id` または `stop_times.location_group_id` が定義されている場合は **禁止**。 |
|  `stop_sequence` | 非負整数 | **必須** | 特定の便における停留所等、ロケーショングループ、または GeoJSON ロケーションの順序を示します。値は便に沿って増加しなければなりませんが、連続している必要はありません。<hr>*例: 便の最初の場所が `stop_sequence`=`1`、2番目の場所が `stop_sequence`=`23`、3番目の場所が `stop_sequence`=`40` など。*<br><br>同じロケーショングループまたは GeoJSON ロケーション内での移動には、同じ `location_group_id` または `location_id` を持つ2つの [stop_times.txt](#stop_timestxt) レコードが必要です。 |
|  `stop_headsign` | テキスト | 任意 | 乗客に便の行先を示す標識に表示されるテキストです。このフィールドは、停留所等ごとに行先表示(headsign)が変わる場合に、デフォルトの `trips.trip_headsign` を上書きします。便全体で行先表示が同じ場合は、`trips.trip_headsign` を使用するべきです。<br><br>ある停車時刻(stop_time)で指定された `stop_headsign` の値は、同じ便の後続の停車時刻(stop_time)には適用されません。同じ便の複数の停車時刻(stop_time)で `trip_headsign` を上書きしたい場合は、各停車時刻(stop_time)の行に `stop_headsign` の値を繰り返す必要があります。 |
| `start_pickup_drop_off_window` | 時刻 | **条件付き必須** | GeoJSON ロケーション、ロケーショングループ、または停留所等でデマンド型サービスが利用可能になる時刻。<br><br>**条件付き必須**:<br>- `stop_times.location_group_id` または `stop_times.location_id` が定義されている場合は **必須**。<br>- `end_pickup_drop_off_window` が定義されている場合は **必須**。<br>- `arrival_time` または `departure_time` が定義されている場合は **禁止**。<br>- それ以外は任意。 |
| `end_pickup_drop_off_window` | 時刻 | **条件付き必須** | GeoJSON ロケーション、ロケーショングループ、または停留所等でデマンド型サービスが終了する時刻。<br><br>**条件付き必須**:<br>- `stop_times.location_group_id` または `stop_times.location_id` が定義されている場合は **必須**。<br>- `start_pickup_drop_off_window` が定義されている場合は **必須**。<br>- `arrival_time` または `departure_time` が定義されている場合は **禁止**。<br>- それ以外は任意。 |
|  `pickup_type` | Enum | **条件付き禁止** | 乗車方法を示します。有効な値は以下の通りです:<br><br>`0` または空 - 定期的に停車して乗車可能。<br>`1` - 乗車不可。<br>`2` - 事業者に電話して乗車を手配する必要あり。<br>`3` - 運転手と調整して乗車を手配する必要あり。<br><br> **条件付き禁止**:<br>- `start_pickup_drop_off_window` または `end_pickup_drop_off_window` が定義されている場合、`pickup_type=0` は **禁止**。<br>- `start_pickup_drop_off_window` または `end_pickup_drop_off_window` が定義されている場合、`pickup_type=3` は **禁止**。<br>- それ以外は任意。 |
|  `drop_off_type` | Enum | **条件付き禁止** | 降車方法を示します。有効な値は以下の通りです:<br><br>`0` または空 - 定期的に停車して降車可能。<br>`1` - 降車不可。<br>`2` - 事業者に電話して降車を手配する必要あり。<br>`3` - 運転手と調整して降車を手配する必要あり。<br><br> **条件付き禁止**:<br>- `start_pickup_drop_off_window` または `end_pickup_drop_off_window` が定義されている場合、`drop_off_type=0` は **禁止**。<br>- それ以外は任意。 |
|  `continuous_pickup` | Enum | **条件付き禁止** | 乗客が、便の停車時刻(stop_time)から次の停車時刻(stop_time)までの間、[shapes.txt](#shapestxt) で記述された経路上の任意の地点で乗車できることを示します。有効な値は以下の通りです:<br><br>`0` - 連続乗車可能。<br>`1` または空 - 連続乗車不可。<br>`2` - 事業者に電話して連続乗車を手配する必要あり。<br>`3` - 運転手と調整して連続乗車を手配する必要あり。<br><br>このフィールドが設定されている場合、[routes.txt](#routestxt) で定義された連続乗車の挙動を上書きします。このフィールドが空の場合、停車時刻(stop_time)は [routes.txt](#routestxt) で定義された連続乗車の挙動を継承します。<br><br>**条件付き禁止**:<br>- `start_pickup_drop_off_window` または `end_pickup_drop_off_window` が定義されている場合、`1` または空以外の値は **禁止**。<br>- それ以外は任意。 |
|  `continuous_drop_off` | Enum | **条件付き禁止** | 乗客が、便の停車時刻(stop_time)から次の停車時刻(stop_time)までの間、[shapes.txt](#shapestxt) で記述された経路上の任意の地点で降車できることを示します。有効な値は以下の通りです:<br><br>`0` - 連続降車可能。<br>`1` または空 - 連続降車不可。<br>`2` - 事業者に電話して連続降車を手配する必要あり。<br>`3` - 運転手と調整して連続降車を手配する必要あり。<br><br>このフィールドが設定されている場合、[routes.txt](#routestxt) で定義された連続降車の挙動を上書きします。このフィールドが空の場合、停車時刻(stop_time)は [routes.txt](#routestxt) で定義された連続降車の挙動を継承します。<br><br>**条件付き禁止**:<br>- `start_pickup_drop_off_window` または `end_pickup_drop_off_window` が定義されている場合、`1` または空以外の値は **禁止**。<br>- それ以外は任意。 |
|  `shape_dist_traveled` | 非負浮動小数点数 | 任意 | 関連するルート形状(shape)に沿って、最初の停留所等からこのレコードで指定された停留所等までの実際の走行距離を示します。このフィールドは、便の任意の2つの停留所等間で描画するルート形状の範囲を指定します。[shapes.txt](#shapestxt) で使用される単位と同じ単位でなければなりません。`shape_dist_traveled` の値は `stop_sequence` に沿って増加しなければならず、ルート上の逆方向の移動を示すために使用してはいけません。<br><br>ループや重複経路（車両が1便の中で同じ経路を横断または通過する場合）があるルートでは推奨されます。参照: [`shapes.shape_dist_traveled`](#shapestxt)。<hr>*例: バスがルート形状の始点から停留所等まで 5.25 km 走行した場合、`shape_dist_traveled`=`5.25`。* |
| `timepoint` | Enum | 任意 | 停留所等での到着・出発時刻が車両によって厳密に守られるのか、それともおおよその時刻または補間された時刻なのかを示します。このフィールドにより、GTFS 提供者は補間された停車時刻(stop_time)を提供しつつ、それが推定値であることを示すことができます。有効な値は以下の通りです:<br><br>`0` - 時刻はおおよそ。<br>`1` - 時刻は正確。<br><br>[stop_times.txt](#stop_timestxt) のすべてのレコードで到着または出発時刻が定義されている場合、`timepoint` の値を設定するべきです。`timepoint` の値が提供されていない場合、すべての時刻は正確と見なされます。 |
| `pickup_booking_rule_id` | `booking_rules.booking_rule_id` を参照する外部ID | 任意 | この停車時刻(stop_time)での乗車予約ルールを識別します。<br><br>`pickup_type=2` の場合に推奨されます。 |
| `drop_off_booking_rule_id` | `booking_rules.booking_rule_id` を参照する外部ID | 任意 | この停車時刻(stop_time)での降車予約ルールを識別します。<br><br>`drop_off_type=2` の場合に推奨されます。 |

#### オンデマンドサービスの経路探索動作 {: #on-demand-service-routing-behavior}

- 出発地と目的地の間の経路探索や所要時間を提供する際、データ利用者は、同じ `trip_id` を持ち、かつ `start_pickup_drop_off_window` および `end_pickup_drop_off_window` が定義されている中間の stop_times.txt レコードを無視するべきです。無視するべき例については、[データ例のページ](../examples/flex/#ignoring-intermediate-stop-times-records-with-pickupdrop-off-windows)を参照してください。
- 同じ `trip_id` を持つ 2つ以上の stop_times.txt レコード間で、locations.geojson の `id` ジオメトリ、`start/end_pickup_drop_off_window` の時間、`pickup_type` または `drop_off_type` が同時に重複することは禁止されています。禁止されている例については、[データ例のページ](../examples/flex/#zone-overlap-constraint)を参照してください。

### calendar.txt {: #calendartxt}


ファイル: **条件付き必須**

主キー (`service_id`)

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ |------ |
|  `service_id` | 一意のID | **必須** | 1つ以上のルート・路線系統(route)で運行が利用可能な日付のセットを識別します。 |
|  `monday` | 列挙型 | **必須** | `start_date` および `end_date` フィールドで指定された日付範囲内のすべての月曜日にサービスが運行されるかどうかを示します。特定の日付に対する例外は [calendar_dates.txt](#calendar_datestxt) に記載される場合があります。有効な値は以下の通りです:<br><br>`1` - 日付範囲内のすべての月曜日に運行があります。<br>`0` - 日付範囲内の月曜日には運行がありません。 |
|  `tuesday` | 列挙型 | **必須** | `monday` と同様に機能しますが、火曜日に適用されます。 |
|  `wednesday` | 列挙型 | **必須** | `monday` と同様に機能しますが、水曜日に適用されます。 |
|  `thursday` | 列挙型 | **必須** | `monday` と同様に機能しますが、木曜日に適用されます。 |
|  `friday` | 列挙型 | **必須** | `monday` と同様に機能しますが、金曜日に適用されます。 |
|  `saturday` | 列挙型 | **必須** | `monday` と同様に機能しますが、土曜日に適用されます。 |
|  `sunday` | 列挙型 | **必須** | `monday` と同様に機能しますが、日曜日に適用されます。 |
|  `start_date` | 日付 | **必須** | 運行区間の開始運行日(service day)です。 |
|  `end_date` | 日付 | **必須** | 運行区間の終了運行日(service day)です。この運行日は区間に含まれます。 |

### calendar_dates.txt {: #calendar_datestxt}


ファイル: **条件付き必須**

主キー (`service_id`, `date`)

[calendar_dates.txt](#calendar_datestxt) テーブルは、日付ごとに運行を明示的に有効化または無効化します。これは2つの方法で使用することができます。

* 推奨: [calendar.txt](#calendartxt) と組み合わせて [calendar_dates.txt](#calendar_datestxt) を使用し、[calendar.txt](#calendartxt) で定義されたデフォルトの運行パターンに対する例外を定義します。運行が基本的に規則的で、特定の日付にいくつかの変更がある場合（例えば、特別イベントの運行や学校のスケジュールに対応する場合）、この方法が適しています。この場合、`calendar_dates.service_id` は `calendar.service_id` を参照する外部IDです。
* 代替: [calendar.txt](#calendartxt) を省略し、[calendar_dates.txt](#calendar_datestxt) に運行するすべての日付を指定します。これにより、運行の大幅な変動が可能となり、通常の週単位のスケジュールを持たない運行にも対応できます。この場合、`service_id` は単なるIDです。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `service_id` | `calendar.service_id` を参照する外部ID または ID | **必須** | 1つ以上のルートに対して運行例外が発生する日付の集合を識別します。`calendar.txt` と [calendar_dates.txt](#calendar_datestxt) を併用する場合、各 (`service_id`, `date`) の組み合わせは [calendar_dates.txt](#calendar_datestxt) に1回しか出現してはいけません。`service_id` の値が [calendar.txt](#calendartxt) と [calendar_dates.txt](#calendar_datestxt) の両方に存在する場合、[calendar_dates.txt](#calendar_datestxt) の情報が [calendar.txt](#calendartxt) で指定された運行情報を修正します。 |
|  `date` | 日付 | **必須** | 運行例外が発生する日付。 |
|  `exception_type` | Enum | **必須** | 指定された日付において運行が有効かどうかを示します。有効なオプションは以下の通りです:<br><br> `1` - 指定された日付に運行が追加される。<br>`2` - 指定された日付に運行が削除される。<hr>*例: あるルートが休日には1つの便のセットを運行し、それ以外の日には別の便のセットを運行する場合、1つの `service_id` は通常の運行スケジュールに対応し、もう1つの `service_id` は休日のスケジュールに対応します。特定の休日については、[calendar_dates.txt](#calendar_datestxt) ファイルを使用して、その休日を休日用の `service_id` に追加し、通常の `service_id` スケジュールから削除することができます。* |

### fare_attributes.txt {: #fare_attributestxt}


ファイル: **任意**

主キー (`fare_id`)

**バージョン**<br>
運賃を記述する方法には2つのモデリングオプションがあります。GTFS-Fares V1 は最小限の運賃情報を記述する従来の方法です。GTFS-Fares V2 は、事業者の運賃体系をより詳細に記述できる更新された方法です。両方を1つのデータセットに含めることは可能ですが、データ利用者は1つのデータセットに対してどちらか一方の方法のみを使用するべきです。GTFS-Fares V2 を GTFS-Fares V1 より優先することが推奨されます。<br><br>GTFS-Fares V1 に関連するファイルは以下の通りです:<br>- [fare_attributes.txt](#fare_attributestxt)<br>- [fare_rules.txt](#fare_rulestxt)<br><br>GTFS-Fares V2 に関連するファイルは以下の通りです:<br>- [fare_media.txt](#fare_mediatxt)<br>- [fare_products.txt](#fare_productstxt)<br>- [rider_categories.txt](#rider_categoriestxt)<br>- [fare_leg_rules.txt](#fare_leg_rulestxt)<br>- [fare_leg_join_rules.txt](#fare_leg_join_rulestxt)<br>- [fare_transfer_rules.txt](#fare_transfer_rulestxt)<br>- [timeframes.txt](#timeframestxt)<br>- [networks.txt](#networkstxt)<br>- [route_networks.txt](#route_networkstxt)<br>- [areas.txt](#areastxt)<br>- [stop_areas.txt](#stop_areastxt)

<br>

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `fare_id` | 一意のID | **必須** | 運賃クラスを識別します。 |
|  `price` | 非負の浮動小数点数 | **必須** | 運賃の価格。単位は `currency_type` で指定されます。 |
|  `currency_type` | 通貨コード | **必須** | 運賃の支払いに使用される通貨。 |
|  `payment_method` | Enum | **必須** | 運賃を支払うタイミングを示します。有効なオプションは以下の通りです:<br><br>`0` - 車内で運賃を支払います。<br>`1` - 乗車前に運賃を支払わなければなりません。 |
|  `transfers` | Enum | **必須** | この運賃で許可される乗り換え回数を示します。有効なオプションは以下の通りです:<br><br>`0` - この運賃では乗り換えは許可されません。<br>`1` - 乗客は1回乗り換えることができます。<br>`2` - 乗客は2回乗り換えることができます。<br>空欄 - 無制限の乗り換えが許可されます。 |
|  `agency_id` | 外部ID（`agency.agency_id` を参照） | **条件付き必須** | 運賃に関連する事業者を識別します。<br><br>条件付き必須:<br>- [agency.txt](#agencytxt) に複数の事業者が定義されている場合は **必須**。<br>- それ以外の場合は推奨。 |
|  `transfer_duration` | 非負の整数 | 任意 | 乗り換えが有効である秒数を示します。`transfers`=`0` の場合、このフィールドはチケットの有効時間を示すために使用することができます。または空欄のままにすることもできます。 |

### fare_rules.txt {: #fare_rulestxt}


ファイル: **任意**

主キー (`*`)

[fare_rules.txt](#fare_rulestxt) テーブルは、[fare_attributes.txt](#fare_attributestxt) における運賃が旅程にどのように適用されるかを指定します。ほとんどの運賃体系は、以下のルールのいくつかを組み合わせて使用します。

* 運賃は出発駅または到着駅に依存します。
* 運賃は旅程が通過するゾーンに依存します。
* 運賃は旅程が利用するルート・路線系統(route)に依存します。

[fare_rules.txt](#fare_rulestxt) と [fare_attributes.txt](#fare_attributestxt) を用いて運賃体系を指定する方法の例については、GoogleTransitDataFeed オープンソースプロジェクトの wiki にある [FareExamples](https://web.archive.org/web/20111207224351/https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) を参照してください。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `fare_id` | `fare_attributes.fare_id` を参照する外部ID | **必須** | 運賃クラスを識別します。 |
|  `route_id` | `routes.route_id` を参照する外部ID | 任意 | 運賃クラスに関連付けられたルート・路線系統(route)を識別します。同じ運賃属性を持つ複数のルートが存在する場合は、各ルートごとに [fare_rules.txt](#fare_rulestxt) にレコードを作成してください。<hr>*例: 運賃クラス "b" がルート "TSW" および "TSE" で有効な場合、[fare_rules.txt](#fare_rulestxt) ファイルには以下のレコードが含まれます:* <br> `fare_id,route_id`<br>`b,TSW` <br> `b,TSE`|
|  `origin_id` | `stops.zone_id` を参照する外部ID | 任意 | 出発ゾーンを識別します。運賃クラスに複数の出発ゾーンがある場合は、各 `origin_id` ごとに [fare_rules.txt](#fare_rulestxt) にレコードを作成してください。<hr>*例: 運賃クラス "b" がゾーン "2" またはゾーン "8" から出発するすべての旅程で有効な場合、[fare_rules.txt](#fare_rulestxt) ファイルには以下のレコードが含まれます:* <br> `fare_id,...,origin_id` <br> `b,...,2`  <br> `b,...,8` |
|  `destination_id` | `stops.zone_id` を参照する外部ID | 任意 | 到着ゾーンを識別します。運賃クラスに複数の到着ゾーンがある場合は、各 `destination_id` ごとに [fare_rules.txt](#fare_rulestxt) にレコードを作成してください。<hr>*例: `origin_id` と `destination_id` フィールドを組み合わせて、運賃クラス "b" がゾーン 3 と 4 の間、またはゾーン 3 と 5 の間の旅程で有効であることを指定できます。この場合、[fare_rules.txt](#fare_rulestxt) ファイルには以下のレコードが含まれます:* <br>`fare_id,...,origin_id,destination_id` <br>`b,...,3,4`<br> `b,...,3,5` |
|  `contains_id` | `stops.zone_id` を参照する外部ID | 任意 | 特定の運賃クラスを利用する際に乗客が通過するゾーンを識別します。一部のシステムでは、正しい運賃クラスを計算するために使用されます。<hr>*例: 運賃クラス "c" が GRT ルートでゾーン 5、6、7 を通過するすべての旅程に関連付けられている場合、[fare_rules.txt](#fare_rulestxt) には以下のレコードが含まれます:* <br> `fare_id,route_id,...,contains_id` <br>  `c,GRT,...,5` <br>`c,GRT,...,6` <br>`c,GRT,...,7` <br> *すべての `contains_id` ゾーンが一致しなければ運賃は適用されないため、ゾーン 5 と 6 を通過するがゾーン 7 を通過しない旅程には運賃クラス "c" は適用されません。詳細については、GoogleTransitDataFeed プロジェクト wiki の [https://code.google.com/p/googletransitdatafeed/wiki/FareExamples](https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) を参照してください。* |

### timeframes.txt {: #timeframestxt}


ファイル: **任意**

主キー (`*`)

運賃が一日の時間帯、曜日、または特定の日によって変動する場合を記述するために使用されます。timeframe は [fare_leg_rules.txt](#fare_leg_rulestxt) 内のチケット商品と関連付けることができます。<br>
同じ `timeframe_group_id` と `service_id` の値に対して、重複する時間間隔があってはなりません。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `timeframe_group_id` | ID | **必須** | timeframe または timeframe の集合を識別します。 |
|  `start_time` | Time | **条件付き必須** | timeframe の開始を定義します。この区間には開始時刻が含まれます。<br> `24:00:00` を超える値は許可されていません。`start_time` が空の場合は `00:00:00` と見なされます。<br><br> 条件付き必須:<br> - `timeframes.end_time` が定義されている場合は **必須**。<br> - それ以外の場合は **禁止**。 |
|  `end_time` | Time | **条件付き必須** | timeframe の終了を定義します。この区間には終了時刻は含まれません。<br> `24:00:00` を超える値は許可されていません。`end_time` が空の場合は `24:00:00` と見なされます。<br><br> 条件付き必須:<br> - `timeframes.start_time` が定義されている場合は **必須**。<br> - それ以外の場合は **禁止**。 |
| `service_id` | 外部 ID （`calendar.service_id` または `calendar_dates.service_id` を参照） | **必須** | timeframe が有効となる日付の集合を識別します。 |

#### タイムフレームのローカル時間の意味論 {: #timeframe-local-time-semantics}

- 運賃イベントの時刻を [timeframes.txt](#timeframestxt) と照合する際、イベント時刻は、その運賃イベントに関連する停留所等(stop)または親駅の `stop_timezone` が指定されている場合はそれを用いて、ローカルタイムゾーンに基づくローカル時間で計算されます。指定されていない場合は、フィードの事業者のタイムゾーンを代わりに使用するべきです。
- 「現在の日(current day)」は、ローカルタイムゾーンに基づいて計算された運賃イベントの時刻の日付です。「現在の日(current day)」は、特に深夜をまたぐ便(trip)においては、運賃区間(fare leg)の便(trip)の運行日(service day)と異なる場合があります。
- 運賃イベントの「一日の時刻(time-of-day)」は、「現在の日(current day)」に対して、GTFS の Time フィールド型の意味論を用いて計算されます。

### rider_categories.txt {: #rider_categoriestxt}


ファイル: **任意** 

主キー (`rider_category_id`)

乗客のカテゴリ（例: 高齢者、学生）を定義します。

| フィールド名 | 型 | 出現 | 説明 |
| ------ | ------ | ------ | ------ |
| `rider_category_id` | 一意のID | **必須** | 乗客カテゴリを識別します。 |
| `rider_category_name` | テキスト | **必須** | 乗客に表示される乗客カテゴリ名です。 |
| `is_default_fare_category` | 列挙型 | **必須** | [rider_categories.txt](#rider_categoriestxt) のエントリがデフォルトカテゴリ（すなわち、乗客に表示される主要なカテゴリ）と見なされるかどうかを指定します。例: 大人運賃、通常運賃など。 有効なオプションは以下の通りです:<br><br>`0` または空 - カテゴリはデフォルトとは見なされません。<br>`1` - カテゴリはデフォルトと見なされます。<br><br>`fare_product_id` で指定された単一のチケット商品に複数の乗客カテゴリが適用可能な場合、これらの適用可能な乗客カテゴリのうち、デフォルト乗客カテゴリ（`is_default_fare_category = 1`）として正確に1つが指定されなければなりません。 |
| `eligibility_url` | URL | 任意 | 通常は運行事業者が提供するウェブページのURLで、特定の乗客カテゴリに関する詳細情報や、その適格基準を説明します。 |

### fare_media.txt {: #fare_mediatxt}


ファイル: **任意** 

主キー (`fare_media_id`)

チケット商品を利用するために使用できる、さまざまなチケットメディアを記述します。チケットメディアは、チケット商品の表現および/または認証に使用される物理的または仮想的な媒体です。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `fare_media_id` | 一意のID | **必須** | チケットメディアを識別します。 |
|  `fare_media_name` | テキスト | 任意 | チケットメディアの名称。<br><br>`fare_media_type =2` の交通系カードや (`fare_media_type =4`) のモバイルアプリの場合、`fare_media_name` を含めるべきであり、提供する組織が利用者向けに使用している名称と一致するべきです。 |
|  `fare_media_type` | Enum | **必須** | チケットメディアの種類。有効な選択肢は以下の通りです:<br><br>`0` - なし。運賃商品の購入や認証にチケットメディアが関与しない場合に使用します。例: 運転手や車掌に現金を支払い、物理的なチケットが提供されない場合。<br>`1` - 紙のチケット。あらかじめ購入した一定回数の便(trip)に乗車できる、または一定期間内に無制限に乗車できるもの。<br>`2` - 交通系カード。チケット、定期券、または金額が格納されている物理的なカード。<br>`3` - cEMV (非接触型 Europay, Mastercard, Visa)。アカウントベースのチケットシステムにおけるオープンループのトークンコンテナとして使用。<br>`4` - モバイルアプリ。仮想的な交通系カード、チケット、定期券、または金額が格納されているもの。|

### fare_products.txt {: #fare_productstxt}


ファイル: **任意**

主キー (`fare_product_id`, `rider_category_id`, `fare_media_id`)

乗客が購入可能な運賃の範囲、または複数の乗車区間(leg)を含む旅程(journey)における合計運賃を計算する際に考慮される運賃（例: 乗り継ぎ費用）を記述するために使用されます。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| `fare_product_id` | ID | **必須** | チケット商品を識別します。<br><br>`fare_product_id` が同じ複数のレコードを含めることができますが、それらは異なる `fare_media_id` または `rider_category_id` を持たなければなりません。異なる `fare_media_id` は、チケット商品を利用するための複数の方法（異なる価格の可能性あり）が存在することを示します。異なる `rider_category_id` は、複数の乗客カテゴリがそのチケット商品を利用可能であること（異なる価格の可能性あり）を示します。 |
| `fare_product_name` | Text | 任意 | 乗客に表示されるチケット商品の名称。 |
| `rider_category_id` | 外部ID（`rider_categories.rider_category_id` を参照） | 任意 | チケット商品を利用可能な乗客カテゴリを識別します。<br><br>`fare_products.rider_category_id` が空の場合、そのチケット商品はすべての `rider_category_id` に対して利用可能とみなされます。<br><br>1つの `fare_product_id` で指定されたチケット商品に複数の乗客カテゴリが利用可能な場合、それらのうち1つだけがデフォルトの乗客カテゴリ（`is_default_fare_category = 1`）として指定されなければなりません。 |
| `fare_media_id` | 外部ID（`fare_media.fare_media_id` を参照） | 任意 | 便(trip)の利用中にチケット商品を使用するために利用可能なチケットメディアを識別します。`fare_media_id` が空の場合、チケットメディアは不明とみなされます。 |
| `amount` | 通貨額 | **必須** | チケット商品の費用。乗り継ぎ割引を表すために負の値を取ることができます。無料のチケット商品を表すためにゼロを取ることができます。 |
| `currency` | 通貨コード | **必須** | チケット商品の費用の通貨。 |

### fare_leg_rules.txt {: #fare_leg_rulestxt}


ファイル: **任意**

主キー (`network_id, from_area_id, to_area_id, from_timeframe_group_id, to_timeframe_group_id, fare_product_id`)

個々の乗車区間(leg)に対する運賃ルール。

[`fare_leg_rules.txt`](#fare_leg_rulestxt) 内の運賃は、ファイル内のすべてのレコードをフィルタリングし、乗客が移動する乗車区間(leg)に一致するルールを見つけることで照会しなければなりません。

乗車区間(leg)の運賃を処理する手順:

1. [fare_leg_rules.txt](#fare_leg_rulestxt) を、移動の特性を定義する以下のフィールドでフィルタリングしなければなりません:
    - `fare_leg_rules.network_id`
    - `fare_leg_rules.from_area_id`
    - `fare_leg_rules.to_area_id`
    - `fare_leg_rules.from_timeframe_group_id`
    - `fare_leg_rules.to_timeframe_group_id`
<br/>

2. 乗車区間(leg)が移動の特性に基づいて [fare_leg_rules.txt](#fare_leg_rulestxt) 内のレコードと完全に一致する場合、そのレコードを処理して乗車区間(leg)の運賃を決定しなければなりません。このファイルは空のエントリを「空の意味」または `rule_priority` の2つの方法で処理します。
<br/>

3. 完全一致が見つからず、かつ `rule_priority` フィールドが存在しない場合、`fare_leg_rules.network_id`、`fare_leg_rules.from_area_id`、`fare_leg_rules.to_area_id` の空のエントリを確認して、乗車区間(leg)の運賃を処理しなければなりません:
    - `fare_leg_rules.network_id` が空の場合、[routes.txt](#routestxt) または [networks.txt](#networkstxt) で定義されたすべてのネットワークに対応します。ただし、`fare_leg_rules.network_id` に記載されているものは除きます。

    - `fare_leg_rules.from_area_id` が空の場合、`areas.area_id` で定義されたすべてのエリアに対応します。ただし、`fare_leg_rules.from_area_id` に記載されているものは除きます。
    - `fare_leg_rules.to_area_id` が空の場合、`areas.area_id` で定義されたすべてのエリアに対応します。ただし、`fare_leg_rules.to_area_id` に記載されているものは除きます。
<br/>

4. `rule_priority` フィールドが存在する場合:
    - `fare_leg_rules.network_id` が空の場合、その乗車区間(leg)のネットワークはこのルールの一致に影響しません。
    - `fare_leg_rules.from_area_id` が空の場合、その乗車区間(leg)の出発エリアはこのルールの一致に影響しません。
    - `fare_leg_rules.to_area_id` が空の場合、その乗車区間(leg)の到着エリアはこのルールの一致に影響しません。
<br/>
      
5. 上記のいずれのルールにも乗車区間(leg)が一致しない場合、その運賃は不明です。

<br/>

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| `leg_group_id` | ID | 任意 | [fare_leg_rules.txt](#fare_leg_rulestxt) 内のエントリのグループを識別します。<br><br>`fare_transfer_rules.from_leg_group_id` と `fare_transfer_rules.to_leg_group_id` の間の運賃乗り継ぎルールを記述するために使用されます。<br><br>[fare_leg_rules.txt](#fare_leg_rulestxt) 内の複数のエントリは同じ `fare_leg_rules.leg_group_id` に属することができます。<br><br>[fare_leg_rules.txt](#fare_leg_rulestxt) 内の同じエントリ（`fare_leg_rules.leg_group_id` を除く）は、複数の `fare_leg_rules.leg_group_id` に属してはいけません。|
| `network_id` | 外部ID `routes.network_id` または `networks.network_id` を参照 | 任意 | 運賃ルールが適用されるルートネットワークを識別します。<br><br>`rule_priority` フィールドが存在せず、フィルタリング対象の `network_id` に一致する `fare_leg_rules.network_id` が存在しない場合、空の `fare_leg_rules.network_id` がデフォルトで一致します。<br><br>`fare_leg_rules.network_id` が空の場合、[routes.txt](#routestxt) または [networks.txt](#networkstxt) で定義されたすべてのネットワークに対応します。ただし、`fare_leg_rules.network_id` に記載されているものは除きます。<br><br>ファイルに `rule_priority` フィールドが存在する場合、空の `fare_leg_rules.network_id` は、その乗車区間(leg)のネットワークがこのルールの一致に影響しないことを示します。<br><br>[複数の乗車区間からなる有効運賃区間](#fare_leg_join_rulestxt) と照合する場合、各乗車区間(leg)は同じ `network_id` を持たなければならず、その値が照合に使用されます。 |
| `from_area_id` | 外部ID `areas.area_id` を参照 | 任意 | 出発エリアを識別します。<br><br>`rule_priority` フィールドが存在せず、フィルタリング対象の `area_id` に一致する `fare_leg_rules.from_area_id` が存在しない場合、空の `fare_leg_rules.from_area_id` がデフォルトで一致します。<br><br>`fare_leg_rules.from_area_id` が空の場合、`areas.area_id` で定義されたすべてのエリアに対応します。ただし、`fare_leg_rules.from_area_id` に記載されているものは除きます。<br><br>ファイルに `rule_priority` フィールドが存在する場合、空の `fare_leg_rules.from_area_id` は、その乗車区間(leg)の出発エリアがこのルールの一致に影響しないことを示します。<br><br>[複数の乗車区間からなる有効運賃区間](#fare_leg_join_rulestxt) と照合する場合、有効運賃区間の最初の乗車区間(leg)が出発エリアの判定に使用されます。 |
| `to_area_id` | 外部ID `areas.area_id` を参照 | 任意 | 到着エリアを識別します。<br><br>`rule_priority` フィールドが存在せず、フィルタリング対象の `area_id` に一致する `fare_leg_rules.to_area_id` が存在しない場合、空の `fare_leg_rules.to_area_id` がデフォルトで一致します。<br><br>`fare_leg_rules.to_area_id` が空の場合、`areas.area_id` で定義されたすべてのエリアに対応します。ただし、`fare_leg_rules.to_area_id` に記載されているものは除きます。<br><br>ファイルに `rule_priority` フィールドが存在する場合、空の `fare_leg_rules.to_area_id` は、その乗車区間(leg)の到着エリアがこのルールの一致に影響しないことを示します。<br><br>[複数の乗車区間からなる有効運賃区間](#fare_leg_join_rulestxt) と照合する場合、有効運賃区間の最後の乗車区間(leg)が到着エリアの判定に使用されます。 |
| `from_timeframe_group_id` | 外部ID `timeframes.timeframe_group_id` を参照 | 任意 | 乗車区間(leg)の開始時における運賃認証イベントの時間枠を定義します。<br><br>乗車区間(leg)の「開始時刻」とは、そのイベントが予定されている時刻です。例えば、乗客が乗車して運賃を認証する乗車区間(leg)の開始地点におけるバスの出発予定時刻が該当します。以下のルール照合の意味論において、開始時刻は [timeframes.txt](#timeframestxt) の [ローカル時間の意味論](#timeframe-local-time-semantics) に従ってローカル時間で計算されます。必要に応じて、乗車区間(leg)の出発イベントの停留所等(stop)または駅がタイムゾーン解決に使用されるべきです。<br><br>`from_timeframe_group_id` を指定する運賃ルールは、[timeframes.txt](#timeframestxt) 内に以下の条件をすべて満たすレコードが少なくとも1つ存在する場合に、その乗車区間(leg)と一致します:<br>- `timeframe_group_id` の値が `from_timeframe_group_id` と等しい。<br>- レコードの `service_id` で識別される運行日集合に、乗車区間(leg)の開始時刻の「当日」が含まれている。<br>- 乗車区間(leg)の開始時刻の「時刻」が、レコードの `timeframes.start_time` 以上かつ `timeframes.end_time` 未満である。<br><br>`fare_leg_rules.from_timeframe_group_id` が空の場合、その乗車区間(leg)の開始時刻はこのルールの一致に影響しません。<br><br>[複数の乗車区間からなる有効運賃区間](#fare_leg_join_rulestxt) と照合する場合、有効運賃区間の最初の乗車区間(leg)が開始時の運賃認証イベントの判定に使用されます。 |
| `to_timeframe_group_id` | 外部ID `timeframes.timeframe_group_id` を参照 | 任意 | 乗車区間(leg)の終了時における運賃認証イベントの時間枠を定義します。<br><br>乗車区間(leg)の「終了時刻」とは、そのイベントが予定されている時刻です。例えば、乗客が降車して運賃を認証する乗車区間(leg)の終了地点におけるバスの到着予定時刻が該当します。以下のルール照合の意味論において、終了時刻は [timeframes.txt](#timeframestxt) の [ローカル時間の意味論](#timeframe-local-time-semantics) に従ってローカル時間で計算されます。必要に応じて、乗車区間(leg)の到着イベントの停留所等(stop)または駅がタイムゾーン解決に使用されるべきです。<br><br>`to_timeframe_group_id` を指定する運賃ルールは、[timeframes.txt](#timeframestxt) 内に以下の条件をすべて満たすレコードが少なくとも1つ存在する場合に、その乗車区間(leg)と一致します:<br>- `timeframe_group_id` の値が `to_timeframe_group_id` と等しい。<br>- レコードの `service_id` で識別される運行日集合に、乗車区間(leg)の終了時刻の「当日」が含まれている。<br>- 乗車区間(leg)の終了時刻の「時刻」が、レコードの `timeframes.start_time` 以上かつ `timeframes.end_time` 未満である。<br><br>`fare_leg_rules.to_timeframe_group_id` が空の場合、その乗車区間(leg)の終了時刻はこのルールの一致に影響しません。<br><br>[複数の乗車区間からなる有効運賃区間](#fare_leg_join_rulestxt) と照合する場合、有効運賃区間の最後の乗車区間(leg)が終了時の運賃認証イベントの判定に使用されます。 |
| `fare_product_id` | 外部ID `fare_products.fare_product_id` を参照 | **必須** | その乗車区間(leg)を移動するために必要なチケット商品。 |
| `rule_priority` | 非負整数 | 任意 | 乗車区間(leg)に適用されるルールの優先順位を定義し、特定のルールが他のルールより優先されるようにします。`fare_leg_rules.txt` 内の複数のエントリが一致する場合、`rule_priority` の値が最も高いルールまたはルール群が選択されます。<br><br>`rule_priority` が空の場合はゼロとして扱われます。 |

### fare_leg_join_rules.txt {: #fare_leg_join_rulestxt}


ファイル: **任意**

主キー (`from_network_id, to_network_id, from_stop_id, to_stop_id`)

乗り換えを伴う2つの連続する乗車区間(leg)の部分旅程(sub-journey)において、その乗り換えがファイル内の特定のレコードで指定されたすべての一致条件に合致する場合、それら2つの乗車区間は [`fare_leg_rules.txt`](#fare_leg_rulestxt) 内のルールと照合する際に、1つの **有効運賃区間(effective fare leg)** として扱うべきです。

- `from_stop_id` および `to_stop_id` によって明示的に上書きされない限り、乗り換え前の乗車区間の最終停留所等(stop)と、乗り換え後の乗車区間の最初の停留所等(stop)は、レコードにおいて同一でなければなりません。
- 特定のレコードにおいて一致条件のフィールド値が空白または未指定の場合、そのフィールドは照合の対象外とするべきです。
- 部分旅程(sub-journey)において、連続する乗り換えがそれぞれ結合ルールに一致する場合、その部分旅程全体を1つの **有効運賃区間(effective fare leg)** として扱うべきです。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| `from_network_id` | 外部ID。`routes.network_id` または `networks.network_id` を参照 | **必須** | 指定されたルート・路線系統(network)を使用する乗り換え前の乗車区間に一致します。指定する場合、同じ `to_network_id` も指定しなければなりません。 |
| `to_network_id` | 外部ID。`routes.network_id` または `networks.network_id` を参照 | **必須** | 指定されたルート・路線系統(network)を使用する乗り換え後の乗車区間に一致します。指定する場合、同じ `from_network_id` も指定しなければなりません。 |
| `from_stop_id` | 外部ID。`stops.stop_id` を参照 | **条件付き必須** | 指定された停留所等(`location_type=0` または空)または駅(`location_type=1`)で終了する乗り換え前の乗車区間に一致します。<br><br>条件付き必須:<br> - `to_stop_id` が定義されている場合は **必須**。<br> - それ以外の場合は任意。 |
| `to_stop_id` | 外部ID。`stops.stop_id` を参照 | **条件付き必須** | 指定された停留所等(`location_type=0` または空)または駅(`location_type=1`)で開始する乗り換え後の乗車区間に一致します。<br><br>条件付き必須:<br> - `from_stop_id` が定義されている場合は **必須**。<br> - それ以外の場合は任意。 |

### fare_transfer_rules.txt {: #fare_transfer_rulestxt}


ファイル: **任意**

主キー (`from_leg_group_id, to_leg_group_id, fare_product_id, transfer_count, duration_limit`)

[`fare_leg_rules.txt`](#fare_leg_rulestxt) で定義された乗車区間(leg)間の乗り換えに関する運賃ルール。

複数の乗車区間(leg)からなる旅程(journey)の運賃を処理する手順:

1. 乗客の旅程に基づき、`fare_leg_rules.txt` で定義された該当する有効運賃区間(effective fare leg)グループをすべての個別の乗車区間(leg)に対して決定します。
2. [fare_transfer_rules.txt](#fare_transfer_rulestxt) を、乗り換えの特性を定義する以下のフィールドでフィルタリングしなければなりません:
    - `fare_transfer_rules.from_leg_group_id`
    - `fare_transfer_rules.to_leg_group_id`<br/>
    <br/>

3. 乗り換えが [fare_transfer_rules.txt](#fare_transfer_rulestxt) のレコードと特性に基づいて完全に一致する場合、そのレコードを処理して乗り換えコストを決定しなければなりません。
4. 完全一致が見つからない場合、`from_leg_group_id` または `to_leg_group_id` が空のエントリを確認し、乗り換えコストを処理しなければなりません:
    - `fare_transfer_rules.from_leg_group_id` が空の場合、`fare_leg_rules.leg_group_id` で定義されたすべての乗車区間(leg)グループのうち、`fare_transfer_rules.from_leg_group_id` に記載されているものを除いたものに対応します。
    - `fare_transfer_rules.to_leg_group_id` が空の場合、`fare_leg_rules.leg_group_id` で定義されたすべての乗車区間(leg)グループのうち、`fare_transfer_rules.to_leg_group_id` に記載されているものを除いたものに対応します。<br/>
    <br/>
5. 上記のルールのいずれにも一致しない場合、乗り換えの取り決めは存在せず、乗車区間(leg)は別々のものとして扱われます。

<br/>

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| `from_leg_group_id` | `fare_leg_rules.leg_group_id` を参照する外部ID | 任意 | 乗り換え前の有効運賃区間(effective fare leg)ルールのグループを識別します。<br><br>`leg_group_id` をフィルタリングする際に一致する `fare_transfer_rules.from_leg_group_id` が存在しない場合、空の `fare_transfer_rules.from_leg_group_id` がデフォルトで一致します。<br><br>`fare_transfer_rules.from_leg_group_id` が空の場合、`fare_leg_rules.leg_group_id` で定義されたすべての乗車区間(leg)グループのうち、`fare_transfer_rules.from_leg_group_id` に記載されているものを除いたものに対応します。|
| `to_leg_group_id` | `fare_leg_rules.leg_group_id` を参照する外部ID | 任意 | 乗り換え後の有効運賃区間(effective fare leg)ルールのグループを識別します。<br><br>`leg_group_id` をフィルタリングする際に一致する `fare_transfer_rules.to_leg_group_id` が存在しない場合、空の `fare_transfer_rules.to_leg_group_id` がデフォルトで一致します。<br><br>`fare_transfer_rules.to_leg_group_id` が空の場合、`fare_leg_rules.leg_group_id` で定義されたすべての乗車区間(leg)グループのうち、`fare_transfer_rules.to_leg_group_id` に記載されているものを除いたものに対応します。 |
| `transfer_count` | 0以外の整数 | **条件付き禁止** | 乗り換えルールが適用される連続した乗り換えの回数を定義します。<br><br>有効な値は以下の通りです:<br>`-1` - 制限なし。<br>`1` 以上 - 乗り換えルールが適用される乗り換えの回数を定義。<br><br>部分旅程(sub-journey)が異なる `transfer_count` を持つ複数のレコードに一致する場合、現在の部分旅程の乗り換え回数以上で最小の `transfer_count` を持つルールを選択します。<br><br>条件付き禁止:<br>- **禁止**: `fare_transfer_rules.from_leg_group_id` が `fare_transfer_rules.to_leg_group_id` と等しくない場合。<br>- **必須**: `fare_transfer_rules.from_leg_group_id` が `fare_transfer_rules.to_leg_group_id` と等しい場合。 |
| `duration_limit` | 正の整数 | 任意 | 乗り換えの制限時間を定義します。<br><br>秒単位の整数で表さなければなりません。<br><br>制限時間がない場合、`fare_transfer_rules.duration_limit` は空でなければなりません。 |
| `duration_limit_type` | Enum | **条件付き必須** | `fare_transfer_rules.duration_limit` の相対的な開始と終了を定義します。<br><br>有効な値は以下の通りです:<br>`0` - 現在の乗車区間(leg)の出発時の運賃認証から次の乗車区間(leg)の到着時の運賃認証まで。<br>`1` - 現在の乗車区間(leg)の出発時の運賃認証から次の乗車区間(leg)の出発時の運賃認証まで。<br>`2` - 現在の乗車区間(leg)の到着時の運賃認証から次の乗車区間(leg)の出発時の運賃認証まで。<br>`3` - 現在の乗車区間(leg)の到着時の運賃認証から次の乗車区間(leg)の到着時の運賃認証まで。<br><br>条件付き必須:<br>- **必須**: `fare_transfer_rules.duration_limit` が定義されている場合。<br>- **禁止**: `fare_transfer_rules.duration_limit` が空の場合。 |
| `fare_transfer_type` | Enum | **必須** | 旅程(journey)内の乗車区間(leg)間の乗り換えにおけるコスト処理方法を示します: <br>![](../../assets/2-leg.svg) <br>有効な値は以下の通りです:<br>`0` - 乗り換え元の `fare_leg_rules.fare_product_id` + `fare_transfer_rules.fare_product_id`; A + AB。<br>`1` - 乗り換え元の `fare_leg_rules.fare_product_id` + `fare_transfer_rules.fare_product_id` + 乗り換え先の `fare_leg_rules.fare_product_id`; A + AB + B。<br>`2` - `fare_transfer_rules.fare_product_id`; AB。<br><br>旅程(journey)内の複数の乗り換えにおけるコスト処理の相互作用:<br>![](../../assets/3-leg.svg)<br><table><thead><tr><th>`fare_transfer_type`</th><th>A > B の処理</th><th>B > C の処理</th></tr></thead><tbody><tr><td>`0`</td><td>A + AB</td><td>S + BC</td></tr><tr><td>`1`</td><td>A + AB + B</td><td>S + BC + C</td></tr><tr><td>`2`</td><td>AB</td><td>S + BC</td></tr></tbody></table>ここで S は、直前の乗車区間(leg)および乗り換えの合計処理済みコストを示します。 |
| `fare_product_id` | `fare_products.fare_product_id` を参照する外部ID | 任意 | 2つの有効運賃区間(effective fare leg)間の乗り換えに必要なチケット商品。空の場合、乗り換えルールのコストは 0 です。|

### areas.txt {: #areastxt}


ファイル: **任意**

主キー (`area_id`)

エリア識別子を定義します。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| `area_id` | 一意のID | **必須** | エリアを識別します。[areas.txt](#areastxt) 内で一意でなければなりません。 |
| `area_name` | テキスト | **任意** | 乗客に表示されるエリアの名称です。 |

### stop_areas.txt {: #stop_areastxt}


ファイル: **任意**

主キー (`*`)

[stops.txt](#stopstxt) の停留所等(stop)をエリアに割り当てます。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| `area_id` | `areas.area_id` を参照する外部ID | **必須** | 複数の `stop_id` が属するエリアを識別します。同じ `stop_id` が複数の `area_id` に定義されることがあります。 |
| `stop_id` | `stops.stop_id` を参照する外部ID | **必須** | 停留所等(stop)を識別します。このフィールドに駅（すなわち `stops.location_type=1` の停留所等(stop)）が定義されている場合、その駅に属するすべてのプラットフォーム（すなわち、その駅を `stops.parent_station` として持つ `stops.location_type=0` のすべての停留所等(stop)）が同じエリアの一部であるとみなされます。この挙動は、プラットフォームを他のエリアに割り当てることで上書きすることができます。 |

### networks.txt {: #networkstxt}


ファイル: **条件付き禁止**

主キー (`network_id`)

有効運賃区間(effective fare leg)ルールに適用されるネットワーク識別子を定義します。 

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| `network_id` | 一意のID | **必須** | ネットワークを識別します。[networks.txt](#networkstxt) 内で一意でなければなりません。 |
| `network_name` | テキスト | **任意** | 事業者および乗客が使用する、有効運賃区間(effective fare leg)ルールに適用されるネットワークの名称です。 |

### route_networks.txt {: #route_networkstxt}


ファイル: **条件付き禁止**

主キー (`route_id`)

[routes.txt](#routestxt) のルート・路線系統(route)をネットワークに割り当てます。 

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| `network_id` | `networks.network_id` を参照する外部ID | **必須** | 1つまたは複数の `route_id` が属するネットワークを識別します。1つの `route_id` は1つの `network_id` にのみ定義することができます。 |
| `route_id` | `routes.route_id` を参照する外部ID | **必須** | ルート・路線系統(route)を識別します。 |

### shapes.txt {: #shapestxt}


ファイル: **任意**

主キー (`shape_id`, `shape_pt_sequence`)

Shape は、車両がルートの経路に沿って走行する経路を表し、shapes.txt ファイルで定義されます。Shape は便(trip)に関連付けられ、車両が通過する一連の点で構成されます。Shape は停留所等(stop)の位置を正確に通過する必要はありませんが、便(trip)上のすべての停留所等(stop)は、その便の shape から近い距離、すなわち shape の点を結ぶ直線区間の近くに存在するべきです。shapes.txt ファイルは、ゾーンベースのデマンド型サービスではなく、ルートベースのサービスに対して含めるべきです。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `shape_id` | ID | **必須** | shape を識別します。 |
|  `shape_pt_lat` | 緯度 | **必須** | shape の点の緯度。 [shapes.txt](#shapestxt) の各レコードは、shape を定義するために使用される shape の点を表します。 |
|  `shape_pt_lon` | 経度 | **必須** | shape の点の経度。 |
|  `shape_pt_sequence` | 非負整数 | **必須** | shape の点が接続されて shape を形成する順序。値は便(trip)に沿って増加しなければなりませんが、連続している必要はありません。<hr>*例: shape "A_shp" が3つの点で定義されている場合、[shapes.txt](#shapestxt) ファイルには次のレコードが含まれる可能性があります:* <br> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence` <br> `A_shp,37.61956,-122.48161,0` <br> `A_shp,37.64430,-122.41070,6` <br> `A_shp,37.65863,-122.30839,11` |
|  `shape_dist_traveled` | 非負浮動小数点数 | 任意 | 最初の shape の点から、このレコードで指定された点までの shape に沿った実際の走行距離。経路検索システムが地図上に shape の正しい部分を表示するために使用されます。値は `shape_pt_sequence` に従って増加しなければなりません。ルート上を逆方向に走行することを示すために使用してはいけません。距離の単位は [stop_times.txt](#stop_timestxt) で使用される単位と一致しなければなりません。<br><br>ループやインライン（車両が1つの便で同じ経路の一部を横断または通過する場合）があるルートに推奨されます。<br><img src="../../../assets/inlining.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;"> <br>車両が便の途中でルートの経路を再走行または横断する場合、`shape_dist_traveled` は [shapes.txt](#shapestxt) の点が [stop_times.txt](#stop_timestxt) のレコードとどのように対応するかを明確にするために重要です。<hr>*例: バスが上記で定義された A_shp の3つの点に沿って走行する場合、追加の `shape_dist_traveled` の値（ここではキロメートル単位）は次のようになります:* <br> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled`<br>`A_shp,37.61956,-122.48161,0,0`<br>`A_shp,37.64430,-122.41070,6,6.8310` <br> `A_shp,37.65863,-122.30839,11,15.8765` |

### frequencies.txt {: #frequenciestxt}


ファイル: **任意**

主キー (`trip_id`, `start_time`)

[Frequencies.txt](#frequenciestxt) は、一定の運行間隔（便間の時間）で運行される便(trip)を表します。このファイルは、2種類のサービスを表すために使用することができます。

* 頻度ベースのサービス (`exact_times`=`0`)：1日の間に固定された時刻表に従わないサービスです。代わりに、事業者は便の運行間隔を厳密に維持するよう努めます。
* 時刻表ベースのサービスの圧縮表現 (`exact_times`=`1`)：指定された時間帯において、便の運行間隔が常に同一であるサービスです。時刻表ベースのサービスでは、事業者は時刻表を厳密に遵守するよう努めます。


| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `trip_id` | `trips.trip_id` を参照する外部ID | **必須** | 指定された運行間隔が適用される便(trip)を識別します。 |
|  `start_time` | 時刻 | **必須** | 指定された運行間隔で、最初の車両が便(trip)の最初の停留所等(stop)を出発する時刻です。 |
|  `end_time` | 時刻 | **必須** | 便(trip)の最初の停留所等(stop)において、運行間隔が変更される（または終了する）時刻です。 |
|  `headway_secs` | 正の整数 | **必須** | `start_time` と `end_time` で指定された時間帯において、同じ停留所等(stop)からの出発間隔（運行間隔）を秒単位で表します。同じ便(trip)に対して複数の運行間隔を定義することができますが、重複してはいけません。新しい運行間隔は、前の運行間隔が終了する時刻と同時に開始することができます。 |
|  `exact_times` | Enum | **任意** | 便(trip)のサービスの種類を示します。詳細はファイルの説明を参照してください。有効な値は以下の通りです:<br><br>`0` または空 - 頻度ベースの便。<br>`1` - 1日の間、常に同一の運行間隔を持つ時刻表ベースの便。この場合、`end_time` の値は、最後に運行したい便の `start_time` より大きく、かつ最後に運行したい便の `start_time` + `headway_secs` より小さくなければなりません。 |

### transfers.txt {: #transferstxt}


ファイル: **任意**

主キー (`from_stop_id`, `to_stop_id`, `from_trip_id`, `to_trip_id`, `from_route_id`, `to_route_id`)

旅程(journey)を計算する際、GTFS を利用するアプリケーションは、許容される時間や停留所等(stop)の近接性に基づいて乗り換えを補間します。[Transfers.txt](#transferstxt) は、特定の乗り換えに関する追加ルールや上書きを指定します。

`from_trip_id`、`to_trip_id`、`from_route_id`、`to_route_id` のフィールドは、乗り換えルールに対してより高い特異性を持たせることができます。`from_stop_id` および `to_stop_id` と合わせて、特異性の順位は以下の通りです。

1. 両方の `trip_id` が定義されている場合: `from_trip_id` と `to_trip_id`。
2. 1つの `trip_id` と 1つの `route_id` が定義されている場合: (`from_trip_id` と `to_route_id`) または (`from_route_id` と `to_trip_id`)。
3. 1つの `trip_id` が定義されている場合: `from_trip_id` または `to_trip_id`。
4. 両方の `route_id` が定義されている場合: `from_route_id` と `to_route_id`。
5. 1つの `route_id` が定義されている場合: `from_route_id` または `to_route_id`。
6. `from_stop_id` と `to_stop_id` のみが定義されている場合: route または trip に関連するフィールドは設定されていない。

到着便と出発便の順序付きペアに対して、これら2つの便の間に適用される最も特異性の高い乗り換えが選択されます。任意の便のペアに対して、同等に最大の特異性を持つ2つの乗り換えが適用されることがあってはなりません。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `from_stop_id` | `stops.stop_id` を参照する外部ID | **条件付き必須** | route 間の接続が始まる停留所等(stop) (`location_type=0`) または駅 (`location_type=1`) を識別します。このフィールドが駅を参照する場合、乗り換えルールはその子停留所等すべてに適用されます。`transfer_type` が `4` または `5` の場合は、停留所等(stop) (`location_type=0`) を参照しなければなりません。<br><br>条件付き必須:<br>- `transfer_type` が `1`、`2`、`3` の場合は **必須**。<br>- `transfer_type` が `4` または `5` の場合は任意。 |
|  `to_stop_id` | `stops.stop_id` を参照する外部ID | **条件付き必須** | route 間の接続が終わる停留所等(stop) (`location_type=0`) または駅 (`location_type=1`) を識別します。このフィールドが駅を参照する場合、乗り換えルールはその子停留所等すべてに適用されます。`transfer_type` が `4` または `5` の場合は、停留所等(stop) (`location_type=0`) を参照しなければなりません。<br><br>条件付き必須:<br>- `transfer_type` が `1`、`2`、`3` の場合は **必須**。<br>- `transfer_type` が `4` または `5` の場合は任意。 |
| `from_route_id`  | `routes.route_id` を参照する外部ID | 任意 | 接続が始まる route を識別します。<br><br>`from_route_id` が定義されている場合、乗り換えは指定された `from_stop_id` におけるその route 上の到着便に適用されます。<br><br>`from_trip_id` と `from_route_id` の両方が定義されている場合、`trip_id` は `route_id` に属していなければならず、`from_trip_id` が優先されます。 |
| `to_route_id`  | `routes.route_id` を参照する外部ID | 任意 | 接続が終わる route を識別します。<br><br>`to_route_id` が定義されている場合、乗り換えは指定された `to_stop_id` におけるその route 上の出発便に適用されます。<br><br>`to_trip_id` と `to_route_id` の両方が定義されている場合、`trip_id` は `route_id` に属していなければならず、`to_trip_id` が優先されます。 |
| `from_trip_id`  | `trips.trip_id` を参照する外部ID | **条件付き必須** | route 間の接続が始まる便を識別します。<br><br>`from_trip_id` が定義されている場合、乗り換えは指定された `from_stop_id` における到着便に適用されます。<br><br>`from_trip_id` と `from_route_id` の両方が定義されている場合、`trip_id` は `route_id` に属していなければならず、`from_trip_id` が優先されます。<br><br>条件付き必須:<br>- `transfer_type` が `4` または `5` の場合は **必須**。<br>- それ以外は任意。 |
| `to_trip_id`  | `trips.trip_id` を参照する外部ID | **条件付き必須** | route 間の接続が終わる便を識別します。<br><br>`to_trip_id` が定義されている場合、乗り換えは指定された `to_stop_id` における出発便に適用されます。<br><br>`to_trip_id` と `to_route_id` の両方が定義されている場合、`trip_id` は `route_id` に属していなければならず、`to_trip_id` が優先されます。<br><br>条件付き必須:<br>- `transfer_type` が `4` または `5` の場合は **必須**。<br>- それ以外は任意。 |
|  `transfer_type` | Enum | **必須** | 指定された (`from_stop_id`, `to_stop_id`) ペアに対する接続の種類を示します。有効なオプションは以下の通りです:<br><br> `0` または空 - route 間の推奨乗り換え地点。<br>`1` - 2つの route 間の時刻調整された乗り換え地点。出発する車両は到着する車両を待つことが期待され、乗客が route 間を乗り換えるのに十分な時間を確保します。<br>`2` - 接続を保証するために、到着と出発の間に最小限の時間が必要です。必要な乗り換え時間は `min_transfer_time` で指定されます。<br>`3` - この場所では route 間の乗り換えは不可能です。<br>`4` - 乗客は同じ車両に乗り続けることで、ある便から別の便に乗り換えることができます（「車内乗り換え」）。この種類の乗り換えの詳細は[下記](#linked-trips)を参照してください。<br>`5` - 連続する便の間で車内乗り換えは許可されません。乗客は車両を降りて再乗車しなければなりません。この種類の乗り換えの詳細は[下記](#linked-trips)を参照してください。 |
|  `min_transfer_time` | 非負整数 | 任意 | 指定された停留所等(stop)において route 間の乗り換えを可能にするために必要な時間（秒単位）。`min_transfer_time` は、典型的な乗客が2つの停留所等間を移動するのに十分であり、各 route の時刻表の変動を考慮した余裕時間を含むべきです。 |

#### 連結された便(linked trips) {: #linked-trips}


以下は、便を連結するために使用される `transfer_type=4` および `=5` に適用されます。これには、座席に座ったままの乗り継ぎがある場合とない場合の両方が含まれます。

連結された便は、同じ車両によって運行されなければなりません。その車両は、他の車両と連結または切り離されることがあります。

連結された便の乗り継ぎと `block_id` の両方が指定され、矛盾する結果を生じる場合は、連結された便の乗り継ぎが使用されなければなりません。

`from_trip_id` の最終停留所(stop)は、`to_trip_id` の最初の停留所(stop)に地理的に近いべきです。また、`from_trip_id` の最終到着時刻は、`to_trip_id` の最初の出発時刻より前で、かつ近いべきです。`to_trip_id` の便が翌運行日(service day)に発生する場合には、`from_trip_id` の最終到着時刻が `to_trip_id` の最初の出発時刻より遅くなることがあります。 

便は通常 1対1 で連結することができますが、より複雑な便の継続を表現するために、1対n、n対1、または n対n で連結することもできます。例えば、2つの列車便（下図の便Aと便B）が、共通の駅での車両連結操作後に1つの列車便（便C）に統合される場合です。

- 1対n の継続では、各 `to_trip_id` の `trips.service_id` は同一でなければなりません。
- n対1 の継続では、各 `from_trip_id` の `trips.service_id` は同一でなければなりません。
- n対n の継続では、両方の制約を満たさなければなりません。
- 便は複数の異なる継続の一部として連結することができますが、その場合 `trip.service_id` はいかなる運行日(service day)においても重複してはいけません。 

<pre>
便A
───────────────────\
                    \    便C
                     ─────────────
便B                 /
───────────────────/
</pre>

### pathways.txt {: #pathwaystxt}


ファイル: **任意**

主キー (`pathway_id`)

[pathways.txt](#pathwaystxt) と [levels.txt](#levelstxt) ファイルは、ノードを位置、エッジを構内通路(pathway)として表現するグラフ表現を用いて、地下鉄や鉄道駅を記述します。

駅の出入口（`location_type=2` で表される位置のノード）からプラットフォーム（`location_type=0` または空で表される位置のノード）へ移動する際、乗客は通路、改札口、階段などのエッジ（構内通路(pathway)として表現されるもの）を通過します。汎用ノード（`location_type=3` で表されるノード）は、駅構内の通路を接続するために使用することができます。

構内通路(pathway)は駅内で網羅的に定義しなければなりません。もし一部の構内通路が定義されている場合、その駅内のすべての構内通路が表現されているとみなされます。したがって、以下のガイドラインが適用されます。

- 孤立した位置を作らない: 駅内の任意の位置に構内通路がある場合、その駅内のすべての位置に構内通路が存在するべきです。ただし、乗車エリア（`location_type=4`、下記ガイドライン参照）を持つプラットフォームは例外です。
- 乗車エリアを持つプラットフォームには構内通路を設定しない: 乗車エリア（`location_type=4`）を持つプラットフォーム（`location_type=0` または空）は、点ではなく親オブジェクトとして扱われます。この場合、プラットフォーム自体に構内通路を割り当ててはいけません。すべての構内通路はプラットフォームの各乗車エリアに割り当てるべきです。
- 閉じられたプラットフォームを作らない: 各プラットフォーム（`location_type=0` または空）または乗車エリア（`location_type=4`）は、構内通路の連鎖を通じて少なくとも1つの出入口（`location_type=2`）に接続されなければなりません。特定のプラットフォームから駅外に通じる構内通路が存在しない駅は稀です。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `pathway_id` | 一意のID | **必須** | 構内通路を識別します。システムがレコードの内部識別子として使用します。データセット内で一意でなければなりません。<br><br>異なる構内通路が同じ `from_stop_id` と `to_stop_id` を持つことがあります。<hr>_例: 上りと下りのエスカレーターが並んでいる場合、または階段とエレベーターが同じ場所を結んでいる場合、異なる `pathway_id` が同じ `from_stop_id` と `to_stop_id` を持つことがあります。_|
|  `from_stop_id` | 外部ID（`stops.stop_id` を参照） | **必須** | 構内通路の始点となる位置。<br><br>`stop_id` には、プラットフォーム（`location_type=0` または空）、出入口（`location_type=2`）、汎用ノード（`location_type=3`）、または乗車エリア（`location_type=4`）を識別する値を含めなければなりません。<br><br>駅（`location_type=1`）を識別する `stop_id` の値は使用してはいけません。|
|  `to_stop_id` | 外部ID（`stops.stop_id` を参照） | **必須** | 構内通路の終点となる位置。<br><br>`stop_id` には、プラットフォーム（`location_type=0` または空）、出入口（`location_type=2`）、汎用ノード（`location_type=3`）、または乗車エリア（`location_type=4`）を識別する値を含めなければなりません。<br><br>駅（`location_type=1`）を識別する `stop_id` の値は使用してはいけません。|
|  `pathway_mode` | 列挙型 | **必須** | 指定された (`from_stop_id`, `to_stop_id`) 間の構内通路の種類。 有効な選択肢は以下の通りです:<br><br>`1` - 通路。<br>`2` - 階段。<br>`3` - 動く歩道。<br>`4` - エスカレーター。<br>`5` - エレベーター。<br>`6` - 改札口（または支払いゲート）: 支払い証明が必要な駅エリアに入る構内通路。改札口は、駅の有料エリアと無料エリアを分けたり、同じ駅内の異なる有料エリアを分けたりします。この情報は、乗客に不要な支払いを強いる経路（例: 地下鉄のプラットフォームを通ってバス乗り場に行かせる経路）を避けるために使用できます。<br>`7` - 出口ゲート: 有料エリアから無料エリアに出る構内通路で、通過に支払い証明は不要です。|
|  `is_bidirectional` | 列挙型 | **必須** | 構内通路の通行方向を示します:<br><br>`0` - 一方向通路。`from_stop_id` から `to_stop_id` のみ通行可能。<br>`1` - 双方向通路。両方向に通行可能。<br><br>出口ゲート（`pathway_mode=7`）は双方向にしてはいけません。|
| `length` | 非負の浮動小数点数 | 任意 | 構内通路の水平距離（メートル単位）。始点は `from_stop_id`、終点は `to_stop_id` で定義されます。<br><br>このフィールドは通路（`pathway_mode=1`）、改札口（`pathway_mode=6`）、出口ゲート（`pathway_mode=7`）に推奨されます。|
| `traversal_time` | 正の整数 | 任意 | 構内通路を通過するのに必要な平均時間（秒単位）。始点は `from_stop_id`、終点は `to_stop_id` で定義されます。<br><br>このフィールドは動く歩道（`pathway_mode=3`）、エスカレーター（`pathway_mode=4`）、エレベーター（`pathway_mode=5`）に推奨されます。|
| `stair_count` | 非NULL整数 | 任意 | 構内通路の階段の段数。<br><br>正の `stair_count` は `from_stop_id` から `to_stop_id` へ上ることを意味します。負の `stair_count` は `from_stop_id` から `to_stop_id` へ下ることを意味します。<br><br>このフィールドは階段（`pathway_mode=2`）に推奨されます。<br><br>推定段数しか提供できない場合、1階あたり約15段とすることが推奨されます。|
| `max_slope` | 浮動小数点数 | 任意 | 構内通路の最大傾斜比。 有効な選択肢は以下の通りです:<br><br>`0` または空 - 傾斜なし。<br>`Float` - 構内通路の傾斜比。正は上り、負は下り。<br><br>このフィールドは通路（`pathway_mode=1`）および動く歩道（`pathway_mode=3`）でのみ使用するべきです。<hr>_例: 米国では、手動車椅子の最大傾斜比は0.083（8.3%）で、1mごとに0.083m（8.3cm）上昇することを意味します。_|
| `min_width` | 正の浮動小数点数 | 任意 | 構内通路の最小幅（メートル単位）。<br><br>最小幅が1メートル未満の場合、このフィールドを設定することが推奨されます。|
| `signposted_as` | テキスト | 任意 | 乗客に見える物理的な案内標識に記載された公開向けテキスト。<br><br>乗客に案内を提供するために使用することができます（例: 「案内標識に従って進む」など）。`signposted_as` のテキストは標識に印刷されている通りに記載するべきです。<br><br>物理的な標識が多言語の場合、このフィールドは `stops.stop_name` の例に従い、`feed_info.feed_lang` のフィールド定義に基づいて翻訳して入力することができます。|
| `reversed_signposted_as` | テキスト | 任意 | `signposted_as` と同様ですが、構内通路を `to_stop_id` から `from_stop_id` へ利用する場合に使用します。|

### levels.txt {: #levelstxt}


ファイル: **条件付き必須**

主キー (`level_id`)

駅における階層を記述します。[pathways.txt](#pathwaystxt) と併せて利用すると便利です。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `level_id` | 一意のID | **必須** | 駅における階層を識別します。|
|  `level_index` | 浮動小数点数 | **必須** | 階層の相対的な位置を示す数値インデックス。<br><br>地上階はインデックス `0` とし、地上より上の階は正のインデックス、地下階は負のインデックスで表します。|
|  `level_name` | テキスト | 任意 | 建物や駅内で乗客が目にする階層の名称。<hr>_例: エレベーターで「中二階(Mezzanine)」「プラットフォーム(Platform)」「-1」へ移動する。_|

### location_groups.txt {: #location_groupstxt}


ファイル: **任意**

主キー (`location_group_id`)

乗客が乗車または降車を要求できる停留所等(stop)のグループを定義します。

| フィールド名 | 型 | 出現 | 説明 |
| ---------- | ---- | ------------ | ----------- |
| `location_group_id` | 一意のID | **必須** | ロケーショングループを識別します。IDはすべての `stops.stop_id`、locations.geojson の `id`、および `location_groups.location_group_id` の値の中で一意でなければなりません。<br><br>ロケーショングループは、乗客が乗車または降車を要求できる場所を示す停留所等(stop)のグループです。 | 
| `location_group_name` | テキスト | 任意 | 乗客に表示されるロケーショングループの名称です。 |

### location_group_stops.txt {: #location_group_stopstxt}


ファイル: **任意**

主キー (`*`)

stops.txt に含まれる停留所等(stop)をロケーショングループに割り当てます。

| フィールド名 | 型 | 出現 | 説明 |
| ---------- | ---- | ------------ | ----------- |
| `location_group_id` | `location_groups.location_group_id` を参照する外部ID | **必須** | 1つまたは複数の `stop_id` が属するロケーショングループを識別します。同じ `stop_id` は複数の `location_group_id` に定義することができます。 | 
| `stop_id` | `stops.stop_id` を参照する外部ID | **必須** | ロケーショングループに属する停留所等(stop)を識別します。 |

### locations.geojson {: #locationsgeojson}


ファイル: **任意**

乗客がデマンド型サービスによる乗車または降車をリクエストできるゾーンを定義します。これらのゾーンは GeoJSON ポリゴンとして表現されます。

- このファイルは [RFC 7946](https://tools.ietf.org/html/rfc7946) で記述されている GeoJSON フォーマットのサブセットを使用します。
- 各ポリゴンは [OpenGIS Simple Features Specification, section 6.1.11](http://www.opengis.net/doc/is/sfa/1.2.1) の定義に従って有効でなければなりません。
- `locations.geojson` ファイルは `FeatureCollection` を含まなければなりません。
- `FeatureCollection` は、乗客が乗車または降車をリクエストできるさまざまな停留所等(stop)の位置を定義します。
- すべての GeoJSON `Feature` は `id` を持たなければなりません。`id` はすべての `stops.stop_id`、locations.geojson の `id`、および `location_group_id` の値全体で一意でなければなりません。
- すべての GeoJSON `Feature` は、以下の表に従ってオブジェクトと関連するキーを持つべきです。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| -&nbsp;`type` | String | **必須** | ロケーションの `"FeatureCollection"`。 |
| -&nbsp;`features` | Array | **必須** | ロケーションを記述する `"Feature"` オブジェクトのコレクション。 |
| &nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp;`type` | String | **必須** | `"Feature"` |
| &nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp;`id` | String | **必須** | ロケーションを識別します。ID はすべての `stops.stop_id`、locations.geojson の `id`、および `location_groups.location_group_id` の値全体で一意でなければなりません。 |
| &nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp;`properties` | Object | **必須** | ロケーションのプロパティキー。 |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp;`stop_name` | String | 任意 | 乗客に表示されるロケーションの名称を示します。 |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp;`stop_desc` | String | 任意 | 乗客の位置把握を助けるロケーションの意味のある説明。 |
| &nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp;`geometry` | Object | **必須** | ロケーションのジオメトリ。 |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp;`type` | String | **必須** | 以下の型でなければなりません:<br>-&nbsp;`"Polygon"`<br>-&nbsp;`"MultiPolygon"` |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp;`coordinates` | Array | **必須** | ロケーションのジオメトリを定義する地理座標（緯度と経度）。 |

### booking_rules.txt {: #booking_rulestxt}


ファイル: **任意**

主キー (`booking_rule_id`)

乗客がリクエストするサービスの予約ルールを定義します。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
| `booking_rule_id` | 一意のID | **必須** | ルールを識別します。 |
| `booking_type` | Enum | **必須** | どの程度前に予約が可能かを示します。有効なオプションは以下の通りです:<br><br>`0` - リアルタイム予約。<br>`1` - 当日予約（事前通知あり）。<br>`2` - 前日までの予約。 |
| `prior_notice_duration_min` | 整数 | **条件付き必須** | 旅行前にリクエストを行うための最小分数。<br><br>**条件付き必須**:<br>- `booking_type=1` の場合は **必須**。<br>- それ以外の場合は **禁止**。 |
| `prior_notice_duration_max` | 整数 | **条件付き禁止** | 旅行前に予約リクエストを行うための最大分数。<br><br>**条件付き禁止**:<br>- `booking_type=0` および `booking_type=2` の場合は **禁止**。<br>- `booking_type=1` の場合は任意。|
| `prior_notice_last_day` | 整数 | **条件付き必須** | 旅行前に予約リクエストを行う最終日。<br><br>例: 「乗車は1日前の午後5時までに予約する必要がある」は `prior_notice_last_day=1` としてエンコードされます。<br><br>**条件付き必須**:<br>- `booking_type=2` の場合は **必須**。<br>- それ以外の場合は **禁止**。 |
| `prior_notice_last_time` | 時刻 | **条件付き必須** | 旅行前の最終日に予約リクエストを行う最終時刻。<br><br>例: 「乗車は1日前の午後5時までに予約する必要がある」は `prior_notice_last_time=17:00:00` としてエンコードされます。<br><br>**条件付き必須**:<br>- `prior_notice_last_day` が定義されている場合は **必須**。<br>- それ以外の場合は **禁止**。 |
| `prior_notice_start_day` | 整数 | **条件付き禁止** | 旅行前に予約リクエストを行う最も早い日。<br><br>例: 「乗車は最も早く1週間前の午前0時から予約可能」は `prior_notice_start_day=7` としてエンコードされます。<br><br>**条件付き禁止**:<br>- `booking_type=0` の場合は **禁止**。<br>- `booking_type=1` で `prior_notice_duration_max` が定義されている場合は **禁止**。<br>- それ以外の場合は任意。 |
| `prior_notice_start_time` | 時刻 | **条件付き必須** | 旅行前の最も早い日に予約リクエストを行う最も早い時刻。<br><br>例: 「乗車は最も早く1週間前の午前0時から予約可能」は `prior_notice_start_time=00:00:00` としてエンコードされます。<br><br>**条件付き必須**:<br>- `prior_notice_start_day` が定義されている場合は **必須**。<br>- それ以外の場合は **禁止**。 |
| `prior_notice_service_id` | `calendar.service_id` を参照する外部ID | **条件付き禁止** | `prior_notice_last_day` または `prior_notice_start_day` が数えられる運行日(service day)を示します。<br><br>例: 空の場合、`prior_notice_start_day=2` は2暦日前を意味します。平日のみ（休日を除く）を含む `service_id` が定義されている場合、`prior_notice_start_day=2` は2営業日前を意味します。<br><br>**条件付き禁止**:<br>- `booking_type=2` の場合は任意。<br>- それ以外の場合は **禁止**。 |
| `message` | テキスト | 任意 | オンデマンドの乗降予約を行う際に、`stop_time` でサービスを利用する乗客に表示されるメッセージ。乗客がサービスを利用するために取るべき行動について、ユーザーインターフェース内で伝達される最小限の情報を提供することを目的としています。 |
| `pickup_message` | テキスト | 任意 | `message` と同様に機能しますが、オンデマンドの乗車のみの場合に使用されます。 |
| `drop_off_message` | テキスト | 任意 | `message` と同様に機能しますが、オンデマンドの降車のみの場合に使用されます。 |
| `phone_number` | 電話番号 | 任意 | 予約リクエストを行うために電話をかける番号。 |
| `info_url` | URL | 任意 | 予約ルールに関する情報を提供するURL。 |
| `booking_url` | URL | 任意 | 予約リクエストを行うことができるオンラインインターフェースまたはアプリのURL。 |

### translations.txt {: #translationstxt}


ファイル: **任意**

主キー (`table_name`, `field_name`, `language`, `record_id`, `record_sub_id`, `field_value`)

複数の公用語を持つ地域では、交通事業者は通常、言語ごとに異なる名称やウェブページを持っています。そのような地域の乗客に最適に対応するために、データセットにこれらの言語依存の値を含めることは有用です。

同じ値を翻訳する際に、`record_id`, `record_sub_id` を用いた参照方法と `field_value` を用いた参照方法の両方が2つの異なる行で使用された場合、(`record_id`, `record_sub_id`) による翻訳が優先されます。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `table_name` | Enum | **必須** | 翻訳対象のフィールドを含むテーブルを定義します。許可される値は以下の通りです:<br><br>- `agency`<br>- `stops`<br>- `routes`<br>- `trips`<br>- `stop_times`<br>- `pathways`<br>- `levels`<br>- `feed_info`<br>- `attributions`<br><br> GTFS に追加される任意のファイルは、上記のリストにあるファイル名（拡張子 `.txt` を除く）と同じ `table_name` 値を持ちます。 |
|  `field_name` | Text | **必須** | 翻訳対象のフィールド名。型が `Text` のフィールドは翻訳可能です。型が `URL`、`Email`、`Phone number` のフィールドも、適切な言語でのリソースを提供するために「翻訳」することができます。それ以外の型のフィールドは翻訳するべきではありません。 |
|  `language` | 言語コード | **必須** | 翻訳の言語。<br><br>`feed_info.feed_lang` と同じ言語の場合、そのフィールドの元の値は、特定の翻訳が存在しない言語で使用されるデフォルト値と見なされます（`default_lang` が別途指定されていない場合）。<hr>_例: スイスでは、公用語が2つある州の都市は公式には “Biel/Bienne” と呼ばれますが、フランス語では “Bienne”、ドイツ語では “Biel” と呼ばれます。_ |
|  `translation` | Text または URL または Email または Phone number | **必須** | 翻訳された値。 |
|  `record_id` | 外部ID | **条件付き必須** | 翻訳対象のフィールドに対応するレコードを定義します。`record_id` の値は、各テーブルの主キーの最初のフィールドまたは唯一のフィールドでなければなりません。以下に定義します:<br><br>- [agency.txt](#agencytxt) の場合は `agency_id`<br>- [stops.txt](#stopstxt) の場合は `stop_id`<br>- [routes.txt](#routestxt) の場合は `route_id`<br>- [trips.txt](#tripstxt) の場合は `trip_id`<br>- [stop_times.txt](#stop_timestxt) の場合は `trip_id`<br>- [pathways.txt](#pathwaystxt) の場合は `pathway_id`<br>- [levels.txt](#levelstxt) の場合は `level_id`<br>- [attributions.txt](#attributionstxt) の場合は `attribution_id`<br><br>上記に定義されていないテーブルのフィールドは翻訳するべきではありません。ただし、プロデューサーが公式仕様外の追加フィールドを加える場合があり、それらの非公式フィールドは翻訳可能です。その場合の推奨される `record_id` の使用方法は以下の通りです:<br><br>- [calendar.txt](#calendartxt) の場合は `service_id`<br>- [calendar_dates.txt](#calendar_datestxt) の場合は `service_id`<br>- [fare_attributes.txt](#fare_attributestxt) の場合は `fare_id`<br>- [fare_rules.txt](#fare_rulestxt) の場合は `fare_id`<br>- [shapes.txt](#shapestxt) の場合は `shape_id`<br>- [frequencies.txt](#frequenciestxt) の場合は `trip_id`<br>- [transfers.txt](#transferstxt) の場合は `from_stop_id`<br><br>条件付き必須:<br>- `table_name` が `feed_info` の場合は **禁止**。<br>- `field_value` が定義されている場合は **禁止**。<br>- `field_value` が空の場合は **必須**。 |
|  `record_sub_id` | 外部ID | **条件付き必須** | テーブルに一意のIDが存在しない場合に、翻訳対象のフィールドを含むレコードを特定するために使用します。`record_sub_id` の値は、以下のテーブルで定義される二次IDです:<br><br>- [agency.txt](#agencytxt) の場合はなし<br>- [stops.txt](#stopstxt) の場合はなし<br>- [routes.txt](#routestxt) の場合はなし<br>- [trips.txt](#tripstxt) の場合はなし<br>- [stop_times.txt](#stop_timestxt) の場合は `stop_sequence`<br>- [pathways.txt](#pathwaystxt) の場合はなし<br>- [levels.txt](#levelstxt) の場合はなし<br>- [attributions.txt](#attributionstxt) の場合はなし<br><br>上記に定義されていないテーブルのフィールドは翻訳するべきではありません。ただし、プロデューサーが公式仕様外の追加フィールドを加える場合があり、それらの非公式フィールドは翻訳可能です。その場合の推奨される `record_sub_id` の使用方法は以下の通りです:<br><br>- [calendar.txt](#calendartxt) の場合はなし<br>- [calendar_dates.txt](#calendar_datestxt) の場合は `date`<br>- [fare_attributes.txt](#fare_attributestxt) の場合はなし<br>- [fare_rules.txt](#fare_rulestxt) の場合は `route_id`<br>- [shapes.txt](#shapestxt) の場合はなし<br>- [frequencies.txt](#frequenciestxt) の場合は `start_time`<br>- [transfers.txt](#transferstxt) の場合は `to_stop_id`<br><br>条件付き必須:<br>- `table_name` が `feed_info` の場合は **禁止**。<br>- `field_value` が定義されている場合は **禁止**。<br>- `table_name=stop_times` かつ `record_id` が定義されている場合は **必須**。 |
|  `field_value` | Text または URL または Email または Phone number | **条件付き必須** | `record_id` と `record_sub_id` を使用して翻訳対象のレコードを定義する代わりに、このフィールドを使用して翻訳対象の値を定義することができます。使用する場合、`table_name` と `field_name` で特定されるフィールドが `field_value` に定義された値と完全に一致する場合に翻訳が適用されます。<br><br>フィールドは `field_value` に定義された値と**完全に**一致しなければなりません。部分的に一致するだけでは翻訳は適用されません。<br><br>同じレコードに対して2つの翻訳ルールが一致する場合（1つは `field_value`、もう1つは `record_id`）、`record_id` を持つルールが優先されます。<br><br>条件付き必須:<br>- `table_name` が `feed_info` の場合は **禁止**。<br>- `record_id` が定義されている場合は **禁止**。<br>- `record_id` が空の場合は **必須**。 |

### feed_info.txt {: #feed_infotxt}


ファイル: **条件付き必須**

主キー (なし)

このファイルには、データセットが記述するサービスではなく、データセット自体に関する情報が含まれます。場合によっては、データセットの発行者が事業者とは異なる組織であることもあります。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `feed_publisher_name` | Text | **必須** | データセットを発行する組織の正式名称。この値は `agency.agency_name` のいずれかと同じである場合があります。 |
|  `feed_publisher_url` | URL | **必須** | データセット発行組織のウェブサイトの URL。この値は `agency.agency_url` のいずれかと同じである場合があります。 |
|  `feed_lang` | Language code | **必須** | このデータセット内のテキストに使用されるデフォルト言語。この設定は、GTFS 利用者が大文字小文字のルールやその他の言語固有の設定を選択するのに役立ちます。テキストをデフォルト以外の言語に翻訳する必要がある場合は、`translations.txt` ファイルを使用できます。<br><br>データセット内の元のテキストが複数の言語で記述されている場合、デフォルト言語は多言語である可能性があります。その場合、`feed_lang` フィールドには ISO 639-2 で定義された言語コード `mul` を含めるべきであり、データセットで使用されている各言語の翻訳を `translations.txt` に提供する必要があります。データセット内のすべての元のテキストが同じ言語である場合は、`mul` を使用してはいけません。<hr>_例: スイスのような多言語国のデータセットを考えてみます。`stops.stop_name` フィールドには、各停留所等(stop)の地理的な場所で支配的な言語に従って停留所名が入力されています。例えば、フランス語圏の都市ジュネーブでは `Genève`、ドイツ語圏の都市チューリッヒでは `Zürich`、二言語都市ビール/ビエンヌでは `Biel/Bienne` です。この場合、データセットの `feed_lang` は `mul` とし、`translations.txt` に翻訳を提供します。ドイツ語では `Genf`、`Zürich`、`Biel`、フランス語では `Genève`、`Zurich`、`Bienne`、イタリア語では `Ginevra`、`Zurigo`、`Bienna`、英語では `Geneva`、`Zurich`、`Biel/Bienne` です。_ |
|  `default_lang` | Language code | 任意 | 乗客の言語が不明な場合にデータ利用者が使用すべき言語を定義します。多くの場合、`en` (英語) です。 |
|  `feed_start_date` | Date | 推奨 | データセットは、`feed_start_date` の日付の開始から `feed_end_date` の日付の終了までの期間において、完全で信頼できる時刻表情報を提供します。両日とも利用できない場合は空欄にすることができます。両方が指定されている場合、`feed_end_date` は `feed_start_date` より前であってはいけません。データセット提供者は、この期間外の時刻表データを提供して将来の運行を示すことが推奨されますが、データセット利用者はそれを非公式な情報として扱うべきです。もし `feed_start_date` または `feed_end_date` が [calendar.txt](#calendartxt) および [calendar_dates.txt](#calendar_datestxt) で定義された有効なカレンダー日を超えている場合、データセットは `feed_start_date` または `feed_end_date` の範囲内で有効なカレンダー日に含まれていない日付には運行がないことを明示的に示しています。 |
|  `feed_end_date` | Date | 推奨 | （上記参照） |
|  `feed_version` | Text | 推奨 | GTFS データセットの現在のバージョンを示す文字列。GTFS を利用するアプリケーションはこの値を表示することで、データセット発行者が最新のデータセットが取り込まれているかどうかを確認できるようにします。 |
|  `feed_contact_email` | Email | 任意 | GTFS データセットおよびデータ公開に関する連絡用のメールアドレス。`feed_contact_email` は GTFS を利用するアプリケーション向けの技術的な連絡先です。顧客サービスの連絡先情報は [agency.txt](#agencytxt) を通じて提供してください。`feed_contact_email` または `feed_contact_url` の少なくとも一方を提供することが推奨されます。 |
|  `feed_contact_url` | URL | 任意 | GTFS データセットおよびデータ公開に関する連絡用の情報、ウェブフォーム、サポートデスク、その他のツールの URL。`feed_contact_url` は GTFS を利用するアプリケーション向けの技術的な連絡先です。顧客サービスの連絡先情報は [agency.txt](#agencytxt) を通じて提供してください。`feed_contact_url` または `feed_contact_email` の少なくとも一方を提供することが推奨されます。 |

### attributions.txt {: #attributionstxt}


ファイル: **任意**

主キー (`attribution_id`)

このファイルは、データセットに適用される帰属情報を定義します。

| フィールド名 | 型 | 出現 | 説明 |
|  ------ | ------ | ------ | ------ |
|  `attribution_id` | 一意のID | 任意 | データセットまたはその一部に対する帰属情報を識別します。これは主に翻訳に役立ちます。 |
|  `agency_id` | 外部ID（`agency.agency_id` を参照） | 任意 | 帰属情報が適用される事業者。<br><br>`agency_id`、`route_id`、`trip_id` のいずれか1つが定義されている場合、他のものは空でなければなりません。いずれも指定されていない場合、帰属情報はデータセット全体に適用されます。 |
|  `route_id` | 外部ID（`routes.route_id` を参照） | 任意 | `agency_id` と同様に機能しますが、帰属情報はルート・路線系統(route)に適用されます。複数の帰属情報を同じルート・路線系統(route)に適用することができます。 |
|  `trip_id` | 外部ID（`trips.trip_id` を参照） | 任意 | `agency_id` と同様に機能しますが、帰属情報は便(trip)に適用されます。複数の帰属情報を同じ便(trip)に適用することができます。 |
|  `organization_name` | テキスト | **必須** | データセットが帰属する組織の名称。 |
|  `is_producer` | 列挙型 | 任意 | 組織の役割がプロデューサーであることを示します。有効なオプションは以下の通りです:<br><br>`0` または空 - 組織はこの役割を持ちません。<br>`1` - 組織はこの役割を持ちます。<br><br>`is_producer`、`is_operator`、`is_authority` のいずれか1つ以上のフィールドは `1` に設定するべきです。 |
|  `is_operator` | 列挙型 | 任意 | `is_producer` と同様に機能しますが、組織の役割がオペレーターであることを示します。 |
|  `is_authority` | 列挙型 | 任意 | `is_producer` と同様に機能しますが、組織の役割が権限機関であることを示します。 |
|  `attribution_url` | URL | 任意 | 組織のURL。 |
|  `attribution_email` | メールアドレス | 任意 | 組織のメールアドレス。 |
|  `attribution_phone` | 電話番号 | 任意 | 組織の電話番号。 |
