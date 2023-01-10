# Java GTFS-Realtime Sprachbindungen

![Maven Zentrale Version](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

Stellt Java-Klassen zur Verfügung, die aus der [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)Protocol Buffer-Spezifikation generiert wurden. Mit diesen Klassen können Sie einen binären Protocol Buffer GTFS-Realtime Datenfeed in Java-Objekte parsen.

## Hinzufügen der Abhängigkeit

Um die `gtfs-realtime-bindings` Klassen in Ihrem eigenen Projekt zu verwenden, müssen Sie eine entsprechende Abhängigkeit hinzufügen. Wir veröffentlichen unser Modul im [Maven Central Repository, so](http://search.maven.org/)dass es leicht von Java-Build-Tools wie Maven, Ivy und Gradle referenziert werden kann.

Für [Maven](http://maven.apache.org/), fügen Sie das Folgende zu Ihrem `pom.xmldependencies`Abschnitt hinzu:

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

Für [Gradle](https://www.gradle.org/), fügen Sie das Folgende zu Ihrem `build.gradledependecies`Abschnitt hinzu:

    compile group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

Stellen Sie sicher, dass das Maven Central Repository von Ihrem Projekt referenziert wird.

## Beispielcode

Der folgende Codeausschnitt veranschaulicht das Herunterladen eines GTFS-Realtime datenfeeds von einer bestimmten URL, das Parsen als FeedMessage (der Stammtyp des GTFS-Realtime schemas) und die Iteration der Ergebnisse.

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

Weitere Details zu den Namenskonventionen für die Java-Klassen, die aus dem [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) generiert werden, finden Sie im [Abschnitt Java Generated Codesection](https://developers.google.com/protocol-buffers/docs/reference/java-generated)auf der Protocol Buffers Developer Site.

## Projekt-Geschichte

### `0.0.4` und niedriger

Dieses Projekt wurde ursprünglich von Google erstellt. Sie können Versionen `0.0.4` und älter unter der Group ID `com.google.transit` [hier auf Maven Central](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings) herunterladen.

### `0.0.5`

MobilityData hat Anfang 2019 begonnen, das Projekt zu pflegen und hat zunächst Release-Artefakte über JCenter veröffentlicht. Sie können Version `0.0.5` unter der Group ID `io.mobilitydata.transit` hier auf Maven [Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings) herunterladen.

### `0.0.6` und `0.0.7`

JCenter wurde im Jahr 2021 [abgeschaltet](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/). Vor der Abschaltung verhinderte ein Synchronisationsproblem, dass die Versionen `0.0.6` und `0.0.7` von JCenter zu Maven Central synchronisiert werden konnten, so dass ein direkter Artefakt-Download für diese Versionen derzeit nicht möglich ist. Sie können sie jedoch selbst aus den [Tags](https://github.com/MobilityData/gtfs-realtime-bindings/tags) kompilieren, indem Sie den Befehl `mvn package` verwenden.

### `0.0.8` und höher

Im Jahr 2022 ging MobilityData dazu über, Artefakte direkt in Maven Central unter der Gruppen-ID `org.mobilitydata` zu veröffentlichen. Dort werden die Versionen 0.0.8 und höher veröffentlicht.
