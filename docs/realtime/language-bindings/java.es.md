# Java GTFS-realtime Language Bindings

![Versión de Maven Central](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

Proporciona clases Java generadas a partir de la especificación [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)Protocol Buffer. Estas clases le permitirán analizar un protocolo binario Buffer GTFS-realtime de alimentación de datos en objetos Java.

## Añadir la dependencia

Para utilizar las clases `gtfs-realtime-bindings` en tu propio proyecto, necesitas añadir una dependencia apropiada. Publicamos nuestro módulo en el [repositorio central de Maven](http://search.maven.org/)para que pueda ser fácilmente referenciado por herramientas de compilación de Java como Maven, Ivy y Gradle.

Para [Maven](http://maven.apache.org/), añade lo siguiente a la sección `pom.xmldependencies`:

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

Para [Gradle](https://www.gradle.org/), añada lo siguiente a la sección `build.gradledependecies`:

    compile group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

Asegúrate de que el repositorio central de Maven está referenciado por tu proyecto.

## Código de ejemplo

El siguiente fragmento de código muestra la descarga de una fuente de datos GTFS-realtime desde una URL determinada, su análisis como FeedMessage (el tipo raíz del esquema GTFS-realtime) y la iteración sobre los resultados.

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

Para obtener más información sobre las convenciones de nomenclatura de las clases Java generadas a partir de [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consulta la [sección de códigos generados en Java](https://developers.google.com/protocol-buffers/docs/reference/java-generated)del sitio para desarrolladores de Protocol Buffers.

## Historial del proyecto

### 0`.0.` 4 e inferiores

Este proyecto fue creado originalmente por Google. Puedes descargar las versiones `0.0.4` y anteriores bajo el ID de grupo `com.google.transit` [aquí en Maven Central](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings).

### `0.0.5`

MobilityData comenzó a mantener el proyecto a principios de 2019 e inicialmente publicó artefactos de lanzamiento a través de JCenter. Puedes descargar la versión `0.0.5` bajo el Group ID `io.mobilitydata.` transit [aquí](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings) en Maven Central.

### 0.0`.` 6 y `0.0.`7

JCenter [cerró](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/) en 2021. Antes del cierre, un problema de sincronización impidió que las versiones `0.0.6` y `0.0.` 7 se sincronizaran desde JCenter a Maven Central, por lo que la descarga directa de artefactos no está disponible actualmente para estas versiones. Sin embargo, puede compilarlas usted mismo desde las [etiquetas](https://github.com/MobilityData/gtfs-realtime-bindings/tags) utilizando el comando `mvn package`.

### 0.`0.` 8 y superiores

En 2022, MobilityData cambió a publicar artefactos directamente en Maven Central bajo el ID de grupo `org.mobilitydata`, que es donde se publican las versiones 0.0.8 y superiores.
