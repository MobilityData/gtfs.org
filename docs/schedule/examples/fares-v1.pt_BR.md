---
search:
  exclude: true
---

# Fares V1

<hr/>

Composto de [fare_attributes.txt](../../reference/#fare_attributestxt) e [fare_rules.txt](../../reference/#fare_rulestxt), Fares V1 tem sido historicamente o método oficial para descrever informações tarifárias no GTFS. Entretanto, os dois arquivos são limitados na amplitude de fatores que eles podem descrever eficientemente, e são ambíguos para implementar. O [Fares V2](../../examples/fares-v2/) é um projeto de extensão em desenvolvimento ativo, e tem como objetivo abordar as limitações do Fares V1.

## Definir as regras tarifárias de uma agência

Uma viagem na rede de metrô da Toronto Transit Commission custa $3,20 CAD se os cavaleiros pagarem usando o cartão PRESTO. Os cavaleiros também podem transferir para outras linhas de metrô, bonde ou ônibus operados pelo TTC dentro de uma janela de duas horas.

Este serviço pode ser representado usando os arquivos [fare_attributes.txt](../../reference/#fare_attributestxt), [fare_rules.txt](../../reference/#fare_rulestxt), e [transfers.txt](../../reference/#transferstxt). O primeiro arquivo, [fare_attributes.txt](../../reference/#fare_attributestxt), descreve as tarifas da agência, abaixo é um exemplo para a tarifa presto:

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- O preço da passagem é listado em preço e `currency_type`
- Os cavaleiros têm que pagar sua tarifa nos portões da estação antes de embarcar no metrô. Isto é representado por `payment_method=1`
- As transferências de campo são deixadas em branco para representar transferências ilimitadas
- A `transfer_duration` campo corresponde à janela de transferência de 2 horas (em segundos)

O segundo arquivo, [fare_rules.txt](../../reference/#fare_rulestxt), atribui tarifas para viagens através da ligação de uma tarifa a uma rota, bem como uma origem/destino nessa rota.

Para isso, duas linhas de metrô são definidas abaixo em [routes.txt](../../reference/#routestxt)

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

Neste exemplo, as transferências na estação Bloor-Yonge são modeladas. Para isso, esta estação é modelada como duas paradas separadas, a primeira é a Estação Bloor, que é servida pela Linha 1, e a segunda é a Estação Yonge, que é servida pela Linha 2. Ambas possuem `zone_id=ttc_subway_stations` a fim de agrupar todas as estações de metrô em uma única zona tarifária.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

Em [fare_rules.txt](../../reference/#fare_rulestxt), a tarifa PRESTO é associada tanto às linhas de metrô quanto às estações, usando as seguintes relações:

- Para o `fare_id=presto_fare`, os passageiros podem viajar entre quaisquer duas estações na Linha 1 (`route_id=line1`) e `origin_id=ttc_subway_stations` e `destination_id=ttc_subway_stations`.

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

O terceiro arquivo, [transfers.txt](../../reference/#transferstxt), define os pontos de transferência entre diferentes rotas. Para modelar as transferências na estação Bloor-Yonge, são necessárias duas entradas:

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- Os primeiros modelos transferem da Linha 1 para a Linha 2 usando a estação de `from_route_id` e `to_route_id` estação da Bloor para a estação Yonge.
- O segundo modelo transfere da Linha 2 para a Linha 1, usando o `from_route_id` e o `to_route_id` da estação Yonge para a estação Bloor.
- O valor para `transfer_type` é `0`, já que não há requisitos ou considerações específicas para transferências

[Exemplo de fonte](https://www.ttc.ca/Fares-and-passes)
