<svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>

# GTFS-요금 v2

Fares v2는 [Fares v1](/schedule/examples/fares-v1) 의 제한 사항을 해결하는 것을 목표로 하는 GTFS 일정 확장 프로젝트입니다.

Fares v2가 나타낼 주요 개념은 다음과 같습니다.

- 요금 상품(예: 티켓 및 패스)
- 라이더 카테고리(예: 노인 및 어린이)
- 요금 지불 옵션(예: 은행 카드 및 신용 카드)
- 요금 한도

이러한 개념을 통해 데이터 생산자는 구역 기반, 시간 종속 및 기관 간 요금을 모델링할 수 있습니다. 이 확장 프로젝트는 반복적으로 채택되고 있습니다.

현재 채택된 Fares v2의 기본 구현은 다음 사용 사례에서 작동합니다.

- 대중교통 요금 정의
- 동일한 요금 구역 내 서비스 위치 설명
- 편도 여행에 대한 규칙 만들기
- 전송 규칙 만들기

여기에서 채택된 Fares v2 기본 구현을 사용하여 모델링할 수 있는 것을 보여주는 [예](/schedule/examples/fares-v2) 를 볼 수 있습니다.

생산자는 Fares v1과 동일한 데이터 세트에서 Fares v2를 구현할 수 있습니다. 둘 사이에 기술적인 충돌이 없기 때문입니다. 소비자는 서로 독립적으로 사용할 버전을 선택할 수 있습니다. Fares v2가 채택되고 충분히 보증됨에 따라 향후에는 Fares v1이 더 이상 사용되지 않을 수 있습니다.

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/gtfs-fares-v2">전체 제안서 보기</a>

## 진행 중인 운임 v2 작업

[운임 매체(이전 운임 컨테이너) 제안이 통과되어](https://github.com/google/transit/pull/355#issuecomment-1468326858) 공식적으로 사양에 채택되었습니다!

그만큼Fares V2 작업 회의는 이제 [시간 변동 요금을 모델링하고 채택하는 데 중점을 둘 것입니다.](https://github.com/google/transit/pull/357)

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/slack">Slack에서 #gtfs-fares 가입</a> <a class="button no-icon" target="_blank" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057">회의 일정</a><a class="button no-icon" target="_blank" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit">보기 회의 메모 보기</a>

## 최초 채택자

🎉 Fares v2를 처음 사용하시는 분들께 감사드립니다! 공식 사양에 추가하기 위한 공개 투표가 열리기 전에 최소 1명의 데이터 생산자와 1명의 소비자가 실험적 기능 구현을 약속해야 합니다. 이러한 조직은 GTFS가 계속 발전할 수 있도록 실험적 변경에 많은 시간과 에너지를 투자합니다.

채택된 기본 구현을 위해 최초 채택자는 다음과 같습니다.

- 생산자: [Interline](https://www.interline.io/) , [Maryland Department of Transportation](https://www.mta.maryland.gov/developer-resources) , [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- 소비자: [Transit](https://transitapp.com/)

현재 논의 중인 운임 fare media 기능의 경우 최초 채택자는 다음과 같습니다.

- 제작사 : [Interline](https://www.interline.io/), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- 소비자: [Apple](https://www.apple.com/)

<a class="button no-icon" target="_blank" href="https://docs.google.com/spreadsheets/d/1jpKjz6MbCD2XPhmIP11EDi-P2jMh7x2k-oHS-pLf2vI/edit?usp=sharing">누가 Fares v2 파일 및 필드를 사용하는지 확인</a>

## 논의 중인 요금 기능

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## 역사

- **2017** : 산업 연구 및 데이터 모델링
- **2021년 10월** : [기본 구현 초안 작성 및 공유](https://github.com/google/transit/pull/286#issue-1026848880)
- **2021년 12월** : [공개 투표 1번 → 통과하지 못함](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **2022년 3월** : [공개 투표 #2 → 통과하지 못함](https://github.com/google/transit/pull/286#issuecomment-1080716109)
- **2022년 5월** : [공개 투표 #3 → 통과](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **2022년 8월** : [Fares v2의 다음 단계에 대한 커뮤니티 논의 시작](https://github.com/google/transit/issues/341)
- **2022년 12월** : [커뮤니티에서 기능의 스택 순위 순서를 식별하여 반복의 우선순위를 지정합니다.](https://github.com/google/transit/issues/341#issuecomment-1339947915)
