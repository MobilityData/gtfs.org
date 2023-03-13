# Trip Updates

As trip updates representam flutuações no horário. Esperamos receber trip updates para todas as viagens que você programou e que são programáveis em tempo real. Essas atualizações dariam um horário previsto de chegada ou partida para as paradas ao longo da rota. As trip updates também podem prever cenários mais complexos onde as viagens são canceladas ou acrescentadas ao horário, ou mesmo redirecionadas.

**Lembrete:** Em [GTFS](../../schedule/reference.md), uma viagem é uma seqüência de duas ou mais paradas que ocorrem em um momento específico.

Deve haver **, no máximo,** uma atualização de viagem para cada viagem programada. Caso não haja atualização de viagem para uma viagem programada, concluir-se-á que não há dados em tempo real disponíveis para a viagem. O consumidor de dados **não** deve supor que a viagem esteja sendo realizada em tempo hábil.

Se um veículo estiver servindo várias viagens dentro do mesmo bloco (para mais informações sobre viagens e blocos, consulte o [GTFS trips.txt](../../schedule/reference.md#tripstxt)):

*   a alimentação deve incluir uma TripUpdate para a trip que está sendo servida atualmente pelo vehicle. Os produtores são encorajados a incluir TripUpdate para uma ou mais viagens após a trip atual no bloco deste vehicle se o produtor estiver confiante na qualidade das previsões para estas trip futuras. A inclusão de várias TripUpdates para o mesmo vehicle evita a previsão "pop-in" para os motociclistas quando o vehicle transita de uma trip para outra e também dá aos motociclistas um aviso prévio de atrasos que impactam as viagens posteriores (por exemplo, quando o delay conhecido excede os tempos de parada planejados entre as viagens).
*   as respectivas entidades TripUpdate não precisam ser adicionado à alimentação na mesma ordem em que são agendado no bloco. Por exemplo, se houver viagens com `trip_ids` 1, 2, e 3 que pertençam todas a um bloco, e o vehicle viajar trip 1, então trip 2, e então trip 3, as entidades `trip_update` podem aparecer em qualquer ordem - por exemplo, adicionando trip 2, então trip 1, e então trip 3 é permitida.

## StopTimeUpdate

Uma trip updates consiste em uma ou mais atualizações dos horários de parada do veículo, que são chamadas de [StopTimeUpdates](../reference.md#message-stoptimeupdate). Estas podem ser fornecidas para tempos de parada passados e futuros. Você tem permissão, mas não é obrigado, a deixar cair os tempos de parada passados. Os produtores não devem deixar cair um `StopTimeUpdate` passado se ele se referir a uma parada com uma hora de chegada programada no futuro para a viagem em questão (ou seja, o veículo passou a parada antes do programado), caso contrário se concluirá que não há atualização para esta parada.

Por exemplo, se os seguintes dados aparecerem na alimentação do GTFS-rt:

*   Parada 4 - Prevista às 10:18 (programada para 10:20 - 2 minutos antes)
*   Parada 5 - Prevista às 10:30h (programada às 10:30h - no horário)

...a previsão para a Parada 4 não pode ser descartada da alimentação até 10:21h, mesmo que o ônibus realmente passe a parada às 10:18h. Se o `StopTimeUpdate` para a Parada 4 foi descartado da alimentação às 10:18h ou 10:19h, e o horário de chegada programado é 10:20h, então o consumidor deve assumir que não existe informação em tempo real para a Parada 4 naquele horário, e os dados de programação do GTFS devem ser usados.

Cada [StopTimeUpdate](../reference.md#message-stoptimeupdate) está ligada a uma parada. Normalmente, isto pode ser feito usando tanto uma stop_sequence GTFS ou um stop_id GTFS. Entretanto, caso você esteja fornecendo uma atualização para uma viagem sem um GTFS trip_id, você deve especificar o stop_id como stop_sequence não tem valor. O stop_id ainda deve fazer referência a um stop_id em GTFS. Se o mesmo stop_id for visitado mais de uma vez em uma viagem, então o stop_sequence deve ser fornecido em todas as StopTimeUpdates para aquele stop_id naquela viagem.

A atualização pode fornecer um tempo exato para a **arrival** e/ou **departure** em uma parada no [StopTimeUpdates](../reference.md#message-stoptimeupdate) usando o [StopTimeEvent](../reference.md#message-stoptimeevent). Isto deve conter ou um **time** absoluto ou um **delay** (ou seja, uma compensação do tempo programado em segundos). O atraso só pode ser usado caso a atualização da viagem se refira a uma viagem GTFS programada, em oposição a uma viagem baseada em freqüência. Neste caso, o tempo deve ser igual ao tempo programado + atraso. Você também pode especificar a **uncertainty** da previsão junto com o [StopTimeEvent](../reference.md#message-stoptimeevent), que é discutido com mais detalhes na seção [Uncertainty](#uncertainty) mais abaixo na página.

Para cada [StopTimeUpdate](../reference.md#message-stoptimeupdate), a relação de programação padrão é **scheduled**. (Note que isto é diferente da relação de horário para a viagem). Você pode alterar isso para **skipped** se a parada não for interrompida ou se **no data** se você só tiver dados em tempo real para parte da viagem.

**As atualizações devem ser ordenadas por stop_sequence** (ou stop_ids na ordem em que ocorrem na viagem).

Se uma ou mais paradas estiverem faltando durante a viagem, o `delay` da atualização (ou, se apenas o `time` for fornecido na atualização, um atraso calculado comparando o `time` com o tempo programado no GTFS) é propagado para todas as paradas subseqüentes. Isto significa que a atualização de um tempo de parada para uma determinada parada mudará todas as paradas subseqüentes na ausência de qualquer outra informação. Note que as atualizações com uma relação de programação do `SKIPPED` não interromperão a propagação do atraso, mas as atualizações com relações de programação do `SCHEDULED` (também o valor padrão se a relação de programação não for fornecida) ou `NO_DATA` o farão.

**Exemplo 1**

Para uma viagem com 20 paradas, um [StopTimeUpdate](../reference.md#message-stoptimeupdate) com atraso de chegada e atraso de partida de 0[(StopTimeEvents](../reference.md#message-stoptimeevent)) para a seqüência de paradas da parada atual significa que a viagem está exatamente na hora certa.

**Exemplo 2**

Para a mesma instância de viagem, são fornecidas três [StopTimeUpdate](../reference.md#message-stoptimeupdate):

*   atraso de 300 segundos para stop_sequence 3
*   atraso de 60 segundos para stop_sequence 8
*   [ScheduleRelationship](../reference.md#enum-schedulerelationship) de `NO_DATA` para stop_sequence 10

Isto será interpretado como:

*   stop_sequences 1,2 têm atraso desconhecido.
*   stop_sequences 3,4,5,6,7 têm atraso de 300 segundos.
*   stop_sequences 8,9 têm atraso de 60 segundos.
*   stop_sequences 10,...,20 têm atraso desconhecido.

## TripDescriptor

As informações fornecidas pelo TripDescriptor dependem da relação de programação da viagem que você está atualizando. Há uma série de opções a serem definidas por você:

| _**Valor**_      | _**Comentário**_                                                                                                                                                                                                      |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Scheduled**    | Esta viagem está sendo realizada de acordo com um horário GTFS, ou está perto o suficiente para ainda ser associada a ela.                                                                                            |
| **Added**   | Esta viagem não foi programada e foi acrescentada. Por exemplo, para lidar com a demanda, ou substituir um veículo avariado.                                                                                          |
| **Unscheduled** | Esta viagem está em andamento e nunca está associada a um horário. Por exemplo, se não houver um horário e os ônibus funcionarem em um serviço de transporte.                                                         |
| **Canceled**     | Esta viagem estava programada, mas agora está removida.                                                                                                                                                               |
| **Duplicated**    | Esta nova viagem é uma cópia de uma viagem existente no GTFS estático, exceto pela data e hora de início do serviço. A nova viagem será executada na data e hora de início do serviço especificada em TripProperties. |

Na maioria dos casos, você deve fornecer o trip_id da viagem programada no GTFS com a qual esta atualização se relaciona.

#### Sistemas com trip_ids repetidos

Para sistemas que utilizam trip_ids repetidos, por exemplo, viagens modeladas usando frequencies.txt, ou seja, viagens baseadas em freqüência, o trip_id não é em si mesmo um identificador único de uma única viagem, pois carece de um componente de tempo específico. A fim de identificar tais viagens de forma única dentro do a TripDescriptor, um triplo de identificadores deve ser fornecido:

*   **trip_id**
*   **start_time**
*   **start_date**

start_time deve ser publicado primeiro, e qualquer atualização de alimentação subseqüente deve usar o mesmo start_time ao se referir à mesma viagem. StopTimeUpdates devem ser usados para indicar ajustes; a start_time não tem que ser precisamente a hora de partida da primeira estação, embora deva ser bastante próxima da hora.

Por exemplo, digamos que decidimos às 10:00, 25 de maio de 2015, que uma viagem com o id=T começará no start_time=10:10:00, e forneceremos esta informação no viarealtime feed às 10:01. Às 10:05 sabemos de repente que a viagem começará não às 10:10, mas às 10:13. Em nossa nova alimentação em tempo real ainda podemos identificar estas tripas (T, 2015-05-25, 10:10:00), mas fornecemos um StopTimeUpdate com partida da primeira parada às 10:13:00.

#### Combinação de viagem alternativa

As viagens que não são baseadas em freqüência também podem ser identificadas de forma única pelo a TripDescriptor, incluindo a combinação de:

*   **route_id**
*   **direction_id**
*   **start_time**
*   **start_date**

onde a start_time é a hora de início programada, conforme definido no cronograma estático, desde que a combinação de ids fornecidas resolva uma viagem única.

## Uncertainty

A uncertainty se aplica tanto ao tempo quanto ao valor de atraso de um [StopTimeUpdate](../reference.md#message-stoptimeupdate). A uncertainty especifica aproximadamente o erro esperado no atraso real como um número inteiro em segundos (mas note que o significado estatístico preciso ainda não está definido). É possível que a uncertainty seja 0, por exemplo, para trens que são dirigidos sob controle de tempo computadorizado.

Como exemplo, um ônibus de longa distância que tem um atraso estimado de 15 minutos chegando a sua próxima parada dentro de uma janela de erro de 4 minutos (ou seja, +2 / -2 minutos) terá um valor de Uncertainty de 240.
