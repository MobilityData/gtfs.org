# Python GTFS-realtime Language Bindings

 [![Versión de PyPI](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings) 
 
 Proporciona clases de Python generadas a partir del 
 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocolo 
 Buffer especificación. Estas clases le permitirán analizar un protocolo binario 
 Buffer GTFS en tiempo real para introducir datos en objetos Python. 
 
## Agregar la dependencia 
 
 Para usar las clases `gtfs-realtime-bindings` en su propio proyecto, primero necesita 
 instalar el módulo desde el 
 [repositorio PyPI](https://pypi.python.org/pypi/gtfs-realtime-bindings). 
 
```
# Usando easy_install
easy_install --upgrade gtfs-realtime-bindings

# Usando pip
pip install --upgrade gtfs-realtime-bindings
```
## Código de ejemplo 
 
 El siguiente fragmento de código demuestra cómo descargar un feed de datos GTFS en tiempo real 
 desde una URL particular, analizarlo como un FeedMessage (el tipo raíz del 
 esquema GTFS en tiempo real) e iterarlo los resultados. 
 
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
 
 Para obtener más detalles sobre las convenciones de nomenclatura para las clases de Python generadas 
 a partir de 
 [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), 
 consulte el 
 [Código generado por Python](https://developers.google.com/protocol-buffers/docs/reference/python-generated) 
 sección del sitio para desarrolladores de Protocol Buffers. 
