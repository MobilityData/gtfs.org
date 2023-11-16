---
search:
  exclude: true
---

# GTFS Realtime概要

<div class="landing-page">
   <a class="button" href="reference">参考資料</a>
   <a class="button" href="best-practices">ベストプラクティス</a>
   <a class="button" href="feed-examples">事例紹介</a>
   <a class="button" href="changes">変更点</a>
</div>

## はじめに

交通機関のデータをリアルタイムで提供することで、利用者の交通機関へのアクセスを向上させることができます。最新の発着時刻を提供することで、利用者はスムーズに移動の計画を立てることができます。その結果、不幸にも遅延が発生した場合、ライダーはもう少し家にいられると知って安心することでしょう。

GTFS Realtimeは、公共交通機関がアプリケーション開発者に車両情報をRealtime提供できるようにするためのフィード仕様です。 [GTFS](../schedule/reference) (General Transit Feed Specification) の拡張仕様で、公共交通機関の時刻表や関連する地理情報のオープンデータ形式です。GTFS Realtimeは、実装のしやすさ、GTFS相互運用性、乗客情報に重点を置いて設計されています。

この仕様は、[Live Transit Updatesの](https://developers.google.com/transit/google-transit#LiveTransitUpdates)最初のパートナー機関、多くの交通機関開発者、Googleとのパートナーシップにより設計されました。この仕様は、[Apache 2.0 Licenseの](https://www.apache.org/licenses/LICENSE-2.0.html)下で公開されています。

## どのように始めればいいですか？

1.  以下の概要をお読みください。
2.  提供する[フィードのエンティティを](feed-entities)決定します。
3.  [フィードの例を見て](feed-examples)みましょう。
4.  [リファレンスを](reference)使用して独自のフィードを作成します。
5.  [作成したフィードを公開](best-practices/#feed-publishing-general-practices)する

## GTFS Realtimeフィードの概要

この仕様では、現在、以下の種類の情報をサポートしています。

*   **トリップアップデート**- 遅延、キャンセル、ルート変更
*   **サービスアラート**- 停止、駅、ルート、ネットワーク全体に影響する不測の事態。
*   **車両位置**- 位置と混雑度を含む車両に関する情報

フィードは、異なるタイプのエンティティを組み合わせることができますが、必須ではありません。フィードはHTTPで提供され、頻繁に更新される。ファイル自体は通常のバイナリファイルなので、どのような種類のウェブサーバーでもファイルをホストして提供することができる（他の転送プロトコルも使用できるかもしれない）。また、Webアプリケーションサーバーを使用して、有効なHTTP GETリクエストに対する応答としてフィードを返すこともできます。フィードの更新頻度や取得方法については、特に制約はありません。

GTFS Realtimeは、車両の_実際の_状態を表示することができるため、フィードは定期的に更新する必要があります - できれば、新しいデータは自動車両位置情報システムから入ってくることが望ましいです。

[フィードエンティティについて](feed-entities)

## データ形式

GTFS Realtimeデータ交換フォーマットは、[プロトコルバッファを](https://developers.google.com/protocol-buffers/)ベースにしています。

プロトコルバッファは、構造化されたデータをシリアライズするための、languageプラットフォームに依存しないメカニズムです（XMLを想像してみてください）。データ構造は[gtfs-realtime.proto](proto)ファイルで定義され、このファイルを使ってソースコードを生成し、Java、C++、Python様々な言語を使って、様々なデータストリームから構造化データを容易に読み書きすることができます。

[プロトコルバッファの詳細](https://developers.google.com/protocol-buffers/)

## データ構造

要素の階層とその型定義は、[gtfs-realtime.proto](proto)ファイルで指定されています。

このテキストファイルは、プログラミングlanguage必要なライブラリを生成するために使用されます。これらのライブラリは、有効なGTFS Realtimeフィードを生成するために必要なクラスや関数を提供します。ライブラリは、フィードの作成を容易にするだけでなく、有効なフィードのみが生成されることを保証します。

[データ構造の詳細...](reference)

## ヘルプを見る

GTFS Realtimeに関する議論に参加し、仕様の変更や追加を提案するには、[GTFS Realtime mailing list](https://groups.google.com/group/gtfs-realtime)メーリングリストに参加し、[google/transit GitHub リポジトリの](https://github.com/google/transit)会話をフォローしましょう。

## Google MapsとLive Transit Updates

GTFS Realtimeを使ったアプリケーションとして、Google Mapsの機能である[Live Transit Updatesが](https://developers.google.com/transit/google-transit#LiveTransitUpdates)あります。これは、Realtime交通情報をユーザーに提供する機能です。もし、公共交通機関の方で、Google MapsのRealtime更新に興味があれば、[Google Transit Partner Pageを](https://maps.google.com/help/maps/transit/partners/live-updates.html)参照してください。
