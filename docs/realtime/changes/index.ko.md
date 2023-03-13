# GTFS Realtime 변경

GTFS Realtime 사양은 정해진 것이 아닙니다. 대신 GTFS Realtime을 사용하는 대중교통 기관, 개발자 및 기타 이해관계자 커뮤니티에서 개발하고 유지 관리하는 공개 사양입니다. GTFS Realtime 데이터의 이 생산자 및 소비자 커뮤니티는 새로운 기능을 사용할 수 있도록 사양을 확장하기 위한 제안을 할 것으로 예상됩니다.

GTFS Realtime에 기여하려면 [사양 수정 프로세스](../process) 를 읽고 Google의 Transit Github 저장소( [google/transit](https://github.com/google/transit) )에서 열린 [문제](https://github.com/google/transit/issues) 및 [풀 요청](https://github.com/google/transit/pulls) 의 토론을 따르십시오. ![](../../assets/mark-github.svg)

!!! note ""

    공식 사양, 참조 및 문서는 영어로 작성됩니다. 만약번역 다른 언어로 영어 원본과 다른 경우 후자가 우선합니다. 모든 의사소통은 영어로 이루어집니다.

<!-- <br><div class="landing-page">
    <a class="button" href="../process">사양 수정 프로세스</a><a class="button" href="../guiding-principles">지침 원칙</a><a class="button" href="../revision-history">개정 내역</a><a class="button" href="../extensions">실시간 확장</a>
</div> -->

## 활성 제안 &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- 새로운 기능에 대한 적극적인 제안GTFS Realtime .  -->

[Github](https://github.com/google/transit/pulls) 에서 토론에 참여하세요!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">추가하다cause_detail 그리고effect_detail 알림으로</a></h3>
        <p class="maintainer">#332가 2022년 5월 31일에 열었습니다. <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">현재 활성화된 제안이 없습니다.GTFS Realtime .</h3>
        <p class="prompt">제안이 있으십니까? &ensp;➜&ensp; 열기 <a href="https://github.com/google/transit/pulls" target="_blank">풀 리퀘스트</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## 최근 병합된 제안서 &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

이제 [공식 GTFS Realtime 사양](../reference) 의 기능이 된 최근에 병합된 제안입니다. 자세한 내용은 전체 [개정 내역](../process#revision-history) 을 참조하십시오.

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Alerts에 cause_detail 및 effect_detail 추가</a></h3><p class="maintainer"> #332 by <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> 은 2022년 6월 26일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> Alerts 원인과 결과에 대한 설명 추가 </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : 휠체어 액세스 업데이트</a></h3><p class="maintainer"> #340 by <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> 이 2022년 7월 25일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> 여행 접근성에 대한 실시간 정보 추가</li><li> 제공된 경우 GTFS 일정 데이터세트에서 <code>trips.wheelchair_accessible</code> 을 덮어씁니다. </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Alerts 의 기능/이미지</a></h3><p class="maintainer"> #283 by <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> 가 2021년 11월 26일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> 알림에 대한 이해도를 높이기 위해 앱의 서비스 알림에 표시할 이미지(ex. 사진, 지도)에 대한 URL 링크 필드를 추가합니다.</li><li> 변경 사항에는 이미지의 크기 제한 적용, 경고당 하나의 이미지, 이미지의 내용이나 언어가 변경될 경우 URL 변경 확인이 포함됩니다. </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">GTFS-NewShapes를 실험용으로 추가</a></h3><p class="maintainer"> #272 by <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> 이 2021년 8월 30일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> 우회로를 반영하기 위해 실시간으로 경로 형태를 업데이트하는 기능</li><li> 경로 업데이트는 기존 <code>shape_id</code> 를 참조하거나 인코딩된 폴리라인으로 새 모양을 실시간으로 정의하여 반영됩니다. </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">TripUpdate에 departure_occupancy_status 추가</a></h3><p class="maintainer"> #260 by <a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a> 가 2021년 4월 14일에 합병되었습니다.</p></div><div class="featurelist"><ul><li> 현재 또는 과거 데이터를 기반으로 향후 정류장에서 대중교통 차량의 예측 점유를 제공합니다.</li></ul></div></div>

<div class="row"/>
