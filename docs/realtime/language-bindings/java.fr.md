# Liaisons de langage Java GTFS-realtime

![Version de Maven Central](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

Fournit des classes Java générées à partir de la spécification [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)Protocol Buffer. Ces classes vous permettront d'analyser un flux de données binaire Protocol Buffer GTFS-realtime en objets Java.

## Ajouter la dépendance

Pour utiliser les classes `gtfs-realtime-bindings` dans votre propre projet, vous devez ajouter une dépendance appropriée. Nous publions notre module dans le [dépôt central Maven afin](http://search.maven.org/)qu'il puisse être facilement référencé par les outils de construction Java comme Maven, Ivy et Gradle.

Pour [Maven](http://maven.apache.org/), ajoutez ce qui suit à votre section `pom.xml` dépendances:

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

Pour [Gradle](https://www.gradle.org/), ajoutez ce qui suit à votre section `build.gradle` dépendances:

    implementation group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

Assurez-vous que le dépôt central Maven est référencé par votre projet.

## Exemple de code

L'extrait de code suivant montre le téléchargement d'un flux de données GTFS-realtime à partir d'une URL particulière, son analyse en tant que FeedMessage (le type racine du schéma GTFS-realtime) et l'itération des résultats.

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

Pour plus de détails sur les conventions d'appellation des classes Java générées à partir de [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consultez la [section Java Generated Codesection](https://developers.google.com/protocol-buffers/docs/reference/java-generated)du site du développeur Protocol Buffers.

## Historique du projet

### `0.0.4` et inférieur

Ce projet a été créé à l'origine par Google. Vous pouvez télécharger les versions `0.0.4` et plus anciennes sous l'ID de groupe `com.google.transit` [ici sur Maven Central](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings).

### `0.0.5`

MobilityData a commencé à maintenir le projet au début de 2019 et a initialement publié des artefacts de version via JCenter. Vous pouvez télécharger la version `0.0.5` sous l'ID de groupe `io.mobilitydata.transit` [ici sur Maven Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings).

### `0.0.6` et `0.0.7`

JCenter a [été fermé](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/) en 2021. Avant la fermeture, un problème de synchronisation a empêché les versions `0.0.6` et `0.0.7` d'être synchronisées de JCenter à Maven Central, de sorte que le téléchargement direct des artefacts n'est pas actuellement disponible pour ces versions. Cependant, vous pouvez les compiler vous-même à partir des [balises](https://github.com/MobilityData/gtfs-realtime-bindings/tags) en utilisant la commande `mvn package`.

### `0.0.8` et plus

En 2022, MobilityData est passé à la publication d'artefacts directement sur Maven Central sous l'ID de groupe `org.mobilitydata`, où les versions 0.0.8 et supérieures sont publiées.
