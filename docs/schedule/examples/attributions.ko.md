---
search:
  exclude: true
---

# 데이터세트 속성

<hr/>

## 집계된 데이터 생산자에 대한 속성 데이터GTFS 데이터세트

약간GTFS 데이터 세트에는 동일한 관할권에 서비스를 제공하는 다양한 서비스 제공업체와 같은 여러 소스에서 집계된 데이터가 포함됩니다. 경우에 따라 에 나열된 기관을 분류해야 합니다.[agency.txt](../../reference/#agencytxt) 생산자, 운영자 또는 당국으로서.

예를 들어 Rejseplanen은 덴마크의 철도 및 버스 서비스 검색 엔진입니다. 회사는GTFS 아래와 같이 여러 기관 및 공급자의 데이터가 포함된 데이터 세트[agency.txt](../../reference/#agencytxt) .

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
    204,FYNBUS,https://fynbus.dk,Europe/Berlin,
    206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
    276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,

Rejseplanen을 데이터 생산자로 지정하기 위해 파일 [attributions.txt](../../reference/#attributionstxt) 속성이 사용되는 경우id 이름과 함께 정의됩니다.url 조직의. `is_producer` , `is_operator` 및 `is_authority` 필드는 아래와 같이 Rejseplanen을 분류하는 데 사용됩니다.

attributions.txt

    attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
    rp,Rejseplanen,https://www.rejseplanen.dk,1,,

[정보예제 소스](http://www.rejseplanen.info/labs/GTFS.zip)
