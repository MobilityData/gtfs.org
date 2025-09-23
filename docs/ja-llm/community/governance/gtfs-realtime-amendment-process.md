# GTFS Realtime {: #gtfs-realtime}


GTFS Realtime 仕様は固定されたものではありません。代わりに、GTFS Realtime を利用する交通事業者、開発者、その他の関係者のコミュニティによって開発・維持されているオープンな仕様です。この GTFS Realtime データの提供者および利用者のコミュニティは、新しい機能を可能にするために仕様拡張の提案を行うことが期待されています。そのプロセスを管理するために、以下の手順とガイドラインが定められています。

!!! note ""

	公式の仕様、リファレンスおよびドキュメントは英語で記述されています。翻訳が英語の原文と異なる場合は、英語の原文が優先されます。すべてのコミュニケーションは英語で行われます。

# GTFS Realtime への新しいフィールドの追加 {: #adding-new-fields-to-gtfs-realtime}

プロデューサーまたはコンシューマーが GTFS Realtime 仕様に新しいフィールドを追加したい場合は、[GTFS Realtime GitHub リポジトリ](https://github.com/google/transit) に新しい issue を作成し、提案するフィールドについて説明するとともに、この新しいフィールド（issue へのリンクを含む）を [GTFS Realtime メーリングリスト](https://groups.google.com/forum/#!forum/gtfs-realtime) で告知するべきです。

## *実験的* フィールド {: #experimental-fields}

1. コミュニティが (a) 提案されたフィールドが有用であると見なされ、かつ (b) フィールドの型（`optional` か `repeated`、`string` か `int` か `bool`）について合意に達した場合、GTFS Realtime メッセージ内でフィールド番号が割り当てられ、将来的に変更される可能性のある *実験的* フィールドである旨が [.proto file](../../../documentation/realtime/proto/) およびドキュメントに記載されます。  
      - 合意形成は、以下の [仕様改訂プロセス](#specification-amendment-process) と同じ議論および投票プロセスを通じて行われますが、全会一致ではなく 80% の賛成票で承認されます。  
      - 新しい *実験的* フィールドを使用したい GTFS Realtime のプロデューサーおよびコンシューマーは、新しいフィールドを含む .proto file を用いてライブラリを再生成し（例: Google は [gtfs-realtime-bindings library](https://github.com/google/gtfs-realtime-bindings) を更新します）、実際のデータでそのフィールドの入力および解析を開始します。  
      - *実験的* フィールドが有用であり、プロデューサーとコンシューマーの双方がそのフィールドを使用していると確認できた場合、以下の [仕様改訂プロセス](#specification-amendment-process) に従って、そのフィールドを正式に仕様に追加します。  
      - *実験的* フィールドが *実験的* フィールドとして承認されてから 2 年以内に [仕様改訂プロセス](#specification-amendment-process) を通じて採用されなかった場合、そのフィールドは [.proto file](../../../documentation/realtime/proto/) 内のフィールド値の横に `[deprecated=true]` を追加することで非推奨とされます。`RESERVED` ではなく `[deprecated=true]` を使用することで、すでにそのフィールドを採用しているプロデューサーやコンシューマーは使用を中止する必要がありません。さらに、将来的に追加のプロデューサーやコンシューマーがそのフィールドを使用し始めた場合など、後続の投票で承認されれば、そのフィールドは [仕様改訂プロセス](#specification-amendment-process) に従って「非推奨解除」される可能性があります。  

1. 新しいフィールドが特定の 1 つのプロデューサーに固有であると見なされる場合、またはデータ型について意見の相違がある場合、そのプロデューサーに [カスタム拡張](#extensions) を割り当て、そのプロデューサーが独自のフィード内でそのフィールドを使用できるようにします。可能な限り拡張は避け、多くの事業者にとって有用なフィールドをメイン仕様に追加することで、仕様の断片化やコンシューマーがさまざまな拡張をサポートするための余分な作業を避けるべきです。  

## 仕様改訂プロセス {: #specification-amendment-process}

1. プロトコル定義、仕様、ドキュメントファイルの関連部分すべてを更新した git ブランチを作成します（翻訳は除く）。
1. https://github.com/google/transit にプルリクエストを作成します。プルリクエストにはパッチの詳細な説明を含めなければなりません。プルリクエストの作成者は _提案者(advocate)_ となります。
1. プルリクエストが登録されたら、提案者は [GTFS Realtime メーリングリスト](https://groups.google.com/forum/#!forum/gtfs-realtime) でそれを告知しなければなりません。告知された時点で、そのプルリクエストは提案と見なされます。
  	- 提案者はコントリビューターであるため、プルリクエストが受け入れられる前に [Contributor License Agreement](https://github.com/google/transit/blob/master/CONTRIBUTING.md) に署名しなければなりません。
1. 提案の議論が行われます。プルリクエストのコメントが唯一の議論の場として使用されるべきです。
  	- 議論は提案者が必要と感じる限り続けることができますが、少なくとも7暦日間は行わなければなりません。
  	- 提案者は、同意したコメントに基づいて提案（すなわちプルリクエスト）を適時に更新する責任があります。
  	- 提案者はいつでも提案を放棄したと宣言することができます。
1. 提案者は、議論のために必要な最初の7日間が経過した後であれば、いつでも提案のあるバージョンについて投票を呼びかけることができます。
    - 投票を呼びかける前に、少なくとも1つの GTFS-realtime プロデューサーと1つの GTFS-realtime コンシューマーが提案された変更を実装している必要があります。GTFS-realtime プロデューサーは、その変更を公開されている GTFS-realtime フィードに含め、プルリクエストのコメント内にそのデータへのリンクを提供することが期待されます。また、GTFS-realtime コンシューマーは、その変更を非自明な方法で利用しているアプリケーションへのリンクをプルリクエストのコメントに提供することが期待されます（すなわち、新しい機能や改善された機能をサポートしていること）。
    - 投票を呼びかける際、提案者はその投票が仕様への公式採用を目的とするものか、実験的フィールドを目的とするものかを明確に述べるべきです。
1. 投票は、7暦日間と5営業日（スイス時間）を満たす最小期間続きます。投票は 23:59:59 UTC に終了します。
  	- 提案者は投票開始時に具体的な終了時刻を告知するべきです。
  	- 投票期間中は、提案に対して編集上の変更（誤字や表現の修正で意味が変わらないもの）のみが許可されます。
  	- 誰でもプルリクエストへのコメントの形で賛成/反対の投票を行うことができ、投票は投票期間終了まで変更可能です。投票を変更する場合は、元の投票コメントを更新し、元の投票を取り消し線で消して新しい投票を記載することが推奨されます。
  	- 投票期間開始前の投票は考慮されません。
    - 投票の開始と終了は [GTFS Realtime メーリングリスト](https://groups.google.com/forum/#!forum/gtfs-realtime) で告知しなければなりません。
1. 提案は、少なくとも3票の全会一致の賛成があれば承認されます。
  	- 提案者の投票は3票の合計には含まれません。例えば、提案者Xがプルリクエストを作成して賛成票を投じ、ユーザーYとZが賛成票を投じた場合、合計は2票と数えられます。
  	- 反対票は理由を述べなければならず、理想的には実行可能なフィードバックを提供するべきです。
  	- 投票が否決された場合、提案者は提案の作業を続けるか、提案を放棄するかを選択できます。いずれの決定も [GTFS Realtime メーリングリスト](https://groups.google.com/forum/#!forum/gtfs-realtime) で告知しなければなりません。
  	- 提案者が作業を続ける場合は、いつでも新しい投票を呼びかけることができます。
1. 30暦日間活動がないプルリクエストはクローズされます。プルリクエストがクローズされた場合、対応する提案は放棄されたと見なされます。提案者は、会話を続けたい場合や維持したい場合、いつでもプルリクエストを再オープンすることができます。 
 	- 提案者は、その機能を公式仕様の一部ではなく [カスタム拡張](#extensions) として実装することを選択する場合があることに注意してください。
1. 提案が承認された場合:
  	- Google は、投票で承認されたプルリクエストのバージョンを（コントリビューターが [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md) に署名していることを条件に）マージし、5営業日以内にプルリクエストを実行することを約束します。
  	- Google は、[https://github.com/google/gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) リポジトリを適時に更新することを約束します。提案の結果として行われる gtfs-realtime-bindings へのコミットは、その提案のプルリクエストを参照しなければなりません。
  	- 翻訳は元のプルリクエストに含めてはいけません。
    Google は、最終的にサポートされている言語への関連翻訳を更新する責任を負いますが、コミュニティからの純粋な翻訳プルリクエストは歓迎され、すべての編集上のコメントが解決され次第、受け入れられます。

## 指針原則 {: #guiding-principles}

GTFS Realtime の当初のビジョンを維持するために、仕様を拡張する際に考慮すべきいくつかの指針原則が定められています。

**フィードはリアルタイムで効率的に生成・消費できるべきです。**

リアルタイム情報は連続的で動的なデータストリームであり、効率的な処理が必然的に求められます。私たちは仕様の基盤として Protocol Buffers を選択しました。これは、開発者にとっての使いやすさとデータ伝送の効率性のバランスが良いためです。GTFS とは異なり、多くの事業者が GTFS Realtime フィードを手作業で編集することは想定していません。Protocol Buffers を選択したのは、ほとんどの GTFS Realtime フィードがプログラムによって生成・消費されるという結論に基づいています。

**仕様は乗客向け情報に関するものです。**

従来の GTFS と同様に、GTFS Realtime は主に乗客向け情報を対象としています。つまり、この仕様には、まず第一に乗客向けツールを支援できる情報が含まれるべきです。交通事業者がシステム間で内部的に伝達したい運用指向の情報は大量に存在する可能性がありますが、GTFS Realtime はその目的のためのものではなく、他により適切な運用指向のデータ標準が存在する可能性があります。

**仕様の変更は後方互換性を維持するべきです。**

仕様に新しい機能を追加する際には、既存のフィードを無効にしてしまうような変更は避けたいと考えています。既存のフィード発行者が新しい機能を追加したいと思うまで、余計な作業を増やしたくありません。また、可能な限り、既存のパーサーが新しいフィードの古い部分を引き続き読み取れるようにしたいと考えています。Protocol Buffers の拡張規約は、ある程度の後方互換性を保証します。しかし、既存のフィールドに対する意味的な変更によって後方互換性が損なわれることは避けたいと考えています。

**推測的な機能追加は推奨されません。**

新しい機能を追加するたびに、フィードの生成と読み取りの複雑さが増します。そのため、本当に有用であると分かっている機能のみを追加するよう注意を払う必要があります。理想的には、提案された機能は、実際の交通システム向けにデータを生成し、そのデータを読み取り表示するソフトウェアを作成することでテストされているべきです。

## 拡張機能 {: #extensions}

GTFS Realtime フィードにカスタム情報を追加できるようにするために、[Protocol Buffers の拡張機能](https://developers.google.com/protocol-buffers/docs/proto#extensions)を利用します。拡張機能を使用すると、Protocol Buffer メッセージ内に名前空間を定義でき、サードパーティの開発者が元の proto 定義を変更することなく追加のフィールドを定義することができます。

可能な限り拡張機能は避け、多くの事業者にとって有用なフィールドはメイン仕様に追加するべきです。これにより、仕様の断片化や、利用者がさまざまな拡張機能をサポートするための余分な作業を避けることができます。拡張 ID を要求する前に、事業者はそのフィールドを仕様に追加する提案を行うべきです（[GTFS Realtime に新しいフィールドを追加する](#adding-new-fields-to-gtfs-realtime)を参照してください）。

9000〜9999 の範囲の拡張 ID は、GTFS-rt 事業者による私的利用のために予約されています。これらの ID は、組織内部で情報を伝達するためにのみ使用するべきです。この範囲の拡張機能は **公開フィードで使用してはいけません**。  

新しい拡張機能を作成する際には、事業者に次に利用可能な拡張 ID を割り当てます。この ID は 1000 から始まる番号リストから順に選ばれ、以下の拡張レジストリのセクションに記録されます。

割り当てられた拡張 ID は、各 GTFS Realtime メッセージ定義の「extension」名前空間で利用可能なタグ ID に対応します。開発者が拡張 ID を割り当てられると、その ID を使用してすべての GTFS Realtime メッセージを拡張します。開発者が 1 つのメッセージのみを拡張する予定であっても、その拡張 ID は **すべてのメッセージ**に対して予約されます。

仕様を拡張する開発者は、拡張 ID に単一のフィールド（例: "string" や "int32"）を追加するのではなく、新しいメッセージ（例: "MyTripDescriptorExtension"）を定義し、その新しいメッセージで GTFS Realtime メッセージを拡張し、すべての新しいフィールドをその中にまとめることが推奨されます。これにより、拡張メッセージ内のフィールドを自由に管理でき、マスターリストから新しい拡張 ID を予約する必要がなくなります。

```
message MyTripDescriptorExtension {
  optional string some_string = 1;
  optional bool some_bool = 2;
  ...
}
extend transit_realtime.TripDescriptor {
  optional MyTripDescriptorExtension my_trip_descriptor = YOUR_EXTENSION_ID;
}
```

拡張機能を作成する際には、開発者は [Protocol Buffers Language Guide](https://developers.google.com/protocol-buffers/docs/proto) に従うべきです。よくある間違いは、拡張フィールド番号を再利用してしまうことです。[Assigning Field Numbers のセクション](https://developers.google.com/protocol-buffers/docs/proto#assigning-field-numbers) では、Language Guide に次のように記載されています:

> メッセージ定義内の各フィールドには一意の番号があります。これらの番号はメッセージのバイナリ形式でフィールドを識別するために使用され、一度メッセージ型が使用され始めたら変更してはいけません。

例えば、最初の例では `some_string` にフィールド番号 `1` が割り当てられています。開発者が `some_string` を使用しなくなった場合、または `some_string` が公式の GTFS Realtime 仕様に採用されて拡張が不要になった場合でも、フィールド番号 `1` を新しいフィールドに再利用することはできません。その代わりに、開発者はそのフィールドを非推奨にし、新しいフィールドには新しい番号を使用するべきです:

```
message MyTripDescriptorExtension {
  optional string some_string = 1 [deprecated=true];
  optional bool some_bool = 2;
  optional string some_new_string = 3;
  ...
}
```

## 拡張レジストリ {: #extension-registry}


|拡張ID|開発者|連絡先|詳細|
|------------|---------|-------|-------|
|1000|OneBusAway|[onebusaway-developers](http://groups.google.com/group/onebusaway-developers)|https://github.com/OneBusAway/onebusaway/wiki/GTFS-Realtime-Resources|
|1001|New York City MTA|[mtadeveloperresources](http://groups.google.com/group/mtadeveloperresources)|http://mta.info/developers/|
|1002|Google|[transit-realtime-partner-support@google.com](mailto:transit-realtime-partner-support@google.com)|Google Maps Live Transit Updates|
|1003|OVapi|gtfs-rt at ovapi.nl|http://gtfs.ovapi.nl|
|1004|Metra|[William Ashbaugh <w.l.ashbaugh@gmail.com>](mailto:w.l.ashbaugh@gmail.com)|
|1005|Metro-North Railroad|[John Larsen](mailto:mnrappdev@mnr.org)|
|1006|realCity|[David Varga](mailto:transit@realcity.io)|http://realcity.io|
|1007|Transport for NSW|[timetable@transport.nsw.gov.au](mailto:timetable@transport.nsw.gov.au)|[グループディスカッション](https://groups.google.com/forum/#!msg/gtfs-realtime/WYwIs4Hd_E0/PbkMnELUAwAJ)|
|1008|SEPTA - Southeastern Pennsylvania Transportation Authority|[Gregory Apessos](mailto:GApessos@septa.org)|https://github.com/septadev|
|1009|Swiftly|[mike@goswift.ly](mailto:mike@goswift.ly)|[グループディスカッション](https://groups.google.com/forum/#!msg/gtfs-realtime/mmnZV6L-2ls/wVWdknhLBwAJ)|
|1010|IBI Group|[Ritesh Warade](mailto:transitrealtime@ibigroup.com)|[Service Alerts における新しいタイムスタンプの GitHub 提案](https://github.com/google/transit/pull/134)|
|1013|MITFAHR\|DE\|ZENTRALE (MFDZ)|[Holger Bruch](mailto:holger.bruch@mfdz.de)|[グループディスカッション](https://groups.google.com/g/gtfs-realtime/c/IxYh-beoNoo)|
|9000-9999|予約済み - 内部使用のみ|[GTFS Community](https://groups.google.com/forum/#!forum/gtfs-realtime)|[グループディスカッション](https://groups.google.com/g/gtfs-realtime/c/IxYh-beoNoo)|
