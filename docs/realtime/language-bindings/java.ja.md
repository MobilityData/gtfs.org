# Java GTFS-Realtime 言語バインディング

![Maven Centralのバージョン](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)Protocol Buffer仕様から生成されたJavaクラスを提供します。 これらのクラスを使用すると、バイナリ Protocol BufferGTFS-realtime データフィードを Java オブジェクトにパースすることができます。

## 依存関係の追加

自分のプロジェクトで`gtfs-realtime-bindings`クラスを使用するには、適切な依存関係を追加する必要があります。 [Maven](http://search.maven.org/)、Ivy、GradleなどのJavaビルドツールから簡単に参照できるように、[Maven Central Repositoryに](http://search.maven.org/)モジュールを公開します。

[Mavenの](http://maven.apache.org/)場合は、`pom.xmldependencies`セクションに以下を追加してください。

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

[Gradleの](https://www.gradle.org/)場合は、`build.gradledependecies`セクションに以下を追加してください。

    compile group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

Maven Central リポジトリがプロジェクトで参照されていることを確認してください。

## コード例

次のコードでは、特定のURLからGTFS-realtimeデータフィードをダウンロードし、それをFeedMessage（GTFS-realtimeスキーマのルートタイプ）として解析し、結果を反復処理する様子を示しています。

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

[gtfs-realtime.protoから](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成されるJavaクラスの命名規則の詳細については、プロトコルバッファの開発者サイトの[Java Generated Codesセクションを](https://developers.google.com/protocol-buffers/docs/reference/java-generated)参照してください。

## プロジェクト履歴

### `0.0.4`およびそれ以下

このプロジェクトは元々Googleによって作られました。`0.0.4`以前のバージョンはグループID`com.google.transit`で、[Maven Centralから](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings)ダウンロードできます。

### `0.0.5`

MobilityDataは2019年初頭にこのプロジェクトのメンテナンスを開始し、当初はJCenter経由でリリースアーティファクトを公開していました。バージョン`0.0.`5は、[Maven Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings)のここでグループID`io.mobilitydata.transitの`下でダウンロードすることができます。

### `0.0.6`および`0.0.7`

JCenterは2021年に[シャットダウン](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/)されました。シャットダウン前に、同期の問題でバージョン`0.0.6と` `0.0.7が`JCenterからMaven Centralに同期されなかったため、これらのバージョンでは現在直接アーティファクトをダウンロードすることができません。しかし、`mvn packageという`コマンドを使えば、[タグから](https://github.com/MobilityData/gtfs-realtime-bindings/tags)自分でコンパイルすることができます。

### `0.0.8と`それ以降

2022年、MobilityDataはグループID`org.mobilitydataの`下でMaven Centralに直接成果物を公開するように変更し、そこでバージョン0.0.8以降が公開されています。