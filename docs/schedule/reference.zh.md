---
search:
  exclude: true
---

# GTFS Schedule参考

**2022年12月8日修订。更多细节见[修订历史](../revision-history)。**

本文件定义了构成GTFS数据集的文件的格式和结构。

## 内容表

1. [文件约定](#document-conventions)
2. [数据集文件](#dataset-files)
3. [文件要求](#file-requirements)
4. [字段定义](#field-definitions)
      - [agency.txt](#agencytxt)
      - [stops.txt](#stopstxt)
      - [routes.txt](#routestxt)
      - [trips.txt](#tripstxt)
      - [stop_times.txt](#stop_timestxt)
      - [calendar.txt](#calendartxt)
      - [calendar_dates.txt](#calendar_datestxt)
      - [fare_attributes.txt](#fare_attributestxt)
      - [fare_rules.txt](#fare_rulestxt)
      - [fare_media.txt](#fare_mediatxt)
      - [fare_products.txt](#fare_productstxt)
      - [fare_leg_rules.txt](#fare_leg_rulestxt)
      - [fare_transfer_rules.txt](#fare_transfer_rulestxt)
      - [areas.txt](#areastxt)
      - [stop_areas.txt](#stop_areastxt)
      - [shapes.txt](#shapestxt)
      - [frequencies.txt](#frequenciestxt)
      - [transfers.txt](#transferstxt)
      - [pathways.txt](#pathwaystxt)
      - [levels.txt](#levelstxt)
      - [translations.txt](#translationstxt)
      - [feed_info.txt](#feed_infotxt)
      - [attributions.txt](#attributionstxt)

## 文件约定

本文档中的关键词 "MUST"、"MUST NOT"、"REQUIRED"、"SHALL"、"SHALL NOT"、"SHOULD NOT"、"RECOMMENDED"、"MAY "和 "OPTIONAL "应按照[RFC 2119](https://tools.ietf.org/html/rfc2119)中的描述来解释。

### 术语定义

本节对本文件中使用的术语进行定义。

- **数据集（Dataset**）--本规范引用定义的一套完整的文件。改变数据集会创建一个新版本的数据集。数据集应该发布在一个公开的、永久的URL上，包括压缩文件的名称。(例如，https://www.agency.org/gtfs/gtfs.zip)。
- **记录**- 一个基本的数据结构，由若干不同的字段值组成，描述一个单一的实体（如交通机构、车站、路线等）。在表格中表示为一行。
- **字段**- 一个对象或实体的属性。在表格中，表示为一列。
- **字段值**- 一个字段中的单个条目。在一个表格中，表示为一个单元格。
- **服务日**- 服务日是一个时间段，用于指示路线调度。服务日的确切定义因机构而异，但服务日往往与日历日不一致。如果服务在某一天开始，在第二天结束，则服务日可能超过24:00:00。例如，从周五08:00:00到周六02:00:00的服务，可以表示为在一个服务日从08:00:00到26:00:00。
- **文字转语音字段**--该字段应该包含与它的父字段相同的信息（如果它是空的，就落在它的父字段上）。它的目的是作为文本到语音阅读，因此，缩写应该被删除（"St "应该读作 "Street "或 "Saint"；"Elizabeth I "应该是 "Elizabeth the first"），或者保留它的读法（"JFK Airport "是说缩写）。
- **路段**--在一次旅行中，乘客在一对后续地点之间登机和下车的旅行。
- **旅程**--从出发地到目的地的全部旅行，包括中间的所有行程和换乘。
- **副行程**- 两个或更多的腿，组成一个行程的子集。
- **票价产品**- 可购买的票价产品，可用于支付或验证旅行。

### 存在感

适用于字段和文件的存在条件。

- **要求**- 该字段或文件必须包括在数据集中，并包含每条记录的有效值。
- **可选**- 该字段或文件可以从数据集中省略。
- **有条件要求**--该字段或文件必须在字段或文件描述中列出的条件下被包含。
- **有条件禁止**- 在字段或文件描述中列出的条件下，字段或文件不能被包括在内。

### 字段类型

- **颜色**- 编码为六位数的十六进制数字的颜色。参考<https://htmlcolorcodes.com>，生成一个有效的值（前导的 "#"不能包括在内）。<br/>*例如。`FFFFFF`代表白色，`0000`代表黑色或`0039A6`*代表NYMTA的A、C、E线。
- **货币代码**- ISO 4217的字母货币代码。关于当前货币的列表，请参考[https://en.wikipedia.org/wiki/ISO\_4217#Active_codes。](https://en.wikipedia.org/wiki/ISO\_4217#Active_codes)<br/>*例如。`CAD`代表加拿大元，`EUR`代表欧元，`JPY`代表日元。*
- **货币金额**- 表示货币金额的小数点值。小数点的位数由[ISO 4217](https://en.wikipedia.org/wiki/ISO\_4217#Active_codes)规定，用于随附的货币代码。所有的财务计算都应该作为小数、货币或其他适合财务计算的等价类型来处理，这取决于用于消耗数据的language。由于计算过程中货币的收益或损失，不鼓励以浮动方式处理货币金额。
- **日期**- 服务日，格式为YYYMMDD。由于一个服务日内的时间可能超过24:00:00，一个服务日可能包含随后的一天（几个）的信息。<br/>*例如：`20180913`代表`2018`年9月13日。*
- **电子邮件**- 一个电子邮件地址。<br/>*例如：`example@example.com`*
- **Enum**- 从 "描述 "栏中定义的一组预定义常数中的一个选项。<br/>*例如。`route_type`字段包含`0`代表有轨电车，`1`*代表地铁......
- **ID**- ID字段的值是一个内部ID，不打算显示给乘客，是任何UTF-8字符的序列。建议只使用可打印的ASCII字符。当一个ID在一个文件中必须是唯一的时候，它被标记为 "唯一ID"。在一个.txt文件中定义的ID经常被另一个.txt文件所引用。引用另一个表中的ID的ID被标记为 "外来ID"。<br/>*例如。[stops.txt](#stopstxt)中的`stop_id`字段是一个 "唯一ID"。stops.[stops.txt](#stopstxt)中的`parent_station`字段是一个 "引用`stop.stop_id`的外来ID"。*
- **language**code - 一个IETF BCP 47language代码。关于IETF BCP 47的介绍，请参考<https://www.rfc-editor.org/rfc/bcp/bcp47.txt>和[language-tags/">language](<https://www.w3.org/International/articles/\<glossary variable=>)<br/>*例如：`en`代表英语，`en-US`代表美式英语或`de`*代表德语。
- **纬度**- WGS84纬度，以十进制为单位。该值必须大于或等于-90.0，小于或等于90.0。*<br/>例如。`41.890169`*代表罗马的斗兽场。
- **经度**- WGS84经度，十进制。该值必须大于或等于-180.0，小于或等于180.0。<br/>*例如：`12.492269`*代表罗马的斗兽场。
- **Float**- 一个浮点数字。
- **Integer**- 一个整数。
- **Phone number**- 一个电话号码。
- **时间**- HH:MM:SS格式的时间（H:MM:SS也可以接受）。时间从服务日的 "中午减去12点 "开始计算（实际上是午夜，除了夏令时变化的日子）。对于发生在午夜之后的时间，输入大于24:00:00的值，以Schedule开始的那一天的HH:MM:SS的当地时间为准。<br/>*例如：`14:30:00`代表2:30PM或`25:35:00`代表第二天的1:35AM。*
- **文本**- 由UTF-8字符组成的字符串，其目的是显示，因此必须是人类可读的。
- **时区**- 来自<https://www.iana.org/time-zones> 的TZ时区[。](https://www.iana.org/time-zones)时区名称从不包含空格字符，但可以包含下划线。有关有效值的列表，请参考<https://en.wikipedia.org/wiki/List_of_tz_zones>。<br/>*例如。`亚洲/东京`，`美国/洛杉矶`或`非洲/开罗`*。
- **URL**- 一个完全合格的URL，包括http\:// 或https\://，URL中的任何特殊字符必须被正确转义。关于如何创建完全合格的URL值的描述，请参见以下<https://www.w3.org/Addressing/URL/4_URI_Recommentations.html>。

### 字段标志

适用于浮点数或整数字段类型的标志。

- **非负数**- 大于或等于0。
- **非零**--不等于0。
- **正数**- 大于0。

*例如。**Non-negative float**- 大于或等于0的浮点数。*

### 数据集属性

数据集的**主键**是唯一识别一行的字段或字段组合。`主键（*）`用于当一个文件的所有提供的字段都被用来唯一地识别一行。`主键（无）`意味着该文件只允许有一条记录。

*例如：`trip_id`和`stop_sequence`字段构成[stop_times.txt](#stop_timestxt)的主键。*

## 数据集文件

本规范定义了以下文件。

| 文件名称                                               | 存在    | 描述                                                                                                                                                                                                                                                                                                          |
| -------------------------------------------------- | ----- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [agency.txt](#agencytxt)                           | **需要** | 在此数据集中代表有服务的交通机构。                                                                                                                                                                                                                                                                                           |
| [stops.txt](#stopstxt)                             | **需要** | 车辆接送乘客的站点。也定义了车站和车站出入口。                                                                                                                                                                                                                                                                                     |
| [routes.txt](#routestxt)                           | **需要** | 公交路线。一条路线是一组车次，作为一个单一的服务显示给乘客。                                                                                                                                                                                                                                                                              |
| [trips.txt](#tripstxt)                             | **需要** | 每条路线的车次。一个行程是在一个特定时间段内发生的两个或多个站点的序列。                                                                                                                                                                                                                                                                        |
| [stop_times.txt](#stop_timestxt)                   | **需要** | 车辆到达和离开每个行程的站点的时间。                                                                                                                                                                                                                                                                                          |
| [calendar.txt](#calendartxt)                       | **有条件地要求** | 使用带有开始和结束日期的每周Schedule来指定服务日期。 <br/><br/>有条件的要求。<br/>- **需要**除非所有的服务日期都被定义在 [calendar_dates.txt](#calendar_datestxt).<br/>- 可选的，否则。                                                                                                                                                                         |
| [calendar_dates.txt](#calendar_datestxt)           | **有条件地要求** | 中定义的服务的例外情况。 [calendar.txt](#calendartxt). <br/><br/>有条件要求：有条件要求。<br/>- **需要**如果 [calendar.txt](#calendartxt)被省略。在这种情况下 [calendar_dates.txt](#calendar_datestxt)必须包含所有的服务日期。 <br/>- 可选的，否则。                                                                                                                 |
| [fare_attributes.txt](#fare_attributestxt)         | 可选的   | 一个交通机构的路线的票价信息。                                                                                                                                                                                                                                                                                             |
| [fare_rules.txt](#fare_rulestxt)                   | 可选的 | 适用于行程的票价规则。                                                                                                                                                                                             |
| [fare_media.txt](#fare_mediatxt) | 可选的 | 描述可以采用的票价媒体，以使用票价产品。<br/><br/>文件[fare_media.txt](#fare_mediatxt)描述了[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt) 中没有体现的概念。因此，[fare_media.txt](#fare_mediatxt)的使用与文件[fare_attributes.txt](#fare_attributestxt)和[fare_rules.txt](#fare_rulestxt)完全分开。|
| [fare_products.txt](#fare_productstxt)             | 可选的   | 描述乘客可以购买的不同类型的车票或票价。<br/><br/>文件 [fare_products.txt](fare_productstxt)描述了在 "票价 "中没有体现的票价产品。 [fare_attributes.txt](#fare_attributestxt)和 [fare_rules.txt](#fare_rulestxt).因此，使用 [fare_products.txt](#fare_productstxt)是完全独立于文件 [fare_attributes.txt](#fare_attributestxt)和 [fare_rules.txt](#fare_rulestxt). |
| [fare_leg_rules.txt](#fare_leg_rulestxt)           | 可选的   | 单个旅行段的票价规则。<br/><br/>文件 [fare_leg_rules.txt](#fare_leg_rulestxt)为建立票价结构模型提供了一个更详细的方法。因此，使用 [fare_leg_rules.txt](#fare_leg_rulestxt)与文件完全分开 [fare_attributes.txt](#fare_attributestxt)和 [fare_rules.txt](#fare_rulestxt).                                                                                    |
| [fare_transfer_rules.txt](#fare_transfer_rulestxt) | 可选的   | 旅行段之间转换的票价规则。<br/><br/>随之而来的是 [fare_leg_rules.txt](#fare_leg_rulestxt)，文件 [fare_transfer_rules.txt](#fare_transfer_rulestxt)提供了一个更详细的方法来模拟票价结构。因此，使用 [fare_transfer_rules.txt](#fare_transfer_rulestxt)与文件完全分开 [fare_attributes.txt](#fare_attributestxt)和 [fare_rules.txt](#fare_rulestxt).                |
| [areas.txt](areastxt)                              | 可选的   | 地点的区域分组。                                                                                                                                                                                                                                                                                                    |
| [stop_areas.txt](stop_areastxt)                    | 可选    | 将站点分配到区域的规则。                                                                                                                                                                                                                                                                                                |
| [shapes.txt](#shapestxt)                           | 可选    | 绘制车辆行驶路径的规则，有时被称为路线排列。                                                                                                                                                                                                                                                                                      |
| [frequencies.txt](#frequenciestxt)                 | 可选    | 基于间隔时间的服务或固定时间表服务的压缩代表的间隔时间（车次之间的时间）。                                                                                                                                                                                                                                                                       |
| [transfers.txt](#transferstxt)                     | 可选    | 在路线之间的转换点进行连接的规则。                                                                                                                                                                                                                                                                                           |
| [pathways.txt](#pathwaystxt)                       | 可选    | 连接车站内各个地点的路径。                                                                                                                                                                                                                                                                                               |
| [levels.txt](#levelstxt)                           | **有条件地要求** | 车站内的层级。<br/><br/>有条件要求：有条件要求。<br/>- **需要**当描述带有电梯的路径时，可以使用 "电梯"。`pathway_mode=5`).<br/>- 可选的，否则。                                                                                                                                                                                                            |
| [translations.txt](#translationstxt)               | 可选    | 面向客户的数据集价值的翻译。                                                                                                                                                                                                                                                                                              |
| [feed_info.txt](#feed_infotxt)                     | 可选    | 数据集元数据，包括出版商、版本和过期信息。                                                                                                                                                                                                                                                                                       |
| [attributions.txt](#attributionstxt)               | 可选    | 数据集的属性。                                                                                                                                                                                                                                                                                                     |

## 文件要求

以下要求适用于数据集文件的格式和内容。

- 所有文件必须保存为以逗号分隔的文本。
- 每个文件的第一行必须包含字段名。[字段定义](#field-definitions)部分的每个小节对应于GTFS数据集中的一个文件，并列出该文件中可能使用的字段名。
- 所有的文件和字段名都是区分大小写的。
- 字段值不得包含制表符、回车符或新行。
- 包含引号或逗号的字段值必须用引号括起来。此外，字段值中的每个引号必须在前面加一个引号。这与微软Excel输出逗号分隔（CSV）文件的方式一致。关于CSV文件格式的更多信息，见[https://tools.ietf.org/html/rfc4180。](https://tools.ietf.org/html/rfc4180)

下面的例子演示了一个字段值在逗号分隔的文件中的显示方式。

- **原始字段值。** `包含 "引号"、逗号和文本`
- **CSV文件中的字段值。** `"包含 "引号"、逗号和文本"`
- 字段值不得包含HTML标签、注释或转义序列。
- 字段或字段名之间的额外空格应被删除。许多分析器认为空格是数值的一部分，这可能导致错误。
- 每一行必须以CRLF或LF断行符结束。
- 文件应该用UTF-8编码，以支持所有Unicode字符。包括Unicode字节顺序标记（BOM）字符的文件是可以接受的。关于BOM字符和UTF-8的更多信息，见<https://unicode.org/faq/utf_bom.html#BOM>。
- 所有的数据集文件必须被压缩在一起。

## 字段定义

### agency.txt

文件：**必填**

主键`agency_id`)

| 字段名               | 类型         | 存在         | 描写                                                                                                                                                                  |
| ----------------- | ---------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `agency_id`       | 唯一的ID      | **有条件地要求** | 识别一个交通品牌，通常是交通机构的同义词。请注意，在某些情况下，例如，当一个机构经营多个独立的服务时，机构和品牌是不同的。本文件使用 "机构 "一词来代替 "品牌"。一个数据集可能包含多个机构的数据。 <br/><br/>有条件地要求。<br/>- **需要**当数据集包含多个交通机构的数据时。 <br/>- 可选的，否则。 |
| `agency_name`     | 文本         | **需要**     | 交通机构的全称。                                                                                                                                                            |
| `agency_url`      | URL        | **需要**     | 交通机构的URL。                                                                                                                                                           |
| `agency_timezone` | 时区         | **需要**     | 转运机构所在的时区。如果在数据集中指定了多个机构，每个机构必须具有相同的 `agency_timezone`.                                                                                                             |
| `agency_lang`     | language代码 | 可选         | 该运输机构使用的主要language。应该提供，以帮助GTFS消费者为数据集选择大写规则和其他language设置。                                                                                                          |
| `agency_phone`    | 电话号码       | 可选         | 指定机构的语音电话号码。这个字段是一个字符串值，表示该机构服务区的典型电话号码。它可以包含标点符号来分组号码的数字。允许使用可拨号的文本（例如，TriMet的 "503-238-RIDE"），但该字段不得包含任何其他描述性文本。                                                  |
| `agency_fare_url` | URL        | 可选         | 允许乘客在线购买该机构的车票或其他票据的网页的URL。                                                                                                                                         |
| `agency_email`    | 电子邮件       | 可选         | 由该机构的客户服务部门积极监控的电子邮件地址。这个电子邮件地址应该是一个直接的联系点，公交乘客可以在这里找到该机构的客户服务代表。                                                                                                   |

### stops.txt

文件：**必须的**

主键`stop_id`)

| 字段名                   | 类型                        | 存在        | 描写                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| --------------------- | ------------------------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `stop_id`             | 唯一的ID                     | **需要**    | 识别一个位置：站台/平台、车站、入口/出口、通用节点或上车区域（见 `location_type`). <br/><br/>多条线路可以使用相同的 `stop_id`.                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `stop_code`           | 文本                        | 可选        | 短文或一个数字，为乘客识别位置。这些代码通常用于基于电话的公交信息系统，或印在标牌上，使乘客更容易获得某一特定地点的信息。该代码 `stop_code`可能与 `stop_id`如果它是面向公众的。对于没有向乘客出示代码的地点，此栏应留空。                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `stop_name`           | 文本                        | **有条件要求** | 地点的名称。该字段 `stop_name`应与机构面向乘客的、印在时间表上的、网上公布的或标牌上的地点名称一致。对于其他语言的翻译，请使用 `translations.txt`.<br/><br/>如果该地点是一个登机区`location_type=4`)，则 `stop_name`应该包含该机构所显示的乘车区的名称。它可以是一个字母（如一些欧洲的城际铁路车站），或像 "轮椅上车区"（纽约市的地铁）或 "短途列车头"（巴黎的RER）的文字。<br/><br/>有条件地要求。<br/>- **需要**属于车站的地点(`location_type=0`)、车站(`location_type=1`)或出入口(`location_type=2`).<br/>- 对于属于一般节点的地点，可以选择(`location_type=3`)或登机区(`location_type=4`).                                                                                                                                       |
| `tts_stop_name`       | 文本                        | 可选        | 的可读版本。 `stop_name`.见 "文字转语音字段 "中的内容。 [术语定义](#term-definitions)为更多。                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `stop_desc`           | 文本                        | 可选        | 提供有用的、高质量的信息的位置描述。不应该是重复的 `stop_name`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `stop_lat`            | 纬度                        | **有条件要求** | 该地点的纬度。<br/><br/>对于站台/平台(`location_type=0`)和乘车区(`location_type=4`)，坐标必须是公交车杆的坐标--如果存在的话--否则就是乘客上车的地方（在人行道或站台上，而不是在车辆停靠的道路或轨道上）。 <br/><br/>有条件地要求。<br/>- **需要**属于站台的地点(`location_type=0`)、车站()`location_type=1`)或出入口(`location_type=2`).<br/>- 对于属于一般节点的地点，可以选择(`location_type=3`)或登机区(`location_type=4`).                                                                                                                                                                                                                                    |
| `stop_lon`            | 经度                        | **有条件要求** | 地点的经度。<br/><br/>对于站台/平台(`location_type=0`)和乘车区(`location_type=4`(如果有的话)，坐标必须是公交车杆的坐标，否则就是乘客上车的地方(在人行道或站台上，而不是在车辆停靠的道路或轨道上)的坐标。 <br/><br/>有条件地要求。<br/>- **需要**对于属于站台的地点(`location_type=0`)、车站()或出入口()。`location_type=1`)或出入口(`location_type=2`).<br/>- 对于属于一般节点的地点来说，可以选择(`location_type=3`)或登机区(`location_type=4`).                                                                                                                                                                                                                          |
| `zone_id`             | 身份证                       | **有条件要求** | 标明一个站点的票价区。如果该记录代表一个车站或车站入口，则 `zone_id`将被忽略。<br/><br/>有条件地要求。<br/>- **需要**如果提供票价信息使用 [fare_rules.txt](#fare_rulestxt) <br/>- 可选择其他方式。                                                                                                                                                                                                                                                                                                                                                                                                        |
| `stop_url`            | URL                       | 可选        | 关于该地点的网页的URL。这应该不同于 `agency.agency_url`和 `routes.route_url`字段的值。                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `location_type`       | 枚举                        | 可选        | 地点类型。有效的选项是。<br/><br/>`0`(或空白) - **车站**(或 **平台**).乘客登上或离开交通车辆的位置。当被定义为在一个平台内时，被称为平台。 `parent_station`.<br/>`1`- **车站**.一个包含一个或多个平台的物理结构或区域。<br/>`2`- **入口/出口**.乘客可以从街道上进入或离开车站的一个位置。如果一个入口/出口属于多个车站，它可以通过路径连接到两个车站，但数据提供者必须选择其中一个作为父节点。<br/>`3`- **通用节点**.车站内的一个位置，与其他任何位置不匹配。 `location_type`可以用来连接pathways.txt中定义的路径。<br/>`4` - **登机区**.站台上的一个特定位置，乘客可以在这里上车和/或下车。                                                                                                                                                                         |
| `parent_station`      | 外国ID参考 `stops.stop_id`    | **有条件要求** | 定义了不同地点之间的层次结构，这些地点定义于 `stops.txt`.它包含父位置的ID，如下所示。<br/><br/>- **停止/平台**(`location_type=0`): 该 `parent_station`字段包含一个站的ID。<br/>- **车站**(`location_type=1`): 这个字段必须是空的。<br/>- **入口/出口**(`location_type=2`) 或 **通用节点**(`location_type=3`): 的 `parent_station`字段包含一个车站的ID(`location_type=1`)<br/>- **登机区**(`location_type=4`): 该 `parent_station`字段包含一个平台的ID。<br/><br/>有条件地要求。<br/>- **需要**对于作为入口的位置(`location_type=2`)、通用节点(`location_type=3`)或登机区(`location_type=4`).<br/>- 对于车站/月台来说是可选的(`location_type=0`).<br/>- 禁止用于车站(`location_type=1`). |
| `stop_timezone`       | 时区                        | 可选        | 位置的时区。如果该地点有一个父车站，它将继承父车站的时区，而不是应用自己的时区。车站和无父车站的空 `stop_timezone`继承由 `agency.agency_timezone`.如果 `stop_timezone`提供的值，在 [stop_times.txt](#stop_timetxt)中的时间应该被输入为从午夜开始的时间，由 `agency.agency_timezone`.这保证了行程中的时间值在行程中总是增加的，不管行程中穿越了哪个时区。                                                                                                                                                                                                                                                                                                       |
| `wheelchair_boarding` | 枚举                        | 可选        | 表示轮椅是否可以从该地点上车。有效的选项是: <br/><br/>对于无家长的车站。<br/>`0`或空 - 该站没有无障碍信息。<br/>`1`- 该站的一些车辆可以让坐轮椅的乘客上车。<br/>`2`- 此站不允许轮椅上车。 <br/><br/>对于儿童站。 <br/>`0`或空 - 车站将继承其 `wheelchair_boarding`的行为，如果在父站中指定的话。<br/>`1`- 从车站外存在一些无障碍通道到特定的车站/平台。<br/>`2`- 车站外不存在通往特定车站/平台的无障碍路径。<br/><br/>对于车站的出入口。 <br/>`0`或空 - 车站入口将继承其 `wheelchair_boarding`车站入口将从父车站继承其行为，如果为父车站指定的话。<br/>`1`- 车站入口可供轮椅通行。<br/>`2`- 从车站入口到站台/平台没有无障碍通道。                                                                                                                                     |
| `level_id`            | 外国身份证参考 `levels.level_id` | 可选        | 地点的级别。同一级别可由多个未连接的车站使用。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `platform_code`       | 文本                        | 可选        | 平台站（属于一个车站的站）的平台标识符。这应该只是平台标识符（例如，"G "或 "3"）。像 "平台 "或 "轨道"（或饲料的language对应物）这样的词不应该被包括在内。这允许饲料消费者更容易将平台标识符国际化和本地化为其他语言。                                                                                                                                                                                                                                                                                                                                                                                                                       |

### routes.txt

文件：**必须的**

主键`route_id`)

| 字段名                   | 类型                         | 存在        | 描写                                                                                                                                                                                                                                                                                                                                                                                        |
| --------------------- | -------------------------- | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `route_id`            | 独特的ID                      | **需要**    | 识别一条路线。                                                                                                                                                                                                                                                                                                                                                                                   |
| `agency_id`           | 外国身份证查询 `agency.agency_id` | **有条件要求** | 指定路线的机构。<br/><br/>有条件地要求。<br/>- **需要**如果多个机构被定义在 [agency.txt](#agency). <br/>- 可选的，否则。                                                                                                                                                                                                                                                                                                    |
| `route_short_name`    | 文本                         | **有条件要求** | 路线的短名称。通常是一个简短、抽象的标识符（例如，"32"、"100X"、"绿色"），乘客用它来识别一条路线。两者都是 `route_short_name`和 `route_long_name`可能会被定义。<br/><br/>有条件地要求。<br/>- **需要**如果 `routes.route_long_name`为空。<br/>- 可选的，否则。                                                                                                                                                                                                        |
| `route_long_name`     | 文本                         | **有条件要求** | 航线的全名。这个名称通常比 `route_short_name`更具描述性，而且通常包括路线的目的地或站点。两者都是 `route_short_name`和 `route_long_name`可能被定义。<br/><br/>有条件地要求。<br/>- **需要**如果 `routes.route_short_name`是空的。<br/>- 可选的，否则。                                                                                                                                                                                                        |
| `route_desc`          | 文本                         | 可选        | 一个路线的描述，提供有用的、高质量的信息。不应该是重复的 `route_short_name`或 `route_long_name`. <hr/> *例子。"A "列车一直在曼哈顿的Inwood-207 St和皇后区的Far Rockaway-Mott Avenue之间运营。另外，从早上6点到午夜，在Inwood-207 St和Lefferts Boulevard之间还有额外的 "A "型列车运行（列车通常在Lefferts Blvd和Far Rockaway之间交替运行）。*                                                                                                                                         |
| `route_type`          | 枚举                         | **需要**    | 表示一条路线上使用的交通工具的类型。有效的选项是。 <br/><br/>`0`- 有轨电车、街车、轻轨。大都市范围内的任何轻轨或街面系统。<br/>`1`- 地铁, 地铁。大都会地区内的任何地下铁路系统。<br/>`2`- 铁路。用于城际或长途旅行。<br/>`3`- 公共汽车。用于短途和长途巴士线路。<br/>`4`- 轮渡。用于短途和长途船只服务。<br/>`5`- 有轨电车。用于街道上的轨道车，电缆在车下运行（如旧金山的缆车）。<br/>`6`- 空中电梯，悬挂式缆车（如吊船电梯、空中索道）。通过一根或多根缆绳将车厢、汽车、吊船或敞篷椅悬挂起来的缆车运输。<br/>`7`- 缆车。任何为陡峭坡度而设计的铁路系统。<br/>`11`- 无轨电车。利用电线杆从架空线上取电的电动巴士。<br/>`12`- 单轨列车。轨道由单轨或单梁组成的铁路。 |
| `route_url`           | URL                        | 可选        | 关于特定路线的网页的URL。应该与 `agency.agency_url`值。                                                                                                                                                                                                                                                                                                                                                   |
| `route_color`         | 颜色                         | 可选        | 匹配面向公众的材料的路线颜色指定。如果省略或留空，则默认为白色 (`FFFFFF`)，如果省略或留空的话。之间的色差。 `route_color`和 `route_text_color`在黑白屏幕上观看时，应提供足够的对比度。                                                                                                                                                                                                                                                                         |
| `route_text_color`    | 颜色                         | 可选        | 绘制背景为"...... "的文字时，应使用可识别的颜色。 `route_color`.默认为黑色(`000000`当省略或留空时，默认为白色( )。之间的色差。 `route_color`和 `route_text_color`在黑白屏幕上观看时，应提供足够的对比度。                                                                                                                                                                                                                                                   |
| `route_sort_order`    | 非负整数                       | 可选        | 以适合向客户展示的方式来订购路线。价值较小的路线 `route_sort_order`的路线应该先显示。                                                                                                                                                                                                                                                                                                                                      |
| `continuous_pickup`   | 枚举                         | 可选        | 表示乘客可以在车辆行驶路线上的任何一点登上公交车辆，如图所示。 `shapes.txt`表示乘客可以在该路线的每一个行程中，在车辆行驶路线的任何一点上车。有效的选项是。 <br/><br/>`0`- 连续停车接人。 <br/>`1`或空--不连续停车接人。 <br/>`2`- 必须打电话给代理机构安排连续停车接人。 <br/>`3`- 必须与司机协调，安排连续停车接人。  <br/><br/>价值 `routes.continuous_pickup`的值可以通过定义以下内容而被覆盖 `stop_times.continuous_pickup`为特定的 `stop_time`的值，可以覆盖。                                                                                |
| `continuous_drop_off` | 枚举                         | 可选        | 表示乘客可以在车辆行驶路线上的任何一点下车，如图所示。 `shapes.txt`在路线的每一个行程中，都是如此。有效的选项是。 <br/><br/>`0`- 连续停车下车。 <br/>`1`或空--没有连续停车的下车点。 <br/>`2`- 必须打电话给机构，安排连续停车下车。 <br/>`3`- 必须与司机协调，安排连续停车下车。 <br/><br/>的值 `routes.continuous_drop_off`中定义的值，可以覆盖。 `stop_times.continuous_drop_off`特定的 `stop_time`沿着路线的人。                                                                                                       |
| `network_id`          | 身份证                        | 可选        | 标明一组路线。中的多个行 [routes.txt](#routestxt)可能有相同的 `network_id`.                                                                                                                                                                                                                                                                                                                                 |

### trips.txt

文件：**必须**的

主键`trip_id`)

| 字段名                     | 类型                                                         | 存在        | 描述                                                                                                                                                                                                                                                                                                                                             |
| ----------------------- | ---------------------------------------------------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `route_id`              | 外国身份证查询 `routes.route_id`                                  | **需要**    | 确定一条路线。                                                                                                                                                                                                                                                                                                                                        |
| `service_id`            | 外国身份证查询 `calendar.service_id`或 `calendar_dates.service_id` | **需要**    | 识别一组日期，当一个或多个路线的服务可用时。                                                                                                                                                                                                                                                                                                                         |
| `trip_id`               | 独特的ID                                                      | **需要**    | 识别一个行程。                                                                                                                                                                                                                                                                                                                                        |
| `trip_headsign`         | 文本                                                         | 可选        | 出现在标志牌上的文字，向乘客说明该行程的目的地。应该用来区分同一路线上的不同服务模式。<br/><br/>如果标牌在一个行程中改变了，那么沿途的数值就会改变。 `trip_headsign`中定义的值可以被覆盖。 `stop_times.stop_headsign`的值来覆盖。 `stop_time`的值。                                                                                                                                                                                     |
| `trip_short_name`       | 文本                                                         | 可选        | 面向公众的文本用于向乘客识别行程，例如，识别通勤铁路行程的列车号码。如果乘客不经常依赖车次名称。 `trip_short_name`应该是空的。A `trip_short_name`值，如果提供的话，应该在一个服务日内唯一地识别一个行程；它不应该用于目的地名称或有限/快速的指定。                                                                                                                                                                                                   |
| `direction_id`          | 枚举                                                         | 可选        | 表示一个行程的方向。这个字段不应该用在路线选择上；它提供了一种方法，在发布时间表时按方向区分行程。有效的选项是。 <br/><br/>`0`- 朝一个方向行驶（例如，出站）。<br/>`1`- 相反方向的旅行（例如，进站旅行）。<hr/>*例子。解释 `trip_headsign`和 `direction_id`字段可以一起使用，为一组旅行的每个方向的旅行指定一个名称。A [trips.txt](#tripstxt)文件可以包含这些记录，以便在时间表中使用。* <br/> `trip_id,...,trip_headsign,direction_id` <br/> `1234,...,Airport,0` <br/> `1505,...,Downtown,1` |
| `block_id`              | 身份证                                                        | 可选        | 标识行程所属的区块。一个区段包括一个单一的行程或许多使用同一车辆的连续行程，由共同的服务日定义，也可以有不同服务日的行程。 `block_id`.A `block_id`可能有不同服务日的旅程，构成不同的区段。请看 [下面的例子](#example-blocks-and-service-day)                                                                                                                                                                                           |
| `shape_id`              | 国外ID参考 `shapes.shape_id`                                   | **有条件要求** | 标识一个地理空间形状，描述一个行程的车辆行驶路径。 <br/><br/>有条件的要求。 <br/>- **需要**如果该行程有一个连续的上车或下车的行为，在 `routes.txt`或在 `stop_times.txt`. <br/>- 可选的，否则。                                                                                                                                                                                                                 |
| `wheelchair_accessible` | 枚举                                                         | 可选        | 表示轮椅的可及性。有效的选项是:<br/><br/>`0`或空 - 该行程没有无障碍信息。<br/>`1`- 在这个特定行程中使用的车辆可以容纳至少一个坐轮椅的乘客。<br/>`2`- 此行程中不能容纳任何坐轮椅的乘客。                                                                                                                                                                                                                                 |
| `bikes_allowed`         | 枚举                                                         | 可选        | 表示是否允许骑自行车。有效的选项是。<br/><br/>`0`或空 - 该行程没有自行车的信息。<br/>`1`- 在这个特定行程中使用的车辆可以容纳至少一辆自行车。<br/>`2`- 此行程不允许使用自行车。                                                                                                                                                                                                                                      |

#### 例子。区块和服务日

下面的例子是有效的，一周内每天都有不同的区间。

| route_id | trip_id | service_id                  | block_id    | <span style="font-weight:normal"/>*(第一站时间)*</span> | <span style="font-weight:normal"/>*(最后一站时间)*</span> |
| -------- | ------- | --------------------------- | ----------- | -------------------------------------------------- | --------------------------------------------------- |
| 红色       | 旅程_1    | 星期一-星期二-星期三-星期四-星期五-星期六-星期日 | 红圈（Red_loop | 22:00:00                                           | 22:55:00                                            |
| 红色       | 旅程_2    | 周五-周六-周日                    | 红环          | 23:00:00                                           | 23:55:00                                            |
| 红色       | 行程_3    | 星期五-星期六                     | 红环          | 24:00:00                                           | 24:55:00                                            |
| 红色       | 行程_4    | 星期一-星期二-星期三                 | 红_环         | 20:00:00                                           | 20:50:00                                            |
| 红色       | 行程_5    | 星期一-星期二-星期三                 | 红_环         | 21:00:00                                           | 21:50:00                                            |

上表中的说明。

- 以周五到周六上午为例，一辆车运行`一趟_1`，`一趟_2`和`一趟_3`（晚上10:00到凌晨12:55）。请注意，最后一个行程发生在星期六，凌晨12:00到12:55，但属于星期五的 "服务日"，因为时间是24:00:00到24:55:00。
- 在周一、周二、周三和周四，一辆车在晚上8:00到10:55的区间内运营`行程_1`、`行程_4`和`行程_5`。

### stop_times.txt

文件：**必须的**

主键`trip_id`,`stop_sequence`)

| 字段名                   | 类型                     | 存在        | 描述                                                                                                                                                                                                                                                                                                                                                                                                                     |   |
| --------------------- | ---------------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | - |
| `trip_id`             | 国外ID参考 `trips.trip_id` | **需要**    | 识别一个行程。                                                                                                                                                                                                                                                                                                                                                                                                                |   |
| `arrival_time`        | 时间                     | **有条件要求** | 到达车站的时间（由 `stop_times.stop_id`)的到达车站时间(定义为 `stop_times.trip_id`). <br/><br/>如果在一个站没有单独的到达和离开时间。 `arrival_time`和 `departure_time`应该是一样的。 <br/><br/>对于发生在服务日午夜之后的时间，请输入大于24:00:00的时间，以Schedule开始的那一天的当地时间HH:MM:SS计算。<br/><br/>如果准确的到达和离开时间(`timepoint=1`或空）不可用，则估计或插值的到达和离开时间(`timepoint=0`)应提供。<br/><br/>有条件地要求。<br/>- **需要**旅程中第一和最后一站的时间（定义为 `stop_times.stop_sequence`). <br/>- **需要**为 `timepoint=1`.<br/>- 可选的，否则。 |   |
| `departure_time`      | 时间                     | **有条件要求** | 从该站出发的时间（定义为 `stop_times.stop_id`定义的）为一个特定的行程（定义为 `stop_times.trip_id`).<br/><br/>如果某站没有单独的到达和离开时间。 `arrival_time`和 `departure_time`应该是一样的。 <br/><br/>对于发生在服务日午夜之后的时间，在Schedule开始的那一天输入大于24:00:00的HH:MM:SS当地时间的值。<br/><br/>如果没有准确的到达和离开时间(`timepoint=1`或空的），应提供估计或内插的到达和离开时间(`timepoint=0`应提供（）。<br/><br/>有条件地要求。<br/>- **需要**为 `timepoint=1`.<br/>- 可选的，否则。                                                           |   |
| `stop_id`             | 国外ID参考 `stops.stop_id` | **需要**    | 标明被服务的站点。旅程中所有被服务的站点都必须有一个记录。 [stop_times.txt](#stop_timestxt).参考的地点必须是站台/平台，即它们的 `stops.location_type`值必须是 `0`或空的。在同一旅程中，一个站可以被服务多次，多个旅程和路线可以服务同一个站。                                                                                                                                                                                                                                                                  |   |
| `stop_sequence`       | 非负整数                   | **需要**    | 一个特定行程的站点顺序。这些值必须沿行程增加，但不需要连续。<hr/>*例如。旅程中的第一个地点可以有一个 `stop_sequence`=`1`，行程中的第二个地点可以有一个 `stop_sequence`=`23`，第三个地点可以有一个 `stop_sequence`=`40`，以此类推。*                                                                                                                                                                                                                                                                   |   |
| `stop_headsign`       | 文本                     | 可选        | 出现在标牌上的文字，向乘客说明行程的目的地。这个字段覆盖了默认的 `trips.trip_headsign`当车头标志在各站之间改变时，这个字段将取代默认的.如果车头标志在整个行程中都被显示。 `trips.trip_headsign`应该被用来代替。 <br/><br/>  A `stop_headsign`值指定为一个 `stop_time`的值不适用于同一行程中的后续 `stop_time`在同一旅程中.如果你想覆盖 `trip_headsign`为多个 `stop_time`在同一旅程中，如果你想覆盖 `stop_headsign`值必须在每个行程中重复. `stop_time`行。                                                                                                            |   |
| `pickup_type`         | 枚举                     | 可选        | 表示接载方式。有效的选项是:<br/><br/>`0`或空 - 定期安排接机。 <br/>`1`- 不提供接机服务。<br/>`2`- 必须打电话给代理公司安排接人。<br/>`3`- 必须与司机协调安排提货。                                                                                                                                                                                                                                                                                                              |   |
| `drop_off_type`       | 枚举                     | 可选        | 表示下车方式。有效选项是。<br/><br/>`0`或空车 - 定期送车。<br/>`1`- 不提供下车服务。<br/>`2`- 必须打电话给中介公司安排送车。<br/>`3`- 必须与司机协调安排下车。                                                                                                                                                                                                                                                                                                                 |   |
| `continuous_pickup`   | 枚举                     | 可选        | 表示乘客可以在车辆行驶路线上的任何一点登上公交车，如图所示。 `shapes.txt`从这里开始 `stop_time`到下一个 `stop_time`在行程的 `stop_sequence`.有效的选项是: <br/><br/>`0`- 连续停车取货。 <br/>`1`或空--没有连续停车接人。 <br/>`2`- 必须打电话给代理公司安排连续停车接人。 <br/>`3`- 必须与司机协调，安排连续停车接人。  <br/><br/>如果这个字段被填入，它将覆盖任何定义在 `routes.txt`.如果这个字段为空，. `stop_time`继承.NET中定义的任何连续拾取行为。 `routes.txt`.                                                                                                    |   |
| `continuous_drop_off` | 枚举                     | 可选        | 表示乘客可以在车辆行驶路线上的任何一点下车，如图所示。 `shapes.txt`从这个 `stop_time`到下一个 `stop_time`在行程中的 `stop_sequence`.有效的选项是： 。 <br/><br/>`0`- 连续停车下车。 <br/>`1`或空车--没有连续停车下车。 <br/>`2`- 必须打电话给代理机构安排连续停车下车。 <br/>`3`- 必须与司机协调，安排连续停车下车。 <br/><br/>如果该字段被填入，它将覆盖任何定义在.NET中的连续放行行为。 `routes.txt`.如果这个字段是空的，. `stop_time`继承定义在.NET中的任何连续投放行为。 `routes.txt`.                                                                                        |   |
| `shape_dist_traveled` | 非负数的浮点数                | 可选        | 沿着相关的形状，从第一站到这个记录中指定的站的实际行走距离。这个字段指定了在一个行程中任何两站之间要画多少形状。必须是在 [shapes.txt](#shapestxt).用于. `shape_dist_traveled`的值必须与...一起增加。 `stop_sequence`增加；它们不能用于显示路线上的反向旅行。<hr/>*例子。如果一辆公共汽车从起点到终点的距离是5.25公里。`shape_dist_traveled`=`5.25`.*                                                                                                                                                                                       |   |
| `timepoint`           | 枚举                     | 可选        | 表示车辆是否严格遵守某站的到达和离开时间，或者它们是近似的和/或插值的时间。这个字段允许GTFS生产者提供内插的停车时间，同时表明该时间是近似的。有效的选项是。<br/><br/>`0`- 时间被认为是近似的。<br/>`1`或空 - 时间被认为是精确的。                                                                                                                                                                                                                                                                                       |   |

### calendar.txt

文件：**有条件地要求**

主键`service_id`)

| 字段名          | 类型    | 存在     | 描述                                                                                                                                                                                                          |
| ------------ | ----- | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `service_id` | 独特的ID | **需要** | 识别一组日期，当一个或多个路线的服务可用时。每个 `service_id`值必须是唯一的，在一个 [calendar.txt](#calendartxt)文件。                                                                                                                            |
| `monday`     | 枚举    | **需要** | 表示该服务是否在由字段指定的日期范围内的所有周一运行。 `start_date`和 `end_date`字段所指定的日期范围内的所有星期一提供服务。请注意，特定日期的例外情况可能会被列在 [calendar_dates.txt](#calendar_datestxt).有效的选项是： 。<br/><br/>`1`- 服务对日期范围内的所有星期一都可用。<br/>`0`- 在日期范围内的星期一不提供服务。 |
| `tuesday`    | 枚举    | **需要** | 职能同于 `monday`除了适用于星期二                                                                                                                                                                                       |
| `wednesday`  | 枚举    | **需要** | 职能同于 `monday`除外适用于星期三                                                                                                                                                                                       |
| `thursday`   | 枚举    | **需要** | 职能与 `monday`除外适用于星期四                                                                                                                                                                                        |
| `friday`     | 枚举    | **需要** | 职能，与 `monday`除适用于星期五外                                                                                                                                                                                       |
| `saturday`   | 枚举    | **需要** | 职能与 `monday`除外适用于星期六。                                                                                                                                                                                       |
| `sunday`     | 枚举    | **需要** | 职能 `monday`除了适用于星期日。                                                                                                                                                                                        |
| `start_date` | 日期    | **需要** | 服务区间的开始服务日。                                                                                                                                                                                                 |
| `end_date`   | 日期    | **需要** | 服务区间的结束服务日。这个服务日包括在间隔时间内。                                                                                                                                                                                   |

### calendar_dates.txt

文件：**有条件**地要求

主键`service_id`,`date`）。

[calendar_dates.txt](#calendar_datestxt)表明确地按日期激活或禁用服务。它可以用两种方式使用。

- 推荐使用。将calendar[calendar_dates.txt](#calendar_datestxt).txt与[calendar.txt](#calendartxt)结合使用，以定义[calendar.txt](#calendartxt)中定义的默认服务模式的例外情况。如果服务通常是定期的，只是在明确的日期有一些变化（例如，为了适应特殊事件的服务，或学校的Schedule），这是一个好的方法。在这种情况下，`calendar_dates.service_id`是一个引用`calendar.service_id`的外来ID。
- 备选。省略[calendar.txt](#calendartxt)，并在[calendar_dates.txt](#calendardatestxt)中指定每个服务日期。这允许相当大的服务变化，并适应没有正常周计划的服务。在这种情况下，`service_id`是一个ID。

| 字段名              | 类型                              | 存在     | 描述                                                                                                                                                                                                                                                                                                                                                               |
| ---------------- | ------------------------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `service_id`     | 国外ID参考 `calendar.service_id`或ID | **需要** | 标识一组日期，当一条或多条路线发生服务异常时。每个(`service_id`, `date`)对只能出现一次在 [calendar_dates.txt](#calendar_datestxt)如果使用 [calendar.txt](#calendartxt)和 [calendar_dates.txt](#calendar_datestxt)连用。如果一个 `service_id`值同时出现在 [calendar.txt](#calendartxt)和 [calendar_dates.txt](#calendar_datestxt)中的信息，则 [calendar_dates.txt](#calendardatestxt)中的信息会修改在 [calendar.txt](#calendartxt). |
| `date`           | 日期                              | **需要** | 服务异常发生的日期。                                                                                                                                                                                                                                                                                                                                                       |
| `exception_type` | 枚举                              | **需要** | 表示在日期字段中指定的日期，服务是否可用。有效的选项是。<br/><br/> `1`- 在指定的日期，服务已被添加。<br/>`2`- 在指定的日期，服务已被删除。<hr/>*例子。假设一条路线在假日有一组车次，而另一组车次在所有其他日子都有。一个 `service_id`可以对应于正常服务Schedule，另一个 `service_id`可以对应于假日Schedule。对于一个特定的假日，该 [calendar_dates.txt](#calendar_datestxt)文件可以用来将假日添加到假日时间表中。 `service_id`并从常规服务中删除该假日。 `service_id`Schedule。*                                              |

### fare_attributes.txt

文件：**可选**

主键`fare_id`)

**版本**<br/>有两种描述票价的建模选项。GTFS V1是用于描述最小票价信息的传统选项。GTFS V2是一种更新的方法，允许对机构的票价结构进行更详细的描述。两种方法都允许出现在一个数据集中，但对于一个给定的数据集，数据消费者只应使用一种方法。建议GTFS V2 优先于GTFS V1。<br/><br/>与GTFS V1相关的文件是。<br/>-[fare_attributes.txt](#fare_attributestxt)<br/>-[fare_rules.txt](#fare_rulestxt)<br/><br/>与GTFS V2相关的文件有：<br/>- [fare_media.txt](#fare_mediatxt)<br>-[fare_products.txt](#fare_productstxt)<br/>-[fare_leg_rules.txt](#fare_leg_rulestxt)<br/>-[fare_transfer_rules.txt](#fare_transfer_rulestxt)

<br/>

| 字段名                 | 类型                        | 存在        | 描述                                                                                                  |
| ------------------- | ------------------------- | --------- | --------------------------------------------------------------------------------------------------- |
| `fare_id`           | 独特的ID                     | **需要**    | 识别一个票价等级。                                                                                           |
| `price`             | 非负数浮点数                    | **需要**    | 票价，单位为 `currency_type`.                                                                             |
| `currency_type`     | 货币代码                      | **需要**    | 用来支付票价的货币。                                                                                          |
| `payment_method`    | 枚举                        | **需要**    | 表示何时必须支付票价。有效选项是。<br/><br/>`0`- 车费在船上支付。<br/>`1`- 车费必须在登机前支付。                                       |
| `transfers`         | 枚举                        | **需要**    | 表示该票价允许的换乘次数。有效的选项是。<br/><br/>`0`- 此票价不允许转车。<br/>`1`- 乘客可以转车一次。<br/>`2`- 乘客可以转车两次。<br/>空 - 允许无限次转车。 |
| `agency_id`         | 国外ID参考 `agency.agency_id` | **有条件要求** | 标明票价的相关机构。 <br/><br/>有条件地要求。<br/>- **需要**中定义了多个机构，则 `agency.txt`.<br/>- 可选的其他方式。                    |
| `transfer_duration` | 非负整数                      | 可选        | 转车到期前的时间长度（秒）。当 `transfers`=`0`这个字段可以用来表示车票的有效期，也可以留空。                                              |

### fare_rules.txt

文件：**可选的**

主键`(*`)

[fare_rules.txt](#farerulestxt)表指定了[fare_attributes.txt](#fare_attributestxt)中的票价如何适用于一个行程表。大多数票价结构使用以下规则的某种组合。

- 票价取决于出发地或目的地车站。
- 票价取决于行程中经过的区域。
- 票价取决于行程中使用的路线。

关于演示如何用[fare_rules.txt](#farerulestxt)和[fare_attributes.txt](#fareattributestxt) 指定票价结构的例子，见 GoogleTransitDataFeed 开源项目 wiki 中的[FareExamples](https://web.archive.org/web/20111207224351/https://code.google.com/p/googletransitdatafeed/wiki/FareExamples)。

| 字段名              | 类型                               | 存在     | 描述                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ---------------- | -------------------------------- | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fare_id`        | 国外ID参考 `fare_attributes.fare_id` | **需要** | 识别一个票价等级。                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `route_id`       | 国外ID参考 `routes.route_id`         | 可选     | 标明与票价等级相关的路线。如果有几条具有相同票价属性的路线存在，在文件中创建一条记录。 [fare_rules.txt](#fare_rules.txt)每条路线的车次。<hr/>*例子。如果票价等级 "b "在路线 "TSW "和 "TSE "上有效，则 [fare_rules.txt](#fare_rules.txt)文件将包含这些票价等级的记录。* <br/> `  fare_id,route_id `<br/>`b,TSW` <br/> `b,TSE`                                                                                                                                                                                      |
| `origin_id`      | 国外ID参考 `stops.zone_id`           | 可选     | 确定一个起始区。如果一个票价等级有多个起始区，在文件中创建一条记录。 [fare_rules.txt](#fare_rules.txt)对于每个 `origin_id`.<hr/>*例子。如果票价等级 "b "对所有从 "2 "区或 "8 "区出发的旅行都有效，则 [fare_rules.txt](#fare_rules.txt)文件将包含这些票价等级的记录。* <br/> `fare_id,...,origin_id` <br/> `b,...,2`  <br/> `b,...,8`                                                                                                                                                                         |
| `destination_id` | 国外ID参考 `stops.zone_id`           | 可选     | 确定一个目的地区域。如果一个票价类别有多个目的地区域，则在 "目的地区域 "中创建一条记录。 [fare_rules.txt](#fare_rules.txt)每一个 `destination_id`.<hr/>*例子。的 `origin_id`和 `destination_id`字段可以一起用于指定票价等级 "b "对3区和4区之间的旅行有效，而对3区和5区之间的旅行有效。 [fare_rules.txt](#fare_rules.txt)文件将包含这些票价等级的记录。* <br/>`fare_id,...,origin_id,destination_id` <br/>`b,...,3,4`<br/> `b,...,3,5`                                                                                                 |
| `contains_id`    | 国外ID参考 `stops.zone_id`           | 可选     | 识别乘客在使用特定票价等级时将进入的区域。在一些系统中用于计算正确的票价等级。 <hr/>*例子。如果票价等级 "c "与经过5区、6区和7区的GRT线路上的所有旅行相关联，则 [fare_rules.txt](#fare_rules.txt)将包含这些记录。* <br/> `fare_id,route_id,...,contains_id` <br/>  `c,GRT,...,5` <br/>`c,GRT,...,6` <br/>`c,GRT,...,7` <br/> *因为所有的 `contains_id`如果一个行程经过5区和6区，但没有经过7区，就不会有 "c "类票价，必须与区间相匹配，才能适用该票价。更多细节，见 <https://code.google.com/p/googletransitdatafeed/wiki/FareExamples>在GoogleTransitDataFeed项目维基中。* |

### fare_media.txt

文件：**可选的**

主键 (`fare_media_id`)

描述可用于使用票价产品的不同票价媒介。票价媒体是用于表示和/或验证票价产品的物理或虚拟载体。

| 字段名               | 类型    | 存在性    | 描述                                                                                                                                                                                                                   |
| ----------------- | ----- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `fare_media_id`   | 唯一的id | **需要** | 识别一个票价媒体。                                                                                                                                                                                                            |
| `fare_media_name` | 文本    | 可选     | 票价媒介的名称。<br/><br/>对于交通卡(`fare_media_type =2`)或移动应用程序(`fare_media_type =4`)，应包括 `fare_media_name`应包括在内，并应与提供这些媒体的组织所使用的面向乘客的名称一致。                                                                                     |
| `fare_media_type` | enum  | **需要** | 票价媒体的类型。有效的选项是。<br/><br/>`0`- 无。  当在购买或验证票价产品时没有涉及票价媒介时使用，例如向司机或售票员支付现金，没有提供实体票。<br/>`2`- 有存储车票、通行证或货币价值的实体交通卡。<br/>`3`- cEMV（非接触式Europay、Mastercard和Visa），作为基于账户的票务的开放环路代币容器。<br/>`4`- 储存有虚拟交通卡、车票、通行证或货币价值的移动应用程序。 |


### fare_products.txt

文件：**可选**

主键(`fare_product_id`, `fare_media_id`)

描述乘客可以购买的不同类型的车票或票价。

| 字段名                 | 类型   | 存在     | 描述                                    |
| ------------------- | ---- | ------ | ------------------------------------- |
| `fare_product_id`   | 身份证  | **需要** | 识别一个票价产品。                             |
| `fare_product_name` | 文本   | 可选     | 显示给乘客的票价产品的名称。                        |
| `fare_media_id` | 国外ID参考 `fare_media.fare_media_id` | 文本  | 标识一个票价媒体，可以用来在旅行中使用票价产品。当`fare_media_id`为空的 时，认为该票价媒体是未知。|
| `amount`            | 货币金额 | **需要** | 票价产品的成本。可以是负数，代表换乘折扣。可以是零，代表票价产品是免费的。 |
| `currency`          | 货币代码 | **需要** | 票价产品成本的货币。                            |

### fare_leg_rules.txt

文件：**可**选

主键`network_id,from_area_id,to_area_id,fare_product_id`)

单个航段的票价规则。

必须通过过滤文件中的所有记录来查询fare[`fare_leg_rules.txt`](#fare_leg_rulestxt)中的票价，以找到与乘客要乘坐的腿相匹配的规则。

为了处理一个腿的成本。

1. 文件`fare_leg_rules.txt`必须通过定义旅行特征的字段进行过滤，这些字段是。
   - `fare_leg_rules.network_id`
   - `fare_leg_rules.from_area_id`
   - `fare_leg_rules.to_area_id`<br/>

<br/>

2. 如果腿部与基于旅行特征的`fare_leg_rules.txt`中的记录完全匹配，则必须对该记录进行处理，以确定该腿的费用。
3. 如果没有找到完全匹配的记录，则必须检查`fever_leg_rules`.`network_id`、fever\_`leg_rules.from_area_id`和`fever_leg_rules`.`to_area_id`中的空项，以处理该段费用。
   - 如果`票价规则`中的条目为空，则对应于`routes.txt`中定义的所有网络，不包括`票价规则`中列出的`network_id` `network_id`。
   - fare_leg\_`rules中的一个空条目。from_area_id`对应于`areas.are`a`area_id`中定义的所有区域，不包括在`fever_leg_rules中列出的区域。from_area_id`
   - `to_area_id` `to_area_id`area_id 对应于所有地区中定义的`area_id` `area_id`。<br/>

<br/>

4. 如果腿部不符合上述的任何规则，那么票价是未知的。

<br/>

| 字段名               | 类型                                     | 存在     | 描述                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ----------------- | -------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `leg_group_id`    | 身份证                                    | 可选     | 识别了《》中的一组条目。 [fare_leg_rules.txt](#fare_leg_rulestxt).<br/><br/>中的一组条目，用于描述各地区之间的票价转换规则。 `fare_transfer_rules.from_leg_group_id`和 `fare_transfer_rules.to_leg_group_id`.<br/><br/>中的多个条目可能属于同一个 [fare_leg_rules.txt](#fare_leg_rulestxt)中的多个条目可能属于同一个 `fare_leg_rules.leg_group_id`.<br/><br/>中的同一条目。 [fare_leg_rules.txt](#fare_leg_rulestxt)(不包括 `fare_leg_rules.leg_group_id`)中，不得属于多个 `fare_leg_rules.leg_group_id`. |
| `network_id`      | 国外ID参考 `routes.network_id`             | 可选     | 标明适用于票价段规则的航线网络。<br/><br/>如果没有匹配的 `fare_leg_rules.network_id`价值到 `network_id`被过滤的，空的 `fare_leg_rules.network_id`将被默认匹配。<br/><br/>中的一个空条目 `fare_leg_rules.network_id`中的一个空条目，对应于所有定义在 `routes.txt`中定义的所有网络，但不包括在 `fare_leg_rules.network_id`                                                                                                                                                                              |
| `from_area_id`    | 国外ID参考 `areas.area_id`                 | 可选     | 确定一个出发区域。<br/><br/>如果没有匹配的 `fare_leg_rules.from_area_id`的值。 `area_id`被过滤的，空的 `fare_leg_rules.from_area_id`将被默认匹配。 <br/><br/>中的一个空条目。 `fare_leg_rules.from_area_id`对应于《联合国宪章》规定的所有领域 `areas.area_id`下所列的网络。 `fare_leg_rules.from_area_id`                                                                                                                                                                                 |
| `to_area_id`      | 国外ID参考 `areas.area_id`                 | 可选     | 确定一个到达区域。<br/><br/>如果没有匹配的 `fare_leg_rules.to_area_id`的值。 `area_id`被过滤的，空的 `fare_leg_rules.to_area_id`将被默认匹配。<br/><br/>中的一个空条目。 `fare_leg_rules.to_area_id`中定义的所有地区。 `areas.area_id`中所列的网络。 `fare_leg_rules.to_area_id`                                                                                                                                                                                                  |
| `fare_product_id` | 国外ID参考 `fare_products.fare_product_id` | **需要** | 乘坐该航段所需的票价产品。                                                                                                                                                                                                                                                                                                                                                                                                            |

### fare_transfer_rules.txt

文件:**可**选

主键`from_leg_group_id,to_leg_group_id,fare_product_id,transfer_count,duration_limit`)

[`fare_leg_rules.txt`](#fare_leg_rulestxt)中定义的旅行腿之间的换乘的票价规则。

为了处理多段旅程的费用。

1. 应根据骑手的行程，为所有单独的旅行腿确定在`fare_leg_rules.txt`中定义的适用票价腿组。

2. `fare_transfer_rules.txt`文件必须通过定义转车特征的字段进行过滤，这些字段是：。
   - `fare_transfer_rules.from_leg_group_id`
   - `票价转让规则。`<br/>
   <br/>

3. 如果根据转车的特点，转车与fever`fare_transfer_rules.txt`中的记录完全匹配，那么必须处理该记录以确定转车费用。

4. 如果没有找到完全匹配的记录，那么必须检查`from_leg_group_id`或`to_leg_group_id`中的空条目来处理转乘费用。
   - `fare_transfer_rules.from_leg_group_id`中的一个空条目对应的是在`fare_leg_rules.leg_group_id`中定义的所有腿组，不包括在`fare_transfer_rules`.`from_leg_group_id`中所列的腿组。
   - `to_leg_group_id`对应于在 fare\_`leg_rules.leg_group_id`下定义的所有腿组，不包括在`fare_transfer_rules 下列出的腿组。to_leg_group_id`<br/>
   <br/>

5. 如果转机不符合上述任何规则，那么就没有转机安排，腿被认为是独立的。

<br/>

| 字段名                   | 类型                                     | 存在         | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| --------------------- | -------------------------------------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `from_leg_group_id`   | 国外ID参考 `fare_leg_rules.leg_group_id`   | 可选         | 表明一组转机前的票价腿部规则。<br/><br/>如果没有匹配的 `fare_transfer_rules.from_leg_group_id`的值。 `leg_group_id`被过滤的，空的 `fare_transfer_rules.from_leg_group_id`默认情况下将被匹配。 <br/><br/>中的一个空条目。 `fare_transfer_rules.from_leg_group_id`对应于票价规则下定义的所有腿组。 `fare_leg_rules.leg_group_id`不包括以下所列的网络 `fare_transfer_rules.from_leg_group_id`                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `to_leg_group_id`     | 国外ID参考 `fare_leg_rules.leg_group_id`   | 可选         | 标识一组转乘后的票价腿部规则。<br/><br/>如果没有匹配的 `fare_transfer_rules.to_leg_group_id`的值，那么 `leg_group_id`被过滤的，空的 `fare_transfer_rules.to_leg_group_id`将被默认匹配。<br/><br/>中的一个空条目。 `fare_transfer_rules.to_leg_group_id`对应于票价规则下定义的所有腿组。 `fare_leg_rules.leg_group_id`不包括以下所列举的 `fare_transfer_rules.to_leg_group_id`                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `transfer_count`      | 非零整数                                   | **有条件地禁止** | 定义转乘规则可适用于多少次连续转乘。<br/><br/>有效选项是：:<br/>`-1`- 没有限制。<br/>`1`或更多 - 定义了转乘规则可以跨越多少次转乘。<br/><br/>如果一个子行程匹配多个不同的记录 `transfer_count`的记录，那么最小的规则是 `transfer_count`大于或等于该子旅程的当前转移次数的规则将被选择。<br/><br/>有条件地禁止。<br/>- **禁用**如果 `fare_transfer_rules.from_leg_group_id`不等于 `fare_transfer_rules.to_leg_group_id`.<br/>- **需要**如果 `fare_transfer_rules.from_leg_group_id`等于 `fare_transfer_rules.to_leg_group_id`.                                                                                                                                                                                                                                                                                                                                          |
| `duration_limit`      | 正整数                                    | 可选         | 定义了传输的持续时间限制。<br/><br/>必须以秒的整数增量表示。<br/><br/>如果没有持续时间限制。 `fare_transfer_rules.duration_limit`必须是空的。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `duration_limit_type` | 枚举                                     | **有条件要求**  | 定义了在当前航段的出发票价验证到第二航段票价验证之间的相对起点和终点。 `fare_transfer_rules.duration_limit`.<br/><br/>有效选项是:<br/>`0`- 在当前航段的出发票价验证和下一航段的到达票价验证之间。<br/>`1`- 在当前航段的出发票价确认和下一航段的出发票价确认之间。<br/>`2`- 在本段到达票价确认和下一段出发票价确认之间。<br/>`3`- 在当前航段的到达票价确认和下一航段的到达票价确认之间。<br/><br/>有条件地要求。<br/>- **需要**如果 `fare_transfer_rules.duration_limit`已定义。<br/>- **禁用**如果 `fare_transfer_rules.duration_limit`是空的。                                                                                                                                                                                                                                                                                                                                                                     |
| `fare_transfer_type`  | 枚举                                     | **需要**     | 表示旅程中各段之间转车的费用处理方式。 <br/>![](../assets/2-leg.svg) <br/>有效的选项是：。<br/>`0`- 从-腿 `fare_leg_rules.fare_product_id`加 `fare_transfer_rules.fare_product_id`；A + AB。<br/>`1`- 从-腿 `fare_leg_rules.fare_product_id`加 `fare_transfer_rules.fare_product_id`加到-腿 `fare_leg_rules.fare_product_id`;A + AB + B。<br/>`2` - `fare_transfer_rules.fare_product_id`;AB。 <br/><br/>成本处理在一个旅程中的多个转移之间的相互作用。<br/>![](../assets/3-leg.svg)<br/><table/><thead/><tr/><th/>`fare_transfer_type`</th><th/>处理A > B</th><th/>处理B > C</th></tr></thead><tbody/><tr/><td/>`0`</td><td/>A + AB</td><td/>S + BC</td></tr><tr/><td/>`1`</td><td/>A + AB +B</td><td/>S + BC + C</td></tr><tr/><td/>`2`</td><td/>AB</td><td/>S + BC</td></tr></tbody></table>其中S表示前段和换乘的总处理费用。 |
| `fare_product_id`     | 国外ID参考 `fare_products.fare_product_id` | 可选         | 在两个票价段之间转车所需的票价产品。如果为空，则转乘规则的成本为0。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

### areas.txt

文件:**可**选

主键`area_id`)

定义了区域标识符。

| 字段名         | 类型    | 存在     | 描述                                      |
| ----------- | ----- | ------ | --------------------------------------- |
| `area_id`   | 独特的ID | **需要** | 识别一个地区。必须是唯一的，在 [areas.txt](#areastxt). |
| `area_name` | 文本    | **可选** | 显示给骑手的区域名称。                             |

### stop_areas.txt

文件:**可**选

主键`(`\*)

将[stops.txt](#stopstxt)中的站点分配给区域。

| 字段名       | 类型                     | 存在     | 描述                                                                                                                                                           |
| --------- | ---------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `area_id` | 国外ID参考 `areas.area_id` | **需要** | 识别一个或多个地区的 `stop_id`属于的区域。同一 `stop_id`可以定义在许多 `area_id`s.                                                                                                    |
| `stop_id` | 国外ID参考 `stops.stop_id` | **需要** | 识别一个站点。如果一个车站（即一个带有 `stops.location_type=1`)被定义在这个字段中，则假定它的所有站台（即所有以 `stops.location_type=0`该站被定义为 `stops.parent_station`)都是同一区域的一部分。这种行为可以通过将平台分配给其他区域而被覆盖。 |

### shapes.txt

文件:**可**选

主键`shape_id`,`shape_pt_sequence`）。

形状描述了车辆沿着路线排列行驶的路径，并在shapes.txt文件中定义。形状与Trips相关，由车辆依次经过的点的序列组成。形状不需要准确地截取站点的位置，但是一个行程中的所有站点应该位于该行程形状的一小段距离内，即靠近连接形状点的直线段。

| 字段名                   | 类型     | 存在     | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| --------------------- | ------ | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `shape_id`            | 身份证    | **需要** | 识别一个形状。                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `shape_pt_lat`        | 纬度     | **需要** | 形状点的纬度。中的每条记录 [shapes.txt](#shapestxt)中的每条记录都代表一个用于定义形状的形状点。                                                                                                                                                                                                                                                                                                                                                                                                |
| `shape_pt_lon`        | 经度     | **需要** | 形状点的经度。                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `shape_pt_sequence`   | 非负整数   | **需要** | 形状点连接形成形状的顺序。数值必须沿行程增加，但不需要是连续的。<hr/>*例如。如果形状 "A_shp "在其定义中有三个点，那么 [shapes.txt](#shapestxt)文件可能包含这些记录来定义形状。* <br/> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence` <br/> `A_shp,37.61956,-122.48161,0` <br/> `A_shp,37.64430,-122.41070,6` <br/> `A_shp,37.65863,-122.30839,11`                                                                                                                                                                      |
| `shape_dist_traveled` | 非负数浮点数 | 可选     | 从第一个形状点到这个记录中指定的点，沿着形状走的实际距离。由行程计划者使用，在地图上显示形状的正确部分。数值必须随同增加 `shape_pt_sequence`增加；它们不能被用来显示沿途的反向旅行。距离单位必须与 "地图 "中使用的单位一致。 [stop_times.txt](#stop_timestxt).<hr/>*例子。如果一辆公共汽车沿着上面为A_shp定义的三个点行驶，额外的 `shape_dist_traveled`的附加值(这里显示为公里数)会是这样的。* <br/> `shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled` <br/> `A_shp,37.61956,-122.48161,0,0`<br/>`A_shp,37.64430,-122.41070,6,6.8310` <br/> `A_shp,37.65863,-122.30839,11,15.8765` |

### frequencies.txt

文件:**可**选

主键`trip_id`,`start_time`)

[frequencies.txt](#frequenciestxt)代表以常规班次（班次之间的时间）运行的车次。这个文件可以用来代表两种不同类型的服务。

- 基于频率的服务`(exact_times=0`)，这种服务在一天中不遵循固定的Schedule。相反，运营商试图严格保持预先确定的班次间隔。
- Schedule的服务`（exact_times=1`）的压缩表示，在指定的时间段内有完全相同的车次间隔。在Schedule服务中，运营商试图严格遵守Schedule。

| 字段名            | 类型                     | 存在     | 描述                                                                                                                                                                                    |
| -------------- | ---------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip_id`      | 国外ID参考 `trips.trip_id` | **需要** | 确定一个适用于指定班次的车次。                                                                                                                                                                       |
| `start_time`   | 时间                     | **需要** | 第一辆车从指定班次的第一站出发的时间。                                                                                                                                                                   |
| `end_time`     | 时间                     | **需要** | 旅程中第一站的服务转为不同班次（或停止）的时间。                                                                                                                                                              |
| `headway_secs` | 正整数                    | **需要** | 在指定的时间间隔内，从该行程的同一站点（头程）出发的时间，以秒为单位。 `start_time`和 `end_time`.同一个行程可以定义多个航向，但不能重叠。新的班次可以在前一个班次结束的时候开始。                                                                                 |
| `exact_times`  | 枚举                     | 可选     | 表示一个行程的服务类型。更多信息见文件描述。有效的选项是。<br/><br/>`0`或空 - 基于频率的车次。<br/>`1`- 基于Schedule旅行，全天有完全相同的班次。在这种情况下 `end_time`在这种情况下，该值必须大于最后一次期望的行程 `start_time`但小于最后一次所需行程的start_time+. `headway_secs`. |

### transfers.txt

文件:**可**选

主键`from_stop_id`,`to_stop_id`,`from_trip_id`,`to_trip_id`,`from_route_id`,`to_route_id`）。

当计算行程时，GTFS应用程序会根据允许的时间和站点的接近程度来插值换乘。[transfers.txt](#transferstxt)txt为选定的换乘指定了额外的规则和重写内容。

`from_trip_id`,`to_trip_id`,`from_route_id`和`to_route_id`字段允许转移规则有更高的特殊性。与`from_stop_id`和`to_stop_id`一起，特定性的排序如下。

1. 两个`trip_id`都被定义：`from_trip_id`和`to_trip_id`。
2. 定义了一个`trip_id`和`route_id`集合：`from_trip_id`和`to_route_id`）或`from_route_id`和`to_trip_id`）。
3. 定义了一个`trip_id`：`from_trip_id`或`to_trip_id`。
4. 两个`route_id`都被定义：`from_route_id`和`to_route_id`。
5. 只定义了一个`route_id`：`from_route_id`或`to_route_id`。
6. 只定义了`from_stop_id`和`to_stop_id`：没有设置路线或行程相关的字段。

对于一个给定的到达行程和离开行程的有序配对，选择适用于这两个行程之间的具有最大特殊性的转移。对于任何一对行程，不应该有两个具有同样最大特异性的换乘可以适用。

| 字段名                 | 类型                       | 存在     | 描述                                                                                                                                                                                                                                              |
| ------------------- | ------------------------ | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `from_stop_id`      | 国外ID参考 `stops.stop_id`   | **需要** | 标明路线之间连接开始的站台或车站。如果这个字段指的是一个车站，换乘规则适用于其所有子站。                                                                                                                                                                                                    |
| `to_stop_id`        | 国外ID参考 `stops.stop_id`   | **需要** | 识别路线之间的连接结束的站台或车站。如果这个字段指的是一个车站，换乘规则适用于所有的子站。                                                                                                                                                                                                   |
| `from_route_id`     | 国外ID参考 `routes.route_id` | 可选     | 识别一条连接开始的路线。<br/><br/>如果 `from_route_id`如果这个字段是定义的，那么转乘将适用于该路线上到达的行程。 `from_stop_id`.<br/><br/>如果两者都是 `from_trip_id`和 `from_route_id`都被定义，则 `trip_id`必须属于 `route_id`，和 `from_trip_id`将优先考虑。                                                     |
| `to_route_id`       | 国外ID参考 `routes.route_id` | 可选     | 确定一个连接结束的路线。<br/><br/>如果 `to_route_id`定义了一个路线，转移将适用于该路线上的出发行程。 `to_stop_id`.<br/><br/>如果都是 `to_trip_id`和 `to_route_id`被定义，则 `trip_id`必须属于 `route_id`，以及 `to_trip_id`将优先考虑。                                                                      |
| `from_trip_id`      | 国外ID参考 `trips.trip_id`   | 可选     | 确定一个路线之间连接开始的旅程。<br/><br/>如果 `from_trip_id`如果定义了，转移将适用于给定的到达行程。 `from_stop_id`.<br/><br/>如果都是 `from_trip_id`和 `from_route_id`被定义，则 `trip_id`必须属于 `route_id`, 和 `from_trip_id`将优先考虑。                                                             |
| `to_trip_id`        | 国外ID参考 `trips.trip_id`   | 可选     | 确定一个路线之间的连接结束的旅程。<br/><br/>如果 `to_trip_id`如果定义了，转移将适用于给定的出发的行程。 `to_stop_id`.<br/><br/>如果两者都 `to_trip_id`和 `to_route_id`被定义，则 `trip_id`必须属于 `route_id`, 和 `to_trip_id`将优先考虑。                                                                    |
| `transfer_type`     | 枚举                       | **需要** | 表示指定的()对连接的类型。`from_stop_id`, `to_stop_id`)对的连接类型。有效的选项是。<br/><br/> `0`或空 - 路线之间的推荐换乘点。<br/>`1`- 两条路线之间的定时换乘点。出发的车辆要等待到达的车辆，并为乘客留下足够的时间在路线之间转车。<br/>`2`- 换乘需要在到达和离开之间留出最少的时间，以确保连接。转车所需的时间由以下规定 `min_transfer_time`.<br/>`3`- 在该地点的线路之间不可能进行换乘。 |
| `min_transfer_time` | 非负整数                     | 可选     | 必须有多少时间，以秒为单位，允许在指定站点的路线之间进行换乘。该时间 `min_transfer_time`应足以允许一个典型的乘客在两站之间移动，包括缓冲时间以允许每条路线的Schedule变化。                                                                                                                                             |

### pathways.txt

文件:**可**选

主键`pathway_id`）。

文件[pathways.txt](#pathwaystxt)和[levels.txt](levelstxt)使用图形表示来描述地铁或火车站，节点代表地点，边代表路径。

为了从车站的入口/出口（表示为`location_type=2`的节点）导航到站台（表示为`location_type=0`或空的节点），乘客将通过人行道、检票口、楼梯和其他表示为通路的边缘移动。通用节点（用`location_type=3`表示的节点）可以用来连接整个车站的路径。

路径必须在一个车站中被详尽地定义。如果定义了任何路径，则假定整个车站的所有路径都被代表。因此，以下准则适用。

- 没有悬空的位置。如果一个车站内的任何位置都有通道，那么该车站内的所有位置都应该有通道，但有上车区域的站台除外`（location_type=4`，见以下准则）。
- 有乘车区的站台没有通道。一个有乘车区（`location_type=0`或空）的平台`（``location_type=4`）被视为一个父对象，而不是一个点。在这种情况下，该平台必须没有分配路径。所有的路径都应该被分配给平台的每个登机区域。
- 没有锁定的平台。每个平台`（location_type=0`或空）或登机区`（location_type=4`）必须通过一些路径链与至少一个入口/出口`（location_type=2`）相连。不允许从一个特定的站台到站外的通道的车站是罕见的。

| 字段名                      | 类型                     | 存在     | 描述                                                                                                                                                                                                                                                                                                                                         |
| ------------------------ | ---------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `pathway_id`             | 独特的ID                  | **需要** | 标识一个通道。由系统作为记录的内部标识符使用。在数据集中必须是唯一的。 <br/><br/>不同的路径可能有相同的值 `from_stop_id`和 `to_stop_id`.<hr/>*例如。当两个自动扶梯并排在相反的方向，或者当楼梯组和电梯从同一个地方到同一个地方，不同的 `pathway_id`可能有相同的 `from_stop_id`和 `to_stop_id`值。*                                                                                                                                              |
| `from_stop_id`           | 国外ID参考 `stops.stop_id` | **需要** | 路径开始的位置。<br/><br/>必须包含一个 `stop_id`识别一个平台(`location_type=0`或空的）、入口/出口（`location_type=2`)、通用节点(`location_type=3`)或乘车区(`location_type=4`).<br/><br/>的值 `stop_id`识别车站的数值(`location_type=1`)是禁止的。                                                                                                                                               |
| `to_stop_id`             | 国外ID参考 `stops.stop_id` | **需要** | 路径结束的位置。<br/><br/>必须包含一个 `stop_id`识别一个平台`location_type=0`或空），入口/出口（`location_type=2`)、通用节点()。`location_type=3`)或登车区(`location_type=4`).<br/><br/>的值 `stop_id`的值是禁止的。`location_type=1`的值是禁止的。                                                                                                                                               |
| `pathway_mode`           | 枚举                     | **需要** | 指定的（）之间的通路类型。`from_stop_id`, `to_stop_id`)对之间的路径类型。有效选项是。 <br/><br/>`1`- 人行道。 <br/>`2`- 楼梯。 <br/>`3`- 移动人行道/旅行车。 <br/>`4`- 自动扶梯。 <br/>`5`- 电梯。 <br/>`6`- 票价门（或付款门）。进入车站的一个区域的通道，需要支付证明才能通过。车费门可以将车站的付费区域与非付费区域分开，或者将同一车站内的不同付费区域相互分开。这些信息可以用来避免让乘客使用捷径通过车站，而这些捷径需要乘客进行不必要的支付，比如引导乘客走过地铁站台到达公交车道。 <br/>`7`- 出口门。从付费区进入非付费区的通道，不需要支付证明就可以通过。 |
| `is_bidirectional`       | 枚举                     | **需要** | 表示该通道可以走的方向。<br/><br/>`0`- 单向通道，只可以从以下方向使用 `from_stop_id`到 `to_stop_id`.<br/>`1`- 双向通道，可以从两个方向使用。<br/><br/>出口闸门(`pathway_mode=7`)不能是双向的。                                                                                                                                                                                                   |
| `length`                 | 非负数浮点数                 | 可选     | 路径的水平长度（米），从起点位置（定义在 `from_stop_id`)到目的地位置(定义在 `to_stop_id`).<br/><br/>该字段建议用于人行道(`pathway_mode=1`)、检票口(`pathway_mode=6`)和出口闸机(`pathway_mode=7`).                                                                                                                                                                                          |
| `traversal_time`         | 正整数                    | 可选     | 从起点位置走过通道所需的平均时间（秒）（定义见下文）。 `from_stop_id`)到目的地位置(定义在 `to_stop_id`).<br/><br/>该字段建议用于移动人行道(`pathway_mode=3`)、自动扶梯(`pathway_mode=4`)和电梯(`pathway_mode=5`).                                                                                                                                                                                  |
| `stair_count`            | 非空整数                   | 可选     | 路径的楼梯数。<br/><br/>一个正的 `stair_count`意味着乘坐者要从 `from_stop_id`和 `to_stop_id`.而负数 `stair_count`意味着骑手从......往下走。 `from_stop_id`到 `to_stop_id`.<br/><br/>这个字段被推荐用于楼梯(`pathway_mode=2`).<br/><br/>如果只能提供一个估计的楼梯数，建议1层楼大约有15个楼梯。                                                                                                                    |
| `max_slope`              | 浮点数                    | 可选     | 路径的最大坡度比。有效选项是。<br/><br/>`0`或空 - 无坡度。<br/>`Float`- 路径的坡度比，向上为正，向下为负。<br/><br/>这个字段应该只用于人行道(`pathway_mode=1`)和移动人行道(`pathway_mode=3`).<hr/>*例子。在美国，0.083（也写作8.3%）是手推轮椅的最大坡度比，这意味着每1米增加0.083米（即8.3厘米）。*                                                                                                                                      |
| `min_width`              | 正向浮动                   | 可选     | 路径的最小宽度，单位是米。<br/><br/>如果最小宽度小于1米，建议填写此栏。                                                                                                                                                                                                                                                                                                  |
| `signposted_as`          | 文本                     | 可选     | 面向公众的文字，来自骑行者可见的实体标牌。<br/><br/>可用于向骑手提供文字指示，如 "跟随标志到''。文字的内容 `singposted_as`中的文字应与标志上所印的一模一样。<br/><br/>当实体标牌是多语言的时候，这个字段可以按照以下例子进行填充和翻译 `stops.stop_name`的字段定义中的 `feed_info.feed_lang`.                                                                                                                                                    |
| `reversed_signposted_as` | 文本                     | 可选     | 相同于 `signposted_as`，但是当路径从 `to_stop_id`对 `from_stop_id`.                                                                                                                                                                                                                                                                                   |

### levels.txt

文件：有**条件**地需要

主键`level_id`)

描述车站中的等级。与`pathways.txt`一起使用，对于带电梯的路径导航是必需的`（pathway_mode=5`）。

| 字段名           | 类型    | 存在     | 描述                                                                |
| ------------- | ----- | ------ | ----------------------------------------------------------------- |
| `level_id`    | 独特的ID | **需要** | 识别车站中的一个层级。                                                       |
| `level_index` | 浮点数   | **需要** | 表示其相对位置的层的数字索引。 <br/><br/>地面层应具有指数 `0`，地面上的楼层用正指数表示，地面下的楼层用负指数表示。 |
| `level_name`  | 文本    | 可选     | 乘坐者在建筑物或车站内看到的层的名称。<hr/>*例子。乘电梯到 "Mezzanine "或 "Platform "或"-1"。* |

### translations.txt

文件:**可**选

主键`table_name`,`field_name`,`language`,`record_id`,`record_sub_id`,`field_value`）。

在有多种官方语言的地区，公交机构/运营者通常有language名称和网页。为了更好地服务于这些地区的乘客，数据集包括这些language值是非常有用的。

| 字段名             | 类型               | 存在         | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| --------------- | ---------------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `table_name`    | 枚举               | **需要**     | 定义了包含要翻译的字段的表。允许的值是。<br/><br/>- `agency`<br/>- `stops`<br/>- `routes`<br/>- `trips`<br/>- `stop_times`<br/>- `pathways`<br/>- `levels`<br/>- `feed_info`<br/>- `attributions`<br/><br/>任何添加到GTFS的文件将有一个 `table_name`值相当于文件名，如上文所列（即不包括 `.txt`文件扩展名）。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `field_name`    | 文本               | **需要**     | 要翻译的字段的名称。类型为 `Text`的字段可以被翻译，类型为 `URL`, `Email`和 `Phone number`也可以被 "翻译"，以提供正确language的资源。具有其他类型的字段不应该被翻译。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `language`      | language代码       | **需要**     | 翻译的language。<br/><br/>如果language与在 `feed_info.feed_lang`中，该字段的原始值将被假定为默认值，以便在没有特定翻译的语言中使用（如果 `default_lang`没有另外指定）。<hr/>*例如。在瑞士，一个官方双语州的城市被正式称为 "Biel/Bienne"，但在法语中会被简单地称为 "Bienne"，在德语中被称为 "Biel"。*                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `translation`   | 文本或URL或电子邮件或电话号码 | **需要**     | 翻译的价值。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `record_id`     | 外国身份证            | **有条件要求**  | 定义了与要翻译的字段相对应的记录。中的值必须是 `record_id`中的值必须是表的主键的第一个或唯一的字段，如每个表的主键属性和下面的定义。<br/><br/>- `agency_id`为 `agency.txt`<br/>- `stop_id`为 `stops.txt`;<br/>- `route_id`为 `routes.txt`;<br/>- `trip_id`为 `trips.txt`;<br/>- `trip_id`为 `stop_times.txt`;<br/>- `pathway_id`为 `pathways.txt`;<br/>- `level_id`为 `levels.txt`;<br/>- `attribution_id`为 `attribution.txt`.<br/><br/>上面没有定义的表中的字段不应该被翻译。然而，生产商有时会添加官方规范之外的额外字段，这些非官方的字段可能会被翻译。下面是推荐的使用方法 `record_id`对于这些表。<br/><br/>- `service_id`为 `calendar.txt`;<br/>- `service_id`为 `calendar_dates.txt`;<br/>- `fare_id`为 `fare_attributes.txt`;<br/>- `fare_id`为 `fare_rules.txt`;<br/>- `shape_id`为 `shapes.txt`;<br/>- `trip_id`为 `frequencies.txt`;<br/>- `from_stop_id`为 `transfers.txt`.<br/><br/>有条件地要求。<br/>- **禁用**如果 `table_name`是 `feed_info`.<br/>- **禁止**如果 `field_value`已定义。<br/>- **需要**如果 `field_value`是空的。 |
| `record_sub_id` | 国外ID             | **有条件要求**  | 当表没有唯一的ID时，帮助包含要翻译的字段的记录。因此，表中的值 `record_sub_id`是该表的二级ID，如下表所定义。<br/><br/>- 无，用于 `agency.txt`;<br/>- 无，用于 `stops.txt`;<br/>- 无适用于 `routes.txt`;<br/>- 无为 `trips.txt`;<br/>- `stop_sequence`为 `stop_times.txt`;<br/>- 无 `pathways.txt`;<br/>- 无 `levels.txt`;<br/>- 无 `attributions.txt`.<br/><br/>上面没有定义的表格中的字段不应该被翻译。然而，制作者有时会添加官方规范之外的额外字段，这些非官方的字段可能会被翻译。下面是推荐的使用方法 `record_sub_id`为这些表。<br/><br/>- 无 `calendar.txt`;<br/>- `date`为 `calendar_dates.txt`;<br/>- 无 `fare_attributes.txt`;<br/>- `route_id`为 `fare_rules.txt`;<br/>- 无为 `shapes.txt`;<br/>- `start_time`为 `frequencies.txt`;<br/>- `to_stop_id`为 `transfers.txt`.<br/><br/>有条件地要求。<br/>- **严禁**如果 `table_name`是 `feed_info`.<br/>- **严禁**如果 `field_value`已定义。<br/>- **需要**如果 `table_name=stop_times`和 `record_id`已定义。                                                                           |
| `field_value`   | 文本或URL或电子邮件或电话号码 | **有条件地要求** | 而不是通过使用 "翻译 "来定义应该翻译的记录。 `record_id`和 `record_sub_id`来定义哪个记录应该被翻译，这个字段可以用来定义应该被翻译的值。当使用时，翻译将被应用于由 `table_name`和 `field_name`确定的字段包含与field_value中定义的完全相同的值时，就会应用翻译。<br/><br/>该字段必须有 **正是**中定义的值。 `field_value`.如果只有一个子集的值符合 `field_value`，翻译就不会被应用。<br/><br/>如果两个翻译规则匹配同一个记录（一个用 `field_value`，而另一条则是 `record_id`的规则，则具有 `record_id`的规则优先。<br/><br/>有条件要求。<br/>- **严禁**如果 `table_name`是 `feed_info`.<br/>- **严禁**如果 `record_id`已定义。<br/>- **需要**如果 `record_id`为空。                                                                                                                                                                                                                                                                                                                                                                                                 |

### feed_info.txt

文件：**可选****（**如果提供`translations.txt`，**则需要**）。

主键(无)

该文件包含关于数据集本身的信息，而不是数据集所描述的服务。在某些情况下，数据集的发布者是一个不同于任何机构的实体。

如果引用方法`record_id`，`record_sub_id`）和`field_value`都被用来翻译2个不同行中的同一个值，则以`record_id`，`record_sub_id`）提供的翻译为准。

| 字段名                   | 类型         | 存在     | 描述                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| --------------------- | ---------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `feed_publisher_name` | 文本         | **需要** | 发布数据集的组织的全名。这可能是一个 `agency.agency_name`值。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `feed_publisher_url`  | URL        | **需要** | 数据集发布组织的网站的URL。这可能与其中的一个相同。 `agency.agency_url`值。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `feed_lang`           | language代码 | **需要** | 该数据集中文本使用的默认language。这一设置有助于GTFS消费者为数据集选择大写规则和其他language设置。该文件 `translations.txt`如果文本需要被翻译成默认语言以外的语言，可以使用该文件。<br/><br/>对于原始文本为多种语言的数据集，默认language可能是多语言。在这种情况下，该 `feed_lang`字段应包含language代码 `mul`在这种情况下，该字段应包含由规范ISO 639-2定义的语言代码，数据集中使用的每种language的翻译应提供在 `translations.txt`.如果数据集中的所有原始文本都是同一种language，那么 `mul`不应使用。<hr/>*例子。考虑一个来自瑞士这样一个多语言国家的数据集，其原始的 `stops.stop_name`字段中填充了不同语言的站名。每个站名都是根据该站的地理位置的主要language来写的，比如说 `Genève`代表法语城市日内瓦。 `Zürich`说德语的城市苏黎世，以及 `Biel/Bienne`双语城市Biel/Bienne。该数据集 `feed_lang`应该是 `mul`和翻译将在以下文件中提供 `translations.txt`，德文版。 `Genf`, `Zürich`和 `Biel`法语。 `Genève`, `Zurich`和 `Bienne`意大利语。 `Ginevra`, `Zurigo`和 `Bienna`;和英语。 `Geneva`, `Zurich`和 `Biel/Bienne`.* |
| `default_lang`        | language代码 | 可选     | 定义了当数据消费者不知道骑手的language时应该使用的language。它通常会是 `en`(英语)。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `feed_start_date`     | 日期         | 可选     | 该数据集提供了完整和可靠的Schedule信息，从开始的一天到结束的一天的服务。 `feed_start_date`日开始到结束的 `feed_end_date`一天。如果无法提供，这两天可以留空。日期 `feed_end_date`日期必须不在 `feed_start_date`日期，如果两者都给出的话。建议数据集供应商在此期限之外提供Schedule数据，以告知未来可能的服务，但数据集消费者应注意其非权威性。如果 `feed_start_date`或 `feed_end_date`中定义的有效日历日期之后，数据集就会在这一时期内做出一个声明。 [calendar.txt](#calendartxt)和 [calendar_dates.txt](#calendar_datestxt)中定义的日期，则数据集明确断言，在该范围内但不包括在活动日历中的日期没有服务。 `feed_start_date`或 `feed_end_date`范围内但不包括在活动日历日期内的日期没有服务。                                                                                                                                                                                                                                       |
| `feed_end_date`       | 日期         | 可选     | (见上文)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `feed_version`        | 文本         | 可选     | 表示其GTFS数据集的当前版本的字符串。GTFS应用程序可以显示这个值，以帮助数据集发布者确定是否已纳入最新的数据集。                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `feed_contact_email`  | 电子邮件       | 可选     | 用于就GTFS数据集和数据发布做法进行沟通的电子邮件地址。 `feed_contact_email`是GTFS应用程序的技术联系人。通过以下方式提供客户服务联系信息 [agency.txt](#agencytxt).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `feed_contact_url`    | URL        | 可选     | 联系信息的URL、网络表格、支持台或其他工具，以便就GTFS数据集和数据发布惯例进行沟通。 `feed_contact_url`是GTFS应用程序的技术联系人。通过以下方式提供客户服务联系信息 [agency.txt](#agencytxt).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |

### attributions.txt

文件：**可**选

主键`attribution_id`)

该文件定义了应用于数据集的属性。

| 字段名                 | 类型                        | 存在     | 说明                                                                                                                                         |
| ------------------- | ------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `attribution_id`    | 唯一的ID                     | 可选     | 确定了数据集或其子集的归属。这对翻译来说非常有用。                                                                                                                  |
| `agency_id`         | 国外ID参考 `agency.agency_id` | 可选     | 归属所适用的机构。<br/><br/>如果一个 `agency_id`, `route_id`，或 `trip_id`归属被定义，其他的必须为空。如果没有指定，属性将适用于整个数据集。                                               |
| `route_id`          | 国外ID参考 `routes.route_id`  | 可选     | 职能 `agency_id`除非该属性适用于一个路径。多个属性可以适用于同一路线。                                                                                                  |
| `trip_id`           | 国外ID参考 `trips.trip_id`    | 可选     | 职能 `agency_id`除了归属适用于一个行程。多个归属可以适用于同一个行程。                                                                                                  |
| `organization_name` | 文本                        | **需要** | 数据集所归属的组织名称。                                                                                                                               |
| `is_producer`       | 枚举                        | 可选     | 该组织的角色是生产者。有效的选项是。<br/><br/>`0`或空 - 组织没有这个角色。<br/>`1`- 组织确实有这个角色。<br/><br/>至少有一个字段 `is_producer`, `is_operator`，或 `is_authority`应被设置为 `1`. |
| `is_operator`       | 枚举                        | 可选     | 职能 `is_producer`除了该组织的角色是操作员。                                                                                                              |
| `is_authority`      | 枚举                        | 可选     | 职能与 `is_producer`除了该组织的角色是权威外。                                                                                                             |
| `attribution_url`   | 报道                        | 可选     | 该组织的URL。                                                                                                                                   |
| `attribution_email` | 电子邮件                      | 可选     | 该组织的电子邮件。                                                                                                                                  |
| `attribution_phone` | 电话号码                      | 可选的    | 该组织的电话号码。                                                                                                                                  |
