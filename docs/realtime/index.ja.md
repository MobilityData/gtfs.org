---
search:
  exclude: true
---

# GTFS リアルタイム概要

<div class="landing-page">
   <a class="button" href="reference">参考資料</a>
   <a class="button" href="best-practices">ベストプラクティス</a>
   <a class="button" href="feed-examples">事例紹介</a>
   <a class="button" href="changes">変更点</a>
</div>

## はじめに

交通機関に関するリアルタイムの情報を利用者に提供することで、乗換案内サービスの利便性を向上させることができます。 利用者は、最新の発着時刻を参考にして、移動計画をよりスムーズに立てることができます。 万一、遅延が発生した場合でも、出かける時刻を遅らせるなどして対応できます。

GTFS リアルタイムは、公共交通機関が運行車両に関するリアルタイムの最新情報をアプリケーション開発者に提供できるようにするためのフィードの仕様です。

この仕様は、公共交通機関の時刻表や地理的情報に使用されるオープンなデータ形式である [GTFS](../schedule/reference)（General Transit Feed Specification）の拡張版です。 GTFS リアルタイムは、実装のしやすさ、GTFS との相互運用性、乗客情報に重点を置いて設計されています

この仕様は、当初 [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates) の提携交通機関や多くの乗換案内デベロッパーと Google との間で協力して行われました。 現在は、[Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0.html) の下で公開されています。

## 利用方法

1. 以下の概要をお読みください。
2. 提供する[フィードエンティティ](feed-entities)を決定します。
3. [フィードの例](feed-examples)に目を通します
4. [リファレンス](reference)を参考にして独自のフィードを作成します。
5. [フィード](best-practices/#feed-publishing-general-practices)を公開します。

## GTFS リアルタイム フィードの概要

この仕様では現在、以下の種類の情報をサポートしています。

*   ルート更新情報 - 遅延、中止、ルートの変更
*   運行情報 - 停車地の変更や、駅、ルート、またはネットワーク全体に影響する不測の事態
*   車両位置 - 位置と混雑度を含む車両に関する情報

フィードは異なるタイプのエンティティを組み合わせることもできますが、必須ではありません。 フィードは HTTP 経由で提供され、更新頻度は高いものとなります。ファイル自体は通常のバイナリ ファイルなので、どの種類のウェブサーバーでもファイルのホストと配信することができます（他の転送プロトコルも使用できます）。 また、Web アプリケーション サーバーを使用した場合は、有効な HTTP GET リクエストに対するレスポンスとしてフィードを返すこともできます。 フィードの更新頻度や取得方法については、特に制約はありません。

GTFS リアルタイムは、車両の「現在の」状態を表示することができるため、フィードは定期的に更新する必要があります。 できれば自動車両位置特定システムから新しいデータが受信されるたびに更新されることが望ましいです。

[フィードエンティティについて](feed-entities)

## データ形式

GTFS リアルタイムのデータ交換形式は[プロトコルバッファ](https://developers.google.com/protocol-buffers/)をベースにしています。

プロトコル バッファは、構造化されたデータをシリアル化するための、言語とプラットフォームに中立なメカニズムです（XML を想像してみてください。より小さく、高速でシンプルです）。データ構造は [gtfs-realtime.proto](proto) ファイルで定義され、このファイルを基にソースコードが生成され、Java、C++、Python などの各種言語を使って様々なデータ ストリームから構造化データを容易に読み書きすることができます。

[プロトコルバッファの詳細](https://developers.google.com/protocol-buffers/)

## データ構造

要素の階層と各要素のタイプの定義は、[gtfs-realtime.proto](proto) ファイルで指定します。

このテキスト ファイルは、選択したプログラミング言語で必要なライブラリを生成するために使用されます。これらのライブラリは、有効な GTFS リアルタイム フィードを生成するために必要なクラスや関数を提供します。 ライブラリを利用することで、フィードの作成が簡単になるだけでなく、有効なフィードだけを確実に生成することができます。

[データ構造に関する詳細をご覧ください。](reference)

## 参考情報

GTFS リアルタイムに関するディスカッションに参加して、仕様に対する変更や追加を提案するには、[GTFS Realtime mailing list](https://groups.google.com/group/gtfs-realtime)に参加し、[google/transit GitHub リポジトリ](https://github.com/google/transit)の会話をフォローしてください。

## Google マップと Live Transit Updates

[Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates) は交通機関の運行状況をリアルタイムにユーザーに伝える Google マップの機能です。

Google マップにリアルタイムの交通情報を提供することに興味をお持ちの公共交通機関の方は、[Google 乗換案内パートナー ヘルプ](https://developers.google.com/transit/google-transit#LiveTransitUpdates)をご覧ください。
