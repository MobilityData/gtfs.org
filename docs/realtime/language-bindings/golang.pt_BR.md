# Golang GTFS-realtime Language Bindings

Fornece estruturas Golang geradas a partir da especificação do  Buffer de  Protocolo GTFS-realtime. Estas estruturas permitirão analisar uma alimentação de dados binários do Protocol Buffer GTFS-realtime em objetos Golang.

## Adicionar a Dependência

Para utilizar as estruturas `gtfs-realtime-bindings` em seu próprio projeto, você precisa primeiro instalar esta biblioteca com:

    go get github.com/MobilityData/gtfs-realtime-bindings/golang/gtfs

E instale a dependência da biblioteca golang protobuf com:

    go get google.golang.org/protobuf/proto

## Código de exemplo

O seguinte trecho de código demonstra o download de um feed de dados GTFS-realtime de uma URL específica, analisando-o como um FeedMessage (o tipo raiz do esquema GTFS-realtime), e iterando sobre os resultados.

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

Para mais detalhes sobre as convenções de nomenclatura para os structs Golang gerados a partir de the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consulte a[seção Golang Generated Codesection](https://developers.google.com/protocol-buffers/docs/reference/go-generated)do site do desenvolvedor do Protocol Buffers.
