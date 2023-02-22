# Golang GTFS-realtime言語バインディング

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)のProtocolBuffer仕様から生成されたGolang構造体を提供します。 これらの構造体によって、バイナリのProtocolBuffer GTFS-realtimeデータフィードをパースしてGolangオブジェクトにすることができます。

## 依存関係の追加

`gtfs-realtime-bindings`構造体を自分のプロジェクトで使うには、まずこのライブラリをインストールします。

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

そして、golang protobufライブラリの依存関係をインストールします。

    go get google.golang.org/protobuf/proto

## コード例

次のコードでは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをFeedMessage（GTFS-realtimeスキーマのルートタイプ）として解析し、結果を反復処理する様子を示しています。

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

[gtfs-realtime.protoから](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成されるGolang構造体の命名規則の詳細については、Protocol Buffers開発者サイトの[Golang生成されたコード部分](https://developers.google.com/protocol-buffers/docs/reference/go-generated)参照してください。
