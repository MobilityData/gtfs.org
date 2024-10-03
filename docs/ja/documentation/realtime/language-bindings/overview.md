# GTFS Realtime Bindings

## はじめに

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) は、公共交通機関に関するリアルタイム情報を伝達するためのデータ形式です。GTFS Realtime データは、[プロトコル バッファ](https://developers.google.com/protocol-buffers/) を使用してエンコードおよびデコードされます。これは、高速かつ効率的な処理のために設計されたコンパクトなバイナリ表現です。データ スキーマ自体は、[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) で定義されています。

GTFS Realtime データを操作するには、開発者は通常、`gtfs-realtime.proto` スキーマを使用して、選択したプログラミング言語でクラスを生成します。これらのクラスは、GTFS-realtime データ モデル オブジェクトを構築してバイナリ データとしてシリアル化するために使用したり、逆にバイナリ データをデータ モデル オブジェクトに解析するために使用したりできます。

`gtfs-realtime.proto` スキーマから GTFS リアルタイム データ モデル クラスを生成することは非常に一般的なタスクですが、初心者の開発者にとっては混乱を招くこともあります。そのため、このプロジェクトでは、最も一般的なプログラミング言語のいくつかに対して、事前に生成された GTFS リアルタイム言語バインディングを提供することを目指しています。可能な場合は、これらの言語バインディングをパッケージとして公開し、他のプロジェクトでの使用を容易にします。

## サポートされている言語

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~ (2019年初頭に非推奨)
* ~~[PHP](php.md)~~ (2019年初頭に非推奨)

## その他の言語

C++ 用の生成コードは提供していません。そのためには公式の protoc コンパイラを使用してください ([こちら](https://developers.google.com/protocol-buffers/docs/downloads) または [こちら](https://github.com/google/protobuf))

お気に入りの言語が不足していませんか？貢献することを検討してください。

 1. [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md) をお読みください。
 2. 選択した言語でpull requestを開きます。更新手順 (できればスクリプト) を含めてください。また、言語エコシステムに適したパッケージングも提供してください。

## プロジェクト履歴

このプロジェクトはもともと Google によって作成されました。MobilityData は 2019 年初頭にプロジェクトの保守を開始しました。

バインディング ライブラリの古いバージョンは、引き続き Google の名前で公開されています。Google によって公開された最新バージョンを見つけるには、各言語のドキュメントを [こちら](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) で参照してください。
