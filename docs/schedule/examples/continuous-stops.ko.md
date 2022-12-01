---
search:
  exclude: true
---

<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/continuous-stops.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# 연속 정지

<hr/>

## 모든 곳에서 픽업 및 하차

대중교통 기관인 The Current(미국 버몬트주 로킹엄)는 2번, 53번, 55번 노선에 연속 정차 정책을 적용합니다.scheduled 버스가 정차하기에 안전한 장소가 있는 한 경로를 따라 정차합니다.

파일[routes.txt](../../reference/#routestxt) 이 서비스를 설명하기 위해 `continuous_pickup` 및 `continuous_drop_off` 필드를 사용합니다. 필드는 연속 승하차가 허용됨을 나타내기 위해 `0` 으로 설정됩니다.

[**routes.txt**](../../reference/#routestxt)

    route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
    2,2,Bellows Falls In-Town,3,0,0
    53,53,Bellows Falls / Battleboro Commuter,3,0,0
    55,55,Bellows Falls / Springfield Shuttle,3,0,0

[예제 소스](https://crtransit.org/bus-schedules/)

<hr/>

## 경로의 한 구간에서 픽업 및 하차

대중교통 기관인 Victor Valley Transit(US-CA 빅터빌)은 22번 노선의 일부에만 연속 정차 정책을 적용합니다. 탑승자는 카운티 요금 구역 내의 안전한 장소에서만 버스에 탑승하고 하차할 수 있습니다. Local Fare 구역 내에서는 연속 승차 및 하차가 불가능합니다.

Local Fare zone과 County Fare zone은 아래 그림과 같이 Air Expressway로 구분되어 있습니다. 그만큼scheduled stop National Trails Highway - Air Expressway는 이 경계의 약간 북쪽에 있습니다. 정확히 말하면, 대중교통 기관은 버스 노선과 경계가 있는 실제 교차로에 정류장을 추가할 수 있으며 여기서 연속 승하차가 가능합니다. 이 정류장은 남아있을 수 있습니다unscheduled .

![](../../assets/victor-valley-transit.svg)

이는 [stops.txt](../../reference/#stopstxt) 파일을 사용하여 설명되며[stop_times.txt](../../reference/#stoptimestxt) :

- 첫 번째 파일은 경로를 따라 정류장을 정의합니다.
- 두 번째 파일은 정류장 간의 연속 승차 및 하차 규칙을 정의합니다.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon
    A,Victoriaville Transfer Station,34.514356,-117.318323
    B,Dante St & Venus Ave,34.564499,-117.287097
    C,Victorville Transportation Center,34.538433,-117.294703
    X,Local/County Fare Boundary,34.566224,-117.318357
    D,National Trails Highway - Air Expressway,34.567536,-117.319716
    E,Oro Grande Post Office,34.599292,-117.334452
    F,Silver Lakes Market,34.744662,-117.335407

\~ 안에[stop_times.txt](../../reference/#stoptimestxt), 주어진trip :

- `continuous_pickup=0` 인 레코드는 해당 정류장에서 다음 정류장까지 연속 픽업이 허용됨을 나타냅니다.
- `continuous_pickup=1` 인 레코드는 해당 정류장에서 다음 정류장까지 연속 픽업이 금지됨을 나타냅니다.

[**stop_times.txt**](../../reference/#stoptimestxt)

    trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
    22NB9AM,A,1,09:00:00,09:00:00,1,1,1
    22NB9AM,B,2,09:14:00,09:14:00,1,1,1
    22NB9AM,C,3,09:21:00,09:21:00,1,1,1
    22NB9AM,X,4,,,0,0,0
    22NB9AM,D,5,09:25:00,09:25:00,0,0,1
    22NB9AM,E,6,09:31:00,09:31:00,0,0,1
    22NB9AM,F,7,09:46:00,09:46:00,0,0,1

동일한 논리가 `continuous_drop_off` 필드에 적용되지만 드롭 오프의 경우에도 적용됩니다.

위의 예에서 정류장 A, B, C는 continuous_pickup 및 `continuous_drop_off` 를 `1` 로 설정하여 정류장 간의 연속 승차 및 하차를 금지합니다. 정류장 `X` , `D` , `E` , `F` 에는 `continuous_pickup` 및 `continuous_drop_off` 필드가 `0` 으로 설정되어 있어 정류장 간에 연속 승차 및 하차가 허용됩니다.

[예제 소스](https://vvta.org/routes/route-22/)
