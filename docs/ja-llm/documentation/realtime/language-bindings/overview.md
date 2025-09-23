# GTFS Realtime バインディング {: #gtfs-realtime-bindings}

## はじめに {: #introduction}

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) は、公共交通システムに関するリアルタイム情報を伝達するためのデータフォーマットです。GTFS Realtime データは、[Protocol Buffers](https://developers.google.com/protocol-buffers/) を用いてエンコードおよびデコードされます。Protocol Buffers は、高速かつ効率的な処理のために設計されたコンパクトなバイナリ表現です。データスキーマ自体は [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) で定義されています。

GTFS Realtime データを扱うために、開発者は通常、`gtfs-realtime.proto` スキーマを使用して、任意のプログラミング言語でクラスを生成します。これらのクラスは、GTFS Realtime のデータモデルオブジェクトを構築し、それをバイナリデータとしてシリアライズするため、または逆にバイナリデータをデータモデルオブジェクトにパースするために使用することができます。

`gtfs-realtime.proto` スキーマから GTFS Realtime データモデルクラスを生成する作業は非常に一般的ですが、初めての開発者にとっては混乱を招くこともあります。そのため、このプロジェクトは、最も人気のあるプログラミング言語のいくつかに対して、あらかじめ生成された GTFS Realtime 言語バインディングを提供することを目的としています。可能な場合には、これらの言語バインディングをパッケージとして公開し、他のプロジェクトでの利用を容易にします。

## サポートされている言語 {: #supported-languages}


* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~ *(2019年初頭より非推奨)*
* ~~[PHP](php.md)~~ *(2019年初頭より非推奨)*

## 他の言語 {: #other-languages}

C++ 用の生成コードは提供していません。公式の protoc コンパイラを使用してください（[こちら](https://developers.google.com/protocol-buffers/docs/downloads) または [こちら](https://github.com/google/protobuf) から入手可能です）。

お好みの言語が見つかりませんか？貢献をご検討ください：

1. [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md) をお読みください。  
2. ご希望の言語でプルリクエストを作成してください。更新手順（理想的にはスクリプト）を含めてください。また、その言語のエコシステムに適したパッケージングも提供してください。

## プロジェクトの歴史 {: #project-history}

このプロジェクトはもともと Google によって作成され、2019年初頭から MobilityData がプロジェクトの保守を開始しました。  

古いバージョンのバインディングライブラリは、依然として Google の名前で公開されています。Google によって公開された最後のバージョンを確認するには、各言語のドキュメントを[こちら](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version)で参照してください。
