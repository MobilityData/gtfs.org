# Python GTFS-realtime言語バインディング

[![PyPIバージョン](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

GTFS-realtimeのProtocolBuffer仕様から生成されたPythonクラスを提供します。 これらのクラスにより、バイナリ ProtocolBuffer GTFS-realtime データフィードを Python オブジェクトにパースすることができます。

## 依存関係の追加

`gtfs-realtime-bindings`クラスを自分のプロジェクトで使用するためには、まずPyPI[リポジトリから](https://pypi.python.org/pypi/gtfs-realtime-bindings)モジュールをインストールする必要があります。

    # Using easy_install
    easy_install --upgrade gtfs-realtime-bindings

    # Using pip
    pip install --upgrade gtfs-realtime-bindings

## コード例

次のコードでは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをFeedMessage（GTFS-realtimeスキーマのルートタイプ）として解析し、結果を反復処理する様子を示しています。

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

gtfs-realtime[.protから](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成されるPythonクラスの命名規則の詳細については、Protocol Buffers開発者サイトのPython[Generated Codesセクションを](https://developers.google.com/protocol-buffers/docs/reference/python-generated)参照してください。
