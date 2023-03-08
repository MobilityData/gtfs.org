# gtfs-realtime-bindings [![加入 MobilityData 聊天](https://img.shields.io/badge/chat-on%20slack-red)](https://bit.ly/mobilitydata-slack)

從適用於流行語言的[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) protocolbuffer 規範生成的語言綁定。

## 介紹

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime)是一種用於傳達有關公共交通系統的實時信息的數據格式。GTFS Realtime 數據使用[Protocol Buffers](https://developers.google.com/protocol-buffers/)進行編碼和解碼，ProtocolBuffers 是一種緊湊的二進製表示形式，專為快速高效的處理而設計。數據模式本身在[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)中定義。

要使用 GTFS Realtime數據，開發人員通常會使用`gtfs-realtime.proto`模式以他們選擇的編程語言生成類。然後，這些類可用於構建 GTFS Realtime 數據模型對象並將它們序列化為二進制數據，或者以反向方式將二進制數據解析為數據模型對象。

因為從`gtfs-realtime.proto`模式生成 GTFS-realtime數據模型類是一項很常見的任務，但有時也會讓新手開發者感到困惑，這個項目旨在為許多最常用的工具提供預生成的 GTFS Realtime語言綁定。流行的編程語言。在可能的情況下，這些語言綁定將作為包發布，以促進它們在其他項目中的使用。

## 支持的語言

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~*（自 2019 年初棄用）*
* ~~[PHP](php.md)~~ *（自 2019 年初棄用）*

## 其他語言

我們不提供為 C++ 生成的代碼，為此使用官方協議編譯器（從[這里](https://developers.google.com/protocol-buffers/docs/downloads)或[這裡](https://github.com/google/protobuf)）

我們缺少您最喜歡的語言嗎？考慮貢獻：

1. 閱讀[CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md) 。
2. 使用您選擇的語言打開拉取請求。請包括更新說明（最好是腳本）。此外，提供適合語言生態系統的包裝。

## 項目歷史

該項目最初由Google創建 - MobilityData 於 2019 年初開始維護該項目。

舊版本的綁定庫仍然以 Google 的名義發布。請在[此處](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version)查看每種語言的文檔以查找 Google 發布的最新版本。
