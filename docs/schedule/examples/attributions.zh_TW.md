<a class="pencil-link" href="https://github.com/MobilityData/<glossary variable=" GTFS"="">GTFS</a> <a class="pencil-link" href="https://github.com/MobilityData/<glossary variable=" GTFS"="">.org/edit/main/docs/schedule/examples/attributions.md&quot; title=&quot;編輯此頁面&quot; target=&quot;_blank&quot;&gt;</a> <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"/></svg>

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
