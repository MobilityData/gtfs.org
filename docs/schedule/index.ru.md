---
search:
  exclude: true
---

# Обзор GTFS Schedule

<div class="landing-page">
   <a class="button" href="reference">Ссылка</a>
   <a class="button" href="best-practices">Лучшие практики</a>
   <a class="button" href="examples">Примеры</a>
   <a class="button" href="changes">Изменения</a>
</div>

## Начало работы

Расписание GTFS, содержащее статическую транзитную информацию, состоит из нескольких текстовых (.txt) файлов, которые содержатся в одном ZIP-файле. Каждый файл описывает определенный аспект транзитной информации: остановки, маршруты, поездки, тарифы и т.д. Более подробную информацию о каждом файле можно найти в справочнике GTFS.

Для создания GTFS выполните следующие действия.

1. Создайте все необходимые файлы, описанные в справочнике [GTFS Schedule](reference). Создайте дополнительные файлы, если их функциональность желательна.
1. Сохраните все файлы в формате .txt. Значения полей должны быть разделены запятыми, а каждая строка должна заканчиваться переводом строки. Подробную информацию о содержимом файлов см. в справочнике GTFS.
1. Заархивируйте все текстовые файлы. Заархивированный файл представляет собой версию фида.
1. Опубликуйте канал, используя один из приведенных ниже вариантов.

## Размещение транзитного канала в открытом доступе

<hr/>

Наборы данных должны быть опубликованы на общедоступном, постоянном URL, включая имя zip-файла. (например, www.agency.org/gtfs/gtfs.zip). В идеале, URL должен быть доступен для прямой загрузки, не требуя входа в систему для доступа к файлу, чтобы облегчить загрузку с помощью программных приложений. Хотя рекомендуется (и это наиболее распространенная практика) сделать набор данных GTFS доступным для открытой загрузки, если поставщику данных необходимо контролировать доступ к GTFS по лицензионным или другим причинам, рекомендуется контролировать доступ к набору данных GTFS с помощью ключей API, что облегчит автоматическую загрузку.

Веб-сервер, на котором размещаются данные GTFS, должен быть настроен на корректное сообщение даты модификации файла (см. HTTP/1.1 - Запрос комментариев 2616, раздел 14.29).

См. раздел "[Лучшие практики: Публикация наборов данных](best-practices/#dataset-publishing-general-practices)" для получения дальнейших рекомендаций.

## Обучение

<hr/>

**Технические подробности о GTFS, что это такое, как создавать и поддерживать данные:**

- [Обзор GTFS Schedule](schedule/)
- ["Онлайн-курс Всемирного банка "Введение в GTFS"](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-GTFS-and-informal-transit-system-mapping)
- [MBTA GTFS Onboarding](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb)

**Просмотр примеров фидов с различными функциями:**

- [База данных GTFS Mobility Database](https://database.mobilitydata.org/)
- [Transitland](https://www.transit.land/)

**Бесплатные инструменты и учебные материалы:**

- [MobilityData GTFS Schedule Validator](<https://GTFS-validator.mobilitydata.org/)
- [Уроки NRTAP и GTFS Builder](<https://www.nationalrtap.org/Technology-Tools/GTFS-Builder/Support)
- [Arcadis IBI Data Tools](https://www.ibigroup.com/ibi-products/transit-data-tools/)

**Для получения информации о поставщиках, предлагающих услуги GTFS:**

- [Центр исследований городского транспорта, Университет Южной Флориды Список поставщиков GTFS](https://docs.google.com/spreadsheets/u/1/d/1Gc9mu4BIYC8ORpv2IbbVnT3q8VQ3xkeY7Hz068vT_GQ/pubhtml)

Смотрите другие [онлайн-курсы](../resources/other/#on-line-courses).

## Получение помощи и сообщество

<hr/>

### Списки рассылки

Существует ряд списков рассылки, которые могут стать хорошим источником информации, если у вас есть вопросы о данных общественного транспорта, программном обеспечении, форматах, таких как GTFS и GTFS, и других вопросах:

* [GTFS Changes](https://groups.google.com/group/gtfs-changes): обсуждение предложения по расширению спецификации GTFS, изложенного в документе [GTFS Changes](https://github.com/google/transit/blob/master/gtfs/CHANGES.md).
* [GTFS Realtime](https://groups.google.com/group/gtfs-realtime): обсуждение спецификации [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime).
* [MobilityData Slack](https://mobilitydata-io.slack.com/): "организация" Slack с каналами, посвященными темам GTFS. [Запросить приглашение на mobilitydata-io.slack.com можно здесь](https://share.mobilitydata.org/slack).
* [transitfeed](https://groups.google.com/group/transitfeed): обсуждение проекта с открытым исходным кодом [transitfeed](https://groups.google.com/group/transitfeed), а также обсуждение спецификации GTFS и связанных с ней инструментов.
* [transit-developers](https://groups.google.com/group/transit-developers): общие обсуждения разработчиков транзитных систем. Многие транзитные агентства также имеют свои собственные списки рассылки для разработчиков, специфичные для данного агентства. Например:
    * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
    * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
    * [BART - Сан-Франциско, Калифорния](https://groups.google.com/group/bart-developers)
    * [MassDOT](https://groups.google.com/group/massdotdevelopers)
    * [регион Атланта, штат Джорджия](https://groups.google.com/forum/#!forum/atl-transit-developers)
    * [511 San Francisco Bay Area Developer Resources](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)

Узнайте в местном транспортном агентстве, есть ли у них собственный список рассылки.

Посмотрите другие [ресурсы сообщества](../resources/community).
