---
search:
  exclude: true
---
  
# GTFS Schedule 參考

**2022 年 12 月 8 日修訂。有關詳細信息，請參閱 [Revision History](../revision-history)。**

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
    -   [fare_media.txt](#fare_mediatxt)
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
* **服務日** - 服務日是用於指示路線調度的時間段。服務日的確切定義因機構而異，但服務日通常與日曆日不一致。如果服務在一天開始並在第二天結束，則服務日可能會超過 24:00:00。例如，從周五 08:00:00 到週六 02:00:00 運行的服務可以表示為在單個服務日從 08:00:00 到 26:00:00 運行。
* **文本轉語音字段** - 該字段應包含與其父字段相同的信息（如果為空則回退）。它旨在被解讀為文本轉語音，因此，應該刪除縮寫（“St”應該讀作“Street”或“Saint”；“Elizabeth I”應該讀作“Elizabeth the first”）或保持原樣閱讀（“肯尼迪機場”被縮寫）。
* **Leg** - 騎手在旅途中的兩個後續位置之間上下車的行程。
* **旅程** - 從始發地到目的地的總體旅行，包括所有航段和中轉。
* **子旅程** - 構成旅程子集的兩條或更多航段。
* **票價產品** - 可用於支付或驗證旅行的可購買票價產品。

### 在场

适用于字段和文件的存在条件：

* **必需**- 字段或文件必须包含在数据集中并包含每条记录的有效值。
* **可选**- 可以从数据集中省略字段或文件。
* **有条件地要求**- 字段或文件必须包含在字段或文件描述中概述的条件下。
* **有条件禁止**- 字段或文件不得包含在字段或文件描述中概述的条件下。

### 字段类型

- **颜色**- 编码为六位十六进制数字的颜色。请参阅<https://htmlcolorcodes.com>以生成有效值（不得包含前导“#”）。<br/>*示例： `FFFFFF`表示白色， `000000`表示黑色或`0039A6`表示 NYMTA 中的 A、C、E 线。*<br/>
- **货币代码**- ISO 4217 字母货币代码。有关当前货币列表，请参阅<https://en.wikipedia.org/wiki/ISO_4217#Active_codes> 。<br/>*示例： `CAD`代表加元， `EUR`代表欧元， `JPY`代表日元。*<br/>
- **货币金额**- 表示货币金额的十进制值。 [ISO 4217](https://en.wikipedia.org/wiki/ISO\_4217#Active_codes)为随附的货币代码指定了小数位数。根据编程，所有财务计算都应以十进制、货币或其他适合财务计算的等效类型处理language用于消费数据。由于计算过程中的货币收益或损失，不鼓励将货币金额作为浮动来处理。
- **日期**- YYYYMMDD 格式的服务日期。由于服务日内的时间可能高于 24:00:00，因此服务日可能包含后续日的信息。<br/>*示例： `20180913`表示 2018 年 9 月 13 日。*<br/>
- **电子邮件**- 电子邮件地址。<br/>*示例： `example@example.com`*<br/>
- **枚举**- “描述”列中定义的一组预定义常量中的一个选项。<br/>*示例： `route_type`字段包含`0`表示电车， `1`表示地铁......*<br/>
- **ID** - ID 字段值是一个内部 ID，不打算向乘客显示，并且是任何 UTF-8 字符的序列。建议仅使用可打印的 ASCII 字符。当 ID 在文件中必须是唯一的时，它被标记为“唯一 ID”。在一个 .txt 文件中定义的 ID 通常在另一个 .txt 文件中被引用。引用另一个表中的 ID 的 ID 被标记为“外部 ID”。<br/>*示例：*stop_id*字段*stops.txt*是一个“唯一标识”。 `parent_station`字段在*stops.txt*是一个“外国ID参考`stops. stop_id`*stop_id *”。*<br/>
- language**代码**- IETF BCP 47language代码。有关 IETF BCP 47 的介绍，请参阅<http://www.rfc-editor.org/rfc/bcp/bcp47.txt>和[语言](<http://www.w3.org/International/articles/\<glossary variable=>)[-tags/">http://www.w3.org/International/articles/](<http://www.w3.org/International/articles/\<glossary variable=>)language[-标签/](<http://www.w3.org/International/articles/\<glossary variable=>) 。<br/>*示例： `en`表示英语， `en-US`表示美式英语或`de`表示德语。*<br/>
- **纬度**- WGS84 纬度，十进制度。该值必须大于或等于 -90.0 且小于或等于 90.0。*<br/>示例：罗马斗兽场的`41.890169` 。<br/>*
- **经度**- WGS84 经度（十进制度）。该值必须大于或等于 -180.0 且小于或等于 180.0。<br/>*示例：罗马斗兽场的`12.492269` 。*<br/>
- **Float** - 一个浮点数。
- **整数**- 一个整数。
- **电话号码**- 电话号码。
- **Time** - HH:MM:SS 格式的时间（也接受 H:MM:SS）。时间从服务日的“中午减去 12 小时”开始计算（实际上是午夜，夏令时更改发生的日子除外）。对于发生在午夜之后的时间，请以大于 24:00:00 的值输入时间，以旅行当天的 HH:MM:SS 本地时间Schedule开始。<br/>*示例：第二天下午 2:30 为 14:30:00 或`25:35:00` `14:30:00`*<br/>
- **文本**- 一个 UTF-8 字符串，旨在显示，因此必须是人类可读的。
- **时区**- 来自<https://www.iana.org/time-zones>的 TZ 时区。时区名称从不包含空格字符，但可能包含下划线。有关有效值的列表，请参阅<http://en.wikipedia.org/wiki/List_of_tz_zones> 。<br/>*示例： `Asia/Tokyo` 、 `America/Los_Angeles`或`Africa/Cairo` 。*<br/>
- **URL** - 包含 http\:// 或 https\:// 的完全限定 URL，并且 URL 中的任何特殊字符都必须正确转义。有关如何创建完全限定 URL 值的说明，请参阅以下<http://www.w3.org/Addressing/URL/4_URI_Recommentations.html> 。

### 现场标志

适用于浮点或整数字段类型的符号：

- **非负数**- 大于或等于 0。
- **非零**- 不等于 0。
- **正**- 大于 0。

*示例：**非负浮点数**- 大于或等于 0 的浮点数。*

### 数据集属性

数据集的**主键**是唯一标识行的字段或字段组合。当文件的所有提供字段都用于唯一标识行时，使用`Primary key (*)` 。 `Primary key (none)`表示文件只允许一行。

*示例：*trip_id*和*stop_sequence*字段作为主键*stop_times.txt *.*

## 数据集文件

本规范定义了以下文件：

| 文件名                                                | 在场    | 描述                                                                                                                                                                                                                                                                                   |
| -------------------------------------------------- | ----- |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [agency.txt](#agencytxt)                           | **必需的** | 在此数据集中提供服务的交通机构。                                                                                                                                                                                                                                                                     |
| [stops.txt](#stopstxt)                             | **必需的** | 在车辆接送乘客的地方停靠。还定义了车站和车站入口。                                                                                                                                                                                                                                                            |
| [routes.txt](#routestxt)                           | **必需的** | 过境路线。路线是作为单一服务向乘客显示的一组行程。                                                                                                                                                                                                                                                            |
| [trips.txt](#tripstxt)                             | **必需的** | 每条路线的行程。行程是在特定时间段内发生的两个或多个停靠点的序列。                                                                                                                                                                                                                                                    |
| [stop_times.txt](#stop_timestxt)                   | **必需的** | 每次行程中车辆到达和离开站点的时间。                                                                                                                                                                                                                                                                   |
| [calendar.txt](#calendartxt)                       | **有条件要求** | 使用每周指定的服务日期Schedule带有开始和结束日期。<br/><br/>有条件要求：<br/>-**必需的**除非所有服务日期都在[calendar_dates.txt](#calendar_datestxt) .<br/> - 否则可选。                                                                                                                                                          |
| [calendar_dates.txt](#calendar_datestxt)           | **有条件要求** | 中定义的服务的例外情况[calendar.txt](#calendartxt) .<br/><br/>有条件要求：<br/> -**必需的**如果[calendar.txt](#calendartxt)被省略。在这种情况下[calendar_dates.txt](#calendar_datestxt)必须包含所有服务日期。<br/> - 否则可选。                                                                                                      |
| [fare_attributes.txt](#fare_attributestxt)         | 可选的   | 公交公司路线的票价信息。                                                                                                                                                                                                                                                                         |
| [fare_rules.txt](#fare_rulestxt)                   | 可选的  | 为行程应用票价的规则。                                                                                                                                                                                                                                                                          |
| [fare_media.txt](#fare_mediatxt) | 可选的 | 描述可用於使用票價產品的票價媒體。<br/><br/>文件[fare_media.txt](#fare_mediatxt)描述了未在fare_attributes.txt和fare_rules.txt .因此， [fare_media.txt](#fare_mediatxt)的使用與文件完全分開[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt).                                                     |
| [fare_products.txt](#fare_productstxt)             | 可选的   | 描述乘客可以购买的不同类型的车票或票价。<br/><br/>文件[fare_products.txt](fare_productstxt)描述未在[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt).因此，使用[fare_products.txt](#fare_productstxt)与文件完全分开[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt) . |
| [fare_leg_rules.txt](#fare_leg_rulestxt)           | 可选的   | 单程旅行的票价规则。<br/><br/>文件[fare_leg_rules.txt](#fare_leg_rulestxt)为票价结构建模提供了更详细的方法。因此，使用[fare_leg_rules.txt](#fare_leg_rulestxt)与文件完全分开[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt) .                                                                     |
| [fare_transfer_rules.txt](#fare_transfer_rulestxt) | 可选的   | 旅行航段之间换乘的票价规则。<br/><br/>随着[fare_leg_rules.txt](#fare_leg_rulestxt)， 文件[fare_transfer_rules.txt](#fare_transfer_rulestxt)为票价结构建模提供了更详细的方法。因此，使用[fare_transfer_rules.txt](#fare_transfer_rulestxt)与文件完全分开[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt) . |
| [areas.txt](areastxt)                              | 可选的   | 位置的区域分组。                                                                                                                                                                                                                                                                             |
| [stop_areas.txt](stop_areastxt)                    | 可选的   | 为区域分配停靠点的规则。                                                                                                                                                                                                                                                                         |
| [shapes.txt](#shapestxt)                           | 可选的   | 映射车辆行驶路径的规则，有时称为路线路线。                                                                                                                                                                                                                                                                |
| [frequencies.txt](#frequenciestxt)                 | 可选的   | 基于车距的服务的车距（行程之间的时间）或固定的压缩表示Schedule服务。                                                                                                                                                                                                                                               |
| [transfers.txt](#transferstxt)                     | 可选的   | 在路线之间的换乘点建立连接的规则。                                                                                                                                                                                                                                                                    |
| [pathways.txt](#pathwaystxt)                       | 可选的   | 连接车站内位置的路径。                                                                                                                                                                                                                                                                          |
| [levels.txt](#levelstxt)                           | **有条件要求** | 车站内的水平。<br/><br/>有条件要求：<br/> -**必需的**当描述有电梯的路径时（`pathway_mode=5` ）。 <br/> - 否则可选。                                                                                                                                                                                                    |
| [translations.txt](#translationstxt)               | 可选的   | 面向客户的数据集值的翻译。                                                                                                                                                                                                                                                                        |
| [feed_info.txt](#feed_infotxt)                     | 可选的   | 数据集元数据，包括发布者、版本和到期信息。                                                                                                                                                                                                                                                                |
| [attributions.txt](#attributionstxt)               | 可选的   | 数据集属性。                                                                                                                                                                                                                                                                               |


## 文件要求

以下要求适用于数据集文件的格式和内容：

* 所有文件都必须保存为逗号分隔的文本。
* 每个文件的第一行必须包含字段名称。[字段定义](#field-definitions)部分的每个子部分对应于一个文件中的一个GTFS数据集并列出该文件中可能使用的字段名称。
* 所有文件名和字段名都区分大小写。
* 字段值不得包含制表符、回车符或换行符。
* 包含引号或逗号的字段值必须用引号引起来。此外，字段值中的每个引号前面都必须有一个引号。这与 Microsoft Excel 输出逗号分隔 (CSV) 文件的方式一致。有关 CSV 文件格式的更多信息，请参阅<http://tools.ietf.org/html/rfc4180> 。

以下示例演示了字段值在逗号分隔文件中的显示方式：

* **原始字段值：** `Contains "quotes", commas and text`
* **CSV 文件中的字段值：** `"Contains ""quotes"", commas and text"`
* 字段值不得包含 HTML 标记、注释或转义序列。
* 应删除字段或字段名称之间的多余空格。许多解析器认为空格是值的一部分，这可能会导致错误。
* 每行必须以 CRLF 或 LF 换行符结尾。
* 文件应以 UTF-8 编码以支持所有 Unicode 字符。包含 Unicode 字节顺序标记 (BOM) 字符的文件是可接受的。有关 BOM 字符和 UTF-8 的更多信息，请参见<http://unicode.org/faq/utf_bom.html#BOM> 。
* 所有数据集文件必须压缩在一起。

## 字段定义

### agency.txt

文件：**必填**

首要的关键 （agency_id )

| 字段名称              | 类型         | 在场        | 描述                                                                                                                                                            |
| ----------------- | ---------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `agency_id`       | 唯一身份       | **有条件要求** | 标识通常与运输机构同义的运输品牌。请注意，在某些情况下，例如当一个代理机构运营多个单独的服务时，代理机构和品牌是不同的。本文档使用术语“代理”代替“品牌”。一个数据集可能包含来自多个机构的数据。<br/><br/>有条件要求：<br/> -**必需的**当数据集包含多个交通机构的数据时。<br/> - 否则可选。 |
| `agency_name`     | 文本         | **必需的**   | 运输机构的全称。                                                                                                                                                      |
| `agency_url`      | 网址         | **必需的**   | 公交机构的网址。                                                                                                                                                      |
| `agency_timezone` | 时区         | **必需的**   | 运输机构所在的时区。如果在数据集中指定了多个机构，每个机构必须具有相同的`agency_timezone` .                                                                                                       |
| `agency_lang`     | language代码 | 可选的       | 基本的language由该运输机构使用。应提供帮助GTFS消费者选择大小写规则等language- 数据集的特定设置。                                                                                                   |
| `agency_phone`    | 电话号码       | 可选的       | 指定机构的语音电话号码。此字段是一个字符串值，表示该机构服务区域的典型电话号码。它可能包含标点符号来对数字的数字进行分组。允许使用可拨号文本（例如，TriMet 的“503-238-RIDE”），但该字段不得包含任何其他描述性文本。                                          |
| `agency_fare_url` | 网址         | 可选的       | 允许乘客在线为该机构购买车票或其他票价工具的网页的 URL。                                                                                                                                |
| `agency_email`    | 电子邮件       | 可选的       | 由该机构的客户服务部门积极监控的电子邮件地址。此电子邮件地址应该是一个直接联系点，公交乘客可以联系到该机构的客户服务代表。                                                                                                 |

### stops.txt

文件：**必填**

首要的关键 （stop_id )

| 字段名称                  | 类型                       | 在场        | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| --------------------- | ------------------------ | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `stop_id`             | 唯一身份                     | **必需的**   | 识别位置：站台/站台、车站、入口/出口、通用节点或登机区（见`location_type`）。<br/><br/>多条路线可以使用相同的`stop_id` .                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `stop_code`           | 文本                       | 可选的       | 标识乘客位置的短文本或数字。这些代码通常用于基于电话的交通信息系统或印在标牌上，以使乘客更容易获得特定位置的信息。这`stop_code`可能与`stop_id`如果它是面向公众的。对于没有向乘客提供代码的位置，此字段应留空。                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `stop_name`           | 文本                       | **有条件要求** | 位置的名称。这`stop_name`应与打印在时间表上、在线发布或出现在标牌上的机构面向骑手的位置名称相匹配。要翻译成其他语言，请使用`translations.txt` .<br/><br/>当位置是登机区时（`location_type=4` ）， 这`stop_name`应包含机构显示的登机区名称。它可能只是一个字母（如一些欧洲城际火车站），也可能是“Wheelchair boarding area”（纽约市的地铁）或“短途列车负责人”（巴黎的 RER）之类的文字。<br/><br/>有条件要求：<br/> -**必需的**对于停靠点（`location_type=0` ), 车站 (`location_type=1` ) 或入口/出口 (`location_type=2` ）。 <br/> - 对于通用节点的位置是可选的（`location_type=3` ) 或登机区 (`location_type=4` ）。                                                                                                             |
| `tts_stop_name`       | 文本                       | 可选的       | 的可读版本`stop_name` .请参阅“文本转语音字段”中的[术语定义](#term-definitions)更多。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `stop_desc`           | 文本                       | 可选的       | 提供有用的优质信息的位置描述。不应重复`stop_name` .                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `stop_lat`            | 纬度                       | **有条件要求** | 位置的纬度。<br/><br/>对于停靠点/平台（`location_type=0` ) 和登机区 (`location_type=4` )，坐标必须是公共汽车杆的坐标（如果存在），否则是旅行者上车的位置（在人行道或平台上，而不是在车辆停靠的道路或轨道上）。<br/><br/>有条件要求：<br/> -**必需的**对于停靠点（`location_type=0` ), 车站 (`location_type=1` ) 或入口/出口 (`location_type=2` ）。 <br/> - 对于通用节点的位置是可选的（`location_type=3` ) 或登机区 (`location_type=4` ）。                                                                                                                                                                                                                          |
| `stop_lon`            | 经度                       | **有条件要求** | 位置的经度。<br/><br/>对于停靠点/平台（`location_type=0` ) 和登机区 (`location_type=4` )，坐标必须是公共汽车杆的坐标（如果存在），否则是旅行者上车的位置（在人行道或平台上，而不是在车辆停靠的道路或轨道上）。<br/><br/>有条件要求：<br/> -**必需的**对于停靠点（`location_type=0` ), 车站 (`location_type=1` ) 或入口/出口 (`location_type=2` ）。 <br/> - 对于通用节点的位置是可选的（`location_type=3` ) 或登机区 (`location_type=4` ）。                                                                                                                                                                                                                          |
| `zone_id`             | ID                       | **有条件要求** | 标识停靠的票价区。如果该记录代表车站或车站入口，则`zone_id`被忽略。<br/><br/>有条件要求：<br/> -**必需的**如果使用提供票价信息[fare_rules.txt](#fare_rulestxt) <br/> - 否则可选。                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `stop_url`            | 网址                       | 可选的       | 有关该位置的网页的 URL。这应该不同于`agency.agency_url`和`routes.route_url`字段值。                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| `location_type`       | 枚举                       | 可选的       | 位置类型。有效的选项是：<br/><br/>`0` （或空白）-**停止** （或者**平台**）。乘客上车或下车的地方。当定义在一个`parent_station` .<br/>`1` -**车站**.包含一个或多个平台的物理结构或区域。<br/>`2` -**入口/出口**.乘客可以从街道进出车站的位置。如果一个入口/出口属于多个站点，它可能通过路径链接到两个站点，但数据提供者必须选择其中一个作为父站点。<br/>`3` -**通用节点**.车站内的位置，不匹配任何其他位置`location_type`，可用于将定义的路径链接在一起pathways.txt .<br/>`4` -**登机区**.平台上的特定位置，乘客可以在此上下车。                                                                                                                                                                                                           |
| `parent_station`      | 国外身份证参考`stops.stop_id`   | **有条件要求** | 定义中定义的不同位置之间的层次结构`stops.txt`.它包含父位置的 ID，如下所示：<br/><br/> -**停止/平台**(`location_type=0`）： 这`parent_station`字段包含站的 ID。<br/> -**车站** (`location_type=1` )：此字段必须为空。<br/> -**入口/出口** (`location_type=2` ） 或者**通用节点** (`location_type=3`）： 这`parent_station`字段包含站的 ID (`location_type=1` )<br/> -**登机区** (`location_type=4`）： 这`parent_station`字段包含平台的 ID。<br/><br/>有条件要求：<br/> -**必需的**对于作为入口的位置（`location_type=2` ), 通用节点 (`location_type=3` ) 或登机区 (`location_type=4` ）。 <br/> - 可选停靠站/平台（`location_type=0` ）。 <br/> - 禁止车站（`location_type=1` ）。  |
| `stop_timezone`       | 时区                       | 可选的       | 位置的时区。如果该位置有父站，它将继承父站的时区，而不是应用自己的时区。车站和无父母的车站空车`stop_timezone`继承指定的时区`agency.agency_timezone`.如果`stop_timezone`提供的值，在时间[stop_times.txt](#stop_timetxt)应输入自指定时区午夜以来的时间`agency.agency_timezone`.这可确保旅行中的时间值始终在旅行过程中增加，无论旅行跨越哪个时区。                                                                                                                                                                                                                                                                                                              |
| `wheelchair_boarding` | 枚举                       | 可选的       | 指示是否可以从该位置搭乘轮椅。有效的选项是：<br/><br/>对于无父母站点：<br/>`0`或为空 - 没有该站点的可访问性信息。<br/>`1` - 此站的部分车辆可由坐轮椅的骑手上车。<br/>`2` - 此站无法使用轮椅登机。<br/><br/>对于子站：<br/>`0`或为空 - Stop 将继承其`wheelchair_boarding`来自父站的行为，如果在父站中指定。<br/>`1` - 从车站外到特定车站/平台存在一些可访问的路径。<br/>`2` - 没有从车站外到特定车站/站台的无障碍路径。<br/><br/>车站出入口：<br/>`0`或为空 - 车站入口将继承其`wheelchair_boarding`如果为父站指定，则来自父站的行为。<br/>`1` - 车站入口可供轮椅通行。<br/>`2` - 从车站入口到车站/站台没有无障碍通道。                                                                                                                                         |
| `level_id`            | 国外身份证参考`levels.level_id` | 可选的       | 位置的级别。多个未链接的站点可以使用同一级别。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `platform_code`       | 文本                       | 可选的       | 站台站台的站台标识符（属于站台的站台）。这应该只是平台标识符（例如“G”或“3”）。诸如“平台”或“轨道”之类的词（或提要的language- 特定等价物）不应包括在内。这使提要消费者能够更轻松地将平台标识符国际化和本地化为其他语言。                                                                                                                                                                                                                                                                                                                                                                                                                        |

### routes.txt

文件：**必填**

首要的关键 （route_id )

| 字段名称                  | 类型                        | 在场        | 描述                                                                                                                                                                                                                                                                                                                                                                                              |
| --------------------- | ------------------------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `route_id`            | 唯一身份                      | **必需的**   | 标识一条路线。                                                                                                                                                                                                                                                                                                                                                                                         |
| `agency_id`           | 国外身份证参考`agency.agency_id` | **有条件要求** | 指定路线的代理。<br/><br/>有条件要求：<br/> -**必需的**如果定义了多个机构[agency.txt](#agency) .<br/> - 否则可选。                                                                                                                                                                                                                                                                                                             |
| `route_short_name`    | 文本                        | **有条件要求** | 路线的简称。通常是一个简短的、抽象的标识符（例如，“32”、“100X”、“Green”），骑手用来识别路线。两个都`route_short_name`和`route_long_name`可以定义。<br/><br/>有条件要求：<br/> -**必需的**如果`routes.route_long_name`是空的。<br/> - 否则可选。                                                                                                                                                                                                                    |
| `route_long_name`     | 文本                        | **有条件要求** | 路线的全名。此名称通常比`route_short_name`并且通常包括路线的目的地或站点。两个都`route_short_name`和`route_long_name`可以定义。<br/><br/>有条件要求：<br/> -**必需的**如果`routes.route_short_name`是空的。<br/> - 否则可选。                                                                                                                                                                                                                            |
| `route_desc`          | 文本                        | 可选的       | 提供有用的优质信息的路线的描述。不应重复`route_short_name`或者`route_long_name` .<hr/> _示例：“A”号列车始终在曼哈顿 Inwood-207 St 和皇后区 Far Rockaway-Mott Avenue 之间运行。同样从早上 6 点到午夜，额外的“A”号列车在 Inwood-207 St 和 Lefferts Boulevard 之间运行（列车通常在 Lefferts Blvd 和 Far Rockaway 之间交替运行）。_                                                                                                                                                 |
| `route_type`          | 枚举                        | **必需的**   | 指示路线上使用的交通工具类型。有效的选项是：<br/><br/>`0` - 有轨电车、有轨电车、轻轨。大都市区内的任何轻轨或街道系统。<br/>`1` - 地铁，地铁。大都市区内的任何地下铁路系统。<br/>`2` - 铁路。用于城际或长途旅行。<br/>`3` - 公共汽车。用于短途和长途巴士路线。<br/>`4` - 渡轮。用于短途和长途船服务。<br/>`5` - 缆车。用于电缆在车辆下方运行的街道轨道车（例如，旧金山的缆车）。<br/>`6` - 空中升降机、悬挂式缆车（例如缆车、空中缆车）。使用一根或多根电缆悬挂客舱、汽车、吊船或开放式椅子的电缆运输。<br/>`7` - 缆车。任何专为陡峭斜坡设计的轨道系统。<br/>`11` - 无轨电车。使用电线杆从架空电线中获取电力的电动巴士。<br/>`12` - 单轨电车。轨道由单轨或横梁组成的铁路。 |
| `route_url`           | 网址                        | 可选的       | 关于特定路由的网页的 URL。应该不同于`agency.agency_url`价值。                                                                                                                                                                                                                                                                                                                                                      |
| `route_color`         | 颜色                        | 可选的       | 与面向公众的材料相匹配的路线颜色指定。默认为白色（`FFFFFF` ) 当省略或留空时。之间的色差`route_color`和`route_text_color`在黑白屏幕上观看时应提供足够的对比度。                                                                                                                                                                                                                                                                                            |
| `route_text_color`    | 颜色                        | 可选的       | 用于在背景上绘制的文本的清晰颜色`route_color`.默认为黑色（`000000`) 当省略或留空时。之间的色差`route_color`和`route_text_color`在黑白屏幕上观看时应提供足够的对比度。                                                                                                                                                                                                                                                                                  |
| `route_sort_order`    | 非负整数                      | 可选的       | 以最适合向客户展示的方式对路线进行排序。较小的路线`route_sort_order`值应首先显示。                                                                                                                                                                                                                                                                                                                                              |
| `continuous_pickup`   | 枚举                        | 可选的       | 表示骑手可以在车辆行驶路径上的任何点登上运输车辆，如`shapes.txt`，在路线的每次行程中。有效的选项是：<br/><br/>`0` - 连续停止皮卡。<br/>`1`或空 - 没有连续停止拾取。<br/>`2` - 必须打电话给代理安排连续停止取件。<br/>`3` - 必须与司机协调安排连续停车接送。<br/><br/>价值观`routes.continuous_pickup`可以通过在中定义值来覆盖`stop_times.continuous_pickup`对于特定的`stop_time`沿着路线。                                                                                                                              |
| `continuous_drop_off` | 枚举                        | 可选的       | 表示骑手可以在车辆行驶路径上的任何点从运输车辆下车，如下所述`shapes.txt` ，在路线的每次行程中。有效的选项是：<br/><br/>`0`- 连续停止下降。<br/>`1`或空 - 没有连续停止下降。<br/>`2` - 必须打电话给代理商安排连续的中途下车。<br/>`3` - 必须与司机协调安排连续停车下车。<br/><br/>价值观`routes.continuous_drop_off`可以通过在中定义值来覆盖`stop_times.continuous_drop_off`对于特定的`stop_time`沿着路线。                                                                                                                    |
| `network_id`          |  ID                       | 可选的       | 标识一组路由。中的多行[routes.txt](#routestxt)可能有相同的`network_id` .                                                                                                                                                                                                                                                                                                                                         |


### trips.txt

文件：**必填**

首要的关键 （trip_id )

| 字段名称                    | 类型                                                        | 在场        | 描述                                                                                                                                                                                                                                                                                                                                    |
| ----------------------- | --------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `route_id`              | 国外身份证参考`routes.route_id`                                  | **必需的**   | 标识一条路线。                                                                                                                                                                                                                                                                                                                               |
| `service_id`            | 国外身份证参考`calendar.service_id`或者`calendar_dates.service_id` | **必需的**   | 确定服务可用于一条或多条路线的一组日期。                                                                                                                                                                                                                                                                                                                  |
| `trip_id`               | 唯一身份                                                      | **必需的**   | 标识行程。                                                                                                                                                                                                                                                                                                                                 |
| `trip_headsign`         | 文本                                                        | 可选的       | 出现在标牌上的文字，用于向乘客指明行程的目的地。应该用于区分同一路由上的不同服务模式。<br/><br/>如果头标在旅途中发生变化，则值为`trip_headsign`可以通过在中定义值来覆盖`stop_times.stop_headsign`对于特定的`stop_time`在旅途中。                                                                                                                                                                                       |
| `trip_short_name`       | 文本                                                        | 可选的       | 用于识别乘客行程的面向公众的文本，例如，识别通勤铁路旅行的火车号码。如果乘客通常不依赖行程名称，`trip_short_name`应该是空的。一个`trip_short_name`值（如果提供）应唯一标识服务日内的行程；它不应用于目的地名称或有限/明确指定。                                                                                                                                                                                                     |
| `direction_id`          | 枚举                                                        | 可选的       | 指示旅行的行进方向。该字段不应在路由中使用；它提供了一种在发布时间表时按方向分隔行程的方法。有效的选项是：<br/><br/>`0` - 单向旅行（例如出境旅行）。<br/>`1` - 向相反方向行驶（例如入境旅行）。<hr/>*示例：`trip_headsign`和`direction_id`字段可以一起使用，为一组行程分配一个名称，以在每个方向上行驶。一个[trips.txt](#tripstxt)文件可以包含这些记录以在时间表中使用：* <br/> `trip_id,...,trip_headsign,direction_id` <br/> `1234,...,Airport,0` <br/> `1505,...,Downtown,1` |
| `block_id`              |  ID                                                       | 可选的       | 标识行程所属的块。一个区块由使用同一车辆的单次行程或多次连续行程组成，由共享服务天数和`block_id`.一个`block_id`可能有不同服务天数的行程，形成不同的区块。见[下面的例子](#example-blocks-and-service-day).提供座位转移信息，[转移](#transferstxt)的`transfer_type` `4`应改为提供。                                                                                                                                               |
| `shape_id`              | 国外身份证参考`shapes.shape_id`                                  | **有条件要求** | 标识描述旅行的车辆行驶路径的地理空间形状。<br/><br/>有条件要求：<br/> -**必需的**如果行程具有连续接送或下车行为定义`routes.txt`或在`stop_times.txt` .<br/> - 否则可选。                                                                                                                                                                                                                     |
| `wheelchair_accessible` | 枚举                                                        | 可选的       | 表示轮椅可及性。有效的选项是：<br/><br/>`0`或为空 - 没有行程的无障碍信息。<br/>`1` - 在此特定行程中使用的车辆可容纳至少一名坐在轮椅上的乘客。<br/>`2` - 此行程不接待坐轮椅的乘客。                                                                                                                                                                                                                          |
| `bikes_allowed`         | 枚举                                                        | 可选的       | 指示是否允许骑自行车。有效的选项是：<br/><br/>`0`或为空 - 没有行程的自行车信息。<br/>`1` - 在这次特定旅行中使用的车辆可以容纳至少一辆自行车。<br/>`2` - 此行程不允许骑自行车。                                                                                                                                                                                                                            |


#### 示例：街区和服务日

下面的示例是有效的，一周中的每一天都有不同的块。


| route_id | trip_id | service_id                     | block_id | <span style="font-weight:normal">*(first stop time)*</span> | <span style="font-weight:normal">*(last stop time)*</span> |
|----------|---------|--------------------------------|----------|-----------------------------------------|-------------------------|
| red      | trip_1  | mon-tues-wed-thurs-fri-sat-sun | red_loop | 22:00:00                                | 22:55:00                |
| red      | trip_2  | fri-sat-sun                    | red_loop | 23:00:00                                | 23:55:00                |
| red      | trip_3  | fri-sat                        | red_loop | 24:00:00                                | 24:55:00                |
| red      | trip_4  | mon-tues-wed-thurs             | red_loop | 20:00:00                                | 20:50:00                |
| red      | trip_5  | mon-tues-wed-thurs             | red_loop | 21:00:00                                | 21:50:00                |

上表注意事项：

* 例如，从周五到周六早上，单车运行`trip_1` 、 `trip_2`和`trip_3` （晚上 10:00 到凌晨 12:55）。请注意，最后一次行程发生在星期六的 12:00 AM 到 12:55 AM，但属于星期五“服务日”的一部分，因为时间是 24:00:00 到 24:55:00。
* 周一、周二、周三和周四，晚上 8:00 到晚上 10:55，单车在一个街区内运行`trip_1` 、 `trip_4`和`trip_5` 。


### stop_times.txt

文件：**必填**

首要的关键 （trip_id ,stop_sequence )

| 字段名称                  | 类型                     | 在场        | 描述                                                                                                                                                                                                                                                                                                                                                                                                                  |   |
| --------------------- | ---------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | - |
| `trip_id`             | 国外身份证参考`trips.trip_id` | **必需的**   | 标识行程。                                                                                                                                                                                                                                                                                                                                                                                                               |   |
| `arrival_time`        | 时间                     | **有条件要求** | 到达站点的时间（定义为`stop_times.stop_id`) 用于特定行程（定义为`stop_times.trip_id`）。<br/><br/>如果停靠点没有不同的到达和离开时间，`arrival_time`和`departure_time`应该是一样的。<br/><br/>对于在服务日午夜之后发生的时间，请以大于 24:00:00 的值输入时间，以旅行当天的 HH:MM:SS 本地时间Schedule开始。<br/><br/>如果准确的到达和离开时间（`timepoint=1`或空）不可用，估计或插值到达和离开时间（`timepoint=0` ) 应提供。<br/><br/>有条件要求：<br/> -**必需的**旅行中的第一站和最后一站（定义为`stop_times.stop_sequence`）。<br/> -**必需的**为了`timepoint=1` .<br/> - 否则可选。 |   |
| `departure_time`      | 时间                     | **有条件要求** | 从站点出发的时间（定义为`stop_times.stop_id`) 用于特定行程（定义为`stop_times.trip_id` ）。 <br/><br/>如果停靠点没有不同的到达和离开时间，`arrival_time`和`departure_time`应该是一样的。<br/><br/>对于在服务日午夜之后发生的时间，请以大于 24:00:00 的值输入时间，以旅行当天的 HH:MM:SS 本地时间Schedule开始。<br/><br/>如果准确的到达和离开时间（`timepoint=1`或空）不可用，估计或插值到达和离开时间（`timepoint=0` ) 应提供。<br/><br/>有条件要求：<br/> -**必需的**为了`timepoint=1` .<br/> - 否则可选。                                                        |   |
| `stop_id`             | 国外身份证参考`stops.stop_id` | **必需的**   | 标识服务停止。旅行期间服务的所有站点必须在[stop_times.txt](#stop_timestxt).参考位置必须是站点/平台，即它们的`stops.location_type`值必须是`0`或为空。在同一个行程中，一个站点可以服务多次，并且多个行程和路线可以为同一个站点提供服务。                                                                                                                                                                                                                                                                    |   |
| `stop_sequence`       | 非负整数                   | **必需的**   | 特定行程的停靠顺序。这些值必须随着行程增加，但不需要是连续的。<hr/>*示例：行程中的第一个位置可能有`stop_sequence` =`1`，旅途中的第二个地点可能有`stop_sequence` =`23`，第三个位置可能有`stop_sequence` =`40`， 等等。*                                                                                                                                                                                                                                                                      |   |
| `stop_headsign`       | 文本                     | 可选的       | 出现在标牌上的文字，用于向乘客指明行程的目的地。此字段覆盖默认值`trips.trip_headsign`当headsign在停止之间变化时。如果在整个行程中都显示头标，`trips.trip_headsign`应改为使用。<br/><br/>一个`stop_headsign`为一指定的值`stop_time`不适用于后续`stop_time`s 在同一次旅行中。如果你想覆盖`trip_headsign`对于多个`stop_time`s 在同一次旅行中，`stop_headsign`值必须在每个重复`stop_time`排。                                                                                                                                           |   |
| `pickup_type`         | 枚举                     | 可选的       | 表示取货方式。有效的选项是：<br/><br/>`0`或空 - 定期取货。<br/>`1` - 不提供接送服务。<br/>`2` - 必须打电话给代理商安排取件。<br/>`3` - 必须与司机协调安排接送。                                                                                                                                                                                                                                                                                                            |   |
| `drop_off_type`       | 枚举                     | 可选的       | 表示下车方式。有效的选项是：<br/><br/>`0`或空车 - 定期下车。<br/>`1` - 不提供下车服务。<br/>`2` - 必须致电代理安排下车。<br/>`3` - 必须与司机协调安排下车。                                                                                                                                                                                                                                                                                                              |   |
| `continuous_pickup`   | 枚举                     | 可选的       | 表示骑手可以在车辆行驶路径上的任何点登上运输车辆，如`shapes.txt` ， 由此`stop_time`到下一个`stop_time`在旅途中`stop_sequence`.有效的选项是：<br/><br/>`0` - 连续停止皮卡。<br/>`1`或空 - 没有连续停止拾取。<br/>`2` - 必须打电话给代理安排连续停止取件。<br/>`3` - 必须与司机协调安排连续停车接送。<br/><br/>如果填充此字段，它会覆盖定义的任何连续拾取行为`routes.txt`.如果此字段为空，则`stop_time`继承定义的任何连续拾取行为`routes.txt` .                                                                                                                   |   |
| `continuous_drop_off` | 枚举                     | 可选的       | 表示骑手可以在车辆行驶路径上的任何点从运输车辆下车，如下所述`shapes.txt`， 由此`stop_time`到下一个`stop_time`在旅途中`stop_sequence` .有效的选项是：<br/><br/>`0`- 连续停止下降。<br/>`1`或空 - 没有连续停止下降。<br/>`2` - 必须打电话给代理商安排连续的中途下车。<br/>`3` - 必须与司机协调安排连续停车下车。<br/><br/>如果填充此字段，它将覆盖定义的任何连续下降行为`routes.txt`.如果此字段为空，则`stop_time`继承定义在`routes.txt` .                                                                                                                      |   |
| `shape_dist_traveled` | 非负浮动                   | 可选的       | 沿相关形状行进的实际距离，从第一个停靠点到此记录中指定的停靠点。此字段指定在行程中任意两个停靠点之间要绘制多少形状。必须使用相同的单位[shapes.txt](#shapestxt).用于的值`shape_dist_traveled`必须随着`stop_sequence`;它们不得用于显示沿路线的反向行驶。<hr/>*示例：如果一辆公共汽车从形状的起点到终点的距离为 5.25 公里，`shape_dist_traveled` =`5.25` .*                                                                                                                                                                                   |   |
| `timepoint`           | 枚举                     | 可选的       | 指示车辆是否严格遵守停靠点的到达和离开时间，或者它们是否是近似和/或插值时间。该字段允许GTFS生产者提供插值的停止时间，同时指示时间是近似的。有效的选项是：<br/><br/>`0` - 时间被认为是近似的。<br/>`1`或空 - 时间被认为是准确的。                                                                                                                                                                                                                                                                                    |   |

### calendar.txt

文件：**有条件要求**

首要的关键 （service_id )

| 字段名称         | 类型   | 在场      | 描述                                                                                                                                                                           |
| ------------ | ---- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `service_id` | 唯一身份 | **必需的** | 确定服务可用于一条或多条路线的一组日期。每个`service_id`值必须是唯一的[calendar.txt](#calendartxt)文件。                                                                                                     |
| `monday`     | 枚举   | **必需的** | 指示服务是否在指定日期范围内的所有星期一运行`start_date`和`end_date`字段。请注意，特定日期的例外情况可能会在[calendar_dates.txt](#calendar_datestxt) .有效的选项是：<br/><br/>`1`- 服务适用于日期范围内的所有星期一。<br/>`0` - 日期范围内的星期一不提供服务。 |
| `tuesday`    | 枚举   | **必需的** | 功能同上`monday`周二除外                                                                                                                                                             |
| `wednesday`  | 枚举   | **必需的** | 功能同上`monday`周三除外                                                                                                                                                             |
| `thursday`   | 枚举   | **必需的** | 功能同上`monday`周四除外                                                                                                                                                             |
| `friday`     | 枚举   | **必需的** | 功能同上`monday`周五除外                                                                                                                                                             |
| `saturday`   | 枚举   | **必需的** | 功能同上`monday`周六除外。                                                                                                                                                            |
| `sunday`     | 枚举   | **必需的** | 功能同上`monday`周日除外。                                                                                                                                                            |
| `start_date` | 日期   | **必需的** | 保养间隔的开始保养日。                                                                                                                                                                  |
| `end_date`   | 日期   | **必需的** | 服务间隔的结束服务日。该服务日包括在间隔中。                                                                                                                                                       |

### calendar_dates.txt

文件：**有条件要求**

首要的关键 （service_id , `date` )

这calendar_dates.txt表按日期显式激活或禁用服务。它可以以两种方式使用。

* 推荐：使用calendar_dates.txt和这个结合calendar.txt定义中定义的默认服务模式的例外calendar.txt .如果服务通常是定期的，在明确的日期有一些变化（例如，为了适应特殊活动服务，或学校Schedule)，这是一个很好的方法。在这种情况下`calendar_dates. service_id`service_id是一个外国 ID 参考`calendar. service_id`service_id .
* 替代：省略calendar.txt ，并指定每个服务日期calendar_dates.txt .这允许相当大的服务变化并适应没有正常每周时间表的服务。在这种情况下service_id是一个身份证。

| 字段名称             | 类型                               | 在场      | 描述                                                                                                                                                                                                                                                                                                                                                           |
| ---------------- | -------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `service_id`     | 国外身份证参考`calendar.service_id`或身份证 | **必需的** | 标识一个或多个路由发生服务异常时的一组日期。每个 （`service_id` ,`date` ) 对只能出现一次[calendar_dates.txt](#calendar_datestxt)如果使用[calendar.txt](#calendartxt)和[calendar_dates.txt](#calendar_datestxt)同时。如果一个`service_id`值出现在两者中[calendar.txt](#calendartxt)和[calendar_dates.txt](#calendar_datestxt), 中的信息[calendar_dates.txt](#calendardatestxt)修改指定的服务信息[calendar.txt](#calendartxt) . |
| `date`           | 日期                               | **必需的** | 发生服务异常的日期。                                                                                                                                                                                                                                                                                                                                                   |
| `exception_type` | 枚举                               | **必需的** | 指示服务是否在日期字段中指定的日期可用。有效的选项是：<br/><br/> `1` - 已在指定日期添加服务。<br/>`2` - 已在指定日期删除服务。<hr/>*示例：假设一条路线在节假日有一组可用的行程，而在所有其他日子有另一组可用的行程。一`service_id`可以对应于常规服务Schedule和另一个`service_id`可以对应假期Schedule.对于特定的节日，[calendar_dates.txt](#calendar_datestxt)文件可用于将假期添加到假期`service_id`并从常规中删除假期`service_id`Schedule.*                                                             |

### fare_attributes.txt

文件：**可选**

首要的关键 （fare_id )

**版本**<br/>有两种用于描述票价的建模选项。GTFS -Fares V1 是用于描述最低票价信息的传统选项。GTFS -Fares V2 是一种更新的方法，可以更详细地说明代理商的票价结构。两者都允许出现在数据集中，但数据消费者对于给定的数据集只能使用一种方法。建议GTFS -Fares V2 优先于GTFS -票价 V1。<br/><br/>相关的文件GTFS -票价 V1 是：<br/>-fare_attributes.txt<br/>-fare_rules.txt<br/><br/>相关的文件GTFS -票价 V2 是：<br/>- [fare_media.txt](#fare_mediatxt)<br>-fare_products.txt<br/>-fare_leg_rules.txt<br/>-fare_transfer_rules.txt

<br/>

| 字段名称                | 类型                        | 在场        | 描述                                                                                                     |
| ------------------- | ------------------------- | --------- | ------------------------------------------------------------------------------------------------------ |
| `fare_id`           | 唯一身份                      | **必需的**   | 标识票价等级。                                                                                                |
| `price`             | 非负浮动                      | **必需的**   | 票价，单位为`currency_type` .                                                                                |
| `currency_type`     | 货币代码                      | **必需的**   | 用于支付票价的货币。                                                                                             |
| `payment_method`    | 枚举                        | **必需的**   | 指示必须支付票价的时间。有效的选项是：<br/><br/>`0` - 车费在船上支付。<br/>`1` - 必须在登机前支付车费。                                      |
| `transfers`         | 枚举                        | **必需的**   | 表示此票价允许的换乘次数。有效的选项是：<br/><br/>`0` - 此票价不允许换乘。<br/>`1` - 车手可以转移一次。<br/>`2` - 车手可以转移两次。<br/>空 - 允许无限制转移。 |
| `agency_id`         | 国外身份证参考`agency.agency_id` | **有条件要求** | 标识票价的相关机构。<br/><br/>有条件要求：<br/> -**必需的**如果定义了多个机构`agency.txt` .<br/> - 否则可选。                           |
| `transfer_duration` | 非负整数                      | 可选的       | 传输到期前的时间长度（以秒为单位）。什么时候`transfers` =`0`此字段可用于指示票的有效期或留空。                                                |

### fare_rules.txt

文件：**可选的**

主键 ( `*` )

这fare_rules.txt表指定票价如何fare_attributes.txt申请行程。大多数票价结构使用以下规则的某种组合：

* 票价取决于始发站或目的地站。
* 票价取决于行程经过的区域。
* 票价取决于行程使用的路线。

有关演示如何指定票价结构的示例fare_rules.txt和fare_attributes.txt ，请参阅 GoogleTransitDataFeed 开源项目 wiki 中的[FareExamples](https://web.archive.org/web/20111207224351/https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) 。

| 字段名称             | 类型                               | 在场      | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ---------------- | -------------------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fare_id`        | 国外身份证参考`fare_attributes.fare_id` | **必需的** | 标识票价等级。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `route_id`       | 国外身份证参考`routes.route_id`         | 可选的     | 标识与票价等级关联的路线。如果存在多条具有相同票价属性的路线，请在[fare_rules.txt](#fare_rules.txt)对于每条路线。<hr/>*示例：如果票价等级“b”在路线“TSW”和“TSE”上有效，则[fare_rules.txt](#fare_rules.txt)文件将包含票价等级的这些记录：* <br/> `  fare_id,route_id `<br/>`b,TSW` <br/> `b,TSE`                                                                                                                                                                                                                                                                                |
| `origin_id`      | 国外身份证参考`stops.zone_id`           | 可选的     | 标识一个原始区域。如果一个票价舱位有多个始发区，请在[fare_rules.txt](#fare_rules.txt)对于每个`origin_id` .<hr/>*示例：如果票价等级“b”适用于从“2”区或“8”区出发的所有旅行，则[fare_rules.txt](#fare_rules.txt)文件将包含票价等级的这些记录：* <br/> `fare_id,...,origin_id` <br/> `b,...,2`  <br/> `b,...,8`                                                                                                                                                                                                                                                                 |
| `destination_id` | 国外身份证参考`stops.zone_id`           | 可选的     | 标识目标区域。如果票价等级有多个目的地区域，请在[fare_rules.txt](#fare_rules.txt)对于每个`destination_id` .<hr/>*示例：`origin_id`和`destination_id`可以一起使用字段来指定票价等级“b”对于区域 3 和 4 之间的旅行有效，对于区域 3 和 5 之间的旅行，[fare_rules.txt](#fare_rules.txt)文件将包含票价等级的这些记录：* <br/>`fare_id,...,origin_id,destination_id` <br/>`b,...,3,4`<br/> `b,...,3,5`                                                                                                                                                                                            |
| `contains_id`    | 国外身份证参考`stops.zone_id`           | 可选的     | 识别乘客在使用给定票价等级时将进入的区域。在某些系统中用于计算正确的票价等级。<hr/>*示例：如果票价等级“c”与经过 5、6 和 7 区的 GRT 路线上的所有旅行相关联，则[fare_rules.txt](#fare_rules.txt)将包含这些记录：* <br/> `fare_id,route_id,...,contains_id` <br/>  `c,GRT,...,5` <br/>`c,GRT,...,6` <br/>`c,GRT,...,7` <br/> *因为所有`contains_id`必须匹配区域才能应用票价，经过 5 区和 6 区但不经过 7 区的行程将没有票价等级“c”。有关更多详细信息，请参阅[ https://code.google.com/p/googletransitdatafeed/wiki/FareExamples](https://code.google.com/p/googletransitdatafeed/wiki/FareExamples)在 GoogleTransitDataFeed 项目 wiki 中。* |

### fare_media.txt

文件：**可選**

主鍵 ( `fare_media_id` )

描述可用於使用票價產品的不同票價媒體。票價媒體是用於表示和/或驗證票價產品的物理或虛擬載體。

| 字段名稱              | 類型    | 在場      | 描述                                                                                                                                                                                                                     |
| ----------------- | ----- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fare_media_id`   | 獨特的id | **必需的** | 標識票價媒體。                                                                                                                                                                                                                |
| `fare_media_name` | 文本    | 選修的     | 票價媒體名稱。<br/><br/>對於作為交通卡的票價媒體 (`fare_media_type =2` ) 或移動應用程序 (`fare_media_type =4` ）， 這`fare_media_name`應該包括在內，並且應該與提供它們的組織使用的面向騎手的名稱相匹配。                                                                             |
| `fare_media_type` | enum  | **必需的** | 票價媒體的類型。有效選項是：<br/><br/>`0` - 沒有任何。在購買或驗證票價產品時不涉及票價媒體時使用，例如向未提供實體車票的司機或售票員支付現金。<br/>`2` - 已存儲車票、通行證或貨幣價值的實體交通卡。<br/>`3` - cEMV（非接觸式 Europay、Mastercard 和 Visa）作為基於賬戶的票務的開環令牌容器。<br/>`4` - 已存儲虛擬交通卡、車票、通行證或貨幣價值的移動應用程序。 |

### fare_products.txt

文件：**可选**

首要的关键 （`fare_product_id`, `fare_media_id`)

描述乘客可以购买的不同类型的车票或票价。

| 字段名称                | 类型   | 在场      | 描述                                 |
| ------------------- | ---- | ------- | ---------------------------------- |
| `fare_product_id`   |  ID  | **必需的** | 标识票价产品。                            |
| `fare_product_name` | 文本   | 可选的     | 向乘客显示的票价产品的名称。                     |
| `fare_media_id` | 国外身份证参考 `fare_media.fare_media_id` |  標識可用於在旅行期間使用票價產品的票價媒體。當`fare_media_id`是空的，認為票價媒體是未知.|
| `amount`            | 货币金额 | **必需的** | 票价产品的成本。可能为负数表示转让折扣。可能为零表示免费的票价产品。 |
| `currency`          | 货币代码 | **必需的** | 票价产品成本的货币。                         |


### fare_leg_rules.txt

文件：**可选**

首要的关键 （network_id `network_id , from_area_id , to_area_id , fare_product_id`from_area_id `network_id , from_area_id , to_area_id , fare_product_id`to_area_id `network_id , from_area_id , to_area_id , fare_product_id`fare_product_id )

单程旅行的票价规则。

票价fare_leg_rules.txt必须通过过滤文件中的所有记录来查找与骑手要行驶的腿相匹配的规则来查询。

要处理一条腿的成本：

1. 文件fare_leg_rules.txt必须按定义旅行特征的字段进行过滤，这些字段是：
   - `fare_leg_rules. network_id`network_id
   - `fare_leg_rules. from_area_id`from_area_id
   - `fare_leg_rules. to_area_id`to_area_id<br/>

<br/>

2. 如果腿与记录完全匹配fare_leg_rules.txt根据旅行的特点，必须处理该记录以确定行程的费用。
3. 如果未找到完全匹配项，则`fare_leg_rules. network_id`network_id , `fare_leg_rules. from_area_id`from_area_id , 和`fare_leg_rules. to_area_id`to_area_id必须检查以处理腿的成本：
   - `fare_leg_rules. network_id`network_id对应于定义的所有网络routes.txt不包括`fare_leg_rules. network_id`network_id
   - `fare_leg_rules. from_area_id`from_area_id对应于area中定义的所有`areas. area_id`area_id不包括`fare_leg_rules. from_area_id`from_area_id
   - `fare_leg_rules. to_area_id`to_area_id对应于area中定义的所有`areas. area_id`area_id不包括`fare_leg_rules. to_area_id`to_area_id<br/>

<br/>

4. 如果航段不符合上述任何规则，则票价未知。

<br/>

| 字段名称              | 类型                                     | 在场      | 描述                                                                                                                                                                                                                                                                                                                                                                                  |
| ----------------- | -------------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `leg_group_id`    |  ID                                    | 可选的     | 标识一组条目[fare_leg_rules.txt](#fare_leg_rulestxt) .<br/><br/>用于描述之间的票价转移规则`fare_transfer_rules.from_leg_group_id`和`fare_transfer_rules.to_leg_group_id` .<br/><br/>中的多个条目[fare_leg_rules.txt](#fare_leg_rulestxt)可能属于同一个`fare_leg_rules.leg_group_id` .<br/><br/>相同的条目[fare_leg_rules.txt](#fare_leg_rulestxt)（不包括`fare_leg_rules.leg_group_id`) 不能属于多个`fare_leg_rules.leg_group_id` . |
| `network_id`      | 国外身份证参考`routes.network_id`             | 可选的     | 标识适用票价段规则的路线网络。<br/><br/>如果没有匹配`fare_leg_rules.network_id`的价值观`network_id`被过滤，为空`fare_leg_rules.network_id`默认会匹配。<br/><br/>中的一个空条目`fare_leg_rules.network_id`对应于定义的所有网络`routes.txt`不包括下面列出的那些`fare_leg_rules.network_id`                                                                                                                                                            |
| `from_area_id`    | 国外身份证参考`areas.area_id`                 | 可选的     | 标识出发区。<br/><br/>如果没有匹配`fare_leg_rules.from_area_id`的价值观`area_id`被过滤，为空`fare_leg_rules.from_area_id`默认会匹配。<br/><br/>中的一个空条目`fare_leg_rules.from_area_id`对应于定义的所有区域`areas.area_id`不包括下面列出的那些`fare_leg_rules.from_area_id`                                                                                                                                                             |
| `to_area_id`      | 国外身份证参考`areas.area_id`                 | 可选的     | 标识到达区域。<br/><br/>如果没有匹配`fare_leg_rules.to_area_id`的价值观`area_id`被过滤，为空`fare_leg_rules.to_area_id`默认会匹配。<br/><br/>中的一个空条目`fare_leg_rules.to_area_id`对应于定义的所有区域`areas.area_id`不包括下面列出的那些`fare_leg_rules.to_area_id`                                                                                                                                                                    |
| `fare_product_id` | 国外身份证参考`fare_products.fare_product_id` | **必需的** | 行程所需的票价产品。                                                                                                                                                                                                                                                                                                                                                                          |


### fare_transfer_rules.txt

文件：**可选**

首要的关键 （from_leg_group_id `from_leg_group_id , to_leg_group_id , fare_product_id , transfer_count , duration_limit`to_leg_group_id `from_leg_group_id , to_leg_group_id , fare_product_id , transfer_count , duration_limit`fare_product_id `from_leg_group_id , to_leg_group_id , fare_product_id , transfer_count , duration_limit`transfer_count `from_leg_group_id , to_leg_group_id , fare_product_id , transfer_count , duration_limit`duration_limit )

中定义的旅行航段之间换乘的票价规则fare_leg_rules.txt .

处理多段旅程的成本：

1. 中定义的适用票价段组fare_leg_rules.txt应根据骑手的行程为所有单独的行程段确定。

2. 文件fare_transfer_rules.txt必须通过定义传输特征的字段进行过滤，这些字段是：
   - `fare_transfer_rules. from_leg_group_id`from_leg_group_id
   - `fare_transfer_rules. to_leg_group_id`to_leg_group_id<br/>
   <br/>

3. 如果转移与记录完全匹配fare_transfer_rules.txt根据转移的特征，必须处理该记录以确定转移成本。

4. 如果没有找到完全匹配，则在from_leg_group_id或在to_leg_group_id必须检查以处理转移成本：
   - `fare_transfer_rules. from_leg_group_id`from_leg_group_id对应于`fare_leg_rules.leg_group_id`下定义的所有航段组，不包括 fare_transfer_rules 下列出的航段组`fare_transfer_rules. from_leg_group_id`from_leg_group_id
   - `fare_transfer_rules. to_leg_group_id`to_leg_group_id对应于`fare_leg_rules.leg_group_id`下定义的所有航段组，不包括 fare_transfer_rules 下列出的航段组`fare_transfer_rules. to_leg_group_id`to_leg_group_id<br/>
   <br/>

5. 如果转移不符合上述任何规则，则没有转移安排，并且腿被认为是分开的。

<br/>


| 字段名称                | 类型                                   | 在场  | 描述                                                                                                                                                                                                                                                                                         |
| ------------------- | ------------------------------------ | --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `from_leg_group_id` | 国外身份证参考`fare_leg_rules.leg_group_id` | 可选的 | 标识一组转乘前票价段规则。<br/><br/>如果没有匹配`fare_transfer_rules.from_leg_group_id`的价值观`leg_group_id`被过滤，为空`fare_transfer_rules.from_leg_group_id`默认会匹配。<br/><br/>中的一个空条目`fare_transfer_rules.from_leg_group_id`对应于下定义的所有腿组`fare_leg_rules.leg_group_id`不包括下面列出的那些`fare_transfer_rules.from_leg_group_id` |
| `to_leg_group_id`   | 国外身份证参考`fare_leg_rules.leg_group_id` | 可选的 | 标识一组转换后票价段规则。<br/><br/>如果没有匹配`fare_transfer_rules.to_leg_group_id`的价值观`leg_group_id`被过滤，为空`fare_transfer_rules.to_leg_group_id`默认会匹配。<br/><br/>中的一个空条目`fare_transfer_rules.to_leg_group_id`对应于下定义的所有腿组`fare_leg_rules.leg_group_id`不包括下面列出的那些`fare_transfer_rules.to_leg_group_id`         |
| `transfer_count` |非零整数 |**有条件禁止**|定义传输规则可以应用于多少连续传输。<br/><br/>有效的选项是：<br/>`-1` - 没有限制。<br/>`1`或更多 - 定义传输规则可能跨越的传输数量。<br/><br/>如果一个子旅程匹配多个不同的记录transfer_count s，那么最小的规则transfer_count大于或等于子旅程当前传输计数的将被选择。<br/><br/>有条件禁止：<br/>-**禁止**如果`fare_transfer_rules. from_leg_group_id`from_leg_group_id不等于`fare_transfer_rules. to_leg_group_id`to_leg_group_id .<br/>- 如果`fare_transfer_rules. from_leg_group_id`是**必需**的。from_leg_group_id等于`fare_transfer_rules. to_leg_group_id`to_leg_group_id . |
|duration_limit |正整数 |可选 |定义传输的持续时间限制。<br/><br/>必须以秒为增量的整数表示。<br/><br/>如果没有持续时间限制， `fare_transfer_rules. duration_limit`duration_limit必须为空。 || `duration_limit_type` |枚举 |**有条件要求**|定义`fare_transfer_rules. duration_limit`duration_limit .<br/><br/>有效的选项是：<br/>`0` - 当前航段的出发票价验证和下一航段的到达票价验证之间。<br/>`1` - 在当前航段的出发票价验证和下一航段的出发票价验证之间。<br/>`2` - 在当前航段的到达票价验证和下一航段的出发票价验证之间。<br/>`3` - 在当前航段的到达票价验证和下一航段的到达票价验证之间。<br/><br/>有条件要求：<br/>- 如果`fare_transfer_rules. duration_limit`是**必需**的。duration_limit被定义为。<br/>-**禁止**如果`fare_transfer_rules. duration_limit`duration_limit是空的。 |
| `fare_transfer_type` | 枚举 | **必填** | 表示旅程中段间中转的费用处理方式：<br/>![](../assets/2-leg.svg)<br/>有效的选项是：<br/>`0` - `fare_leg_rules.fare_product_id`加上`fare_transfer_rules.fare_product_id` ；甲+乙。<br/>`1` - `fare_leg_rules.fare_product_id`加上`fare_transfer_rules.fare_product_id`加上到段`fare_leg_rules.fare_product_id` ；甲+乙+乙。<br/>`2` - `fare_transfer_rules.fare_product_id` ； AB。<br/><br/>旅程中多次转移之间的成本处理交互：<br/>![](../assets/3-leg.svg)<br/><table><thead><tr><th>`fare_transfer_type`</th><th>加工 A > B</th><th>加工 B > C</th></tr></thead><tbody><tr><td>`0`</td><td>A + AB</td><td>S + BC</td></tr><tr><td>`1`</td><td>A + AB +B</td><td>S + BC + C</td></tr><tr><td>`2`</td><td>AB</td><td>S + BC</td></tr></tbody></table>其中 S 表示前一個分支和轉移的總處理成本。 |
| `fare_product_id` |引用`fare_products. fare_product_id`fare_product_id |可选 |在两个票价段之间转移所需的票价产品。如果为空，则传输规则的成本为 0。|<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

### areas.txt

文件：**可选**

首要的关键 （area_id )

定义区域标识符。

| 字段名称        | 类型   | 在场      | 描述                                    |
| ----------- | ---- | ------- | ------------------------------------- |
| `area_id`   | 唯一身份 | **必需的** | 标识一个区域。必须是唯一的[areas.txt](#areastxt) . |
| `area_name` | 文本   | **可选的** | 向骑手显示的区域名称。                           |

### stop_areas.txt

文件：**可选**

主键 ( `*` )

指定站点从stops.txt到地区。

| 字段名称      | 类型                     | 在场      | 描述                                                                                                                                                    |
| --------- | ---------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `area_id` | 国外身份证参考`areas.area_id` | **必需的** | 识别一个或多个区域`stop_id`属于。相同`stop_id`可以定义在很多`area_id` s。                                                                                                   |
| `stop_id` | 国外身份证参考`stops.stop_id` | **必需的** | 标识一个停靠点。如果一个站（即停止与`stops.location_type=1`) 在该字段中定义，假设它的所有平台（即全部以`stops.location_type=0`有这个站定义为`stops.parent_station`) 是同一区域的一部分。可以通过将平台分配给其他区域来覆盖此行为。 |

### shapes.txt

文件：**可选**

首要的关键 （shape_id ,shape_pt_sequence )

形状描述车辆沿路线路线行驶的路径，并在文件中定义shapes.txt .形状与行程相关联，由车辆按顺序通过的一系列点组成。形状不需要精确地截取停靠点的位置，但行程中的所有停靠点都应位于该行程的形状的一小段距离内，即靠近连接形状点的直线段。

| 字段名称                  | 类型   | 在场      | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| --------------------- | ---- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `shape_id`            |  ID  | **必需的** | 标识一个形状。                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `shape_pt_lat`        | 纬度   | **必需的** | 形状点的纬度。中的每条记录[shapes.txt](#shapestxt)表示用于定义形状的形状点。                                                                                                                                                                                                                                                                                                                                                                                     |
| `shape_pt_lon`        | 经度   | **必需的** | 形状点的经度。                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `shape_pt_sequence`   | 非负整数 | **必需的** | 形状点连接以形成形状的顺序。值必须随行程增加，但不需要是连续的。<hr/>*示例：如果形状“A_shp”在其定义中包含三个点，则[shapes.txt](#shapestxt)文件可能包含这些记录来定义形状：* <br/> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence` <br/> `A_shp,37.61956,-122.48161,0` <br/> `A_shp,37.64430,-122.41070,6` <br/> `A_shp,37.65863,-122.30839,11`                                                                                                                                                    |
| `shape_dist_traveled` | 非负浮动 | 可选的     | 从第一个形状点到此记录中指定的点沿形状行进的实际距离。旅行计划者用来在地图上显示正确的形状部分。值必须随着增加`shape_pt_sequence`;它们不得用于显示沿路线的反向行驶。距离单位必须与所使用的一致[stop_times.txt](#stop_timestxt) .<hr/>*示例：如果一辆公共汽车沿着上面为 A_shp 定义的三个点行驶，附加的`shape_dist_traveled`值（此处以公里显示）如下所示：* <br/> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled` <br/> `A_shp,37.61956,-122.48161,0,0`<br/>`A_shp,37.64430,-122.41070,6,6.8310` <br/> `A_shp,37.65863,-122.30839,11,15.8765` |

### frequencies.txt

文件：**可选**

首要的关键 （trip_id ,start_time )

frequencies.txt表示按常规车距运行的行程（行程之间的时间）。该文件可用于表示两种不同类型的服务。

* 基于频率的服务 ( `exact_times` = `0` )，其中服务不遵循固定的Schedule全天。相反，运营商试图严格保持预定的行程间隔。
* 的压缩表示Schedule-based 服务 ( `exact_times` = `1` )，在指定时间段内具有完全相同的行程。在Schedule化服务经营者尽量严格遵守Schedule.

| 字段名称           | 类型                     | 在场      | 描述                                                                                                                                                                           |
| -------------- | ---------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip_id`      | 国外身份证参考`trips.trip_id` | **必需的** | 标识指定服务时距适用的行程。                                                                                                                                                               |
| `start_time`   | 时间                     | **必需的** | 第一辆车以指定车距从行程的第一站出发的时间。                                                                                                                                                       |
| `end_time`     | 时间                     | **必需的** | 在行程的第一站，服务更改为不同的发车时间（或停止）的时间。                                                                                                                                                |
| `headway_secs` | 正整数                    | **必需的** | 在指定的时间间隔内，从同一站点（车距）出发的时间（以秒为单位）`start_time`和`end_time` .可以为同一行程定义多个车头时距，但不得重叠。新的进展可能会在前一个进展结束的确切时间开始。                                                                        |
| `exact_times`  | 枚举                     | 可选的     | 指示旅行的服务类型。有关详细信息，请参阅文件说明。有效的选项是：<br/><br/>`0`或空 - 基于频率的行程。<br/>`1` -Schedule全天以完全相同的进度为基础的旅行。在这种情况下`end_time`值必须大于上次所需的行程`start_time`但少于最后一次想要的行程start_time+`headway_secs` . |

### transfers.txt

文件：**可选**

首要的关键 （from_stop_id ,to_stop_id ,from_trip_id ,to_trip_id ,from_route_id ,to_route_id )

在计算行程时，GTFS - 消耗应用程序根据允许的时间插入传输并停止接近。transfers.txt为选定的传输指定附加规则和覆盖。

字段from_trip_id ,to_trip_id ,from_route_id和to_route_id允许更高阶的传输规则特异性。随着from_stop_id和to_stop_id ，特异性排名如下：

1. 两个都trip_id定义：from_trip_id和to_trip_id .
2. 一trip_id和route_id集定义：（from_trip_id和to_route_id ） 或者 （from_route_id和to_trip_id ）。
3. 一trip_id定义：from_trip_id或者to_trip_id .
4. 两个都route_id定义：from_route_id和to_route_id .
5. 一route_id定义：from_route_id或者to_route_id .
6. 仅有的from_stop_id和to_stop_id已定义：未设置路线或行程相关字段。

对于给定有序的到达行程和出发行程对，选择在这两个行程之间应用的具有最大特异性的转移。对于任何一对旅行，不应该有两个具有同等最大特异性的转移可以适用。


| 字段名称                | 类型                       | 在场        | 描述                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------- | ------------------------ | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `from_stop_id`      | 国外身份证参考`stops.stop_id`   | **有条件要求** | 标识路线之间开始连接的站点或车站。如果此字段涉及车站，则换乘规则适用于其所有子车站。禁止引用一个站`transfer_types`4 和 5。                                                                                                                                                                                                                                                                                                                        |
| `to_stop_id`        | 国外身份证参考`stops.stop_id`   | **有条件要求** | 标识路线之间的连接结束的站点或车站。如果此字段涉及车站，则换乘规则适用于所有子站点。禁止引用一个站`transfer_types` 4 和 5。                                                                                                                                                                                                                                                                                                                       |
| `from_route_id`     | 国外身份证参考`routes.route_id` | 可选的       | 标识连接开始的路由。<br/><br/>如果`from_route_id`已定义，转移将适用于给定路线上的到达行程`from_stop_id` .<br/><br/>如果两者`from_trip_id`和`from_route_id`被定义，`trip_id`必须属于`route_id`， 和`from_trip_id`将优先。                                                                                                                                                                                                                          |
| `to_route_id`       | 国外身份证参考`routes.route_id` | 可选的       | 标识连接结束的路径。<br/><br/>如果`to_route_id`已定义，转移将适用于给定路线上的出发行程`to_stop_id` .<br/><br/>如果两者`to_trip_id`和`to_route_id`被定义，`trip_id`必须属于`route_id`， 和`to_trip_id`将优先。                                                                                                                                                                                                                                    |
| `from_trip_id`      | 国外身份证参考`trips.trip_id`   | **有条件要求** | 标识路线之间的连接开始的行程。<br/><br/>如果`from_trip_id`已定义，转移将适用于给定的到达行程`from_stop_id` .<br/><br/>如果两者`from_trip_id`和`from_route_id`被定义，`trip_id`必须属于`route_id`， 和`from_trip_id`将优先。如果需要`transfer_type`是`4`或者`5` .                                                                                                                                                                                           |
| `to_trip_id`        | 国外身份证参考`trips.trip_id`   | **有条件要求** | 标识路线之间的连接结束的行程。<br/><br/>如果`to_trip_id`已定义，转移将适用于给定的出发行程`to_stop_id` .<br/><br/>如果两者`to_trip_id`和`to_route_id`被定义，`trip_id`必须属于`route_id`， 和`to_trip_id`将优先。如果需要`transfer_type`是`4`或者`5` .                                                                                                                                                                                                     |
| `transfer_type`     | 枚举                       | **必需的**   | 指示指定的连接类型 (`from_stop_id` ,`to_stop_id` ） 一对。有效的选项是：<br/><br/> `0`或空 - 路线之间的推荐转乘点。<br/>`1` - 两条路线之间的定时换乘点。预计出发的车辆将等待到达的车辆，并留出足够的时间让骑手在路线之间换乘。<br/>`2` - 转移需要在到达和离开之间的最短时间，以确保连接。转移所需的时间由`min_transfer_time` .<br/>`3`- 在该地点的路线之间无法换乘。<br/>`4`- 乘客可以通过留在同一辆车上从一次旅行转移到另一次旅行（“座位内转移”）。有关此类转移的更多详细信息[以下](#linked-trips).<br/>`5` - 连续行程之间不允许进行座位内换乘。乘客必须下车并重新上车。有关此类转移的更多详细信息[以下](#linked-trips) . |
| `min_transfer_time` | 非负整数                     | 可选的       | 允许在指定站点的路线之间换乘所需的时间量（以秒为单位）。这`min_transfer_time`应该足以允许典型的骑手在两个站点之间移动，包括缓冲时间以允许Schedule每条路线的差异。                                                                                                                                                                                                                                                                                                 |

#### 联程旅行

以下适用于`transfer_type=4`和`=5` ，它们用于将旅行链接在一起，无论是否有座位内转移。

连接在一起的行程必须由同一辆车运营。车辆可以与其他车辆连接或分离。

如果同时提供了链接的行程转移和 block_id 并且它们产生冲突的结果，则应使用链接的行程转移。

最后一站from_trip_id应该在地理位置上靠近to_trip_id ，最后到达时间from_trip_id应该早于但接近于第一个出发时间to_trip_id .最后到达时间from_trip_id可能晚于第一个出发时间to_trip_id万一to_trip_id行程发生在随后的服务日。

在常规情况下，行程可以 1 对 1 链接，但也可以 1 对 n、n 对 1 或 n 对 n 链接以表示更复杂的行程继续。例如，两个火车行程（下图中的行程 A 和行程 B）可以在一个公共车站的车辆耦合操作后合并为一个火车行程（行程 C）：

- 在一对一的延续中， `trips. service_id`service_id对于每个to_trip_id必须相同。
- 在 n 对 1 的延续中， `trips. service_id`service_id对于每个from_trip_id必须相同。
- n 对 n 延续必须尊重这两个约束。
- 旅行可以作为多个不同延续的一部分链接在一起，前提是`trip. service_id`service_id不得在任何服务日重叠。

<pre>
旅行甲
────────────────────
                    \ 行程 C
                     ──────────────
行程 B /
────────────────────/
</pre>

### pathways.txt

文件：**可选**

首要的关键 （pathway_id )

文件pathways.txt和levels.txt使用图形表示来描述地铁或火车站，节点表示位置，边表示路径。

要从车站入口/出口（表示为`location_type=2`的位置的节点）导航到平台（表示为`location_type=0`或空的位置的节点），骑手将穿过人行道、检票口、楼梯，和其他表示为路径的边缘。通用节点（用`location_type=3`表示的节点）可用于连接整个车站的路径。

必须在车站中详尽地定义路径。如果定义了任何路径，则假定代表了整个车站的所有路径。因此，以下准则适用：

- 无悬空位置：如果车站内的任何位置有通道，则该车站内的所有位置都应有通道，但有登机区的站台除外（ `location_type=4` ，请参阅下面的指南）。
- 具有登机区的平台没有路径：具有登机区（ `location_type=4` ）的平台（ `location_type=0`或空）被视为父对象，而不是点。在这种情况下，平台不得分配路径。应为每个平台的登机区分配所有路径。
- 无锁定平台：每个平台（ `location_type=0`或空）或登机区（ `location_type=4` ）必须通过一些路径链连接到至少一个入口/出口（ `location_type=2` ）。不允许从给定站台通往站外的路径的车站很少见。

| 字段名称                     | 类型                     | 在场      | 描述                                                                                                                                                                                                                                                                                                                          |
| ------------------------ | ---------------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `pathway_id`             | 唯一身份                   | **必需的** | 标识通路。被系统用作记录的内部标识符。在数据集中必须是唯一的。<br/><br/>不同的路径可能具有相同的值`from_stop_id`和`to_stop_id` .<hr/>_示例：当两个自动扶梯并排在相反的方向时，或者当一个楼梯组和电梯从同一个地方到同一个地方时，不同`pathway_id`可能有相同的`from_stop_id`和`to_stop_id`价值观。_                                                                                                                                  |
| `from_stop_id`           | 国外身份证参考`stops.stop_id` | **必需的** | 路径开始的位置。<br/><br/>必须包含一个`stop_id`标识一个平台（`location_type=0`或空），入口/出口（`location_type=2` ), 通用节点 (`location_type=3` ) 或登机区 (`location_type=4` ）。 <br/><br/>价值观`stop_id`识别电台（`location_type=1` ) 被禁止。                                                                                                                            |
| `to_stop_id`             | 国外身份证参考`stops.stop_id` | **必需的** | 路径结束的位置。<br/><br/>必须包含一个`stop_id`标识一个平台（`location_type=0`或空），入口/出口（`location_type=2` ), 通用节点 (`location_type=3` ) 或登机区 (`location_type=4` ）。 <br/><br/>价值观`stop_id`识别电台（`location_type=1` ) 被禁止。                                                                                                                            |
| `pathway_mode`           | 枚举                     | **必需的** | 指定的路径类型 (`from_stop_id` ,`to_stop_id` ） 一对。有效的选项是：<br/><br/>`1` - 走道。<br/>`2` - 楼梯。<br/>`3` - 移动人行道/旅行者。<br/>`4` - 自动扶梯。<br/>`5` - 电梯。<br/>`6` - 收费门（或支付门）：进入车站区域的通道，需要支付证明才能通过。检票口可以将车站的付费区域与未付费区域分开，或者将同一站内的不同付费区域相互分开。该信息可用于避免使用需要乘客支付不必要费用的捷径来引导乘客通过车站，例如引导乘客步行穿过地铁站台到达公交专用道。<br/>`7` - 出入口：从付费区域进入未付费区域的通道，无需支付证明即可通过。 |
| `is_bidirectional`       | 枚举                     | **必需的** | 表示路径可以走的方向：<br/><br/>`0` - 单向路径，只能从`from_stop_id`至`to_stop_id` .<br/>`1`- 可以双向使用的双向路径。<br/><br/>出入口（`pathway_mode=7` ) 不能是双向的。                                                                                                                                                                                              |
| `length`                 | 非负浮动                   | 可选的     | 从起始位置开始的路径水平长度（以米为单位）（定义在`from_stop_id`）到目标位置（定义在`to_stop_id` ）。 <br/><br/>建议将此字段用于人行道（`pathway_mode=1` ), 检票口 (`pathway_mode=6` ) 和出口大门 (`pathway_mode=7` ）。                                                                                                                                                               |
| `traversal_time`         | 正整数                    | 可选的     | 从起始位置穿过路径所需的平均时间（以秒为单位）（定义在`from_stop_id`）到目标位置（定义在`to_stop_id` ）。 <br/><br/>建议将此字段用于移动人行道（`pathway_mode=3` ), 自动扶梯 (`pathway_mode=4` ) 和电梯 (`pathway_mode=5` ）。                                                                                                                                                            |
| `stair_count`            | 非空整数                   | 可选的     | 路径的楼梯数量。<br/><br/>一个积极的`stair_count`意味着骑手从`from_stop_id`至`to_stop_id`.和一个负面`stair_count`意味着骑手从`from_stop_id`至`to_stop_id` .<br/><br/>建议将此字段用于楼梯（`pathway_mode=2` ）。 <br/><br/>如果只能提供估计的楼梯数，建议 1 层楼大约有 15 个楼梯。                                                                                                               |
| `max_slope`              | 漂浮                     | 可选的     | 路径的最大坡度比。有效的选项是：<br/><br/>`0`或空 - 没有斜坡。<br/>`Float` - 路径的坡度比，向上为正，向下为负。<br/><br/>该字段只能用于人行道（`pathway_mode=1` ) 和自动人行道 (`pathway_mode=3` ）。 <hr/>_示例：在美国，0.083（也写为 8.3%）是手推轮椅的最大坡度比，即每增加 1m 增加 0.083m（即 8.3cm）。_                                                                                                             |
| `min_width`              | 正浮动                    | 可选的     | 以米为单位的路径的最小宽度。<br/><br/>如果最小宽度小于 1 米，建议使用此字段。                                                                                                                                                                                                                                                                               |
| `signposted_as`          | 文本                     | 可选的     | 来自骑手可见的物理标牌的面向公众的文本。<br/><br/>可用于向乘客提供文本指示，例如“跟随标志前往”。中的文字`singposted_as`应该完全显示在标志上的印刷方式。<br/><br/>当物理标牌是多语言时，可以按照以下示例填充和翻译该字段`stops.stop_name`在字段定义中`feed_info.feed_lang` .                                                                                                                                                |
| `reversed_signposted_as` | 文本                     | 可选的     | 如同`signposted_as`，但是当从`to_stop_id`到`from_stop_id` .                                                                                                                                                                                                                                                                         |

### levels.txt

文件：**有条件要求**

首要的关键 （level_id )

描述站中的级别。配合使用很有用pathways.txt , 并且是使用电梯导航路径所必需的 ( `pathway_mode=5` )。

| 字段名称          | 类型   | 在场      | 描述                                                           |
| ------------- | ---- | ------- | ------------------------------------------------------------ |
| `level_id`    | 唯一身份 | **必需的** | 标识站中的级别。                                                     |
| `level_index` | 漂浮   | **必需的** | 指示其相对位置的级别的数字索引。<br/><br/>地面应有索引`0`, 地上水平由正指数表示，地下水平由负指数表示。  |
| `level_name`  | 文本   | 可选的     | 骑手在建筑物或车站内看到的级别名称。<hr/>_示例：乘电梯到“Mezzanine”或“Platform”或“-1”。_ |

### translations.txt

文件：**可选**

首要的关键 （table_name ,field_name ,language ,record_id ,record_sub_id ,field_value )

在有多种官方语言的地区，交通机构/运营商通常有language- 特定名称和网页。为了最好地为这些地区的骑手服务，数据集包含这些是很有用的language依赖值。

| 字段名称            | 类型                 | 在场        | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| --------------- | ------------------ | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `table_name`    | 枚举                 | **必需的**   | 定义包含要翻译的字段的表。允许的值为：<br/><br/> -`agency`<br/> -`stops`<br/> -`routes`<br/> -`trips`<br/> -`stop_times`<br/> -`pathways`<br/> -`levels`<br/> -`feed_info`<br/> -`attributions`<br/><br/>添加到的任何文件GTFS会有一个`table_name`与上面列出的文件名等效的值（即，不包括`.txt`文件扩展名）。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `field_name`    | 文本                 | **必需的**   | 要翻译的字段的名称。具有类型的字段`Text`可以翻译，字段类型`URL` ,`Email`和`Phone number`也可以“翻译”以提供正确的资源language.不应翻译其他类型的字段。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `language`      | language代码         | **必需的**   | language的翻译。<br/><br/>如果language与中相同`feed_info.feed_lang`，该字段的原始值将被假定为在没有特定翻译的语言中使用的默认值（如果`default_lang`没有另外说明）。<hr/>_示例：在瑞士，一个官方双语州的城市被正式称为“Biel/Bienne”，但在法语中简称为“Bienne”，在德语中简称为“Biel”。_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `translation`   | 文本或 URL 或电子邮件或电话号码 | **必需的**   | 翻译价值。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `record_id`     | 外国身份证              | **有条件要求** | 定义对应于要翻译的字段的记录。价值在`record_id`必须是表主键的第一个或唯一一个字段，如每个表的主键属性中定义的那样，如下所示：<br/><br/> -`agency_id`为了`agency.txt`<br/> -`stop_id`为了`stops.txt` ;<br/> -`route_id`为了`routes.txt` ;<br/> -`trip_id`为了`trips.txt` ;<br/> -`trip_id`为了`stop_times.txt` ;<br/> -`pathway_id`为了`pathways.txt` ;<br/> -`level_id`为了`levels.txt` ;<br/> -`attribution_id`为了`attribution.txt` .<br/><br/>上面未定义的表中的字段不应翻译。然而，生产者有时会添加超出官方规范的额外字段，并且这些非官方字段可能会被翻译。下面是推荐的使用方法`record_id`对于这些表：<br/><br/> -`service_id`为了`calendar.txt` ;<br/> -`service_id`为了`calendar_dates.txt` ;<br/> -`fare_id`为了`fare_attributes.txt` ;<br/> -`fare_id`为了`fare_rules.txt` ;<br/> -`shape_id`为了`shapes.txt` ;<br/> -`trip_id`为了`frequencies.txt` ;<br/> -`from_stop_id`为了`transfers.txt` .<br/><br/>有条件要求：<br/> -**禁止的**如果`table_name`是`feed_info` .<br/> -**禁止的**如果`field_value`被定义为。<br/> -**必需的**如果`field_value`是空的。 |
| `record_sub_id` | 外国身份证              | **有条件要求** | 当表没有唯一 ID 时，帮助包含要翻译的字段的记录。因此，价值在`record_sub_id`是表的二级ID，如下表所定义：<br/><br/> - 无`agency.txt` ;<br/>- 无`stops.txt` ;<br/>- 无`routes.txt` ;<br/>- 无`trips.txt` ;<br/> -`stop_sequence`为了`stop_times.txt` ;<br/>- 无`pathways.txt` ;<br/>- 无`levels.txt` ;<br/>- 无`attributions.txt` .<br/><br/>上面未定义的表中的字段不应翻译。然而，生产者有时会添加超出官方规范的额外字段，并且这些非官方字段可能会被翻译。下面是推荐的使用方法`record_sub_id`对于这些表：<br/><br/>- 无`calendar.txt` ;<br/> -`date`为了`calendar_dates.txt` ;<br/>- 无`fare_attributes.txt` ;<br/> -`route_id`为了`fare_rules.txt` ;<br/>- 无`shapes.txt` ;<br/> -`start_time`为了`frequencies.txt` ;<br/> -`to_stop_id`为了`transfers.txt` .<br/><br/>有条件要求：<br/> -**禁止的**如果`table_name`是`feed_info` .<br/> -**禁止的**如果`field_value`被定义为。<br/> -**必需的**如果`table_name=stop_times`和`record_id`被定义为。                                                                                            |
| `field_value`   | 文本或 URL 或电子邮件或电话号码 | **有条件要求** | 而不是定义应该通过使用翻译哪个记录`record_id`和`record_sub_id`，该字段可用于定义应翻译的值。使用时，将在由 标识的字段时应用翻译`table_name`和`field_name`包含与中定义的完全相同的值field_value.<br/><br/>该字段必须有**确切地**中定义的值`field_value`.如果只有一部分值匹配`field_value`, 翻译不会被应用。<br/><br/>如果两个翻译规则匹配相同的记录（一个与`field_value`，另一个与`record_id`)，规则与`record_id`优先。<br/><br/>有条件要求：<br/> -**禁止的**如果`table_name`是`feed_info` .<br/> -**禁止的**如果`record_id`被定义为。<br/> -**必需的**如果`record_id`是空的。                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

### feed_info.txt

文件：**可选**（如果需要，则为**必需**translations.txt提供）

主键（无）

该文件包含有关数据集本身的信息，而不是数据集描述的服务。在某些情况下，数据集的发布者与任何机构都是不同的实体。

如果两种引用方法（record_id ,record_sub_id ） 和field_value用于在 2 个不同的行中翻译相同的值，提供的翻译 (record_id ,record_sub_id ) 优先。


| 字段名称                  | 类型         | 在场      | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| --------------------- | ---------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `feed_publisher_name` | 文本         | **必需的** | 发布数据集的组织的全名。这可能与其中一个相同`agency.agency_name`价值观。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `feed_publisher_url`  | 网址         | **必需的** | 数据集发布组织网站的 URL。这可能与其中一个相同`agency.agency_url`价值观。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `feed_lang`           | language代码 | **必需的** | 默认language用于此数据集中的文本。此设置有帮助GTFS消费者选择大小写规则等language- 数据集的特定设置。文件`translations.txt`如果需要将文本翻译成默认语言以外的语言，则可以使用。<br/><br/>默认language对于具有多种语言的原始文本的数据集，可能是多语言的。在这种情况下，`feed_lang`字段应包含language代码`mul`由标准 ISO 639-2 定义，并为每个language数据集中使用的应提供`translations.txt`.如果数据集中所有的原文都在同一个language， 然后`mul`不应该使用。<hr/>_示例：考虑来自瑞士等多语言国家的数据集，其原始数据`stops.stop_name`字段填充了不同语言的站点名称。每个站名都是按照占优写的language在该站点的地理位置，例如`Genève`对于讲法语的城市日内瓦，`Zürich`对于讲德语的城市苏黎世，以及`Biel/Bienne`为双语城市比尔/比安。数据集`feed_lang`应该`mul`翻译将在`translations.txt`， 在德国：`Genf` ,`Zürich`和`Biel` ;法语：`Genève` ,`Zurich`和`Bienne` ;用意大利语：`Ginevra` ,`Zurigo`和`Bienna` ;和英文：`Geneva` ,`Zurich`和`Biel/Bienne` ._ |
| `default_lang`        | language代码 | 可选的     | 定义language当数据消费者不知道language的骑手。往往会`en`（英语）。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `feed_start_date`     | 日期         | 可选的     | 数据集提供完整可靠Schedule服务开始期间的信息`feed_start_date`一天到结束`feed_end_date`天。如果不可用，这两天可能会空着。这`feed_end_date`日期不得早于`feed_start_date`日期，如果两者都给出。建议数据集提供者提供Schedule在此期间之外的数据，以告知可能的未来服务，但数据集消费者应注意其非权威状态。如果`feed_start_date`或者`feed_end_date`超出定义的活动日历日期[calendar.txt](#calendartxt)和[calendar_dates.txt](#calendar_datestxt)，数据集明确断言在`feed_start_date`或者`feed_end_date`范围但不包括在活动日历日期中。                                                                                                                                                                                                                                                                               |
| `feed_end_date`       | 日期         | 可选的     |  （看上面）                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `feed_version`        | 文本         | 可选的     | 指示其当前版本的字符串GTFS数据集。GTFS - 消费应用程序可以显示此值，以帮助数据集发布者确定是否已合并最新数据集。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `feed_contact_email`  | 电子邮件       | 可选的     | 用于沟通的电子邮件地址GTFS数据集和数据发布实践。`feed_contact_email`是技术联系人GTFS - 消耗应用程序。通过以下方式提供客户服务联系信息[agency.txt](#agencytxt) .                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `feed_contact_url`    | 网址         | 可选的     | 联系信息的 URL、Web 表单、支持台或其他用于与GTFS数据集和数据发布实践。`feed_contact_url`是技术联系人GTFS - 消耗应用程序。通过以下方式提供客户服务联系信息[agency.txt](#agencytxt) .                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

### attributions.txt

文件：**可选**

首要的关键 （attribution_id )

该文件定义了应用于数据集的属性。

| 字段名称                | 类型                        | 在场      | 描述                                                                                                                                          |
| ------------------- | ------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `attribution_id`    | 唯一身份                      | 可选的     | 标识数据集或其子集的属性。这对翻译非常有用。                                                                                                                      |
| `agency_id`         | 国外身份证参考`agency.agency_id` | 可选的     | 归属地适用的机构。<br/><br/>如果一个`agency_id` ,`route_id` ， 或者`trip_id`属性已定义，其他必须为空。如果未指定任何一个，则归因将应用于整个数据集。                                            |
| `route_id`          | 国外身份证参考`routes.route_id`  | 可选的     | 功能同上`agency_id`除非属性适用于路线。多个属性可能适用于同一路线。                                                                                                     |
| `trip_id`           | 国外身份证参考`trips.trip_id`    | 可选的     | 功能同上`agency_id`除非归因适用于旅行。多个归因可能适用于同一次旅行。                                                                                                    |
| `organization_name` | 文本                        | **必需的** | 数据集所属的组织的名称。                                                                                                                                |
| `is_producer`       | 枚举                        | 可选的     | 组织的角色是生产者。有效的选项是：<br/><br/>`0`或为空 - 组织没有此角色。<br/>`1` - 组织确实有这个角色。<br/><br/>至少其中一个字段`is_producer` ,`is_operator`， 或者`is_authority`应该设置在`1` . |
| `is_operator`       | 枚举                        | 可选的     | 功能同上`is_producer`除了组织的角色是操作员。                                                                                                               |
| `is_authority`      | 枚举                        | 可选的     | 功能同上`is_producer`除了组织的作用是权威。                                                                                                                |
| `attribution_url`   | 网址                        | 可选的     | 组织的 URL。                                                                                                                                    |
| `attribution_email` | 电子邮件                      | 可选的     | 组织的电子邮件。                                                                                                                                    |
| `attribution_phone` | 电话号码                      | 可选的     | 组织的电话号码。                                                                                                                                    |
