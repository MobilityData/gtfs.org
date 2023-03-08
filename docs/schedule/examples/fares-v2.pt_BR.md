---
search:
  exclude: true
---

# Fares V2

<hr/>

Fares V2 é um projeto de extensão GTFS que tem como objetivo abordar as limitações dos Fares V1. Este projeto de extensão está sendo adotado em iterações, e os exemplos abaixo mostram o que pode ser modelado usando a parte das Fares V2 que foi adotada na especificação oficial. Veja mais informações sobre o projeto de [extensão das Fares V2](../../../extensions/fares-v2).

Entretanto, os produtores podem implementar Fares V2 juntamente com a implementação das Fares V1 no mesmo conjunto de dados, pois não existe nenhum conflito técnico entre os dois. Com a adoção e aprovação suficiente das Fares V2, Fares V1 poderão ser depreciadas no futuro.

## Definir uma tarifa de trânsito

Há várias maneiras de pagar as tarifas para usar o sistema de trânsito TTC em Toronto. O TTC oferece duas opções de preços de tarifas, dependendo do método de pagamento. Uma tarifa de adulto é de 3,20 CAD para viajar se usar um cartão PRESTO, enquanto a mesma tarifa é de 3 ,25 CAD para viajar se pagar em dinheiro.

Os bilhetes de trânsito ou tarifas podem ser descritos usando o arquivo [fare_products.txt](../../reference/#fare_productstxt) Cada entrada corresponde a uma tarifa específica.

[**fare_products.txt**](../../reference/#fare_productstxt)

    fare_product_id,fare_product_name,amount,currency
    presto_fare,PRESTO Card Fare,3.2,CAD
    cash_fare,Cash Fare,3.25,CAD

[Exemplo de fonte](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Descrever locais de serviço na mesma zona tarifária

Algumas agências de trânsito operam uma estrutura tarifária baseada em zonas. As zonas tarifárias são áreas geográficas divididas associadas a diferentes preços tarifários. Quer estejam viajando dentro de uma única zona ou de uma zona para outra, os passageiros em trânsito precisarão saber a tarifa certa. No sistema TTC de Toronto, há apenas uma zona tarifária. Os passageiros em trânsito simplesmente precisam pagar a mesma tarifa de passagem única para qualquer distância de trip dentro dos limites da cidade de Toronto, não importa qual forma de trânsito seja utilizada.

As zonas tarifárias podem ser descritas utilizando o arquivo [stops_areas.txt](../../reference/#stops_areastxt), que atribui paradas de [stops.txt](../../reference/#stopstxt) a [areas.txt](../../reference/#areastxt).

Primeiro, identificar a área (zona tarifária).

[**areas.txt**](../../reference/#areastxt)

    area_id,area_name
    ttc_service_area,TTC Fare Zone

Depois, usando o `stop_id` do arquivo [stops.txt](../../reference/#stopstxt), agrupar paradas em sua respectiva área identificada (zona tarifária).

[**stops_areas.txt**](../../reference/#stops_areastxt)

    area_id,stop_id
    ttc_service_area,262
    ttc_service_area,263
    ttc_service_area,264
    ttc_service_area,265
    ttc_service_area,266
    …

[Exemplo de fonte](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)

<hr/>

## Criar regras para viagens de ida simples

Em GTFS, uma tarifa corresponde a uma trip que um cavaleiro faz sem transferir entre diferentes modos, rotas, redes ou agências. Uma única tarifa permite aos cavaleiros viajar dentro de qualquer par de paradas de ônibus, estações de metrô e paradas de bondes dentro da rede do TTC.

Os grupos de pernadas definem viagens dentro de uma rede desde uma origem até um destino (ou um conjunto de origens até um conjunto de destinos se as identificações de área corresponderem a paradas agrupadas). O arquivo abaixo descreve duas regras para viajar para qualquer lugar dentro da rede do TTC. A primeira regra corresponde a viajar usando uma tarifa PRESTO e a segunda corresponde a viajar usando uma tarifa de dinheiro.

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

    leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
    ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
    ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare

[Exemplo de fonte](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Criar regras para transferências

Os cavaleiros que usam seu cartão PRESTO para montar o TTC têm uma janela de transferência sem restrições de 2 horas. Isto significa que eles podem transferir um número ilimitado de vezes entre os ônibus, metrôs e bondes da agência dentro do período de 2 horas.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

    from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
    ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer

O arquivo acima representa isto em GTFS com os seguintes campos:

- É possível uma transferência de e para as pernas que são pagas por um cartão PRESTO (`ttc_trip_presto`)
- A `transfer_count` é fixada em `-1`, já que não há limite para o número de transferências permitidas
- O `duration_limit` é fixado em `7200` segundos, o que equivale a 2 horas
- O `duration_limit_type` é definido como `3`, já que os cavaleiros têm que bater seu cartão PRESTO assim que entrarem na zona de distancia paga ou assim que entrarem em um ônibus ou bonde. Isto corresponde à validação da tarifa de arrival do percurso atual e à validação da tarifa de arrival do percurso seguinte.
- O `fare_transfer_type` é definido como `0`, já que os cavaleiros pagam apenas a primeira tarifa. Não há taxa de transferência ou uma segunda tarifa para a transferência dentro da janela de 2 horas. Portanto, o custo pode ser modelado como a soma da primeira tarifa e as somas das taxas de transferência.
- A taxa de transferência é definida como zero, pois são gratuitas dentro do sistema TTC. Isto é indicado pelo `fare_product_id=free_transfer`.

[Exemplo de fonte](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)
