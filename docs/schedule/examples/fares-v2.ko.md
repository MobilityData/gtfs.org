# Fares V2

<hr/>

Fares V2 이다GTFS 의 한계를 해결하는 것을 목표로 하는 확장 프로젝트Fares V1 . 이 확장 프로젝트는 반복적으로 채택되고 있습니다. 아래 예는 요금 제품을 포함하여 기본 개념을 모델링하는 방법과 라이더가 환승을 위해 요금을 사용하는 방법을 설명합니다. 더 많은 정보 [보기](/extensions/fares-v2/)Fares V2 [확장 프로젝트는 여기](/extensions/fares-v2/) .

그 동안 생산자는 구현할 수 있습니다.Fares V2 구현과 함께Fares V1 둘 사이에 기술적 충돌이 없기 때문에 동일한 데이터 세트에서. 소비자는 다른 구현과 독립적으로 사용할 구현을 선택할 수 있습니다.Fares V2 ,Fares V1 향후 사용되지 않을 수 있습니다.

## 대중교통 요금 정의

Maryland Transit Administration 시스템을 사용하기 위해 요금을 지불하는 방법에는 여러 가지가 있습니다. [레귤러는 4가지 종류가 있습니다](https://www.mta.maryland.gov/regular-fares)FULL [가격 운임 옵션:](https://www.mta.maryland.gov/regular-fares)

- $2.00 USD의 편도 티켓
- $4.60 USD의 일일 패스
- 미화 22달러의 주간 이용권
- 미화 77달러의 월 이용권

환승 티켓 또는 운임은 에서 운임 제품이라고 합니다.GTFS . 다음을 사용하여 설명할 수 있습니다.[fare_products.txt](../../reference/#fare_productstxt) 파일. 각 항목은 특정 운임에 해당합니다.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id  | fare_product_name  | amount  | currency  |
|------------------------|--------------------|---|---|
| core_local_oneway_fare | One Way Full Fare |  2.00 | USD  |
| core_local_1_day_fare  | 1-Day Pass - Core Service  | 4.60  | USD   |
| core_local_31_day_fare | 31-Day Pass - Core Service  | 77.00  | USD  |
| core_local_7_day_fare  | 7-Day Pass - Core Service |  22.00 | USD  |

<sup>[Maryland Transit Administration 로컬 버스 다운로드 GTFS 밥을 먹이다](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## 편도 여행에 대한 규칙 만들기

\~ 안에GTFS , 운임 구간은 승객이 다른 모드, 경로, 네트워크 또는 기관 간에 환승하지 않고 수행하는 여행에 해당합니다. Maryland Transit Administration의 피드에서 단일 요금으로 승객은 BaltimoreLink 버스, Light RailLink 및 Metro SubwayLink 노선의 `core` 네트워크 내에서 모든 정류장과 지하철역 내에서 이동할 수 있습니다.

레그 그룹은 네트워크 내에서 출발지에서 목적지까지(또는 지역 ID가 그룹화된 정류장에 해당하는 경우 출발지에서 목적지 집합으로) 여행을 정의합니다. 아래 파일은 Maryland Transit Administration의 핵심 네트워크 내에서 어디로든 이동할 수 있는 규칙을 설명합니다. 각 규칙은 [환승 요금 정의 예의](#_1) 일반 요금 제품 중 하나에 해당합니다.

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

|  leg_group_id |  network_id | fare_product_id  |
|---|---|---|
| core_local_one_way_trip | core  |  core_local_oneway_fare |
| core_local_one_way_trip | core  |  core_local_1_day_fare |
| core_local_one_way_trip | core  |  core_local_31_day_fare |
| core_local_one_way_trip | core  |  core_local_7_day_fare |

<sup>[Maryland Transit Administration 로컬 버스 다운로드 GTFS 밥을 먹이다](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## 전송 규칙 만들기

BaltimoreLink 지역 버스, Metro SubwayLink 또는 Light RailLink를 이용하기 위해 편도 요금을 구매한 라이더에게는 90분 환승이 있습니다. 즉, 90분 안에 시내 버스, 지하철, 경전철 사이를 무제한으로 환승할 수 있습니다.

fare_transfer_rules.txt

| from_leg_group_id        | to_leg_group_id          | duration_limit | duration_limit_type |  fee_transfer_type | transfer_count |
| ------------------------ | ------------------------ | -------------- | ------------------- | ------------------ | -------------- |
|  core_local_one_way_trip |  core_local_one_way_trip |  5400          |  1                  |  0                 |  -1            |

위의 파일은 이것을GTFS 다음 필드:

- 편도 이동 구간( `core_local_one_way_trip` )으로 환승 가능
- 그만큼`transfer_count` 허용되는 전송 횟수에 제한이 없으므로 `-1` 로 설정됩니다.
- 그만큼`duration_limit` 90분에 해당하는 `5400` 초로 설정됩니다.
- 그만큼`duration_limit_type` 승객이 `core_local_one_way_trip` 요금 구간의 임의 경로에서 출발할 때 환승 시간이 시작되고 다른 요금 구간에서 출발할 때 종료되기 때문에 환승 시간은 `1` 로 설정됩니다.
- 승객은 첫 번째 요금만 지불하므로 `fare_transfer_type` 은 `0` 으로 설정됩니다. 90분 창구 내에 환승하는 경우 환승 수수료나 두 번째 요금이 없습니다. 따라서 비용은 첫 번째 요금과 환승 요금의 합으로 모델링할 수 있습니다.
- 그만큼`transfer_count` 라이더가 90분 이내에 무제한으로 환승할 수 있으므로 `-1` 로 설정됩니다.`duration_limit` 창문.

요금을 정의하고 적절한 `fare_leg_rule` 생성하고 `fare_transfer_rule` 정의하면 \$2.00 USD `core_local_oneway_fare` 여행 플래너에 표시되는 것을 볼 수 있습니다. 다음은 Transit의 예입니다.

<div class="flex-photos"><img src="../../../assets/transit-fares-mdot.png" alt="미화 2달러의 운임"/></div>

<sup>[Maryland Transit Administration 로컬 버스 다운로드 GTFS 밥을 먹이다](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

## 동일한 요금 구역의 서비스 위치 설명

일부 대중교통 기관은 구역 기반 요금 체계를 운영합니다. 운임 구역은 서로 다른 운임 가격과 관련된 분할된 지리적 영역입니다. Bay Area의 BART 시스템에서는 출발지와 목적지에 따라 요금이 다르며 [(BART 요금 차액)](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf) 환승 승객은 올바른 요금을 알아야 합니다. 요금 구역은 [stops_areas.txt](../../reference/#stops_areastxt) 파일을 사용하여 설명할 수 있습니다.[stops.txt](../../reference/#stopstxt) 에게[areas.txt](../../reference/#areastxt).

먼저, 영역을 식별[areas.txt](../../reference/#areastxt). 영역 이름이 없으면 `area_name` 비워 두어도 됩니다. 아래 표에는 세 가지가 있습니다.area_id - `ASHB` , `GLEN` 및 `OAKL` .

[**areas.txt**](../../reference/#areastxt)

| area_id | area_name |
|---------|-----------|
| ASHB    |           |
| GLEN    |           | 
| OAKL    |           | 

그 후,`stop_id` \~로부터[stops.txt](../../reference/#stopstxt) 파일, 그룹 정류장은 각각의 식별된 영역(요금 구역)으로 함께 정차합니다.

다음으로 그룹`stop_id` 각자에게`area_id` . BART 예에서 각 영역에는 1개만 포함됩니다.`stop_id` . 예를 들어, `ASHB` 영역에는 정류장 `ASHB` (Ashby Station)만 포함됩니다.`stop_id` 등재되어야 합니다.

[**stop_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
|---------|---------|
| ASHB    | ASHB    |
| GLEN    | GLEN    | 
| OAKL    | OAKL    | 

\~ 안에`fare_leg_rules.txt` , 서로 다른 출발 및 도착 지역에 따라 다른 운임 제품을 식별할 수 있습니다. 예를 들어 첫 번째 항목은 다음을 보여줍니다.

- 출발 지역은 `ASHB` 입니다.
- 도착 지역은 `GLEN` 입니다.
- 출발/도착 지역 운임 상품은 `BA:matrix:ASHB-GLEN` 입니다.

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id|to_area_id|fare_product_id|
|--------------|-----------|------------|---------------|
|   BA    |  ASHB   | GLEN | BA:matrix:ASHB-GLEN |
|     BA         |  ASKB   | OAKL | BA:matrix:ASHB-OAKL |

요금은`fare_products.txt` .

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name| amount | currency |
|---------------------|-----------|--------|----------|
| BA:matrix:ASHB-GLEN |  generated  | 4.75   | USD      |
| BA:matrix:ASHB-OAKL  |  generated  | 9.45   | USD       |

<sup><a href="https://511.org/open-data/transit" target="_blank">샌프란시스코 베이 지역 지역 피드 보기</a></sup>

<hr/>

## 허용되는 요금 매체 설명

San Francisco Muni 라이더는 여러 가지 유형의 요금 미디어를 사용하여 여행 비용을 지불하고 요금을 확인할 수 있습니다.

- Bay Area의 대중교통 카드인 <a href="https://www.clippercard.com/ClipperWeb/" target="_blank">Clipper 카드</a>사용
- <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">뮤니모바일 앱</a> 사용
- 요금을 현금으로 지불

이러한 `fare_media` 검사 방법은GTFS-Fares V2 그리고 `fare_media.txt` 사용하여 설명할 수 있습니다.

아래는 511 SF Bay API로 액세스할 수 있는 <a href="https://511.org/open-data/transit" target="_blank">San Francisco Bay Area Regional Feed</a> 의 예제 스니펫입니다.

`Clipper` `fare_media_type=2` 인 실제 교통카드로 설명됩니다. `SFMTA Munimobile` `fare_media_type=2` 인 모바일 앱으로 설명됩니다. `Cash` 승차권 없이 기사에게 직접 지급되기 때문에 요금 매체가 없습니다. 결과적으로 `Cash` `fare_media_type=0` 입니다.

실제 티켓을 운임 `fare_media_type=1` 유형으로 설명하려는 생산자는가득한[Fares V2 제안](https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd) .

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| munimobile    | SFMTA MuniMobile | 4               |
| cash           | Cash             | 0               |

<sup><a href="https://511.org/open-data/transit" target="_blank">샌프란시스코 베이 지역 지역 피드 보기</a></sup>

## 운임 매체에 따른 가격 차이 정의

Muni의 운임 가격은 라이더가 사용하는 운임 매체에 따라 다릅니다. 이 예에서는 현금 또는 Clipper 카드를 사용할 때 성인 현지 요금이 어떻게 변경되는지 설명합니다. 현금으로 지불한 성인 현지 요금은 3 USD이고 Clipper 카드로 지불한 동일한 요금은 50센트 적은 2.50입니다.

아래의 각 항목은 운임 매체를 설명합니다.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| cash           | Cash             | 0               |

그만큼`fare_products.txt` 아래의 파일 스니펫은 탑승자가 사용하는 요금 매체에 따라 `Muni single local fare` 제품의 금액이 어떻게 달라지는지를 보여줍니다.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | amount | currency | fare_media_id |
|---------------|------------------|-------|--- |---------------|
| SF:local:single | Muni single local fare | 3     | USD | cash |
| SF:local:single | Muni single local fare  | 2.5   |USD | clipper |

승객은 Apple Maps에서 요금이 어떻게 변하는지 확인할 수 있습니다. "Board the Muni J Church train" 안내에 따라 요금을 비교할 수 있습니다.

<div class="flex-photos"><img src="../../../assets/apple-muni-cash.jpg" alt="미화 3달러의 현금 요금"><img src="../../../assets/apple-muni-clipper.jpg" alt="$2.50 USD의 클리퍼 카드 요금"/></div>

<sup><a href="https://511.org/open-data/transit" target="_blank">샌프란시스코 베이 지역 지역 피드 보기</a></sup>

## 비접촉 요금 미디어 옵션 설명

[Northern Santa Barbara County의 Clean Air Express는 신용 카드, Google Pay 및 Apple Pay를 통한 비접촉 결제를 허용합니다](https://vimeo.com/539436401) .

Clean Air Express 피드에는 cEMV(비접촉식 Europay, Mastercard 및 Visa) 옵션이므로 `fare_media_type=3` 인 `tap_to_ride` 요금 미디어가 있습니다.

| fare_media_id | fare_media_name | fare_media_type |
|---------------|-----------------|-----------------|
| tap_to_ride   | Tap to Ride   | 3  |

아래 표시된 1회 승차 요금 상품에는 `cash` 및 `tap-to-ride` 요금 미디어 옵션이 모두 있습니다. `tap-to-ride` 라이드 요금 미디어로 편도 요금을 지불하면 미화 1달러 저렴합니다.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | fare_media_id | amount | currency |
|---------------|------------------|---------------|--------|----------|
| single-ride | Single Ride | tap_to_ride       | 6      | USD      |
| single-ride | Single Ride |       | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">Clean Air Express 피드 다운로드</a></sup>
