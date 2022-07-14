# Visão geral do GTFS Realtime

<div class="landing-page">
   <a class="button" href="reference">Referência</a>
   <a class="button" href="best-practices">Melhores Práticas</a>
   <a class="button" href="feed-examples">Exemplos</a>
   <a class="button" href="changes">Mudanças</a>
</div>

## Como Começar

Fornecer aos usuários atualizações de dados de trânsito em tempo real melhora muito sua experiência de seus serviços de trânsito. O fornecimento de informações atualizadas sobre os horários atuais de chegada e partida permite que os usuários planejem facilmente suas viagens. Como resultado, em caso de um infeliz atraso, um passageiro ficaria aliviado em saber que pode ficar em casa por um pouco mais de tempo.

GTFS Realtime é uma especificação de alimentação que permite que as agências de transporte público forneçam atualizações Realtime sobre sua frota aos desenvolvedores de aplicações. É uma extensão do [GTFS](../schedule/reference) (General Transit Feed Specification), um formato de dados aberto para horários de transporte público e informações geográficas associadas. O GTFS Realtime foi projetado em torno da facilidade de implementação, boa interoperabilidade GTFS e um foco nas informações sobre passageiros.

A especificação foi projetada através de uma parceria das agências parceiras iniciais [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates), de vários desenvolvedores de trânsito e do Google. A especificação é publicada sob a [licença Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).

## Como posso começar?

1.  Continue lendo a visão geral abaixo.
2.  Decida quais [entidades de alimentação](feed-entities) você estará fornecendo.
3.  Dê uma olhada nos [exemplos de feeds](feed-examples).
4.  Crie seus próprios feeds usando a [referência](reference).
5.  [Publique seu feed](best-practices/#feed-publishing-general-practices).

## Visão geral do GTFS Realtime feeds

A especificação suporta atualmente os seguintes tipos de informação:

*   **Atualizações de viagem** - atrasos, cancelamentos, rotas alteradas
*   **Alertas de serviço** - parada movida, eventos imprevistos que afetam uma estação, rota ou toda a rede
*   **Posições dos veículos** - informações sobre os veículos, incluindo localização e nível de congestionamento

Uma ração pode, embora não seja necessária, combinar entidades de diferentes tipos. As rações são servidas via HTTP e atualizadas freqüentemente. O arquivo em si é um arquivo binário regular, portanto qualquer tipo de webserver pode hospedar e servir o arquivo (outros protocolos de transferência também podem ser usados). Alternativamente, também poderiam ser utilizados servidores de aplicações web que, como resposta a um pedido HTTP GET válido, retornarão o feed. Não há restrições sobre a freqüência ou o método exato de como o feed deve ser atualizado ou recuperado.

Como o GTFS Realtime permite que você apresente o status _real_ de sua frota, o feed precisa ser atualizado regularmente - de preferência sempre que novos dados vierem de seu sistema de Localização Automática de Veículos.

[Mais sobre as entidades de alimentação...](feed-entities)

## Formato dos dados

O formato de troca de dados Realtime GTFS é baseado em [Protocol Buffers](https://developers.google.com/protocol-buffers/)

Os buffers de protocolo são um mecanismo de language e plataforma neutro para a serialização de dados estruturados (pense em XML, mas menor, mais rápido e mais simples). A estrutura de dados é definida em um arquivo [gtfs-realtime.proto](proto), que então é usado para gerar código fonte para ler e escrever facilmente seus dados estruturados de e para uma variedade de fluxos de dados, usando uma variedade de linguagens - por exemplo, Java, C++ ou Python.

[Mais sobre Protocol Buffers....](https://developers.google.com/protocol-buffers/)

## Estrutura de dados

A hierarquia de elementos e suas definições de tipo estão especificadas no arquivo [gtfs-realtime.proto](proto).

Este arquivo de texto é usado para gerar as bibliotecas necessárias na sua escolha de language programação. Estas bibliotecas fornecem as classes e funções necessárias para gerar feeds GTFS válidos Realtime. As bibliotecas não apenas facilitam a criação de feeds, mas também garantem que somente feeds válidos sejam produzidos.

[Mais sobre a estrutura de dados...](reference)

## Obtendo ajuda

Para participar das discussões em torno do GTFS Realtime e sugerir mudanças e adições à especificação, junte-se à [GTFS Realtime mailing list](https://groups.google.com/group/gtfs-realtime) e siga as conversas no [repositório google/transit GitHub](https://github.com/google/transit).

## Google Maps e Live Transit Updates

Uma das possíveis aplicações que utiliza GTFS Realtime é o [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates), um recurso do Google Maps que fornece aos usuários informações de trânsito Realtime. Se você está trabalhando para uma agência de transporte público que está interessada em fornecer atualizações Realtime para o Google Maps, visite a [página de parceiros do Google Transit](https://maps.google.com/help/maps/transit/partners/live-updates.html).
