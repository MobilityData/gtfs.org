# Java GTFS-Realtime 語言綁定

![Maven 中心版](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

提供從[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)協議緩衝區規範生成的 Java 類。這些類將允許您將二進制 Protocol Buffer GTFS 實時數據饋送解析為 Java 對象。

## 添加依賴項

要在您自己的項目中使用`gtfs-realtime-bindings`類，您需要添加適當的依賴項。我們將模塊發佈到[Maven 中央存儲庫](http://search.maven.org/)，以便它可以很容易地被 Maven、Ivy 和 Gradle 等 Java 構建工具引用。

對於[Maven](http://maven.apache.org/) ，將以下內容添加到您的`pom.xml`依賴項部分：

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

對於[Gradle](https://www.gradle.org/) ，將以下內容添加到您的`build.gradle` 依賴關係部分：

    compile group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

確保您的項目引用了 Maven 中央存儲庫。

## 示例代碼

以下代碼片段演示了從特定 URL 下載 GTFS Realtime數據提要，將其解析為 FeedMessage（GTFS Realtime架構的根類型），並迭代結果。

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

有關從[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的 Java 類的命名約定的更多詳細信息，請查看 Protocol Buffers 開發人員站點的[Java 生成代碼](https://developers.google.com/protocol-buffers/docs/reference/java-generated)部分。

## 項目歷史

### `0.0.4`及更低版本

這個項目最初是由谷歌創建的。您可以 [在 Maven Central](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings)的組 ID `com.google.transit`下下載`0.0.4`及更早版本。

### `0.0.5`

MobilityData 於 2019 年初開始維護該項目，最初通過 JCenter 發布了發布工件。您可以[在 Maven Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings)的組 ID `0.0.5`下下載版本`io.mobilitydata.transit` 。

### `0.0.6`和`0.0.7`

JCenter 於 2021 年[關閉。](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/)在關閉之前，同步問題導致版本`0.0.6`和`0.0.7`無法從 JCenter 同步到 Maven Central，因此這些版本目前無法直接下載工件。但是，您可以使用命令`mvn package`自己從[標籤](https://github.com/MobilityData/gtfs-realtime-bindings/tags)編譯它們。

### `0.0.8`及更高版本

2022 年，MobilityData 轉為在組 ID `org.mobilitydata`下直接將工件發佈到 Maven Central，這是發布 0.0.8 及更高版本的地方。
