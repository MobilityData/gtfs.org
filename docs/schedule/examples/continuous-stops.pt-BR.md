---
search:
  exclude: true
---

# Paradas contínuas

<hr/>

## Pegar e deixar em qualquer lugar

A agência de trânsito The Current (Rockingham, US-VT) aplica uma política de parada contínua nas rotas 2, 53, e 55. Um passageiro pode ser pego e largado entre paradas programadas ao longo da rota, desde que haja um local seguro para o ônibus parar.

O arquivo [routes.txt](../../reference/#routestxt) é usado para descrever este serviço usando os campos `continuous_pickup` e `continuous_drop_off`. Os campos são ajustados para `0` para indicar que a coleta e a largada_continua são permitidas.

[**routes.txt**](../../reference/#routestxt)

    route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
    2,2,Bellows Falls In-Town,3,0,0
    53,53,Bellows Falls / Battleboro Commuter,3,0,0
    55,55,Bellows Falls / Springfield Shuttle,3,0,0

[Exemplo de fonte](https://crtransit.org/bus-schedules/)

<hr/>

## Pegar e largar em um trecho do itinerário

A agência de trânsito Victor Valley Transit (Victorville, US-CA) aplica uma política de parada contínua somente em uma parte da rota 22. Um passageiro pode embarcar e descer do ônibus em qualquer local seguro dentro da zona de tarifas do condado somente. Não é possível fazer coletas e descidas contínuas dentro da zona de tarifas locais.

A zona de Tarifa Local e a zona de Tarifa do Município são separadas pela Via Aérea Expressa, como mostrado na figura abaixo. A parada da National Trails Highway - Air Expressway está localizada um pouco ao norte deste limite. Para ser preciso, a agência de trânsito pode acrescentar uma parada no cruzamento real da rota do ônibus com o limite, a partir do qual a coleta e entrega contínua está disponível. Esta parada pode permanecer não programadas.

![](../../assets/victor-valley-transit.svg)

Isto é descrito usando os arquivos [stops.txt](../../reference/#stopstxt) e [stop_times.txt](../../reference/#stoptimestxt):

- O primeiro arquivo define as paradas ao longo do itinerário
- O segundo arquivo define as regras de coleta e entrega contínua entre as paradas.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon
    A,Victoriaville Transfer Station,34.514356,-117.318323
    B,Dante St & Venus Ave,34.564499,-117.287097
    C,Victorville Transportation Center,34.538433,-117.294703
    X,Local/County Fare Boundary,34.566224,-117.318357
    D,National Trails Highway - Air Expressway,34.567536,-117.319716
    E,Oro Grande Post Office,34.599292,-117.334452
    F,Silver Lakes Market,34.744662,-117.335407

Em [stop_times.txt](../../reference/#stoptimestxt), para uma determinada trip:

- Um registro com `continuous_pickup=0` indica que são permitidas pickups contínuas desde aquela parada até a próxima parada.
- Um registro com `continuous_pickup=1` indica que as coletas contínuas são proibidas a partir dessa parada até a próxima parada

[**stop_times.txt**](../../reference/#stoptimestxt)

    trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
    22NB9AM,A,1,09:00:00,09:00:00,1,1,1
    22NB9AM,B,2,09:14:00,09:14:00,1,1,1
    22NB9AM,C,3,09:21:00,09:21:00,1,1,1
    22NB9AM,X,4,,,0,0,0
    22NB9AM,D,5,09:25:00,09:25:00,0,0,1
    22NB9AM,E,6,09:31:00,09:31:00,0,0,1
    22NB9AM,F,7,09:46:00,09:46:00,0,0,1

A mesma lógica se aplica para o campo `continuous_drop_off`, mas para o caso de drop offs.

No exemplo acima, as paradas A, B, C têm a_pickup_continua e `continuous_drop_off` configuradas para `1`, que proíbem as pickups_continua e as drop offs entre elas. Os batentes `X`, `D`, `E` e `F` têm os campos de `continuous_pickup` e `continuous_drop_off` configurados em `0`, o que permite coletas e drop off_off_continuo entre eles.

[Exemplo de fonte](https://vvta.org/routes/route-22/)
