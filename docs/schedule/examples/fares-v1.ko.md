---
search:
  exclude: true
---

# Fares V1

<hr/>

구성[fare_attributes.txt](../../reference/#fare_attributestxt) 그리고[fare_rules.txt](../../reference/#fare_rulestxt) ,Fares V1 역사적으로 운임 정보를 설명하는 공식적인 방법이었습니다.GTFS . 그러나 두 파일은 효율적으로 설명할 수 있는 요소의 폭이 제한되어 있으며 구현하기가 모호합니다.[Fares V2](../../examples/fares-v2/) 는 활발하게 개발 중인 확장 프로젝트이며,Fares V1 .

## 여행사의 운임 규정 정의

ㅏtrip Toronto Transit Commission의 지하철 네트워크에서 승객이 PRESTO 카드를 사용하여 지불하는 경우 \$3.20 CAD입니다. 승객은 2시간 이내에 TTC에서 운영하는 다른 지하철, 전차 또는 버스 노선으로 환승할 수도 있습니다.

이 서비스는 파일을 사용하여 나타낼 수 있습니다.[fare_attributes.txt](../../reference/#fare_attributestxt) ,[fare_rules.txt](../../reference/#fare_rulestxt) , 그리고[transfers.txt](../../reference/#transferstxt). 첫 번째 파일,[fare_attributes.txt](../../reference/#fare_attributestxt) 여행사의 요금을 설명합니다. 아래는 프레스토 요금의 예입니다.

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- 운임 가격은 price 및 `currency_type` 아래에 나열됩니다.
- 승객은 지하철에 탑승하기 전에 역 개찰구에서 요금을 지불해야 합니다. 이는 `payment_method=1` 로 표시됩니다.
- 필드 전송은 무제한 전송을 나타내기 위해 비워 둡니다.
- `transfer_duration` 필드는 2시간 전송 창(초)에 해당합니다.

두 번째 파일,[fare_rules.txt](../../reference/#fare_rulestxt) 요금을 경로와 해당 경로의 출발지/목적지와 연결하여 여정에 요금을 할당합니다.

이를 위해 두 개의 지하철 노선이 아래에 정의되어 있습니다.[routes.txt](../../reference/#routestxt) :

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

이 예에서는 Bloor-Yonge 역에서의 환승이 모델링됩니다. 이를 위해 이 역은 두 개의 별도 정류장으로 모델링됩니다. 첫 번째는 1호선이 운행하는 Bloor 역이고 두 번째는 2호선이 운행하는 영 역입니다. 두 역 모두 `zone_id=ttc_subway_stations` 를 사용하여 모든 지하철역을 그룹화합니다. 단일 운임 구역에서.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

\~ 안에[fare_rules.txt](../../reference/#fare_rulestxt), PRESTO 요금은 다음 관계를 사용하여 지하철 노선 및 역 모두와 연결됩니다.

- `fare_id=presto_fare` 의 경우 승객은 1호선( `route_id=line1` )의 두 역과 `origin_id=ttc_subway_stations` 및 `destination_id=ttc_subway_stations` 를 이동할 수 있습니다.

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

세 번째 파일,[transfers.txt](../../reference/#transferstxt) 서로 다른 경로 간의 환승 지점을 정의합니다. Bloor-Yonge 역에서 환승을 모델링하려면 두 항목이 필요합니다.

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- 첫 번째 모델은 다음을 사용하여 1호선에서 2호선으로 전환합니다.`from_route_id` 그리고`to_route_id` Bloor 역에서 Yonge 역까지
- 두 번째 모델은 다음을 사용하여 2호선에서 1호선으로 환승합니다.`from_route_id` 그리고`to_route_id` Yonge 역에서 Bloor 역까지
- 전송에 대한 특정 요구 사항이나 고려 사항이 없으므로 `transfer_type` 값은 `0` 입니다.

[예제 소스](https://www.ttc.ca/Fares-and-passes)
