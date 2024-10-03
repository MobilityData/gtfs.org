# Golang GTFS-realtime 言語バインディング

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) プロトコル バッファ仕様から生成された Golang 構造体を提供します。これらの構造体を使用すると、バイナリ Protocol Buffer GTFS リアルタイム データ フィードを Golang オブジェクトに解析できます。

## 依存関係の追加

独自のプロジェクトで`gtfs-realtime-bindings`構造体を使用するには、まず次のコマンドでこのライブラリをインストールする必要があります: 

```
go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs
```

そして次のコマンドで golang protobuf ライブラリ依存関係をインストールします:
```
go get google.golang.org/protobuf/proto
```

## サンプル コード

次のコード スニペットは、特定の URL から GTFS リアルタイム データ フィードをダウンロードし、それを FeedMessage (GTFS realtime スキーマのルート タイプ) として解析し、結果を反復処理する方法を示しています。

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

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成される Golang 構造体の命名規則の詳細については、Protocol Buffers 開発者サイトの [Golang 生成コード](https://developers.google.com/protocol-buffers/docs/reference/go-generated) セクションをご覧ください。