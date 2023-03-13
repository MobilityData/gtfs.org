# Ligações da linguagem Java GTFS-realtime

![Versão Central Maven](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

Fornece classes Java geradas a partir da especificação do [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime)Protocol Buffer. Estas classes permitirão a análise de um protocolo binário Buffer GTFS-realtime para alimentação de dados em objetos Java.

## Adicionar a Dependência

Para usar as classes `gtfs-realtime-bindings` em seu próprio projeto, você precisa adicionar uma dependência apropriada. Nós publicamos nosso módulo no [Maven Central Repository](http://search.maven.org/)que pode ser facilmente referenciado por ferramentas de construção Java como Maven, Ivy, e Gradle.

Para [Maven](http://maven.apache.org/), adicione o seguinte à sua seção de dependências `pom.xml`:

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

Para [Gradle](https://www.gradle.org/), adicione o seguinte à sua seção de dependências `build.gradle`:

    compile group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

Certifique-se de que o repositório central Maven seja referenciado por seu projeto.

## Código de exemplo

O seguinte trecho de código demonstra o download de um feed de dados GTFS-realtime de uma URL específica, analisando-o como um FeedMessage (o tipo raiz do esquema GTFS-realtime), e iterando sobre os resultados.

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

Para mais detalhes sobre as convenções de nomenclatura das classes Java geradas a partir do [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), consulte a [seção Java Generated Codesection](https://developers.google.com/protocol-buffers/docs/reference/java-generated)do site do desenvolvedor do protocolo Buffers.

## Histórico do projeto

### `0.0.4` e inferior

Este projeto foi originalmente criado pelo Google. Você pode baixar as versões `0.0.4` e anteriores sob o Group ID `com.google.transit` [aqui na Maven Central](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings).

### `0.0.5`

MobilityData começou a manter o projeto no início de 2019 e inicialmente publicou artefatos de lançamento via JCenter. Você pode baixar a versão `0.0.5` sob a ID do Grupo `io.mobilitydata.transit` aqui [na Maven Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings).

### `0.0.6` e `0.0.7`

O JCenter [foi desativado](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/) em 2021. Antes do desligamento, um problema de sincronização impediu que as versões `0.0.6` e `0.0.7` fossem sincronizadas do JCenter para a Maven Central, portanto o download direto dos artefatos não está disponível atualmente para estas versões. Entretanto, você mesmo pode compilá-los a partir das [tags](https://github.com/MobilityData/gtfs-realtime-bindings/tags) usando o `mvn package` comando.

### `0.0.8` e superiores

Em 2022, MobilityData passou a publicar artefatos diretamente para a Maven Central sob a ID do Grupo `org.mobilitydata`, que é onde as versões 0.0.8 e superiores são publicadas.
