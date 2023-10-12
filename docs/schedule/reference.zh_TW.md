---
search:
  exclude: true
---
  
# GTFS Schedule 參考

**2022 年 5 月 9 日修訂。有關詳細信息，請參閱 [Revision History](../revision-history)。 **

本文檔定義了構成 GTFS 數據集的文件的格式和結構。

## 目錄

1.  [文檔約定](#document-conventions)
2.  [數據集文件](#dataset-files)
3.  [文件要求](#file-requirements)
4.  [字段定義](#field-definitions)
    -   [agency.txt](#agencytxt)
    -   [stops.txt](#stopstxt)
    -   [routes.txt](#routestxt)
    -   [trips.txt](#tripstxt)
    -   [stop\_times.txt](#stop_timestxt)
    -   [calendar.txt](#calendartxt)
    -   [calendar\_dates.txt](#calendar_datestxt)
    -   [fare\_attributes.txt](#fare_attributestxt)
    -   [fare\_rules.txt](#fare_rulestxt)
    -   [fare\_products.txt](#fare_productstxt) 
    -   [fare\_leg\_rules.txt](#fare_leg_rulestxt)
    -   [fare\_transfer\_rules.txt](#fare_transfer_rulestxt)
    -   [areas.txt](#areastxt)
    -   [stop_areas.txt](#stop_areastxt)
    -   [shapes.txt](#shapestxt)
    -   [frequencies.txt](#frequenciestxt)
    -   [transfers.txt](#transferstxt)
    -   [pathways.txt](#pathwaystxt)
    -   [levels.txt](#levelstxt)
    -   [translations.txt](#translationstxt)
    -   [feed\_info.txt](#feed_infotxt)
    -   [attributions.txt](#attributionstxt)

## 文檔約定

本文檔中的關鍵詞“必須”、“不得”、“要求”、“應”、“不得”、“應該”、“不應”、“推薦”、“可以”和“可選”是按照 [RFC 2119](https://tools.ietf.org/html/rfc2119) 中的說明進行解釋。

### 術語定義

本節定義了本文檔中使用的術語。

* **數據集** - 本規範參考定義的完整文件集。更改數據集會創建新版本的數據集。數據集應發佈在公共的永久 URL 上，包括 zip 文件名。 （例如，https://www.agency.org/gtfs/gtfs.zip）。
* **記錄** - 由多個不同字段值組成的基本數據結構，用於描述單個實體（例如公交代理、停靠站、路線等）。在表格中表示為一行。
* **Field** - 對像或實體的屬性。在表中表示為一列。
* **字段值** - 字段中的單個條目。在表格中表示為單個單元格。
* **服務日** - 服務日是用於指示路線調度的時間段。服務日的確切定義因機構而異，但服務日通常與日曆日不一致。如果服務在一天開始並在第二天結束，則服務日可能會超過 24:00:00。例如，從週五 08:00:00 到週六 02:00:00 運行的服務可以表示為在單個服務日從 08:00:00 到 26:00:00 運行。
* **文本轉語音字段** - 該字段應包含與其父字段相同的信息（如果為空則回退）。它旨在被解讀為文本轉語音，因此，應該刪除縮寫（“St”應該讀作“Street”或“Saint”；“Elizabeth I”應該讀作“Elizabeth the first”）或保持原樣閱讀（“肯尼迪機場”被縮寫）。
* **Leg** - 騎手在旅途中的兩個後續位置之間上下車的行程。
* **旅程** - 從始發地到目的地的總體旅行，包括所有航段和中轉。
* **子旅程** - 構成旅程子集的兩條或更多航段。
* **票價產品** - 可用於支付或驗證旅行的可購買票價產品。

### 在場

適用於字段和文件的存在條件：

* **必需**- 字段或文件必須包含在數據集中並包含每條記錄的有效值。
* **可選**- 可以從數據集中省略字段或文件。
* **有條件地要求**- 字段或文件必須包含在字段或文件描述中概述的條件下。
* **有條件禁止**- 字段或文件不得包含在字段或文件描述中概述的條件下。

### 字段類型

- **顏色**- 編碼為六位十六進制數字的顏色。請參閱<https://htmlcolorcodes.com>以生成有效值（不得包含前導“#”）。 <br/>*示例： `FFFFFF`表示白色， `000000`表示黑色或`0039A6`表示 NYMTA 中的 A、C、E 線。 *<br/>
- **貨幣代碼**- ISO 4217 字母貨幣代碼。有關當前貨幣列表，請參閱<https://en.wikipedia.org/wiki/ISO_4217#Active_codes> 。 <br/>*示例： `CAD`代表加元， `EUR`代表歐元， `JPY`代表日元。 *<br/>
- **貨幣金額**- 表示貨幣金額的十進制值。 [ISO 4217](https://en.wikipedia.org/wiki/ISO\_4217#Active_codes)為隨附的貨幣代碼指定了小數位數。根據編程，所有財務計算都應以十進制、貨幣或其他適合財務計算的等效類型處理language用於消費數據。由於計算過程中的貨幣收益或損失，不鼓勵將貨幣金額作為浮動來處理。
- **日期**- YYYYMMDD 格式的服務日期。由於服務日內的時間可能高於 24:00:00，因此服務日可能包含後續日的信息。 <br/>*示例： `20180913`表示 2018 年 9 月 13 日。 *<br/>
- **電子郵件**- 電子郵件地址。 <br/>*示例： `example@example.com`*<br/>
- **枚舉**- “描述”列中定義的一組預定義常量中的一個選項。 <br/>*示例： `route_type`字段包含`0`表示電車， `1`表示地鐵......*<br/>
- **ID** - ID 字段值是一個內部 ID，不打算向乘客顯示，並且是任何 UTF-8 字符的序列。建議僅使用可打印的 ASCII 字符。當 ID 在文件中必須是唯一的時，它被標記為“唯一 ID”。在一個 .txt 文件中定義的 ID 通常在另一個 .txt 文件中被引用。引用另一個表中的 ID 的 ID 被標記為“外部 ID”。 <br/>*示例：*stop_id*字段*stops.txt*是一個“唯一標識”。 `parent_station`字段在*stops.txt*是一個“外國ID參考`stops. stop_id`*stop_id *”。 *<br/>
- language**代碼**- IETF BCP 47language代碼。有關 IETF BCP 47 的介紹，請參閱<http://www.rfc-editor.org/rfc/bcp/bcp47.txt>和[語言](<http://www.w3.org/International/articles/\<glossary variable=>)[-tags/">http://www.w3.org/International/articles/](<http://www.w3.org/International/articles/\<glossary variable=>)language[-標籤/](<http://www.w3.org/International/articles/\<glossary variable=>) 。<br/>*示例： `en`表示英語， `en-US`表示美式英語或`de`表示德語。*<br/>
- **緯度**- WGS84 緯度，十進制度。該值必須大於或等於 -90.0 且小於或等於 90.0。 *<br/>示例：羅馬鬥獸場的`41.890169` 。 <br/>*
- **經度**- WGS84 經度（十進制度）。該值必須大於或等於 -180.0 且小於或等於 180.0。 <br/>*示例：羅馬鬥獸場的`12.492269` 。 *<br/>
- **Float** - 一個浮點數。
- **整數**- 一個整數。
- **電話號碼**- 電話號碼。
- **Time** - HH:MM:SS 格式的時間（也接受 H:MM:SS）。時間從服務日的“中午減去 12 小時”開始計算（實際上是午夜，夏令時更改發生的日子除外）。對於發生在午夜之後的時間，請以大於 24:00:00 的值輸入時間，以旅行當天的 HH:MM:SS 本地時間Schedule開始。 <br/>*示例：第二天下午 2:30 為 14:30:00 或`25:35:00` `14:30:00`*<br/>
- **文本**- 一個 UTF-8 字符串，旨在顯示，因此必須是人類可讀的。
- **時區**- 來自<https://www.iana.org/time-zones>的 TZ 時區。時區名稱從不包含空格字符，但可能包含下劃線。有關有效值的列表，請參閱<http://en.wikipedia.org/wiki/List_of_tz_zones> 。 <br/>*示例： `Asia/Tokyo` 、 `America/Los_Angeles`或`Africa/Cairo` 。 *<br/>
- **URL** - 包含 http\:// 或 https\:// 的完全限定 URL，並且 URL 中的任何特殊字符都必須正確轉義。有關如何創建完全限定 URL 值的說明，請參閱以下<http://www.w3.org/Addressing/URL/4_URI_Recommentations.html> 。

### 現場標誌

適用於浮點或整數字段類型的符號：

- **非負數**- 大於或等於 0。
- **非零**- 不等於 0。
- **正**- 大於 0。

*示例：**非負浮點數**- 大於或等於 0 的浮點數。 *

### 數據集屬性

數據集的**主鍵**是唯一標識行的字段或字段組合。當文件的所有提供字段都用於唯一標識行時，使用`Primary key (*)` 。 `Primary key (none)`表示文件只允許一行。

*示例：*trip_id*和*stop_sequence*字段作為主鍵*stop_times.txt *.*

## 數據集文件

本規範定義了以下文件：

| 文件名                                                | 在場        | 描述|
| -------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [agency.txt](#agencytxt)                           | **必需的**   | 在此數據集中提供服務的交通機構。 |
| [stops.txt](#stopstxt)                             | **必需的**   | 在車輛接送乘客的地方停靠。還定義了車站和車站入口。 |
| [routes.txt](#routestxt)                           | **必需的**   | 過境路線。路線是作為單一服務向乘客顯示的一組行程。 |
| [trips.txt](#tripstxt)                             | **必需的**   | 每條路線的行程。行程是在特定時間段內發生的兩個或多個停靠點的序列。 |
| [stop_times.txt](#stop_timestxt)                   | **必需的**   | 每次行程中車輛到達和離開站點的時間。 |
| [calendar.txt](#calendartxt)                       | **有條件要求** | 使用每週指定的服務日期Schedule帶有開始和結束日期。 <br/><br/>有條件要求：<br/>-**必需的**除非所有服務日期都在[calendar_dates.txt](#calendar_datestxt) .<br/> - 否則可選。 |
| [calendar_dates.txt](#calendar_datestxt)           | **有條件要求** | 中定義的服務的例外情況[calendar.txt](#calendartxt) .<br/><br/>有條件要求：<br/> -**必需的**如果[calendar.txt](#calendartxt)被省略。在這種情況下[calendar_dates.txt](#calendar_datestxt)必須包含所有服務日期。 <br/> - 否則可選。 |
| [fare_attributes.txt](#fare_attributestxt)         | 可選的       | 公交公司路線的票價信息。 |
| [fare_rules.txt](#fare_rulestxt)                   | **有條件要求** | 為行程應用票價的規則。 <br/><br/>有條件要求：<br/> -**必需的**如果[fare_attributes.txt](#fare_attributestxt)被定義為。 <br/> -**禁止的**否則。 |
| [fare_products.txt](#fare_productstxt)             | 可選的       | 描述乘客可以購買的不同類型的車票或票價。 <br/><br/>文件[fare_products.txt](fare_productstxt)描述未在[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt).因此，使用[fare_products.txt](#fare_productstxt)與文件完全分開[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt) . |
| [fare_leg_rules.txt](#fare_leg_rulestxt)           | 可選的       | 單程旅行的票價規則。 <br/><br/>文件[fare_leg_rules.txt](#fare_leg_rulestxt)為票價結構建模提供了更詳細的方法。因此，使用[fare_leg_rules.txt](#fare_leg_rulestxt)與文件完全分開[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt) .                                                                     |
| [fare_transfer_rules.txt](#fare_transfer_rulestxt) | 可選的       | 旅行航段之間換乘的票價規則。 <br/><br/>隨著[fare_leg_rules.txt](#fare_leg_rulestxt)， 文件[fare_transfer_rules.txt](#fare_transfer_rulestxt)為票價結構建模提供了更詳細的方法。因此，使用[fare_transfer_rules.txt](#fare_transfer_rulestxt)與文件完全分開[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt) . |
| [areas.txt](areastxt)                              | 可選的       | 位置的區域分組。|
| [stop_areas.txt](stop_areastxt)                    | 可選的       | 為區域分配停靠點的規則。 |
| [shapes.txt](#shapestxt)                           | 可選的       | 映射車輛行駛路徑的規則，有時稱為路線路線。 |
| [frequencies.txt](#frequenciestxt)                 | 可選的       | 基於車距的服務的車距（行程之間的時間）或固定的壓縮表示Schedule服務。 |
| [transfers.txt](#transferstxt)                     | 可選的       | 在路線之間的換乘點建立連接的規則。 |
| [pathways.txt](#pathwaystxt)                       | 可選的       | 連接車站內位置的路徑。 |
| [levels.txt](#levelstxt)                           | **有條件要求** | 車站內的水平。 <br/><br/>有條件要求：<br/> -**必需的**當描述有電梯的路徑時（`pathway_mode=5` ）。 <br/> - 否則可選。 |
| [translations.txt](#translationstxt)               | 可選的       | 面向客戶的數據集值的翻譯。 |
| [feed_info.txt](#feed_infotxt)                     | 可選的       | 數據集元數據，包括發布者、版本和到期信息。 |
| [attributions.txt](#attributionstxt)               | 可選的       | 數據集屬性。 |


## 文件要求

以下要求適用於數據集文件的格式和內容：

* 所有文件都必須保存為逗號分隔的文本。
* 每個文件的第一行必須包含字段名稱。 [字段定義](#field-definitions)部分的每個子部分對應於一個文件中的一個GTFS數據集並列出該文件中可能使用的字段名稱。
* 所有文件名和字段名都區分大小寫。
* 字段值不得包含製表符、回車符或換行符。
* 包含引號或逗號的字段值必須用引號引起來。此外，字段值中的每個引號前面都必須有一個引號。這與 Microsoft Excel 輸出逗號分隔 (CSV) 文件的方式一致。有關 CSV 文件格式的更多信息，請參閱<http://tools.ietf.org/html/rfc4180> 。

以下示例演示了字段值在逗號分隔文件中的顯示方式：

* **原始字段值：** `Contains "quotes", commas and text`
* **CSV 文件中的字段值：** `"Contains ""quotes"", commas and text"`
* 字段值不得包含 HTML 標記、註釋或轉義序列。
* 應刪除字段或字段名稱之間的多餘空格。許多解析器認為空格是值的一部分，這可能會導致錯誤。
* 每行必須以 CRLF 或 LF 換行符結尾。
* 文件應以 UTF-8 編碼以支持所有 Unicode 字符。包含 Unicode 字節順序標記 (BOM) 字符的文件是可接受的。有關 BOM 字符和 UTF-8 的更多信息，請參見<http://unicode.org/faq/utf_bom.html#BOM> 。
* 所有數據集文件必須壓縮在一起。

## 字段定義

### agency.txt

文件：**必填**

首要的關鍵 （agency_id )

| 字段名稱              | 類型         | 在場        | 描述                                                                                                                                                            |
| ----------------- | ---------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `agency_id`       | 唯一身份       | **有條件要求** | 標識通常與運輸機構同義的運輸品牌。請注意，在某些情況下，例如當一個代理機構運營多個單獨的服務時，代理機構和品牌是不同的。本文檔使用術語“代理”代替“品牌”。一個數據集可能包含來自多個機構的數據。 <br/><br/>有條件要求：<br/> -**必需的**當數據集包含多個交通機構的數據時。 <br/> - 否則可選。 |
| `agency_name`     | 文本         | **必需的**   | 運輸機構的全稱。 |
| `agency_url`      | 網址         | **必需的**   | 公交機構的網址。 |
| `agency_timezone` | 時區         | **必需的**   | 運輸機構所在的時區。如果在數據集中指定了多個機構，每個機構必須具有相同的`agency_timezone` .                                                                                                       |
| `agency_lang`     | language代碼 | 可選的       | 基本的language由該運輸機構使用。應提供幫助GTFS消費者選擇大小寫規則等language- 數據集的特定設置。 |
| `agency_phone`    | 電話號碼       | 可選的       | 指定機構的語音電話號碼。此字段是一個字符串值，表示該機構服務區域的典型電話號碼。它可能包含標點符號來對數字的數字進行分組。允許使用可撥號文本（例如，TriMet 的“503-238-RIDE”），但該字段不得包含任何其他描述性文本。 |
| `agency_fare_url` | 網址         | 可選的       | 允許乘客在線為該機構購買車票或其他票價工具的網頁的 URL。 |
| `agency_email`    | 電子郵件       | 可選的       | 由該機構的客戶服務部門積極監控的電子郵件地址。此電子郵件地址應該是一個直接聯繫點，公交乘客可以聯繫到該機構的客戶服務代表。 |

### stops.txt

文件：**必填**

首要的關鍵 （stop_id )

| 字段名稱                  | 類型                       | 在場        | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| --------------------- | ------------------------ | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `stop_id`             | 唯一身份                     | **必需的**   | 識別位置：站台/站台、車站、入口/出口、通用節點或登機區（見`location_type`）。 <br/><br/>多條路線可以使用相同的`stop_id` .                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `stop_code`           | 文本                       | 可選的       | 標識乘客位置的短文本或數字。這些代碼通常用於基於電話的交通信息系統或印在標牌上，以使乘客更容易獲得特定位置的信息。這`stop_code`可能與`stop_id`如果它是面向公眾的。對於沒有向乘客提供代碼的位置，此字段應留空。 |
| `stop_name`           | 文本                       | **有條件要求** | 位置的名稱。這`stop_name`應與打印在時間表上、在線發布或出現在標牌上的機構面向騎手的位置名稱相匹配。要翻譯成其他語言，請使用`translations.txt` .<br/><br/>當位置是登機區時（`location_type=4` ）， 這`stop_name`應包含機構顯示的登機區名稱。它可能只是一個字母（如一些歐洲城際火車站），也可能是“Wheelchair boarding area”（紐約市的地鐵）或“短途列車負責人”（巴黎的 RER）之類的文字。 <br/><br/>有條件要求：<br/> -**必需的**對於停靠點（`location_type=0` ), 車站 (`location_type=1` ) 或入口/出口 (`location_type=2` ）。 <br/> - 對於通用節點的位置是可選的（`location_type=3` ) 或登機區 (`location_type=4` ）。 |
| `tts_stop_name`       | 文本                       | 可選的       | 的可讀版本`stop_name` .請參閱“文本轉語音字段”中的[術語定義](#term-definitions)更多。 |
| `stop_desc`           | 文本                       | 可選的       | 提供有用的優質信息的位置描述。不應重複`stop_name` .|
| `stop_lat`            | 緯度                       | **有條件要求** | 位置的緯度。 <br/><br/>對於停靠點/平台（`location_type=0` ) 和登機區 (`location_type=4` )，坐標必須是公共汽車桿的坐標（如果存在），否則是旅行者上車的位置（在人行道或平台上，而不是在車輛停靠的道路或軌道上）。 <br/><br/>有條件要求：<br/> -**必需的**對於停靠點（`location_type=0` ), 車站 (`location_type=1` ) 或入口/出口 (`location_type=2` ）。 <br/> - 對於通用節點的位置是可選的（`location_type=3` ) 或登機區 (`location_type=4` ）。 |
| `stop_lon`            | 經度                       | **有條件要求** | 位置的經度。 <br/><br/>對於停靠點/平台（`location_type=0` ) 和登機區 (`location_type=4` )，坐標必須是公共汽車桿的坐標（如果存在），否則是旅行者上車的位置（在人行道或平台上，而不是在車輛停靠的道路或軌道上）。 <br/><br/>有條件要求：<br/> -**必需的**對於停靠點（`location_type=0` ), 車站 (`location_type=1` ) 或入口/出口 (`location_type=2` ）。 <br/> - 對於通用節點的位置是可選的（`location_type=3` ) 或登機區 (`location_type=4` ）。 |
| `zone_id`             | ID                       | **有條件要求** | 標識停靠的票價區。如果該記錄代表車站或車站入口，則`zone_id`被忽略。 <br/><br/>有條件要求：<br/> -**必需的**如果使用提供票價信息[fare_rules.txt](#fare_rulestxt) <br/> - 否則可選。 |
| `stop_url`            | 網址                       | 可選的       | 有關該位置的網頁的 URL。這應該不同於`agency.agency_url`和`routes.route_url`字段值。 |
| `location_type`       | 枚舉                       | 可選的       | 位置類型。有效的選項是：<br/><br/>`0` （或空白）-**停止** （或者**平台**）。乘客上車或下車的地方。當定義在一個`parent_station` .<br/>`1` -**車站**.包含一個或多個平台的物理結構或區域。 <br/>`2` -**入口/出口**.乘客可以從街道進出車站的位置。如果一個入口/出口屬於多個站點，它可能通過路徑鏈接到兩個站點，但數據提供者必須選擇其中一個作為父站點。 <br/>`3` -**通用節點**.車站內的位置，不匹配任何其他位置`location_type`，可用於將定義的路徑鏈接在一起pathways.txt .<br/>`4` -**登機區**.平台上的特定位置，乘客可以在此上下車。 |
| `parent_station`      | 國外身份證參考`stops.stop_id`   | **有條件要求** | 定義中定義的不同位置之間的層次結構`stops.txt`.它包含父位置的 ID，如下所示：<br/><br/> -**停止/平台**(`location_type=0`）： 這`parent_station`字段包含站的 ID。 <br/> -**車站** (`location_type=1` )：此字段必須為空。 <br/> -**入口/出口** (`location_type=2` ） 或者**通用節點** (`location_type=3`）： 這`parent_station`字段包含站的 ID (`location_type=1` )<br/> -**登機區** (`location_type=4`）： 這`parent_station`字段包含平台的 ID。 <br/><br/>有條件要求：<br/> -**必需的**對於作為入口的位置（`location_type=2` ), 通用節點 (`location_type=3` ) 或登機區 (`location_type=4` ）。 <br/> - 可選停靠站/平台（`location_type=0` ）。 <br/> - 禁止車站（`location_type=1` ）。 |
| `stop_timezone`       | 時區                       | 可選的       | 位置的時區。如果該位置有父站，它將繼承父站的時區，而不是應用自己的時區。車站和無父母的車站空車`stop_timezone`繼承指定的時區`agency.agency_timezone`.如果`stop_timezone`提供的值，在時間[stop_times.txt](#stop_timetxt)應輸入自指定時區午夜以來的時間`agency.agency_timezone`.這可確保旅行中的時間值始終在旅行過程中增加，無論旅行跨越哪個時區。 |
| `wheelchair_boarding` | 枚舉                       | 可選的       | 指示是否可以從該位置搭乘輪椅。有效的選項是：<br/><br/>對於無父母站點：<br/>`0`或為空 - 沒有該站點的可訪問性信息。 <br/>`1` - 此站的部分車輛可由坐輪椅的騎手上車。 <br/>`2` - 此站無法使用輪椅登機。 <br/><br/>對於子站：<br/>`0`或為空 - Stop 將繼承其`wheelchair_boarding`來自父站的行為，如果在父站中指定。 <br/>`1` - 從車站外到特定車站/平台存在一些可訪問的路徑。 <br/>`2` - 沒有從車站外到特定車站/站台的無障礙路徑。 <br/><br/>車站出入口：<br/>`0`或為空 - 車站入口將繼承其`wheelchair_boarding`如果為父站指定，則來自父站的行為。 <br/>`1` - 車站入口可供輪椅通行。 <br/>`2` - 從車站入口到車站/站台沒有無障礙通道。 |
| `level_id`            | 國外身份證參考`levels.level_id` | 可選的       | 位置的級別。多個未鏈接的站點可以使用同一級別。|
| `platform_code`       | 文本                       | 可選的       | 站台站台的站台標識符（屬於站台的站台）。這應該只是平台標識符（例如“G”或“3”）。諸如“平台”或“軌道”之類的詞（或提要的language- 特定等價物）不應包括在內。這使提要消費者能夠更輕鬆地將平台標識符國際化和本地化為其他語言。 |

### routes.txt

文件：**必填**

首要的關鍵 （route_id )

| 字段名稱                  | 類型                        | 在場        | 描述                                                                                                                                                                                                                                                                                                                                                                                              |
| --------------------- | ------------------------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `route_id`            | 唯一身份                      | **必需的**   | 標識一條路線。 |
| `agency_id`           | 國外身份證參考`agency.agency_id` | **有條件要求** | 指定路線的代理。 <br/><br/>有條件要求：<br/> -**必需的**如果定義了多個機構[agency.txt](#agency) .<br/> - 否則可選。 |
| `route_short_name`    | 文本                        | **有條件要求** | 路線的簡稱。通常是一個簡短的、抽象的標識符（例如，“32”、“100X”、“Green”），騎手用來識別路線。兩個都`route_short_name`和`route_long_name`可以定義。 <br/><br/>有條件要求：<br/> -**必需的**如果`routes.route_long_name`是空的。 <br/> - 否則可選。 |
| `route_long_name`     | 文本                        | **有條件要求** | 路線的全名。此名稱通常比`route_short_name`並且通常包括路線的目的地或站點。兩個都`route_short_name`和`route_long_name`可以定義。 <br/><br/>有條件要求：<br/> -**必需的**如果`routes.route_short_name`是空的。 <br/> - 否則可選。 |
| `route_desc`          | 文本                        | 可選的       | 提供有用的優質信息的路線的描述。不應重複`route_short_name`或者`route_long_name` .<hr/> _示例：“A”號列車始終在曼哈頓 Inwood-207 St 和皇后區 Far Rockaway-Mott Avenue 之間運行。同樣從早上 6 點到午夜，額外的“A”號列車在 Inwood-207 St 和 Lefferts Boulevard 之間運行（列車通常在 Lefferts Blvd 和 Far Rockaway 之間交替運行）。 _                                                                                                                                                 |
| `route_type`          | 枚舉                        | **必需的**   | 指示路線上使用的交通工具類型。有效的選項是：<br/><br/>`0` - 有軌電車、有軌電車、輕軌。大都市區內的任何輕軌或街道系統。 <br/>`1` - 地鐵，地鐵。大都市區內的任何地下鐵路系統。 <br/>`2` - 鐵路。用於城際或長途旅行。 <br/>`3` - 公共汽車。用於短途和長途巴士路線。 <br/>`4` - 渡輪。用於短途和長途船服務。 <br/>`5` - 纜車。用於電纜在車輛下方運行的街道軌道車（例如，舊金山的纜車）。 <br/>`6` - 空中升降機、懸掛式纜車（例如纜車、空中纜車）。使用一根或多根電纜懸掛客艙、汽車、吊船或開放式椅子的電纜運輸。 <br/>`7` - 纜車。任何專為陡峭斜坡設計的軌道系統。 <br/>`11` - 無軌電車。使用電線桿從架空電線中獲取電力的電動巴士。 <br/>`12` - 單軌電車。軌道由單軌或橫梁組成的鐵路。 |
| `route_url`           | 網址                        | 可選的       | 關於特定路由的網頁的 URL。應該不同於`agency.agency_url`價值。|
| `route_color`         | 顏色                        | 可選的       | 與面向公眾的材料相匹配的路線顏色指定。默認為白色（`FFFFFF` ) 當省略或留空時。之間的色差`route_color`和`route_text_color`在黑白屏幕上觀看時應提供足夠的對比度。 |
| `route_text_color`    | 顏色                        | 可選的       | 用於在背景上繪製的文本的清晰顏色`route_color`.默認為黑色（`000000`) 當省略或留空時。之間的色差`route_color`和`route_text_color`在黑白屏幕上觀看時應提供足夠的對比度。 |
| `route_sort_order`    | 非負整數                      | 可選的       | 以最適合向客戶展示的方式對路線進行排序。較小的路線`route_sort_order`值應首先顯示。 |
| `continuous_pickup`   | 枚舉                        | 可選的       | 表示騎手可以在車輛行駛路徑上的任何點登上運輸車輛，如`shapes.txt`，在路線的每次行程中。有效的選項是：<br/><br/>`0` - 連續停止皮卡。 <br/>`1`或空 - 沒有連續停止拾取。 <br/>`2` - 必須打電話給代理安排連續停止取件。 <br/>`3` - 必須與司機協調安排連續停車接送。 <br/><br/>價值觀`routes.continuous_pickup`可以通過在中定義值來覆蓋`stop_times.continuous_pickup`對於特定的`stop_time`沿著路線。 |
| `continuous_drop_off` | 枚舉                        | 可選的       | 表示騎手可以在車輛行駛路徑上的任何點從運輸車輛下車，如下所述`shapes.txt` ，在路線的每次行程中。有效的選項是：<br/><br/>`0`- 連續停止下降。 <br/>`1`或空 - 沒有連續停止下降。 <br/>`2` - 必須打電話給代理商安排連續的中途下車。 <br/>`3` - 必須與司機協調安排連續停車下車。 <br/><br/>價值觀`routes.continuous_drop_off`可以通過在中定義值來覆蓋`stop_times.continuous_drop_off`對於特定的`stop_time`沿著路線。 |
| `network_id`          |  ID                       | 可選的       | 標識一組路由。中的多行[routes.txt](#routestxt)可能有相同的`network_id` .                                                                                                                                                                                                                                                                                                                                         |


### trips.txt

文件：**必填**

首要的關鍵 （trip_id )

| 字段名稱                    | 類型                                                        | 在場        | 描述                                                                                                                                                                                                                                                                                                                                    |
| ----------------------- | --------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `route_id`              | 國外身份證參考`routes.route_id`                                  | **必需的**   | 標識一條路線。 |
| `service_id`            | 國外身份證參考`calendar.service_id`或者`calendar_dates.service_id` | **必需的**   | 確定服務可用於一條或多條路線的一組日期。 |
| `trip_id`               | 唯一身份                                                      | **必需的**   | 標識行程。|
| `trip_headsign`         | 文本                                                        | 可選的       | 出現在標牌上的文字，用於向乘客指明行程的目的地。應該用於區分同一路由上的不同服務模式。 <br/><br/>如果頭標在旅途中發生變化，則值為`trip_headsign`可以通過在中定義值來覆蓋`stop_times.stop_headsign`對於特定的`stop_time`在旅途中。 |
| `trip_short_name`       | 文本                                                        | 可選的       | 用於識別乘客行程的面向公眾的文本，例如，識別通勤鐵路旅行的火車號碼。如果乘客通常不依賴行程名稱，`trip_short_name`應該是空的。一個`trip_short_name`值（如果提供）應唯一標識服務日內的行程；它不應用於目的地名稱或有限/明確指定。 |
| `direction_id`          | 枚舉                                                        | 可選的       | 指示旅行的行進方向。該字段不應在路由中使用；它提供了一種在發佈時間表時按方向分隔行程的方法。有效的選項是：<br/><br/>`0` - 單向旅行（例如出境旅行）。 <br/>`1` - 向相反方向行駛（例如入境旅行）。 <hr/>*示例：`trip_headsign`和`direction_id`字段可以一起使用，為一組行程分配一個名稱，以在每個方向上行駛。一個[trips.txt](#tripstxt)文件可以包含這些記錄以在時間表中使用：* <br/> `trip_id,...,trip_headsign,direction_id` <br/> `1234,...,Airport,0` <br/> `1505,...,Downtown,1` |
| `block_id`              |  ID                                                       | 可選的       | 標識行程所屬的塊。一個區塊由使用同一車輛的單次行程或多次連續行程組成，由共享服務天數和`block_id`.一個`block_id`可能有不同服務天數的行程，形成不同的區塊。見[下面的例子](#example-blocks-and-service-day).提供座位轉移信息，[轉移](#transferstxt)的`transfer_type` `4`應改為提供。 |
| `shape_id`              | 國外身份證參考`shapes.shape_id`                                  | **有條件要求** | 標識描述旅行的車輛行駛路徑的地理空間形狀。 <br/><br/>有條件要求：<br/> -**必需的**如果行程具有連續接送或下車行為定義`routes.txt`或在`stop_times.txt` .<br/> - 否則可選。 |
| `wheelchair_accessible` | 枚舉                                                        | 可選的       | 表示輪椅可及性。有效的選項是：<br/><br/>`0`或為空 - 沒有行程的無障礙信息。 <br/>`1` - 在此特定行程中使用的車輛可容納至少一名坐在輪椅上的乘客。 <br/>`2` - 此行程不接待坐輪椅的乘客。 |
| `bikes_allowed`         | 枚舉                                                        | 可選的       | 指示是否允許騎自行車。有效的選項是：<br/><br/>`0`或為空 - 沒有行程的自行車信息。 <br/>`1` - 在這次特定旅行中使用的車輛可以容納至少一輛自行車。 <br/>`2` - 此行程不允許騎自行車。 |


#### 示例：街區和服務日

下面的示例是有效的，一周中的每一天都有不同的塊。


| route_id | trip_id | service_id                     | block_id | <span style="font-weight:normal">*(first stop time)*</span> | <span style="font-weight:normal">*(last stop time)*</span> |
|----------|---------|--------------------------------|----------|-----------------------------------------|-------------------------|
| red      | trip_1  | mon-tues-wed-thurs-fri-sat-sun | red_loop | 22:00:00                                | 22:55:00                |
| red      | trip_2  | fri-sat-sun                    | red_loop | 23:00:00                                | 23:55:00                |
| red      | trip_3  | fri-sat                        | red_loop | 24:00:00                                | 24:55:00                |
| red      | trip_4  | mon-tues-wed-thurs             | red_loop | 20:00:00                                | 20:50:00                |
| red      | trip_5  | mon-tues-wed-thurs             | red_loop | 21:00:00                                | 21:50:00                |

上表注意事項：

* 例如，從周五到週六早上，單車運行`trip_1` 、 `trip_2`和`trip_3` （晚上 10:00 到凌晨 12:55）。請注意，最後一次行程發生在星期六的 12:00 AM 到 12:55 AM，但屬於星期五“服務日”的一部分，因為時間是 24:00:00 到 24:55:00。
* 週一、週二、週三和周四，晚上 8:00 到晚上 10:55，單車在一個街區內運行`trip_1` 、 `trip_4`和`trip_5` 。


### stop_times.txt

文件：**必填**

首要的關鍵 （trip_id ,stop_sequence )

| 字段名稱                  | 類型                     | 在場        | 描述                                                                                                                                                                                                                                                                                                                                                                                                                  |   |
| --------------------- | ---------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | - |
| `trip_id`             | 國外身份證參考`trips.trip_id` | **必需的**   | 標識行程。 |   |
| `arrival_time`        | 時間                     | **有條件要求** | 到達站點的時間（定義為`stop_times.stop_id`) 用於特定行程（定義為`stop_times.trip_id`）。 <br/><br/>如果停靠點沒有不同的到達和離開時間，`arrival_time`和`departure_time`應該是一樣的。 <br/><br/>對於在服務日午夜之後發生的時間，請以大於 24:00:00 的值輸入時間，以旅行當天的 HH:MM:SS 本地時間Schedule開始。 <br/><br/>如果準確的到達和離開時間（`timepoint=1`或空）不可用，估計或插值到達和離開時間（`timepoint=0` ) 應提供。 <br/><br/>有條件要求：<br/> -**必需的**旅行中的第一站和最後一站（定義為`stop_times.stop_sequence`）。 <br/> -**必需的**為了`timepoint=1` .<br/> - 否則可選。 |   |
| `departure_time`      | 時間                     | **有條件要求** | 從站點出發的時間（定義為`stop_times.stop_id`) 用於特定行程（定義為`stop_times.trip_id` ）。 <br/><br/>如果停靠點沒有不同的到達和離開時間，`arrival_time`和`departure_time`應該是一樣的。 <br/><br/>對於在服務日午夜之後發生的時間，請以大於 24:00:00 的值輸入時間，以旅行當天的 HH:MM:SS 本地時間Schedule開始。 <br/><br/>如果準確的到達和離開時間（`timepoint=1`或空）不可用，估計或插值到達和離開時間（`timepoint=0` ) 應提供。 <br/><br/>有條件要求：<br/> -**必需的**為了`timepoint=1` .<br/> - 否則可選。 |   |
| `stop_id`             | 國外身份證參考`stops.stop_id` | **必需的**   | 標識服務停止。旅行期間服務的所有站點必須在[stop_times.txt](#stop_timestxt).參考位置必須是站點/平台，即它們的`stops.location_type`值必須是`0`或為空。在同一個行程中，一個站點可以服務多次，並且多個行程和路線可以為同一個站點提供服務。 |   |
| `stop_sequence`       | 非負整數                   | **必需的**   | 特定行程的停靠順序。這些值必須隨著行程增加，但不需要是連續的。 <hr/>*示例：行程中的第一個位置可能有`stop_sequence` =`1`，旅途中的第二個地點可能有`stop_sequence` =`23`，第三個位置可能有`stop_sequence` =`40`， 等等。 *                                                                                                                                                                                                                                                                      |   |
| `stop_headsign`       | 文本                     | 可選的       | 出現在標牌上的文字，用於向乘客指明行程的目的地。此字段覆蓋默認值`trips.trip_headsign`當headsign在停止之間變化時。如果在整個行程中都顯示頭標，`trips.trip_headsign`應改為使用。 <br/><br/>一個`stop_headsign`為一指定的值`stop_time`不適用於後續`stop_time`s 在同一次旅行中。如果你想覆蓋`trip_headsign`對於多個`stop_time`s 在同一次旅行中，`stop_headsign`值必須在每個重複`stop_time`排。 |   |
| `pickup_type`         | 枚舉                     | 可選的       | 表示取貨方式。有效的選項是：<br/><br/>`0`或空 - 定期取貨。 <br/>`1` - 不提供接送服務。 <br/>`2` - 必須打電話給代理商安排取件。 <br/>`3` - 必須與司機協調安排接送。 |   |
| `drop_off_type`       | 枚舉                     | 可選的       | 表示下車方式。有效的選項是：<br/><br/>`0`或空車 - 定期下車。 <br/>`1` - 不提供下車服務。 <br/>`2` - 必須致電代理安排下車。 <br/>`3` - 必須與司機協調安排下車。 |   |
| `continuous_pickup`   | 枚舉                     | 可選的       | 表示騎手可以在車輛行駛路徑上的任何點登上運輸車輛，如`shapes.txt` ， 由此`stop_time`到下一個`stop_time`在旅途中`stop_sequence`.有效的選項是：<br/><br/>`0` - 連續停止皮卡。 <br/>`1`或空 - 沒有連續停止拾取。 <br/>`2` - 必須打電話給代理安排連續停止取件。 <br/>`3` - 必須與司機協調安排連續停車接送。 <br/><br/>如果填充此字段，它會覆蓋定義的任何連續拾取行為`routes.txt`.如果此字段為空，則`stop_time`繼承定義的任何連續拾取行為`routes.txt` .                                                                                                                   |   |
| `continuous_drop_off` | 枚舉                     | 可選的       | 表示騎手可以在車輛行駛路徑上的任何點從運輸車輛下車，如下所述`shapes.txt`， 由此`stop_time`到下一個`stop_time`在旅途中`stop_sequence` .有效的選項是：<br/><br/>`0`- 連續停止下降。 <br/>`1`或空 - 沒有連續停止下降。 <br/>`2` - 必須打電話給代理商安排連續的中途下車。 <br/>`3` - 必須與司機協調安排連續停車下車。 <br/><br/>如果填充此字段，它將覆蓋定義的任何連續下降行為`routes.txt`.如果此字段為空，則`stop_time`繼承定義在`routes.txt` .|   |
| `shape_dist_traveled` | 非負浮動                   | 可選的       | 沿相關形狀行進的實際距離，從第一個停靠點到此記錄中指定的停靠點。此字段指定在行程中任意兩個停靠點之間要繪製多少形狀。必須使用相同的單位[shapes.txt](#shapestxt).用於的值`shape_dist_traveled`必須隨著`stop_sequence`;它們不得用於顯示沿路線的反向行駛。 <hr/>*示例：如果一輛公共汽車從形狀的起點到終點的距離為 5.25 公里，`shape_dist_traveled` =`5.25` .*                                                                                                                                                                                   |   |
| `timepoint`           | 枚舉                     | 可選的       | 指示車輛是否嚴格遵守停靠點的到達和離開時間，或者它們是否是近似和/或插值時間。該字段允許GTFS生產者提供插值的停止時間，同時指示時間是近似的。有效的選項是：<br/><br/>`0` - 時間被認為是近似的。 <br/>`1`或空 - 時間被認為是準確的。 |   |

### calendar.txt

文件：**有條件要求**

首要的關鍵 （service_id )

| 字段名稱         | 類型   | 在場      | 描述                                                                                                                                                                           |
| ------------ | ---- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `service_id` | 唯一身份 | **必需的** | 確定服務可用於一條或多條路線的一組日期。每個`service_id`值必須是唯一的[calendar.txt](#calendartxt)文件。 |
| `monday`     | 枚舉   | **必需的** | 指示服務是否在指定日期範圍內的所有星期一運行`start_date`和`end_date`字段。請注意，特定日期的例外情況可能會在[calendar_dates.txt](#calendar_datestxt) .有效的選項是：<br/><br/>`1`- 服務適用於日期範圍內的所有星期一。 <br/>`0` - 日期範圍內的星期一不提供服務。 |
| `tuesday`    | 枚舉   | **必需的** | 功能同上`monday`週二除外                                                                                                                                                             |
| `wednesday`  | 枚舉   | **必需的** | 功能同上`monday`週三除外                                                                                                                                                             |
| `thursday`   | 枚舉   | **必需的** | 功能同上`monday`週四除外                                                                                                                                                             |
| `friday`     | 枚舉   | **必需的** | 功能同上`monday`週五除外                                                                                                                                                             |
| `saturday`   | 枚舉   | **必需的** | 功能同上`monday`週六除外。 |
| `sunday`     | 枚舉   | **必需的** | 功能同上`monday`週日除外。 |
| `start_date` | 日期   | **必需的** | 保養間隔的開始保養日。 |
| `end_date`   | 日期   | **必需的** | 服務間隔的結束服務日。該服務日包括在間隔中。 |

### calendar_dates.txt

文件：**有條件要求**

首要的關鍵 （service_id , `date` )

這calendar_dates.txt表按日期顯式激活或禁用服務。它可以以兩種方式使用。

* 推薦：使用calendar_dates.txt和這個結合calendar.txt定義中定義的默認服務模式的例外calendar.txt .如果服務通常是定期的，在明確的日期有一些變化（例如，為了適應特殊活動服務，或學校Schedule)，這是一個很好的方法。在這種情況下`calendar_dates. service_id`service_id是一個外國 ID 參考`calendar. service_id`service_id .
* 替代：省略calendar.txt ，並指定每個服務日期calendar_dates.txt .這允許相當大的服務變化並適應沒有正常每週時間表的服務。在這種情況下service_id是一個身份證。

| 字段名稱             | 類型                               | 在場      | 描述                                                                                                                                                                                                                                                                                                                                                           |
| ---------------- | -------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `service_id`     | 國外身份證參考`calendar.service_id`或身份證 | **必需的** | 標識一個或多個路由發生服務異常時的一組日期。每個 （`service_id` ,`date` ) 對只能出現一次[calendar_dates.txt](#calendar_datestxt)如果使用[calendar.txt](#calendartxt)和[calendar_dates.txt](#calendar_datestxt)同時。如果一個`service_id`值出現在兩者中[calendar.txt](#calendartxt)和[calendar_dates.txt](#calendar_datestxt), 中的信息[calendar_dates.txt](#calendardatestxt)修改指定的服務信息[calendar.txt](#calendartxt) . |
| `date`           | 日期                               | **必需的** | 發生服務異常的日期。 |
| `exception_type` | 枚舉                               | **必需的** | 指示服務是否在日期字段中指定的日期可用。有效的選項是：<br/><br/> `1` - 已在指定日期添加服務。 <br/>`2` - 已在指定日期刪除服務。 <hr/>*示例：假設一條路線在節假日有一組可用的行程，而在所有其他日子有另一組可用的行程。一`service_id`可以對應於常規服務Schedule和另一個`service_id`可以對應假期Schedule.對於特定的節日，[calendar_dates.txt](#calendar_datestxt)文件可用於將假期添加到假期`service_id`並從常規中刪除假期`service_id`Schedule.*                                                             |

### fare_attributes.txt

文件：**可選**

首要的關鍵 （fare_id )

**版本**<br/>有兩種用於描述票價的建模選項。 GTFS -Fares V1 是用於描述最低票價信息的傳統選項。 GTFS -Fares V2 是一種更新的方法，可以更詳細地說明代理商的票價結構。兩者都允許出現在數據集中，但數據消費者對於給定的數據集只能使用一種方法。建議GTFS -Fares V2 優先於GTFS -票價 V1。 <br/><br/>相關的文件GTFS -票價 V1 是：<br/>-fare_attributes.txt<br/>-fare_rules.txt<br/><br/>相關的文件GTFS -票價 V2 是：<br/>-fare_products.txt<br/>-fare_leg_rules.txt<br/>-fare_transfer_rules.txt

<br/>

| 字段名稱                | 類型                        | 在場        | 描述                                                                                                     |
| ------------------- | ------------------------- | --------- | ------------------------------------------------------------------------------------------------------ |
| `fare_id`           | 唯一身份                      | **必需的**   | 標識票價等級。 |
| `price`             | 非負浮動                      | **必需的**   | 票價，單位為`currency_type` .                                                                                |
| `currency_type`     | 貨幣代碼                      | **必需的**   | 用於支付票價的貨幣。 |
| `payment_method`    | 枚舉                        | **必需的**   | 指示必須支付票價的時間。有效的選項是：<br/><br/>`0` - 車費在船上支付。 <br/>`1` - 必須在登機前支付車費。 |
| `transfers`         | 枚舉                        | **必需的**   | 表示此票價允許的換乘次數。有效的選項是：<br/><br/>`0` - 此票價不允許換乘。 <br/>`1` - 車手可以轉移一次。 <br/>`2` - 車手可以轉移兩次。 <br/>空 - 允許無限制轉移。 |
| `agency_id`         | 國外身份證參考`agency.agency_id` | **有條件要求** | 標識票價的相關機構。 <br/><br/>有條件要求：<br/> -**必需的**如果定義了多個機構`agency.txt` .<br/> - 否則可選。 |
| `transfer_duration` | 非負整數                      | 可選的       | 傳輸到期前的時間長度（以秒為單位）。什麼時候`transfers` =`0`此字段可用於指示票的有效期或留空。 |

### fare_rules.txt

文件：**有條件要求**

主鍵 ( `*` )

這fare_rules.txt表指定票價如何fare_attributes.txt申請行程。大多數票價結構使用以下規則的某種組合：

* 票價取決於始發站或目的地站。
* 票價取決於行程經過的區域。
* 票價取決於行程使用的路線。

有關演示如何指定票價結構的示例fare_rules.txt和fare_attributes.txt ，請參閱 GoogleTransitDataFeed 開源項目 wiki 中的<https://code.google.com/p/googletransitdatafeed/wiki/FareExamples> 。

| 字段名稱             | 類型                               | 在場      | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ---------------- | -------------------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fare_id`        | 國外身份證參考`fare_attributes.fare_id` | **必需的** | 標識票價等級。|
| `route_id`       | 國外身份證參考`routes.route_id`         | 可選的     | 標識與票價等級關聯的路線。如果存在多條具有相同票價屬性的路線，請在[fare_rules.txt](#fare_rules.txt)對於每條路線。 <hr/>*示例：如果票價等級“b”在路線“TSW”和“TSE”上有效，則[fare_rules.txt](#fare_rules.txt)文件將包含票價等級的這些記錄：* <br/> `  fare_id,route_id `<br/>`b,TSW` <br/> `b,TSE`                                                                                                                                                                                                                                                                                |
| `origin_id`      | 國外身份證參考`stops.zone_id`           | 可選的     | 標識一個原始區域。如果一個票價艙位有多個始發區，請在[fare_rules.txt](#fare_rules.txt)對於每個`origin_id` .<hr/>*示例：如果票價等級“b”適用於從“2”區或“8”區出發的所有旅行，則[fare_rules.txt](#fare_rules.txt)文件將包含票價等級的這些記錄：* <br/> `fare_id,...,origin_id` <br/> `b,...,2`  <br/> `b,...,8`                                                                                                                                                                                                                                                                 |
| `destination_id` | 國外身份證參考`stops.zone_id`           | 可選的     | 標識目標區域。如果票價等級有多個目的地區域，請在[fare_rules.txt](#fare_rules.txt)對於每個`destination_id` .<hr/>*示例：`origin_id`和`destination_id`可以一起使用字段來指定票價等級“b”對於區域 3 和 4 之間的旅行有效，對於區域 3 和 5 之間的旅行，[fare_rules.txt](#fare_rules.txt)文件將包含票價等級的這些記錄：* <br/>`fare_id,...,origin_id,destination_id` <br/>`b,...,3,4`<br/> `b,...,3,5`                                                                                                                                                                                            |
| `contains_id`    | 國外身份證參考`stops.zone_id`           | 可選的     | 識別乘客在使用給定票價等級時將進入的區域。在某些系統中用於計算正確的票價等級。 <hr/>*示例：如果票價等級“c”與經過 5、6 和 7 區的 GRT 路線上的所有旅行相關聯，則[fare_rules.txt](#fare_rules.txt)將包含這些記錄：* <br/> `fare_id,route_id,...,contains_id` <br/>  `c,GRT,...,5` <br/>`c,GRT,...,6` <br/>`c,GRT,...,7` <br/> *因為所有`contains_id`必須匹配區域才能應用票價，經過 5 區和 6 區但不經過 7 區的行程將沒有票價等級“c”。有關更多詳細信息，請參閱[ https://code.google.com/p/googletransitdatafeed/wiki/FareExamples](https://code.google.com/p/googletransitdatafeed/wiki/FareExamples)在 GoogleTransitDataFeed 項目 wiki 中。 * |


### fare_products.txt

文件：**可選**

首要的關鍵 （fare_product_id )

描述乘客可以購買的不同類型的車票或票價。

| 字段名稱                | 類型   | 在場      | 描述                                 |
| ------------------- | ---- | ------- | ---------------------------------- |
| `fare_product_id`   |  ID  | **必需的** | 標識票價產品。 |
| `fare_product_name` | 文本   | 可選的     | 向乘客顯示的票價產品的名稱。 |
| `amount`            | 貨幣金額 | **必需的** | 票價產品的成本。可能為負數表示轉讓折扣。可能為零表示免費的票價產品。 |
| `currency`          | 貨幣代碼 | **必需的** | 票價產品成本的貨幣。 |


### fare_leg_rules.txt

文件：**可選**

首要的關鍵 （network_id `network_id , from_area_id , to_area_id , fare_product_id`from_area_id `network_id , from_area_id , to_area_id , fare_product_id`to_area_id `network_id , from_area_id , to_area_id , fare_product_id`fare_product_id )

單程旅行的票價規則。

票價fare_leg_rules.txt必須通過過濾文件中的所有記錄來查找與騎手要行駛的腿相匹配的規則來查詢。

要處理一條腿的成本：

1. 文件fare_leg_rules.txt必須按定義旅行特徵的字段進行過濾，這些字段是：
   - `fare_leg_rules. network_id`network_id
   - `fare_leg_rules. from_area_id`from_area_id
   - `fare_leg_rules. to_area_id`to_area_id<br/>

<br/>

2. 如果腿與記錄完全匹配fare_leg_rules.txt根據旅行的特點，必須處理該記錄以確定行程的費用。
3. 如果未找到完全匹配項，則`fare_leg_rules. network_id`network_id , `fare_leg_rules. from_area_id`from_area_id , 和`fare_leg_rules. to_area_id`to_area_id必須檢查以處理腿的成本：
   - `fare_leg_rules. network_id`network_id對應於定義的所有網絡routes.txt不包括`fare_leg_rules. network_id`network_id
   - `fare_leg_rules. from_area_id`from_area_id對應於area中定義的所有`areas. area_id`area_id不包括`fare_leg_rules. from_area_id`from_area_id
   - `fare_leg_rules. to_area_id`to_area_id對應於area中定義的所有`areas. area_id`area_id不包括`fare_leg_rules. to_area_id`to_area_id<br/>

<br/>

4. 如果航段不符合上述任何規則，則票價未知。

<br/>

| 字段名稱              | 類型                                     | 在場      | 描述                                                                                                                                                                                                                                                                                                                                                                                  |
| ----------------- | -------------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `leg_group_id`    |  ID                                    | 可選的     | 標識一組條目[fare_leg_rules.txt](#fare_leg_rulestxt) .<br/><br/>用於描述之間的票價轉移規則`fare_transfer_rules.from_leg_group_id`和`fare_transfer_rules.to_leg_group_id` .<br/><br/>中的多個條目[fare_leg_rules.txt](#fare_leg_rulestxt)可能屬於同一個`fare_leg_rules.leg_group_id` .<br/><br/>相同的條目[fare_leg_rules.txt](#fare_leg_rulestxt)（不包括`fare_leg_rules.leg_group_id`) 不能屬於多個`fare_leg_rules.leg_group_id` . |
| `network_id`      | 國外身份證參考`routes.network_id`             | 可選的     | 標識適用票價段規則的路線網絡。 <br/><br/>如果沒有匹配`fare_leg_rules.network_id`的價值觀`network_id`被過濾，為空`fare_leg_rules.network_id`默認會匹配。 <br/><br/>中的一個空條目`fare_leg_rules.network_id`對應於定義的所有網絡`routes.txt`不包括下面列出的那些`fare_leg_rules.network_id`                                                                                                                                                            |
| `from_area_id`    | 國外身份證參考`areas.area_id`                 | 可選的     | 標識出發區。 <br/><br/>如果沒有匹配`fare_leg_rules.from_area_id`的價值觀`area_id`被過濾，為空`fare_leg_rules.from_area_id`默認會匹配。 <br/><br/>中的一個空條目`fare_leg_rules.from_area_id`對應於定義的所有區域`areas.area_id`不包括下面列出的那些`fare_leg_rules.from_area_id`                                                                                                                                                             |
| `to_area_id`      | 國外身份證參考`areas.area_id`                 | 可選的     | 標識到達區域。 <br/><br/>如果沒有匹配`fare_leg_rules.to_area_id`的價值觀`area_id`被過濾，為空`fare_leg_rules.to_area_id`默認會匹配。 <br/><br/>中的一個空條目`fare_leg_rules.to_area_id`對應於定義的所有區域`areas.area_id`不包括下面列出的那些`fare_leg_rules.to_area_id`                                                                                                                                                                    |
| `fare_product_id` | 國外身份證參考`fare_products.fare_product_id` | **必需的** | 行程所需的票價產品。 |


### fare_transfer_rules.txt

文件：**可選**

首要的關鍵 （from_leg_group_id `from_leg_group_id , to_leg_group_id , fare_product_id , transfer_count , duration_limit`to_leg_group_id `from_leg_group_id , to_leg_group_id , fare_product_id , transfer_count , duration_limit`fare_product_id `from_leg_group_id , to_leg_group_id , fare_product_id , transfer_count , duration_limit`transfer_count `from_leg_group_id , to_leg_group_id , fare_product_id , transfer_count , duration_limit`duration_limit )

中定義的旅行航段之間換乘的票價規則fare_leg_rules.txt .

處理多段旅程的成本：

1. 中定義的適用票價段組fare_leg_rules.txt應根據騎手的行程為所有單獨的行程段確定。

2. 文件fare_transfer_rules.txt必須通過定義傳輸特徵的字段進行過濾，這些字段是：
   - `fare_transfer_rules. from_leg_group_id`from_leg_group_id
   - `fare_transfer_rules. to_leg_group_id`to_leg_group_id<br/>
   <br/>

3. 如果轉移與記錄完全匹配fare_transfer_rules.txt根據轉移的特徵，必須處理該記錄以確定轉移成本。

4. 如果沒有找到完全匹配，則在from_leg_group_id或在to_leg_group_id必須檢查以處理轉移成本：
   - `fare_transfer_rules. from_leg_group_id`from_leg_group_id對應於`fare_leg_rules.leg_group_id`下定義的所有航段組，不包括 fare_transfer_rules 下列出的航段組`fare_transfer_rules. from_leg_group_id`from_leg_group_id
   - `fare_transfer_rules. to_leg_group_id`to_leg_group_id對應於`fare_leg_rules.leg_group_id`下定義的所有航段組，不包括 fare_transfer_rules 下列出的航段組`fare_transfer_rules. to_leg_group_id`to_leg_group_id<br/>
   <br/>

5. 如果轉移不符合上述任何規則，則沒有轉移安排，並且腿被認為是分開的。

<br/>


| 字段名稱                | 類型                                   | 在場  | 描述                                                                                                                                                                                                                                                                                         |
| ------------------- | ------------------------------------ | --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `from_leg_group_id` | 國外身份證參考`fare_leg_rules.leg_group_id` | 可選的 | 標識一組轉乘前票價段規則。 <br/><br/>如果沒有匹配`fare_transfer_rules.from_leg_group_id`的價值觀`leg_group_id`被過濾，為空`fare_transfer_rules.from_leg_group_id`默認會匹配。 <br/><br/>中的一個空條目`fare_transfer_rules.from_leg_group_id`對應於下定義的所有腿組`fare_leg_rules.leg_group_id`不包括下面列出的那些`fare_transfer_rules.from_leg_group_id` |
| `to_leg_group_id`   | 國外身份證參考`fare_leg_rules.leg_group_id` | 可選的 | 標識一組轉換後票價段規則。 <br/><br/>如果沒有匹配`fare_transfer_rules.to_leg_group_id`的價值觀`leg_group_id`被過濾，為空`fare_transfer_rules.to_leg_group_id`默認會匹配。 <br/><br/>中的一個空條目`fare_transfer_rules.to_leg_group_id`對應於下定義的所有腿組`fare_leg_rules.leg_group_id`不包括下面列出的那些`fare_transfer_rules.to_leg_group_id`         |
| `transfer_count` |非零整數 |**有條件禁止**|定義傳輸規則可以應用於多少連續傳輸。 <br/><br/>有效的選項是：<br/>`-1` - 沒有限制。 <br/>`1`或更多 - 定義傳輸規則可能跨越的傳輸數量。 <br/><br/>如果一個子旅程匹配多個不同的記錄transfer_count s，那麼最小的規則transfer_count大於或等於子旅程當前傳輸計數的將被選擇。 <br/><br/>有條件禁止：<br/>-**禁止**如果`fare_transfer_rules. from_leg_group_id`from_leg_group_id不等於`fare_transfer_rules. to_leg_group_id`to_leg_group_id .<br/>- 如果`fare_transfer_rules. from_leg_group_id`是**必需**的。 from_leg_group_id等於`fare_transfer_rules. to_leg_group_id`to_leg_group_id . |
|duration_limit |正整數 |可選 |定義傳輸的持續時間限制。 <br/><br/>必須以秒為增量的整數表示。 <br/><br/>如果沒有持續時間限制， `fare_transfer_rules. duration_limit`duration_limit必須為空。 || `duration_limit_type` |枚舉 |**有條件要求**|定義`fare_transfer_rules. duration_limit`duration_limit .<br/><br/>有效的選項是：<br/>`0` - 當前航段的出發票價驗證和下一航段的到達票價驗證之間。 <br/>`1` - 在當前航段的出發票價驗證和下一航段的出發票價驗證之間。 <br/>`2` - 在當前航段的到達票價驗證和下一航段的出發票價驗證之間。 <br/>`3` - 在當前航段的到達票價驗證和下一航段的到達票價驗證之間。 <br/><br/>有條件要求：<br/>- 如果`fare_transfer_rules. duration_limit`是**必需**的。 duration_limit被定義為。 <br/>-**禁止**如果`fare_transfer_rules. duration_limit`duration_limit是空的。 |
| `fare_transfer_type` | 枚舉 | **必填** | 表示旅程中段間中轉的費用處理方式：<br/>![](../assets/2-leg.svg)<br/>有效的選項是：<br/>`0` - `fare_leg_rules.fare_product_id`加上`fare_transfer_rules.fare_product_id` ；甲+乙。 <br/>`1` - `fare_leg_rules.fare_product_id`加上`fare_transfer_rules.fare_product_id`加上到段`fare_leg_rules.fare_product_id` ；甲+乙+乙。 <br/>`2` - `fare_transfer_rules.fare_product_id` ； AB。 <br/><br/>旅程中多次轉移之間的成本處理交互：<br/>![](../assets/3-leg.svg)<br/><table><thead><tr><th>`fare_transfer_type`</th><th>加工 A > B</th><th>加工 B > C</th></tr></thead><tbody><tr><td>`0`</td><td>A + AB</td><td>S + BC</td></tr><tr><td>`1`</td><td>A + AB +B</td><td>S + BC + C</td></tr><tr><td>`2`</td><td>AB</td><td>S + BC</td></tr></tbody></table>其中 S 表示前一個分支和轉移的總處理成本。 |
| `fare_product_id` |引用`fare_products. fare_product_id`fare_product_id |可選 |在兩個票價段之間轉移所需的票價產品。如果為空，則傳輸規則的成本為 0。 |<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

### areas.txt

文件：**可選**

首要的關鍵 （area_id )

定義區域標識符。

| 字段名稱        | 類型   | 在場      | 描述                                    |
| ----------- | ---- | ------- | ------------------------------------- |
| `area_id`   | 唯一身份 | **必需的** | 標識一個區域。必須是唯一的[areas.txt](#areastxt) . |
| `area_name` | 文本   | **可選的** | 向騎手顯示的區域名稱。 |

### stop_areas.txt

文件：**可選**

主鍵 ( `*` )

指定站點從stops.txt到地區。

| 字段名稱      | 類型                     | 在場      | 描述                                                                                                                                                    |
| --------- | ---------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `area_id` | 國外身份證參考`areas.area_id` | **必需的** | 識別一個或多個區域`stop_id`屬於。相同`stop_id`可以定義在很多`area_id` s。 |
| `stop_id` | 國外身份證參考`stops.stop_id` | **必需的** | 標識一個停靠點。如果一個站（即停止與`stops.location_type=1`) 在該字段中定義，假設它的所有平台（即全部以`stops.location_type=0`有這個站定義為`stops.parent_station`) 是同一區域的一部分。可以通過將平台分配給其他區域來覆蓋此行為。 |

### shapes.txt

文件：**可選**

首要的關鍵 （shape_id ,shape_pt_sequence )

形狀描述車輛沿路線路線行駛的路徑，並在文件中定義shapes.txt .形狀與行程相關聯，由車輛按順序通過的一系列點組成。形狀不需要精確地截取停靠點的位置，但行程中的所有停靠點都應位於該行程的形狀的一小段距離內，即靠近連接形狀點的直線段。

| 字段名稱                  | 類型   | 在場      | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| --------------------- | ---- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `shape_id`            |  ID  | **必需的** | 標識一個形狀。 |
| `shape_pt_lat`        | 緯度   | **必需的** | 形狀點的緯度。中的每條記錄[shapes.txt](#shapestxt)表示用於定義形狀的形狀點。|
| `shape_pt_lon`        | 經度   | **必需的** | 形狀點的經度。 |
| `shape_pt_sequence`   | 非負整數 | **必需的** | 形狀點連接以形成形狀的順序。值必須隨行程增加，但不需要是連續的。 <hr/>*示例：如果形狀“A_shp”在其定義中包含三個點，則[shapes.txt](#shapestxt)文件可能包含這些記錄來定義形狀：* <br/> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence` <br/> `A_shp,37.61956,-122.48161,0` <br/> `A_shp,37.64430,-122.41070,6` <br/> `A_shp,37.65863,-122.30839,11`                                                                                                                                                    |
| `shape_dist_traveled` | 非負浮動 | 可選的     | 從第一個形狀點到此記錄中指定的點沿形狀行進的實際距離。旅行計劃者用來在地圖上顯示正確的形狀部分。值必須隨著增加`shape_pt_sequence`;它們不得用於顯示沿路線的反向行駛。距離單位必須與所使用的一致[stop_times.txt](#stop_timestxt) .<hr/>*示例：如果一輛公共汽車沿著上面為 A_shp 定義的三個點行駛，附加的`shape_dist_traveled`值（此處以公里顯示）如下所示：* <br/> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled` <br/> `A_shp,37.61956,-122.48161,0,0`<br/>`A_shp,37.64430,-122.41070,6,6.8310` <br/> `A_shp,37.65863,-122.30839,11,15.8765` |

### frequencies.txt

文件：**可選**

首要的關鍵 （trip_id ,start_time )

frequencies.txt表示按常規車距運行的行程（行程之間的時間）。該文件可用於表示兩種不同類型的服務。

* 基於頻率的服務 ( `exact_times` = `0` )，其中服務不遵循固定的Schedule全天。相反，運營商試圖嚴格保持預定的行程間隔。
* 的壓縮表示Schedule-based 服務 ( `exact_times` = `1` )，在指定時間段內具有完全相同的行程。在Schedule化服務經營者盡量嚴格遵守Schedule.

| 字段名稱           | 類型                     | 在場      | 描述                                                                                                                                                                           |
| -------------- | ---------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip_id`      | 國外身份證參考`trips.trip_id` | **必需的** | 標識指定服務時距適用的行程。 |
| `start_time`   | 時間                     | **必需的** | 第一輛車以指定車距從行程的第一站出發的時間。 |
| `end_time`     | 時間                     | **必需的** | 在行程的第一站，服務更改為不同的發車時間（或停止）的時間。 |
| `headway_secs` | 正整數                    | **必需的** | 在指定的時間間隔內，從同一站點（車距）出發的時間（以秒為單位）`start_time`和`end_time` .可以為同一行程定義多個車頭時距，但不得重疊。新的進展可能會在前一個進展結束的確切時間開始。 |
| `exact_times`  | 枚舉                     | 可選的     | 指示旅行的服務類型。有關詳細信息，請參閱文件說明。有效的選項是：<br/><br/>`0`或空 - 基於頻率的行程。 <br/>`1` -Schedule全天以完全相同的進度為基礎的旅行。在這種情況下`end_time`值必須大於上次所需的行程`start_time`但少於最後一次想要的行程start_time+`headway_secs` . |

### transfers.txt

文件：**可選**

首要的關鍵 （from_stop_id ,to_stop_id ,from_trip_id ,to_trip_id ,from_route_id ,to_route_id )

在計算行程時，GTFS - 消耗應用程序根據允許的時間插入傳輸並停止接近。 transfers.txt為選定的傳輸指定附加規則和覆蓋。

字段from_trip_id ,to_trip_id ,from_route_id和to_route_id允許更高階的傳輸規則特異性。隨著from_stop_id和to_stop_id ，特異性排名如下：

1. 兩個都trip_id定義：from_trip_id和to_trip_id .
2. 一trip_id和route_id集定義：（from_trip_id和to_route_id ） 或者 （from_route_id和to_trip_id ）。
3. 一trip_id定義：from_trip_id或者to_trip_id .
4. 兩個都route_id定義：from_route_id和to_route_id .
5. 一route_id定義：from_route_id或者to_route_id .
6. 僅有的from_stop_id和to_stop_id已定義：未設置路線或行程相關字段。

對於給定有序的到達行程和出發行程對，選擇在這兩個行程之間應用的具有最大特異性的轉移。對於任何一對旅行，不應該有兩個具有同等最大特異性的轉移可以適用。


| 字段名稱                | 類型                       | 在場        | 描述                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------- | ------------------------ | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|`from_stop_id`      | 國外身份證參考`stops.stop_id`   | **有條件要求** | 標識路線之間開始連接的站點或車站。如果此字段涉及車站，則換乘規則適用於其所有子車站。禁止引用一個站`transfer_types`4 和 5。 |
| `to_stop_id`        | 國外身份證參考`stops.stop_id`   | **有條件要求** | 標識路線之間的連接結束的站點或車站。如果此字段涉及車站，則換乘規則適用於所有子站點。禁止引用一個站`transfer_types` 4 和 5。 |
| `from_route_id`     | 國外身份證參考`routes.route_id` | 可選的       | 標識連接開始的路由。 <br/><br/>如果`from_route_id`已定義，轉移將適用於給定路線上的到達行程`from_stop_id` .<br/><br/>如果兩者`from_trip_id`和`from_route_id`被定義，`trip_id`必須屬於`route_id`， 和`from_trip_id`將優先。 |
| `to_route_id`       | 國外身份證參考`routes.route_id` | 可選的       | 標識連接結束的路徑。 <br/><br/>如果`to_route_id`已定義，轉移將適用於給定路線上的出發行程`to_stop_id` .<br/><br/>如果兩者`to_trip_id`和`to_route_id`被定義，`trip_id`必須屬於`route_id`， 和`to_trip_id`將優先。 |
| `from_trip_id`      | 國外身份證參考`trips.trip_id`   | **有條件要求** | 標識路線之間的連接開始的行程。 <br/><br/>如果`from_trip_id`已定義，轉移將適用於給定的到達行程`from_stop_id` .<br/><br/>如果兩者`from_trip_id`和`from_route_id`被定義，`trip_id`必須屬於`route_id`， 和`from_trip_id`將優先。如果需要`transfer_type`是`4`或者`5` .                                                                                                                                                                                           |
| `to_trip_id`        | 國外身份證參考`trips.trip_id`   | **有條件要求** | 標識路線之間的連接結束的行程。 <br/><br/>如果`to_trip_id`已定義，轉移將適用於給定的出發行程`to_stop_id` .<br/><br/>如果兩者`to_trip_id`和`to_route_id`被定義，`trip_id`必須屬於`route_id`， 和`to_trip_id`將優先。如果需要`transfer_type`是`4`或者`5` .                                                                                                                                                                                                     |
| `transfer_type`     | 枚舉                       | **必需的**   | 指示指定的連接類型 (`from_stop_id` ,`to_stop_id` ） 一對。有效的選項是：<br/><br/> `0`或空 - 路線之間的推薦轉乘點。 <br/>`1` - 兩條路線之間的定時換乘點。預計出發的車輛將等待到達的車輛，並留出足夠的時間讓騎手在路線之間換乘。 <br/>`2` - 轉移需要在到達和離開之間的最短時間，以確保連接。轉移所需的時間由`min_transfer_time` .<br/>`3`- 在該地點的路線之間無法換乘。 <br/>`4`- 乘客可以通過留在同一輛車上從一次旅行轉移到另一次旅行（“座位內轉移”）。有關此類轉移的更多詳細信息[以下](#linked-trips).<br/>`5` - 連續行程之間不允許進行座位內換乘。乘客必須下車並重新上車。有關此類轉移的更多詳細信息[以下](#linked-trips) . |
| `min_transfer_time` | 非負整數                     | 可選的       | 允許在指定站點的路線之間換乘所需的時間量（以秒為單位）。這`min_transfer_time`應該足以允許典型的騎手在兩個站點之間移動，包括緩衝時間以允許Schedule每條路線的差異。 |

#### 聯程旅行

以下適用於`transfer_type=4`和`=5` ，它們用於將旅行鏈接在一起，無論是否有座位內轉移。

連接在一起的行程必須由同一輛車運營。車輛可以與其他車輛連接或分離。

如果同時提供了鏈接的行程轉移和 block_id 並且它們產生衝突的結果，則應使用鏈接的行程轉移。

最後一站from_trip_id應該在地理位置上靠近to_trip_id ，最後到達時間from_trip_id應該早於但接近於第一個出發時間to_trip_id .最後到達時間from_trip_id可能晚於第一個出發時間to_trip_id萬一to_trip_id行程發生在隨後的服務日。

在常規情況下，行程可以 1 對 1 鏈接，但也可以 1 對 n、n 對 1 或 n 對 n 鏈接以表示更複雜的行程繼續。例如，兩個火車行程（下圖中的行程 A 和行程 B）可以在一個公共車站的車輛耦合操作後合併為一個火車行程（行程 C）：

- 在一對一的延續中， `trips. service_id`service_id對於每個to_trip_id必須相同。
- 在 n 對 1 的延續中， `trips. service_id`service_id對於每個from_trip_id必須相同。
- n 對 n 延續必須尊重這兩個約束。
- 旅行可以作為多個不同延續的一部分鏈接在一起，前提是`trip. service_id`service_id不得在任何服務日重疊。

<pre>
旅行甲
────────────────────
                    \ 行程 C
                     ──────────────
行程 B /
────────────────────/
</pre>

### pathways.txt

文件：**可選**

首要的關鍵 （pathway_id )

文件pathways.txt和levels.txt使用圖形表示來描述地鐵或火車站，節點表示位置，邊表示路徑。

要從車站入口/出口（表示為`location_type=2`的位置的節點）導航到平台（表示為`location_type=0`或空的位置的節點），騎手將穿過人行道、檢票口、樓梯，和其他表示為路徑的邊緣。通用節點（用`location_type=3`表示的節點）可用於連接整個車站的路徑。

必須在車站中詳盡地定義路徑。如果定義了任何路徑，則假定代表了整個車站的所有路徑。因此，以下準則適用：

- 無懸空位置：如果車站內的任何位置有通道，則該車站內的所有位置都應有通道，但有登機區的站台除外（ `location_type=4` ，請參閱下面的指南）。
- 具有登機區的平台沒有路徑：具有登機區（ `location_type=4` ）的平台（ `location_type=0`或空）被視為父對象，而不是點。在這種情況下，平台不得分配路徑。應為每個平台的登機區分配所有路徑。
- 無鎖定平台：每個平台（ `location_type=0`或空）或登機區（ `location_type=4` ）必須通過一些路徑鏈連接到至少一個入口/出口（ `location_type=2` ）。不允許從給定站台通往站外的路徑的車站很少見。

| 字段名稱                     |類型                     | 在場      | 描述                                                                                                                                                                                                                                                                                                                          |
| ------------------------ | ---------------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pathway_id`             | 唯一身份                   | **必需的** | 標識通路。被系統用作記錄的內部標識符。在數據集中必須是唯一的。 <br/><br/>不同的路徑可能具有相同的值`from_stop_id`和`to_stop_id` .<hr/>_示例：當兩個自動扶梯並排在相反的方向時，或者當一個樓梯組和電梯從同一個地方到同一個地方時，不同`pathway_id`可能有相同的`from_stop_id`和`to_stop_id`價值觀。 _                                                                                                                                  |
| `from_stop_id`           | 國外身份證參考`stops.stop_id` | **必需的** | 路徑開始的位置。 <br/><br/>必須包含一個`stop_id`標識一個平台（`location_type=0`或空），入口/出口（`location_type=2` ), 通用節點 (`location_type=3` ) 或登機區 (`location_type=4` ）。 <br/><br/>價值觀`stop_id`識別電台（`location_type=1` ) 被禁止。 |
| `to_stop_id`             | 國外身份證參考`stops.stop_id` | **必需的** | 路徑結束的位置。 <br/><br/>必須包含一個`stop_id`標識一個平台（`location_type=0`或空），入口/出口（`location_type=2` ), 通用節點 (`location_type=3` ) 或登機區 (`location_type=4` ）。 <br/><br/>價值觀`stop_id`識別電台（`location_type=1` ) 被禁止。 |
| `pathway_mode`           | 枚舉                     | **必需的** | 指定的路徑類型 (`from_stop_id` ,`to_stop_id` ） 一對。有效的選項是：<br/><br/>`1` - 走道。 <br/>`2` - 樓梯。 <br/>`3` - 移動人行道/旅行者。 <br/>`4` - 自動扶梯。 <br/>`5` - 電梯。 <br/>`6` - 收費門（或支付門）：進入車站區域的通道，需要支付證明才能通過。檢票口可以將車站的付費區域與未付費區域分開，或者將同一站內的不同付費區域相互分開。該信息可用於避免使用需要乘客支付不必要費用的捷徑來引導乘客通過車站，例如引導乘客步行穿過地鐵站台到達公交專用道。 <br/>`7` - 出入口：從付費區域進入未付費區域的通道，無需支付證明即可通過。 |
| `is_bidirectional`       | 枚舉                     | **必需的** | 表示路徑可以走的方向：<br/><br/>`0` - 單向路徑，只能從`from_stop_id`至`to_stop_id` .<br/>`1`- 可以雙向使用的雙向路徑。 <br/><br/>出入口（`pathway_mode=7` ) 不能是雙向的。 |
| `length`                 | 非負浮動                   | 可選的     | 從起始位置開始的路徑水平長度（以米為單位）（定義在`from_stop_id`）到目標位置（定義在`to_stop_id` ）。 <br/><br/>建議將此字段用於人行道（`pathway_mode=1` ), 檢票口 (`pathway_mode=6` ) 和出口大門 (`pathway_mode=7` ）。 |
| `traversal_time`         | 正整數                    | 可選的     | 從起始位置穿過路徑所需的平均時間（以秒為單位）（定義在`from_stop_id`）到目標位置（定義在`to_stop_id` ）。 <br/><br/>建議將此字段用於移動人行道（`pathway_mode=3` ), 自動扶梯 (`pathway_mode=4` ) 和電梯 (`pathway_mode=5` ）。 |
| `stair_count`            | 非空整數                   | 可選的     | 路徑的樓梯數量。 <br/><br/>一個積極的`stair_count`意味著騎手從`from_stop_id`至`to_stop_id`.和一個負面`stair_count`意味著騎手從`from_stop_id`至`to_stop_id` .<br/><br/>建議將此字段用於樓梯（`pathway_mode=2` ）。 <br/><br/>如果只能提供估計的樓梯數，建議 1 層樓大約有 15 個樓梯。 |
| `max_slope`              | 漂浮                     | 可選的     | 路徑的最大坡度比。有效的選項是：<br/><br/>`0`或空 - 沒有斜坡。 <br/>`Float` - 路徑的坡度比，向上為正，向下為負。 <br/><br/>該字段只能用於人行道（`pathway_mode=1` ) 和自動人行道 (`pathway_mode=3` ）。 <hr/>_示例：在美國，0.083（也寫為 8.3%）是手推輪椅的最大坡度比，即每增加 1m 增加 0.083m（即 8.3cm）。 _                                                                                                             |
| `min_width`              | 正浮動                    | 可選的     | 以米為單位的路徑的最小寬度。 <br/><br/>如果最小寬度小於 1 米，建議使用此字段。 |
| `signposted_as`          | 文本                     | 可選的     | 來自騎手可見的物理標牌的面向公眾的文本。 <br/><br/>可用於向乘客提供文本指示，例如“跟隨標誌前往”。中的文字`singposted_as`應該完全顯示在標誌上的印刷方式。 <br/><br/>當物理標牌是多語言時，可以按照以下示例填充和翻譯該字段`stops.stop_name`在字段定義中`feed_info.feed_lang` .                                                                                                                                                |
| `reversed_signposted_as` | 文本                     | 可選的| 如同`signposted_as`，但是當從`to_stop_id`到`from_stop_id` .                                                                                                                                                                                                                                                                         |

### levels.txt

文件：**有條件要求**

首要的關鍵 （level_id )

描述站中的級別。配合使用很有用pathways.txt , 並且是使用電梯導航路徑所必需的 ( `pathway_mode=5` )。

| 字段名稱          | 類型   | 在場      | 描述                                                           |
| ------------- | ---- | ------- | ------------------------------------------------------------ |
| `level_id`    | 唯一身份 | **必需的** | 標識站中的級別。 |
| `level_index` | 漂浮   | **必需的** | 指示其相對位置的級別的數字索引。 <br/><br/>地面應有索引`0`, 地上水平由正指數表示，地下水平由負指數表示。 |
| `level_name`  | 文本   | 可選的     | 騎手在建築物或車站內看到的級別名稱。 <hr/>_示例：乘電梯到“Mezzanine”或“Platform”或“-1”。 _ |

### translations.txt

文件：**可選**

首要的關鍵 （table_name ,field_name ,language ,record_id ,record_sub_id ,field_value )

在有多種官方語言的地區，交通機構/運營商通常有language- 特定名稱和網頁。為了最好地為這些地區的騎手服務，數據集包含這些是很有用的language依賴值。

| 字段名稱            | 類型                 | 在場        | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| --------------- | ------------------ | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `table_name`    | 枚舉                 | **必需的**   | 定義包含要翻譯的字段的表。允許的值為：<br/><br/> -`agency`<br/> -`stops`<br/> -`routes`<br/> -`trips`<br/> -`stop_times`<br/> -`pathways`<br/> -`levels`<br/> -`feed_info`<br/> -`attributions`<br/><br/>添加到的任何文件GTFS會有一個`table_name`與上面列出的文件名等效的值（即，不包括`.txt`文件擴展名）。 |
| `field_name`    | 文本                 | **必需的**   | 要翻譯的字段的名稱。具有類型的字段`Text`可以翻譯，字段類型`URL` ,`Email`和`Phone number`也可以“翻譯”以提供正確的資源language.不應翻譯其他類型的字段。 |
| `language`      | language代碼         | **必需的**   | language的翻譯。 <br/><br/>如果language與中相同`feed_info.feed_lang`，該字段的原始值將被假定為在沒有特定翻譯的語言中使用的默認值（如果`default_lang`沒有另外說明）。 <hr/>_示例：在瑞士，一個官方雙語州的城市被正式稱為“Biel/Bienne”，但在法語中簡稱為“Bienne”，在德語中簡稱為“Biel”。 _|
| `translation`   | 文本或 URL 或電子郵件或電話號碼 | **必需的**   | 翻譯價值。 |
| `record_id`     | 外國身份證              | **有條件要求** | 定義對應於要翻譯的字段的記錄。價值在`record_id`必須是表主鍵的第一個或唯一一個字段，如每個表的主鍵屬性中定義的那樣，如下所示：<br/><br/> -`agency_id`為了`agency.txt`<br/> -`stop_id`為了`stops.txt` ;<br/> -`route_id`為了`routes.txt` ;<br/> -`trip_id`為了`trips.txt` ;<br/> -`trip_id`為了`stop_times.txt` ;<br/> -`pathway_id`為了`pathways.txt` ;<br/> -`level_id`為了`levels.txt` ;<br/> -`attribution_id`為了`attribution.txt` .<br/><br/>上面未定義的表中的字段不應翻譯。然而，生產者有時會添加超出官方規範的額外字段，並且這些非官方字段可能會被翻譯。下面是推薦的使用方法`record_id`對於這些表：<br/><br/> -`service_id`為了`calendar.txt` ;<br/> -`service_id`為了`calendar_dates.txt` ;<br/> -`fare_id`為了`fare_attributes.txt` ;<br/> -`fare_id`為了`fare_rules.txt` ;<br/> -`shape_id`為了`shapes.txt` ;<br/> -`trip_id`為了`frequencies.txt` ;<br/> -`from_stop_id`為了`transfers.txt` .<br/><br/>有條件要求：<br/> -**禁止的**如果`table_name`是`feed_info` .<br/> -**禁止的**如果`field_value`被定義為。 <br/> -**必需的**如果`field_value`是空的。 |
| `record_sub_id` | 外國身份證              | **有條件要求** | 當表沒有唯一 ID 時，幫助包含要翻譯的字段的記錄。因此，價值在`record_sub_id`是表的二級ID，如下表所定義：<br/><br/> - 無`agency.txt` ;<br/>- 無`stops.txt` ;<br/>- 無`routes.txt` ;<br/>- 無`trips.txt` ;<br/> -`stop_sequence`為了`stop_times.txt` ;<br/>- 無`pathways.txt` ;<br/>- 無`levels.txt` ;<br/>- 無`attributions.txt` .<br/><br/>上面未定義的表中的字段不應翻譯。然而，生產者有時會添加超出官方規範的額外字段，並且這些非官方字段可能會被翻譯。下面是推薦的使用方法`record_sub_id`對於這些表：<br/><br/>- 無`calendar.txt` ;<br/> -`date`為了`calendar_dates.txt` ;<br/>- 無`fare_attributes.txt` ;<br/> -`route_id`為了`fare_rules.txt` ;<br/>- 無`shapes.txt` ;<br/> -`start_time`為了`frequencies.txt` ;<br/> -`to_stop_id`為了`transfers.txt` .<br/><br/>有條件要求：<br/> -**禁止的**如果`table_name`是`feed_info` .<br/> -**禁止的**如果`field_value`被定義為。 <br/> -**必需的**如果`table_name=stop_times`和`record_id`被定義為。 |
| `field_value`   | 文本或 URL 或電子郵件或電話號碼 | **有條件要求** | 而不是定義應該通過使用翻譯哪個記錄`record_id`和`record_sub_id`，該字段可用於定義應翻譯的值。使用時，將在由 標識的字段時應用翻譯`table_name`和`field_name`包含與中定義的完全相同的值field_value.<br/><br/>該字段必須有**確切地**中定義的值`field_value`.如果只有一部分值匹配`field_value`, 翻譯不會被應用。 <br/><br/>如果兩個翻譯規則匹配相同的記錄（一個與`field_value`，另一個與`record_id`)，規則與`record_id`優先。 <br/><br/>有條件要求：<br/> -**禁止的**如果`table_name`是`feed_info` .<br/> -**禁止的**如果`record_id`被定義為。 <br/> -**必需的**如果`record_id`是空的。 |

### feed_info.txt

文件：**可選**（如果需要，則為**必需**translations.txt提供）

主鍵（無）

該文件包含有關數據集本身的信息，而不是數據集描述的服務。在某些情況下，數據集的發布者與任何機構都是不同的實體。

如果兩種引用方法（record_id ,record_sub_id ） 和field_value用於在 2 個不同的行中翻譯相同的值，提供的翻譯 (record_id ,record_sub_id ) 優先。


| 字段名稱                  | 類型         | 在場      | 描述|
| --------------------- | ---------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `feed_publisher_name` | 文本         | **必需的** | 發布數據集的組織的全名。這可能與其中一個相同`agency.agency_name`價值觀。 |
| `feed_publisher_url`  | 網址         | **必需的** | 數據集發布組織網站的 URL。這可能與其中一個相同`agency.agency_url`價值觀。 |
| `feed_lang`           | language代碼 | **必需的** | 默認language用於此數據集中的文本。此設置有幫助GTFS消費者選擇大小寫規則等language- 數據集的特定設置。文件`translations.txt`如果需要將文本翻譯成默認語言以外的語言，則可以使用。 <br/><br/>默認language對於具有多種語言的原始文本的數據集，可能是多語言的。在這種情況下，`feed_lang`字段應包含language代碼`mul`由標準 ISO 639-2 定義，並為每個language數據集中使用的應提供`translations.txt`.如果數據集中所有的原文都在同一個language， 然後`mul`不應該使用。 <hr/>_示例：考慮來自瑞士等多語言國家的數據集，其原始數據`stops.stop_name`字段填充了不同語言的站點名稱。每個站名都是按照佔優寫的language在該站點的地理位置，例如`Genève`對於講法語的城市日內瓦，`Zürich`對於講德語的城市蘇黎世，以及`Biel/Bienne`為雙語城市比爾/比安。數據集`feed_lang`應該`mul`翻譯將在`translations.txt`， 在德國：`Genf` ,`Zürich`和`Biel` ;法語：`Genève` ,`Zurich`和`Bienne` ;用意大利語：`Ginevra` ,`Zurigo`和`Bienna` ;和英文：`Geneva` ,`Zurich`和`Biel/Bienne` ._ |
| `default_lang`        | language代碼 | 可選的     | 定義language當數據消費者不知道language的騎手。往往會`en`（英語）。 |
| `feed_start_date`     | 日期         | 可選的     | 數據集提供完整可靠Schedule服務開始期間的信息`feed_start_date`一天到結束`feed_end_date`天。如果不可用，這兩天可能會空著。這`feed_end_date`日期不得早於`feed_start_date`日期，如果兩者都給出。建議數據集提供者提供Schedule在此期間之外的數據，以告知可能的未來服務，但數據集消費者應注意其非權威狀態。如果`feed_start_date`或者`feed_end_date`超出定義的活動日曆日期[calendar.txt](#calendartxt)和[calendar_dates.txt](#calendar_datestxt)，數據集明確斷言在`feed_start_date`或者`feed_end_date`範圍但不包括在活動日曆日期中。 |
| `feed_end_date`       | 日期         | 可選的     |  （看上面）                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `feed_version`        | 文本         | 可選的     | 指示其當前版本的字符串GTFS數據集。 GTFS - 消費應用程序可以顯示此值，以幫助數據集發布者確定是否已合併最新數據集。|
| `feed_contact_email`  | 電子郵件       | 可選的     | 用於溝通的電子郵件地址GTFS數據集和數據發布實踐。 `feed_contact_email`是技術聯繫人GTFS - 消耗應用程序。通過以下方式提供客戶服務聯繫信息[agency.txt](#agencytxt) .                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `feed_contact_url`    | 網址         | 可選的     | 聯繫信息的 URL、Web 表單、支持台或其他用於與GTFS數據集和數據發布實踐。 `feed_contact_url`是技術聯繫人GTFS - 消耗應用程序。通過以下方式提供客戶服務聯繫信息[agency.txt](#agencytxt) .                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

### attributions.txt

文件：**可選**

首要的關鍵 （attribution_id )

該文件定義了應用於數據集的屬性。

| 字段名稱                | 類型                        | 在場      | 描述                                                                                                                                          |
| ------------------- | ------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `attribution_id`    | 唯一身份                      | 可選的     | 標識數據集或其子集的屬性。這對翻譯非常有用。 |
| `agency_id`         | 國外身份證參考`agency.agency_id` | 可選的     | 歸屬地適用的機構。 <br/><br/>如果一個`agency_id` ,`route_id` ， 或者`trip_id`屬性已定義，其他必須為空。如果未指定任何一個，則歸因將應用於整個數據集。 |
| `route_id`          | 國外身份證參考`routes.route_id`  | 可選的     | 功能同上`agency_id`除非屬性適用於路線。多個屬性可能適用於同一路線。 |
| `trip_id`           | 國外身份證參考`trips.trip_id`    | 可選的     | 功能同上`agency_id`除非歸因適用於旅行。多個歸因可能適用於同一次旅行。 |
| `organization_name` | 文本                        | **必需的** | 數據集所屬的組織的名稱。 |
| `is_producer`       | 枚舉                        | 可選的     | 組織的角色是生產者。有效的選項是：<br/><br/>`0`或為空 - 組織沒有此角色。 <br/>`1` - 組織確實有這個角色。 <br/><br/>至少其中一個字段`is_producer` ,`is_operator`， 或者`is_authority`應該設置在`1` . |
| `is_operator`       | 枚舉                        | 可選的     | 功能同上`is_producer`除了組織的角色是操作員。 |
| `is_authority`      | 枚舉                        | 可選的     | 功能同上`is_producer`除了組織的作用是權威。 |
| `attribution_url`   | 網址                        | 可選的     | 組織的 URL。 |
| `attribution_email` | 電子郵件                      | 可選的     | 組織的電子郵件。 |
| `attribution_phone` | 電話號碼                      | 可選的     | 組織的電話號碼。 |