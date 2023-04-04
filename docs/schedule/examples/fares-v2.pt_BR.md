# Fares V2

<hr/>

Fares V2 é um projeto de extensão GTFS que tem como objetivo abordar as limitações dos Fares V1. Este projeto de extensão está sendo adotado em iterações. Os exemplos abaixo descrevem como modelar conceitos básicos, incluindo produtos tarifários e como os cavaleiros podem usar suas tarifas para transferências. Veja mais informações sobre [o projeto de extensão Fares V2 aqui](/extensions/fares-v2/).

Entretanto, os produtores podem implementar Fares V2 juntamente com a implementação das Fares V1 no mesmo conjunto de dados, pois não existe nenhum conflito técnico entre os dois. Com a adoção e aprovação suficiente das Fares V2, Fares V1 poderão ser depreciadas no futuro.

## Definir uma tarifa de trânsito

Há várias maneiras de pagar as tarifas para utilizar o sistema de Administração de Trânsito de Maryland. <a href="https://www.mta.maryland.gov/regular-fares" target="_blank">Existem quatro tipos de opções tarifárias regulares completo:</a>

- Bilhete de ida que custa $2,00 USD
- Passe de dia que custa $4,60 USD
- Passe semanal que custa $22 USD
- Um passe mensal que custa $77 USD

Os bilhetes de trânsito ou tarifas são referidos como produtos tarifários em GTFS. Eles podem ser descritos usando o arquivo [fare_products.txt](../../reference/#fare_productstxt) Cada entrada corresponde a uma tarifa específica.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id        | fare_product_name          | amount    | currency |
| ---------------------- | ---------------------------------- |-------|----------|
| core_local_oneway_fare | One Way Full Fare             | 2.00  | USD      |
| core_local_1_day_fare  | 1-Day Pass - Core Service   | 4.60  | USD      |
| core_local_31_day_fare | 31-Day Pass - Core Service | 77.00 | USD      |
| core_local_7_day_fare  | 7-Day Pass - Core Service  | 22.00 | USD      |

<sup><a href="https://feeds.mta.maryland.gov/gtfs/local-bus">Faça o download da alimentação local do ônibus GTFS da Maryland Transit Administration</a></sup>

<hr/>

## Criar regras para viagens de ida simples

No GTFS, um percurso tarifário corresponde a uma viagem que um cavaleiro faz sem transferir entre diferentes modos, rotas, redes ou agências. Na alimentação da Maryland Transit Administration, uma única tarifa permite aos cavaleiros viajar dentro de qualquer par de paradas e estações de metrô dentro da rede `core` de ônibus BaltimoreLink, Light RailLink e rotas Metro MetroLink.

Os grupos de perna definem viagens dentro de uma rede desde uma origem até um destino (ou um conjunto de origens até um conjunto de destinos se os IDs de área corresponderem a paradas agrupadas). O arquivo abaixo descreve as regras para viajar para qualquer lugar dentro da rede principal da Administração de Trânsito de Maryland. Cada regra corresponde a um dos produtos tarifários regulares no [exemplo Defina uma tarifa de trânsito](#definir-uma-tarifa-de-transito).

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id            | network_id | fare_product_id        |
| ----------------------- |------------| ---------------------- |
| core_local_one_way_trip | core         | core_local_oneway_fare |
| core_local_one_way_trip | core     | core_local_1_day_fare  |
| core_local_one_way_trip | core      | core_local_31_day_fare |
| core_local_one_way_trip | core      | core_local_7_day_fare  |

<sup><a href="https://feeds.mta.maryland.gov/gtfs/local-bus">Faça o download da alimentação local do ônibus GTFS da Maryland Transit Administration</a></sup>

<hr/>

## Criar regras para transferências

Há uma transferência de 90 minutos para os motociclistas que compram uma tarifa só de ida para andar em ônibus locais BaltimoreLink, Metro SubwayLink ou Light RailLink. Isto significa que eles podem transferir um número ilimitado de vezes entre os ônibus locais, o metrô e o light rail dentro do prazo de 90 minutos.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id       | to_leg_group_id         | duration_limit | duration_limit_type | tipo_transferência_de_tarifa | transfer_count |
| ----------------------- | ----------------------- | -------------- | ------------------- | ---------------------------- | -------------- |
| core_local_one_way_trip | core_local_one_way_trip | 5400           | 1                   | 0                            | -1             |

O arquivo acima representa isto em GTFS com os seguintes campos:

- É possível uma transferência de e para pernas que são uma viagem de ida (`core_local_one_way_trip`)
- A `transfer_count` é fixada em `-1`, já que não há limite para o número de transferências permitidas
- O `duration_limit` é fixado em `5400` segundos, o que equivale a 90 minutos
- O `duration_limit_type` é definido como `1`, uma vez que o tempo de transferência começa quando o cavaleiro parte em qualquer rota no trajecto de tarifa de `core_local_one_way_trip` e termina quando ele parte em um trajecto de tarifa diferente.
- O `fare_transfer_type` é ajustado para `0`, já que os pilotos só pagam pela primeira tarifa. Não há taxa de transferência ou uma segunda tarifa para a transferência dentro da janela de 90 minutos. Portanto, o custo pode ser modelado como a soma da primeira tarifa e as somas das taxas de transferência.
- O `transfer_count` é definido como `-1`, pois o passageiro pode transferir um número ilimitado de vezes dentro da janela de 90 minutos de `duration_limit`.

Depois de definir a tarifa, criar a `fare_leg_rule` apropriada e definir a `fare_transfer_rule`, você pode ver a tarifa de $2,00 USD `core_local_oneway_fare` aparecer nos planejadores de viagem. Aqui está um exemplo da Transit:

<div class="flex-photos">
    <img src="../../../assets/transit-fares-mdot.png" alt="fare of $2 USD">
</div>

<sup><a href="https://feeds.mta.maryland.gov/gtfs/local-bus">Faça o download da alimentação local do ônibus GTFS da Maryland Transit Administration</a></sup>

## Descrever locais de serviço na mesma zona tarifária

Algumas agências de trânsito operam uma estrutura tarifária baseada em zonas. As zonas tarifárias são áreas geográficas divididas associadas a diferentes preços tarifários. No sistema BART da Bay Area, as tarifas são diferentes dependendo da origem e do destino [(diferenças tarifárias BART)](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf), e os passageiros em trânsito precisarão saber a tarifa certa. As áreas tarifárias podem ser descritas usando o arquivo [stops_areas.txt](../../reference/#stops_areastxt), que atribui as paradas dos [stops.txt](../../reference/#stopstxt) às [areas.txt](../../reference/#areastxt).

Primeiro, identifique a área em [areas.txt](../../reference/#areastxt). É aceitável deixar o `area_name` em branco se não houver nome da área. Na tabela abaixo, há três `area_id` - `ASHB`, `GLEN`, e `OAKL`.

[**areas.txt**](../../reference/#areastxt)

| area_id | area_name |
| ------- | --------- |
| ASHB    |           |
| GLEN    |           |
| OAKL    |           |

Depois, usando o `stop_id` do arquivo [stops.txt](../../reference/#stopstxt), agrupar paradas em sua respectiva área identificada (zona tarifária).

Em seguida, o grupo `stop_id` para cada `area_id`. No exemplo BART, cada área contém apenas 1 `stop_id`. Por exemplo, apenas a parada `ASHB` (Estação Ashby) está incluída na área `ASHB`. No entanto, se uma área inclui múltiplas paradas, múltiplas `stop_id` devem ser listadas.

[**stops_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
| ------- | ------- |
| ASHB    | ASHB    |
| GLEN    | GLEN    |
| OAKL    | OAKL    |

Em `fare_leg_rules.txt`, diferentes produtos tarifários podem ser identificados com base em diferentes áreas de partida e chegada. Por exemplo, a primeira entrada aparece:

- A área de saída é `ASHB`
- A área de chegada é `GLEN`
- O produto tarifário para a área de partida/chegada é `BA:matrix:ASHB-GLEN`

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id | to_area_id | fare_product_id     |
| ------------ | ------------ | ---------- |---------------------|
| BA           | ASHB         | GLEN       | BA:matrix:ASHB-GLEN |
| BA           | ASKB         | OAKL       | BA:matrix:ASHB-OAKL |

A tarifa é identificada em `fare_products.txt`

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name | amount | currency |
|---------------------| ------------------------- |--------|----------|
| BA:matrix:ASHB-GLEN | generated                   | 4.75   | USD      |
| BA:matrix:ASHB-OAKL | generated                    | 9.45   | USD      |

<sup><a href="https://511.org/open-data/transit" target="_blank">Veja a alimentação regional da área da Baía de São Francisco</a></sup>

<hr/>

## Descrever quais são os meios de comunicação tarifários aceitos

Os pilotos de São Francisco Muni podem usar vários tipos diferentes de mídia de tarifas para pagar sua viagem e validar sua tarifa:

- Use um <a href="https://www.clippercard.com/ClipperWeb/" target="_blank">cartão Clipper</a>, o cartão de trânsito da Bay Area
- Use o <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">aplicativo Munimobile</a>
- Pagar a tarifa em dinheiro

Estes métodos de validação são referidos como `fare_media` em GTFS-Fares V2 e podem ser descritos usando `fare_media.txt`.

Abaixo está um exemplo de um trecho da <a href="https://511.org/open-data/transit" target="_blank">Alimentação Regional da Baía de São Francisco</a> que pode ser acessado com o 511 SF Bay API.

`Clipper` é descrito como um cartão de trânsito físico com `fare_media_type=2`. `SFMTA Munimobile` é descrito como um aplicativo móvel com `fare_media_type=2`. O `Cash` não tem meios tarifários, uma vez que é entregue diretamente ao motorista sem bilhete. Como resultado, o `Cash` é `fare_media_type=0`.

Os produtores que desejam descrever um bilhete físico como um tipo de mídia tarifária podem usar a opção experimental `fare_media_type=1` que está na <a href="https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd" target="_blank">proposta completo Fares V2</a>.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|--------------|------------------| --------------- |
| cortador     | Clipper          | 2               |
| munimobile   | SFMTA MuniMobile | 4               |
| cash         | Cash             | 0               |

<sup><a href="https://511.org/open-data/transit" target="_blank">Veja a alimentação regional da área da Baía de São Francisco</a></sup>

## Definir as diferenças de preço com base na mídia tarifária

O preço da passagem da Muni é diferente com base no meio de transporte que o cavaleiro utiliza. Este exemplo cobrirá como o preço da tarifa local para adultos muda ao usar dinheiro ou cartão Clipper. Uma tarifa local para adultos paga com dinheiro custa 3 USD e a mesma tarifa paga com o cartão Clipper custa 2,50, 50 centavos a menos.

Cada entrada abaixo descreve uma mídia tarifária.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name | fare_media_type |
|---------------|-----------------| --------------- |
| cortador      | Clipper         | 2               |
| cash          | Cash            | 0               |

O trecho do arquivo `fare_products.txt` abaixo mostra como a quantidade do produto `Muni single local fare` varia dependendo da mídia tarifária que o cavaleiro utiliza.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | amount | currency | fare_media_id |
| --------------- | ------------------------- |------|----------| ------------- |
| SF:local:single | Muni single local fare  | 3    | USD      | dinheiro      |
| SF:local:single | Muni single local fare   | 2.5  | USD      | cortador      |

No Apple Maps, os cavaleiros podem ver como o preço de suas passagens muda. Você pode comparar os preços das tarifas sob a instrução "Board the Muni J Church train":

<div class="flex-photos">
    <img src="../../../assets/apple-muni-cash.jpg" alt="cash fare of $3 USD">
    <img src="../../../assets/apple-muni-clipper.jpg" alt="Clipper card fare of $2.50 USD">
</div>

<sup><a href="https://511.org/open-data/transit" target="_blank">Veja a alimentação regional da área da Baía de São Francisco</a></sup>

## Descrever uma opção de tarifa sem contato de mídia

[A Clean Air Express no norte do condado de Santa Bárbara aceita pagamento sem contato](https://vimeo.com/539436401) por cartão de crédito, Google Pay e Apple Pay.

Na alimentação Clean Air Express, há uma mídia de tarifa `tap_to_ride` com um `fare_media_type=3`, já que é uma opção cEMV (contactless Europay, Mastercard e Visa).

| fare_media_id | fare_media_name    | fare_media_type |
| ------------- | ------------------ | --------------- |
| tap_to_ride   | Tap to Ride | 3               |

O produto de tarifa de passeio único mostrado abaixo tem opções de `cash` e de mídia `tap-to-ride`. Quando a tarifa de passeio simples é paga com a mídia `tap-to-ride`, ela é um dólar americano mais barata.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | fare_media_id | amount | currency |
| --------------- | ------------------------- | ------------- |--------| -- |
| single-ride    | Single Ride             | tap_to_ride   | 6      | USD |
| single-ride    | Single Ride            |               | 7      | USD |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">Baixe a alimentação Clean Air Express</a></sup>
