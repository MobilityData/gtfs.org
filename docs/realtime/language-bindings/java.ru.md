# Языковые привязки Java GTFS-realtime

![Центральная версия Maven](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

Предоставляет классы Java, созданные на основе спецификации [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)Protocol Buffer. Эти классы позволят вам разобрать двоичный поток данных Protocol BufferGTFS-realtime в объекты Java.

## Добавьте зависимость

Чтобы использовать классы `gtfs-realtime-bindings` в своем проекте, необходимо добавить соответствующую зависимость. Мы публикуем наш модуль в [центральном репозитории Maven,](http://search.maven.org/)чтобы на него могли легко ссылаться такие инструменты сборки Java, как Maven, Ivy и Gradle.

Для [Maven](http://maven.apache.org/) добавьте следующее в раздел `pom.xmldependencies`:

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

Для [Gradle](https://www.gradle.org/) добавьте следующее в раздел `build.gradledependecies`:

    compile group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

Убедитесь, что центральный репозиторий Maven ссылается на ваш проект.

## Пример кода

Следующий фрагмент кода демонстрирует загрузку потока данных GTFS-realtime с определенного URL, его разбор как FeedMessage (корневой тип схемыGTFS-realtime) и итерацию результатов.

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

Более подробную информацию о соглашениях об именах для Java-классов, созданных на основе [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), можно найти в [разделе Java Generated Codes](https://developers.google.com/protocol-buffers/docs/reference/java-generated)на сайте разработчика Protocol Buffers.

## История проекта

### `0.0.4` и ниже

Этот проект был первоначально создан компанией Google. Вы можете загрузить версии `0.0.4` и старше под групповым идентификатором `com.google.transit` [здесь, на Maven Central](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings).

### `0.0.5`

MobilityData начала поддерживать проект в начале 2019 года и первоначально опубликовала артефакты релиза через JCenter. Вы можете загрузить версию `0.0.5` под групповым идентификатором `io.mobilitydata.transit` [здесь на Maven Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings).

### `0.0.6` и `0.0.7`

JCenter был [закрыт](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/) в 2021 году. До закрытия, проблема синхронизации не позволяла синхронизировать версии `0.0.6` и `0.0.7` из JCenter в Maven Central, поэтому прямая загрузка артефактов для этих версий в настоящее время недоступна. Однако вы можете скомпилировать их самостоятельно из [тегов](https://github.com/MobilityData/gtfs-realtime-bindings/tags) с помощью команды `mvn package`.

### `0.0.8` и выше

В 2022 году MobilityData перешла на публикацию артефактов непосредственно в Maven Central под групповым идентификатором `org.mobilitydata`, где публикуются версии 0.0.8 и выше.
