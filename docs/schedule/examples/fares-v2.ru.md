# Fares V2

<hr/>

Fares V2 - это проект расширения GTFS, который направлен на устранение ограничений Fares V1. Этот проект расширения принимается итерациями. Приведенные ниже примеры показывают, как моделировать основные концепции, включая тарифные продукты и то, как пассажиры могут использовать свой тариф для пересадок. Более подробную информацию о [проекте расширения Fares V2](/extensions/fares-v2/) можно найти [здесь](/extensions/fares-v2/).

В промежуточный период производители могут реализовать Fares V2 наряду с реализацией Fares V1 в одном и том же наборе данных, поскольку между ними нет технического конфликта. Потребители будут иметь выбор, какую реализацию использовать, независимо друг от друга. После принятия и достаточного одобрения Fares V2, Fares V1 может быть отменен в будущем.

## Определение тарифа на проезд

Существует несколько способов оплаты проезда в системе Maryland Transit Administration. [Существует четыре типа обычных билетов по полный цене:](https://www.mta.maryland.gov/regular-fares)

- Билет в один конец стоимостью 2,00 USD
- Дневной абонемент стоимостью 4,60 USD
- Недельный абонемент стоимостью 22 USD
- Месячный проездной стоит 77 USD

Транзитные билеты или тарифы называются в GTFS тарифными продуктами. Они могут быть описаны с помощью файла [fare_products.txt](../../reference/#fare_productstxt). Каждая запись соответствует определенному тарифу.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id  | fare_product_name  | amount  | currency  |
|------------------------|--------------------|---|---|
| core_local_oneway_fare | One Way Full Fare |  2.00 | USD  |
| core_local_1_day_fare  | 1-Day Pass - Core Service  | 4.60  | USD   |
| core_local_31_day_fare | 31-Day Pass - Core Service  | 77.00  | USD  |
| core_local_7_day_fare  | 7-Day Pass - Core Service |  22.00 | USD  |

<sup>[Скачать файл GTFS для местных автобусов Администрации транзитных перевозок штата Мэриленд.](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Создайте правила для поездок по одному билету

В GTFS тарифный этап соответствует поездке, которую пассажир совершает без пересадок между различными видами транспорта, маршрутами, сетями или агентствами. В подаче Администрации транзита штата Мэриленд единый тариф позволяет пассажирам совершать поездки в пределах любой пары остановок и станций метро в `core` сети автобусов BaltimoreLink, маршрутов Light RailLink и Metro SubwayLink.

Группы остановок определяют поездки внутри сети от пункта отправления до пункта назначения (или от набора пунктов отправления до набора пунктов назначения, если идентификаторы районов соответствуют сгруппированным остановкам). В приведенном ниже файле описаны правила для поездок в любую точку основной сети Администрации транзита штата Мэриленд. Каждое правило соответствует одному из обычных тарифных продуктов в [примере "Определение транзитного тарифа](#_1)".

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

|  leg_group_id |  network_id | fare_product_id  |
|---|---|---|
| core_local_one_way_trip | core  |  core_local_oneway_fare |
| core_local_one_way_trip | core  |  core_local_1_day_fare |
| core_local_one_way_trip | core  |  core_local_31_day_fare |
| core_local_one_way_trip | core  |  core_local_7_day_fare |

<sup>[Скачать файл GTFS для местных автобусов Администрации транзитных перевозок штата Мэриленд](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Создание правил для пересадок

Для пассажиров, купивших билет в одну сторону для проезда на местных автобусах BaltimoreLink, Metro SubwayLink или Light RailLink, действует 90-минутная пересадка. Это означает, что они могут пересаживаться неограниченное количество раз между местными автобусами, метро и легкорельсовым транспортом в течение 90 минут.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id       | to_leg_group_id  | duration_limit | duration_limit_type | fare_transfer_type | transfer_count |
|-------------------------|---|----------------|-------------------|---------------------|----------------|
| core_local_one_way_trip | core_local_one_way_trip  | 5400           | 1                 | 0                   | -1             |

Приведенный выше файл представляет это в GTFS со следующими полями:

- Пересадка возможна на и с этапов, которые являются поездкой в одну сторону (`core_local_one_way_trip`).
- `transfer_count` устанавливается в `-1`, так как нет ограничения на количество разрешенных трансферов.
- `duration_limit` установлено на `5400` секунд, что эквивалентно 90 минутам
- `duration_limit_type` установлен на `1`, так как время пересадки начинается, когда велосипедист отправляется по любому маршруту в зоне действия тарифа `core_local_one_way_trip` и заканчивается, когда он отправляется по другой зоне действия тарифа.
- `fare_transfer_type` установлен на `0`, так как пассажиры оплачивают только первый тариф. Не существует платы за пересадку или второго тарифа за пересадку в течение 90 минут. Следовательно, стоимость можно смоделировать как сумму первого тарифа и суммы сборов за пересадку.
- `transfer_count` установлен равным `-1`, так как велосипедист может пересаживаться неограниченное количество раз в течение 90-минутного окна `duration_limit`.

После определения тарифа, создания соответствующего `fare_leg_rule` и определения `fare_transfer_rule` вы можете увидеть, как `core_local_oneway_fare` стоимостью $2.00 USD появляется в планировщиках поездок. Вот пример из Transit:

<div class="flex-photos">
    <img src="../../../assets/transit-fares-mdot.png" alt="fare of $2 USD">
</div>

<sup>[Скачать файл GTFS для местных автобусов Администрации транзитных перевозок штата Мэриленд](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

## Описать места обслуживания в одной тарифной зоне.

Некоторые транзитные агентства используют зональную структуру тарифов. Тарифные зоны - это разделенные географические области, в которых действуют разные цены на проезд. В системе BART в Bay Area тарифы различаются в зависимости от пункта отправления и пункта назначения [(BART fare differences)](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf), и пассажирам необходимо знать правильный тариф. Зоны оплаты проезда можно описать с помощью файла [stops_areas.txt](../../reference/#stops_areastxt), который назначает остановки из файла [stops.txt](../../reference/#stopstxt) в файл [areas.txt](../../reference/#areastxt).

Сначала определите район в файле [areas.txt](../../reference/#areastxt). Допустимо оставить `area_name` пустым, если название района отсутствует. В таблице ниже есть три `area_id` - `ASHB`, `GLEN` и `OAKL`.

[**areas.txt**](../../reference/#areastxt)

| area_id | area_name |
|---------|-----------|
| ASHB    |           |
| GLEN    |           | 
| OAKL    |           | 

Затем, используя `stop_id` из файла [stops.txt](../../reference/#stopstxt), сгруппируйте остановки вместе в соответствующую определенную область (тарифную зону).

Затем сгруппируйте `stop_id` с каждым `area_id`. В примере с BART каждая область содержит только 1 `stop_id`. Например, только остановка `ASHB` (станция Ashby) включена в область `ASHB`. Однако если область включает несколько остановок, следует указать несколько `stop_id`.

[**stops_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
|---------|---------|
| ASHB    | ASHB    |
| GLEN    | GLEN    | 
| OAKL    | OAKL    | 

В файле `fare_leg_rules.txt` различные тарифные продукты могут быть определены на основе различных зон отправления и прибытия. Например, первая запись показывает:

- Зона отправления - `ASHB`
- Зона прибытия - `GLEN`
- Тарифный продукт для зоны отправления/прибытия - `BA:matrix:ASHB-GLEN`

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id |to_area_id|fare_product_id|
|--------------|--------------|------------|---------------|
|   BA    | ASHB         | GLEN | BA:matrix:ASHB-GLEN |
|     BA         | ASHB         | OAKL | BA:matrix:ASHB-OAKL |

Тариф идентифицируется в файле `fare_products.txt`.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name| amount | currency |
|---------------------|-----------|--------|----------|
| BA:matrix:ASHB-GLEN |  generated  | 4.75   | USD      |
| BA:matrix:ASHB-OAKL  |  generated  | 9.45   | USD       |

<sup><a href="https://511.org/open-data/transit" target="_blank">См. региональный корм в районе залива Сан-Франциско</a></sup>

<hr/>

## Опишите, какие средства оплаты проезда принимаются

Водители Муни Сан-Франциско могут использовать несколько различных типов носителей информации для оплаты поездки и подтверждения своего тарифа:

- Используйте <a href="https://www.clippercard.com/ClipperWeb/" target="_blank">карту Clipper</a>- транзитную карту района залива.
- Используйте <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">приложение Munimobile.</a>
- Оплатить проезд наличными

Эти методы валидации называются `fare_media` в GTFS-Fares V2 и могут быть описаны с помощью `fare_media.txt`.

Ниже приведен пример фрагмента из <a href="https://511.org/open-data/transit" target="_blank">регионального фида района залива Сан-Франциско</a>, доступ к которому можно получить с помощью API 511 SF Bay.

`Clipper` описывается как физическая транзитная карта с `fare_media_type=2`. `SFMTA Munimobile` описывается как мобильное приложение с `fare_media_type=2`. `Наличные` не имеют носителя информации о стоимости проезда, поскольку они выдаются непосредственно водителю без билета. В результате `Cash` имеет `тарифный_медиа_тип=0`.

Производители, которые хотят описать физический билет как тип носителя информации о тарифе, могут использовать экспериментальную опцию `fare_media_type=1`, которая находится в <a href="https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd" target="_blank">предложении полный Fares V2</a>.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| munimobile    | SFMTA MuniMobile | 4               |
| cash           | Cash             | 0               |

<sup><a href="https://511.org/open-data/transit" target="_blank">См. региональный корм в районе залива Сан-Франциско</a>

## Определите разницу в цене в зависимости от носителя тарифа

Стоимость проезда в Muni отличается в зависимости от используемого пассажиром носителя информации. В данном примере мы рассмотрим, как меняется цена взрослого местного тарифа при использовании наличных или карты Clipper. Взрослый местный проезд, оплаченный наличными, стоит 3 USD, а тот же проезд, оплаченный картой Clipper, стоит 2.50, на 50 центов меньше.

Каждая запись ниже описывает средство оплаты проезда.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| cash           | Cash             | 0               |

Приведенный ниже фрагмент файла `fare_products.txt` показывает, как сумма `Muni single local fare` варьируется в зависимости от носителя информации, которым пользуется пассажир.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | amount | currency | fare_media_id |
|---------------|------------------|-------|--- |---------------|
| SF:local:single | Muni single local fare | 3     | USD | cash |
| SF:local:single | Muni single local fare  | 2.5   |USD | clipper |

В Apple Maps пассажиры могут видеть, как меняется стоимость проезда. Сравнить цены на проезд можно в инструкции "Board the Muni J Church train":

<div class="flex-photos">
    <img src="../../../assets/apple-muni-cash.jpg" alt="cash fare of $3 USD">
    <img src="../../../assets/apple-muni-clipper.jpg" alt="Clipper card fare of $2.50 USD">
</div>

<sup><a href="https://511.org/open-data/transit" target="_blank">См. региональный корм в районе залива Сан-Франциско</a></sup>

## Опишите вариант бесконтактного средства оплаты проезда

<a href="https://vimeo.com/539436401" target="_blank">Экспресс Clean Air Express в северной части округа Санта-Барбара принимает бесконтактную оплату</a> кредитной картой, Google Pay и Apple Pay.

В ленте Clean Air Express есть средство оплаты проезда `tap_to_ride` с `fare_media_type=3`, поскольку это вариант cEMV (бесконтактный Europay, Mastercard и Visa).

| fare_media_id | fare_media_name | fare_media_type |
|---------------|-----------------|-----------------|
| tap_to_ride   | Tap to Ride   | 3  |

Продукт для разовых поездок, показанный ниже, имеет варианты оплаты `cash` и с помощью носителя `tap-to-ride`. Если разовая поездка оплачивается с помощью носителя `tap-to-ride`, она стоит на один доллар США дешевле.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | fare_media_id | amount | currency |
|---------------|------------------|---------------|--------|----------|
| single-ride | Single Ride | tap_to_ride       | 6      | USD      |
| single-ride | Single Ride |       | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">Загрузите ленту новостей Clean Air Express</a></sup>
