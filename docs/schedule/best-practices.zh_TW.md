---
search:
  exclude: true
---
  
# GTFS Schedule 最佳实践

这些是描述公共交通服务的推荐做法General Transit Feed Specification[(](../reference)GTFS [)](../reference) .这些实践都是从[GTFS](<#\<glossary variable=>)的经验中总结出来的[-最佳实践工作组">](<#\<glossary variable=>)GTFS [最佳实践工作组](<#\<glossary variable=>)成员和[PHP](<http://www.transitwiki.org/TransitWiki/index.\<glossary variable=>) [/Best_practices_for_creating_GTFS">应用程序特定](<http://www.transitwiki.org/TransitWiki/index.\<glossary variable=>)GTFS [实践建议](<http://www.transitwiki.org/TransitWiki/index.\<glossary variable=>)。

有关更多背景信息，请参阅[常见问题](#frequently-asked-questions-faq)。

## 文件结构

实践分为四个主要部分：

* __[数据集发布和一般实践](#dataset-publishing-general-practices)：__这些实践与数据集的整体结构有关GTFS数据集和其中的方式GTFS数据集发布。
* __[按文件组织的实践建议](#practice-recommendations-organized-by-file)：__建议按文件和字段组织GTFS便于将映射实践反馈给官方GTFS参考。
* __[按案例组织的实践建议](#practice-recommendations-organized-by-case)：__对于特定案例，例如循环路线，可能需要在多个文件和字段中应用实践。此类建议合并在本节中。

## 数据集发布和一般实践

* 数据集应发布在公共的永久 URL 上，包括 zip 文件名。 （例如， [GTFS](<http://www.agency.org/\<glossary variable=>) [/](<http://www.agency.org/\<glossary variable=>)GTFS [.zip">www.agency.org/](<http://www.agency.org/\<glossary variable=>)GTFS [/](<http://www.agency.org/\<glossary variable=>)GTFS [.zip](<http://www.agency.org/\<glossary variable=>) )。理想情况下，URL 应该可以直接下载，无需登录即可访问文件，以方便使用软件应用程序进行下载。虽然建议（也是最常见的做法）GTFS数据集可公开下载，如果数据提供者确实需要控制对GTFS出于许可或其他原因，建议控制对GTFS使用 API 密钥的数据集，这将有助于自动下载。
* GTFS数据以迭代形式发布，因此在稳定位置的单个文件始终包含运输机构（或多个机构）的最新官方服务描述。
* 维护持久标识符（id 字段）stop_id ,route_id ， 和agency_id尽可能跨数据迭代。
* 一GTFS数据集应包含当前和即将推出的服务（有时称为“合并”数据集）。 Google transitfeed 工具的[合并功能](https://github.com/google/transitfeed/wiki/Merge)可用于从两个不同的数据集创建合并数据集GTFS饲料。
  * 随时发布GTFS数据集应至少在接下来的 7 天内有效，理想情况下，只要操作员确信Schedule将继续运营。
  * 如果可能的话，GTFS数据集应至少涵盖接下来 30 天的服务。
* 从提要中删除旧服务（过期日历）。
* 如果服务修改将在 7 天或更短时间内生效，请通过[GTFS](<https://developers.google.com/transit/\<glossary variable=>)表达此服务更改[-](<https://developers.google.com/transit/\<glossary variable=>)Realtime[/">](<https://developers.google.com/transit/\<glossary variable=>)GTFS [-](<https://developers.google.com/transit/\<glossary variable=>)Realtime提要（服务建议或旅行更新）而不是静态的GTFS数据集。
* 网络服务器托管GTFS数据应配置为正确报告文件修改日期（参见[HTTP/1.1 - Request for Comments 2616](https://tools.ietf.org/html/rfc2616#section-14.29) ，在第 14.29 节下）。

## 按文件组织的练习建议

本节显示按文件和字段组织的实践，与GTFS[参考](../reference)。

### 所有文件

| 字段名称 | 推荐                                                                                                                                     |
| ---- | -------------------------------------------------------------------------------------------------------------------------------------- |
| 混合案例 | 所有面向客户的文本字符串（包括站点名称、路线名称和车头标志）都应使用混合大小写（而不是全部大写），遵循本地约定，以便在能够显示小写字符的显示器上将地名大写。                                                         |
|      | 例子：                                                                                                                                    |
|      | 布莱顿丘吉尔广场                                                                                                                               |
|      | 马恩河畔维利尔斯                                                                                                                               |
|      | 市场街                                                                                                                                    |
| 缩写   | 避免在整个提要中使用名称和其他文本的缩写（例如 St. 代表街道），除非使用其缩写名称（例如“JFK 机场”）来调用位置。缩写可能会影响屏幕阅读器软件和语音用户界面的可访问性。消费软件可以设计为可靠地将完整单词转换为缩写词以供显示，但从缩写词转换为完整单词更容易出错。 |

### agency.txt

| 字段名称              | 推荐                                                                                                             |
| ----------------- | -------------------------------------------------------------------------------------------------------------- |
| `agency_id`       | 应包括在内，即使提要中只有一个机构。 （另见建议包括`agency_id`在[`routes.txt`](#routestxt)和[`fare_attributes.txt`](#fare_attributestxt)) |
| `agency_phone`    | 除非不存在此类客户服务电话，否则应包括在内。                                                                                         |
| `agency_email`    | 除非不存在此类客户服务电子邮件，否则应包括在内。                                                                                       |
| `agency_fare_url` | 除非该机构完全免费，否则应包括在内。                                                                                             |

__例子：__

* 巴士服务由几家小型巴士公司经营。但是有一个大机构负责调度和票务，并且从用户的角度负责公共汽车服务。一个大机构应该定义为提要中的机构。即使数据在内部由不同的小型公交运营商进行拆分，Feed 中也应该只定义一个机构。

* 提要提供商运行票务门户，但有不同的机构实际运营服务并且用户知道要负责。实际运营服务的机构应定义为提要中的机构。


### stops.txt

|字段名稱 |推薦 |
| --- | --- |
| `stop_name` |如果沒有發布的站點名稱，請在整個提要中遵循一致的站點命名約定。 | |
| |默認情況下，`stop_name` 不應包含通用或冗餘詞，如“Station”或“Stop”，但允許一些極端情況。<ul><li>當它實際上是名稱的一部分時（聯合車站、中央車站<li>當`stop_name`過於籠統時（比如如果它是城市的名稱）。“車站”、“終點站”或其他詞使含義清晰。</ul> |
| `stop_lat` & `stop_lon` |停止位置應盡可能準確。與實際停止位置相比，停止位置的誤差應不超過 __4 米。 |
| |停靠點應放置在非常靠近乘客上車的行人通行權處（即街道的正確一側）。 |
| |如果在不同的數據饋送中共享停靠點位置（即兩個代理機構使用完全相同的停靠/登機設施），則通過對兩個停靠點使用完全相同的 `stop_lat` 和 `stop_lon` 來指示該停靠點是共享的。 |
| `parent_station` & `location_type` |許多車站或航站樓有多個登機設施（根據模式，它們可能被稱為巴士站、站台、碼頭、登機口或其他術語）。在這種情況下，飼料生產者應描述車站、寄宿設施（也稱為兒童站）及其關係。 <ul><li>車站或終點站應定義為 `stops.txt` 中的記錄，`location_type = 1`。</li><li>每個登機設施應定義為停靠站，`location_type = 0 `。 `parent_station` 字段應引用登機設施所在車站的 `stop_id`。</li></ul> |
| |在給車站和兒童站命名時，設置讓乘客容易識別的名稱，並能幫助乘客識別車站和上車設施（公交車站、站台、碼頭、登機口等）。<table class='example' ><thead><tr><th>母站名稱</th><th>子站名稱</th></tr></thead><tbody><tr><td>芝加哥聯合車站</td ><td>芝加哥聯合車站 19 號站台</td></tr><tr><td>舊金山渡輪大廈航站樓</td><td>舊金山渡輪大廈航站樓 E 門</td></tr> <tr><td>Downtown Transit Center</td><td>Downtown Transit Center Bay B</td></tr></tbody></table> |

### routes.txt

|字段名稱 | 推薦                                                                                                             |
| --- |----------------------------------------------------------------------------------------------------------------|
|`agency_id` | 應該包括在內，即使 Feed 中只有一家機構。 （另見建議包括`agency_id`在[`agency.txt`](#agencytxt)和[`fare_attributes.txt`](#fare_attributes.txt)) |
| `route_short_name` |如果有簡短的服務名稱，請包括 `route_short_name`。這應該是服務的常用乘客姓名，不超過 12 個字符。 |
| `route_long_name` |來自規範參考的定義：<q>此名稱通常比 <code>route_short_name</code> 更具描述性，並且通常包括路線的目的地或停靠點。必須至少指定 <code>route_short_name</code> 或 <code>route_long_name</code> 之一，或者如果合適，可能同時指定兩者。如果路由沒有長名，請指定一個<code>route_short_name</code>並使用空字符串作為該字段的值。</q><br>長名類型示例如下：<table class='example'><thead><tr><th colspan='3'>主要行進路徑或走廊</th></tr><tr><th>路線名稱</th><th>表格</th><th>機構</th></tr></thead><tbody><tr><td><a href='https://www.sfmta.com/getting-around/transit/ routes-stops/n-judah'>“N”/“Judah”</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td ><td><a href='https://www.sfmta.com/'>Muni</a>，舊金山</td></tr><tr><td><a href='https ://trimet.org/schedules/r006.htm'>“6”/“ML King Jr Blvd”</a></td><td><code>route_short_name</code>/<br><code> route_long_name</code></td><td><a href='https://trimet.org/'>TriMet</a>，俄勒岡州波特蘭市。</td></tr><tr><td><a href='http://www.ratp.fr/informer/pdf/orienter/f_plan.php?nompdf=m6'>“6”/“Nation - Étoile”</a></td><td><code>route_short_name</code>/<br><code>route_long_name</c ode></td><td><a href='http://www.ratp.fr/'>RATP</a>，在法國巴黎。</td></tr><tr><td> <a href='http://www.bvg.de/images/content/linienverlaeufe/LinienverlaufU2.pdf'>“U2”-“Pankow – Ruhleben”</a></td><td><code>route_short_name </code>-<br><code>route_long_name</code></td><td><a href='http://www.bvg.de/'>BVG</a>，德國柏林</td></tr></tbody></table><table class='example'><thead><tr><th>服務說明</th></tr></thead><tbody><tr><td><a href='https://128bc.org/schedules/rev-bus-hartwell-area/'>“哈特韋爾地區班車”</a></td></tr> </tbody></table>  
| | `route_long_name` 不應包含 `route_short_name`。 |
| |在填充 `route_long_name` 時包括完整的名稱，包括服務標識。示例：<table class='example'><thead><tr><th>服務標識</th><th>推薦</th><th>示例</th></tr></thead><tbody><tr><td>“MAX 輕軌”<br>俄勒岡州波特蘭市的 TriMet</td><td><code>route_long_name</code> 應包括品牌 (MAX) 和具體路線名稱</td><td>“MAX 紅線”“MAX 藍線”</td></tr><tr><td>“快速騎行”<br>新墨西哥州阿爾伯克基的 ABQ 騎行</td> <td><code>route_long_name</code> 應包含品牌（Rapid Ride）和具體路線名稱</td><td>“Rapid Ride Red Line”<br>“Rapid Ride Blue Line”</td ></tr></tbody></table>
| `route_id` |給定命名路線上的所有行程都應引用相同的“route_id”。 <li>不應將路線的不同方向劃分為不同的 `route_id` 值。</li><li>不應將路線的不同運營跨度劃分為不同的 `route_id` 值。即不要在 `routes.txt` 中為“Downtown AM”和“Downtown PM”服務創建不同的記錄）。</li> |
| |如果路由組包含明確命名的分支（例如 1A 和 1B），請按照路由 [branches](#branches) 案例中的建議來確定 `route_short_name` 和 `route_long_name`。 |
| `route_color` & `route_text_color` |應與標牌、印刷和在線客戶信息一致（如果其他地方不存在，則不包括在內）。 |

### trips.txt

* __參見循環路線的特殊情況：__ 循環路線是指行程在同一站點開始和結束的情況，而不是線性路線，後者有兩個不同的終點。環路路線必須按照具體做法進行描述。 [參見循環路線案例。](#loop-routes)
* __請參閱套索路線的特殊情況：__ 套索路線是線性和循環幾何形狀的混合體，其中車輛僅在部分路線上循環行駛。套索路線必須按照具體做法進行描述。 [參見套索路線案例。](#lasso-routes)

|字段名稱 |推薦 |
| --- | --- |
| `trip_headsign` |不要在 `trip_headsign` 或 `stop_headsign` 字段中提供路線名稱（匹配 `route_short_name` 和 `route_long_name`）。 |
| |應包含目的地、方向和/或車輛頭標上顯示的其他行程指定文本，可用於區分路線中的行程。與車輛上顯示的方向信息保持一致是確定 GTFS 數據集中提供的頭標的主要和壓倒一切的目標。只有在不損害這一主要目標的情況下，才應包括其他信息。如果頭標在旅途中發生變化，請用 `stop_times.stop_headsign` 覆蓋 `trip_headsign`。以下是針對一些可能情況的建議： |
| | <table class="example"><thead><tr><th>路線說明</th><th>推薦</th></tr></thead><tbody><tr><td>2A. Destination-only</td><td>提供終點站目的地。例如“交通中心”、“波特蘭市中心”或“詹岑海灘”> </td></tr><tr><td>2B.帶航點的目的地</td><td>&lt;destination&gt;通過&lt;航點&gt; “通過查令十字街的海格特”。如果在車輛通過這些航點後航點從向乘客顯示的航標中刪除，請使用 <code>stop_times.stop_headsign</code> 設置更新的航標。> </td></tr><tr><td>2℃。帶有本地站點的區域地名</td><td>如果目的地城市或自治市內有多個站點，請在到達目的地城市後使用<code>stop_times.stop_headsign</code>。> </td></tr><tr><td>2D。僅方向</td><td>使用諸如“北行”、“入站”、“順時針”或類似方向等術語表示。></td></tr><tr><td>2E。方向與目的地</td><td>&lt;direction&gt;到&lt;終點站名稱&gt;例如“南行至聖何塞”></td></tr><tr><td>2F。帶有目的地和航路點的方向</td><td>&lt;direction&gt;通過&lt;航點&gt;到&lt;目的地&gt; （“北行經查令十字到海格特”）。></td></tr></tbody></table> |
| |不要以“To”或“Towards”作為頭標的開頭。 |
| `direction_id` |在整個數據集中始終使用值 0 和 1。即<ul><li>如果 1 = 紅色路線上的出站，那麼 1 = 綠色路線上的出站</li><li>如果 1 = 路線 X 上的北行，那麼 1 = 路線 Y 上的北行</li> <li>如果 1 = 路線 X 順時針，則 1 = 路線 Y 順時針</li></ul> |

### stop_times.txt

循環路線：循環路線需要特殊的“stop_times”注意事項。 （參見：[循環路由案例](#loop-routes)）

|字段名稱 |推薦 |
| --- | --- |
| `pickup_type` & `drop_off_type` |對於所有 `stop_times` 行，不提供客運服務的無收入（死角）旅行應標記為 `pickup_type` 和 `drop_off_type` 值為 `1`。
| |在收費旅行中，用於監控運營績效的內部“時間點”以及乘客無法上車的其他地方（例如車庫）應標有“pickup_type = 1”（不提供接送服務）和“drop_off_type = 1”（不提供下車服務） . |
| `arrival_time` & `departure_time` | `arrival_time` 和 `departure_time` 字段應盡可能指定時間值，包括時間點之間的非約束估計或插值時間。 |
| `stop_headsign` |一般來說，headsign 的值也應該與車站的標誌相對應。<br><br>在以下情況下，“Southbound”會誤導客戶，因為它沒有用於車站標誌。
| | <table class="example"><thead><tr><th colspan="2">在紐約，對於 2 南行：</th></tr><tr><th>對於 <code>stop_times .txt</code> 行：</th><th>使用 <code>stop_headsign</code> 值：</th></tr></thead><tbody><tr><td>直到曼哈頓到達</td><td><code>曼哈頓和布魯克林</code></td></tr><tr><td>直到到達市中心</td><td><code>市中心和布魯克林</code></td></tr><tr><td>直到到達布魯克林</td><td><code>布魯克林</code></td></tr><tr><td>一旦到達布魯克林</td><td><code>布魯克林（新地段大道）</code></td></tr></tbody></table> |
| | <table class="example"><thead><tr><th colspan="2">在波士頓，紅線南行，Braintree 支線：</th></tr><tr><th >對於 <code>stop_times.txt</code> 行：</th><th>使用 <code>stop_headsign</code> 值：</th></tr></thead><tbody><tr> <td>直到到達市中心</td><td><code>進入布倫特里</code></td></tr><tr><td>一旦到達市中心</td><td><code>Braintree</code></td></tr><tr><td>市區後</td><td><code>出站到Braintree</code></td> </tr></tbody></table> |
| `shape_dist_traveled` |必須為具有循環或內聯的路線提供“shape_dist_traveled”（車輛在一次行程中穿過或經過相同的路線部分）。請參閱 [`shapes.shape_dist_traveled`](#shapestxt) 建議。 |

### calendar.txt

|字段名稱 |推薦 |
| --- | --- |
|所有領域 |包含一個 `calendar.service_name` 字段也可以增加 GTFS 的可讀性，儘管這在規範中沒有採用。 |

### calendar_dates.txt

|字段名稱 |推薦 |
| --- | --- |
|所有領域 |包含一個 `calendar.service_name` 字段也可以增加 GTFS 的可讀性，儘管這在規範中沒有被採用。|

### fare_attributes.txt

|字段名稱 | 推薦                                                                                                                                      |
| --- |-----------------------------------------------------------------------------------------------------------------------------------------|
|`agency_id` | 應該包括在內，即使 Feed 中只有一家機構。 （另見建議包括`agency_id`在[`agency.txt`](#agencytxt)和[`routes.txt`](#routestxt))                                            |
| | 如果票價系統無法準確建模，請避免進一步混淆並將其留空。                                                                                                             |
| | 包括票價（`fare_attributes.txt` 和 `fare_rules.txt`）並儘可能準確地對其建模。在票價無法準確建模的極端情況下，票價應表示為更貴而不是更便宜，這樣客戶就不會試圖以不足的票價登機。如果絕大多數票價無法正確建模，請不要在提要中包含票價信息。 |

### fare_rules.txt

|字段名稱 |推薦 |
| --- | --- |
|所有領域 |如果票價系統無法準確建模，請避免進一步混淆並將其留空。 |
| |包括票價（`fare_attributes.txt` 和 `fare_rules.txt`）並儘可能準確地對其建模。在票價無法準確建模的極端情況下，票價應表示為更貴而不是更便宜，這樣客戶就不會試圖以不足的票價登機。如果絕大多數票價無法正確建模，請不要在提要中包含票價信息。 |

### shapes.txt

|字段名稱 |推薦 |
| --- | --- |
|所有領域 |理想情況下，對於共享的路線（即，在路線 1 和 2 在同一段道路或軌道上運行的情況下），路線的共享部分應該完全匹配。這有助於促進高質量的交通製圖。 <!-- (77) -->
| |路線應遵循車輛行駛的通行權的中心線。如果沒有指定車道，這可能是街道的中心線，也可能是沿車輛移動方向行駛的道路一側的中心線。 <br><br>路線不應“鋸齒”到路邊停靠點、平台或登機位置。 |
| `shape_dist_traveled` |如果路線包括循環或內聯（車輛在一次行程中穿越或經過同一路線部分），則必須在“shapes.txt”和“stop_times.txt”中提供。 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/inlining.svg" width=200px style="display: block; margin-left: auto; margin-right: auto ;"><br>如果車輛在旅行過程中在點處回溯或穿過路線路線，<code>shape_dist_traveled</code> 很重要，以闡明 <code>shapes.txt 中的點部分</code> code> 與 <code>stop_times.txt</code> 中的記錄對應。 |
| | `shape_dist_traveled` 字段允許機構準確指定 `stop_times.txt` 文件中的停靠點如何適合其各自的形狀。用於 `shape_dist_traveled` 字段的常用值是車輛行駛時到形狀起點的距離（想想類似於里程表讀數的東西）。 <li>路線路線（在 `shapes.txt` 中）應在行程服務的停靠點 100 米範圍內。</li><li>簡化路線，以便 <code>shapes.txt</code> 不包含多餘的點（即刪除直線段上的多餘點；請參閱線簡化問題的討論）。</li>

### frequencies.txt

|字段名稱 |推薦 |
| --- | --- |
|所有領域 | `frequencies.txt` 引用的行程將忽略實際停止時間；只有停靠點之間的旅行時間間隔對於基於頻率的旅行很重要。為了清晰/便於閱讀，建議在 `frequencies.txt` 中引用的行程的第一個停止時間應從 00:00:00 開始（第一個 `arrival_time` 值為 00:00:00）。 |
| `block_id` |可以為基於頻率的旅行提供。 |

### transfers.txt

`transfers.transfer_type` 可以是四個值之一[在 GTFS 中定義](../reference/#transferstxt)。這些 `transfer_type` 定義引用自下面的 GTFS 規範，_initalics_，並附有額外的實踐建議。

|字段名稱 |推薦 |
| --- | --- |
| `transfer_type` | <q>0 或（空）：這是路線之間的推薦換乘點。</q><br>如果有多個換乘機會，包括一個更好的選擇（即具有額外便利設施的中轉中心或具有相鄰或連接的登機設施/平台），指定推薦的換乘點。 |
| | <q>1：這是兩條路線之間的定時換乘點。出發的車輛應該等待到達的車輛，有足夠的時間讓乘客在路線之間換乘。</q><br>這種換乘類型會覆蓋所需的間隔以可靠地進行換乘。例如，谷歌地圖假設乘客需要 3 分鐘才能安全換乘。其他應用程序可能會採用其他默認值。 |
| | <q>2：此轉移需要在到達和離開之間的最短時間以確保連接。換乘所需時間由 <code>min_transfer_time</code> 指定。</q><br>如果有障礙物或其他因素會增加停靠站之間的行駛時間，請指定最短換乘時間。 |
| | <q>3：在此位置的路線之間無法進行換乘。</q><br>如果由於物理障礙而無法進行換乘，或者由於難以穿越的道路或道路上的縫隙而使換乘變得不安全或複雜，請指定此值行人網絡。 |
| |如果行程之間允許進行座位內（塊）換乘，則到達行程的最後一站必須與出發行程的第一站相同。 |


### feed_info.txt

應包含`feed_info.txt`，所有字段都在下面。

|字段名稱 |推薦 |
| --- | --- |
| `feed_start_date` & `feed_end_date` |應該包括|
| `feed_version` |應該包括|
| `feed_contact_email` & `feed_contact_url` |提供至少一個 |

## 按案例組織的實踐建議

本節涵蓋具有跨文件和字段含義的特定情況。

### 循環路線

在循環路線上，車輛的行程在同一地點開始和結束（有時是中轉或換乘中心）。車輛通常連續運行並允許乘客在車輛繼續其循環時留在車上。

<img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/loop-route.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;">

因此，應採用頭標建議，以便向乘客顯示車輛行駛的方向。

要指示行進方向的變化，請在“stop_times.txt”文件中提供“stop_headsigns”。 `stop_headsign` 描述了從其定義的站點出發的行程方向。將“stop_headsigns”添加到行程的每個站點允許您更改行程中的 headsign 信息。

不要在 stop_times.txt 文件中為在兩個端點之間運行的路線定義一個單一的循環行程（例如，當同一輛公共汽車來回運行時）。相反，將行程分成兩個單獨的行程方向。
  
__循環行程建模示例：__

- 循環旅行，每站都改變頭標

| trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign |
|---------|--------------|----------------|---------|---------------|---------------|
| trip_1  | 06:10:00     | 06:10:00       | stop_A  | 1             | "B"           |
| trip_1  | 06:15:00     | 06:15:00       | stop_B  | 2             | "C"           |
| trip_1  | 06:20:00     | 06:20:00       | stop_C  | 3             | "D"           |
| trip_1  | 06:25:00     | 06:25:00       | stop_D  | 4             | "E"           |
| trip_1  | 06:30:00     | 06:30:00       | stop_E  | 5             | "A"           |
| trip_1  | 06:35:00     | 06:35:00       | stop_A  | 6             | ""            |
 
- 帶有兩個頭標的循環旅行

| trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign |
|---------|--------------|----------------|---------|---------------|---------------|
| trip_1  | 06:10:00     | 06:10:00       | stop_A  | 1             | "outbound"    |
| trip_1  | 06:15:00     | 06:15:00       | stop_B  | 2             | "outbound"    |
| trip_1  | 06:20:00     | 06:20:00       | stop_C  | 3             | "outbound"    |
| trip_1  | 06:25:00     | 06:25:00       | stop_D  | 4             | "inbound"     |
| trip_1  | 06:30:00     | 06:30:00       | stop_E  | 5             | "inbound"     |
| trip_1  | 06:35:00     | 06:35:00       | stop_F  | 6             | "inbound"     |
| trip_1  | 06:40:00     | 06:40:00       | stop_A  | 7             | ""            |

|字段名稱 |推薦 |
| --- | --- |
| `trips.trip_id`| 用單次行程為循環的完整往返建模。 |
| `stop_times.stop_id` |在 `stop_times.txt` 中包含兩次第一站/最後一站作為循環行程。下面的例子。通常，循環路線可能包括不經過整個循環的第一次和最後一次旅行。也包括這些旅行。 <table class="example"><thead><tr><th><code>trip_id</code></th><th><code>stop_id</code></th><th><code> stop_sequence</code></th></tr></thead><tbody><tr><td>9000</td><td>101</td><td>1</td></tr ><tr><td>9000</td><td>102</td><td>2</td></tr><tr><td>9000</td><td>103</td ><td>3</td></tr><tr><td>9000</td><td>101</td><td>4</td></tr></tbody></table> |
| `trips.direction_id` |如果循環以相反的方向運行（即順時針和逆時針），則將 `direction_id` 指定為 `0` 或 `1`。 |
| `trips.block_id` |用相同的 `block_id` 表示連續的循環行程。 |

### 套索路線

套索路線結合了循環路線和定向路線的各個方面。

<img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/lasso-route.svg" width=140px style="display: block; margin-left: auto; margin-right: auto;">

|示例：|
| -------- |
|地鐵路線（[芝加哥](https://www.transitchicago.com/assets/1/6/ctamap_Lsystem.pdf)）|
|郊區巴士到市區路線（[St. Albert](https://stalbert.ca/uploads/PDF-infosheets/RideGuide-201-207_Revised_Oct_2017.pdf) 或 [Edmonton](http://webdocs.edmonton.ca/transit /route_schedules_and_maps/future/RT039.pdf)) |
| CTA 布朗線（[CTA 網站](http://www.transitchicago.com/brownline/) 和 [TransitFeeds](https://transitfeeds.com/p/chicago-transit-authority/165/latest/route/Brn )) |

|字段名稱 |推薦 |
| --- | --- |
| `trips.trip_id` | “車輛往返”的全部範圍（參見插圖 [上圖](#lasso-route-fig)）包括從 A 到 B 再到 B 並返回 A。整個車輛往返可以表示為：<li>`trips.txt`中的__single__`trip_id`值/記錄</li><li>`trips.txt`中的__Multiple__`trip_id`值/記錄，連續旅行由`block_id`指示。</li>李> |
| `stop_times.stop_headsign` |沿 A-B 段的停靠點將雙向通過。 `stop_headsign` 便於區分行進方向。因此，建議為這些行程提供 `stop_headsign`。example_table: <table class="example"><thead> <tr><th>Examples:</th></tr></thead><tbody><tr ><td>“A 通過 B”</td></tr><tr><td>“A”</td></tr></tbody></table><table class="example"> <thead><tr><th>芝加哥交通局的<a href="http://www.transitchicago.com/purpleline/">紫線</a></th></tr></thead>< tbody><tr><td>“南行至環路”</td></tr><tr><td>“北行經環路”</td></tr><tr><td>“北行至林登"</td></tr></tbody></table><table class="example"><thead><tr><th>埃德蒙頓公交服務線路，此處<a href="http:// webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf">39</a></th></tr></thead><tbody><tr><td>“盧瑟福”</td ></tr><tr><td>《世紀公園》</td></tr></tbody></table>
| `trip.trip_headsign` |旅行頭標應該是旅行的全局描述，如時間表中顯示的那樣。可以是“Linden to Linden via Loop”（芝加哥示例），或“A to A via B”（通用示例）。 |

### 分支

一些路線可能包括分支。這些分支之間共享對齊和停止，但每個分支也服務於不同的停止和對齊部分。使用下面的進一步指南，可以通過路線名稱、頭標和行程短名稱來指示分支之間的關係。

<img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/branching.svg" width=250px style="display: block; margin-left: auto; margin-right: auto;">

|字段名稱 |推薦 |
| --- | --- |
|所有領域 |在命名支線時，建議遵循其他旅客信息資料。以下是兩種情況的描述和示例： |
| |如果時間表和路標表示兩條明確命名的路線（例如 1A 和 1B），則使用“route_short_name”和/或“route_long_name”字段在 GTFS 中顯示。示例：GoDurham Transit [路線 2、2A 和 2B](https://gotriangle.org/sites/default/files/brochure/godurham-route2-2a-2b_1.pdf) 在大部分路線中共享一個共同路線，但它們在幾個不同的方面有所不同。 <ul><li>Route 2 是核心服務，大部分時間運行。</li><li>Route 2 包括 Main Street 晚上、週日和節假日的偏離。</li><li>Route 2A 和 2B 運營週一至週六的白天時間。</li><li>路線 2B 在偏離共享路線的路線提供額外停靠點。</li></ul> |
| |如果機構提供的信息將分支描述為同名路線，則使用“trips.trip_headsign”、“stop_times.stop_headsign”和/或“trips.trip_short_name”字段。示例：GoTriangle [route 300](https://gotriangle.org/sites/default/files/route_300_v.1.19.pdf) 根據一天中的時間前往不同的位置。在通勤高峰時段，標準路線上增加了額外的支路，以容納進出城市的工人。 |

## 常見問題 (FAQ)

### 為什麼這些 GTFS 最佳實踐很重要？

GTFS 最佳實踐的目標是：

* 改善公共交通應用程序中的最終用戶客戶體驗
* 支持廣泛的數據互操作性，使軟件開發人員更容易部署和擴展應用程序、產品和服務
* 促進 GTFS 在各種應用類別中的使用（超出其最初對旅行計劃的關注）

如果沒有協調的 GTFS 最佳實踐，各種使用 GTFS 的應用程序可能會以不協調的方式建立需求和期望，這會導致不同的需求和特定於應用程序的數據集以及互操作性降低。在發布最佳實踐之前，對於格式正確的 GTFS 數據的構成存在更大的歧義和分歧。

### 它們是如何開發的？誰開發了它們？

這些最佳實踐由參與 GTFS 的 17 個組織組成的工作組制定，包括應用程序提供商和數據消費者、交通提供商以及廣泛參與 GTFS 的顧問。該工作組由 [落基山研究所] (http://www.rmi.org/mobility) 召集和推動。

工作組成員對每個最佳實踐進行投票。大多數最佳實踐均獲得一致投票通過。在少數情況下，大多數組織都批准了最佳實踐。

### 為什麼不直接更改 GTFS 參考？

好問題！檢查規範、數據使用和需求的過程確實觸發了規範的一些更改（參見 [GitHub 中的關閉拉取請求](https://github.com/google/transit/pulls?q=is%3Apr+is %3關閉))。規範參考修訂受到比最佳實踐更高的審查和評論標準。然而，仍然需要就一套明確的最佳實踐建議達成一致。

工作組預計一些 GTFS 最佳實踐最終將成為核心 GTFS 參考的一部分。

### GTFS 驗證器工具是否檢查是否符合這些最佳實踐？

目前沒有驗證器工具檢查是否符合所有最佳實踐。各種驗證器工具檢查是否符合其中一些最佳實踐。有關 GTFS 驗證器工具的列表，請參閱 [GTFS 驗證器](https://github.com/CUTR-at-USF/awesome-transit#gtfs-validators)。如果您編寫了引用這些最佳實踐的 GTFS 驗證器工具，請發送電子郵件至 [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org)。

### 我代表一個運輸機構。我可以採取哪些步驟來使我們的軟件服務提供商和供應商遵循這些最佳實踐？

請向您的供應商或軟件服務提供商推薦這些最佳實踐。我們建議在採購 GTFS 生產軟件時參考 GTFS 最佳實踐 URL 以及核心規範參考。

### 如果我發現 GTFS 數據饋送不符合這些最佳實踐，我應該怎麼做？

如果在它們存在，或在運輸機構或飼料生產商網站上查找聯繫信息。在將問題傳達給提要生產者時，請鏈接到正在討論的特定 GTFS 最佳實踐。 （請參閱 [“鏈接到此文檔”](#linking-to-this-document)）。

### 我想建議對最佳實踐進行修改/添加。我該怎麼做呢？

發送電子郵件至 [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) 或在 [GitHub GTFS 最佳實踐倉庫](https://github.com/rocky-mountain-institute/gtfs-) 中打開問題或拉取請求最佳實踐）。

###我如何參與？

電子郵件 [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org)。

## 關於本文檔

### 目標

維護 GTFS 最佳實踐的目標是：

* 支持公交數據更大的互操作性
* 改善公共交通應用程序中的最終用戶客戶體驗
* 讓軟件開發人員更輕鬆地部署和擴展應用程序、產品和服務
* 促進 GTFS 在各種應用類別中的使用（超出其最初對旅行計劃的關注）

### 如何提議或修改已發布的 GTFS 最佳實踐

GTFS 應用程序和實踐不斷發展，因此本文檔可能需要不時修改。要對本文檔提出修改建議，請在 [GTFS 最佳實踐 GitHub 存儲庫](https://github.com/MobilityData/gtfs-best-practices) 中打開一個拉取請求並倡導修改。您可以將任何評論通過電子郵件發送至 [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org)。

### 鏈接到此文檔

請在此處鏈接，以便為飼料生產商提供正確形成 GTFS 數據的指導。每個單獨的推薦都有一個錨鏈接。單擊建議以獲取頁內錨鏈接的 URL。

如果使用 GTFS 的應用程序對 GTFS 數據實踐提出了此處未描述的要求或建議，則建議發布包含這些要求或建議的文檔以補充這些常見的最佳實踐。

### GTFS 最佳實踐工作組

GTFS 最佳實踐工作組由 [落基山研究所](http://rmi.org/) 於 2016-17 年召集，由公共交通提供商、GTFS 消費應用程序的開發人員、顧問和學術組織組成，以定義常見的GTFS 數據的實踐和期望。
該工作組的成員包括：

* [Cambridge Systematics](https://www.camsys.com/)
* [Capital Metro](https://www.capmetro.org/)
* [Center for Urban Transportation Research at University of South Florida](https://www.cutr.usf.edu/)
* [Conveyal](http://conveyal.com/)
* [Google](https://www.google.com/)
* [IBI Group](http://www.ibigroup.com/)
* [Mapzen](https://mapzen.com/)
* [Microsoft](https://www.microsoft.com/)
* [Moovel](https://www.moovel.com/)
* [Oregon Department of Transportation](http://www.oregon.gov/odot/)
* [Swiftly](https://goswift.ly/)
* [Transit](https://transitapp.com/)
* [Trillium](http://trilliumtransit.com/)
* [TriMet](https://trimet.org/)
* [World Bank](http://www.worldbank.org/)

今天，該文檔由 [MobilityData](http://mobilitydata.org/) 維護。