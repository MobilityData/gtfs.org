---
search:
  exclude: true
---

  # 사양 수정 프로세스

  그만큼GTFS 사양은 정해진 것이 아닙니다. 대신 대중 교통 기관, 개발자 및 기타 이해 관계자 커뮤니티에서 개발하고 유지 관리하는 개방형 사양입니다.GTFS . 이 생산자와 소비자의 공동체는GTFS 데이터에는 새로운 기능을 사용할 수 있도록 사양을 확장하기 위한 제안이 있습니다. 이러한 프로세스를 관리하는 데 도움이 되도록 다음 절차 및 지침이 수립되었습니다.

  !!!note ""

      공식 사양, 참조 및 문서는 영어로 작성됩니다. 만약Translation 다른 언어로 영어 원본과 다른 경우 후자가 우선합니다. 모든 의사소통은 영어로 이루어집니다.

  1. 프로토콜 정의, 사양 및 문서 파일(번역 제외)의 모든 관련 부분을 업데이트하여 git 분기를 만듭니다.
  1. <https://github.com/google/transit> 에서 풀 요청을 생성합니다. 풀 요청에는 패치에 대한 자세한 설명이 포함되어야 합니다. 풀 리퀘스트를 만든 사람이 _옹호자_ 가 됩니다.
  1. 끌어오기 요청이 등록되면 GTFS 에서 옹호자가 이를 발표해야 합니다. GTFS 풀 리퀘스트에 대한 링크를 포함하여 [메일링 리스트를 변경합니다](https://groups.google.com/forum/#!forum/gtfs-changes) . 발표되면 풀 요청은 제안으로 간주됩니다. 끌어오기 요청은 쉽게 상호 참조할 수 있도록 Google 그룹 공지사항에 대한 링크를 포함하도록 수정해야 합니다.
     - 지지자는 기여자이므로 끌어오기 요청을 수락하기 전에 [기여자 라이선스 계약](../CONTRIBUTING.md) 에 서명해야 합니다.
  1. 제안에 대한 논의는 다음과 같습니다. 풀 요청 댓글은 유일한 토론 포럼으로 사용해야 합니다.
     - 토론은 옹호자가 필요하다고 느끼는 기간 동안 지속되지만 최소 7일 이상이어야 합니다.
     - 지지자는 동의한 의견을 기반으로 제안서(예: 풀 요청)를 적시에 업데이트할 책임이 있습니다.
     - 어느 시점에서time 옹호자는 제안이 포기되었다고 주장할 수 있습니다.
  1. 지지자는 언제든지 제안의 버전에 대한 투표를 요청할 수 있습니다.time 토론에 필요한 초기 7일 간격 이후.
     - 투표를 요청하기 전에 적어도 한GTFS 프로듀서와 하나GTFS 소비자는 제안된 변경 사항을 구현해야 합니다. 예상되는GTFS 생산자(들)는 공개 대상 변경 사항을 포함합니다.GTFS 풀 리퀘스트 댓글 내에서 해당 데이터에 대한 링크를 제공하고 제공합니다.GTFS 소비자(들)는 사소한 방식으로 변경 사항을 활용하는(즉, 새로운 기능이나 개선된 기능을 지원하는) 응용 프로그램에 대한 풀 요청 주석의 링크를 제공합니다.
  1. 투표는 7을 커버하기에 충분한 최소 기간 동안 지속됩니다.FULL 역일 및 5FULL 스위스 영업일. 투표는 23:59:59 UTC에 종료됩니다.
     - 옹호자는 구체적인 내용을 발표해야 합니다.endtime \~에서start 투표의.
     - 투표 기간 동안 제안서의 편집 변경만 허용됩니다(오타, 문구는 의미를 변경하지 않는 한 변경될 수 있음).
     - 누구나 풀 리퀘스트에 대한 댓글 형식으로 예/아니오 투표를 할 수 있으며, 투표는 변경될 때까지 가능합니다.end 투표 기간의.
     유권자가 자신의 투표를 변경하는 경우 투표를 취소하고 새 투표를 작성하여 원래 투표 댓글을 업데이트하여 변경하는 것이 좋습니다.
     - 전에 투표start 투표 기간은 고려하지 않습니다.
     - 투표 시작 및 종료는 [메일링 리스트를 변경합니다](https://groups.google.com/forum/#!forum/gtfs-changes) .
  1. 제안은 최소 3표 이상 찬성으로 만장일치로 승인되면 수락됩니다.
     - 제안자의 투표는 총 3표에 포함되지 않습니다. 예를 들어 제안자 X가 풀 요청을 생성하고 찬성 투표를 하고 사용자 Y와 Z가 찬성 투표하면 총 2개의 찬성 투표로 계산됩니다.
     - 반대 투표는 동기를 부여해야 하며 이상적으로는 실행 가능한 피드백을 제공해야 합니다.
     - 투표가 실패하면 옹호자는 제안에 대한 작업을 계속하거나 제안을 포기하도록 선택할 수 있습니다.
     옹호자의 결정은 에서 발표되어야 합니다 메일링 리스트를 변경합니다](https://groups.google.com/forum/#!forum/) .
     - 지지자가 제안에 대한 작업을 계속하는 경우 언제든지 새로운 투표가 요구될 수 있습니다.time .
  1. 30일 동안 비활성 상태로 남아 있는 풀 요청은 종료됩니다. 풀 요청이 종료되면 해당 제안은 포기된 것으로 간주됩니다. 옹호자는 풀 요청을 언제든지 재개할 수 있습니다.time 대화를 계속하거나 유지하려는 경우.
  1. 제안이 수락된 경우:
     - Google은 (기여자가 [CLA](../CONTRIBUTING.md) 에 서명한 경우) 투표된 풀 요청 버전을 병합하고 영업일 기준 5일 이내에 풀 요청을 수행하기 위해 최선을 다하고 있습니다.
     - 번역은 원본 풀 요청에 포함되어서는 안 됩니다.
     Google은 궁극적으로 관련 번역을 지원되는 언어로 업데이트할 책임이 있지만 순수Translation 커뮤니티의 끌어오기 요청을 환영하며 모든 편집 의견이 처리되는 즉시 수락됩니다.
  1. 풀 요청의 최종 결과(수락 또는 포기)는 풀 요청이 처음 발표된 동일한 Google 그룹스 스레드에서 발표되어야 합니다.

  <hr/>
  ## 지침 원칙

  원래의 비전을 보존하기 위해GTFS , 사양을 확장할 때 고려해야 할 여러 지침 원칙이 설정되었습니다.

  **피드는 쉽게 만들고 편집할 수 있어야 합니다.**<br/>스프레드시트 프로그램을 사용하여 쉽게 보고 편집할 수 있기 때문에 CSV를 사양의 기초로 선택했습니다.text 소규모 대행사에 유용한 편집자. 또한 대부분의 프로그래밍 언어 및 데이터베이스에서 생성하는 것이 간단하므로 대규모 피드의 게시자에게 좋습니다.<br/>

  **피드는 파싱하기 쉬워야 합니다.**<br/>피드 리더는 가능한 적은 작업으로 원하는 정보를 추출할 수 있어야 합니다. 피드에 대한 변경 및 추가는 피드 판독기가 구현해야 하는 코드 경로의 수를 최소화하기 위해 가능한 한 광범위하게 유용해야 합니다. (그러나 궁극적으로 피드 리더보다 피드 게시자가 더 많을 것이기 때문에 생성을 더 쉽게 만드는 것이 우선되어야 합니다.)<br/>

  **사양은 승객 정보에 관한 것입니다.**<br/>GTFS 주로 승객 정보와 관련이 있습니다. 즉, 사양에는 무엇보다도 라이더를 위한 전동 공구에 도움이 될 수 있는 정보가 포함되어야 합니다. 대중 교통 기관이 시스템 간에 내부적으로 전송하기를 원할 수 있는 잠재적으로 많은 양의 운영 지향 정보가 있습니다.GTFS 그 목적을 위한 것이 아니며 더 적절할 수 있는 잠재적으로 다른 운영 지향 데이터 표준이 있습니다.<br/>

  **사양에 대한 변경 사항은 이전 버전과 호환되어야 합니다.**<br/>사양에 기능을 추가할 때 기존 피드를 무효화하는 변경을 피하고 싶습니다. 피드에 기능을 추가하기 전까지는 기존 피드 게시자를 위해 더 많은 작업을 생성하고 싶지 않습니다. 또한 가능할 때마다 기존 파서가 새 피드의 이전 부분을 계속 읽을 수 있기를 바랍니다.<br/>

  **투기 기능은 권장되지 않습니다.**<br/>모든 새 기능은 피드 생성 및 읽기에 복잡성을 추가합니다. 따라서 유용하다고 알려진 기능만 추가하도록 주의를 기울이고자 합니다. 이상적으로 모든 제안은 새로운 기능을 사용하는 실제 교통 시스템에 대한 데이터를 생성하고 이를 읽고 표시하는 소프트웨어를 작성하여 테스트되었습니다. 참고GTFS 공식 파서 및 유효성 검사기에서 무시되는 추가 열 및 파일을 추가하여 형식에 대한 확장을 쉽게 허용하므로 제안을 쉽게 프로토타입화하고 기존 피드에서 테스트할 수 있습니다.<br/>

  <hr/>

  ## 개정 내역

  **2021년 9월 15일**<br/>

  * 허용된 개찰구(pathway_mode=6)는 양방향입니다. [토론](https://github.com/google/transit/pull/276) 을 참조하십시오.

  **2021년 9월 13일**<br/>

  * `stop_name` 모범 사례를 업데이트했습니다. [토론](https://github.com/google/transit/pull/282) 을 참조하십시오.

  **2021년 8월 27일**<br/>

  * 업데이트됨GTFS Schedule [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119) 에 . [토론](https://github.com/google/transit/pull/277) 을 참조하십시오.

  **2021년 1월 4일**<br/>

  * `stop_times. stop_id`stop_id . [토론](https://github.com/google/transit/pull/258) 을 참조하십시오.
  * 정의된 양수 및 0이 아닌 필드 기호. [토론](https://github.com/google/transit/pull/251) 을 참조하십시오.

  **2020년 10월 2일**<br/>

  * `frequencies.headway_secs` 의 필드 유형이 음이 아닌 정수에서 양의 정수로 변경되었습니다. [토론](https://github.com/google/transit/pull/249) 을 참조하십시오.

  **2020년 5월 25일**<br/>

  * 한정된pathways.txt ,levels.txt 그리고attributions.txt 번역 가능한 테이블로. 다국어 `signposted_as` 값 번역에 대한 권장 사항이 추가되었습니다. [토론](https://github.com/google/transit/pull/220) 을 참조하십시오.

  **2020년 5월 13일**<br/>

  * 에 `continuous_pickup` 및 `continuous_drop_off` 를 추가했습니다.routes.txt 그리고stop_times.txt . 변경됨shape_id "선택사항"에서 "조건부 필수"로. [토론](https://github.com/google/transit/pull/208) 을 참조하십시오.

  **2020년 3월 24일**<br/>

  * 한정된text -to-speech 필드에 `tts_stop_name` 을 추가했습니다.stops.txt . [토론](https://github.com/google/transit/pull/49) 을 참조하십시오.

  **2020년 2월 5일**<br/>

  * 무궤도 전차와 모노레일 `route_types` 를 추가했습니다. [토론](https://github.com/google/transit/pull/174) 을 참조하십시오.

  **2020년 1월 9일**<br/>

  * 추가됨translations.txt . [토론](https://github.com/google/transit/pull/180) 을 참조하십시오.

  **2019년 12월 26일**<br/>

  * 케이블 트램 및 공중 리프트에 대한 업데이트된 정의route_type . [토론](https://github.com/google/transit/pull/186) 을 참조하십시오.

  **2019년 12월 20일**<br/>

  * 추가됨attributions.txt . [토론](https://github.com/google/transit/pull/192) 을 참조하십시오.

  **2019년 8월 26일**<br/>

  * 승객이 탑승을 기다리는 곳에 `stop_lat` 및 `stop_lon` 이 위치하도록 지정vehicle . [토론](https://github.com/google/transit/pull/179) 을 참조하십시오.

  **2019년 7월 9일**<br/>

  * 추가됨arrival 그리고departuretime 모범 사례. [토론](https://github.com/google/transit/pull/165) 을 참조하십시오.
  * 헤드 사인 모범 사례를 추가했습니다. [토론](https://github.com/google/transit/pull/167) 을 참조하십시오.
  * 추가됨stop_id 모범 사례. [토론](https://github.com/google/transit/pull/169) 을 참조하십시오.

  **2019년 6월 25일**<br/>

  * 명확한 관계Shape 포인트와 스톱. [토론](https://github.com/google/transit/pull/39) 을 참조하십시오.

  **2019년 4월 4일**<br/>

  * 에 추가된 `platform_code` 필드stops.txt . [토론](https://github.com/google/transit/pull/146) 을 참조하십시오.

  **2019년 3월 27일**<br/>

  * 추가됨pathways.txt 그리고levels.txt . [토론](https://github.com/google/transit/pull/143) 을 참조하십시오.

  **2019년 2월 6일**<br/>

  * 명확성을 위해 편집 및 형식이 변경되었습니다. [토론](https://github.com/google/transit/pull/120) 을 참조하십시오.

  **2018년 10월 2일**<br/>

  * 분해된 필드 유형. [토론](https://github.com/google/transit/pull/104) 을 참조하십시오.

  **2018년 9월 14일**<br/>

  * "조건부 필수" 개념이 추가되었습니다. [토론](https://github.com/google/transit/pull/100) 을 참조하십시오.

  **2018년 9월 4일**<br/>

  * `agency_lang` 및 `feed_lang` 정의를 통합했습니다. [토론](https://github.com/google/transit/pull/98) 을 참조하십시오.

  **2018년 8월 27일**<br/>

  * `CHANGES.md` 및 마지막 수정 날짜를 업데이트했습니다. [토론](https://github.com/google/transit/pull/99) 을 참조하십시오.

  **2018년 8월 22일**<br/>

  * `feed_contact_email` 및 `feed_contact_url` 필드를feed_info.txt 파일. [토론](https://github.com/google/transit/pull/31) 을 참조하십시오.

  **2017년 12월 11일**<br/>

  * `route_sort_order` 를 다음에 추가했습니다.routes.txt . [토론](https://github.com/google/transit/pull/83) 을 참조하십시오.

  **2017년 3월 15일**<br/>

  * 제안자의 투표가 총계에 포함되지 않음을 명확히 했습니다. [토론](https://github.com/google/transit/pull/50) 을 참조하십시오.
  * 투표를 요청하기 전에 적어도 하나는GTFS 프로듀서와 하나GTFS 소비자는 제안된 변경 사항을 구현해야 합니다. [토론](https://github.com/google/transit/pull/46) 을 참조하십시오.

  **2017년 2월 7일**<br/>

  * `block_id` 와 명확한 관계service_id . [토론](https://github.com/google/transit/pull/44) 을 참조하십시오.
  * 빈도 기반 서비스가 다음에서 시작됨을 명확히 함vehicledeparture . [토론](https://github.com/google/transit/pull/42) 을 참조하십시오.
  * 에 대한 명확한 설명stop_id 및 `stop_code` . [토론](https://github.com/google/transit/pull/40) 을 참조하십시오.

  **2017년 12월 11일**<br/>

  * `route_sort_order` 필드를 추가했습니다.routes.txt 파일. [토론](https://github.com/google/transit/pull/83) 을 참조하십시오.

  **2016년 11월 27일**<br/>

  * `stops.location_type` 으로 역 입구를 추가했습니다. [토론](https://github.com/google/transit/pull/30) 을 참조하십시오.

  **2016년 9월 2일**<br/>

  * 추가할 업데이트된 설명서agency_id 아래에fare_attributes.txt . [토론](https://github.com/google/transit/pull/27) 을 참조하십시오.

  **2016년 3월 16일**<br/>

  * 전환GTFS <https://github.com/google/transit> 의 Github 문서

  **2016년 2월 3일**<br/>

  * 다음에 `agency_email` 을 추가했습니다.agency.txt 사양에 대한 제안: [토론](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

  **2015년 2월 2일**<br/>

  * 추가됨stop_times.txt 사양에 대한 'timepoint' 제안: [토론](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

  **2014년 2월 17일**<br/>

  * 추가됨trips.txt 사양에 대한 'bikes_allowed' 제안: [토론](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

  **2012년 10월 15일**<br/>

  추가됨trips.txt 'wheelchair_accessible ' 사양에 대한 제안: [토론](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

  **2012년 6월 20일**<br/>

  * 사양에 '휠체어 탑승' 제안 추가: [토론](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

  **2012년 2월 2일**<br/>

  * 사양에 'stop_timezone' 제안 추가: [토론](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)

  **2012년 1월 18일**<br/>

  * 이전 code.google.com에서 developer.google.com의 새 위치로 문서를 마이그레이션했습니다.

  **2011년 9월 26일**<br/>

  * 사양에 'feed_info' 제안 추가: [토론](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

  **2011년 9월 6일**<br/>

  * 사양에 'agency_fare_url' 제안 추가: [토론](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
  * 사양에 'exact_times' 제안 추가: [토론](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

  **2009년 3월 30일**<br/>

  * 대중교통 피드 공개에 대한 새로운 섹션입니다. 이것은 데이터가 해석되거나 기록되는 방식에 대한 엄격한 변경이 아니었기 때문에 이전에 그룹에서 논의되지 않았습니다. 그러나 Google 직원 중 일부는GTFS 를 사용할 수 있는 응용 프로그램의 수가 증가하고 있기 때문입니다.GTFS -포맷된 데이터.
  * CSV 형식 설명: [토론](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk) .
  * route_color 및 route_text_color 필드의 설명에서 대비되는 색상을 선택하는 방법에 대한 추가 지침입니다.
  * a 및 b 스레드에서 제안되고 테스트된 trip_short_name.
  * 에 포함된 샘플 데이터의 사소한 오류에 대한 수정end 문서의 (정류장 S7에 parent_station S8 제공).
  * 샘플 데이터에 "agency_lang" 정보를 추가했습니다.end 의견 기간 동안 Marcy가 제안한 문서: [토론](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0) .
  * OCTA의 링크를 업데이트했습니다.GTFS 사이드바에서 피드
  * [원본 요약](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw) .

  **2009년 2월 26일**<br/>

  * 다른 많은 애플리케이션이 사용하므로 대부분의 Google 관련 피드 제출 지침을 제거했습니다.GTFS 이 시점에서 데이터.
  * Orange County OCTA의 공개 피드에 대한 사이드바의 끊어진 링크를 수정했습니다.

  **2008년 8월 7일**<br/>

  * 8월 6일 버전에서 실수로 생략된 stop_url 필드 복원
  * 샘플 데이터에 agency_phone 추가
  * Google에 피드를 제출할 때 데이터 사용 계약에 대한 언급을 추가했습니다.

  **2008년 8월 6일**<br/>

  * 추가됨transfers.txt 파일, 피드 게시자가 선호하는 전송 동작( [원래 제안](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw) )
  * location_type 및 parent_station 필드를 다음에 추가했습니다.stops.txt , 정지 지점을 역으로 그룹화할 수 있습니다( [원래 제안](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw) )
  * 에이전시의 음성 전화번호를 제공하기 위해 agency_phone 필드를 추가했습니다( [원래 제안](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA) )
  * 오픈 소스 테스트 도구를 언급하는 "피드 테스트" 섹션 추가
  * CSV 형식, agency_timezone, agency_lang, route_color, route_text_color, arrival_time, 출발\_시간,calendar.txt 대calendar_dates.txt , 요금표 및frequencies.txt
  * 피드 기록 문서에 대한 링크를 추가하고 일부 공개 피드 링크를 수정했습니다.
  * 현재 Google 지도 UI를 묘사하도록 예시 이미지를 업데이트했습니다.
  * 문서의 샘플 데이터 업데이트/수정

  **2008년 2월 29일**<br/>

  * 에 stop_code 필드를 추가했습니다.stops.txt 탑승자 쪽 정지 코드( [원래 제안](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc) )
  * route_short_name 및 route_long_name에 대한 설명을 명확히 했습니다.routes.txt
  * 에서 arrival_time 및 출발 시간에 대한 설명을 명확히 했습니다.stop_times.txt
  * 샘플 데이터 섹션의 오타 수정

  **2007년 11월 20일**<br/>

  * 명확한 block_id 설명
  * Google Transit을 덜 강조하도록 언어 변경(Google이 아닌 애플리케이션은GTFS , 대중교통 경로는 이제 Google 지도의 통합 기능입니다.) 다양한 오타를 수정하기 위해
  * 프레젠테이션을 반영하도록 예시 스크린샷을 업데이트했습니다.GTFS 현재 Google 지도 UI의 필드
  * 대중교통 데이터 제공업체의 Google 연락처 이메일 주소를 업데이트했습니다.
  * 업데이트된 형식

  **2007년 10월 5일**<br/>

  * 변경됨stop_sequence 그리고shape_pt_sequence 증가하는 음이 아닌 정수를 허용하기 위해
  * 명확한 설명 및 수정된 오타

  **2007년 5월 31일**<br/>

  * 업데이트된 페이지 스타일, HTML이 더 깔끔해지고 접근성이 높아짐
  * 공개 피드 예시 및 기타 유용한 사이트에 대한 링크 추가
  * 개별 필드 설명에서 제거된 예

  **2007년 4월 9일**<br/>

  * [피드 제출](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle) 섹션이 추가되었습니다.
  * [데모 대중 교통 기관 피드의 예](https://developers.google.com/transit/gtfs/examples/gtfs-feed) .
  * 메모 추가calendar.txt 모든 서비스 날짜가 다음에 정의된 경우 생략할 수 있습니다.calendar_dates.txt .
  * 만든agency_id 에이전시가 하나만 포함된 피드에서는 선택사항입니다. 이렇게 하면 기존 피드가agency_id 유효하게 유지합니다.
  * Agency_url, stop_url 및 route_url의 전체 사양과 해당 필드에 대한 추가 예제 값을 추가했습니다.
  * 유효한 것으로 6(곤돌라) 및 7(푸니쿨라) 추가route_type 가치.

  **2007년 3월 8일**<br/>

  * stop_url 필드를 이동하기 위한 사소한 편집stop_times.txt 2월 28일 업데이트에서 잘못 지정된 경우stops.txt , 그것이 속한 곳.

  **2007년 3월 5일**<br/>

  * route_long_name 필드의 설명을 명확히 하기 위해 약간 수정했습니다.

  **2007년 2월 28일**<br/>

  * 의 추가frequencies.txt 헤드 웨이 기반 일정 지원을 위해.
  * 이제 동일한 피드에서 여러 대행사가 허용됩니다. 또한 새로운 추가agency_id agency.txt 및routes.txt 어떤 기관에서 어떤 경로를 운영하는지 지정할 수 있습니다.
  * 경로별 및 정류장별 URL 추가.
  * 의 추가direction_id 필드trips.txt .
  * 중후반 지원trip stop_headsign 필드가 추가되어 행선지가 변경됩니다.stop_times.txt .
  * 선택적 route_color 및 route_text_color를 추가하여 경로 색상 지원routes.txt .
  * 거리 주소를 사용하여 정류장을 지정하는 기능을 제거했습니다. 사양의 이전 버전에서는 stop_street, stop_city, stop_region, stop_postcode 및 stop_country 필드의 거리 주소를 사용하여 대중교통 정류장의 위치를 제공할 수 있었습니다. 이제 stop_lat을 사용하여 정류장 위치를 지정해야 합니다.latitude 및 stop_lon에 대한longitude , 대부분의 응용 프로그램에 더 유용합니다.
  * 케이블카 추가vehicle 입력route_type 필드routes.txt .
  * 변경 사항에 대한 원본 [Headway 블로그 게시물](https://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/) 요약을 참조하십시오.

  **2006년 11월 29일**<br/>

  * 다음에 대한 지원 추가tripShape 정보를 통해shapes.txt
  * 의 정의를 명확히 했습니다.stop_sequence
  * 표시된 pickup_type 및 drop_off_type 선택 사항

  **2006년 10월 31일**<br/>

  * 요금 정보에 대한 지원 추가
  * 개별 파일 이름에서 날짜 제거
  * 변경route_type 값 정의
  * 여러 피드 파일을 동시에 게시할 수 있습니다.time , 복무 기간이 겹치지 않는 한
  * 고정된 block_idtrips.txt 선택 사항으로 올바르게 표시되도록
  * 열 머리글이 포함되어야 함을 언급했습니다.

  **2006년 9월 29일**<br/>

  * 예제에서 몇 가지 오류를 수정하기 위한 사소한 편집입니다.

  **2006년 9월 25일**<br/>

  * 초기 버전.
