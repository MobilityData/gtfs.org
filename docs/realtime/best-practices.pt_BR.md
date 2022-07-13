# GTFS Melhores Práticas Realtime

## Introdução

Estas são práticas recomendadas para descrever informações de transporte público Realtime no formato de dados [GTFS Realtime](../reference).

### Estrutura do documento

As práticas recomendadas estão organizadas em duas seções primárias

* __[Recomendações Práticas Organizadas por Mensagem](#practice-recommendations-organized-by-message)__: As recomendações são organizadas por mensagem e campo na mesma ordem descrita na referência oficial do GTFS Realtime.
* __Recomendações Práticas[Organizadas por Caso](#practice-recommendations-organized-by-use-case)__: Em casos particulares, tais como serviço baseado em freqüência (vs. serviço Schedule), as práticas podem precisar ser aplicadas em várias mensagens e campos, bem como nos dados correspondentes do GTFS Schedule. Tais recomendações são consolidadas nesta seção.

### Editoração de Alimentos & Práticas Gerais

* Os feeds devem ser publicados em uma URL pública e permanente
* A URL deve ser diretamente acessível sem a necessidade de um login para acessar a alimentação. Se desejado, podem ser usadas chaves API, mas o registro para chaves API deve ser automatizado e disponível para todos.
* Manter identificadores persistentes (campos id) dentro de um feed GTFS Realtime (por exemplo, `FeedEntity.id`, `VehicleDescriptor.id`, `CarriageDetails.id`) em todas as iterações do feed.
* GTFS Realtime feeds devem ser renovados pelo menos uma vez a cada 30 segundos, ou sempre que a informação representada dentro do feed (posição de um veículo) mudar, o que for mais freqüente. VehiclePositions tendem a mudar com mais freqüência do que outras entidades de alimentação e devem ser atualizadas com a maior freqüência possível. Se o conteúdo não tiver mudado, a alimentação deve ser atualizada com um novo `FeedHeader.timestamp` refletindo que a informação ainda é relevante a partir desse timestamp.
* Os dados dentro de uma alimentação Realtime GTFS não devem ter mais de 90 segundos para atualizações de viagem e posições de veículos e não devem ter mais de 10 minutos para alertas de serviço. Por exemplo, mesmo que um produtor esteja continuamente atualizando o `FeedHeader.timestamp` a cada 30 segundos, a idade das Posições do Veículo dentro dessa alimentação não deve ser superior a 90 segundos.
* O servidor que hospeda os dados GTFS Realtime deve ser confiável e retornar consistentemente respostas validamente formatadas em protótipos codificados. Menos de 1% das respostas devem ser inválidas (erros de protobuf ou de fetching).
* O servidor web que hospeda os dados GTFS Realtime deve ser configurado para reportar corretamente a data de modificação do arquivo (ver HTTP/1.1 - Request for Comments 2616, na seção 14.29) para que os consumidores possam aproveitar o cabeçalho `If-Modified-Since` HTTP. Isto economiza a largura de banda dos produtores e consumidores, evitando a transferência de conteúdos de alimentação que não tenham sido alterados.
* Feeds devem fornecer por padrão o conteúdo de feed codificado em buffer de protocolo quando consultado através de uma solicitação HTTP na URL determinada - os consumidores não devem precisar definir cabeçalhos especiais de aceitação HTTP para receber conteúdo codificado em buffer de protocolo.
* Devido a como os buffers de protocolo codificam [valores opcionais](https://developers.google.com/protocol-buffers/docs/proto#optional), antes de ler os dados de um GTFS Realtime feed os consumidores devem verificar a presença de valores usando os métodos `hasX()` gerados pelo buffer de protocolo antes de usar esse valor e só devem usar o valor se `hasX()` for verdadeiro (onde `X` é o nome do campo). Se `hasX(` ) retorna `falso`, o valor padrão para aquele campo definido no valor `GTFS`.proto deve ser assumido. Se o consumidor utiliza o valor sem verificar primeiro o método `hasX(` ), pode estar lendo dados padrão que não foram intencionalmente publicados pelo produtor.
* Os feeds devem usar HTTPS ao invés de HTTP (sem criptografia) para garantir a integridade do feed.
* Os feeds devem cobrir a grande maioria das viagens incluídas no conjunto de dados GTFS estáticos do companheiro. Em particular, deve incluir dados para áreas urbanas de alta densidade e alto tráfego e rotas movimentadas.

## Recomendações Práticas Organizadas por Mensagem

### FeedHeader

| Nome do campo           | Recomendação                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `gtfs_realtime_version` | A versão atual é "2.0".  Todas as alimentações GTFS Realtime devem ser "2.0" ou superior, pois a versão inicial do GTFS Realtime não exigia todos os campos necessários para representar várias situações de trânsito adequadamente.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `timestamp`             | Este carimbo de tempo não deve diminuir entre duas iterações seqüenciais de alimentação.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                         | Este valor de carimbo de tempo deve sempre mudar se o conteúdo da alimentação mudar - o conteúdo da alimentação não deve mudar sem atualizar o cabeçalho. `timestamp`.<br/><br/>*Erros comuns* - Se houver múltiplas instâncias de alimentação GTFS Realtime por trás de um equilibrador de carga, cada instância pode estar puxando informações da fonte de dados Realtime e publicando-as aos consumidores ligeiramente fora de sincronia. Se um consumidor GTFS Realtime faz duas solicitações back-to-back, e cada solicitação é atendida por uma instância diferente de alimentação GTFS Realtime, o mesmo conteúdo de alimentação poderia potencialmente ser devolvido ao consumidor com carimbos de tempo diferentes.<br/><br/>*Solução possível* - Os produtores devem fornecer um `Last-Modified` cabeçalho HTTP, e os consumidores devem passar seu mais recente `If-Modified-Since` Cabeçalho HTTP para evitar o recebimento de dados obsoletos.<br/><br/>*Possível solução* - Se os cabeçalhos HTTP não puderem ser usados, opções como sessões adesivas podem ser usadas para garantir que cada consumidor seja encaminhado para o mesmo servidor produtor. |

### FeedEntity

Todas as entidades só devem ser removidas de um feed GTFS Realtime quando não forem mais relevantes para os usuários. As rações são consideradas como sem estado, o que significa que cada ração reflete todo o estado em tempo real do sistema de trânsito. Se uma entidade é fornecida em uma instância de alimentação, mas é descartada em uma atualização de alimentação subseqüente, deve ser assumido que não há informação em tempo real para essa entidade.

| Nome do campo | Recomendação                                                  |
| ------------- | ------------------------------------------------------------- |
| `id`          | Deve ser mantido estável ao longo de toda a duração da viagem |

### TripUpdate

Diretrizes gerais para cancelamentos de viagens:

* Ao cancelar viagens durante vários dias, os produtores devem fornecer TripUpdates referenciando os `trip_ids` e `start_dates` como `CANCELADO`, bem como um Alerta com `NO_SERVICE` referenciando os mesmos `trip_ids` e `TimeRange` que podem ser mostrados aos cavaleiros explicando o cancelamento (por exemplo, desvio).
* Se nenhuma parada em uma viagem será visitada, a viagem deve ser `CANCELADA` em vez de ter todas as `paradas_time_updates` sendo marcadas como `SKIPPED`.

| Nome do campo      | Recomendação                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `trip`             | Consultar [mensagem TripDescriptor](#TripDescriptor).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                    | Se separado `VehiclePosition` e `TripUpdate` são fornecidas rações, [TripDescriptor](#TripDescriptor) e [VehicleDescriptor](#VehicleDescriptor) Os valores de identificação devem coincidir entre as duas alimentações.<br/><br/>Por exemplo, um `VehiclePosition` entidade tem `vehicle_id:A` e `trip_id:4`então o correspondente `TripUpdate` entidade também deveria ter `vehicle_id:A` e `trip_id:4`. Se houver `TripUpdate` entidade tem `trip_id:4` e qualquer `vehicle_id` além de 4, isto é um erro.                                                                                                          |
| `vehicle`          | Consulte [mensagem VehicleDescriptor](#VehicleDescriptor).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|                    | Se separado `VehiclePosition` e `TripUpdate` são fornecidas rações, [TripDescriptor](#TripDescriptor) e [VehicleDescriptor](#VehicleDescriptor) O emparelhamento dos valores de identificação deve coincidir entre as duas alimentações.<br/><br/>Por exemplo, um `VehiclePosition` entidade tem `vehicle_id:A` e `trip_id:4`então o correspondente `TripUpdate` entidade também deveria ter `vehicle_id:A` e `trip_id:4`. Se houver `TripUpdate` entidade tem `trip_id:4` e qualquer `vehicle_id` além do 4, isto é um erro.                                                                                         |
| `stop_time_update` | `stop_time_updates` para um determinado `trip_id` deve ser rigorosamente ordenado aumentando `stop_sequence` e não `stop_sequence` deve ser repetido.                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|                    | Enquanto a viagem estiver em andamento, todos `TripUpdates` deve incluir pelo menos um `stop_time_update` com uma hora prevista de chegada ou partida no futuro. Note que o [GTFS Especificações Realtime ](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates) diz que os produtores não devem deixar cair um passado `StopTimeUpdate` se se refere a uma parada com horário de chegada programado no futuro para a viagem em questão (ou seja, o veículo passou a parada antes do Schedule), caso contrário, conclui-se que não há atualização para esta parada. |
| `timestamp`        | Deve refletir a hora em que esta previsão para esta viagem foi atualizada.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `delay`            | `TripUpdate.delay` Deve representar o desvio do Schedule, ou seja, o valor observado no passado para a antecipação/atraso do Schedule veículo. As previsões para futuras paradas devem ser fornecidas através de `StopTimeEvent.delay` ou `StopTimeEvent.time`.                                                                                                                                                                                                                                                                                                                                                       |

### TripDescriptor

Se forem fornecidos feeds separados `VehiclePosition` e `TripUpdate`, os valores [TripDescriptor](#TripDescriptor) e [VehicleDescriptor](#VehicleDescriptor) ID emparelhados devem coincidir entre os dois feeds.

Por exemplo, uma entidade `VehiclePosition` tem `vehicle_id:A` e `trip_id`:4, então a entidade `TripUpdate` correspondente também deve ter `vehicle_id:A` e `trip_id`:4.

| Nome do campo           | Recomendação                                                                                                                |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `schedule_relationship` | O comportamento da entidade TripUpdate `ADDED` As viagens não são especificadas e o uso desta enumeração não é recomendado. |

### VehicleDescriptor

Se forem fornecidos valores separados de `VehiclePosition` e `TripUpdate`, os valores de [TripDescriptor](#TripDescriptor) e [VehicleDescriptor](#VehicleDescriptor) ID emparelhados devem combinar entre os dois feeds.

Por exemplo, uma entidade `VehiclePosition` tem `veículo-id:A` e `trip_id`:4, então a entidade `TripUpdate` correspondente também deve ter `veículo-id:A` e `trip_id`:4.

| Nome do campo | Recomendação                                                                              |
| ------------- | ----------------------------------------------------------------------------------------- |
| `id`          | Deve identificar de forma única e estável um veículo ao longo de toda a duração da viagem |

### StopTimeUpdate

| Nome do campo   | Recomendação                                                                                                                                                                                                                                       |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `stop_sequence` | Fornecer `stop_sequence` sempre que possível, já que resolve sem ambigüidade o tempo de parada do GTFS em `stop_times.txt` ao contrário de `stop_id`que pode ocorrer mais de uma vez em uma viagem (por exemplo, rota de laço).                    |
| `arrival`       | Os tempos de chegada entre paradas seqüenciais devem aumentar - não devem ser os mesmos ou diminuir.                                                                                                                                               |
|                 | Chegada `time` (especificado em [StopTimeEvent](#StopTimeEvent)) deve ser antes da partida `time` para a mesma parada se for esperada uma parada ou tempo de permanência - caso contrário, chegada `time` deve ser o mesmo que a partida `time`.   |
| `departure`     | Os tempos de partida entre paradas seqüenciais devem aumentar - não devem ser os mesmos ou diminuir.                                                                                                                                               |
|                 | Partida `time` (especificado em [StopTimeEvent](#StopTimeEvent)) deve ser o mesmo que a chegada `time` para a mesma parada, caso não se espere tempo de parada ou de permanência - caso contrário, partida `time` deve ser após a chegada `time` . |

### StopTimeEvent

| Nome do campo | Recomendação                                                                                                                                                                                                                                                                                                                                                                                                           |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `delay`       | Se ao menos `delay` é fornecido em um `stop_time_update` `arrival` ou `departure` (e não `time`), depois o GTFS [`stop_times.txt`](https://gtfs.org/reference/static#stopstxt) deve conter `arrival_times` e/ou `departure_times` para estas paradas correspondentes. A `delay` na alimentação Realtime não tem sentido, a menos que você tenha um tempo de relógio para adicioná-lo no GTFS `stop_times.txt` arquivo. |

### VehiclePosition

A seguir estão os campos recomendados que devem ser incluídos para uma alimentação VehiclePostions para fornecer aos consumidores dados de alta qualidade (por exemplo, para gerar previsões)

| Nome do campo        | Notas                                                                                                                                                                                                                                                                                                                |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity.id`          | Deve ser mantido estável durante toda a duração da viagem                                                                                                                                                                                                                                                            |
| `vehicle.timestamp`  | Recomenda-se vivamente a indicação da hora em que a posição do veículo foi medida. Caso contrário, os consumidores devem usar o carimbo de data/hora da mensagem, o que pode ter resultados enganosos para os motociclistas quando a última mensagem foi atualizada com mais freqüência do que a posição individual. |
| `vehicle.vehicle.id` | Deve identificar de forma única e estável um veículo ao longo de toda a duração da viagem                                                                                                                                                                                                                            |

### Posição

A posição do veículo deve estar a 200 metros dos dados GTFS `shapes.txt` para a viagem atual, a menos que haja um alerta com o efeito do `DETOUR` para esta `trip_id`.

### Alerta

Diretrizes gerais para alertas:

* Quando o `trip_id` e `start_time` estão dentro do intervalo `exato_time=1`, o `start_time` deve ser posterior ao início do intervalo por um múltiplo exato de `headway_secs`.
* Ao cancelar viagens durante vários dias, os produtores devem fornecer TripUpdates referenciando os `trip_ids` e `start_dates` como `CANCELADO`, bem como um Alerta com `NO_SERVICE` referenciando os mesmos `trip_ids` e `TimeRange` que podem ser mostrados aos cavaleiros explicando o cancelamento (por exemplo, desvio).
* Se um alerta afetar todas as paradas em uma linha, use um alerta baseado em linha ao invés de um alerta baseado em parada. Não aplique o alerta a todas as paradas da linha.
* Embora não haja limite de caracteres para alertas de serviço, os pilotos de trânsito freqüentemente estarão visualizando alertas em dispositivos móveis. Por favor, seja conciso.

| Nome do campo      | Recomendação                                                              |
| ------------------ | ------------------------------------------------------------------------- |
| `description_text` | Use quebras de linha para tornar seu alerta de serviço mais fácil de ler. |

## Recomendações Práticas Organizadas por Caso de Uso

### Viagens com base na freqüência

Uma viagem baseada em freqüência não segue um Schedule fixo, mas tenta manter um avanço pré-determinado. Estas viagens são indicadas em [GTFS.org/reference/static/#frequenciestxt">GTFS](<https://\<glossary variable=>) frequency.txt, definindo `tempos_exatos=0` ou omitindo o campo de `tempos_exatos` (note que `tempos_exatos=1` viagens *NÃO* são viagens baseadas em freqüência - `frequencies.txt` com `tempos_exatos=1` é simplesmente usado como um método de conveniência para armazenar viagens Schedule de uma forma mais compacta). Há várias melhores práticas a serem observadas na construção de alimentações GTFS Realtime para viagens baseadas em freqüência.

* Em [TripUpdate.StopTimeUpdate](#StopTimeUpdate), o [StopTimeEvent](#StopTimeEvent) para `chegada` e `partida` não deve conter `atrasos` porque as viagens baseadas em freqüência não seguem um Schedule fixo. Em vez disso, deve ser fornecido `tempo` para indicar as previsões de chegada/partida.

* Como requerido pela especificação, ao descrever a `viagem` em [TripUpdate](#TripUpdate) ou [VehiclePosition](#VehiclePosition) usando [TripDescriptor](#TripDescriptor), todos os `trip_id`, `start_time`, e `start_date` devem ser fornecidos. Além disso, o `horário_de_relação` deve ser `UNSCHEDULED`.

(por exemplo, viagens de reforço).

## Sobre este documento

### Objetivos

Os objetivos de manter as melhores práticas Realtime do GTFS são:

* Melhorar a experiência do usuário final em aplicativos de transporte público
* Facilitar aos desenvolvedores de software a implantação e a escala de aplicações, produtos e serviços

### Como propor ou alterar as Melhores Práticas publicadas do GTFS Realtime

As aplicações e práticasGTFS evoluem, e por isso este documento pode precisar ser emendado de tempos em tempos. Para propor uma emenda a este documento, abra um pedido de emenda [no repositório GitHub do GTFS Realtime](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) Best Practices e defenda a mudança.

### Ligação com este documento

Por favor, faça um link aqui para fornecer aos produtores de ração orientações para a formação correta dos dados GTFS Realtime. Cada recomendação individual tem um link de ancoragem. Clique na recomendação para obter a URL para o link da âncora na página.

Se uma aplicação GTFS Realtime faz exigências ou recomendações para práticas de dados GTFS Realtime que não são descritas aqui, recomenda-se publicar um documento com essas exigências ou recomendações para complementar essas melhores práticas comuns.
