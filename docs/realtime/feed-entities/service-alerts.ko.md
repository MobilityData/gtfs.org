# Service Alerts

서비스 알림을 통해 네트워크 중단이 발생할 때마다 업데이트를 제공할 수 있습니다. 개별 여행의 지연 및 취소는 일반적으로 [trip updates](trip-updates.md) 를 사용하여 전달해야 합니다.

다음을 제공할 수 있습니다.

*   URL - 경고에 대해 자세히 설명하는 사이트 링크
*   헤더 텍스트 - 알림 요약
*   설명 - 항상 헤더 옆에 표시되는 경고에 대한 전체 설명입니다(따라서 이 정보를 반복해서는 안 됨).

## TimeRange

경고는 지정된 시간 범위 내에서 적절한 위치에 표시됩니다. 이 범위는 승객이 볼 수 있는 알림이 유용한 전체 시간을 포함해야 합니다.

시간이 주어지지 않으면 피드에 있는 동안 경고를 표시합니다. 여러 범위가 지정되면 모든 범위에서 표시됩니다.

## EntitySelector

엔터티 선택기를 사용하면 이 경고가 영향을 미치는 네트워크 부분을 정확하게 지정할 수 있으므로 사용자에게 가장 적절한 경고만 표시할 수 있습니다. 여러 엔터티에 영향을 미치는 경고에 대해 여러 엔터티 선택기를 포함할 수 있습니다.

엔티티는 GTFS 식별자를 사용하여 선택되며 다음 중 하나를 선택할 수 있습니다.

*   Agency - 전체 네트워크에 영향을 미침
*   Route - 전체 경로에 영향을 미칩니다.
*   Route type - 이 유형의 모든 경로에 영향을 미칩니다. 예: 모든 지하철.
*   Trip - 특정 여행에 영향을 미침
*   Stop - 특정 중지에 영향을 줍니다.

하나의 `informed_entity` 에 위에 나열된 필드 중 두 개 이상을 포함할 수 있습니다. 하나의 `informed_entity` 에 여러 필드가 포함된 경우 `AND` 논리 연산자로 결합된 것으로 해석되어야 합니다. 즉, 알림은 `informed_entity` 에 제공된 모든 필드를 충족하는 컨텍스트에서만 적용되어야 합니다. 예를 들어 `route_id: "1"` 및 `stop_id: "5"` 가 하나의 `informed_entity` 에 모두 포함된 경우 경고는 5번 정류장에서 경로 1에만 적용되어야 합니다. 경로 1의 다른 정류장에는 적용되어서는 안 됩니다. 5번 정류장에서 다른 경로에 적용하면 안 됩니다.

둘 이상의 엔터티에 영향을 미치는 경고를 나타내려면(예: 경로 1과 정류장 5 모두에 대한 경고) 여러 개의 `informed_entity` 를 `alert` 에 추가해야 합니다. 각각은 영향을 받는 엔터티에 적용됩니다(예: 하나의 `informed_entity` 는 경로 1과 정류장 5를 포함하는 다른 `informed_entity` 를 포함).

## Cause

이 경고의 원인은 무엇입니까? 다음 중 하나를 지정할 수 있습니다.

*   Unknown cause
*   Other cause (이러한 옵션으로 표시되지 않음)
*   Technical problem
*   Strike
*   Demonstration
*   Accident
*   Holiday
*   Weather
*   Maintenance
*   Construction
*   Police activity
*   Medical emergency

## Effect

이 문제는 지정된 엔터티에 어떤 영향을 줍니까? 다음 중 하나를 지정할 수 있습니다.

*   No service
*   Reduced service
*   Significant delays(경미한 지연은 [trip updates](trip-updates.md) 를 통해서만 제공되어야 함).
*   Detour
*   Additional service
*   Additional service: 작업이 라이더가 일반적으로 기대하는 것과 다릅니다. 예를 들어 해당 요일의 정상 서비스와 다른 예정된 휴일 일정을 라이더에게 상기시키는 경고가 있습니다.
*   Stop moved
*   Other effect(이러한 옵션으로 표시되지 않음)
*   Unknown effect
*   No effect: 경고는 탑승자에게 정보를 제공하지만 작동에는 영향을 미치지 않습니다. 예를 들면 공개 회의 광고 및 설문 조사를 통한 피드백 요청이 있습니다.
*   Accessibility issue: 경고는 무단계 접근에 영향을 미치는 접근성 문제에 대한 정보를 제공합니다. 예를 들면 작동하지 않는 엘리베이터 또는 이동식 경사로가 있습니다.
