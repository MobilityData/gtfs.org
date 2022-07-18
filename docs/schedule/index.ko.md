# GTFS Schedule 개요

<div class="landing-page"><a class="button" href="reference">참조</a> <a class="button" href="best-practices">모범 사례</a> <a class="button" href="examples">예</a> <a class="button" href="changes">변경 사항</a></div>

## 시작하기

ㅏGTFS 정적 대중 교통 정보가 포함된 피드는 단일 ZIP 파일에 포함된 여러 텍스트(.txt) 파일로 구성됩니다. 각 파일은 정류장, 경로, 여행, 요금 등 대중 교통 정보의 특정 측면을 설명합니다. 각 파일에 대한 자세한 내용은 다음을 참조하십시오.GTFS 참조.

만들기 위해서는GTFS 피드는 아래 단계를 따르세요.

1. 에 설명된 모든 필수 파일을 생성합니다.GTFSSchedule 참조. 기능이 필요한 경우 선택적 파일을 작성하십시오.
1. 모든 파일을 .txt 형식으로 저장합니다. 필드 값은 쉼표로 구분되어야 하며 각 줄은 줄 바꿈으로 끝나야 합니다. 참조GTFS 파일 내용에 대한 자세한 내용은 참조를 참조하십시오.
1. 모든 텍스트 파일을 함께 압축합니다. 압축 파일은 피드 버전으로 구성됩니다.
1. 아래 옵션 중 하나를 사용하여 피드를 게시하세요.

## 대중교통 피드를 공개적으로 사용 가능하게 만들기

<hr/>

데이터 세트는 zip 파일 이름을 포함하여 공개 영구 URL에 게시해야 합니다. (예: [GTFS](<http://www.agency.org/\<glossary variable=>) [/](<http://www.agency.org/\<glossary variable=>)GTFS [.zip">www.agency.org/](<http://www.agency.org/\<glossary variable=>)GTFS [/](<http://www.agency.org/\<glossary variable=>)GTFS [.zip](<http://www.agency.org/\<glossary variable=>) ). 이상적으로는 URL이 파일에 액세스하기 위해 로그인할 필요 없이 직접 다운로드할 수 있어야 소프트웨어 응용 프로그램을 사용하여 쉽게 다운로드할 수 있습니다. 만드는 것이 권장되지만(가장 일반적인 관행)GTFS 데이터 제공자가 액세스를 제어해야 하는 경우 공개적으로 다운로드할 수 있는 데이터세트GTFS 라이선스 또는 기타 이유로 액세스를 제어하는 것이 좋습니다.GTFS 자동 다운로드를 용이하게 하는 API 키를 사용하는 데이터 세트.

웹 서버 호스팅GTFS 데이터는 파일 수정 날짜를 올바르게 보고하도록 구성되어야 합니다(섹션 14.29에서 HTTP/1.1 - 의견 요청 2616 참조).

추가 권장 사항은 " [모범 사례: 데이터 세트 게시](best-practices/#dataset-publishing-general-practices) "를 참조하십시오.

## 훈련

<hr/>

World Bank Open Learning Campus(OLC)는 "[Introduction to the General Transit Feed Specification (GTFS) and Informal Transit System Mapping](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping)”. 이 과정에는 다음 섹션이 포함됩니다.

* 무엇인가요GTFS ? 기록 및 파일 구조
* 무엇인가요GTFS ? 시각화 및 커뮤니티
* 설정GTFS 밥을 먹이다
* GitHub 및 오픈 소스 도구 소개
* 현장의 이야기
* 대중교통 데이터를 매핑하는 방법
* 도시의 첫 번째 피드에 대한 데이터를 수집하는 방법
* 앱 설문조사
* GTFS-Realtime

더 많은 [온라인 과정을](../resources/other/#on-line-courses) 참조하십시오.

## 도움말 및 커뮤니티 얻기

<hr/>

### 메일링 리스트

대중 교통 데이터, 소프트웨어,GTFS 그리고GTFS -Realtime 및 기타 문제:

* [GTFS 변경 사항](https://groups.google.com/group/gtfs-changes) : [GTFS 변경 사항 문서](https://github.com/google/transit/blob/master/gtfs/CHANGES.md) 에 요약된 GTFS 사양 확장 제안에 대한 논의입니다.
* [GTFS Realtime](https://groups.google.com/group/gtfs-realtime) : [GTFS-realtime 사양](https://github.com/google/transit/tree/master/gtfs-realtime) 에 대한 논의 .
* [MobilityData Slack](https://mobilitydata-io.slack.com/) : GTFS 주제 전용 채널이 있는 Slack "조직"입니다. [여기에서 mobilitydata-io.slack.com에 대한 초대를 요청하세요](https://share.mobilitydata.org/slack) .
* [Transitfeed](https://groups.google.com/group/transitfeed) : 오픈 소스 [운송 피드](https://groups.google.com/group/transitfeed) 프로젝트에 대한 논의와 GTFS 사양 및 관련 도구에 대한 논의.
* [대중 교통 개발자](https://groups.google.com/group/transit-developers) : 일반 대중 교통 개발자 토론. 많은 대중 교통 기관에는 기관과 관련된 자체 개발자 메일링 목록이 있습니다. 예를 들어:
    * [뉴욕 MTA](https://groups.google.com/group/mtadeveloperresources)
    * [오리건주 포틀랜드](https://groups.google.com/group/transit-developers-pdx)
    * [바트 - 샌프란시스코, 캘리포니아](https://groups.google.com/group/bart-developers)
    * [매스닷](https://groups.google.com/group/massdotdevelopers)
    * [애틀랜타, 조지아 지역](https://groups.google.com/forum/#!forum/atl-transit-developers)
    * [511 샌프란시스코 베이 지역 개발자 리소스](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)

지역 교통 기관에 자체 메일링 리스트가 있는지 확인하십시오.

더 많은 [커뮤니티 리소스](../resources/community) 를 참조하십시오.
