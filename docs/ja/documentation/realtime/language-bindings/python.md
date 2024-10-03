# Python GTFS-realtime 言語バインディング

[![PyPI バージョン](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) プロトコル バッファ仕様から生成された Python クラスを提供します。これらのクラスを使用すると、バイナリ プロトコル バッファ GTFS-realtime データ フィードを Python オブジェクトに解析できます。

## 依存関係の追加

独自のプロジェクトで `gtfs-realtime-bindings` クラスを使用するには、まず [PyPI リポジトリ](https://pypi.python.org/pypi/gtfs-realtime-bindings) からモジュールをインストールする必要があります。

```
# Using easy_install
easy_install --upgrade gtfs-realtime-bindings

# Using pip
pip install --upgrade gtfs-realtime-bindings
```

## サンプル コード

次のコード スニペットは、特定の URL から GTFS リアルタイム データ フィードをダウンロードし、それをFeedMessage (GTFS リアルタイム スキーマのルート タイプ) として解析し、結果を反復処理する方法を示しています。

```python
from google.transit import gtfs_realtime_pb2
import requests

feed = gtfs_realtime_pb2.FeedMessage()
response = requests.get('GTFS-REALTIME ソースの URL をここに入力します')
feed.ParseFromString(response.content)
for entity in feed.entity:
  if entity.HasField('trip_update'):
    print(entity.trip_update)
```

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成される Python クラスの命名規則の詳細については、Protocol Buffers 開発者サイトの [Python 生成コード](https://developers.google.com/protocol-buffers/docs/reference/python-generated) セクションをご覧ください。