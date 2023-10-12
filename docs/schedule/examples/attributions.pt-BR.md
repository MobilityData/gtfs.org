---
search:
  exclude: true
---

# Atribuições do conjunto de dados

<hr/>

## Atribuir dados a um produtor de dados em um conjunto de dados GTFS agregados

Alguns conjuntos de dados GTFS contêm dados agregados de várias fontes, tais como diferentes prestadores de serviços que servem a mesma jurisdição. Em alguns casos, é necessário classificar as agências listadas no [agency.txt](../../reference/#agencytxt) como produtores, operadores ou autoridades.

Por exemplo, o Rejseplanen é um mecanismo de busca de serviços ferroviários e de ônibus na Dinamarca. A empresa publica um conjunto de dados GTFS que contém dados de várias agências e fornecedores, como mostrado abaixo no [agency.txt](../../reference/#agencytxt).

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
    204,FYNBUS,https://fynbus.dk,Europe/Berlin,
    206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
    276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,

A fim de atribuir Rejseplanen como produtor de dados, é utilizado o arquivo [attributions.txt](../../reference/#attributionstxt), onde um id atribuição é definido ao lado do nome e url da organização. Os campos `is_producer`, `is_operator`, e `is_authority` são usados para categorizar Rejseplanen como mostrado abaixo:

[**attributions.txt**](../../reference/#attributionstxt)

    attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
    rp,Rejseplanen,https://www.rejseplanen.dk,1,,

[Exemplo de fonte](http://www.rejseplanen.info/labs/GTFS.zip)
