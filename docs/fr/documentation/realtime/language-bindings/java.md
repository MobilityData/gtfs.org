# Liaisons de langage Java GTFS-realtime 
 
 ![Version Maven Central](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg) 
 
 Fournit des classes Java générées à partir de la spécification [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol Buffer. Ces classes vous permettront d’analyser un flux de données binaire en temps réel Protocol Buffer GTFS dans des objets Java. 
 
## Ajouter la dépendance 
 
 Pour utiliser les classes `gtfs-realtime-bindings` dans votre propre projet, vous devez ajouter une dépendance appropriée. Nous publions notre module dans le [Maven Central Repository](http://search.maven.org/) afin qu’il puisse être facilement référencé par les outils de construction Java tels que Maven, Ivy et Gradle. 
 
 Pour [Maven](http://maven.apache.org/), ajoutez ce qui suit à votre section de dépendances `pom.xml`: 
 
```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```
 
 Pour [Gradle](https://www.gradle.org/), ajoutez ce qui suit à votre section de dépendances `build.gradle`: 
 
```
implementation group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'
```
 
 Assurez-vous que le répertoire central Maven est référencé par votre projet. 
 
## Exemple de code 
 
 L’extrait de code suivant montre le téléchargement d’un flux de données GTFS en temps réel à partir d’une URL particulière, en l’analysant comme un FeedMessage (le type racine du schéma 
 GTFS en temps réel), et itérer sur les résultats. 
 
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
 
 Pour plus de détails sur les conventions de dénomination des classes Java générées à partir du le [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consultez le [Code généré Java](https://developers.google.com/protocol-buffers/docs/reference/java-generated) section du site des développeur·euse de Protocol Buffers. 
 
## Historique du projet

### `0.0.4` et versions antérieures 
 Ce projet a été créé à l’origine par Google. Vous pouvez télécharger les versions `0.0.4` et les versions antérieures sous l’ID de groupe `com.google.transit` [ici sur Maven Central](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings). 
 
### `0.0.5` 
 MobilityData a commencé à maintenir le projet début 2019 et a initialement publié les artefacts de version via JCenter. Vous pouvez télécharger la version `0.0.5` sous l’ID de groupe `io.mobilitydata.transit` [ici sur Maven Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings). 
 
### `0.0.6` et `0.0.7` 
 JCenter [arrêter](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/) en 2021. Avant l’arrêt, un problème de synchronisation empêchait les versions `0.0.6` et `0.0.7` d’être synchronisées de JCenter vers Maven Central, le téléchargement direct d’artefacts n’est donc pas disponible pour ces versions. Cependant, vous pouvez les compiler vous-même à partir des [tags](https://github.com/MobilityData/gtfs-realtime-bindings/tags) en utilisant la commande `mvn package`. 
 
### `0.0.8` et versions ultérieures 
 En 2022, MobilityData est passé à la publication d’artefacts directement sur Maven Central sous l’ID de groupe `org.mobilitydata`, où les versions 0.0.8 et supérieures sont publiées. 
