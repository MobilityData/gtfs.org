# 피드 엔티티

GTFS Realtime은 단일 실시간 피드로 결합할 수 있는 세 가지 유형의 실시간 데이터를 지원합니다. 관련 섹션에 제공된 전체 문서와 함께 요약이 아래에 제공됩니다.

## Trip Updates

#### "버스 X가 5분 지연되었습니다"

Trip updates는 시간표의 변동을 나타냅니다. 실시간으로 예약한 모든 여행에 대한 trip updates를 받을 수 있을 것으로 기대합니다. 이러한 업데이트는 경로를 따라 정류장에 대한 예상 도착 또는 출발을 제공합니다. Trip updates는 여행이 취소되거나 일정에 추가되거나 심지어 경로가 변경되는 보다 복잡한 시나리오를 제공할 수도 있습니다.

[Trip Updates에 대해 자세히...](trip-updates.md)

## Service Alerts

#### "공사로 Y역 폐쇄"

Service alerts 특정 엔터티의 상위 수준 문제를 나타내며 일반적으로 중단에 대한 텍스트 설명 형식입니다.

다음과 같은 문제를 나타낼 수 있습니다.

*   스테이션
*   윤곽
*   전체 네트워크
*   등.

Service alert은 일반적으로 문제를 설명하는 일부 텍스트로 구성되며, 이 service alert이 영향을 미치는 대상을 이해하는 데 도움이 되는 보다 구조화된 정보뿐만 아니라 추가 정보에 대한 URL도 허용합니다.

[Service Alerts에 대한 추가 정보...](service-alerts.md)

## Vehicle Positions

#### "이 버스는 Y시간에 X위치에 있습니다."

Vehicle positions는 네트워크의 특정 차량에 대한 몇 가지 기본 정보를 나타냅니다.

가장 중요한 것은 차량이 있는 위도와 경도이지만 차량의 현재 속도 및 주행 기록계 판독값에 대한 데이터도 사용할 수 있습니다.

[Vehicle Positions 업데이트에 대해 자세히 알아보기...](vehicle-positions.md)

## 피드 유형에 대한 기록 설명

GTFS Realtime 사양의 초기 버전에서는 단일 유형의 엔티티만 포함하기 위해 각 피드가 필요했습니다. 병합에서 유형별 피드 스키마로 변환하는 예제 도구는 Bliksem Labs [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py) GitHub 리포지토리에 있습니다.
