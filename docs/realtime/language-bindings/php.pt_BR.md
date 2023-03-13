# Ligações da linguagem PHP GTFS-realtime

[![Versão PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Fornece classes PHP geradas a partir da especificação do [GTFS-realtime](https://developers.google.com/transit/gtfs-realtime/) ProtocolBuffer. Estas classes permitirão a você analisar uma alimentação de dados binários do ProtocolBuffer GTFS-realtime em objetos PHP.

Para ver os bindings em outras linguagens, veja the [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) project.

!!! fail "Depreciado"

    *Desde fevereiro de 2019, a ferramenta oficial `google-protobuf` Google protoc [não suporta arquivos proto2](https://github.com/protocolbuffers/protobuf/issues/3623). Como resultado, estamos depreciando os bindings PHP até que o suporte oficial aos arquivos de proto2 seja implementado nas ferramentas de buffer do protocolo Google.*

## Adicionar a Dependência

Para utilizar as classes `gtfs-realtime-bindings-php` em seu próprio projeto, você precisa primeiro instalar o [Packagist Composer package](https://packagist.org/packages/google/gtfs-realtime-bindings). Para doso, adicione uma dependência em seu arquivo `composer.json:`

    "require": {
      "google/gtfs-realtime-bindings": "x.y.z"
    }

Onde `x.y.z` é a última versão lançada:

[![Versão PHP](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings.svg)](https://badge.fury.io/ph/google%2Fgtfs-realtime-bindings)

Em seguida, atualize suas dependências do Composer:

    composer update

## Código de exemplo

O seguinte trecho de código demonstra o download de um feed de dados em GTFS-realtime de uma URL específica, analisando-o como um FeedMessage (o tipo raiz do esquema em GTFS-realtime), e iterando sobre os resultados.

```php
require_once 'vendor/autoload.php';

use transit_realtime\FeedMessage;

$data = file_get_contents("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
$feed = new FeedMessage();
$feed->parse($data);
foreach ($feed->getEntityList() as $entity) {
  if ($entity->hasTripUpdate()) {
    error_log("trip: " . $entity->getId());
  }
}
```

Para mais detalhes sobre as convenções de nomenclatura das classes PHP geradas a partir do arquivo [gtfs-realtime.proto](https://developers.google.com/transit/gtfs-realtime/gtfs-realtime-proto), verifique o [arquivo fonte gtfs-realtime.php.](https://github.com/google/gtfs-realtime-bindings-php/blob/master/src/gtfs-realtime.php)
