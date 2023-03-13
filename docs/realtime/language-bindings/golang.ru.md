# Связки языка Golang GTFS-realtime

Предоставляет структуры Golang, созданные на основе спецификации [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer. Эти структуры позволят вам разобрать двоичный поток данных ProtocolBuffer GTFS-realtime в объекты Golang.

## Добавьте зависимость

Чтобы использовать структуры `gtfs-realtime-bindings` в вашем собственном проекте, вам нужно сначала установить эту библиотеку:

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

И установить зависимость библиотеки golang protobuf с:

    go get google.golang.org/protobuf/proto

## Пример кода

Следующий фрагмент кода демонстрирует загрузку потока данных GTFS-realtime с определенного URL, его разбор как FeedMessage (корневой тип схемыGTFS-realtime) и итерацию результатов.

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

Более подробную информацию о соглашениях об именах для структур Golang, сгенерированных из the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), можно найти в [Golang Сгенерированный код разделе](https://developers.google.com/protocol-buffers/docs/reference/go-generated)на сайте разработчика Protocol Buffers.
