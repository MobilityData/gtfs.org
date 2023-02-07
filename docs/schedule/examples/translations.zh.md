---
search:
  exclude: true
---

# 翻译

<hr/>

## 翻译站名

一些交通供应商提供多种语言的服务--其中之一是比利时国家铁路公司（当地称为NMBS/SNCB，荷兰语为Nationale Maatschappij der Belgische Spoorwegen，法语为 Société nationale des chemins de fer belges）。该公司提供多种语言的站名，并根据用户的语言和位置设置来显示。

NMBS/SNCB公布的GTFS数据为法语，如下图文件所示。

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr

由于机构语言被设置为法语，车站名称在[stops.txt](../../reference/#stopstxt)中以法语列出。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
    S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
    S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,

然后，文件[translations.txt](../../reference/#translationstxt)被用来将车站名称从默认的机构语言（本例中为法语）翻译成荷兰语。

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,record_id,language,translation
    stops,stop_name,S8815040,nl,Brussel-West

- 在这个例子中，[stops.txt](../../reference/#stopstxt)中的车站名称被翻译，[stops.txt](../../reference/#stopstxt)中的记录由一个`stop_id`来识别。因此。
  - `stops`名列在表名下（参照[stops.txt](../../reference/#stopstxt)）。
  - `stop_name`列在`field_name`下（因为站名将被翻译）。
  - 将被翻译成法语的站名的`stop_id`被列在`record_id`下（在这个例子中，Bruxelles-Ouest的`stop_id`）。
- 该名称被翻译成荷兰语（nl）。
- 最后，翻译后的名称被列在Translation下

在GTFS中还有另一种翻译站名的方法，即使用[translations.txt](../../reference/#translationstxt)文件，其中使用`field_value`而不是`record_id`。在这种情况下，站名被用来从[stops.txt](../../reference/#stopstxt)中找到要翻译的记录。

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,field_value,language,translation`
    stops,stop_name,Bruxelles-Ouest,nl,Brussel-West

[示例来源](http://gtfs.irail.be/mivb/mivb-gtfs.zip)
