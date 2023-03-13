# Enlaces de lenguaje Python GTFS-realtime

[![Versión PyPI](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

Proporciona clases Python generadas a partir de la especificación ProtocolBuffer [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime). Estas clases le permitirán analizar una fuente de datos binaria ProtocolBuffer GTFS-realtime en objetos Python.

## Añadir la dependencia

Para utilizar las clases `gtfs-realtime-bindings` en tu propio proyecto, primero necesitas instalar el módulo desde el [repositorio PyPI](https://pypi.python.org/pypi/gtfs-realtime-bindings).

    # Using easy_install
    easy_install --upgrade gtfs-realtime-bindings

    # Using pip
    pip install --upgrade gtfs-realtime-bindings

## Código de ejemplo

El siguiente fragmento de código muestra la descarga de una fuente de datos GTFS-realtime desde una URL determinada, su análisis como FeedMessage (el tipo raíz del esquema GTFS-realtime) y la iteración sobre los resultados.

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

Para obtener más información sobre las convenciones de nomenclatura de las clases Python generadas a partir de [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consulte la [sección Códigos generados en Python](https://developers.google.com/protocol-buffers/docs/reference/python-generated) del sitio para desarrolladores Protocol Buffers.
