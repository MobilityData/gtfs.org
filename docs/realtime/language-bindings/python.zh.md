# Python GTFS-realtime 语言绑定

[![PyPI版本](https://badge.fury.io/py/gtfs-realtime-bindings.svg)](http://badge.fury.io/py/gtfs-realtime-bindings)

提供从[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer规范生成的Python类。 这些类允许你将二进制的ProtocolBuffer GTFS-realtime数据源解析成Python对象。

## 添加依赖关系

要在你自己的项目中使用`gtfs-realtime-bindings`类，你需要首先从[PyPI仓库](https://pypi.python.org/pypi/gtfs-realtime-bindings)中安装该模块。

    # Using easy_install
    easy_install --upgrade gtfs-realtime-bindings

    # Using pip
    pip install --upgrade gtfs-realtime-bindings

## 示例代码

下面的代码片段演示了从一个特定的URL下载GTFS-realtime数据源，将其解析为FeedMessage（GTFS-realtime模式的根类型），并对结果进行迭代。

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

关于从[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的Python类的命名规则的更多细节，请查看协议缓冲区开发者网站的[Python生成的代码部分](https://developers.google.com/protocol-buffers/docs/reference/python-generated)。
