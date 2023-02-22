# JavaScript GTFS-realtime 언어 바인딩

[![npm 버전](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer 사양에서 생성된 JavaScript 클래스 및 관련 유형을 제공합니다. 이러한 클래스를 사용하면 바이너리 ProtocolBuffer GTFS-실시간 데이터 피드를 JavaScript 개체로 파싱할 수 있습니다.

이러한 바인딩은 [Node.js](http://nodejs.org/) 환경에서 사용하도록 설계되었지만 약간의 노력을 기울이면 다른 JavaScript 환경에서도 사용할 수 있습니다.

우리는 자바스크립트 프로토콜 버퍼 지원을 위해 [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) 라이브러리를 사용합니다.

## 종속성 추가

자신의 프로젝트에서 `gtfs-realtime-bindings` 클래스를 사용하려면 먼저 [Node.js npm 패키지](https://www.npmjs.com/package/gtfs-realtime-bindings) 를 설치해야 합니다.

    npm install gtfs-realtime-bindings

## 예제 코드

다음 Node.js 코드 스니펫은 특정 URL에서 GTFS 실시간 데이터 피드를 다운로드하여 FeedMessage(GTFS 실시간 스키마의 루트 유형)로 파싱하고 결과를 반복하는 방법을 보여줍니다.

이 예제가 작동하도록 하려면 먼저 NPM과 함께 `node-fetch` 를 설치해야 합니다.

_참고: 이 예제는 ES 모듈( `import` / `export` 구문)을 사용하고 있으며 CommonJS( `require` 구문)와 호환되지 않습니다. `import` 를 `require` 로 변환하고 `node-fetch@2` 를 설치하여 CommonJS를 사용할 수 있습니다. [여기에서](https://nodejs.org/api/esm.html) ES 모듈에 대해 자세히 알아보십시오._

```javascript
import GtfsRealtimeBindings from "gtfs-realtime-bindings";
import fetch from "node-fetch";

(async () => {
  try {
    const response = await fetch("<GTFS-realtime source URL>", {
      headers: {
        "x-api-key": "<redacted>",
        // replace with your GTFS-realtime source's auth token
        // e.g. x-api-key is the header value used for NY's MTA GTFS APIs
      },
    });
    if (!res.ok) {
      const error = new Error(`${res.url}: ${res.status} ${res.statusText}`);
      error.response = res;
      throw error;
      process.exit(1);
    }
    const buffer = await response.arrayBuffer();
    const feed = GtfsRealtimeBindings.transit_realtime.FeedMessage.decode(
      new Uint8Array(buffer)
    );
    feed.entity.forEach((entity) => {
      if (entity.tripUpdate) {
        console.log(entity.tripUpdate);
      }
    });
  }
  catch (error) {
    console.log(error);
    process.exit(1);
  }
})();
```

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) 에서 생성된 JavaScript 클래스의 명명 규칙에 대한 자세한 내용은 프로토콜 버퍼 직렬화를 처리하는 데 사용하는 [ProtoBuf.js 프로젝트](https://github.com/dcodeIO/ProtoBuf.js/wiki) 를 확인하세요.
