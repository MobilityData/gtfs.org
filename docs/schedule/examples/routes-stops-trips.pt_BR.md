---
search:
  exclude: true
---

# Rotas, paradas e viagens

<hr/>

## Rotas

As rotas estão no centro das operações de trânsito de rotas fixas, pois descrevem o alcance geográfico de uma rede de trânsito. No GTFS, a definição de rotas é o primeiro passo para descrever as operações de uma agência de trânsito.

O primeiro passo é adicionar as informações da agência como mostrado no arquivo [agency.txt](../../reference/#agencytxt) abaixo. Este arquivo contém informações de alto nível sobre a agência.

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
    CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000

Calgary Transit opera LRT, BRT, serviço regular de ônibus, paratransit, e trânsito sob demanda em Calgary, AB. Neste exemplo, são definidas duas rotas, a primeira é um ônibus e a segunda é um LRT. Usando o arquivo [routes.txt](../../reference/#routestxt), a cada rota é atribuída uma id única, e um nome curto, bem como um nome longo para a legibilidade humana.

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
    CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
    CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff

O quinto campo (`route_type`) é usado para diferenciar os tipos de rotas:

- O primeiro é um ônibus, daí `route_type=3`
- O segundo é um LRT, portanto `route_type=0`
- Uma lista completa de valores para o `route_type` pode ser encontrada [aqui](../../reference/#routestxt)

Os campos restantes contêm informações adicionais tais como uma url específica da rota, bem como cores específicas da agência para representar o serviço em um mapa.

<hr/>

## Paradas

Em GTFS, as paradas e estações são descritas usando o arquivo [stops.txt](../../reference/#stopstxt), abaixo, uma parada de ônibus é definida no primeiro registro e uma estação LRT é definida no segundo registro.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
    8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
    6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,0

- `stop_id` é um identificador único
- `stop_code` e `stop_name` normalmente contêm informações voltadas para o cavaleiro
- A localização exata é fornecida usando coordenadas (`stop_lat` e `stop_lon`)
- O sexto campo (`location_type`) é usado para diferenciar as paradas das estações
- O primeiro registro corresponde a uma parada de ônibus, portanto `location_type=0`
- O segundo registro corresponde à estação, portanto `location_type=1`
- Uma lista completa de valores para o `location_type` pode ser encontrada [aqui](../../reference/stopstxt)

<hr/>

## Viagens

Após descrever as rotas da agência, agora é possível descrever as viagens que são servidas por cada rota.

Primeiro, a extensão do serviço precisa ser definida usando o [calendar.txt](../../reference/#calendartxt)

[**calendar.txt**](../../reference/#calendartxt)

    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    weekend_service,0,0,0,0,0,1,1,20220623,20220903

Aqui, um serviço que funciona apenas aos sábados e domingos está sendo descrito, portanto os campos para esses dias são preenchidos com 1, e os campos para os dias restantes são preenchidos com zero. Este serviço funciona de 23 de junho de 2022 até 3 de setembro de 2022, como mostrado sob os campos `start_date` e `end_date`.

Neste exemplo, o arquivo [trips.txt](../../reference/#tripstxt) descreve 3 viagens de fim de semana que são servidas pela rota MAX Orange que foi descrita acima.

[**trips.txt**](../../reference/#tripstxt)

    route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
    303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
    303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
    303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027

- A `route_id` de [routes.txt](../../reference/#routestxt) que corresponde a MAX Orange é listada
- O `service_id` do [calendar.txt](../../reference/#calendartxt) que corresponde aos fins de semana é listado
- Cada registro contém uma id única para cada trip. É fornecido o text do sinal principal, que é o que normalmente é exibido nas placas dentro e fora do ônibus

- O campo `direction_id` permite uma distinção entre viagens da mesma rota que vão em direções diferentes. Por exemplo, distinguindo entre viagens de ida e volta - ou viagens de ida e volta ao sul e viagens de ida e volta ao norte.
- Neste caso, as viagens em direção a Saddletowne têm uma `direction_id=0` e as viagens em direção a Brentwood têm uma `direction_id=1`. Os valores em direction_id não têm significado inerente, eles são usados apenas para atribuir uma direção de viagem em relação a outra
- O `shape_id` de [shapes.txt](../../reference/#shapestxt) que corresponde à rota MAX Orange em direção a Saddletowne é listado para o primeiro registro e o da rota MAX Orange em direção a Brentwood é listado para o segundo e terceiro registros

A `shape_id=3030026` corresponde ao MAX Orange towards Saddletowne. O arquivo abaixo inclui informações sobre os pontos que traçam o percurso, assim como a distância entre esses pontos. Com estas informações, é possível traçar a rota em um mapa para fins de planejamento ou análise da trip.

[**shapes.txt**](../../reference/#shapestxt)

    shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
    3030026,51.086506,-114.132259,10001,0.000
    3030026,51.086558,-114.132371,10002,0.010
    3030026,51.086781,-114.132865,10003,0.052
    3030026,51.086938,-114.133179,10004,0.080
    3030026,51.086953,-114.133205,10005,0.083
    3030026,51.086968,-114.133224,10006,0.085
    3030026,51.086992,-114.133249,10007,0.088
    3030026,51.087029,-114.133275,10008,0.093
    3030026,51.087057,-114.133286,10009,0.096
    3030026,51.087278,-114.133356,10010,0.121
    3030026,51.087036,-114.132864,10011,0.165
    3030026,51.086990,-114.132766,10012,0.173
    3030026,51.086937,-114.132663,10013,0.183

<hr/>

## Exceções de serviço

É possível definir exceções ao serviço como os dias de serviço adicionados (dias especiais) ou dias de serviço removidos (como nenhum serviço em feriados).

Por exemplo, se não houver um serviço agendados no domingo 17 de julho de 2022 - então essa data pode ser removida do `weekend_service` no [calendar.txt](../../reference/#calendartxt), quebrando o serviço em dois:

| Serviço            | Começar    | Fim        |
| ------------------ |------------|------------|
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

No entanto, isto complica o arquivo, já que o `service_id` é quebrado em dois e esta quebra irá em cascata para [trips.txt](../../reference/#tripstxt) Em vez disso, isto pode ser feito de forma mais fácil usando [calendar_dates.txt](../../reference/#calendar_datestxt), como mostrado abaixo:

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

    service_id,date,exception_type
    weekend_service,20220623,2

- O `service_id` `weekend_service` é listado
- A data do serviço removido ou ADDED é listada sob `date` (17 de julho de 2022)
- O campo `exception_type` é definido como 2, o que significa que o serviço é removido para este dia

[Exemplo de fonte](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)
