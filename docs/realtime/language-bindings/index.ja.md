# gtfs-realtime-bindings [![Join the MobilityData chat](https://img.shields.io/badge/chat-on%20slack-red)](https://bit.ly/mobilitydata-slack)

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime)プロトコルバッファ仕様から生成された言語バインディングです。

## はじめに

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime)は、公共交通機関の情報をリアルタイムに伝えるためのデータフォーマットです。GTFS Realtime データは[Protocol Buffers](https://developers.google.com/protocol-buffers/)使ってエンコード、デコードされ、高速で効率的に処理するためにコンパクトなバイナリ表現になっています。 データスキーマは、[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)で定義されています。

GTFS Realtime データを扱うには、`gtfs-realtime.proto`スキーマを使い、好きなプログラミング言語でクラスを生成するのが一般的でしょう。 これらのクラスは、GTFS-realtime データモデルオブジェクトを構築し、バイナリデータとしてシリアライズしたり、逆にバイナリデータをデータモデルオブジェクトにパースするために使用されます。

GTFS Realtime データモデルクラスを生成するために the `gtfs-realtime.proto`スキーマは一般的なタスクですが、初めての開発者は混乱することもあるので、このプロジェクトでは、最も人気のあるプログラミング言語である GTFS Realtime の言語バインディングをあらかじめ生成して提供することを目標としています。 可能であれば、これらの言語バインディングは、他のプロジェクトで使用しやすいようにパッケージとして公開される予定です。

## サポートされている言語 

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~ *（2019年*初頭現在、非推奨）
* ~~[PHP](php.md)~~ *(2019年初頭現在非推奨)*

## その他の言語

C++の生成コードは提供していませんので、公式のprotocコンパイラーを使用してください（[こちら](https://developers.google.com/protocol-buffers/docs/downloads)または[こちらから](https://github.com/google/protobuf)）。

あなたの好きな言語はありますか？貢献することを検討してください。

1. [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md)をお読みください。
2. あなたの好きな言語で pull request を開いてください。アップデートの手順（理想的にはスクリプト）を含めてください。また、その言語のエコシステムに適したパッケージングを提供してください。

## プロジェクト履歴

このプロジェクトはもともとGoogleによって作られました - MobilityDataは2019年初頭にプロジェクトのメンテナンスを開始しました。

古いバージョンのバインディングライブラリは、現在もGoogleの名前で公開されています。 Googleが公開している最後のバージョンは、[こちらの](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version)各言語のドキュメントをご覧ください。
