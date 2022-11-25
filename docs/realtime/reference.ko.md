---
search:
  exclude: true
---

# GTFS Realtime 참조

ㅏGTFS Realtime 피드를 통해 대중 교통 기관은 서비스 중단(폐쇄된 역, 운행하지 않는 노선, 중요한 지연 등) 차량의 위치 및 예상되는 서비스 중단에 대한 실시간 정보를 소비자에게 제공할 수 있습니다.arrival 타임스.

피드 사양의 버전 2.0은 이 사이트에서 논의되고 문서화됩니다. 유효한 버전은 "2.0", "1.0"입니다.

# GTFS Realtime 참조

ㅏGTFS Realtime 피드를 통해 대중 교통 기관은 서비스 중단(폐쇄된 역, 운행하지 않는 노선, 중요한 지연 등) 차량의 위치 및 예상되는 서비스 중단에 대한 실시간 정보를 소비자에게 제공할 수 있습니다.arrival 타임스.

피드 사양의 버전 2.0은 이 사이트에서 논의되고 문서화됩니다. 유효한 버전은 "2.0", "1.0"입니다.

### 용어 정의

#### 필수의

\~ 안에GTFS -realtime v2.0 이상에서 *필수* 열은 대중 교통 데이터가 유효하고 소비 애플리케이션에 적합하기 위해 생산자가 제공해야 하는 필드를 설명합니다.

*필수* 필드에는 다음 값이 사용됩니다.

*   **필수** : 이 필드는GTFS - 실시간 피드 프로듀서.
*   **조건부 필수** : 이 필드는 설명 필드에 *설명* 된 특정 조건에서 필수입니다. 이러한 조건 외의 필드는 선택 사항입니다.
*   **선택 사항** : 이 필드는 선택 사항이며 생산자가 구현할 필요가 없습니다. 그러나 기본 자동에서 데이터를 사용할 수 있는 경우vehicle 위치 시스템(예:VehiclePositiontimestamp ) 가능한 경우 생산자가 이러한 선택적 필드를 제공하는 것이 좋습니다.

*의미론적 요구사항은 다음에서 정의되지 않았습니다.*GTFS *-실시간 버전 1.0, 따라서 피드*gtfs_realtime_version *`1` 이 이러한 요구 사항을 충족하지 않을 수 있습니다(자세한 내용 [은 의미론적 요구 사항 제안](https://github.com/google/transit/pull/64) 참조).*

#### 카디널리티

*카디널리티* 는 다음 값으로 특정 필드에 제공될 수 있는 요소의 수를 나타냅니다.

*   **하나** - 이 필드에 대해 하나의 요소가 제공될 수 있습니다. 이것은 [프로토콜 버퍼 *필수* 및 *선택적* 카디널리티](https://developers.google.com/protocol-buffers/docs/proto#simple) 에 매핑됩니다.
*   **다수** - 이 필드에 대해 많은 요소(0, 1 또는 그 이상)가 제공될 수 있습니다. 이것은 [프로토콜 버퍼 *반복* 카디널리티](https://developers.google.com/protocol-buffers/docs/proto#simple) 에 매핑됩니다.

필드가 필수인지, 조건부 필수인지, 선택 사항인지 확인하려면 항상 *필수* 및 *설명* 필드를 참조하십시오. [GTFS를](<https://github.com/google/transit/blob/master/\<glossary variable=>) 참조하십시오 [-실시간/프로토/](<https://github.com/google/transit/blob/master/\<glossary variable=>)GTFS [-realtime.proto">](<https://github.com/google/transit/blob/master/\<glossary variable=>)GTFS -프로토콜 버퍼 카디널리티를 위한 [`GTFS -realtime.proto`](<https://github.com/google/transit/blob/master/\<glossary variable=>) .

#### 프로토콜 버퍼 데이터 유형

다음 프로토콜 버퍼 데이터 유형은 피드 요소를 설명하는 데 사용됩니다.

*   message : 복합형
*   enum : 고정 값 목록

#### 실험 분야

**실험** 으로 표시된 필드는 변경될 수 있으며 아직 사양에 공식적으로 채택되지 않았습니다. 향후에는 **실험** 분야가 정식으로 채택될 수 있습니다.


## 요소 색인

*   [FeedMessage](#message-feedmessage)
    *   [FeedHeader](#message-feedheader)
        *   [Incrementality](#enum-incrementality)
    *   [FeedEntity](#message-feedentity)
        *   [TripUpdate](#message-tripupdate)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [VehicleDescriptor](#message-vehicledescriptor)
                *   [WheelchairAccessible](#enum-wheelchairaccessible)
            *   [StopTimeUpdate](#message-stoptimeupdate)
                *   [StopTimeEvent](#message-stoptimeevent)
                *   [ScheduleRelationship](#enum-schedulerelationship)
                *   [StopTimeProperties](#message-stoptimeproperties)
            *   [TripProperties](#message-tripproperties)
        *   [VehiclePosition](#message-vehicleposition)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [VehicleDescriptor](#message-vehicledescriptor)
                *   [WheelchairAccessible](#enum-wheelchairaccessible)
            *   [Position](#message-position)
            *   [VehicleStopStatus](#enum-vehiclestopstatus)
            *   [CongestionLevel](#enum-congestionlevel)
            *   [OccupancyStatus](#enum-occupancystatus)
            *   [CarriageDetails](#message-carriagedetails)
        *   [Alert](#message-alert)
            *   [TimeRange](#message-timerange)
            *   [EntitySelector](#message-entityselector)
                *   [TripDescriptor](#message-tripdescriptor)
                    *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [Cause](#enum-cause)
            *   [Effect](#enum-effect)
            *   [TranslatedString](#message-translatedstring)
                *   [Translation](#message-translation)
            *   [SeverityLevel](#enum-severitylevel)

## 집단

## messageFeedMessage

피드의 내용message . 각message 스트림에서 적절한 HTTP GET 요청에 대한 응답으로 획득됩니다. 실시간 피드는 항상 기존GTFS 밥을 먹이다. 모든entity id는 다음과 관련하여 해결됩니다.GTFS 밥을 먹이다.

**필드**

| _** 분야 명**_ | _** 유형**_                         | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                    |
| ----------- | --------------------------------- | ---------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| **header**  | [FeedHeader](#message-feedheader) |  필수의       |  하나          |  이 피드 및 피드에 대한 메타데이터message .                                                                                                |
| **entity**  | [FeedEntity](#message-feedentity) |  조건부 필수    |  많은          |  피드의 내용입니다. 진짜가 있다면-time 대중교통 시스템에 대한 정보를 제공하려면 이 필드를 제공해야 합니다. 이 필드가EMPTY , 소비자는 실제가 없다고 가정해야 합니다.time 시스템에 사용할 수 있는 정보입니다. |

## messageFeedHeader

피드 메시지에 포함된 피드에 대한 메타데이터입니다.

**필드**

| _** 분야 명**_               | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                 |
| ------------------------- | -------------------------------------------------------------------------- | ---------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **gtfs_realtime_version** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  필수의       |  하나          |  피드 사양의 버전입니다. 현재 버전은 2.0입니다.                                                                                                                                                                                                             |
| **Incrementality**        | [Incrementality](#enum-incrementality)                                     |  필수의       |  하나          |                                                                                                                                                                                                                                           |
| **timestamp**             | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  필수의       |  하나          |  이것timestamp 이 피드의 콘텐츠가 생성된 순간을 식별합니다(서버에서time ). POSIX에서time (즉, 1970년 1월 1일 00:00:00 UTC 이후 경과된 초 수). 피하기 위해time 실시간 정보를 생산하고 소비하는 시스템 간의 왜곡timestamp 에서time 섬기는 사람. Stratum 3 이하의 Strata 서버를 사용하는 것은 완전히 허용됩니다.time 최대 몇 초의 차이는 허용됩니다. |


## enumIncrementality

현재 페치가 증분인지 여부를 결정합니다.

*   FULL_DATASET : 이 피드 업데이트는 피드에 대한 이전의 모든 실시간 정보를 덮어씁니다. 따라서 이 업데이트는 다음을 제공할 것으로 예상됩니다.FULL 알려진 모든 실시간 정보의 스냅샷.
*   DIFFERENTIAL : 현재 이 모드는 **지원되지 않으며** 이 모드를 사용하는 피드에 대한 동작이 **지정되지 않았습니다** . [GTFS](<https://groups.google.com/group/\<glossary variable=>) 에 대한 토론이 있습니다. [-실시간">](<https://groups.google.com/group/\<glossary variable=>)GTFS Realtime 행동을 완전히 지정하는 [메일링 리스트](<https://groups.google.com/group/\<glossary variable=>)DIFFERENTIAL 모드 및 문서는 해당 토론이 완료되면 업데이트됩니다.

**가치**

| _** 값**_         |
| ---------------- |
| **FULL_DATASET** |
| **DIFFERENTIAL** |

## messageFeedEntity

의 정의(또는 업데이트)entity 대중교통 피드에서 만약entity 삭제되지 않습니다. 정확히 'trip_update ', 'vehicle ', 'Alert ' 그리고 'Shape ' 필드를 채워야 합니다.

**필드**

| _** 분야 명**_     | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                      |
| --------------- | -------------------------------------------------------------------------- | ---------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **id**          | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  필수의       |  하나          |  이에 대한 피드 고유 식별자entity . ID는 제공하는 용도로만 사용됩니다.Incrementality 지원하다. 피드에서 참조하는 실제 엔터티는 명시적 선택기로 지정해야 합니다(참조EntitySelector 자세한 내용은 아래INFO ).                                       |
| **is_deleted**  | [bool](https://developers.google.com/protocol-buffers/docs/proto#scalar)   |  선택 과목     |  하나          |  이 여부entity 삭제됩니다. 다음이 포함된 피드에만 제공되어야 합니다.Incrementality 의DIFFERENTIAL - 이 필드는 다음이 포함된 피드에 제공되어서는 안 됩니다.Incrementality 의FULL_DATASET .                                         |
| **trip_update** | [TripUpdate](#message-tripupdate)                                          |  조건부 필수    |  하나          |  실시간 데이터departure 지연trip . 필드 중 하나 이상trip_update ,vehicle ,Alert , 또는Shape 제공해야 합니다. 이 모든 필드는EMPTY .                                                                           |
| **vehicle**     | [VehiclePosition](#message-vehicleposition)                                |  조건부 필수    |  하나          |  실시간 데이터Position ~의vehicle . 필드 중 하나 이상trip_update ,vehicle ,Alert , 또는Shape 제공해야 합니다. 이 모든 필드는EMPTY .                                                                         |
| **Alert**       | [Alert](#message-alert)                                                    |  조건부 필수    |  하나          |  실시간 데이터Alert . 필드 중 하나 이상trip_update ,vehicle ,Alert , 또는Shape 제공해야 합니다. 이 모든 필드는EMPTY .                                                                                      |
| **Shape**       | [Shape](#message-shape)                                                    |  조건부 필수    |  하나          |  실시간 데이터ADDED 와 같은 모양DETOUR . 필드 중 하나 이상trip_update ,vehicle ,Alert , 또는Shape 제공해야 합니다. 이 모든 필드는EMPTY .<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다. |


## messageTripUpdate

진행 상황에 대한 실시간 업데이트vehicle 따라trip . [여행](</realtime/\<glossary variable=>) 에 대한 일반적인 논의도 참조하십시오. [-업데이트">](</realtime/\<glossary variable=>)trip [엔티티를 업데이트합니다](</realtime/\<glossary variable=>) .

의 가치에 따라ScheduleRelationship , ㅏTripUpdate 다음을 지정할 수 있습니다.

*   ㅏtrip 일정에 따라 진행됩니다.
*   ㅏtrip 경로를 따라 진행되지만 고정된 일정이 없습니다.
*   ㅏtrip 그것은ADDED 또는 일정과 관련하여 삭제되었습니다.
*   새로운trip 그것은 기존의 사본입니다trip 정적으로GTFS . 서비스 날짜에 실행되며time 에 지정된TripProperties .

업데이트는 미래에 대해 예측할 수 있습니다.arrival /departure 이벤트 또는 이미 발생한 과거 이벤트. 대부분의 경우 과거 사건에 대한 정보는 측정된 값이므로uncertainty 값은 0을 권장합니다. 이것이 유지되지 않는 경우가 있을 수 있으므로uncertainty 과거 이벤트에 대해 0과 다른 값. 업데이트의 경우uncertainty 가 0이 아니면 업데이트가 대략적인 예측인 경우trip 완료되지 않았거나 측정이 정확하지 않거나 업데이트가 이벤트 발생 후 확인되지 않은 과거에 대한 예측이었습니다.

만약vehicle 동일한 블록 내에서 여러 여행을 제공하고 있습니다(여행 및 블록에 대한 자세한 내용은GTFStrips.txt ):

*   피드에는TripUpdate 위해trip 현재 서비스 중인vehicle . 생산자는 현재 이후 하나 이상의 여행에 대해 TripUpdates를 포함하는 것이 좋습니다.trip 이것에vehicle 생산자가 이러한 미래에 대한 예측의 품질을 확신하는 경우 의 블록trip (에스). 동일한 항목에 대한 여러 TripUpdate 포함vehicle 라이더에 대한 예측 "팝인"을 방지합니다.vehicle 하나에서 전환trip 하류 여행에 영향을 미치는 지연에 대해 라이더에게 사전 통지합니다(예: 알려진delay 여행 사이에 예정된 경유 시간을 초과함).
*   각각의TripUpdate 엔터티는 필요하지 않습니다.ADDED 같은 순서로 피드에SCHEDULED 블록에서. 예를 들어 `trip_ids` 가 1, 2, 3인 여행이 있고 모두 하나의 블록에 속하는 경우vehicle 여행기trip 1, 그럼trip 2, 그리고 나서trip 3,trip_update 엔티티는 임의의 순서로 나타날 수 있습니다(예: 추가trip 2, 그럼trip 1, 그리고 나서trip 3이 허용됩니다.

업데이트는 다음을 설명할 수 있습니다.trip 그것은 이미 완료되었습니다. 이것에end , 마지막 중지에 대한 업데이트를 제공하는 것으로 충분합니다.trip . 만약time 의arrival 마지막 정류장이 과거라면 클라이언트는 전체가trip 과거에 있습니다(중요하지는 않지만 이전 정류장에 대한 업데이트도 제공할 수 있음). 이 옵션은 다음과 가장 관련이 있습니다.trip 예정보다 일찍 완료되었지만, 일정에 따라trip 현재도 진행 중time . 이에 대한 업데이트 제거trip 클라이언트가trip 아직 진행 중입니다. 피드 공급자는 과거 업데이트를 제거하는 것이 허용되지만 필수는 아닙니다. 이것이 실제로 유용한 한 가지 경우입니다.

**필드**

| _** 분야 명**_          | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| -------------------- | -------------------------------------------------------------------------- | ---------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**             | [TripDescriptor](#message-tripdescriptor)                                  |  필수의       |  하나          |  그만큼trip 이message 에 적용됩니다. 많아야 하나가 있을 수 있다TripUpdateentity 각각의 실제trip 사례. 없는 경우 예측 정보를 사용할 수 없음을 의미합니다. 그렇습니다_ ~ 아니다_ 의미trip 일정에 따라 진행되고 있습니다.                                                                                                                                                                                                                                                                                                                                            |
| **vehicle**          | [VehicleDescriptor](#message-vehicledescriptor)                            |  선택 과목     |  하나          |  에 대한 추가 정보vehicle 이것은 이것을 제공하는 것입니다trip .                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| **stop_time_update** | [StopTimeUpdate](#message-stoptimeupdate)                                  |  조건부 필수    |  많은          |  StopTimes에 대한 업데이트trip (미래, 즉 예측과 어떤 경우에는 과거의 것, 즉 이미 일어난 것). 업데이트는 다음 기준으로 정렬되어야 합니다.stop_sequence , 그리고 다음의 모든 정류장에 신청하십시오.trip 지정된 다음까지stop_time_update . 적어도 하나stop_time_update 에 대해 제공되어야 합니다.trip 하지 않는 한trip .schedule_relationship ~이다CANCELED 또는DUPLICATED - 만약trip ~이다CANCELED , stop_time_updates를 제공할 필요가 없습니다. 만약trip ~이다DUPLICATED , stop_time_updates는 실제를 나타내기 위해 제공될 수 있습니다.time 새로운 정보trip .                                                                           |
| **timestamp**        | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  가장 최근의 순간vehicle 진짜-time 향후 StopTimes를 추정하기 위해 진행 상황을 측정했습니다. 과거의 StopTimes가 제공되면,arrival /departure 시간은 이 값보다 빠를 수 있습니다. POSIX에서time (즉, 1970년 1월 1일 00:00:00 UTC 이후 경과된 초 수).                                                                                                                                                                                                                                                                                                          |
| **delay**            | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  |  선택 과목     |  하나          |  현재 일정 편차trip .delay 의 일부 기존 일정과 관련하여 예측이 제공된 경우에만 지정해야 합니다.GTFS .<br/>delay (초 단위)는 양수일 수 있습니다(즉,vehicle 늦음) 또는 음수(즉,vehicle 예정보다 빠릅니다).delay 0의 의미는vehicle 정확히 켜져있다time .<br/>delay StopTimeUpdates의 정보가 우선합니다.trip -수준delay 정보trip -수준delay 다음 중지 때까지만 전파됩니다.trip 와StopTimeUpdatedelay 값이 지정되었습니다.<br/> 피드 제공자는 다음을 제공할 것을 강력히 권장합니다.TripUpdate .timestamp 때를 나타내는 값delay 데이터의 최신성을 평가하기 위해 값이 마지막으로 업데이트되었습니다.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다. |
| **trip_properties**  | [TripProperties](#message-tripproperties)                                  |  선택 과목     |  하나          |  업데이트된 속성을 제공합니다.trip .<br/><br/>** 주의:** 이것message 아직** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                                                                                                                                                                                                         |


## messageStopTimeEvent

단일 예측 이벤트에 대한 타이밍 정보(또는arrival 또는departure ). 타이밍 구성delay 및/또는 추정time , 그리고uncertainty .

*   delay 의 일부 기존 일정과 관련하여 예측이 제공될 때 사용되어야 합니다.GTFS .
*   time 예정된 일정이 있는지 없는지 여부를 지정해야 합니다. 만약 둘 다time 그리고delay 지정되고,time 우선적으로 적용됩니다(일반적으로time , 에 대해 주어진 경우SCHEDULEDtrip , 다음과 같아야 합니다.SCHEDULEDtime 안에GTFS +delay ).

uncertainty 둘 다 동일하게 적용time 그리고delay . 그만큼uncertainty 대략적으로 예상 오류를 true로 지정합니다.delay (그러나 우리는 아직 정확한 통계적 의미를 정의하지 않습니다). 에 가능합니다uncertainty 예를 들어 컴퓨터 타이밍 제어 하에 운행되는 열차의 경우 0이 됩니다.

**필드**

| _** 분야 명**_     | _** 유형**_                                                                 | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                        |
| --------------- | ------------------------------------------------------------------------- | ---------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **delay**       | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          | delay (초 단위)는 양수일 수 있습니다(즉,vehicle 늦음) 또는 음수(즉,vehicle 예정보다 빠릅니다).delay 0의 의미는vehicle 정확히 켜져있다time . 어느 하나delay 또는time 이내에 제공되어야 합니다.StopTimeEvent - 두 필드를 모두 사용할 수 없습니다.EMPTY . |
| **time**        | [int64](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  절대 이벤트time . POSIX에서time (즉, 1970년 1월 1일 00:00:00 UTC 이후의 초 수). 어느 하나delay 또는time 이내에 제공되어야 합니다.StopTimeEvent - 두 필드를 모두 사용할 수 없습니다.EMPTY .                                     |
| **uncertainty** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  만약에uncertainty 생략하면 알 수 없는 것으로 해석됩니다. 완전히 특정 예측을 지정하려면uncertainty 0으로.                                                                                                          |

## messageStopTimeUpdate

에 대한 실시간 업데이트arrival 및/또는departure 지정된 정류장에 대한 이벤트trip . stop에 대한 일반적인 논의도 참조하십시오.time [메시지](<#\<glossary variable=>) 의 업데이트 [-tripdescriptor">](<#\<glossary variable=>)TripDescriptor 그리고 [여행](</realtime/\<glossary variable=>) [-업데이트">](</realtime/\<glossary variable=>)trip [엔티티 문서를 업데이트](</realtime/\<glossary variable=>) 합니다.

과거 및 미래 이벤트 모두에 대한 업데이트를 제공할 수 있습니다. 생산자는 필수는 아니지만 과거 이벤트를 삭제할 수 있습니다.

업데이트는 다음 중 하나를 통해 특정 정류장에 연결됩니다.stop_sequence 또는stop_id , 따라서 이러한 필드 중 하나는 반드시 설정되어야 합니다. 같은 경우stop_id 에서 두 번 이상 방문trip , 그 다음에stop_sequence 이에 대한 모든 StopTimeUpdates에 제공되어야 합니다.stop_id 그것에trip .

**필드**

| _** 분야 명**_                    | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                                                                        |
| ------------------------------ | -------------------------------------------------------------------------- | ---------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **stop_sequence**              | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  에서와 같아야 합니다.stop_times.txt 해당하는GTFS 밥을 먹이다. 어느 하나stop_sequence 또는stop_id 이내에 제공되어야 합니다.StopTimeUpdate - 두 필드를 모두 사용할 수 없습니다.EMPTY .stop_sequence 같은 곳을 방문하는 여행에 필요합니다.stop_id 두 번 이상(예: 루프) 예측이 중지되는 위치를 명확하게 합니다. 만약에`StopTimeProperties.assigned_stop_id` 채워진 다음`stop_sequence` 채워져야 합니다.                                     |
| **stop_id**                    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  에서와 같아야 합니다.stops.txt 해당하는GTFS 밥을 먹이다. 어느 하나stop_sequence 또는stop_id 이내에 제공되어야 합니다.StopTimeUpdate - 두 필드를 모두 사용할 수 없습니다.EMPTY . 만약에`StopTimeProperties.assigned_stop_id` 채워져 있으면 생략하는 것이 좋습니다.`stop_id` 만 사용`stop_sequence` . 만약에`StopTimeProperties.assigned_stop_id` 그리고`stop_id` 인구가 많고,`stop_id` 일치해야합니다`assigned_stop_id` . |
| **arrival**                    | [StopTimeEvent](#message-stoptimeevent)                                    |  조건부 필수    |  하나          |  만약에schedule_relationship ~이다EMPTY 또는SCHEDULED , 어느 하나arrival 또는departure 이내에 제공되어야 합니다.StopTimeUpdate - 두 필드를 모두 사용할 수 없습니다.EMPTY .arrival 그리고departure 둘 다 일 수 있습니다EMPTY 언제schedule_relationship ~이다SKIPPED . 만약에schedule_relationship NO_DATA이며,arrival 그리고departure 이어야 한다EMPTY .                                            |
| **departure**                  | [StopTimeEvent](#message-stoptimeevent)                                    |  조건부 필수    |  하나          |  만약에schedule_relationship ~이다EMPTY 또는SCHEDULED , 어느 하나arrival 또는departure 이내에 제공되어야 합니다.StopTimeUpdate - 두 필드를 모두 사용할 수 없습니다.EMPTY .arrival 그리고departure 둘 다 일 수 있습니다EMPTY 언제schedule_relationship ~이다SKIPPED . 만약에schedule_relationship NO_DATA이며,arrival 그리고departure 이어야 한다EMPTY .                                            |
| **departure_occupancy_status** | [OccupancyStatus](#enum-occupancystatus)                                   |  선택 과목     |  하나          |  예상 탑승객 현황vehicle 직후departure 주어진 정류장에서. 제공되는 경우,stop_sequence 제공되어야 합니다. 제공하기 위해departure_occupancy_status 실제 제공하지 않고timearrival 또는departure 예측, 이 필드를 채우고 설정StopTimeUpdate .schedule_relationship = NO_DATA.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                            |
| **schedule_relationship**      | [ScheduleRelationship](#enum-schedulerelationship)                         |  선택 과목     |  하나          |  기본 관계는SCHEDULED .                                                                                                                                                                                                                                                                                                               |
| **stop_time_properties**       | [StopTimeProperties](#message-stoptimeproperties)                          |  선택 과목     |  하나          |  내에 정의된 특정 속성에 대한 실시간 업데이트GTFSstop_times.txt<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                              |


## enumScheduleRelationship

이 StopTime과 정적 일정 간의 관계입니다.

**가치**

| _** 값**_        | _** 논평**_                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SCHEDULED**   |  그만큼vehicle 반드시 일정의 시간에 따르지는 않지만 정적인 정차 일정에 따라 진행됩니다. 이것이** 기본** 행동. 다음 중 하나 이상arrival 그리고departure 제공되어야 합니다. 빈도 기반 여행(GTFSfrequencies.txt exact_times = 0)SCHEDULED 가치와 사용해야 합니다UNSCHEDULED 대신에.                                                                                                                                                                                                                                                              |
| **SKIPPED**     |  정류장은SKIPPED , 즉,vehicle 이 정류장에서 멈추지 않습니다.arrival 그리고departure 선택 사항입니다. 설정 시`SKIPPED` 동일한 다음 중지로 전파되지 않습니다.trip (즉,vehicle 다음 정류장에서 정차합니다.trip 해당 정류장에도`stop_time_update` ~와 함께`schedule_relationship: SKIPPED` ).delay 이전 정류장에서trip_ 하다_ 전파하다`SKIPPED` 멈추다. 즉, 만약`stop_time_update` 와`arrival` 또는`departure` 다음 중지에 대한 예측이 설정되지 않았습니다.`SKIPPED` 중지, 예측 업스트림`SKIPPED` stop은 이후 stop으로 전파됩니다.`SKIPPED` 중지 및 후속 중지trip 까지`stop_time_update` 후속 정지에 대한 정보가 제공됩니다. |
| ** NO_DATA**    |  이 정류장에 대한 데이터가 제공되지 않습니다. 사용 가능한 실시간 타이밍 정보가 없음을 나타냅니다. NO_DATA가 설정되면 후속 정류장을 통해 전파되므로 실시간 타이밍 정보가 없는 정류장을 지정하는 데 권장되는 방법입니다. NO_DATA가 둘 다 설정되지 않은 경우arrival ...도 아니다departure 공급되어야 합니다.                                                                                                                                                                                                                                                                      |
| **UNSCHEDULED** |  그만큼vehicle 주파수 기반으로 운영하고 있습니다.trip (GTFSfrequencies.txt 정확한_시간 = 0). 이 값은 다음에 정의되지 않은 여행에 사용되어서는 안 됩니다.GTFSfrequencies.txt , 또는 여행GTFSfrequencies.txt Exact_times = 1인 경우.`stop_time_updates` ~와 함께`schedule_relationship: UNSCHEDULED` 도 설정해야 합니다TripDescriptor`schedule_relationship: UNSCHEDULED` <br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                   |

## messageStopTimeProperties

내에 정의된 특정 속성에 대한 실시간 업데이트GTFSstop_times.txt .

**주의:** 이message 아직 **실험적** 이며 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.<br/>

**필드**

| _** 분야 명**_          | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| -------------------- | -------------------------------------------------------------------------- | ---------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **assigned_stop_id** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  실제 지원time 과제를 중지합니다. 다음을 참조하십시오`stop_id` 에 정의된GTFS`stops.txt` .<br/> 새로운`assigned_stop_id` 크게 다른 결과를 가져서는 안 됩니다.trip 에 대한 경험end 사용자보다`stop_id` 에 정의GTFS`stop_times.txt` . 다시 말해,end 사용자는 이 새 항목을 볼 수 없습니다.`stop_id`추가 컨텍스트 없이 앱 내에 새로운 정류장이 표시되는 경우 "비정상적 변경"으로 간주됩니다. 예를 들어, 이 필드는`stop_id` 원래 정의 된 정류장과 동일한 역에 속하는GTFS`stop_times.txt` .<br/> 실제 제공하지 않고 중지를 지정하려면timearrival 또는departure 예측, 이 필드를 채우고 설정`StopTimeUpdate.schedule_relationship = NO_DATA` .<br/> 이 필드가 채워지면`StopTimeUpdate.stop_sequence` 채워져야 하고`StopTimeUpdate.stop_id` 채워지지 않아야 합니다. 중지 할당은 다른 항목에 반영되어야 합니다.GTFS -실시간 필드(예:`VehiclePosition.stop_id` ).<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다. |

## messageTripProperties

업데이트된 속성을 정의합니다.trip

**주의:** 이message 아직 **실험적** 이며 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.<br/>.

**필드**

| _** 분야 명**_    | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| -------------- | -------------------------------------------------------------------------- | ---------- | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  새 식별자를 정의합니다.trip 그것은 기존의 복제본입니다trip (CSV)에 정의GTFStrips.txt 하지만 그럴 것이다start 다른 서비스 날짜 및/또는time (다음을 사용하여 정의`TripProperties.start_date` 그리고`TripProperties.start_time` ). 정의 참조`trips.trip_id` (CSV)GTFS . 값은 (CSV)에 사용된 값과 달라야 합니다.GTFS . 이 필드는 다음과 같은 경우 필수입니다.`schedule_relationship` ~이다`DUPLICATED` , 그렇지 않으면 이 필드를 채워서는 안 되며 소비자가 무시합니다.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **start_date** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  서비스 날짜DUPLICATEDtrip 실행됩니다. YYYYMMDD 형식으로 제공해야 합니다. 이 필드는 다음과 같은 경우 필수입니다.`schedule_relationship` ~이다`DUPLICATED` , 그렇지 않으면 이 필드를 채워서는 안 되며 소비자가 무시합니다.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **start_time** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  다음을 정의합니다.departurestarttime 의trip 때DUPLICATED . 정의 참조`stop_times.departure_time` (CSV)GTFS .SCHEDULEDarrival 그리고departure 시간DUPLICATEDtrip 원본 사이의 오프셋을 기반으로 계산됩니다.trip`departure_time` 그리고 이 분야. 예를 들어GTFStrip A 스톱이 있습니다.`departure_time` 의`10:00:00` 다음으로 B를 중지`departure_time` 의`10:01:00` , 이 필드는 다음 값으로 채워집니다.`10:30:00` , 정지 BDUPLICATEDtrip 가질 것이다SCHEDULED`departure_time` 의`10:31:00` . 진짜-time 예측`delay` 이 계산된 일정에 값이 적용됩니다.time 예측을 결정하기 위해time . 예를 들어departure`delay` 의`30` 정류장 B에 대해 제공되고 예측된departuretime ~이다`10:31:30` . 진짜-time 예측`time` 값에는 오프셋이 적용되지 않고 예측됨을 나타냅니다.time 제공된대로. 예를 들어departure`time` 10시 31분 30초를 나타내는 정류장 B에 대해 제공된 다음 예측departuretime ~이다`10:31:30` .이 필드는 다음과 같은 경우 필수입니다.`schedule_relationship` ~이다`DUPLICATED` , 그렇지 않으면 이 필드를 채워서는 안 되며 소비자가 무시합니다.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다. |
| **shape_id**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  다음을 지정합니다.Shape 의vehicle 이를 위한 여행 경로trip 원본과 다를 때. 다음을 참조하십시오Shape (CSV)에 정의GTFS 또는 새로운Shapeentity 실제-time 밥을 먹이다. 정의 참조`trips.shape_id` (CSV)GTFS .<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |


## messageVehiclePosition

주어진 실시간 위치 정보vehicle .

**필드**

| _** 분야 명**_                | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                                                                                                                                                                     |
| -------------------------- | -------------------------------------------------------------------------- | ---------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**                   | [TripDescriptor](#message-tripdescriptor)                                  |  선택 과목     |  하나          |  그만큼trip 이vehicle 봉사 중입니다. 수EMPTY 또는 부분적인 경우vehicle 주어진 것으로 식별 할 수 없습니다trip 사례.                                                                                                                                                                                                                                                                                                                                               |
| **vehicle**                | [VehicleDescriptor](#message-vehicledescriptor)                            |  선택 과목     |  하나          |  에 대한 추가 정보vehicle 이것은 이것을 제공하는 것입니다trip . 각 항목에는 다음이 있어야 합니다.** 독특한**vehicleid .                                                                                                                                                                                                                                                                                                                                             |
| **Position**               | [Position](#message-position)                                              |  선택 과목     |  하나          |  현재의Position 이의vehicle .                                                                                                                                                                                                                                                                                                                                                                                                      |
| **current_stop_sequence**  | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  현재 정류장의 정류장 순서 인덱스입니다. 그 의미current_stop_sequence (즉, 참조하는 중지)는 다음과 같이 결정됩니다.current_status . 만약에current_status 누락IN_TRANSIT_TO 가정됩니다.                                                                                                                                                                                                                                                                                        |
| **stop_id**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  현재 정류장을 식별합니다. 값은 다음과 같아야 합니다.stops.txt 해당하는GTFS 밥을 먹이다. 만약에`StopTimeProperties.assigned_stop_id` 할당하는 데 사용됩니다.`stop_id` , 이 필드는 변경 사항도 반영해야 합니다.`stop_id` .                                                                                                                                                                                                                                                                 |
| **current_status**         | [VehicleStopStatus](#enum-vehiclestopstatus)                               |  선택 과목     |  하나          |  정확한 상태는vehicle 현재 정류장에 대해. 다음 경우 무시current_stop_sequence 누락.                                                                                                                                                                                                                                                                                                                                                                 |
| **timestamp**              | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  하는 순간vehicle '에스Position 측정되었다. POSIX에서time (즉, 1970년 1월 1일 00:00:00 UTC 이후의 초 수).                                                                                                                                                                                                                                                                                                                                           |
| **congestion_level**       | [CongestionLevel](#enum-congestionlevel)                                   |  선택 과목     |  하나          |                                                                                                                                                                                                                                                                                                                                                                                                                               |
| **occupancy_status**       | [OccupancyStatus](#enum-occupancystatus)                                   | _ 선택 과목_   |  하나          |  대한항공 탑승객 현황vehicle 또는 운송. 만약에multi_carriage_details 캐리지별로 채워집니다.OccupancyStatus , 이 필드는 전체를 설명해야 합니다.vehicle 승객을 수용하는 모든 객차를 고려합니다.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                                   |
| **occupancy_percentage**   | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  승객의 탑승 정도를 나타내는 백분율 값vehicle . 값 100은 총 최대 수용 인원을 나타내야 합니다.vehicle 좌석 및 입석 용량을 모두 포함하여 설계되었으며 현재 운영 규정에서 허용합니다. 최대 설계 수용 인원보다 많은 승객이 있는 경우 값은 100을 초과할 수 있습니다. 정밀도occupancy_percentage 개별 승객이 탑승 또는 하차를 추적할 수 없을 정도로 낮아야 합니다.vehicle . 만약에multi_carriage_details 캐리지별로 채워집니다.occupancy_percentage , 이 필드는 전체를 설명해야 합니다.vehicle 승객을 수용하는 모든 객차를 고려합니다.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다. |
| **multi_carriage_details** | [CarriageDetails](#message-CarriageDetails)                                |  선택 과목     |  많은          |  이 주어진 다중 운송의 세부 사항vehicle . 첫 번째 항목은 첫 번째 캐리지를 나타냅니다.vehicle ,** 현재 진행 방향을 고려하여** . 의 발생 횟수multi_carriage_details 필드의 캐리지 수를 나타냅니다.vehicle . 또한 엔진과 같이 탑승할 수 없는 객차도 포함됩니다.MAINTENANCE 객차 등... 승강장에 서 있어야 할 위치에 대한 귀중한 정보를 승객에게 제공합니다.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                 |

## enumVehicleStopStatus

**가치**

| _** 값**_          | _** 논평**_                                                    |
| ----------------- | ------------------------------------------------------------ |
| **INCOMING_AT**   |  그만큼vehicle 정류장에 막 도착하려고 합니다(정류장 표시에서vehicle 기호는 일반적으로 깜박임). |
| **STOPPED_AT**    |  그만큼vehicle 정류장에 서 있습니다.                                     |
| **IN_TRANSIT_TO** |  그만큼vehicle 이전 정류장에서 출발하여 이동 중입니다.                           |

## enumCongestionLevel

CONGESTION 이에 영향을 미치는 수준vehicle .

**가치**

| _** 값**_                     |
| ---------------------------- |
| **UNKNOWN_CONGESTION_LEVEL** |
| **RUNNING_SMOOTHLY**         |
| **STOP_AND_GO**              |
| **CONGESTION**               |
| **SEVERE_CONGESTION**        |

## enumOccupancyStatus

대한항공 탑승객 현황vehicle 또는 운송.

개별 제작자는 모든 내용을 게시할 수 없습니다.OccupancyStatus 가치. 따라서 소비자는 다음과 같이 가정해서는 안됩니다.OccupancyStatus 값은 선형 척도를 따릅니다. 소비자가 대표해야OccupancyStatus 생산자가 표시하고 의도한 상태의 값입니다. 마찬가지로 생산자는 다음을 사용해야 합니다.OccupancyStatus 실제에 해당하는 값vehicle 점유 상태.

선형 척도에서 승객 점유율 수준을 설명하려면 다음을 참조하십시오.occupancy_percentage .

**주의:** 이 필드는 아직 **실험 단계** 이며 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.

_**가치**_

| _** 값**_                         | _** 논평**_                                                                                                     |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| _**EMPTY**_                      | _ 그만큼vehicle 고려EMPTY 대부분의 기준으로 승객이 거의 또는 전혀 없지만 여전히 승객을 수용하고 있습니다._                                           |
| _**MANY_SEATS_AVAILABLE**_       | _ 그만큼vehicle 또는 캐리지에 이용 가능한 좌석이 많습니다. 이 범주에 속할 만큼 충분히 큰 것으로 간주될 수 있는 전체 좌석 중 자유 좌석의 양은 제작자의 재량에 따라 결정됩니다._    |
| _**FEW_SEATS_AVAILABLE**_        | _ 그만큼vehicle 또는 캐리지에 사용 가능한 좌석 수가 적습니다. 이 범주에 속할 만큼 충분히 작은 것으로 간주될 수 있는 전체 좌석 중 자유 좌석의 양은 제작자의 재량에 따라 결정됩니다._ |
| _**STANDING_ROOM_ONLY**_         | _ 그만큼vehicle 또는 캐리지는 현재 서 있는 승객만 수용할 수 있습니다._                                                                 |
| _**CRUSHED_STANDING_ROOM_ONLY**_ | _ 그만큼vehicle 또는 캐리지는 현재 서 있는 승객만 수용할 수 있으며 승객을 위한 공간이 제한되어 있습니다._                                             |
| _**FULL**_                       | _ 그만큼vehicle 고려FULL 대부분의 조치에 의해 승객의 탑승을 허용할 수 있습니다._                                                          |
| _**NOT_ACCEPTING_PASSENGERS**_   | _ 그만큼vehicle 또는 운송이 승객을 수락하지 않습니다. 그만큼vehicle 또는 운송은 일반적으로 승객의 탑승을 허용합니다._                                    |
| _**NO_DATA_AVAILABLE**_          | _ 그만큼vehicle 또는 해당 운송에 이용 가능한 탑승 데이터가 없습니다.time ._                                                            |
| _**NOT_BOARDABLE**_              | _ 그만큼vehicle 또는 운송에 탑승할 수 없으며 승객을 수용하지 않습니다. 특수 차량이나 객차(엔진,MAINTENANCE 운송 등…)._                               |

## messageCarriageDetails

여러 객차로 구성된 차량에 사용되는 객차별 세부정보입니다.

**주의:** 이message 아직 **실험적** 이며 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.

**필드**

| _** 분야 명**_              | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ------------------------ | -------------------------------------------------------------------------- | ---------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**                   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  운송의 식별. 에 따라 고유해야 합니다.vehicle .<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                                                                                                                                                  |
| **label**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          | 사용자가 볼 수 있음label 운송을 식별하는 데 도움이 되도록 승객에게 표시될 수 있습니다. 예: "7712", "자동차 ABC-32" 등...<br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                                                                                                      |
| **occupancy_status**     | [OccupancyStatus](#enum-occupancystatus)                                   |  선택 과목     |  하나          |  이 주어진 운송에 대한 점유 상태, 이vehicle . 기본값은 다음으로 설정됩니다.`NO_DATA_AVAILABLE` .<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                                                                                                             |
| **occupancy_percentage** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  |  선택 과목     |  하나          |  이 지정된 운송에 대한 점유율vehicle . "VehiclePosition.occupancy_percentage"와 동일한 규칙을 따릅니다. 이 주어진 캐리지에 대한 데이터를 사용할 수 없는 경우 -1을 사용하십시오.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                                                                       |
| **carriage_sequence**    | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  필수의       |  하나          |  의 다른 운송과 관련하여 이 운송의 순서를 식별합니다.vehicle 의 CarriageStatus 목록입니다. 이동 방향의 첫 번째 캐리지의 값은 1이어야 합니다. 두 번째 값은 이동 방향의 두 번째 캐리지에 해당하며 값이 2인 식이어야 합니다. 예를 들어, 이동 방향의 첫 번째 캐리지의 값은 1입니다. 이동 방향의 두 번째 캐리지의 값이 3이면 소비자는 모든 운송에 대한 데이터를 버립니다(즉,multi_carriage_details 필드). 데이터가 없는 운송은 유효한carriage_sequence number 및 데이터가 없는 필드는 생략해야 합니다(또는 해당 필드를 포함하고 "데이터 없음" 값으로 설정할 수도 있음).<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다. |


## messageAlert

안Alert , 대중 교통 네트워크에서 일종의 사고를 나타냅니다.

**필드**

| _** 분야 명**_                | _** 유형**_                                     | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                      |
| -------------------------- | --------------------------------------------- | ---------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **active_period**          | [TimeRange](#message-timerange)               |  선택 과목     |  많은          | time 때Alert 사용자에게 보여야 합니다. 누락된 경우Alert 피드에 표시되는 동안 표시됩니다. 여러 범위가 주어지면Alert 모든 동안 표시됩니다.                                                                                                                                                                                        |
| **informed_entity**        | [EntitySelector](#message-entityselector)     |  필수의       |  많은          |  사용자에게 이 사실을 알려야 하는 기관Alert . 적어도 하나informed_entity 제공되어야 합니다.                                                                                                                                                                                                                 |
| **Cause**                  | [Cause](#enum-cause)                          |  선택 과목     |  하나          |                                                                                                                                                                                                                                                                                |
| **Effect**                 | [Effect](#enum-effect)                        |  선택 과목     |  하나          |                                                                                                                                                                                                                                                                                |
| **url**                    | [TranslatedString](#message-translatedstring) |  선택 과목     |  하나          |  그만큼url 에 대한 추가 정보를 제공하는Alert .                                                                                                                                                                                                                                                |
| **header_text**            | [TranslatedString](#message-translatedstring) |  필수의       |  하나          | header 위해Alert . 이 평야-textstring 예를 들어 굵은체로 강조 표시됩니다.                                                                                                                                                                                                                          |
| **description_text**       | [TranslatedString](#message-translatedstring) |  필수의       |  하나          | 설명Alert . 이 평야-textstring 의 본문으로 형식이 지정됩니다.Alert (또는 사용자의 명시적인 "확장" 요청에 표시됨). 설명의 정보는 다음 정보에 추가되어야 합니다.header .                                                                                                                                                                |
| **tts_header_text**        | [TranslatedString](#message-translatedstring) |  선택 과목     |  하나          | text 포함하는Alert '에스header 에 사용text - 음성 변환 구현. 이 필드는text - 음성 변환 버전header_text . 와 동일한 정보를 포함해야 합니다.header_text 그러나 다음과 같이 읽을 수 있도록 형식이 지정되었습니다.text -to-speech(예: 제거된 약어, 철자된 숫자 등)                                                                                            |
| **tts_description_text**   | [TranslatedString](#message-translatedstring) |  선택 과목     |  하나          | text 에 대한 설명이 포함된Alert 에 사용text - 음성 변환 구현. 이 필드는text - 음성 변환 버전description_text . 와 동일한 정보를 포함해야 합니다.description_text 그러나 다음과 같이 읽을 수 있도록 형식이 지정되었습니다.text -to-speech(예: 제거된 약어, 철자된 숫자 등)                                                                                    |
| **severity_level**         | [SeverityLevel](#enum-severitylevel)          |  선택 과목     |  하나          |  심각도Alert .                                                                                                                                                                                                                                                                    |
| **image**                  | [TranslatedImage](#message-translatedimage)   |  선택 과목     |  하나          | TranslatedImage 따라 표시Alerttext . 시각적으로 설명할 때 사용AlertEffect ~의DETOUR , 역 폐쇄 등image 에 대한 이해를 높여야 한다.Alert 필수 정보의 유일한 위치가 아니어야 합니다. 다음 유형의 이미지는 권장되지 않습니다.image 주로 함유text , 추가 정보를 추가하지 않는 마케팅 또는 브랜드 이미지.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다. |
| **image_alternative_text** | [TranslatedString](#message-translatedstring) |  선택 과목     |  하나          | text 연결된 모양 설명image 에서`image` 필드(예:image 표시할 수 없거나 사용자가 볼 수 없습니다.image 접근성을 위해). HTML 보기[ 대체 사양imagetext](https://html.spec.whatwg.org/#alt) .<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                          |

## enumCause

Cause 이의Alert .

**가치**

| _** 값**_              |
| --------------------- |
| **UNKNOWN_CAUSE**     |
| **OTHER_CAUSE**       |
| **TECHNICAL_PROBLEM** |
| **STRIKE**            |
| **DEMONSTRATION**     |
| **ACCIDENT**          |
| **HOLIDAY**           |
| **WEATHER**           |
| **MAINTENANCE**       |
| **CONSTRUCTION**      |
| **POLICE_ACTIVITY**   |
| **MEDICAL_EMERGENCY** |

## enumEffect

그만큼Effect 영향을 받는 이 문제의entity .

**가치**

| _** 값**_                |
| ----------------------- |
| **NO_SERVICE**          |
| **REDUCED_SERVICE**     |
| **SIGNIFICANT_DELAYS**  |
| **DETOUR**              |
| **ADDITIONAL_SERVICE**  |
| **MODIFIED_SERVICE**    |
| **OTHER_EFFECT**        |
| **UNKNOWN_EFFECT**      |
| **STOP_MOVED**          |
| **NO_EFFECT**           |
| **ACCESSIBILITY_ISSUE** |

## enumSeverityLevel

심각도Alert .

**주의:** 이 필드는 아직 **실험 단계** 이며 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.

**가치**

| _** 값**_             |
| -------------------- |
| **UNKNOWN_SEVERITY** |
| **INFO**             |
| **WARNING**          |
| **SEVERE**           |

## messageTimeRange

ㅏtime 간격. 간격은 다음에서 활성으로 간주됩니다.time `t` 가 `t` 보다 크거나 같은 경우 tstarttime 그리고 미만endtime .

**필드**

| _** 분야 명**_ | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                         |
| ----------- | -------------------------------------------------------------------------- | ---------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| **start**   | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          | starttime , POSIX에서time (즉, 1970년 1월 1일 00:00:00 UTC 이후의 초 수). 누락된 경우 간격은 마이너스 무한대에서 시작합니다. 만약TimeRange 제공되거나start 또는end 제공해야 합니다. 두 필드 모두EMPTY . |
| **end**     | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          | endtime , POSIX에서time (즉, 1970년 1월 1일 00:00:00 UTC 이후의 초 수). 누락된 경우 간격은 플러스 무한대에서 끝납니다. 만약TimeRange 제공되거나start 또는end 제공해야 합니다. 두 필드 모두EMPTY .     |

## messagePosition

지리적Position \~의vehicle .

**필드**

| _** 분야 명**_   | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                        |
| ------------- | -------------------------------------------------------------------------- | ---------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **latitude**  | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  |  필수의       |  하나          |  WGS-84 좌표계의 북쪽도입니다.                                                                                                                                             |
| **longitude** | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  |  필수의       |  하나          |  WGS-84 좌표계에서 동쪽도.                                                                                                                                               |
| **bearing**   | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  |  선택 과목     |  하나          | bearing , 도 단위로 진북에서 시계 방향으로, 즉 0은 북쪽이고 90은 동쪽입니다. 이것은 나침반이 될 수 있습니다.bearing , 또는 다음 정류장 또는 중간 위치로 향하는 방향. 이것은 클라이언트가 이전 데이터에서 계산할 수 있는 이전 위치의 순서에서 추론해서는 안 됩니다. |
| **odometer**  | [double](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          | odometer 값(미터)입니다.                                                                                                                                               |
| **speed**     | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  |  선택 과목     |  하나          |  순간speed 에 의해 측정vehicle , 초당 미터 단위.                                                                                                                              |


## messageTripDescriptor

단일 인스턴스를 식별하는 설명자GTFStrip .

단일 지정하려면trip 예를 들어, 많은 경우에trip_id 그 자체로 충분합니다. 단, 다음과 같은 경우에는 하나의 문제로 해결하기 위해 추가 정보가 필요합니다.trip 사례:

* 에 정의된 여행의 경우frequencies.txt ,start_date 그리고start_time 에 추가로 필요합니다trip_id
* 만약trip 24시간 이상 지속되거나 충돌할 정도로 지연됩니다.SCHEDULEDtrip 그 다음날,start_date 에 추가로 필요합니다trip_id
* 만약trip_id 필드를 제공할 수 없는 경우route_id ,direction_id ,start_date , 그리고start_time 모두 제공되어야 합니다

모든 경우에, 만약route_id 에 추가로 제공됩니다trip_id , 다음route_id 동일해야합니다route_id 주어진 대로trip 안에GTFStrips.txt .

그만큼trip_id 필드는 단독으로 또는 다른 필드와 함께 사용할 수 없습니다.TripDescriptor 여러 필드를 식별하는 데 사용trip 인스턴스. 예를 들어,TripDescriptor 절대 지정해서는 안됩니다trip_id 스스로를 위해GTFSfrequencies.txt exact_times=0 여행 때문에start_time 또한 단일 문제로 해결해야 합니다.trip 특정 인스턴스에서 시작time 오늘의. 만약TripDescriptor 하나로 해결되지 않는다trip 인스턴스(즉, 0 또는 여러trip 인스턴스), 오류로 간주되며entity 잘못된 내용을 포함하는TripDescriptor 소비자가 폐기할 수 있습니다.

참고로trip_id 알 수 없는 경우 스테이션 시퀀스 ID는TripUpdate 충분하지 않으며 stop_id도 제공해야 합니다. 또한, 절대arrival /departure 시간을 제공해야 합니다.

TripDescriptor .route_id 이내에 사용할 수 없습니다AlertEntitySelector 전체 경로를 지정하려면Alert 경로에 대한 모든 여행에 영향을 미치는 - 사용EntitySelector .route_id 대신에.

**필드**

| _** 분야 명**_               | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| ------------------------- | -------------------------------------------------------------------------- | ---------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **trip_id**               | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  그만큼trip_id ~로부터GTFS 이 선택기가 참조하는 피드입니다. 비빈도 기반 이동의 경우(에 정의되지 않은 이동GTFSfrequencies.txt ), 이 필드는 고유하게 식별하기에 충분합니다.trip . 에 정의된 빈도 기반 이동의 경우GTFSfrequencies.txt ,trip_id ,start_time , 그리고start_date 모두 필요합니다. 을 위한SCHEDULED - 기반 여행(에 정의되지 않은 여행GTFSfrequencies.txt ),trip_id 경우에만 생략 가능trip 의 조합으로 고유하게 식별할 수 있습니다.route_id ,direction_id ,start_time , 그리고start_date 및 해당 필드가 모두 제공됩니다. 언제schedule_relationship ~이다DUPLICATED ~ 이내에TripUpdate ,trip_id 식별trip 정적에서GTFS 되려고DUPLICATED . 언제schedule_relationship ~이다DUPLICATED ~ 이내에VehiclePosition ,trip_id 새 복제본 식별trip 해당 값을 포함해야 합니다.TripUpdate .TripProperties .trip_id .                                                                     |
| **route_id**              | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  그만큼route_id ~로부터GTFS 이 선택자가 참조하는 것입니다. 만약에trip_id 생략하고,route_id ,direction_id ,start_time , 및 schedule_relationship=SCHEDULED 모두 식별하도록 설정해야 합니다.trip 사례.TripDescriptor .route_id 이내에 사용해서는 안 된다.AlertEntitySelector 전체 경로를 지정하려면Alert 경로에 대한 모든 여행에 영향을 미치는 - 사용EntitySelector .route_id 대신에.                                                                                                                                                                                                                                                                                                                                                                                                   |
| **direction_id**          | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  그만큼direction_id ~로부터GTFS 밥을 먹이다trips.txt 이 선택기가 참조하는 여행의 이동 방향을 나타내는 파일입니다. 만약에trip_id 생략하고,direction_id 제공되어야 합니다.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **start_time**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  처음에는SCHEDULEDstarttime 이의trip 사례. 때trip_id 비 주파수 기반에 해당trip , 이 필드는 생략하거나 의 값과 같아야 합니다.GTFS 밥을 먹이다. 때trip_id 주파수 기반에 해당trip 에 정의GTFSfrequencies.txt ,start_time 는 필수이며 지정되어야 합니다.trip 업데이트 및vehicle 위치. 만약trip exact_times=1에 해당GTFS 녹음, 그럼start_time 다음보다 headway_secs의 배수(0 포함)여야 합니다.frequencies.txtstart_time 해당하는time 기간. 만약trip exact_times=0에 해당하면start_time 임의적일 수 있으며 처음에는 첫 번째로 예상됩니다.departure 의trip . 일단 확립되면,start_time 이 빈도 기반 exact_times=0의trip 첫 번째 경우에도 변경할 수 없는 것으로 간주되어야 합니다.departuretime 변경 사항 -- 그time 변경 사항이 대신 반영될 수 있습니다.StopTimeUpdate . 만약에trip_id 생략하고,start_time 제공되어야 합니다. 필드의 형식 및 의미는 다음과 같습니다.GTFS /frequencies.txt /start_time , 예를 들어 11:15:35 또는 25:15:35. |
| **start_date**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  그만큼start 이 날짜trip YYYYMMDD 형식의 인스턴스. 을 위한SCHEDULED 여행(에 정의되지 않은 여행GTFSfrequencies.txt ), 이 필드는 너무 늦은 여행을 명확하게 하기 위해 제공되어야 합니다.SCHEDULEDtrip 다음날. 예를 들어, 매일 8:00 및 20:00에 출발하고 12시간 지연되는 기차의 경우 동일한 두 개의 개별 여행이 있습니다.time . 이 필드는 제공될 수 있지만 이러한 충돌이 불가능한 일정의 경우 필수는 아닙니다(예:vehicle 1시간 늦는 것은 더 이상 일정과 관련이 없는 것으로 간주됩니다. 이 필드는 다음에 정의된 빈도 기반 이동에 필요합니다.GTFSfrequencies.txt . 만약에trip_id 생략하고,start_date 제공되어야 합니다.                                                                                                                                                                                                                                                                                |
| **schedule_relationship** | [ScheduleRelationship](#enum-schedulerelationship-1)                       |  선택 과목     |  하나          |  이것 사이의 관계trip 그리고 정적 일정. 만약에TripDescriptor 에서 제공됩니다Alert`EntitySelector` ,`schedule_relationship` 일치를 식별할 때 소비자가 필드를 무시합니다.trip 사례.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |

## enumScheduleRelationship

이것 사이의 관계trip 그리고 정적 일정. 만약trip 에 반영되지 않고 임시 일정에 따라 수행됩니다.GTFS , 다음으로 표시해서는 안됩니다.SCHEDULED , 그러나 다음과 같이 표시됨ADDED .

**가치**

| _** 값**_        | _** 논평**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SCHEDULED**   | trip 에 따라 실행되는GTFS Schedule , 또는SCHEDULEDtrip 그것과 연결됩니다.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **ADDED**       |  추가trip 그건ADDED 실행 일정 외에도 예를 들어 깨진vehicle 또는 갑작스러운 승객 적재에 대응하기 위해._ 참고: 현재 이 모드를 사용하는 피드에 대한 동작은 지정되지 않았습니다. 에 대한 논의가 있다.GTFS 깃허브[ (1)](https://github.com/google/transit/issues/106) [ (2)](https://github.com/google/transit/pull/221) [ (삼)](https://github.com/google/transit/pull/219) 완전히 지정하거나 사용하지 않는 경우ADDED 여행 및 문서는 논의가 완료되면 업데이트됩니다._                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| **UNSCHEDULED** |  ㅏtrip 연결된 일정 없이 실행 중인 - 이 값은 에 정의된 이동을 식별하는 데 사용됩니다.GTFSfrequencies.txt with exact_times = 0. 정의되지 않은 여행을 설명하는 데 사용해서는 안 됩니다.GTFSfrequencies.txt , 또는 여행GTFSfrequencies.txt Exact_times = 1로 여행`schedule_relationship: UNSCHEDULED` 모든 StopTimeUpdates도 설정해야 합니다.`schedule_relationship: UNSCHEDULED`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **CANCELED**    |  ㅏtrip 일정에 존재했지만 제거되었습니다.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| **DUPLICATED**  |  새로운trip 기존과 동일합니다SCHEDULEDtrip 서비스를 제외하고start 날짜와time . 함께 사용`TripUpdate.TripProperties.trip_id` ,`TripUpdate.TripProperties.start_date` , 그리고`TripUpdate.TripProperties.start_time` 기존 복사trip 정적에서GTFS 하지만start 다른 서비스 날짜 및/또는time . 복제trip 원본과 관련된 서비스가 있는 경우 허용됩니다.trip (CSV)GTFS (안에`calendar.txt` 또는`calendar_dates.txt` )은(는) 앞으로 30일 이내에 운영됩니다. 그만큼trip 되려고DUPLICATED 를 통해 식별됩니다.`TripUpdate.TripDescriptor.trip_id` .<br/><br/> 이 열거는 기존을 수정하지 않습니다.trip 참조`TripUpdate.TripDescriptor.trip_id` - 제작자가 원작을 취소하고자 하는 경우trip , 별도로 게시해야 합니다.`TripUpdate` 의 가치로CANCELED . 에 정의된 여행GTFS`frequencies.txt` ~와 함께`exact_times` 그건EMPTY 또는 같음`0` 수 없습니다DUPLICATED . 그만큼`VehiclePosition.TripDescriptor.trip_id` 새로운trip 에서 일치하는 값을 포함해야 합니다.`TripUpdate.TripProperties.trip_id` 그리고`VehiclePosition.TripDescriptor.ScheduleRelationship` 로 설정해야 합니다.`DUPLICATED` .<br/><br/>_ 기존에 사용하던 생산자와 소비자는ADDED 나타내는 열거DUPLICATED 여행은 따라야합니다[ 마이그레이션 가이드](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/examples/migration-duplicated.md) 로 전환DUPLICATED 열거._ |

## messageVehicleDescriptor

에 대한 식별 정보vehicle 수행trip .

**필드**

| _** 분야 명**_       | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                        |
| ----------------- | -------------------------------------------------------------------------- | ---------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| **id**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  내부 시스템 식별vehicle . 해야한다** 독특한** 당vehicle , 추적에 사용됩니다.vehicle 시스템을 통해 진행됩니다. 이것id 에게 보여서는 안 된다.end -사용자; 그 목적을 위해 사용**label** 필드 |
| **label**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  사용자가 볼 수 있음label , 즉, 올바른 식별을 돕기 위해 승객에게 보여야 하는 것vehicle .                                                                      |
| **license_plate** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  선택 과목     |  하나          |  의 번호판vehicle .                                                                                                                  |
| **wheelchair_accessible**    | [ 휠체어 이용 가능](#enum-wheelchairaccessible)                                   |  선택 과목     |  하나          |  제공된 경우 덮어쓸 수 있음_ 휠체어 접근 가능_ 정적 값GTFS .                                                                                          |


## enum WheelchairAccessible

만약 특별한trip 휠체어 접근이 가능합니다. 사용 가능한 경우 이 값은 _static_GTFS .

**가치**

| _** 값**_                     | _** 논평**_                                                                            |
| ---------------------------- | ------------------------------------------------------------------------------------ |
| ** NO_VALUE**                |  그만큼trip 휠체어 접근성에 대한 정보가 없습니다. 이것이** 기본** 행동. 만약 정적GTFS 포함_ 휠체어 접근 가능_ 값을 덮어쓰지 않습니다. |
| ** UNKNOWN **                 |  그만큼trip 접근성 값이 없습니다. 이 값은 다음 값을 덮어씁니다.GTFS .                                        |
| ** WHEELCHAIR_ACCESSIBLE**   |  그만큼trip 휠체어 이용이 가능합니다. 이 값은 다음 값을 덮어씁니다.GTFS .                                      |
| ** WHEELCHAIR_INACCESSIBLE** |  그만큼trip ~이다** ~ 아니다** 휠체어 접근 가능. 이 값은 다음 값을 덮어씁니다.GTFS .                            |

## messageEntitySelector

에 대한 선택기entity 안에GTFS 밥을 먹이다. 필드 값은 해당 필드와 일치해야 합니다.GTFS 밥을 먹이다. 하나 이상의 지정자를 제공해야 합니다. 여러 개 제공되는 경우 논리적 `AND` 연산자에 의해 결합된 것으로 해석되어야 합니다. 또한 지정자의 조합은 해당 정보와 일치해야 합니다.GTFS 밥을 먹이다. 다시 말해서,Alert 에 적용하다entity 안에GTFS 제공된 모든 항목과 일치해야 합니다.EntitySelector 필드. 예를 들어,EntitySelector 필드를 포함하는route_id `route_id : "5"` 및route_type `route_type : "3"` 은 다음에만 적용됩니다.route_id `route_id : "5"` 버스 - 다른 노선에는 적용되지 않습니다.route_type `route_type : "3"` . 프로듀서가 원하면Alert 에 적용하다route_id `route_id : "5"` 뿐만 아니라route_type `route_type : "3"` , 하나는 참조하는 두 개의 개별 EntitySelector를 제공해야 합니다.route_id `route_id : "5"` 및 다른 참조route_type `route_type : "3"` .

하나 이상의 지정자를 제공해야 합니다.EntitySelector 수 없습니다EMPTY .

**필드**

| _** 분야 명**_      | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                      |
| ---------------- | -------------------------------------------------------------------------- | ---------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **agency_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  그만큼agency_id ~로부터GTFS 이 선택기가 참조하는 피드입니다.                                                                                                                                                                      |
| **route_id**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  그만큼route_id ~로부터GTFS 이 선택자가 참조하는 것입니다. 만약에direction_id 제공되며,route_id 도 제공해야 합니다.                                                                                                                              |
| **route_type**   | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  |  조건부 필수    |  하나          |  그만큼route_type ~로부터GTFS 이 선택자가 참조하는 것입니다.                                                                                                                                                                      |
| **direction_id** | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  그만큼direction_id ~로부터GTFS 밥을 먹이다trips.txt 경로에 대해 한 방향으로 모든 여행을 선택하는 데 사용되는 파일,route_id . 만약에direction_id 제공되며,route_id 도 제공해야 합니다.<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.<br/> |
| **trip**         | [TripDescriptor](#message-tripdescriptor)                                  |  조건부 필수    |  하나          |  그만큼trip 인스턴스GTFS 이 선택자가 참조하는 것입니다. 이것TripDescriptor 하나로 해결해야 합니다trip 인스턴스GTFS 데이터(예: 생산자는trip_id exact_times=0 여행의 경우). 만약ScheduleRelationship 필드가 이 안에 채워집니다.TripDescriptor 소비자가 식별을 시도할 때 무시됩니다.GTFStrip .  |
| **stop_id**      | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  그만큼stop_id ~로부터GTFS 이 선택기가 참조하는 피드입니다.                                                                                                                                                                        |

## messageTranslatedString

국제화된message 당 포함language 조각의 버전text 또는url . a의 문자열 중 하나message 픽업됩니다. 해결은 다음과 같이 진행됩니다.language 일치language 의 코드Translation , 첫 번째 일치Translation 선택됩니다. 기본 UI인 경우language (예: 영어) 일치language 의 코드Translation , 첫 번째 일치Translation 선택됩니다. 만약 일부Translation 지정되지 않은language 코드, 그Translation 선택됩니다.

**필드**

| _** 분야 명**_     | _** 유형**_                           | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                     |
| --------------- | ----------------------------------- | ---------- | ------------ | ----------------------------- |
| **Translation** | [Translation](#message-translation) |  필수의       |  많은          |  적어도 하나Translation 제공되어야 합니다. |

## messageTranslation

현지화된string 매핑language .

| _** 분야 명**_  | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                         |
| ------------ | -------------------------------------------------------------------------- | ---------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **text**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  필수의       |  하나          |  UTF-8string 포함하는message .                                                                                                                                        |
| **language** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  BCP-47language 암호. 경우 생략 가능language 알 수 없거나 피드에 대해 국제화가 전혀 수행되지 않은 경우입니다. 많아야 하나Translation 지정되지 않은 것을 허용language tag - 둘 이상의 경우Translation ,language 제공되어야 합니다. |

## messageTranslatedImage

국제화된message 당 포함language 버전image . a의 이미지 중 하나message 픽업됩니다. 해결은 다음과 같이 진행됩니다.language 일치language 의 코드Translation , 첫 번째 일치Translation 선택됩니다. 기본 UI인 경우language (예: 영어) 일치language 의 코드Translation , 첫 번째 일치Translation 선택됩니다. 만약 일부Translation 지정되지 않은language 코드, 그Translation 선택됩니다.

**주의:** 이message 아직 **실험적** 이며 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.

**필드**

| _** 분야 명**_         | _** 유형**_                                 | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                   |
| ------------------- | ----------------------------------------- | ---------- | ------------ | --------------------------- |
| **localized_image** | [LocalizedImage](#message-localizedimage) |  필수의       |  많은          |  하나 이상의 현지화image 제공되어야 합니다. |

## messageLocalizedImage

현지화된imageurl 매핑language .

| _** 분야 명**_    | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                                                                                                                                                      |
| -------------- | -------------------------------------------------------------------------- | ---------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **url**        | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  필수의       |  하나          | string 포함하는url 에 연결image . 그만큼image 링크된 파일은 2MB 미만이어야 합니다. 만약image 소비자 측에서 업데이트가 필요할 만큼 충분히 중요한 방식으로 변경하는 경우 생산자는 업데이트해야 합니다.url 새로운 것에.<br/><br/> 그만큼url 완전한 자격을 갖추어야 합니다url http:// 또는 https:// 및 특수 문자를 포함하는url 올바르게 이스케이프해야 합니다. 다음을 참조하십시오[ https://www.w3.org/Addressing/url /4_URI_Recommentations.html](https://www.w3.org/Addressing/URL/4_URI_Recommentations.html for) 완전한 자격을 만드는 방법에 대한 설명url 가치. |
| **media_type** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  필수의       |  하나          |  유형을 지정하는 IANA 미디어 유형image 표시됩니다. 유형은 반드시start "이미지/"와 함께                                                                                                                                                                                                                                                                                                                                                      |
| **language**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  조건부 필수    |  하나          |  BCP-47language 암호. 경우 생략 가능language 알 수 없거나 피드에 대해 국제화가 전혀 수행되지 않은 경우입니다. 많아야 하나Translation 지정되지 않은 것을 허용language tag - 둘 이상의 경우Translation ,language 제공되어야 합니다.                                                                                                                                                                                                                                              |

## messageShape

물리적 경로를 설명합니다.vehicle 때 걸립니다Shape (CSV)의 일부가 아닙니다.GTFS , 예를 들어 임시DETOUR . 모양은 Trips에 속하며 보다 효율적인 전송을 위해 인코딩된 폴리라인으로 구성됩니다. 셰이프는 Stops의 위치를 정확히 가로챌 필요는 없지만 모든 Stops는trip 의 작은 거리 내에 있어야 합니다.Shape 그에 대한trip , 즉 연결하는 직선 세그먼트에 가깝습니다.Shape 포인트들

**주의:** 이message 아직 **실험적** 이며 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.<br/>.

**필드**

| _** 분야 명**_          | _** 유형**_                                                                  | _** 필수의**_ | _** 카디널리티**_ | _** 설명**_                                                                                                                                                                                                                                                                                                     |
| -------------------- | -------------------------------------------------------------------------- | ---------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **shape_id**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  필수의       |  하나          |  식별자Shape . 누구와도 달라야 한다`shape_id` (CSV)에 정의GTFS .<br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다.                                                                                                                                                                                      |
| **encoded_polyline** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) |  필수의       |  하나          |  인코딩된 폴리라인 표현Shape . 이 폴리라인은 최소한 두 개의 점을 포함해야 합니다. 인코딩된 폴리라인에 대한 자세한 내용은[ https://developers.google.com/maps/documentation/utilities/polylinealgorithm](https://developers.google.com/maps/documentation/utilities/polylinealgorithm) <br/><br/>** 주의:** 이 분야는 여전히** 실험적인** , 변경될 수 있습니다. 향후 정식으로 채택될 수 있습니다. |
