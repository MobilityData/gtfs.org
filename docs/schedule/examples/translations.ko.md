---
search:
  exclude: true
---

# 번역

<hr/>

## 역 이름 번역

일부 대중교통 제공업체는 여러 언어로 서비스를 제공합니다. 그 중 하나는 벨기에 국립 철도 회사(네덜란드어로 Nationale Maatschappij der Belgische Spoorwegen 또는 프랑스어로 Société nationale des chemins de fer belges의 경우 현지에서 NMBS/SNCB로 알려짐)입니다. 회사는 여러 언어로 스테이션 이름을 제공하며 사용자의 언어 및 위치 설정에 따라 표시됩니다.

NMBS/SNCB는 다음을 게시합니다.GTFS 아래 파일과 같이 프랑스어로 된 데이터:

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr

기관 언어가 프랑스어로 설정되어 있으므로 스테이션 이름은 프랑스어로 나열됩니다.[stops.txt](../../reference/#stopstxt) には .

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
    S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
    S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,

파일[translations.txt](../../reference/#translationstxt) 그런 다음 스테이션 이름을 기본 에이전시 언어(이 경우 프랑스어)에서 네덜란드어로 번역하는 데 사용됩니다.

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,record_id,language,translation
    stops,stop_name,S8815040,nl,Brussel-West

- 이 예에서 스테이션 이름은[stops.txt](../../reference/#stopstxt) 번역되고 기록이[stops.txt](../../reference/#stopstxt) 에 의해 식별됩니다`stop_id` . 그러므로:
  - `stops` 은 테이블 이름 아래에 나열됩니다(참조:[stops.txt](../../reference/#stopstxt) を)
  - `stop_name` 이 아래에 나열됩니다.`field_name` (역 이름이 번역되기 때문에)
  - 그만큼`stop_id` 프랑스어에서 번역할 역 이름은 아래에 나열되어 있습니다.`record_id` (이 경우,`stop_id` Bruxelles-Ouest의 경우)
- 이름은 네덜란드어로 번역됩니다(nl).
- 마지막으로 번역된 이름이 아래에 나열됩니다 번역.

이름을 번역하는 또 다른 방법이 있습니다.GTFS 파일을 사용하여[translations.txt](../../reference/#translationstxt) , という여기서 필드`field_value` 대신 사용됩니다`record_id` . 이 경우 스테이션 이름은 번역할 레코드를 찾는 데 사용됩니다.[stops.txt](../../reference/#stopstxt) .

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,field_value,language,translation`
    stops,stop_name,Bruxelles-Ouest,nl,Brussel-West

[예제 소스](http://gtfs.irail.be/mivb/mivb-gtfs.zip)
