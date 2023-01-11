# Python GTFS-realtime Language Bindings

[![Versão PyPI](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

Fornece classes Python geradas a partir da especificação do ProtocolBuffer em GTFS-realtime. Estas classes permitirão analisar uma alimentação de dados binários do ProtocolBuffer GTFS-realtime em objetos Python.

## Adicionar a Dependência

Para usar as classes `gtfs-realtime-bindings` em seu próprio projeto, você precisa primeiro instalar o módulo a partir do[repositórioPyPI](https://pypi.python.org/pypi/gtfs-realtime-bindings).

    # Using easy_install
    easy_install --upgrade gtfs-realtime-bindings

    # Using pip
    pip install --upgrade gtfs-realtime-bindings

## Código de exemplo

O seguinte trecho de código demonstra o download de um feed de dados em GTFS-realtime de uma URL específica, analisando-o como um FeedMessage (o tipo raiz do esquema em tempo real doGTFS), e iterando sobre os resultados.

```python
from google.transit import gtfs_realtime_pb2
import requests

feed = gtfs_realtime_pb2.FeedMessage()
response = requests.get('URL OF YOUR GTFS-REALTIME SOURCE GOES HERE')
feed.ParseFromString(response.content)
for entity in feed.entity:
  if entity.HasField('trip_update'):
    print(entity.trip_update)
```

Para mais detalhes sobre as convenções de nomenclatura para as classes Python generated from the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consulte a[seção Python Generated Codesection](https://developers.google.com/protocol-buffers/docs/reference/python-generated)do site do desenvolvedor do Protocolo Buffers.
