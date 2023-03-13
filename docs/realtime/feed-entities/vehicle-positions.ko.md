# Vehicle Positions

Vehicle position는 차량에 탑재된 GPS 장치와 같이 자동으로 생성된 차량 위치 정보를 제공하는 데 사용됩니다. 단일 차vehicle position는 제공할 수 있는 모든 차량에 대해 제공되어야 합니다.

차량이 현재 제공하고 있는 여행은 [TripDescriptor](../reference.md#message-tripdescriptor) 를 통해 제공되어야 합니다. 업데이트를 제공하는 정확한 물리적 차량을 지정하는 [VehicleDescriptor](../reference.md#message-vehicledescriptor) 를 제공할 수도 있습니다. 문서는 아래에 제공됩니다.

위치 판독이 수행된 시간을 나타내는 **timestamp** 가 제공될 수 있습니다. 이것은 서버에서 이 메시지가 생성된 시간인 피드 헤더의 타임스탬프와 다릅니다.

**Current passage** 도 제공될 수 있습니다( `stop_sequence` 또는 `stop_id` 로). 이는 차량이 이동 중이거나 이미 정차한 정류장에 대한 참조입니다.

## Position

위치는 vehicle position 내의 위치 데이터를 포함합니다. 위도와 경도는 필수이며 다른 필드는 선택 사항입니다. 이러한 유형의 데이터는 다음과 같습니다.

*   **Latitude** - WGS-84 좌표계에서 북쪽도
*   **Longitude** - WGS-84 좌표계의 동쪽 각도
*   **Bearing** - 차량이 향하는 방향
*   **Odometer** - 차량이 이동한 거리
*   **Speed** - 차량이 측정한 순간 속도(초당 미터)

## CongestionLevel

또한 vehicle position를 통해 기관은 차량이 현재 겪고 있는 혼잡 수준을 지정할 수 있습니다. 혼잡은 다음 범주로 분류할 수 있습니다.

*   Unknown congestion level
*   Running smoothly
*   Stop and go
*   Congestion
*   Severe congestion

혼잡의 각 유형으로 분류하는 것은 기관에 달려 있습니다. 우리의 지침은 심각한 혼잡은 교통이 너무 혼잡하여 사람들이 차에서 내리는 상황에서만 사용된다는 것입니다.

## OccupancyStatus

또한 vehicle position를 통해 기관은 차량의 승객 점유 정도를 지정할 수 있습니다. 점유 상태는 다음 범주로 분류할 수 있습니다.

*   Empty
*   Many seats available
*   Few seats available
*   Standing room only
*   Crushed standing room only
*   Full
*   Not accepting passengers

이 필드는 아직 **실험적** 이며 변경될 수 있습니다. 추후 정식으로 채택될 수 있습니다.

## VehicleStopStatus

Vehicle stop status태는 현재 접근 중이거나 정지 중인 정류장과 관련하여 차량의 상태에 더 많은 의미를 부여합니다. 다음 값 중 하나로 설정할 수 있습니다.

*   **Incoming at** - 차량이 참조 정류장에 곧 도착합니다.
*   **Stopped at** - 차량이 참조 정류장에서 정차합니다.
*   **In transit to** 중 - 참조된 정류장은 차량의 다음 정류장입니다. - **기본**

## VehicleDescriptor

VehicleDescriptor는 정확한 물리적 차량을 설명하며 다음 속성 중 하나를 포함할 수 있습니다.

*   **ID** - 차량의 내부 식별 시스템입니다. 차량에 고유해야 합니다.
*   **Label** - 사용자가 볼 수 있는 레이블 - 예를 들어 기차 이름
*   **License plate** - 차량의 실제 번호판
