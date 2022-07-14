# GTFS Realtime 개요

<div class="landing-page"><a class="button" href="reference">참조</a> <a class="button" href="best-practices">모범 사례</a> <a class="button" href="feed-examples">예</a> <a class="button" href="changes">변경 사항</a></div>

## 시작하기

사용자에게 대중 교통 데이터 업데이트를 실시간으로 제공하면 대중 교통 서비스 경험이 크게 향상됩니다. 현재 도착 및 출발 시간에 대한 최신 정보를 제공하여 사용자가 원활하게 여행을 계획할 수 있습니다. 결과적으로, 불행히도 지연되는 경우, 라이더는 집에 조금 더 머물 수 있다는 사실을 알게 되어 안도할 것입니다.

GTFSRealtime 대중 교통 기관에서 제공할 수 있는 피드 사양입니다.Realtime 플릿에 대한 업데이트를 애플리케이션 개발자에게 제공합니다. [GTFS](../schedule/reference) (General Transit Feed Specification ), 대중 교통 일정 및 관련 지리 정보를 위한 개방형 데이터 형식입니다.GTFSRealtime 구현 용이성을 중심으로 설계되었습니다.GTFS 상호 운용성 및 승객 정보에 중점을 둡니다.

사양은 초기 [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates) 파트너 대행사, 여러 대중교통 개발자 및 Google의 파트너십을 통해 설계되었습니다. 사양은 [Apache 2.0 라이선스](https://www.apache.org/licenses/LICENSE-2.0.html) 하에 게시됩니다.

## 어떻게 시작합니까?

1.  아래의 개요를 계속 읽으십시오.
2.  제공할 [피드 엔터티](feed-entities) 를 결정합니다.
3.  [예제 피드를](feed-examples) 살펴보십시오.
4.  [참조](reference) 를 사용하여 고유한 피드를 만듭니다.
5.  [피드를 게시합니다](best-practices/#feed-publishing-general-practices) .

## 개요GTFSRealtime 피드

사양은 현재 다음 유형의 정보를 지원합니다.

*   **여행 업데이트** - 지연, 취소, 변경된 경로
*   **서비스 알림** - 스테이션, 경로 또는 전체 네트워크에 영향을 미치는 이동, 예상치 못한 이벤트 중지
*   **차량 위치** - 위치 및 혼잡도를 포함한 차량 정보

피드는 필수는 아니지만 다른 유형의 엔터티를 결합할 수 있습니다. 피드는 HTTP를 통해 제공되며 자주 업데이트됩니다. 파일 자체는 일반 바이너리 파일이므로 모든 유형의 웹 서버에서 파일을 호스팅하고 제공할 수 있습니다(다른 전송 프로토콜도 사용될 수 있음). 또는 유효한 HTTP GET 요청에 대한 응답으로 피드를 반환하는 웹 응용 프로그램 서버를 사용할 수도 있습니다. 피드를 업데이트하거나 검색해야 하는 빈도나 정확한 방법에 대한 제약은 없습니다.

왜냐하면GTFSRealtime 차량의 _실제_ 상태를 표시할 수 있으므로 피드는 정기적으로 업데이트해야 합니다. 가급적이면 자동 차량 위치 시스템에서 새 데이터가 들어올 때마다 업데이트해야 합니다.

[피드 항목에 대한 추가 정보...](feed-entities)

## 데이터 형식

그만큼GTFSRealtime 데이터 교환 형식은 [프로토콜 버퍼](https://developers.google.com/protocol-buffers/) 를 기반으로 합니다.

프로토콜 버퍼는language - 구조화된 데이터를 직렬화하기 위한 플랫폼 중립적 메커니즘(XML을 생각하지만 더 작고 빠르고 간단함). 데이터 구조는 다음과 같이 정의됩니다.[gtfs-realtime.proto](proto) 파일은 다양한 언어를 사용하여 다양한 데이터 스트림에서 구조화된 데이터를 쉽게 읽고 쓸 수 있는 소스 코드를 생성하는 데 사용됩니다.Java , C++ 또는Python .

[프로토콜 버퍼에 대한 추가 정보....](https://developers.google.com/protocol-buffers/)

## 데이터 구조

요소의 계층 구조와 해당 유형 정의는 [gtfs-realtime.proto](proto) 파일.

이 텍스트 파일은 선택한 프로그래밍에 필요한 라이브러리를 생성하는 데 사용됩니다.language . 이 라이브러리는 유효한 생성에 필요한 클래스와 기능을 제공합니다.GTFSRealtime 피드. 라이브러리는 피드 생성을 더 쉽게 만들 뿐만 아니라 유효한 피드만 생성되도록 합니다.

[데이터 구조에 대해 자세히...](reference)

## 도움을 받다

주변의 토론에 참여하려면GTFSRealtime 사양 변경 및 추가 제안, [GTFS Realtime mailing list](https://groups.google.com/group/gtfs-realtime) 및 [google/transit GitHub 저장소](https://github.com/google/transit) 의 대화를 팔로우하세요.

## Google 지도 및 실시간 대중교통 업데이트

사용 가능한 응용 프로그램 중 하나GTFSRealtime [실시간 대중교통 업데이트](https://developers.google.com/transit/google-transit#LiveTransitUpdates) 는 사용자에게 다음을 제공하는 Google 지도의 기능입니다.Realtime 대중교통 정보. 제공하는 데 관심이 있는 대중 교통 기관에서 근무하는 경우Realtime Google 지도 업데이트를 확인하려면 [Google 대중교통 파트너 페이지](https://maps.google.com/help/maps/transit/partners/live-updates.html) 를 방문하세요.
