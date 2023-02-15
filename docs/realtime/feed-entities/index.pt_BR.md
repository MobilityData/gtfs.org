# Entidades de alimentação

O GTFS Realtime suporta três tipos distintos de dados em tempo real, que podem ser combinados com uma única alimentação em tempo real. Os resumos são apresentados abaixo, com a documentação completa na seção correspondente.

## Trip Updates

#### "Ônibus X é atrasado em 5 minutos"

As trip updates representam flutuações no horário. Esperamos receber trip updates para todas as viagens que você programou e que sejam possíveis em tempo real. Estas atualizações dariam uma previsão de chegada ou partida para paradas ao longo da rota. As trip updates também podem fornecer cenários mais complexos onde as viagens são canceladas, acrescentadas ao cronograma ou mesmo redirecionadas.

[Mais sobre Trip Updates...](trip-updates.md)

## Service Alerts

#### "Estação Y está fechada devido à construção"

Os service alerts representam problemas de nível superior com uma determinada entidade e são gerais na forma de uma descrição textual da interrupção.

Eles podem representar problemas com:

*   Estações
*   Linhas
*   Toda a rede
*   etc.

Um service alert consistirá geralmente em algum texto que descreverá o problema, e também permitimos URLs para mais informações, bem como informações mais estruturadas para nos ajudar a entender quem este service alert afeta.

[Mais sobre Service Alerts...](service-alerts.md)

## Vehicle Positions

#### "Este ônibus está na posição X no horário Y"

A vehicle position representa algumas informações básicas sobre um veículo em particular na rede.

O mais importante é a latitude e longitude em que o veículo se encontra, mas também podemos armazenar dados sobre a velocidade atual e as leituras do odômetro do veículo.

[Mais sobre Vehicle Positions...](vehicle-positions.md)

## Observação histórica sobre os tipos de alimentação

As primeiras versões do GTFS Realtime Specification exigiam que cada alimentação contivesse apenas um tipo único de entidades. Um exemplo de ferramenta para converter de um esquema fundido para o esquema de alimentação por tipo está localizado no repositório GitHub do Bliksem Labs [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py).
