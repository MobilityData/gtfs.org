# Python GTFS-realtime 言語バインディング {: #python-gtfs-realtime-language-bindings}


[![PyPI version](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol Buffer 仕様から生成された Python クラスを提供します。これらのクラスを使用することで、バイナリ形式の Protocol Buffer GTFS-realtime データフィードを Python オブジェクトに変換して解析することができます。

## 依存関係の追加 {: #add-the-dependency}

自分のプロジェクトで `gtfs-realtime-bindings` クラスを使用するには、まず [PyPI リポジトリ](https://pypi.python.org/pypi/gtfs-realtime-bindings) からモジュールをインストールする必要があります。

```
# easy_install を使用する場合
easy_install --upgrade gtfs-realtime-bindings

# pip を使用する場合
pip install --upgrade gtfs-realtime-bindings
```

## コード例 {: #example-code}

以下のコードスニペットは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをFeedMessage（GTFS-realtimeスキーマのルート型）としてパースし、結果を反復処理する方法を示しています。

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

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成されたPythonクラスの命名規則についての詳細は、Protocol Buffers開発者サイトの [Python Generated Code](https://developers.google.com/protocol-buffers/docs/reference/python-generated) セクションを参照してください。
