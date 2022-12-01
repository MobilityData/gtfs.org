---
search:
  exclude: true
---

# 数据集的属性

<hr/>

## 在一个聚合的GTFS数据集中，将数据归属于一个数据生产者

一些GTFS数据集包含从多个来源汇总的数据，如服务于同一管辖区的不同服务提供商。在某些情况下，有必要将[agency.txt](../../reference/#agencytxt)中列出的机构分类为生产者、经营者或当局。

例如，Rejseplanen是丹麦的一个铁路和公共汽车服务搜索引擎。该公司发布了一个GTFS数据集，其中包含来自多个机构和供应商的数据，如下图[agency.txt](../../reference/#agencytxt)txt所示。

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
    204,FYNBUS,https://fynbus.dk,Europe/Berlin,
    206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
    276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,

为了将Rejseplanen归为数据生产者，使用了[attributions.txt](../../reference/#attributionstxt)文件，其中定义了一个归属id，以及该组织的名称和url。`is_producer`、`is_operator`和`is_authority`等字段被用来对Rejseplanen进行分类，如下图所示。

[**attributions.txt**](../../reference/#attributionstxt)

    attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
    rp,Rejseplanen,https://www.rejseplanen.dk,1,,

[示例来源](http://www.rejseplanen.info/labs/GTFS.zip)
