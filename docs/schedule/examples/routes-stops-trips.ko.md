---
search:
  exclude: true
---

# 경로, 정류장 및 여행

<hr/>

## 노선

경로는 대중 교통 네트워크의 지리적 범위를 설명하므로 고정 경로 대중 교통 운영의 핵심입니다. \~ 안에GTFS , 경로 정의는 대중교통 기관의 운영을 설명하는 첫 번째 단계입니다.

첫 번째 단계는 파일에 표시된 대로 기관 정보를 추가하는 것입니다.[agency.txt](../../reference/#agencytxt) 아래에. 이 파일에는 기관에 대한 높은 수준의 정보가 포함되어 있습니다.

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
    CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000

Calgary Transit은 AB 캘거리에서 LRT, BRT, 일반 버스 서비스, 보조 대중 교통 및 주문형 대중 교통을 운영합니다. 이 예에서는 두 개의 경로가 정의됩니다. 첫 번째는 버스이고 두 번째는 LRT입니다. 파일 사용[routes.txt](../../reference/#routestxt) , という각 경로에는 고유한id , 사람이 쉽게 읽을 수 있도록 짧은 이름과 긴 이름이 있습니다.

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
    CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
    CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff

다섯 번째 필드(`route_type` )는 경로 유형을 구분하는 데 사용됩니다.

- 첫 번째는 버스이므로 `route_type=3`
- 두 번째는 LRT이므로 `route_type=0`
- 다음에 대한 전체 값 목록route_type [routes.txt](../../reference/#routestxt) 에서 찾을 수 있습니다

나머지 필드에는 다음과 같은 추가 정보가 포함됩니다.url 지도에 서비스를 나타내기 위해 경로별 및 기관별 색상을 지정합니다.

<hr/>

## 정류장

\~ 안에GTFS , 정류장 및 역은 파일을 사용하여 설명됩니다.[stops.txt](../../reference/#stopstxt) , 아래에서 버스 정류장은 첫 번째 레코드에 정의되고 경전철 역은 두 번째 레코드에 정의됩니다.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
    8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
    6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,0

- `stop_id` 고유 식별자입니다.
- `stop_code` 및 `stop_name` 은 일반적으로 라이더 쪽 정보를 포함합니다.
- 정확한 위치는 좌표( `stop_lat` 및 `stop_lon` )를 사용하여 제공됩니다.
- 여섯 번째 필드( `location_type` )는 정류장과 정류장을 구분하는 데 사용됩니다.
- 첫 번째 레코드는 버스 정류장에 해당하므로 `location_type=0`
- 두 번째 레코드는 스테이션에 해당하므로 `location_type=1`
- `location_type` 에 대한 전체 값 목록은 [stops.txt](../../reference/stopstxt) 에서 찾을 수 있습니다.

<hr/>

## 여행

기관의 경로를 설명한 후 이제 각 경로에서 제공되는 여행을 설명할 수 있습니다.

첫째, 서비스 범위는 다음을 사용하여 정의해야 합니다.[calendar.txt](../../reference/#calendartxt) .

[**calendar.txt**](../../reference/#calendartxt)

    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    weekend_service,0,0,0,0,0,1,1,20220623,20220903

여기서는 토요일과 일요일에만 실행되는 서비스를 설명하므로 해당 요일의 필드는 1로 채워지고 나머지 요일의 필드는 0으로 채워집니다. 이 서비스는 필드 아래에 표시된 대로 2022년 6월 23일부터 2022년 9월 3일까지 실행됩니다.start_date 그리고 `end_date` .

이 예에서 파일[trips.txt](../../reference/#tripstxt) 위에서 설명한 MAX Orange 노선에서 제공하는 3개의 주말 여행을 설명합니다.

[**trips.txt**](../../reference/#tripstxt)

    route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
    303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
    303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
    303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027

- 그만큼`route_id` \~에서[routes.txt](../../reference/#routestxt) MAX Orange에 해당하는 항목이 나열됩니다.
- 그만큼`service_id` \~에서[calendar.txt](../../reference/#calendartxt) 주말에 해당하는
- 각 레코드에는 고유한id 각각trip 헤드 사인text 버스 안팎의 표지판에 일반적으로 표시되는 것입니다.

- 필드`direction_id` 서로 다른 방향으로 가는 동일한 경로의 여행을 구분할 수 있습니다. 예를 들어, 인바운드 여행과 아웃바운드 여행 또는 남쪽 여행과 북쪽 여행을 구별합니다.
- 이 경우 Saddletowne 방향의 여행은 `direction_id=0` 이고 Brentwood 방향의 여행은 `direction_id=1` 입니다. 의 값direction_id 고유한 의미가 없으며 한 방향과 다른 방향을 할당하는 데만 사용됩니다.
- 그만큼shape_id \~에서shapes.txt Saddletowne 방향의 MAX Orange 경로에 해당하는 경로가 첫 번째 레코드에 나열되고 Brentwood 방향의 MAX Orange 경로에 해당하는 경로가 두 번째 및 세 번째 레코드에 나열됩니다.

`shape_id=3030026` 은 Saddletowne 방향의 MAX 주황색에 해당합니다. 아래 파일에는 경로를 설명하는 지점과 해당 지점 사이의 거리에 대한 정보가 포함되어 있습니다. 이 정보를 통해 지도에 경로를 표시할 수 있습니다.trip 계획 또는 분석 목적.

[**shapes.txt**](../../reference/#shapestxt)

    shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
    3030026,51.086506,-114.132259,10001,0.000
    3030026,51.086558,-114.132371,10002,0.010
    3030026,51.086781,-114.132865,10003,0.052
    3030026,51.086938,-114.133179,10004,0.080
    3030026,51.086953,-114.133205,10005,0.083
    3030026,51.086968,-114.133224,10006,0.085
    3030026,51.086992,-114.133249,10007,0.088
    3030026,51.087029,-114.133275,10008,0.093
    3030026,51.087057,-114.133286,10009,0.096
    3030026,51.087278,-114.133356,10010,0.121
    3030026,51.087036,-114.132864,10011,0.165
    3030026,51.086990,-114.132766,10012,0.173
    3030026,51.086937,-114.132663,10013,0.183

<hr/>

## 서비스 예외

다음과 같은 서비스에 대한 예외를 정의할 수 있습니다.added 휴무일(특정일) 또는 휴무일(예: 공휴일 휴무)

예를 들어,scheduled 2022년 7월 17일 일요일 서비스 - 그러면 해당 날짜는 다음의 `weekend_service` 에서 제거될 수 있습니다.[calendar.txt](../../reference/#calendartxt) の서비스를 둘로 나누면:

|  서비스               | start      | end        |
| ------------------ | ---------- | ---------- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

그러나 이로 인해 파일이 복잡해집니다.`service_id` 두 개로 나뉘며 이 나누기는[trips.txt](../../reference/#tripstxt) . に대신 다음을 사용하여 더 쉽게 수행할 수 있습니다.[calendar_dates.txt](../../reference/#calendar_datestxt) を아래 그림과 같이:

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

    service_id,date,exception_type
    weekend_service,20220623,2

- 그만큼`service_id` `weekend_service` 가 나열됩니다.
- 삭제된 날짜 또는added 서비스는 `date` 아래에 나열됩니다(2022년 7월 17일)
- 필드 `exception_type` 은 2로 설정되며 이는 서비스가 오늘 제거됨을 의미합니다.

[예제 소스](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)
