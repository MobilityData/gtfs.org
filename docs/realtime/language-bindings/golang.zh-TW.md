# Golang GTFS-realtime語言綁定

提供從[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer 規範生成的 Golang 結構。這些結構將允許您將二進制 ProtocolBuffer GTFS-realtime 數據饋送解析為 Golang 對象。

## 添加依賴項

要在您自己的項目中使用`gtfs-realtime-bindings`結構，您需要首先安裝此庫：

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

並使用以下命令安裝 golang protobuf 庫依賴項：

    go get google.golang.org/protobuf/proto

## 示例代碼

以下代碼片段演示了從特定 URL 下載 GTFS-realtime 數據提要，將其解析為 FeedMessage（GTFS-realtime 架構的根類型），並迭代結果。

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

有關從[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的 Golang 結構的命名約定的更多詳細信息，請查看 Protocol Buffers 開發人員站點的[Golang 生成代碼](https://developers.google.com/protocol-buffers/docs/reference/go-generated)部分。
