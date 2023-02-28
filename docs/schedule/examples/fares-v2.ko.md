---
search:
  exclude: true
---

# Fares V2

<hr/>

Fares V2 이다GTFS 의 한계를 해결하는 것을 목표로 하는 확장 프로젝트Fares V1 . 이 확장 프로젝트는 반복적으로 채택되고 있으며 아래 예제는Fares V2 공식 사양에 채택되었습니다. 더 많은 정보 보기[Fares V2 확장](../../../extensions/fares-v2) 섹션의 확장 프로젝트.

그 동안 생산자는 구현할 수 있습니다.Fares V2 구현과 함께Fares V1 둘 사이에 기술적 충돌이 없기 때문에 동일한 데이터 세트에서. 소비자는 다른 구현과 독립적으로 사용할 구현을 선택할 수 있습니다.Fares V2 ,Fares V1 향후 사용되지 않을 수 있습니다.

## 대중교통 요금 정의

토론토에서 TTC 교통 시스템을 사용하기 위해 요금을 지불하는 방법에는 여러 가지가 있습니다. TTC는 지불 방법에 따라 두 가지 운임 가격 옵션을 제공합니다. PRESTO 카드를 사용하는 경우 성인 요금은 CAD 3.20이며, 현금으로 지불하는 경우 동일한 요금은 CAD 3.25입니다.

대중교통 티켓 또는 운임은 다음을 사용하여 설명할 수 있습니다.[fare_products.txt](../../reference/#fare_productstxt) という파일. 각 항목은 특정 운임에 해당합니다.

[fare_products.txt](../../reference/#fare_productstxt)

    fare_product_id,fare_product_name,amount,currency
    presto_fare,PRESTO Card Fare,3.2,CAD
    cash_fare,Cash Fare,3.25,CAD

[예제 소스](https://www.ttc.ca/Fares-and-passes)

<hr/>

## 동일한 요금 구역의 서비스 위치 설명

일부 대중교통 기관은 구역 기반 요금 체계를 운영합니다. 운임 구역은 서로 다른 운임 가격과 관련된 분할된 지리적 영역입니다. 단일 구역 내에서 이동하든 한 구역에서 다른 구역으로 이동하든 환승 승객은 올바른 요금을 알아야 합니다. 토론토의 TTC 시스템에는 하나의 요금 구역만 있습니다. 환승 승객은 모든 경우에 대해 동일한 단일 티켓 요금을 지불하기만 하면 됩니다.trip 어떤 교통수단을 이용하든 상관없이 토론토 시 경계 내 거리입니다.

요금 구역은 [stops_areas.txt](../../reference/#stops_areastxt) 파일을 사용하여 설명할 수 있습니다.`stops.txt` 에게`areas.txt` .

먼저 지역(운임 구역)을 확인합니다.

[**areas.txt**](../../reference/#areastxt)

    area_id,area_name
    ttc_service_area,TTC Fare Zone

그 후,`stop_id` \~로부터[stops.txt](../../reference/#stopstxt) 파일, 그룹 정류장은 각각의 식별된 영역(요금 구역)으로 함께 정차합니다.

[**stop_areas.txt**](../../reference/#stops_areastxt)

    area_id,stop_id
    ttc_service_area,262
    ttc_service_area,263
    ttc_service_area,264
    ttc_service_area,265
    ttc_service_area,266
    …

[예제 소스](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)

<hr/>

## 편도 여행에 대한 규칙 만들기

\~ 안에GTFS , 운임 레그는trip 승객이 다른 모드, 경로, 네트워크 또는 기관 간에 환승하지 않고 만드는 것입니다. 단일 요금으로 승객은 TTC 네트워크 내의 모든 버스 정류장, 지하철역 및 전차 정류장 쌍 내에서 여행할 수 있습니다.

레그 그룹은 네트워크 내에서 출발지에서 목적지까지(또는 지역 ID가 그룹화된 정류장에 해당하는 경우 출발지에서 목적지 집합으로) 여행을 정의합니다. 아래 파일은 TTC 네트워크 내에서 어디로든 이동할 수 있는 두 가지 규칙을 설명합니다. 첫 번째 규칙은 PRESTO 요금을 사용한 여행에 해당하고 두 번째 규칙은 현금 요금을 사용한 여행에 해당합니다.

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

    leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
    ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
    ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare

[예제 소스](https://www.ttc.ca/Fares-and-passes)

<hr/>

## 전송 규칙 만들기

TTC를 타기 위해 PRESTO 카드를 사용하는 승객은 2시간의 무제한 환승 기간이 있습니다. 이것은 그들이 2시간 안에 기관의 버스, 지하철, 전차 사이를 무제한 환승할 수 있다는 것을 의미합니다.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

    from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
    ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer

위의 파일은 이것을GTFS 다음 필드:

- PRESTO 카드( `ttc_trip_presto` )로 결제되는 구간 간 이동이 가능합니다.
- 그만큼`transfer_count` 허용되는 전송 횟수에 제한이 없으므로 `-1` 로 설정됩니다.
- 그만큼`duration_limit` 2시간에 해당하는 `7200` 초로 설정됩니다.
- `duration_limit_type` 은 `3` 으로 설정되어 있습니다. 승객이 유료 구역에 들어가거나 버스나 전차에 탑승하자마자 PRESTO 카드를 탭해야 하기 때문입니다. 이것은 다음에 해당합니다.arrival 현재 구간의 운임 확인 및arrival 다음 구간의 운임 확인.
- `fare_transfer_type` 은 첫 번째 요금만 지불하므로 요금 전송 유형은 `0` 으로 설정됩니다. 2시간 이내에 환승하는 경우 환승 수수료나 두 번째 요금이 부과되지 않습니다. 따라서 비용은 첫 번째 요금과 환승 요금의 합으로 모델링할 수 있습니다.
- 전송 수수료는 TTC 시스템 내에서 무료이므로 0으로 설정됩니다. 이는 `fare_product_id=free_transfer` 로 표시됩니다.

[예제 소스](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)
