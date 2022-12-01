---
search:
  exclude: true
---

# 翻譯

<hr/>

## 翻譯站名

一些交通提供商提供多種語言的服務 - 其中之一是比利時國家鐵路公司（當地稱為 NMBS/SNCB，荷蘭語為 Nationale Maatschappij der Belgische Spoorwegen，法語為 Société nationale des chemins de fer belges）。該公司提供多種語言的站名，並根據用戶的語言和位置設置顯示。

NMBS/SNCB 發布GTFS法語數據如下面的文件所示：

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr

由於代理語言設置為法語，因此站點名稱以法語列出[stops.txt](../../reference/#stopstxt) .

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
    S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
    S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,

文件[translations.txt](../../reference/#translationstxt)然後用於將站名從默認機構語言（在本例中為法語）翻譯為荷蘭語。

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,record_id,language,translation
    stops,stop_name,S8815040,nl,Brussel-West

- 在這個例子中，站名來自[stops.txt](../../reference/#stopstxt)被翻譯，並記錄在[stops.txt](../../reference/#stopstxt)由一個標識`stop_id` .所以：
  - `stops`點列在表格名稱下（參考[stops.txt](../../reference/#stopstxt) )
  - `stop_name`列在`field_name` （因為站名會被翻譯）
  - 這`stop_id`要從法語翻譯的站名列在下面`record_id` （在這種情況下，`stop_id`西布魯塞爾）
- 該名稱被翻譯成荷蘭語 (nl)
- 最後，翻譯後的名稱列在Translation

還有另一種翻譯名字的方法GTFS使用文件[translations.txt](../../reference/#translationstxt) , 其中場`field_value`被用來代替`record_id` .在這種情況下，站名用於查找要翻譯的記錄[stops.txt](../../reference/#stopstxt) .

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,field_value,language,translation`
    stops,stop_name,Bruxelles-Ouest,nl,Brussel-West

[示例源](http://gtfs.irail.be/mivb/mivb-gtfs.zip)
