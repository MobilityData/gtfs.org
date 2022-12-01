<a class="pencil-link" href="https://github.com/MobilityData/<glossary variable=" GTFS"="">GTFS.org/edit/main/docs/schedule/examples/attributions.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"/></svg>
  </a>

# Атрибуты набора данных

<hr/>

## Приписывание данных производителю данных в агрегированном наборе данных GTFS

Некоторые наборы данных GTFS содержат данные, агрегированные из нескольких источников, например, различных поставщиков услуг, обслуживающих одну и ту же юрисдикцию. В некоторых случаях необходимо классифицировать агентства, перечисленные в файле [agency.txt](../../reference/#agencytxt), как производителей, операторов или органы власти.

Например, Rejseplanen - это поисковая система для железнодорожных и автобусных услуг в Дании. Компания публикует набор данных GTFS, который содержит данные от нескольких агентств и провайдеров, как показано ниже в файле [agency.txt](../../reference/#agencytxt).

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
    204,FYNBUS,https://fynbus.dk,Europe/Berlin,
    206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
    276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,

Для атрибуции Rejseplanen как производителя данных используется файл [attributions.txt](../../reference/#attributionstxt), в котором id атрибуции определяется вместе с названием и url организации. Поля `is_producer`, `is_operator` и `is_authority` используются для категоризации Rejseplanen, как показано ниже:

[**attributions.txt**](../../reference/#attributionstxt)

    attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
    rp,Rejseplanen,https://www.rejseplanen.dk,1,,

[Пример источника](http://www.rejseplanen.info/labs/GTFS.zip)
