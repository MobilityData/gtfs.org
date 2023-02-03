---
search:
  exclude: true
---

# 통로

<hr/>

## 역 입구 및 출구 위치 설명

와 함께GTFS , 입구 및 역 내부 정보를 이용하여 정확한 역 설명이 가능합니다. 이 예는 밴쿠버 시내에 있는 워터프론트 역의 섹션을 설명합니다. 이 역은 도시 스카이트레인 네트워크의 일부이며 Canada Line, Expo Line, SeaBus 및 West Coast Express가 운행합니다. 3개의 거리 수준 입구를 통해 라이더는 역에 출입할 수 있습니다. 역의 나머지 부분은 요금 확인을 위한 중앙 홀 수준과 플랫폼이 있는 낮은 수준이 있는 지하에 있습니다.

첫째, 역의 위치와 입구는 다음과 같이 정의됩니다.[stops.txt](../../reference/#pathwaystxt) :

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

위의 파일에서 첫 번째 레코드는 스테이션 위치와 관련되므로 `location_type` 이 `1` 로 설정됩니다. 나머지 5개는 3개의 역 입구와 관련이 있습니다(Granville 입구에는 실제로 3개의 개별 입구, 계단, 에스컬레이터 및 엘리베이터가 있으므로 5개의 레코드가 필요함). 이 5개의 레코드는 `location_type` 이 `3` 으로 설정되어 있으므로 입구로 정의됩니다.

또한,stop_id for Waterfront Station은 역과 연결하기 위한 입구의 `parent_station` 아래에 나열됩니다. 접근 가능한 입구는 `wheelchair_boarding` 이 `1` 로 설정되어 있고 접근 불가능한 입구는 `2` 로 설정되어 있습니다.

## 계단과 에스컬레이터 설명

Granville Street의 Waterfront Station 입구에는 엘리베이터, 에스컬레이터 및 계단이 있으며 입구는 위의 노드로 정의됩니다.[stops.txt](../../reference/#stopstxt) . 역사 내부 구간의 입구를 연결하기 위해서는 추가 노드를 생성해야 합니다.[stops.txt](../../reference/#stopstxt) 워터프론트 스테이션의 `parent_station` 아래. 에서[stops.txt]((../../reference/#stopstxt)) 아래 파일에는 계단과 에스컬레이터의 하단에 해당하는 일반 노드( `location_type 3` )가 정의되어 있습니다.

[stops.txt](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width="700px"/>

다음으로 파일[pathways.txt](../../reference/#pathwaystxt) 노드를 연결하여 통로를 만드는 데 사용되며, 여기서 첫 번째 레코드는 계단의 상단과 하단에 속하는 노드를 연결합니다. `pathway_mode` 는 계단을 나타내기 위해 `2` 로 설정되고 마지막 필드는 승객이 계단에서 양방향(위와 아래)으로 이동할 수 있음을 설명합니다.

마찬가지로 두 번째 레코드는 에스컬레이터를 설명합니다( `pathway_mode` 를 `4` 로 설정). 에스컬레이터는 한 방향으로만 이동할 수 있으므로 `is_bidirectional` 필드는 `0` 으로 설정되므로 에스컬레이터는 노드 `96` 에서 `91` (위쪽)로 한 방향으로 이동합니다.

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## 엘리베이터 및 통로 설명

Granville 거리의 엘리베이터는 승객을 에스컬레이터와 계단이 있는 중앙 홀 수준의 통로로 안내합니다.end . 지표면의 엘리베이터는 위의 역 입구로 이미 정의되어 있습니다(`stop_id 92` ). 따라서 콩코스 레벨의 엘리베이터 도어도 정의해야 합니다.

또한 아래 그림과 같이 Granville Street의 계단, 에스컬레이터, 엘리베이터의 하단에서 본 역사까지 연결되는 지하 통로가 있습니다. 따라서 통로 섹션을 정의하기 위해 두 개의 추가 노드가 생성됩니다.

<img class="center" src="../../../assets/pathways-2.png" width="500px"/>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width="500px"/>

마지막으로 파일과 같이 노드를 연결하여 지하 통로를 정의합니다.[pathways.txt](../../reference/#pathwaystxt) 아래에:

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
