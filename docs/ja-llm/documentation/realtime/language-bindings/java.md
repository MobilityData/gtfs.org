# Java GTFS-realtime 言語バインディング {: #java-gtfs-realtime-language-bindings}


![Maven Central Version](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol Buffer 仕様から生成された Java クラスを提供します。これらのクラスを使用することで、バイナリ形式の Protocol Buffer GTFS-realtime データフィードを Java オブジェクトに変換して解析することができます。

## 依存関係の追加 {: #add-the-dependency}

`gtfs-realtime-bindings` クラスを自身のプロジェクトで使用するには、適切な依存関係を追加する必要があります。私たちはモジュールを [Maven Central Repository](http://search.maven.org/) に公開しているため、Maven、Ivy、Gradle といった Java のビルドツールから簡単に参照することができます。

[Maven](http://maven.apache.org/) を使用する場合は、`pom.xml` の dependencies セクションに以下を追加してください:

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

[Gradle](https://www.gradle.org/) を使用する場合は、`build.gradle` の dependencies セクションに以下を追加してください:

```
implementation group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'
```

Maven Central Repository がプロジェクトで参照されていることを確認してください。

## コード例 {: #example-code}

以下のコードスニペットは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをGTFS-realtimeスキーマのルート型であるFeedMessageとしてパースし、結果を反復処理する方法を示しています。

```java
import java.net.URL;

import com.google.transit.realtime.GtfsRealtime.FeedEntity;
import com.google.transit.realtime.GtfsRealtime.FeedMessage;

public class GtfsRealtimeExample {
  public static void main(String[] args) throws Exception {
    URL url = new URL("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
    FeedMessage feed = FeedMessage.parseFrom(url.openStream());
    for (FeedEntity entity : feed.getEntityList()) {
      if (entity.hasTripUpdate()) {
        System.out.println(entity.getTripUpdate());
      }
    }
  }
}
```

Javaクラスの命名規則に関する詳細については、[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)から生成されたコードに関する[Java Generated Code](https://developers.google.com/protocol-buffers/docs/reference/java-generated)のセクションを、Protocol Buffersの開発者サイトでご確認ください。

## プロジェクトの歴史 {: #project-history}

### `0.0.4` およびそれ以前 {: #004-and-lower}

このプロジェクトはもともと Google によって作成されました。`0.0.4` およびそれ以前のバージョンは、Group ID `com.google.transit` の下で [Maven Central からこちら](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings) からダウンロードすることができます。

### `0.0.5` {: #005}

MobilityData は 2019 年初頭にこのプロジェクトの保守を開始し、当初は JCenter を通じてリリース成果物を公開していました。バージョン `0.0.5` は、Group ID `io.mobilitydata.transit` の下で [Maven Central からこちら](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings) からダウンロードすることができます。

### `0.0.6` および `0.0.7` {: #006-and-007}

JCenter は 2021 年に[シャットダウン](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/)されました。シャットダウン前に同期の問題が発生し、バージョン `0.0.6` および `0.0.7` が JCenter から Maven Central に同期されなかったため、これらのバージョンについては直接アーティファクトをダウンロードすることは現在できません。ただし、[tags](https://github.com/MobilityData/gtfs-realtime-bindings/tags) から `mvn package` コマンドを使用して自分でコンパイルすることができます。

### `0.0.8` 以降 {: #008-and-higher}

2022年、MobilityData はアーティファクトを Group ID `org.mobilitydata` の下で直接 Maven Central に公開する方式に切り替えました。バージョン 0.0.8 以降は、ここで公開されています。
