---
search:
  exclude: true
---

# 數據集屬性

<hr/>

## 將數據歸因於聚合中的數據生產者GTFS數據集

一些GTFS數據集包含從多個來源聚合的數據，例如服務於同一管轄區的不同服務提供商。在某些情況下，有必要對列出的機構進行分類[agency.txt](../../reference/#agencytxt)作為生產者、經營者或當局。

例如，Rejseplanen 是丹麥鐵路和公共汽車服務的搜索引擎。公司發布了一個GTFS包含來自多個機構和提供商的數據的數據集，如下所示[agency.txt](../../reference/#agencytxt) .

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
    204,FYNBUS,https://fynbus.dk,Europe/Berlin,
    206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
    276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,

為了將 Rejseplanen 歸為數據生產者，該文件[attributions.txt](../../reference/#attributionstxt)被使用，其中一個屬性id在名稱旁邊定義url組織的。字段`is_producer` 、 `is_operator`和`is_authority`用於對 Rejseplanen 進行分類，如下所示：

[**attributions.txt**](../../reference/#attributionstxt)

    attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
    rp,Rejseplanen,https://www.rejseplanen.dk,1,,

[示例源](http://www.rejseplanen.info/labs/GTFS.zip)
