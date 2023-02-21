# gtfs-realtime-bindings [![Join the MobilityData chat](https://img.shields.io/badge/chat-on%20slack-red)](https://bit.ly/mobilitydata-slack)

Ligações de idiomas geradas a partir das especificações do [GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) protocolbuffer para idiomas populares.

## Introdução

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) é um formato de dados para comunicar informações em tempo real sobre sistemas de trânsito público. Os dados GTFS Realtime são codificados e decodificados usando [ProtocolBuffers](https://developers.google.com/protocol-buffers/), uma representação binária compacta projetada para um processamento rápido e eficiente. O esquema de dados é definido[pelo gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto)

Para trabalhar com dados GTFS em tempo real, um desenvolvedor tipicamente usaria o esquema de `gtfs-realtime.proto` do GTFS em tempo real para gerar classes na linguagem de programação de sua escolha. Estas classes podem então ser usadas para construir objetos modelo GTFS-realtimedata e serializá-los como dados binários ou, no sentido inverso, analisando dados binários em objetos modelo de dados.

Como a geração de classes de modelos de dados GTFS em tempo real a partir de um esquema de `gtfs-realtime.proto` em tempo real é uma tarefa tão comum, mas também uma tarefa que às vezes causa confusão para desenvolvedores iniciantes, este projeto tem como objetivo fornecer aglutinantes de linguagem GTFS gerada em tempo real para várias das linguagens de programação mais populares. Sempre que possível, estas linguagens serão publicadas como pacotes para facilitar seu uso em outros projetos.

## Idiomas suportados

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Rubi](ruby.md)~~ *(Depreciado a partir do início de 2019)*
* ~~[PHP](php.md)~~ *(Depreciado a partir do início de 2019)*

## Outros idiomas

Não fornecemos o código gerado para C++, usamos o compilador oficial de protótipos para isso ( [daqui](https://developers.google.com/protocol-buffers/docs/downloads) ou [aqui](https://github.com/google/protobuf))

Está nos faltando seu idioma favorito? Considere contribuir:

1. Leia [CONTRIBUTING.md.](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md)
2. Abra um pedido com o idioma de sua escolha. Por favor, inclua instruções de atualização (idealmente, scripts). Além disso, forneça embalagens adequadas para o ecossistema do idioma.

## Histórico do projeto

Este projeto foi originalmente criado pelo Google - MobilityData começou a manter o projeto no início de 2019.

Versões mais antigas das bibliotecas de encadernação ainda são publicadas sob o nome do Google. Veja a documentação para cada idioma [aqui](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) para encontrar a última versão publicada pelo Google.
