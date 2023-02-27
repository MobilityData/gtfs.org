---
search:
  exclude: true
---

# Переводы

<hr/>

## Перевод названий станций

Некоторые транзитные провайдеры предлагают услуги на нескольких языках - одним из них является Национальная железнодорожная компания Бельгии (известная как NMBS/SNCB, Nationale Maatschappij der Belgische Spoorwegen на голландском или Société nationale des chemins de fer belges на французском). Компания предоставляет названия станций на нескольких языках, которые отображаются в зависимости от языка пользователя и настроек местоположения.

NMBS/SNCB публикует данные GTFS на французском языке, как показано в файле ниже:

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr

Поскольку язык агентства установлен на французский, названия станций перечислены на французском языке в файле [stops.txt](../../reference/#stopstxt).

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
    S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
    S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,

Затем файл [translations.txt](../../reference/#translationstxt) используется для перевода названий станций с языка агентства по умолчанию (в данном случае французского) на голландский.

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,record_id,language,translation
    stops,stop_name,S8815040,nl,Brussel-West

- В этом примере названия станций из файла [stops.txt](../../reference/#stopstxt) переведены, а записи в файле [stops.txt](../../reference/#stopstxt) идентифицируются по `stop_id`. Таким образом:
  - `stops` перечислены под именами таблиц (в ссылке на [stops.txt](../../reference/#stopstxt))
  - `stop_name` перечислено под `field_name` (поскольку названия станций будут переведены).
  - `stop_id` для названия станции, которое будет переведено с французского, указывается в `record_id` (в данном случае `stop_id` для Bruxelles-Ouest).
- Название переведено на голландский язык (nl).
- Наконец, переведенное название перечислено в разделе Translation

Существует другой способ перевода названий в GTFS с помощью файла [translations.txt](../../reference/#translationstxt), где вместо `record_id` используется поле `field_value`. В этом случае название станции используется для поиска переводимой записи из файла [stops.txt](../../reference/#stopstxt).

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,field_value,language,translation`
    stops,stop_name,Bruxelles-Ouest,nl,Brussel-West

[Пример источника](http://gtfs.irail.be/mivb/mivb-gtfs.zip)
