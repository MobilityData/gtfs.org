# Языковые привязки Python GTFS-realtime

[![Версия PyPI](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

Предоставляет классы Python, созданные на основе спецификации [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer. Эти классы позволят вам разобрать двоичный поток данных ProtocolBuffer GTFS-realtime в объекты Python.

## Добавьте зависимость

Чтобы использовать классы `gtfs-realtime-bindings` в своем проекте, необходимо сначала установить модуль из [репозиторияPyPI](https://pypi.python.org/pypi/gtfs-realtime-bindings).

    # Using easy_install
    easy_install --upgrade gtfs-realtime-bindings

    # Using pip
    pip install --upgrade gtfs-realtime-bindings

## Пример кода

Следующий фрагмент кода демонстрирует загрузку потока данных GTFS-realtime с определенного URL, его разбор как FeedMessage (корневой тип схемы GTFS-realtime) и итерацию результатов.

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

Для получения более подробной информации о соглашениях об именовании классов Python, сгенерированных из [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), обратитесь к [разделу Сгенерированный код Python](https://developers.google.com/protocol-buffers/docs/reference/python-generated) на сайте разработчика Protocol Buffers.
