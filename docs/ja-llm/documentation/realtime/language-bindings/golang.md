# Golang GTFS-realtime 言語バインディング {: #golang-gtfs-realtime-language-bindings}

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol Buffer 仕様から生成された Golang の struct を提供します。これらの struct を使用することで、バイナリ形式の Protocol Buffer GTFS-realtime データフィードを Golang のオブジェクトに解析することができます。

## 依存関係の追加 {: #add-the-dependency}

ご自身のプロジェクトで `gtfs-realtime-bindings` の構造体を使用するには、まず次のコマンドでこのライブラリをインストールする必要があります:

```
go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs
```

そして、golang の protobuf ライブラリの依存関係を次のコマンドでインストールしてください:
```
go get google.golang.org/protobuf/proto
```

## コード例 {: #example-code}

以下のコードスニペットは、特定の URL から GTFS-realtime データフィードをダウンロードし、それを GTFS-realtime スキーマのルート型である FeedMessage としてパースし、結果を反復処理する方法を示しています。

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

Golang の struct が [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成される際の命名規則についての詳細は、Protocol Buffers 開発者サイトの [Golang Generated Code](https://developers.google.com/protocol-buffers/docs/reference/go-generated) セクションを参照してください。
