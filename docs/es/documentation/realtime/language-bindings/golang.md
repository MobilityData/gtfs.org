# Golang GTFS-realtime Language Bindings

 Proporciona estructuras Golang generadas a partir del 
 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocolo 
 Especificación del búfer. Estas estructuras le permitirán analizar un protocolo binario 
 Buffer GTFS de datos en tiempo real en objetos Golang. 
 
## Agregar la dependencia 
 
 Para usar las estructuras `gtfs-realtime-bindings` en su propio proyecto, primero necesita 
 instalar esta biblioteca con: 
 
```
go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs
```
 
 E instale la dependencia de la biblioteca golang protobuf con: 
```
go get google.golang.org/protobuf/proto
```
 
## Código de ejemplo 
 
 El siguiente fragmento de código demuestra la descarga de un feed de datos GTFS en tiempo real 
 desde una URL particular, analizándolo como un FeedMessage (el tipo raíz del GTFS-realtime schema) e iterando sobre los resultados. 
 
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
 
 Para obtener más detalles sobre las convenciones de nomenclatura para las estructuras Golang generadas 
 a partir de 
 [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), 
 consulte el 
 [Código generado por Golang](https://developers.google.com/protocol-buffers/docs/reference/go-generated) 
 sección del sitio para desarrolladores de Protocol Buffers. 
