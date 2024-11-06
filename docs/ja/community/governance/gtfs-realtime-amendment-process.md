# GTFS realtime

GTFSGTFS realtime仕様は固定されたものではありません。GTFSGTFS realtimeを使用する交通事業者、開発者、その他の関係者のコミュニティによって開発および保守されているオープン仕様です。GTFSGTFS realtimeデータのプロデューサーとコンシューマーのこのコミュニティは、新しい機能を有効にするために仕様を拡張するための提案をすることが期待されています。そのプロセスを管理できるように、次の手順とガイドラインが確立されています。

!!! 注 ""

  公式仕様、リファレンス、ドキュメントは英語で書かれています。別の言語への翻訳が英語のオリジナルと異なる場合は、後者が優先されます。すべてのコミュニケーションは英語で行われます。

# GTFS realtimeへの新しいフィールドの追加 

プロデューサーまたはコンシューマーがGTFS realtime仕様に新しいフィールドを追加することに関心がある場合は、[GTFS realtimeGitHub リポジトリ](https://github.com/google/transit) で提案フィールドを説明する新しい問題をするべきである、[GTFS realtimeメーリング リスト](https://groups.google.com/forum/#!forum/gtfs-realtime) でこの新しいフィールド (問題へのリンクを含む) を発表する必要があります。

## 実験的フィールド
1.コミュニティが (a) 提案フィールドが有用であると思われること、および (b) フィールドのタイプ (`optional`と`repeated`、 `string`と`int`と`bool`) について合意に達した場合、 GTFS realtimemessageにフィールド番号が割り当てられ、[.proto file](../../../documentation/realtime/proto/) と、これが将来変更されるしてもよい*試験的* フィールドであることを示すドキュメントが必要です。
      - 合意は、以下の [仕様修正プロセス](#specification-amendment-process) と同じ議論と投票プロセスを通じて達成されますが、承認には全員一致の同意ではなく、80% の賛成票のみが必須です。
      - 新しい *試験的* フィールドの使用を希望するGTFS realtimeプロデューサーとコンシューマーは、新しいフィールドを含む .proto ファイルを使用してライブラリを再生成し (たとえば、Google は [gtfs-realtime-bindings ライブラリ](https://github.com/google/gtfs-realtime-bindings) を更新します)、ライブ データを使用してフィールドに入力および解析を開始します。
      - *試験的* フィールドが価値があり、プロデューサーとコンシューマーの両方がフィールドを使用していることを確認したら、以下の [仕様修正プロセス](#specification-amendment-process) に従います。 
      - *実験的* フィールドが、*実験的* フィールドとして承認されてから 2 年以内に [仕様修正プロセス](#specification-amendment-process) で採用されない場合は、[.proto ファイル](../../../documentation/realtime/proto/) ファイル内のフィールド値の横に`[deprecated=true]`を追加して非推奨になります`[deprecated=true]` ( `RESERVED`ではなく) を使用することで、すでにフィールドを採用しているプロデューサーとコンシューマーは、フィールドを使用から削除する必要がなくなります。さらに、フィールドは、 [仕様修正プロセス](#specification-amendment-process) 後の後続の投票で承認された場合 (追加のプロデューサーやコンシューマーがフィールドの使用を開始した場合など)、将来的に`非推奨ではなくなる`可能性があります。
 
 1.新しいフィールドが単一のプロデューサーに固有であると見なされる場合、またはデータ タイプに関して紛争がある場合は、プロデューサーに [カスタム拡張機能](#extensions) を割り当てて、プロデューサーが独自のフィードでフィールドを使用できるようにします。可能であれば、拡張機能を避け、多くの事業者に役立つフィールドをメイン仕様に追加して、断片化を回避し、コンシューマーが仕様のさまざまな拡張機能をサポートするための余分な作業を回避するべきである。

## 仕様修正プロセス
1. プロトコル定義、仕様、ドキュメント ファイル (翻訳を除く) の関連部分をすべて更新した git ブランチを作成します。
1. https://github.com/google/transit でpull requestを作成します。pull requestには、パッチの詳細な説明を含めるしなければならない。pull requestの作成者が _提唱者_ になります。
1. pull requestが登録されると、提唱者は [GTFS realtimeメーリング リスト](https://groups.google.com/forum/#!forum/gtfs-realtime) でそれを発表するしなければならないがあります。発表されると、pull requestは提案と見なされます。
  - 提唱者は貢献者であるため、pull requestが承認される前に [貢献者ライセンス契約](https://github.com/google/transit/blob/master/CONTRIBUTING.md) に署名するしなければならない。
1. 提案について次に説明します。pull requestのコメントは、唯一のディスカッション フォーラムとして使用するするべきである。
  - ディスカッションは、アドボケートが必要と考える限り続きますが、少なくとも 7 暦日間は継続する必要がしなければならない。
  - アドボケートは、同意したコメントに基づいて、提案 (pull request) をタイムリーに更新する責任があります。
  - アドボケートは、いつでも提案を放棄したと主張できます。
1. アドボケートは、ディスカッションに必須最初の 7 日間の期間が経過した後であればいつでも、提案のバージョンに対する投票を呼びかけることができます。
  - 投票を呼びかける前に、少なくとも 1 人の GTFS リアルタイム プロデューサーと 1 人の GTFS リアルタイム コンシューマーが、提案された変更を実装するするべきである。 GTFS リアルタイムのプロデューサーは、一般向けの GTFS リアルタイム フィードに変更を組み込み、pull requestのコメント内にそのデータへのリンクを提供することが求められます。また、GTFS リアルタイムのコンシューマーは、pull requestのコメント内に、変更を重要な方法で利用しているアプリケーション (つまり、新しい機能または改善された機能をサポートしているアプリケーション) へのリンクを提供することがするべきである。
1. 投票は、暦日で 7 日間、スイスの営業日で 5 日間をカバーするのに十分な最短期間続きます。投票は 23:59:59 UTC に終了します。
  - 提唱者は、投票開始時に具体的な終了時刻を発表するするべきであるがあります。
  - 投票期間中は、提案に対する編集上の変更のみが許可されます (意味が変わらない限り、タイプミスや文言の変更はしてもよい)。
  - pull requestへのコメントの形式で、誰でも賛成/反対の投票を行うことができ、投票は投票期間の終了まで変更できます。投票者が投票を変更する場合は、元の投票コメントを更新して、投票を取り消し線で消して新しい投票を記入することを推奨。
  - 投票期間の開始前の投票は考慮されません。
  - 投票の開始と終了は、[GTFS realtimeメーリング リスト](https://groups.google.com/forum/#!forum/gtfs-realtime) で発表するしなければならない。
1. 提案は、少なくとも 3 票の賛成で全員一致の合意があれば承認されます。
  - 提案者の投票はカウントされません。投票合計 3 票に対して、賛成票は 2 票とカウントされしなければならない。たとえば、提案者 X がpull requestを作成して賛成票を投じ、ユーザー Y と Z が賛成票を投じた場合、賛成票の合計は 2 票とカウントされます。
  - 反対票は、根拠を示し、できれば実用的なフィードバックを提供する必要があります。
  - 投票が否決された場合、アドボケートは提案の作業を続行するか、提案を放棄するかを選択してもよいアドボケートのどちらの決定も、[GTFS realtimeメーリング リスト](https://groups.google.com/forum/#!forum/gtfs-realtime) で発表するしなければならない。
  - アドボケートが提案の作業を続行する場合は、いつでも新しい投票を呼びかけることができます。
1. 30 暦日間非アクティブのままになっているpull requestはすべてクローズされます。pull requestがクローズされると、対応する提案は放棄されたものとみなされます。アドボケートは、会話を継続または維持したい場合は、いつでもpull requestを再開してもよい。 
  - 提唱者は、公式仕様の一部としてではなく、[カスタム拡張機能](#extensions)として機能を実装することを選択してもよい。
1.提案が承認された場合:
  - Google は、pull requestの投票されたバージョンをマージし (貢献者が [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md) に署名している場合)、5 営業日以内にpull requestを実行することに尽力します。
  - Google は、[https://github.com/google/gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) リポジトリをタイムリーに更新することに尽力します。提案の結果である gtfs-realtime-bindings へのコミットでは、提案のpull requestを参照するするべきである。
  - 翻訳は、元のpull requestに含めしてはいけない。
  Google は、サポートされている言語に関連する翻訳を最終的に更新する責任がありますが、コミュニティからの純粋な翻訳のプル リクエストは歓迎されており、すべての編集コメントに対応次第受け入れられます。

## 基本原則
GTFS realtimeの当初のビジョンを維持するために、仕様を拡張する際に考慮すべき基本原則がいくつか確立されています。**フィードは、リアルタイムで効率的に生成および消費できる必要がするべきである。**リアルタイム情報は、効率的な処理を必要とする継続的かつ動的なデータ ストリームです。プロトコル バッファを仕様のベースとして選択したのは、開発者の使いやすさとデータ転送の効率性の点で適切なトレードオフを提供するためです。GTFS とは異なり、多くの事業者がGTFS realtimeフィードを手動で編集するとは考えられません。プロトコル バッファの選択は、ほとんどのGTFS realtimeフィードがプログラムによって生成および消費されるという結論を反映しています。**この仕様は乗客情報に関するものです。**以前の GTFS と同様に、 GTFS realtimeは主に乗客情報に関係しています。つまり、仕様には何よりもまず、乗客向けのツールを強化するのに役立つ情報が含まれてするべきである。交通事業者がシステム間で内部的に送信したい運用指向の情報が大量に存在する可能性がしてもよいます。GTFSGTFS realtimeはその目的を想定しておらず、より適切な運用指向のデータ標準が他にも存在する可能性があります。**仕様の変更は下位互換性を保つするべきである。**仕様に機能を追加するときは、既存のフィードを無効にするような変更は避けたいと考えています。既存のフィード パブリッシャーがフィードに機能を追加したいと思うようになるまで、余分な作業を発生させたくありません。また、可能な限り、既存のパーサーが新しいフィードの古い部分を引き続き読み取れるようにしたいと考えています。プロトコル バッファを拡張するための規則により、ある程度の後方互換性が強制されます。ただし、後方互換性が損なわれる可能性のある既存のフィールドの意味の変更は避けたいと考えています。**推測による機能は推奨されません。**新しい機能を追加すると、フィード作成と読み取りが複雑になります。そのため、有用であることがわかっている機能を追加するように注意する必要があります。理想的には、新しい機能を使用する実際の交通事業者のデータを生成し、それを読み取り、表示するソフトウェアを作成することで、提案はすべてテストされます。

## 拡張機能
プロデューサーがGTFS realtimeフィードにカスタム情報を追加できるようにするために、[プロトコル バッファの拡張機能](https://developers.google.com/protocol-buffers/docs/proto#extensions) を活用します。拡張機能を使用すると、プロトコル バッファ message 内に名前空間を定義できます。これにより、サードパーティの開発者は、元の proto 定義を変更することなく、追加のフィールドを定義できます。

可能な場合は拡張機能を避け、多くの事業者にとって有用なフィールドをメインの仕様に追加して、仕様の断片化と、仕様のさまざまな拡張機能をサポートするための消費者の余分な作業を回避するするべきであるがあります。拡張IDをリクエストする前に、プロデューサーは仕様にフィールドを追加することを提案するするべきである([GTFS realtimeへの新しいフィールドの追加](#adding-new-fields-to-gtfs-realtime)を参照)

9000～9999 の範囲内の拡張 ID は、GTFS-rt プロデューサーによるプライベート使用のために予約されています。これらの ID は、組織内で情報を伝達するためにのみ使用してください。この範囲の拡張は、パブリック フィードでは**使用しないでください**。

新しい拡張機能を作成するには、プロデューサーに次に使用可能な拡張機能 ID を割り当てます。この ID は、1000 から始まり、以下の拡張機能レジストリ セクションに記載されている番号のリストから段階的に選択されます。

割り当てられた拡張 ID は、各 GTFS リアルタイム メッセージ定義の「拡張」名前空間で使用可能なタグ ID に対応します。開発者には拡張 ID が割り当てられたので、あらゆる GTFS リアルタイム メッセージを拡張するときにその ID を使用します。開発者が 1 つのメッセージのみを拡張する予定の場合でも、割り当てられた拡張 ID はすべてのメッセージ用に予約されます。

仕様を拡張する開発者にとって、拡張機能 ID を持つ「文字列」や「int32」などの単一のフィールドを追加する代わりに、「MyTripDescriptorExtension」などの新しいメッセージを定義し、基盤となる GTFS リアルタイム メッセージを新しいメッセージで拡張して、そこにすべての新しいフィールドを配置するモデルが推奨されます。このモデルには、マスター リストから新しい拡張機能 ID を予約する必要がなく、拡張機能メッセージ内のフィールドを自由に管理できるという優れた特性があります。

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

拡張機能を作成する場合、開発者は [プロトコル バッファ言語ガイド](https://developers.google.com/protocol-buffers/docs/proto) に従うするべきであるます。よくある間違いは、拡張フィールド番号を再利用することです。[フィールド番号の割り当てセクション](https://developers.google.com/protocol-buffers/docs/proto#assigning-field-numbers)で、言語ガイドは次のように説明しています:

> メッセージ定義の各フィールドには一意の番号があります。これらの番号は、メッセージのバイナリ形式でフィールドを識別するために使用され、メッセージ タイプが使用されると変更しないでください。

たとえば、最初の例では、`some_string` にフィールド番号 `1` が割り当てられています。開発者が `some_string` を使用しなくなった場合、または `some_string` が公式の GTFS Realtime 仕様で採用され、拡張機能が不要になった場合、開発者はフィールド番号 `1` を新しいフィールドに再利用することはできません。代わりに、開発者はフィールドを非推奨にして、新しいフィールドに新しい番号を使用する必要があります。
```
message MyTripDescriptorExtension {
  optional string some_string = 1 [deprecated=true];
  optional bool some_bool = 2;
  optional string some_new_string = 3;
  ...
}
```

## 拡張機能レジストリ

|拡張機能ID|開発者|連絡先|詳細|
|------------|---------|--------|-------|
|1000|OneBusAway|[onebusaway-developers](http://groups.google.com/group/onebusaway-developers)|https://github.com/OneBusAway/onebusaway/wiki/GTFS-Realtime-Resources|
|1001|ニューヨーク市 MTA|[mtadeveloperresources](http://groups.google.com/group/mtadeveloperresources)|http://mta.info/developers/|
|1002|Google|[transit-realtime-partner-support@google.com](mailto:transit-realtime-partner-support@google.com)|Google マップのライブ交通情報更新|
|1003|OVapi|gtfs-rt at ovapi.nl|http://gtfs.ovapi.nl|
|1004|Metra|[William Ashbaugh](mailto:wlashbaugh@gmail.com)|
|1005|メトロノース鉄道|[John Larsen](mailto:mnrappdev@mnr.org)|
|1006|realCity|[David Varga](mailto:transit@realcity.io)|http://realcity.io|
|1007|Transport for NSW|[timetable@transport.nsw.gov.au](mailto:timetable@transport.nsw.gov.au)|[グループディスカッション](https://groups.google.com/forum/#!msg/gtfs-realtime/WYwIs4Hd_E0/PbkMnELUAwAJ)|
|1008|SEPTA- 南東ペンシルバニア交通局|[Gregory Apessos](mailto:GApessos@septa.org)|https://github.com/septadev|
|1009|Swiftly|[mike@goswift.ly](mailto:mike@goswift.ly)|[グループディスカッション](https://groups.google.com/forum/#!msg/gtfs-realtime/mmnZV6L-2ls/wVWdknhLBwAJ)|
|1010|IBI グループ|[Ritesh Warade](mailto:transitrealtime@ibigroup.com)|[サービスアラートの新しいタイムスタンプに関する GitHub 提案](https://github.com/google/transit/pull/134)|
|1013|MITFAHR\|DE\|ZENTRALE (MFDZ)|[Holger Bruch](mailto:holger.bruch@mfdz.de)|[グループディスカッション](https://groups.google.com/g/gtfs-realtime/c/IxYh-beoNoo)|
|9000-9999|予約済み - 社内使用のみ|[GTFS コミュニティ](https://groups.google.com/forum/#!forum/gtfs-realtime)|[グループ ディスカッション](https://groups.google.com/g/gtfs-realtime/c/IxYh-beoNoo)|
