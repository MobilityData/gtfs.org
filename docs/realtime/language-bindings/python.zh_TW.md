# Python GTFS-realtime 語言綁定

[![版本](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

提供從[GTFS 實時](https://github.com/google/transit/tree/master/gtfs-realtime)ProtocolBuffer 規範生成的 Python 類。這些類將允許您將二進制 ProtocolBuffer GTFS 實時數據饋送解析為 Python 對象。

## 添加依賴項

要在您自己的項目中使用`gtfs-realtime-bindings`類，您需要先從[PyPI 存儲庫](https://pypi.python.org/pypi/gtfs-realtime-bindings)安裝該模塊。

    # Using easy_install
    easy_install --upgrade gtfs-realtime-bindings

    # Using pip
    pip install --upgrade gtfs-realtime-bindings

## 示例代碼

以下代碼片段演示了從特定 URL 下載 GTFS 實時數據提要，將其解析為 FeedMessage（GTFS 實時架構的根類型），並迭代結果。

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

有關從[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的 Python 類的命名約定的更多詳細信息，請查看 Protocol Buffers 開發人員站點的[Python 生成代碼](https://developers.google.com/protocol-buffers/docs/reference/python-generated)部分。
