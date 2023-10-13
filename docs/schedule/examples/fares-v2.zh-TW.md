# Fares V2

<hr/>

Fares V2是一個GTFS旨在解決以下局限性的擴展項目Fares V1 .這個擴展項目正在迭代中被採用。以下示例概述瞭如何對基本概念建模，包括票價產品以及乘客如何使用票價進行換乘。查看[有關的更多信息Fares V2擴展項目在這裡](/extensions/fares-v2/)。

在此期間，生產者可以實施Fares V2隨著實施Fares V1在同一數據集中，兩者之間不存在技術衝突。消費者將可以選擇獨立於另一個實現消費。通過採用和充分認可Fares V2 ,Fares V1將來可能會被棄用。

## 定義過境票價

有多種方式可以使用馬里蘭州交通管理局系統支付車費。[常規有四種類型滿的票價選項：](https://www.mta.maryland.gov/regular-fares)

- 單程票 2.00 美元
- 單日通行證，價格為 4.60 美元
- 22 美元的周票
- 價值 77 美元的月票

中轉車票或票價被稱為票價產品GTFS .它們可以用[fare_products.txt](../../reference/#fare_productstxt)文件。每個條目對應一個特定的票價。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id  | fare_product_name  | amount  | currency  |
|------------------------|--------------------|---|---|
| core_local_oneway_fare | One Way Full Fare |  2.00 | USD  |
| core_local_1_day_fare  | 1-Day Pass - Core Service  | 4.60  | USD   |
| core_local_31_day_fare | 31-Day Pass - Core Service  | 77.00  | USD  |
| core_local_7_day_fare  | 7-Day Pass - Core Service |  22.00 | USD  |

<sup>[下載馬里蘭交通管理局本地巴士GTFS餵養](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## 為單程旅行製定規則

在GTFS ，一個票價段對應於乘客在不同模式、路線、網絡或機構之間沒有換乘的情況下進行的一次旅行。在馬里蘭州交通管理局的提要中，單一票價允許乘客在 BaltimoreLink 巴士、Light RailLink 和 Metro SubwayLink 路線`core`網絡內的任何一對站點和地鐵站內旅行。

航段組定義網絡內從起點到終點的行程（如果區域 ID 對應於分組停靠點，則定義一組起點到一組終點）。以下文件描述了在馬里蘭州交通管理局核心網絡內任何地方旅行的規則。每個規則對應於[定義過境票價示例](#_1)中的一種常規票價產品。

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

|  leg_group_id |  network_id | fare_product_id  |
|---|---|---|
| core_local_one_way_trip | core  |  core_local_oneway_fare |
| core_local_one_way_trip | core  |  core_local_1_day_fare |
| core_local_one_way_trip | core  |  core_local_31_day_fare |
| core_local_one_way_trip | core  |  core_local_7_day_fare |

<sup>[下載馬里蘭交通管理局本地巴士GTFS餵養](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## 創建傳輸規則

購買單程票價的騎手乘坐 BaltimoreLink 本地巴士、Metro SubwayLink 或 Light RailLink 需要 90 分鐘的換乘時間。這意味著他們可以在 90 分鐘的時間內無限次地在當地公交車、地鐵和輕軌之間換乘。

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id        | to_leg_group_id          | duration_limit | duration_limit_type | fare_transfer_type | transfer_count |
| ------------------------ | ------------------------ | -------------- | ------------------- | ------------------ | -------------- |
|  core_local_one_way_trip |  core_local_one_way_trip | 5400           | 1個                  |  0                 |  -1            |

上面的文件表示這個GTFS具有以下字段：

- 可以往返於單程行程 ( `core_local_one_way_trip` )
- 這`transfer_count`設置為`-1`因為允許的傳輸次數沒有限制
- 這`duration_limit`設置為`5400`秒，相當於90分鐘
- 這`duration_limit_type`設置為`1` ，因為換乘時間從乘客從`core_local_one_way_trip`票價段中的任何路線出發開始，到他們從不同票價段出發時結束。
- `fare_transfer_type`設置為`0` ，因為乘客只需支付第一筆車費。在 90 分鐘窗口內轉機不收取轉機費或二次票價。因此，成本可以建模為第一筆票價和轉乘費的總和。
- 這`transfer_count`設置為`-1` ，因為騎手可以在 90 分鐘內無限次轉移`duration_limit`窗戶。

定義票價、創建適當的`fare_leg_rule`並定義`fare_transfer_rule`後，您可以在旅行計劃器中看到 \$2.00 USD `core_local_oneway_fare` 。這是來自 Transit 的示例：

<div class="flex-photos"><img src="../../../assets/transit-fares-mdot.png" alt="票價 2 美元"/></div>

<sup>[下載馬里蘭交通管理局本地巴士GTFS餵養](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

## 描述同一票價區內的服務地點

一些運輸機構採用基於區域的票價結構。票價區是與不同票價相關聯的劃分地理區域。在灣區的 BART 系統中，票價因出發地和目的地而異[（BART 票價差異）](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf) ，過境乘客需要了解正確的票價。票價區域可以使用[stops_areas.txt](../../reference/#stops_areastxt)文件來描述，該文件指定停靠點[stops.txt](../../reference/#stopstxt)到[areas.txt](../../reference/#areastxt).

首先，確定區域[areas.txt](../../reference/#areastxt).如果沒有區域名稱，可以將`area_name`留空。在下表中，有三`area_id` - `ASHB` 、 `GLEN`和`OAKL` 。

[**areas.txt**](../../reference/#areastxt)

| area_id | area_name |
|---------|-----------|
| ASHB    |           |
| GLEN    |           | 
| OAKL    |           | 

之後，使用`stop_id`來自[stops.txt](../../reference/#stopstxt) file, group stops 一起到各自的標識區域（fare zone）。

接下來，分組`stop_id`每一個`area_id` .在 BART 示例中，每個區域僅包含 1`stop_id` .例如，區域`ASHB`中只包含停靠點`ASHB` （Ashby Station）。但是，如果一個區域包含多個停靠點，則多個`stop_id`應列出。

[**stops_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
|---------|---------|
| ASHB    | ASHB    |
| GLEN    | GLEN    | 
| OAKL    | OAKL    | 

在`fare_leg_rules.txt`，可以根據不同的出發區和到達區識別出不同的票價產品。例如，第一個條目顯示：

- 出發區是`ASHB`
- 到達區域為`GLEN`
- 出發/到達區票價產品為`BA:matrix:ASHB-GLEN`

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id|to_area_id|fare_product_id|
|--------------|-----------|------------|---------------|
|   BA    |  ASHB   | GLEN | BA:matrix:ASHB-GLEN |
|     BA         |  ASKB   | OAKL | BA:matrix:ASHB-OAKL |

票價在`fare_products.txt` .

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name| amount | currency |
|---------------------|-----------|--------|----------|
| BA:matrix:ASHB-GLEN |  generated  | 4.75   | USD      |
| BA:matrix:ASHB-OAKL  |  generated  | 9.45   | USD       |

<sup><a href="https://511.org/open-data/transit" target="_blank">查看舊金山灣區區域提要</a></sup>

<hr/>

## 描述接受什麼票價媒體

San Francisco Muni 乘客可以使用幾種不同類型的票價媒體來支付他們的行程並驗證他們的票價：

- 使用[Clipper 卡](https://www.clippercard.com/ClipperWeb/)，灣區的交通卡
- 使用[Munimobile 應用程序](https://www.sfmta.com/getting-around/muni/fares/munimobile)
- 以現金支付車費

這些`fare_media`方法在GTFS-Fares V2並且可以使用`fare_media.txt`進行描述。

以下是來自[舊金山灣區區域提要的](https://511.org/open-data/transit)示例片段，可以使用 511 SF Bay API 訪問。

`Clipper`被描述為`fare_media_type=2`的物理交通卡。 `SFMTA Munimobile`被描述為`fare_media_type=2`的移動應用程序。`Cash`沒有票價媒介，因為它是在沒有車票的情況下直接給司機的。結果， `Cash`為`fare_media_type=0` 。

想要將實體票描述為票價媒體類型的製作人可以使用實驗性的`fare_media_type=1`選項，該選項位於滿的[Fares V2 建議](https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd)。


[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| munimobile    | SFMTA MuniMobile | 4               |
| cash           | Cash             | 0               |

<sup><a href="https://511.org/open-data/transit" target="_blank">查看舊金山灣區區域提要</a></sup>

## 根據票價媒體定義價格差異

Muni 的票價根據騎手使用的票價媒體而有所不同。此示例將介紹使用現金或 Clipper 卡時成人當地票價的變化情況。使用現金支付的成人當地票價為 3 美元，使用 Clipper 卡支付的相同票價為2.50，少 50 美分。

下面的每個條目都描述了一種票價媒體。

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| cash           | Cash             | 0               |

這`fare_products.txt`下面的文件片段顯示了`Muni single local fare`產品的數量如何根據乘客使用的票價媒體而變化。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | amount | currency | fare_media_id |
|---------------|------------------|-------|--- |---------------|
| SF:local:single | Muni single local fare | 3     | USD | cash |
| SF:local:single | Muni single local fare  | 2.5   |USD | clipper |

在 Apple Maps 中，乘客可以看到他們的票價如何變化。您可以根據“Board the Muni J Church train”的說明比較票價：

<div class="flex-photos"><img src="../../../assets/apple-muni-cash.jpg" alt="現金票價 3 美元"><img src="../../../assets/apple-muni-clipper.jpg" alt="Clipper 卡票價為 2.50 美元"/></div>

<sup><a href="https://511.org/open-data/transit" target="_blank">查看舊金山灣區區域提要</a></sup>

## 描述非接觸式票價媒體選項

[聖巴巴拉縣北部的 Clean Air Express 接受信用卡、Google Pay 和 Apple Pay 的非接觸式支付](https://vimeo.com/539436401)。

在 Clean Air Express 提要中，有一個`fare_media_type=3` `tap_to_ride`票價媒體，因為它是 cEMV（非接觸式 Europay、Mastercard 和 Visa）選項。

|  fare_media_id |  fare_media_name |  fare_media_type |
| -------------- | ---------------- | ---------------- |
| 點擊騎行           | 點擊騎              | 3個               |

下圖所示的單次乘車票價產品具有`cash`和`tap-to-ride`票價媒體選項。如果單次乘車是通過`tap-to-ride`票價媒體支付的，價格會便宜 1 美元。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | fare_media_id | amount | currency |
|---------------|------------------|---------------|--------|----------|
| single-ride | Single Ride | tap_to_ride       | 6      | USD      |
| single-ride | Single Ride |       | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">下載 Clean Air Express 提要</a></sup>
