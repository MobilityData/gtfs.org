# Golang GTFS-realtime Sprachbindungen

Stellt Golang-Strukturen zur Verfügung, die aus der GTFS-Realtime ProtocolBuffer-Spezifikation generiert wurden. Diese Strukturen ermöglichen es Ihnen, einen binären ProtocolBuffer GTFS-Realtime-Datenfeed in Golang-Objekte zu parsen.

## Hinzufügen der Abhängigkeit

Um die `gtfs-realtime-bindings-Strukturen` in Ihrem eigenen Projekt zu verwenden, müssen Sie zuerst diese Bibliothek mit installieren:

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

Und installieren Sie die Golang-Protobuf-Bibliothek-Abhängigkeit mit:

    go get google.golang.org/protobuf/proto

## Beispielcode

Der folgende Codeausschnitt veranschaulicht das Herunterladen eines GTFS-Realtime datenfeeds von einer bestimmten URL, das Parsen als FeedMessage (der Stammtyp des GTFS-Realtime schemas) und die Iteration der Ergebnisse.

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

Weitere Details zu den Namenskonventionen für die Golang-Strukturen, die aus dem [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) generiert werden finden Sie im Abschnitt [Golang Generated Codesection](https://developers.google.com/protocol-buffers/docs/reference/go-generated)auf der Protocol Buffers Developer Site.
