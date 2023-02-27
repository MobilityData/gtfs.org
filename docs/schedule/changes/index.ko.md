---
search:
  exclude: true
---

# GTFS Schedule 변경 사항

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

그만큼GTFS 사양은 정해진 것이 아닙니다. 대신 대중 교통 기관, 개발자 및 기타 이해 관계자 커뮤니티에서 개발하고 유지 관리하는 개방형 사양입니다.GTFS . 이 생산자와 소비자의 공동체는GTFS 데이터에는 새로운 기능을 사용할 수 있도록 사양을 확장하기 위한 제안이 있습니다.

기여하다GTFS , [사양 수정 프로세스](../process) 를 읽고 Google의 Transit Github 저장소( [google/transit](https://github.com/google/transit) )에서 열린 [문제](https://github.com/google/transit/issues) 및 [풀 요청](https://github.com/google/transit/pulls) 의 토론을 따르십시오.![](../../assets/mark-github.svg)

<div class="admonition note"><p>공식 사양, 참조 및 문서는 영어로 작성됩니다. 만약 번역 다른 언어로 영어 원본과 다른 경우 후자가 우선합니다. 모든 의사소통은 영어로 이루어집니다.</p></div>


## 활성 제안 &ensp; <img src="../../assets/pr-active.svg" style="height:1em;"/>

<!--
Active proposals for new features in <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.  -->

[Github](https://github.com/google/transit/pulls) 에서 토론에 참여하세요!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add <glossary variable="trip">trip</glossary>-to-<glossary variable="trip">trip</glossary> transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## 최근 병합된 제안서 &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

이제 [공식의 기능이 된 최근에 병합된 제안GTFS Schedule사양](../reference) . 자세한 내용은 전체 [개정 내역](../process#revision-history) 을 참조하십시오.

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">추가하다여행 -에게-여행 좌석 옵션이 있는 환승</a></h3><p class="maintainer"> #303 by <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> 는 2022년 6월 26일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> 다음에 대한 새로운 <code>transfer_type</code> 을 추가합니다.trip 에게trip 동일한 경우 사용자가 &quot;좌석 이동&quot;을 수행할 수 있는지 정의하기 위한 이동vehicle 2회 연속 운행 중이며 사용자는 선상에 머무를 수 있습니다.</li><li> 좌석 내 환승이 허용되지 않는 경우를 정의할 수 있지만 운영상 서로 다른 두 여행을 함께 연결할 수 있습니다. </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank"> GTFS-Fares V2 기본 구현</a></h3><p class="maintainer"> #286 by <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> 가 2022년 5월 17일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> 대중교통 요금 및 티켓</li><li> 복잡한 운임 및 환승 비용 모델링(다중 네트워크,time -기반 및 카운트 기반 전송)</li><li> 정류장을 요금 구역에 연결하는 모델 </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">추가하다여행-에게-여행 좌석 옵션이 있는 환승</a></h3><p class="maintainer"> #284 by <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> 가 2021년 10월 5일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> 정류장 간 환승 규칙 지정,trip 또는 경로 쌍transfers.txt</li><li> 서로 다른 쌍 배열에 기반한 전송 규칙의 순위 지정 특이성 </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3><p class="maintainer"> #208 by <a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a> 이 2020년 5월 13일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> 라이더 픽업 또는 하차를 따라 어디에서나 허용vehicle 님의 여행 경로 </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3><p class="maintainer"> #180 by <a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a> 가 2020년 1월 9일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> 에 대한 번역text 필드, 현지화된 URL 및 연락처 정보 </li></ul></div></div>

<div class="row"/>
