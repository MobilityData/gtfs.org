<a class="pencil-link" href="https://github.com/MobilityData/<glossary variable=" GTFS"="">GTFS.org/edit/main/docs/schedule/examples/attributions.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"/></svg>
  </a>

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
