# Python GTFS-Realtime Sprachbindungen

[![PyPI-Version](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

Stellt Python-Klassen zur Verfügung, die aus der GTFS-Realtime ProtocolBuffer-Spezifikation generiert wurden. Mit diesen Klassen können Sie einen binären ProtocolBuffer GTFS-Realtime Datenfeed in Python-Objekte parsen.

## Hinzufügen der Abhängigkeit

Um die `gtfs-realtime-bindings` Klassen in Ihrem eigenen Projekt zu verwenden, müssen Sie zunächst das Modul aus[demPyPI-Repository](https://pypi.python.org/pypi/gtfs-realtime-bindings) installieren.

    # Using easy_install
    easy_install --upgrade gtfs-realtime-bindings

    # Using pip
    pip install --upgrade gtfs-realtime-bindings

## Beispielcode

Der folgende Codeausschnitt veranschaulicht das Herunterladen eines GTFS-Realtime datenfeeds von einer bestimmten URL, das Parsen als FeedMessage (der Stammtyp desGTFS-Echtzeitschemas) und die Iteration der Ergebnisse.

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

Weitere Details zu den Namenskonventionen für die Python-Klassen, die aus dem [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) generiert werden, finden Sie im[Abschnitt Python Generated Codesection](https://developers.google.com/protocol-buffers/docs/reference/python-generated)auf der Protocol Buffers Developer Site.
