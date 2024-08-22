# Liaisons de langage Golang GTFS-realtime 
 
 Fournit des structures Golang générées à partir du protocole 
 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Spécification du tampon. Ces structures vous permettront d’analyser un flux de données binaires en temps réel Protocol Buffer GTFS dans des objets Golang. 
 
## Ajouter la dépendance 
 
 Pour utiliser les structures `gtfs-realtime-bindings` dans votre propre projet, vous devez d’abord installer cette bibliothèque avec : 
 
```
go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs
```

And install the golang protobuf library dependency with:
```
go get google.golang.org/protobuf/proto
```
 
## Exemple de code 
 
 L’extrait de code suivant montre le téléchargement d’un flux de données GTFS Realtime à partir d’une URL particulière, en l’analysant comme un FeedMessage (le type racine du § § Schéma GTFS-temps réel) et itération sur les résultats. 
 
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
 
 Pour plus de détails sur les conventions de dénomination des structures Golang générées à partir du [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consultez le [Golang Generated Code](https://developers.google.com/protocol-buffers/docs/reference/go- généré) section du site des développeur·euse de Protocol Buffers. 
