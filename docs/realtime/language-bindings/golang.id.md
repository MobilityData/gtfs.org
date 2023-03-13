# Golang GTFS-realtime Language Bindings

Menyediakan struktur Golang yang dihasilkan dari spesifikasi ProtocolBuffer [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) . Struktur ini akan memungkinkan Anda mengurai umpan data GTFS-realtime biner ProtocolBuffer ke objek Golang.

## Tambahkan Ketergantungan

Untuk menggunakan `gtfs-realtime-bindings` di project Anda sendiri, Anda harus menginstal library ini terlebih dahulu dengan:

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

Dan instal dependensi perpustakaan golang protobuf dengan:

    go get google.golang.org/protobuf/proto

## Kode Contoh

Cuplikan kode berikut menunjukkan pengunduhan umpan data GTFS-realtime dari URL tertentu, menguraikannya sebagai FeedMessage (jenis root dari skema GTFS-realtime), dan mengulangi hasilnya.

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

Untuk detail lebih lanjut tentang konvensi penamaan untuk struktur Golang yang dihasilkan dari [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) , lihat bagian [Kode yang Dihasilkan Golang](https://developers.google.com/protocol-buffers/docs/reference/go-generated) di situs pengembang Protocol Buffers.
