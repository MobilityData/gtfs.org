# gtfs-실시간 바인딩 [![MobilityData 채팅에 참여](https://img.shields.io/badge/chat-on%20slack-red)](https://bit.ly/mobilitydata-slack)

널리 사용되는 언어에 대한 [GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) 프로토콜 버퍼 사양에서 생성된 언어 바인딩입니다.

## 소개

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) 은 대중 교통 시스템에 대한 실시간 정보를 전달하기 위한 데이터 형식입니다. GTFS Realtime 데이터는 빠르고 효율적인 처리를 위해 설계된 소형 바이너리 표현인 [ProtocolBuffers](https://developers.google.com/protocol-buffers/) 를 사용하여 인코딩 및 디코딩됩니다. 데이터 스키마 자체는 [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) 에 정의되어 있습니다.

GTFS Realtime 데이터로 작업하기 위해 개발자는 일반적으로 `gtfs-realtime.proto` 스키마를 사용하여 선택한 프로그래밍 언어로 클래스를 생성합니다. 그런 다음 이러한 클래스를 사용하여 GTFS-realtimedata 모델 개체를 생성하고 이를 이진 데이터로 직렬화하거나 역방향으로 이진 데이터를 데이터 모델 개체로 구문 분석할 수 있습니다.

`gtfs-realtime.proto` 스키마에서 GTFS Realtime 데이터 모델 클래스를 생성하는 것은 매우 일반적인 작업이지만 때로는 초심자 개발자에게 혼란을 주기도 하기 때문에 이 프로젝트의 목표는 사전 생성된 GTFS Realtime 언어 바인딩을 가장 많은 사용자에게 제공하는 것입니다. 인기 있는 프로그래밍 언어. 가능한 경우 이러한 언어 바인딩은 다른 프로젝트에서 쉽게 사용할 수 있도록 패키지로 게시됩니다.

## 지원되는 언어

* [.그물](dotnet.md)
* [자바](java.md)
* [자바스크립트/타입스크립트/Node.js](nodejs.md)
* [파이썬](python.md)
* [골랑](golang.md)
* ~~[루비](ruby.md)~~ *(2019년 초부터 지원 중단됨)*
* ~~[PHP](php.md)~~ *(2019년 초부터 지원 중단됨)*

## 다른 언어

우리는 C++용으로 생성된 코드를 제공하지 않습니다. 공식 protoc 컴파일러를 사용하세요(from [here](https://developers.google.com/protocol-buffers/docs/downloads) 또는 [here](https://github.com/google/protobuf) ).

좋아하는 언어가 누락되었나요? 기여 고려:

1. [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md) 를 읽으십시오.
2. 선택한 언어로 풀 리퀘스트를 엽니다. 업데이트 지침(이상적으로는 스크립트)을 포함하십시오. 또한 언어 생태계에 적합한 패키징을 제공합니다.

## 프로젝트 역사

이 프로젝트는 원래 Google에서 만들었습니다. MobilityData는 2019년 초에 프로젝트를 유지 관리하기 시작했습니다.

바인딩 라이브러리의 이전 버전은 여전히 Google 이름으로 게시됩니다. Google에서 게시한 마지막 버전을 찾으려면 [여기](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) 에서 각 언어에 대한 문서를 참조하세요.
