# Fares V2

<hr/>

Fares V2是一个GTFS扩展项目，旨在解决Fares V1的限制。这个扩展项目正在迭代中被采用。下面的例子概述了如何对基本概念进行建模，包括票价产品以及乘客如何使用他们的票价进行换乘。[点击这里](/extensions/fares-v2/)查看更多关于[ Fares V2扩展项目](/extensions/fares-v2/)的信息。

在此期间，生产者可以在同一数据集中实施Fares V2和实施Fares V1，因为这两者之间不存在技术冲突。消费者可以选择独立使用哪一个实现。随着Fares V2的采用和充分认可，Fares V1在未来可能会被废弃。

## 定义一个交通票价

有几种支付票价的方式来使用马里兰交通管理局的系统。[有四种类型的常规满的票选择：](https://www.mta.maryland.gov/regular-fares)

- 单程票，票价为2.00美元
- 价格为4.60美元的日票
- 22美元的周票
- 月票价格为77美元

公交车票或票价在GTFS中被称为票价产品。它们可以用[fare_products.txt](../../reference/#fare_productstxt)文件来描述。每个条目都对应着一个特定的票价。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id  | fare_product_name  | amount  | currency  |
|------------------------|--------------------|---|---|
| core_local_oneway_fare | One Way Full Fare |  2.00 | USD  |
| core_local_1_day_fare  | 1-Day Pass - Core Service  | 4.60  | USD   |
| core_local_31_day_fare | 31-Day Pass - Core Service  | 77.00  | USD  |
| core_local_7_day_fare  | 7-Day Pass - Core Service |  22.00 | USD  |

<sup>[下载马里兰交通管理局本地公交车GTFS资料](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## 为单程旅行建立规则

在GTFS中，一个票价段对应的是乘客不在不同模式、路线、网络或机构之间转车的行程。在马里兰交通管理局的资料中，单次票价允许乘客在巴尔的摩连线巴士、轻轨连线和地铁连线的`core`网络中的任何一对车站和地铁站内旅行。

路段组定义了在一个网络内从一个起点到一个目的地的行程（或者如果区域ID对应分组的站点，则是一组起点到一组目的地）。下面的文件描述了在马里兰交通管理局的核心网络内任何地方旅行的规则。每条规则都对应于 ["定义公交票价 "例子](#_1)中的一种常规票价产品。

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

|  leg_group_id |  network_id | fare_product_id  |
|---|---|---|
| core_local_one_way_trip | core  |  core_local_oneway_fare |
| core_local_one_way_trip | core  |  core_local_1_day_fare |
| core_local_one_way_trip | core  |  core_local_31_day_fare |
| core_local_one_way_trip | core  |  core_local_7_day_fare |

<sup>[下载马里兰交通管理局本地公交车GTFS资料](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## 为换乘建立规则

购买单程票的乘客在乘坐BaltimoreLink当地公交车、Metro SubwayLink或轻轨Link时，有90分钟的换乘时间。这意味着他们可以在90分钟的时间范围内，在当地公交车、地铁和轻轨之间无限次换乘。

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id       | to_leg_group_id  | duration_limit | duration_limit_type | fare_transfer_type | transfer_count |
|-------------------------|---|----------------|-------------------|---------------------|----------------|
| core_local_one_way_trip | core_local_one_way_trip  | 5400           | 1                 | 0                   | -1             |

上面的文件在GTFS中用以下字段表示。

- 可以在单程的腿之间进行转车（`core_local_one_way_trip`）。
- `transfer_count`被设置为`-1`，因为对允许的转账次数没有限制。
- `duration_limit`被设置为`5400`秒，相当于90分钟。
- `duration_limit_type`被设置为`1`，因为换乘时间从乘客在`core_local_one_way_trip`票价段的任何路线上出发时开始，到他们在另一个票价段上出发时结束。
- `fare_transfer_type`设置为`0`，因为乘客只需支付第一笔票价。在90分钟的窗口内转车，没有转车费或第二次车费。因此，成本可以被模拟为第一笔车费和转车费的总和。
- `transfer_count`被设置为`-1`，因为乘客可以在90分钟`duration_limit`窗口内无限次的转移。

在定义了票价，创建了适当的`fare_leg_rule`，并定义了`fare_transfer_rule`后，你可以看到$2.00美元的`core_local_oneway_fare`出现在行程计划表中。下面是一个来自Transit的例子：

<div class="flex-photos">
    <img src="../../../assets/transit-fares-mdot.png" alt="fare of $2 USD">
</img></div>

<sup>[下载马里兰交通管理局本地公交车GTFS资料](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

## 描述同一票价区的服务地点

一些公交机构采用基于区域的票价结构。票价区是指与不同票价相关的地理区域的划分。在湾区的BART系统中，票价根据出发地和目的地而不同[（BART票价差异）](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf)，公交乘客需要知道正确的票价。票价区域可以用[stops_areas.txt](../../reference/#stops_areastxt)文件来描述，该文件将[stops.txt](../../reference/#stopstxt)中的站点分配给[areas.txt](../../reference/#areastxt)。

首先，在[areas.txt](../../reference/#areastxt)中确定区域。如果没有区域名称，将`area_name`留空是可以接受的。在下表中，有三个`area_id`-`ASHB`,`GLEN`, 和`OAKL`。

[**areas.txt**](../../reference/#areastxt)

| area_id | area_name |
|---------|-----------|
| ASHB    |           |
| GLEN    |           | 
| OAKL    |           | 

之后，使用[stops.txt](../../reference/#stopstxt)文件中的`stop_id`，将站点组合到其各自确定的区域（票价区）。

接下来，将`stop_id`与每个`area_id`分组。在BART的例子中，每个区域只包含一个`stop_id`。例如，只有`ASHB`站（Ashby站）被包括在`ASHB`区域内。然而，如果一个区域包括多个站点，则应列出多个`stop_id`。

[**stops_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
|---------|---------|
| ASHB    | ASHB    |
| GLEN    | GLEN    | 
| OAKL    | OAKL    | 

在`fare_leg_rules.txt` 中，可以根据不同的出发和到达区域确定不同的票价产品。例如，第一个条目显示：

- 出发地区是`ASHB`
- 到达地区是`GLEN`
- 出发/到达地区的票价产品是`BA:matrix:ASHB-GLEN`

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id |to_area_id|fare_product_id|
|--------------|--------------|------------|---------------|
|   BA    | ASHB         | GLEN | BA:matrix:ASHB-GLEN |
|     BA         | ASHB         | OAKL | BA:matrix:ASHB-OAKL |

票价在`fare_products.txt` 中确定。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name| amount | currency |
|---------------------|-----------|--------|----------|
| BA:matrix:ASHB-GLEN |  generated  | 4.75   | USD      |
| BA:matrix:ASHB-OAKL  |  generated  | 9.45   | USD       |

<sup><a href="https://511.org/open-data/transit" target="_blank">请看旧金山湾区地区的资料</a></sup>

<hr/>

## 描述接受何种票价媒介

旧金山Muni的乘客可以使用几种不同类型的票价媒介来支付他们的行程和验证他们的票价：

- 使用[Clipper卡](https://www.clippercard.com/ClipperWeb/)，湾区的交通卡
- 使用[Munimobile应用程序](https://www.sfmta.com/getting-around/muni/fares/munimobile)
- 用现金支付车费

这些验证方法在GTFSFares V2中被称为`fare_media`，可以使用`fare_media.txt`进行描述。

下面是一个来自[旧金山湾区区域馈送](https://511.org/open-data/transit)的例子片段，可以用511 SF Bay API访问。

`Clipper`被描述为实体交通卡，`fare_media_type=2`。`SFMTA Munimobile`被描述为一个移动应用程序，`fare_media_type=2`。`Cash`没有票价媒体，因为它是直接给司机的，没有票。因此，`Cash`是`fare_media_type=0`。

想把实体车票描述为票价媒体类型的制作者可以使用[满的 Fares V2提案](https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd)中的实验性`fare_media_type=1`选项。

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| munimobile    | SFMTA MuniMobile | 4               |
| cash           | Cash             | 0               |

<sup><a href="https://511.org/open-data/transit" target="_blank">请看旧金山湾区地区的资料</a></sup>

## 根据票价媒体定义价格差异

牟尼的票价是根据乘客使用的票价媒体而有所不同。这个例子将涵盖成人本地票价在使用现金或Clipper卡时的变化。用现金支付的成人本地票价为3美元，而用Clipper卡支付的相同票价为 2.5美元，少了50美分。

下面的每个条目都描述了一种票价媒体。

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| cash           | Cash             | 0               |

下面的`fare_products.txt`文件片段显示了`Muni single local fare`产品的金额是如何根据乘客使用的票价媒体而变化的。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | amount | currency | fare_media_id |
|---------------|------------------|-------|--- |---------------|
| SF:local:single | Muni single local fare | 3     | USD | cash |
| SF:local:single | Muni single local fare  | 2.5   |USD | clipper |

在苹果地图中，乘客可以看到他们的票价如何变化。你可以在 "Board the Muni J Church train"指令下比较票价：

<div class="flex-photos">
    <img src="../../../assets/apple-muni-cash.jpg" alt="cash fare of $3 USD">
    <img src="../../../assets/apple-muni-clipper.jpg" alt="Clipper card fare of $2.50 USD">
</div>

<sup><a href="https://511.org/open-data/transit" target="_blank">请看旧金山湾区地区的资料</a></sup>

## 描述一个非接触式票价媒体选项

[圣巴巴拉县北部的清洁空气快车接受](https://vimeo.com/539436401)信用卡、谷歌支付和苹果支付的[非接触式支付](https://vimeo.com/539436401)。

在《清洁空气快车》中，有一个`tap_to_ride`票价媒体，`fare_media_type=3`，因为它是一个cEMV（非接触式Europay、Mastercard和Visa）选项。

| fare_media_id | fare_media_name | fare_media_type |
|---------------|-----------------|-----------------|
| tap_to_ride   | Tap to Ride   | 3  |

下图所示的单次乘车票价产品有`cash`和`tap-to-ride`票价媒体选项。当单次乘车用`tap-to-ride`转乘票价媒介支付时，会便宜一美元。

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | fare_media_id | amount | currency |
|---------------|------------------|---------------|--------|----------|
| single-ride | Single Ride | tap_to_ride       | 6      | USD      |
| single-ride | Single Ride |       | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">下载清洁空气快车的资料</a></sup>
