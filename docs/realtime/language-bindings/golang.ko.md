# Golang GTFS-realtime 언어 바인딩

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer 사양에서 생성된 Golang 구조체를 제공합니다. 이러한 구조체를 사용하면 바이너리 ProtocolBuffer GTFS-realtime 데이터 피드를 Golang 개체로 파싱할 수 있습니다.

## 종속성 추가

자신의 프로젝트에서 `gtfs-realtime-bindings` 구조체를 사용하려면 먼저 다음을 사용하여 이 라이브러리를 설치해야 합니다.

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

다음을 사용하여 golang protobuf 라이브러리 종속성을 설치합니다.

    go get google.golang.org/protobuf/proto

## 예제 코드

다음 코드 스니펫은 특정 URL에서 GTFS-realtime 데이터 피드를 다운로드하여 FeedMessage(GTFS-realtime 스키마의 루트 유형)로 파싱하고 결과를 반복하는 방법을 보여줍니다.

```golang
package main

import (
    "fmt"
    "google.golang.org/protobuf/proto"
    "github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs"
    "io/ioutil"
    "log"
    "net/http"
)

func main() {
    var (
        username = "YOUR_ACCESS_KEY"
        password = "YOUR_SECRET_KEY"
    )

    client := &http.Client{}
    req, err := http.NewRequest("GET", "URL OF YOUR GTFS-REALTIME SOURCE GOES HERE", nil)
    req.SetBasicAuth(username, password)
    resp, err := client.Do(req)
    defer resp.Body.Close()
    if err != nil {
        log.Fatal(err)
    }
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        log.Fatal(err)
    }

    feed := gtfs.FeedMessage{}
    err = proto.Unmarshal(body, &feed)
    if err != nil {
        log.Fatal(err)
    }

    for _, entity := range feed.Entity {
        tripUpdate := entity.GetTripUpdate()
        trip := tripUpdate.GetTrip()
        tripId := trip.GetTripId()
        fmt.Printf("Trip ID: %s\n", tripId)
    }
}
```

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) 에서 생성된 Golang 구조체의 명명 규칙에 대한 자세한 내용은 프로토콜 버퍼 개발자 사이트의 [Golang 생성 코드](https://developers.google.com/protocol-buffers/docs/reference/go-generated) 섹션을 확인하세요.
