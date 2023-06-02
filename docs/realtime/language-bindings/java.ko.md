# Java GTFS-Realtime 언어 바인딩

![Maven 중앙 버전](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) 프로토콜 버퍼 사양에서 생성된 Java 클래스를 제공합니다. 이러한 클래스를 사용하면 이진 Protocol Buffer GTFS-Realtime 데이터 피드를 Java 개체로 구문 분석할 수 있습니다.

## 종속성 추가

자신의 프로젝트에서 `gtfs-realtime-bindings` 클래스를 사용하려면 적절한 종속성을 추가해야 합니다. Maven, Ivy 및 Gradle과 같은 Java 빌드 도구에서 쉽게 참조할 수 있도록 [Maven Central Repository](http://search.maven.org/) 에 모듈을 게시합니다.

[Maven](http://maven.apache.org/) 의 경우 `pom.xml` 종속성 섹션에 다음을 추가합니다.

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

[Gradle](https://www.gradle.org/) 의 경우 `build.gradle` 섹션에 다음을 추가합니다.

    implementation group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

프로젝트에서 Maven 중앙 저장소를 참조하는지 확인하십시오.

## 예제 코드

다음 코드 스니펫은 특정 URL에서 GTFS Realtime 데이터 피드를 다운로드하여 FeedMessage(GTFS Realtime 스키마의 루트 유형)로 파싱하고 결과를 반복하는 방법을 보여줍니다.

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

[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) 에서 생성된 Java 클래스의 명명 규칙에 대한 자세한 내용은 Protocol Buffers 개발자 사이트의 [Java Generated Code](https://developers.google.com/protocol-buffers/docs/reference/java-generated) 섹션을 확인하십시오.

## 프로젝트 역사

### `0.0.4` 이하

이 프로젝트는 원래 Google에서 만들었습니다. [Maven Central](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings) 의 그룹 ID `com.google.transit` 에서 버전 `0.0.4` 이하를 다운로드할 수 있습니다.

### `0.0.5`

MobilityData는 2019년 초에 프로젝트를 유지 관리하기 시작했으며 처음에는 JCenter를 통해 릴리스 아티팩트를 게시했습니다. [Maven Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings) 의 그룹 ID `io.mobilitydata.transit` 에서 버전 `0.0.5` 를 다운로드할 수 있습니다.

### `0.0.6` 및 `0.0.7`

JCenter는 2021년에 [종료](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/) 되었습니다. 종료 전에 동기화 문제로 인해 버전 `0.0.6` 및 `0.0.7` 이 JCenter에서 Maven Central로 동기화되지 않았으므로 현재 이러한 버전에 대해 직접 아티팩트 다운로드를 사용할 수 없습니다. 그러나 `mvn package` 명령을 사용하여 [태그](https://github.com/MobilityData/gtfs-realtime-bindings/tags) 에서 직접 컴파일할 수 있습니다.

### `0.0.8` 이상

2022년에 MobilityData는 버전 0.0.8 이상이 게시되는 그룹 ID `org.mobilitydata` 로 Maven Central에 직접 아티팩트 게시로 전환했습니다.
