# Java GTFS-Realtime 语言绑定

![Maven中心版本](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

提供从[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)Protocol Buffer规范生成的Java类。 这些类将允许你将二进制的Protocol BufferGTFS-realtime数据源解析为Java对象。

## 添加依赖关系

要在自己的项目中使用`gtfs-realtime-bindings`类，需要添加一个适当的依赖。 我们将模块发布到[Maven Central Repositor，以便](http://search.maven.org/)Maven、Ivy和Gradle等Java构建工具可以轻松引用。

对于[Maven](http://maven.apache.org/)来说，在`pom.xmldependencies`部分添加以下内容。

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

对于[Gradle](https://www.gradle.org/)，在`build.gradledependecies`部分添加以下内容。

    compile group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

请确保您的项目引用了Maven中央仓库。

## 示例代码

下面的代码片段演示了从一个特定的URL下载GTFS-realtime数据源，将其解析为FeedMessage（GTFS-realtime模式的根类型），并对结果进行迭代。

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

关于从[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)生成的Java类的命名规则的更多细节，请查看协议缓冲区开发者网站的[Java生成的代码部分](https://developers.google.com/protocol-buffers/docs/reference/java-generated)。

## 项目历史

### `0.0.4`及以下版本

这个项目最初是由谷歌创建的。你可以在[Maven中心](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings)下载`0.0.4`及以前的版本，群组ID为`com.google. transit`。

### `0.0.5`

MobilityData于2019年初开始维护该项目，最初通过JCenter发布了发布工件。您可以在[Maven中心](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings)的群组ID`io.mobilitydata. transit`下下载`0.0.5`版本。

### `0.0.6`和`0.0.7`

JCenter在2021年[关闭](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/)了。在关闭之前，由于同步问题，`0.0.6`和`0.0.7`版本无法从JCenter同步到Maven Central，所以目前这些版本无法直接下载工件。不过，您可以使用`mvn package`命令从[标签](https://github.com/MobilityData/gtfs-realtime-bindings/tags)中自行编译它们。

### `0.0.8`及以上版本

2022年，MobilityData转而在组ID`org.mobilitydata`下直接向Maven Central发布工件，0.0.8及以上版本就是在这里发布的。
