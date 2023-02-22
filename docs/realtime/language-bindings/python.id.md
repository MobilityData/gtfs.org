# Binding Bahasa Python GTFS-realtime

[![versi PyPI](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

Menyediakan class Python yang dihasilkan dari [spesifikasi GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer. Kelas-kelas ini akan memungkinkan Anda mengurai feed data GTFS-realtime biner ProtocolBuffer ke dalam objek Python.

## Tambahkan Ketergantungan

Untuk menggunakan kelas `gtfs-realtime-bindings` di proyek Anda sendiri, Anda harus menginstal modul dari [repositori PyPI terlebih dahulu](https://pypi.python.org/pypi/gtfs-realtime-bindings) .

    # Using easy_install
    easy_install --upgrade gtfs-realtime-bindings

    # Using pip
    pip install --upgrade gtfs-realtime-bindings

## Kode Contoh

Cuplikan kode berikut menunjukkan pengunduhan umpan data GTFS-realtime dari URL tertentu, menguraikannya sebagai FeedMessage (jenis root dari skema GTFS-realtime), dan mengulangi hasilnya.

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

Untuk detail selengkapnya tentang konvensi penamaan kelas Python yang dihasilkan dari [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) , lihat bagian [Kode yang Dihasilkan Python](https://developers.google.com/protocol-buffers/docs/reference/python-generated) di situs developer Protocol Buffers.
