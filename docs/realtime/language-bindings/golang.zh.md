# Golang GTFS-realtime 语言绑定

提供从 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer 规范中生成的 Golang 结构。 这些结构可以让你解析二进制的 ProtocolBuffer GTFS-realtime 数据馈送到 Golang 对象。

## 添加依赖关系

要在你自己的项目中使用`gtfs-realtime-bindings`结构，你需要首先安装这个库，并使用。

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

并通过以下方式安装 golang protobuf 库的依赖关系。

    go get google.golang.org/protobuf/proto

## 示例代码

下面的代码片段演示了从一个特定的URL下载GTFS-realtime数据源，将其解析为FeedMessage（GTFS-realtime模式的根类型），并对结果进行迭代。

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

关于从[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的Golang结构的命名规则的更多细节，请查看协议缓冲区开发者网站的[Golang生成的代码部分](https://developers.google.com/protocol-buffers/docs/reference/go-generated)。
