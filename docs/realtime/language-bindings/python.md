<a href="https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/python/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.71 7.04c.39-.39.39-1.04 0-1.41l-2.34-2.34c-.37-.39-1.02-.39-1.41 0l-1.84 1.83 3.75 3.75M3 17.25V21h3.75L17.81 9.93l-3.75-3.75L3 17.25Z"></path></svg>
  </a>
  
# Python GTFS-realtime Language Bindings

[![PyPI version](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](https://badge.fury.io/py/gtfs-realtime-bindings)

Provides Python classes generated from the
[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol
Buffer specification.  These classes will allow you to parse a binary Protocol
Buffer GTFS-realtime data feed into Python objects.

## Add the Dependency

To use the `gtfs-realtime-bindings` classes in your own project, you need to
first install the module from the
[PyPI repository](https://pypi.python.org/pypi/gtfs-realtime-bindings).

```
# Using easy_install
easy_install --upgrade gtfs-realtime-bindings

# Using pip
pip install --upgrade gtfs-realtime-bindings
```

## Example Code

The following code snippet demonstrates downloading a GTFS-realtime data feed
from a particular URL, parsing it as a FeedMessage (the root type of the
GTFS-realtime schema), and iterating over the results.

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

For more details on the naming conventions for the Python classes generated
from the
[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto),
check out the
[Python Generated Code](https://developers.google.com/protocol-buffers/docs/reference/python-generated)
section of the Protocol Buffers developer site.
