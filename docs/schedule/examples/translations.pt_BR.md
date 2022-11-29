---
search:
  exclude: true
---

<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/translations.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Traduções

<hr/>

## Traduzir os nomes das estações

Alguns prestadores de serviços de trânsito oferecem serviços em vários idiomas - um dos quais é a Companhia Ferroviária Nacional da Bélgica (localmente conhecida como NMBS/SNCB, para Nationale Maatschappij der Belgische Spoorwegen em holandês ou Société nationale des chemins de fer belges em francês). A empresa fornece nomes de estações em vários idiomas e são exibidos dependendo do idioma do usuário e das configurações de localização.

O NMBS/SNCB publica os dados GTFS em francês, como mostrado no arquivo abaixo:

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr

Como o idioma da agência é o francês, os nomes das estações são listados em francês em [stops.txt](../../reference/#stopstxt)

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
    S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
    S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,

O arquivo [translations.txt](../../reference/#translationstxt) é então utilizado para traduzir os nomes das estações do idioma padrão da agência (francês, neste caso) para o holandês.

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,record_id,language,translation
    stops,stop_name,S8815040,nl,Brussel-West

- Neste exemplo, os nomes das estações de [stops.txt](../../reference/#stopstxt) são traduzidos, e os registros em [stops.txt](../../reference/#stopstxt) são identificados por um `stop_id`. Portanto:
  - os`stops`.txt são listados sob os nomes das tabelas (em referência aos [stops.txt](../../reference/#stopstxt))
  - `stop_name` está listado em `field_name` (uma vez que os nomes das estações serão traduzidos)
  - O `stop_id` para o nome da estação a ser traduzido do francês está listado em `record_id` (neste caso, o `stop_id` para Bruxelles-Ouest)
- O nome é traduzido para o holandês (nl)
- Finalmente, o nome traduzido está listado em Translation

Há outra maneira de traduzir nomes em GTFS usando o arquivo [translations.txt](../../reference/#translationstxt), onde o campo `field_value` é usado em vez do `record_id`. Neste caso, o nome da estação é usado para encontrar o registro a ser traduzido do arquivo [stops.txt](../../reference/#stopstxt).

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,field_value,language,translation`
    stops,stop_name,Bruxelles-Ouest,nl,Brussel-West

[Exemplo de fonte](http://gtfs.irail.be/mivb/mivb-gtfs.zip)
