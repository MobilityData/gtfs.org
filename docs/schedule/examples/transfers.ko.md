# 환승

<hr/>

## 블록 전송

좌석 내 환승이라고도 하는 블록 환승은 일련의 여행이 다음 조건을 충족할 때 사용할 수 있습니다.

1. 여행은 연속적입니다.
2. 동일한 차량이 두 여행을 모두 운영합니다.
3. 여행은 동일한 `block_id` 값으로 프로비저닝됩니다.trips.txt 대중교통 피드의 파일입니다.

### `block_id` 사용하여 블록 전송 활성화

서로 다른 경로 또는 경로가 루프 라인인 경우 동일한 경로의 연속 여행 간에 블록 환승이 가능합니다. `block_id` 필드를 사용하여 한 블록에 있는 여행과 좌석 내 환승이 가능한 옵션을 지정하십시오.

예를 들어 다음을 고려하십시오.[trips.txt](../../reference/#tripstxt) 그리고[stop_times.txt](../../reference/#stoptimestxt) 값:

[**trips.txt**](../../reference/#tripstxt)

| route_id | trip_id      | block_id |
| -------- | ------------ |----------|
|  RouteA  |  RouteAtrip1 | Block1   |
|  RouteB  |  RouteBtrip1 | Block1     |

[**stop_times.txt**](../../reference/#stoptimestxt)

| trip_id     |  arrival_time    |  departure_time    | stop_id | stop_sequence |
|-------------| --------- | --------- |---------|---------------|
| RouteATrip1 |  12:00:00 |  12:01:00 | A       | 1             |
| RouteATrip1|  12:05:00 |  12:06:00 | B       | 2             |
| RouteATrip1 |  12:15:00 |           | C       | 3             |
| RouteBTrip1 |           |  12:18:00 | C       | 1             |
| RouteBTrip1 |  12:22:00 |  12:23:00 | D       | 2             |
| RouteBTrip1 |  12:30:00 |           | E       | 3             |

이 예에서:

- A 정류장에서 E 정류장까지의 경로를 검색하는 사용자는 A 경로에서 12:00에 A 정류장에 탑승하고 `RouteATrip1` 종료 후 C 정류장에 도달하면 차량에 머물도록 지시됩니다. 이는 동일한 차량이 Route B에 대한 `RouteBTrip1` 서비스를 제공하기 때문입니다.
- `RouteATrip1` 의 정류장으로 계속 가고 싶은 `RouteBTrip1` 의 승객은 이 환승을 위해 차량에 머물 수 있습니다.
- 동일한 경로를 따라 다른 차량으로 다른 여행을 하는 승객은 각 여행에 다른 차량을 사용하기 때문에 이 옵션이 없습니다.

### 루프 라인에서 블록 전송

루프 라인에서 여행의 첫 번째 정류장과 마지막 정류장은 동일하고 동일합니다.`stop_id` . 연속 루프 여행의 `block_id` 동일한 경우 블록 또는 좌석 내 환승이 활성화되어 첫 번째 여행의 승객이 다음 루프에서 계속될 때 차량에 남을 수 있습니다.
