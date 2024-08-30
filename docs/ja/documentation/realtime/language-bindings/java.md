# Java GTFS-realtime 言語バインディング

![Maven Central バージョン](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) プロトコル バッファ仕様から生成された Java クラスを提供します。これらのクラスを使用すると、バイナリ プロトコル バッファ GTFS-realtime データ フィードを Java オブジェクトに解析できます。

## 依存関係の追加 

独自のプロジェクトで`gtfs-realtime-bindings`クラスを使用するには、適切な依存関係を追加する必要があります。私たちのモジュールは [Maven Central Repository](http://search.maven.org/) に公開されており、Maven、Ivy、Gradle などの Java ビルド ツールで簡単に参照できます。

[Maven](http://maven.apache.org/) の場合は、 `pom.xml` の依存関係セクションに以下を追加します:

```xml
<dependency> 
<groupId> org.mobilitydata</groupId> 
<artifactId> gtfs リアルタイムバインディング</artifactId>
<version> 0.0.8</version> 
</dependency> 
```

[Gradle](https:) の場合は、 `build.gradle` の依存関係セクションに以下を追加します。

```
実装グループ: ’org.mobilitydata’、名前: ’gtfs-realtime-bindings’、バージョン: ’0.0.8’
```

プロジェクトで Maven 中央リポジトリが参照されていることを確認します。

## サンプル コード

次のコード スニペットは、特定の URL から GTFS リアルタイム データ フィードをダウンロードし、それをFeedMessage (GTFS リアルタイム スキーマのルート タイプ) として解析して、結果を反復処理する方法を示しています。

```a` import java.net.URL;

import com.google.transit.realtime.GtfsRealtime. FeedEntity;
import com.google.transit.realtime.GtfsRealtime. FeedMessage;

public class GtfsRealtimeExample {
 public static void main(String[] args) throws Exception {
    URL url = new URL("GTFS-REALTIME ソースの URL をここに記述してください");
    FeedMessage feed = FeedMessage.parseFrom(url.openStream());
    for (FeedEntity entity : feed.getEntityList()) {
      if (entity.hasTripUpdate()) {
       System.out.println(entity.getTripUpdate());
      }
    }
 }
}
```

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) から生成される Java クラスの命名規則の詳細については、[Java 生成コード](https://developers.google.com/protocol-buffers/docs/reference/java-generated) セクションの Protocol Buffers 開発者向けセクションをご覧ください。

## プロジェクト履歴

### `0.0.4` 以下
このプロジェクトは元々 Google によって作成されました。バージョン `0.0.4` およびそれ以前のバージョンは、グループID `com.google.transit` [Maven Central のこちら](https:)からダウンロードできます。

### `0.0.5`
MobilityData は 2019 年の初めにプロジェクトの保守を開始し、当初は JCenter 経由でリリース成果物を公開しました。バージョン `0.0.5` は、グループID `io.mobilitydata.transit` [Maven Central のこちら](https:) からダウンロードできます。

### `0.0.6` および `0.0.7`
JCenter [は 2021 年にシャットダウン](https: )。シャットダウン前は、同期の問題によりバージョン `0.0.6` および `0.0.7` が JCenter から Maven Central に同期されなかったため、現在これらのバージョンでは直接アーティファクトをダウンロードすることはできません。ただし、コマンド`n` package`を使用して [tags](https: ) から自分でコンパイルすることができます。

### `0.0.8` 以上
2022 年に、MobilityData は、グループID `org.mobilitydata`で` Maven Central に成果物を直接公開するように切り替えました。バージョン 0.0.8 以上はここで公開されます。
