# Liaisons de langage Golang GTFS-realtime

Fournit des structs Golang générés à partir de la spécification ProtocolBuffer [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime). Ces structs vous permettront d'analyser un flux de données ProtocolBuffer GTFS-realtime binaire en objets Golang.

## Ajouter la dépendance

Pour utiliser les structs `gtfs-realtime-bindings` dans votre propre projet, vous devez d'abord installer cette bibliothèque avec :

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

Et installer la dépendance de la bibliothèque golang protobuf avec :

    go get google.golang.org/protobuf/proto

## Exemple de code

L'extrait de code suivant montre le téléchargement d'un flux de données GTFS-realtime à partir d'une URL particulière, son analyse en tant que FeedMessage (le type racine du schéma GTFS-realtime) et l'itération des résultats.

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

Pour plus de détails sur les conventions de nommage des structs Golang générés à partir du [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consultez [la section Golang Généré](https://developers.google.com/protocol-buffers/docs/reference/go-generated) du site du développeur Protocol Buffers.
