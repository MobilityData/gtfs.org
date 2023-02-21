# gtfs-realtime-bindings [![Join the MobilityData chat](https://img.shields.io/badge/chat-on%20slack-red)](https://bit.ly/mobilitydata-slack)

从[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime)协议缓冲区规格生成的语言绑定，适用于流行语言。

## 简介

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime)是一种数据格式，用于交流有关公共交通系统的实时信息。GTFS Realtime数据使用[Protocol Buffers](https://developers.google.com/protocol-buffers/)进行编码和解码，这是一种紧凑的二进制表示法，旨在快速有效地处理。 数据模式本身是在[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)中定义的。

为了处理GTFS实时数据，开发人员通常会使用`gtfs-realtime.proto`模式，用他们选择的编程语言生成类。 然后，这些类可以用来构建GTFS-实时数据模型对象，并将其序列化为二进制数据，或者在相反的方向，将二进制数据解析为数据模型对象。

由于从`gtfs-realtime.proto`模式生成GTFS实时数据模型类是一项常见的任务，但有时也会给第一次开发的人带来困惑，因此本项目旨在为一些最流行的编程语言提供预先生成的GTFS实时语言绑定。 在可能的情况下，这些语言绑定将以包的形式发布，以方便它们在其他项目中使用。

## 支持的语言

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~ *（从2019年初起被废弃）*
* ~~[PHP](php.md)~~ *(从2019年初起已废弃)*

## 其他语言

我们不提供C++的生成代码，使用官方的protoc编译器（从[这里](https://developers.google.com/protocol-buffers/docs/downloads)或[这里](https://github.com/google/protobuf)）。

我们是否缺少你最喜欢的语言？请考虑做出贡献。

1. 阅读[CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md)。
2. 用你选择的语言打开一个拉动请求。请包括更新说明（最好是脚本）。同时，提供适合该语言生态系统的包装。

## 项目历史

该项目最初由谷歌创建 - MobilityData在2019年初开始维护该项目。

旧版本的绑定库仍然以谷歌的名义发布。 请看[这里](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version)的每种语言的文档，找到谷歌发布的最后版本。
