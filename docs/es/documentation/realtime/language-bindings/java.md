# Java GTFS-realtime Language Bindings

 ![Versión central de Maven](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg) 
 
 Proporciona clases de Java generadas a partir de la especificación [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) 
 Protocol Buffer. Estas clases le permitirán analizar un buffer de protocolo binario 
 fuente de datos GTFS en tiempo real en objetos Java. 
 
## Agregar la dependencia 
 
 Para usar las clases `gtfs-realtime-bindings` en su propio proyecto, necesita agregar 
 una dependencia apropiada. Publicamos nuestro módulo en el [Repositorio central de Maven](http://search.maven.org/) 
 para que las herramientas de compilación de Java como Maven, Ivy y Gradle puedan hacer referencia a él fácilmente. 
 
 Para [Maven](http://maven.apache.org/), agregue lo siguiente a su sección de dependencias `pom.xml` 
: 
 
```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```
 
 Para [Gradle](https://www.gradle.org/), agregue lo siguiente a su sección de dependencias `build.gradle` 
: 
 
```
implementation group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'
```
 
 Asegúrese de que su proyecto haga referencia al repositorio central de Maven. 
 
## Código de ejemplo 
 
 El siguiente fragmento de código demuestra la descarga de un feed de datos GTFS en tiempo real 
 desde una URL particular, analizándolo como un FeedMessage (el tipo raíz del 
 esquema GTFS en tiempo real), e iterando sobre los resultados. 
 
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
 
 Para obtener más detalles sobre las convenciones de nomenclatura para las clases Java generadas a partir de 
, [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), 
 consulte el [Código generado por Java](https://developers.google.com/protocol-buffers/docs/reference/java-generated) 
 sección del sitio para desarrolladores de Protocol Buffers. 
 
## Historial del proyecto

### `0.0.4` e inferiores
Este proyecto fue creado originalmente por Google. Puede descargar versiones `0.0.4` y anteriores con el ID de grupo `com.google.transit` [aquí en Maven Central](https://search.maven.org/search?q=g:com.google.transit %20AND%20a:gtfs-realtime-bindings). 
 
### `0.0.5` 
 MobilityData comenzó a mantener el proyecto a principios de 2019 e inicialmente publicó artefactos de lanzamiento a través de JCenter. Puede descargar la versión `0.0.5` con el ID de grupo `io.mobilitydata.transit` [aquí en Maven Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings ). 
 
### `0.0.6` y `0.0.7` 
 JCenter [cerró](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/) en 2021. Antes del cierre, un problema de sincronización impidió que las versiones `0.0.6` y `0.0.7` se sincronizaran desde JCenter a Maven Central, por lo que la descarga directa de artefactos no está disponible actualmente para estas versiones. Sin embargo, puede compilarlos usted mismo desde las [etiquetas](https://github.com/MobilityData/gtfs-realtime-bindings/tags) usando el comando `n` package`. 
 
### `0.0.8` y superiores 
 En 2022, MobilityData pasó a publicar artefactos directamente en Maven Central bajo el ID de grupo `org.mobilitydata`, que es donde se publican las versiones 0.0.8 y superiores. 
