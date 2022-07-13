# GTFSRealtime 모범 사례

## 소개

다음은 설명을 위한 권장 사례입니다.Realtime 대중교통 정보를GTFSRealtime 데이터 형식.

### 문서 구조

권장 사례는 두 가지 기본 섹션으로 구성되어 있습니다.

* __[메시지별로 정리된 실천권고](#practice-recommendations-organized-by-message) :__ 공식문서에 기술된 것과 같은 순서로 메시지와 분야별로 권고사항을 정리함GTFSRealtime 참조.
* __[사례별로 정리된 실습 권장 사항](#practice-recommendations-organized-by-use-case) :__ 빈도 기반 서비스(vs.Schedule 기반 서비스), 여러 메시지와 필드에 적용해야 할 뿐만 아니라 해당GTFSSchedule 데이터. 이러한 권장 사항은 이 섹션에 통합되어 있습니다.

### 피드 게시 및 일반 관행

* 피드는 공개 영구 URL에 게시해야 합니다.
* URL은 피드에 액세스하기 위해 로그인할 필요 없이 직접 액세스할 수 있어야 합니다. 원하는 경우 API 키를 사용할 수 있지만 API 키 등록은 자동화되고 모두가 사용할 수 있어야 합니다.
* 내에서 영구 식별자(id 필드) 유지GTFSRealtime 피드 반복에 걸쳐 피드(예: `FeedEntity.id` , `VehicleDescriptor.id` , `CarriageDetails.id` ).
* GTFSRealtime 피드는 30초마다 또는 피드(차량 위치)에 표시된 정보가 변경될 때마다 중 더 빈번한 것으로 새로 고쳐져야 합니다. VehiclePositions는 다른 피드 엔터티보다 더 자주 변경되는 경향이 있으며 가능한 한 자주 업데이트해야 합니다. 콘텐츠가 변경되지 않은 경우 정보가 해당 타임스탬프와 여전히 관련이 있음을 반영하는 새 `FeedHeader.timestamp` 로 피드를 업데이트해야 합니다.
* 내 데이터GTFSRealtime 피드는 여행 업데이트 및 차량 위치의 경우 90초, 서비스 알림의 경우 10분을 넘지 않아야 합니다. 예를 들어 생산자가 30초마다 `FeedHeader.timestamp` 타임스탬프를 지속적으로 새로고침하더라도 해당 피드 내의 VehiclePositions 기간은 90초를 넘지 않아야 합니다.
* 서버 호스팅GTFSRealtime 데이터는 신뢰할 수 있고 일관되게 유효한 형식의 protobuf 인코딩 응답을 반환해야 합니다. 응답 중 1% 미만이 유효하지 않아야 합니다(protobuf 오류 또는 가져오기 오류).
* 웹 서버 호스팅GTFSRealtime 소비자가 `If-Modified-Since` HTTP 헤더를 활용할 수 있도록 데이터는 파일 수정 날짜를 올바르게 보고하도록 구성되어야 합니다(섹션 14.29에서 HTTP/1.1 - 의견 요청 2616 참조). 이렇게 하면 변경되지 않은 피드 콘텐츠 전송을 방지하여 생산자와 소비자의 대역폭을 절약할 수 있습니다.
* 피드는 지정된 URL에서 HTTP 요청을 통해 쿼리할 때 기본적으로 프로토콜 버퍼로 인코딩된 피드 콘텐츠를 제공해야 합니다. 소비자는 프로토콜 버퍼로 인코딩된 콘텐츠를 수신하기 위해 특별한 HTTP 수락 헤더를 정의할 필요가 없습니다.
* 프로토콜 버퍼가 [선택적 값](https://developers.google.com/protocol-buffers/docs/proto#optional) 을 인코딩하는 방식으로 인해 데이터를 읽기 전에GTFSRealtime 피드 소비자는 해당 값을 사용하기 전에 프로토콜 버퍼 생성 `hasX()` 메서드를 사용하여 값의 존재를 확인해야 하며 `hasX()` 가 true인 경우에만 값을 사용해야 합니다(여기서 `X` 는 필드 이름). `hasX()` 가 `false` 를 반환하면 해당 필드에 대한 기본값은GTFS `GTFS - Realtime .proto`Realtime `GTFS - Realtime .proto` 값을 가정해야 합니다. 소비자가 `hasX()` 메서드를 먼저 확인하지 않고 값을 사용하는 경우 생산자가 의도적으로 게시하지 않은 기본 데이터를 읽고 있을 수 있습니다.
* 피드는 피드 무결성을 보장하기 위해 암호화 없이 HTTP 대신 HTTPS를 사용해야 합니다.
* 피드는 컴패니언 스태틱에 포함된 대부분의 여행을 포함해야 합니다.GTFS 데이터세트. 특히 고밀도 및 교통량이 많은 도시 지역과 혼잡한 경로에 대한 데이터를 포함해야 합니다.

## 메시지별로 정리된 실습 권장 사항

### 피드헤더

|  분야 명                   |  추천                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gtfs_realtime_version` |  현재 버전은 "2.0"입니다. 모두GTFSRealtime 피드는 초기 버전인 "2.0" 이상이어야 합니다.GTFSRealtime 다양한 운송 상황을 적절하게 나타내는 데 필요한 모든 필드가 필요하지 않았습니다.                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `timestamp`             |  이 타임스탬프는 두 개의 순차적 피드 반복 사이에서 줄어들지 않아야 합니다.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|                         |  피드 콘텐츠가 변경되면 이 타임스탬프 값은 항상 변경되어야 합니다. 헤더를 업데이트하지 않고 피드 콘텐츠를 변경해서는 안 됩니다.`timestamp` .<br/><br/>* 흔한 실수* - 여러 사례가 있는 경우GTFSRealtime 로드 밸런서 뒤에 피드, 각 인스턴스는Realtime 데이터 소스와 이를 소비자에게 게시하는 것이 약간 동기화되지 않았습니다. 만약GTFSRealtime 소비자는 두 번의 연속적인 요청을 하고 각 요청은 서로 다른GTFSRealtime 피드 인스턴스의 경우 동일한 피드 콘텐츠가 다른 타임스탬프를 사용하여 소비자에게 잠재적으로 반환될 수 있습니다.<br/><br/>* 가능한 해결책* - 생산자는 다음을 제공해야 합니다.`Last-Modified` HTTP 헤더 및 소비자는 가장 최근의`If-Modified-Since` 오래된 데이터 수신을 피하기 위한 HTTP 헤더.<br/><br/>* 가능한 해결책* - HTTP 헤더를 사용할 수 없는 경우 고정 세션과 같은 옵션을 사용하여 각 소비자가 동일한 생산자 서버로 라우팅되도록 할 수 있습니다. |

### FeedEntity

모든 엔티티는 다음에서만 제거되어야 합니다.GTFSRealtime 더 이상 사용자와 관련이 없을 때 피드를 제공합니다. 피드는 상태 비저장으로 간주됩니다. 즉, 각 피드는 대중 교통 시스템의 전체 실시간 상태를 반영합니다. 엔티티가 하나의 피드 인스턴스에서 제공되었지만 후속 피드 업데이트에서 삭제된 경우 해당 엔티티에 대한 실시간 정보가 없다고 가정해야 합니다.

|  분야 명 |  추천                           |
| ----- | ----------------------------- |
| `id`  |  전체 여행 기간 동안 안정적으로 유지되어야 합니다. |

### 여행업데이트

여행 취소에 대한 일반 지침:

* 여러 날에 걸친 여행을 취소할 때 생산자는 취소(예: 우회)를 설명하는 라이더에게 표시될 수 있는 동일한 `trip_ids` 및 `TimeRange` 를 참조하는 `NO_SERVICE` 와 함께 지정된 `trip_ids` 및 `start_dates` 를 `CANCELED` 로 참조하는 TripUpdates를 제공해야 합니다.
* 여행 중 정류장을 방문하지 않을 경우 모든 `stop_time_updates` 가 `SKIPPED` 로 표시되는 대신 `CANCELED` 여야 합니다.

|  분야 명              |  추천                                                                                                                                                                                                                                                                                                                                                                                    |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip`             |  인용하다[ 메시지 TripDescriptor](#TripDescriptor) .                                                                                                                                                                                                                                                                                                                                          |
|                    |  별도의 경우`VehiclePosition` 그리고`TripUpdate` 피드가 제공되며,[ 여행 설명자](#TripDescriptor) 그리고[ 차량 설명자](#VehicleDescriptor) ID 값 쌍은 두 피드 간에 일치해야 합니다.<br/><br/> 예를 들어,`VehiclePosition` 엔티티는`vehicle_id:A` 그리고`trip_id:4` , 다음 해당`TripUpdate` 엔터티도 있어야 합니다.`vehicle_id:A` 그리고`trip_id:4` . 만약에 어떠한`TripUpdate` 엔티티는`trip_id:4` 그리고 어떤`vehicle_id` 4 이외는 오류입니다.                                       |
| `vehicle`          |  인용하다[ 메시지 차량 설명자](#VehicleDescriptor) .                                                                                                                                                                                                                                                                                                                                               |
|                    |  별도의 경우`VehiclePosition` 그리고`TripUpdate` 피드가 제공되며,[ 여행 설명자](#TripDescriptor) 그리고[ 차량 설명자](#VehicleDescriptor) ID 값 쌍은 두 피드 간에 일치해야 합니다.<br/><br/> 예를 들어,`VehiclePosition` 엔티티는`vehicle_id:A` 그리고`trip_id:4` , 다음 해당`TripUpdate` 엔터티도 있어야 합니다.`vehicle_id:A` 그리고`trip_id:4` . 만약에 어떠한`TripUpdate` 엔티티는`trip_id:4` 그리고 어떤`vehicle_id` 4 이외는 오류입니다.                                       |
| `stop_time_update` | `stop_time_updates` 주어진`trip_id` 증가하여 엄격하게 주문해야합니다.`stop_sequence` 그리고 아니`stop_sequence` 반복해야 합니다.                                                                                                                                                                                                                                                                                     |
|                    |  여행이 진행되는 동안 모든`TripUpdates` 적어도 하나를 포함해야합니다`stop_time_update` 미래의 예상 도착 또는 출발 시간과 함께. 참고로[GTFSRealtime 투기](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates) 생산자는 과거를 버려서는 안 된다고 말한다.`StopTimeUpdate` 주어진 여행에 대해 미래에 예정된 도착 시간이 있는 정류장을 의미하는 경우(즉, 차량이 정류장보다 앞서 정류장을 통과한 경우)Schedule ), 그렇지 않으면 이 중지에 대한 업데이트가 없는 것으로 결론지을 것입니다. |
| `timestamp`        |  이 여행에 대한 이 예측이 업데이트된 시간을 반영해야 합니다.                                                                                                                                                                                                                                                                                                                                                    |
| `delay`            | `TripUpdate.delay` 대표해야Schedule 편차, 즉 앞/뒤에 대한 관찰된 과거 값Schedule 차량은. 향후 정차에 대한 예측은 다음을 통해 제공되어야 합니다.`StopTimeEvent.delay` 또는`StopTimeEvent.time` .                                                                                                                                                                                                                                      |

### 여행 설명자

별도의 `VehiclePosition` 및 `TripUpdate` 피드가 제공되는 경우 [TripDescriptor](#TripDescriptor) 및 [VehicleDescriptor](#VehicleDescriptor) ID 값 쌍이 두 피드 간에 일치해야 합니다.

예를 들어 `VehiclePosition` 엔터티에는 vehicle_id `vehicle_id:A` 있고trip_id `trip_id :4` 인 경우 해당 `TripUpdate` 엔터티에는 vehicle_id `vehicle_id:A` 도 있어야 하고trip_id `trip_id :4` .

|  분야 명                   |  추천                                                |
| ----------------------- | -------------------------------------------------- |
| `schedule_relationship` |  의 행동`ADDED` 여행이 지정되지 않았으며 이 열거형을 사용하지 않는 것이 좋습니다. |

### 차량 설명자

별도의 `VehiclePosition` 및 `TripUpdate` 피드가 제공되는 경우 [TripDescriptor](#TripDescriptor) 및 [VehicleDescriptor](#VehicleDescriptor) ID 값 쌍이 두 피드 간에 일치해야 합니다.

예를 들어 `VehiclePosition` 엔터티에는 vehicle_id `vehicle_id:A` 있고trip_id `trip_id :4` 인 경우 해당 `TripUpdate` 엔터티에는 vehicle_id `vehicle_id:A` 도 있어야 하고trip_id `trip_id :4` .

|  분야 명 |  추천                                   |
| ----- | ------------------------------------- |
| `id`  |  전체 여행 기간 동안 차량을 고유하고 안정적으로 식별해야 합니다. |

### StopTime업데이트

|  분야 명           |  추천                                                                                                                                               |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `stop_sequence` |  제공하다`stop_sequence` 가능할 때마다 명확하게 해결하기 때문에GTFS 시간을 멈추다`stop_times.txt` 같지 않은`stop_id` , 여행에서 두 번 이상 발생할 수 있습니다(예: 루프 경로).                         |
| `arrival`       |  순차 정류장 사이의 도착 시간은 증가해야 합니다. 동일하거나 감소해서는 안 됩니다.                                                                                                   |
|                 |  도착`time` (에 명시된[ 중지 시간 이벤트](#StopTimeEvent) ) 출발 전이어야 합니다.`time` 경유 또는 체류 시간이 예상되는 경우 동일한 정류장 - 그렇지 않은 경우 도착`time` 출발과 같아야 한다`time` .            |
| `departure`     |  순차적 정류장 사이의 출발 시간은 증가해야 합니다. 동일하거나 감소해서는 안 됩니다.                                                                                                  |
|                 |  출발`time` (에 명시된[ 중지 시간 이벤트](#StopTimeEvent) ) 도착과 동일해야 합니다.`time` 경유 또는 체류 시간이 예상되지 않는 경우 동일한 정류장에 대해 - 그렇지 않은 경우 출발`time` 도착 후에 있어야 합니다`time` . |

### 중지 시간 이벤트

|  분야 명   |  추천                                                                                                                                                                                                                                                                                         |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `delay` |  을 텐데`delay` 에서 제공됩니다`stop_time_update` `arrival` 또는`departure` (그리고 아니다`time` ) 그런 다음GTFS[`stop_times.txt`](https://gtfs.org/reference/static#stopstxt) 포함해야`arrival_times` 및/또는`departure_times` 이 해당 정류장에 대해 ㅏ`delay` 값Realtime 피드에 추가할 시계 시간이 없으면 피드는 의미가 없습니다.GTFS`stop_times.txt` 파일. |

### 차량 위치

다음은 고품질 데이터(예: 예측 생성)를 소비자에게 제공하기 위해 VehiclePostions 피드에 포함되어야 하는 권장 필드입니다.

|  분야 명                |  메모                                                                                                                     |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `entity.id`          |  전체 여행 기간 동안 안정적으로 유지되어야 합니다.                                                                                           |
| `vehicle.timestamp`  |  차량 위치가 측정된 타임스탬프를 제공하는 것이 좋습니다. 그렇지 않으면 소비자는 마지막 메시지가 개별 위치보다 더 자주 업데이트되었을 때 라이더에게 잘못된 결과를 줄 수 있는 메시지 타임스탬프를 사용해야 합니다. |
| `vehicle.vehicle.id` |  전체 여행 기간 동안 차량을 고유하고 안정적으로 식별해야 합니다.                                                                                   |

### 위치

차량 위치는 200미터 이내여야 합니다.GTFSshapes.txt 이에 대한 `DETOUR` 의 영향으로 경보가 발생하지 않는 한 현재 여행에 대한 데이터trip_id .

### 알리다

경고에 대한 일반 지침:

* 언제trip_id 그리고start_time `exact_time=1` 간격 내에 있으며,start_time `headway_secs` 의 정확한 배수만큼 간격의 시작보다 이후여야 합니다.
* 여러 날에 걸친 여행을 취소할 때 생산자는 취소(예: 우회)를 설명하는 라이더에게 표시될 수 있는 동일한 `trip_ids` 및 `TimeRange` 를 참조하는 `NO_SERVICE` 와 함께 지정된 `trip_ids` 및 `start_dates` 를 `CANCELED` 로 참조하는 TripUpdates를 제공해야 합니다.
* 경고가 한 노선의 모든 정류장에 영향을 미치는 경우, 정류장 기반 경고 대신 노선 기반 경고를 사용하십시오. 라인의 모든 정류장에 경고를 적용하지 마십시오.
* 서비스 알림에는 글자 수 제한이 없지만 대중교통 이용객은 종종 모바일 장치에서 알림을 볼 수 있습니다. 간결하게 부탁드립니다.

|  분야 명              |  추천                              |
| ------------------ | -------------------------------- |
| `description_text` |  서비스 경고를 읽기 쉽게 하려면 줄 바꿈을 사용하십시오. |

## 사용 사례별로 정리된 실습 권장 사항

### 빈도 기반 여행

빈도 기반 여행은 고정된 방식을 따르지 않습니다.Schedule 그러나 미리 결정된 진행 상황을 유지하려고 시도합니다. 이 여행은 [GTFS](<https://\<glossary variable=>) 로 표시됩니다. [.org/reference/static/#frequenciestxt">](<https://\<glossary variable=>)GTFS `exact_times=0` 을 설정하거나 `exact_times` 필드를 생략하여 [frequency.txt](<https://\<glossary variable=>) 를 생성합니다( `exact_times=1` 이동은 빈도 기반 이동이 *아닙니다* .frequencies.txt `exact_times=1` 은 단순히 저장을 위한 편리한 방법으로 사용됩니다.Schedule - 보다 간결한 방식으로 여행을 기반으로 함). 구성할 때 염두에 두어야 할 몇 가지 모범 사례가 있습니다.GTFSRealtime 빈도 기반 여행을 위한 피드.

* [TripUpdate.StopTimeUpdate](#StopTimeUpdate) 에서 `arrival` 및 `departure` 에 대한 [StopTimeEvent](#StopTimeEvent) 는 `delay` 을 포함하지 않아야 합니다.Schedule . 대신 도착/출발 예측을 나타내는 `time` 이 제공되어야 합니다.

* 사양에서 요구하는 대로 [TripDescriptor](#TripDescriptor) 를 사용하여 [TripUpdate](#TripUpdate) 또는 [VehiclePosition](#VehiclePosition) 에서 `trip` 을 설명할 때 모든trip_id ,start_time 및 `start_date` 를 제공해야 합니다. 또한 `schedule_relationship` 은 `UNSCHEDULED` 합니다.

(예: 재시행 여행).

## 이 문서 정보

### 목표

유지의 목적GTFSRealtime 모범 사례는 다음과 같습니다.

* 대중 교통 앱에서 최종 사용자 고객 경험 개선
* 소프트웨어 개발자가 애플리케이션, 제품 및 서비스를 더 쉽게 배포하고 확장할 수 있도록 합니다.

### 공표된 제안 또는 수정 방법GTFSRealtime 모범 사례

GTFS 응용 프로그램과 관행이 발전하므로 이 문서를 수시로 수정해야 할 수 있습니다. 이 문서에 대한 수정을 제안하려면 풀 리퀘스트 [를](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) 엽니다.GTFSRealtime [모범 사례 GitHub 리포지토리](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) 및 변경을 지지합니다.

### 이 문서에 연결

사료 생산자에게 올바른 형성을 위한 지침을 제공하려면 여기를 링크하십시오.GTFSRealtime 데이터. 각 개별 권장 사항에는 앵커 링크가 있습니다. 권장 사항을 클릭하여 인페이지 앵커 링크의 URL을 가져옵니다.

만약GTFSRealtime -소비 응용 프로그램은 요구 사항 또는 권장 사항을 만듭니다.GTFSRealtime 여기에 설명되지 않은 데이터 관행이 있는 경우 이러한 일반적인 모범 사례를 보완하기 위해 해당 요구 사항 또는 권장 사항이 포함된 문서를 게시하는 것이 좋습니다.
