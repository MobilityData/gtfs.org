# Enlaces de lenguaje Golang GTFS-realtime

Proporciona structs Golang generados a partir de la especificación ProtocolBuffer GTFS-realtime. Estos structs te permitirán parsear un binario ProtocolBuffer GTFS-realtime data feed en objetos Golang.

## Añadir la dependencia

Para utilizar los structs `gtfs-realtime-bindings` en tu propio proyecto, primero necesitas instalar esta librería con:

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

E instalar la dependencia de la biblioteca golang protobuf con:

    go get google.golang.org/protobuf/proto

## Código de ejemplo

El siguiente fragmento de código muestra la descarga de una fuente de datos GTFS-realtime desde una URL determinada, su análisis como FeedMessage (el tipo raíz del esquema GTFS-realtime) y la iteración sobre los resultados.

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

Para obtener más información sobre las convenciones de nomenclatura de los structs Golang generados a partir de the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consulte la[sección Códigos generados](https://developers.google.com/protocol-buffers/docs/reference/go-generated)Golang del sitio para desarrolladores Protocol Buffers.
