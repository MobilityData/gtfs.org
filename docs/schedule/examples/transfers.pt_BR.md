# Transferências

<hr/>

## Transferências em bloco

A transferência em bloco, também chamada de transferência no assento, está disponível quando um conjunto de viagens atende às seguintes condições:

1. As viagens são consecutivas.
2. O mesmo veículo opera as duas viagens.
3. As viagens são provisionadas com o mesmo valor `block_id` no arquivo [trips.txt](../../reference/#tripstxt) no feed de trânsito.

### Use `block_id` para ativar as transferências em bloco

As transferências de bloco podem ser feitas entre viagens consecutivas em rotas diferentes ou na mesma rota se a rota for uma linha de loop. Use o campo `block_id` para especificar quais viagens estão em um bloco e onde as transferências no assento são uma opção disponível.

Por exemplo, considere os seguintes valores de [trips.txt](../../reference/#tripstxt) e [stop_times.txt](../../reference/#stoptimestxt):

[**trips.txt**](../../reference/#tripstxt)

| route_id | trip_id     | block_id |
| -------- | ----------- |----------|
| RouteA    | RouteATrip1  | Block1   |
| RouteB    | RouteBTrip1 | Block1   |

[**stop_times.txt**](../../reference/#stoptimestxt)

| trip_id     | arrival_time | departure_time | stop_id | stop_sequence |
| ----------- | --------------- | --------------- | ------- | ------------- |
| RouteATrip1  | 12:00:00        | 12:01:00        | A       | 1             |
| RouteATrip1  | 12:05:00        | 12:06:00        | B       | 2             |
| RouteATrip1  | 12:15:00        |                 | C       | 3             |
| RouteBTrip1 |                 | 12:18:00        | C       | 1             |
| RouteBTrip1 | 12:22:00        | 12:23:00        | D       | 2             |
| RouteBTrip1 | 12:30:00        |                 | E       | 3             |

Neste exemplo:

- Um usuário que busca uma rota da parada A para a parada E é orientado a embarcar na parada A às 12:00 na Rota A e a permanecer no veículo quando ele chegar à parada C após o fim da `RouteTrip1`. Isso se deve ao fato de que o mesmo veículo atende a `RouteBTrip1` para a Route B.
- Os passageiros da `RouteATrip1` que quiserem continuar até uma parada na `RouteBTrip1` podem permanecer no veículo para essa transferência.
- Os passageiros de outras viagens em outros veículos ao longo dessas mesmas rotas não têm essa opção porque usam veículos diferentes para cada viagem.

### Transferência de bloco em uma linha de loop

Em uma linha de loop, a primeira parada e a última parada de uma viagem são as mesmas e têm o mesmo `stop_id`. Desde que viagens consecutivas em loop tenham o mesmo `block_id`, a transferência em bloco ou no assento é ativada, o que permite que os passageiros da primeira viagem permaneçam no veículo quando ele continuar no próximo loop.
