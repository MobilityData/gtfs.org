---
search:
  exclude: true
---

# Caminhos

<hr/>

## Descrever a localização das entradas e saídas da estação

Com o GTFS, é possível descrever com precisão as estações usando informações sobre entradas e interiores das estações. Este exemplo descreve as seções da estação Waterfront no centro de Vancouver. A estação faz parte da rede Skytrain da cidade e é servida pela Canada Line, a Expo Line, o SeaBus e a West Coast Express. Três entradas de nível de rua permitem que os cavaleiros entrem e saiam da estação. O restante da estação é subterrânea, com um nível de concurso para validação da tarifa e um nível inferior com plataformas.

Primeiro, a localização da estação e suas entradas são definidas em [stops.txt](../../reference/#pathwaystxt)

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

No arquivo acima, o primeiro registro diz respeito à localização da estação, portanto, o `location_type` é definido como `1`. Os outros cinco dizem respeito às três entradas da estação (cinco registros são necessários, já que a entrada de Granville na verdade tem três entradas separadas, uma escada, uma escada rolante e um elevador). Estes cinco registros são definidos como entradas, uma vez que o `location_type` está definido como `3`.

Além disso, o `stop_id` da estação Waterfront está listado em `parent_station` para as entradas a fim de associá-las à estação. As entradas acessíveis têm o conjunto de entradas para `wheelchair_boarding` com `1` e as não acessíveis com `2`.

## Descreva as escadas e escadas rolantes

A entrada da estação Waterfront na rua Granville tem um elevador, uma escada rolante e escadas, as entradas são definidas como nós acima em [stops.txt](../../reference/#stopstxt). Para conectar as entradas às seções internas da estação, nós adicionais têm de ser criados em [stops.txt](../../reference/#stopstxt) sob a `parent_station` estação Waterfront. No arquivo [stops.txt](../../reference/#stopstxt) abaixo, são definidos nós genéricos`(location_type 3`) que correspondem ao fundo da escadaria e escada rolante.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width="700px"/>

Em seguida, o arquivo [pathways.txt](../../reference/#pathwaystxt) é usado para ligar os nós para criar caminhos, onde o primeiro registro liga os nós pertencentes à parte superior e inferior das escadas. O `pathway_mode` é definido como `2` para indicar escadas, e o último campo descreve que os passageiros podem ir para ambos os lados (para cima e para baixo) das escadas.

Da mesma forma, o segundo registro descreve a escada rolante`(pathway_mode` definido como `4`). Como as escadas rolantes só podem se mover em uma direção, o campo `is_bidirecional` é ajustado para `0`, portanto a escada rolante se move em uma direção, do nó `96` para `91` (para cima).

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## Descrever elevadores e caminhos

O elevador da rua Granville leva os passageiros a um caminho no nível do corredor onde end a escada rolante e a escada rolante. O elevador no nível da superfície já está definido como uma entrada de estação acima`stop_id` `92`). Portanto, a porta do elevador no nível do corredor também precisa ser definida.

Além disso, como mostrado na figura abaixo, há uma passarela subterrânea que conecta o fundo das escadas, escada rolante e elevador na rua Granville ao edifício principal da estação. Portanto, dois nós adicionais são criados para definir os trechos da passarela.

<img class="center" src="../../../assets/pathways-2.png" width="500px"/>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width="500px"/>

Finalmente, os nós são conectados entre si para definir o caminho subterrâneo, como mostrado no arquivo [pathways.txt](../../reference/#pathwaystxt) abaixo:

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
