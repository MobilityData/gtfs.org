# Liaisons de langage Python GTFS-realtime 
 
 [![Version PyPI](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings) 
 
 Fournit des classes Python générées à partir du protocole 
 [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Buffer spécification. Ces classes vous permettront d’analyser un flux de données binaires en temps réel Protocol Buffer GTFS dans des objets Python. 
 
## Ajouter la dépendance 
 
 Pour utiliser les classes `gtfs-realtime-bindings` dans votre propre projet, vous devez d’abord installer le module à partir du [répertoire PyPI](https://pypi.python.org/pypi/gtfs-realtime-bindings). 
 
```
# Using easy_install
easy_install --upgrade gtfs-realtime-bindings

# Using pip
pip install --upgrade gtfs-realtime-bindings
```

## Exemple de code 
 
 L’extrait de code suivant montre le téléchargement d’un flux de données GTFS en temps réel à partir d’une URL particulière, son analyse en tant que FeedMessage (le type racine du schéma GTFS en temps réel) et son itération les résultats. 
 
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
 
 Pour plus de détails sur les conventions de dénomination des classes Python générées à partir du [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consultez le [Code généré par Python](https://developers.google.com/protocol-buffers/docs/reference/python-generated) section du site des développeur·euse de Protocol Buffers. 
