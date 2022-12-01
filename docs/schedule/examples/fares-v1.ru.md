---
search:
  exclude: true
---

# Fares V1

<hr/>

Состоящий из [fare_attributes.txt](../../reference/#fare_attributestxt) и [fare_rules.txt](../../reference/#fare_rulestxt), Fares V1 исторически был официальным методом описания информации о тарифах в GTFS. Однако эти два файла ограничены в широте факторов, которые они могут эффективно описать, и неоднозначны в реализации.[Fares V2](../../examples/fares-v2/) - это проект расширения, находящийся в стадии активной разработки, и он направлен на устранение ограничений Fares V1.

## Определите правила оплаты проезда агентства

trip в метро Торонто стоит \$3,20 CAD, если пассажиры оплачивают проезд картой PRESTO. Всадники также могут пересаживаться на другие маршруты метро, трамваи или автобусы, обслуживаемые TTC, в течение двухчасового окна.

Этот сервис может быть представлен с помощью файлов [fare_attributes.txt](../../reference/#fare_attributestxt), [fare_rules.txt](../../reference/#fare_rulestxt) и [transfers.txt](../../reference/#transferstxt). Первый файл, [fare_attributes.txt](../../reference/#fare_attributestxt), описывает тарифы агентства, ниже приведен пример тарифа presto:

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- Стоимость проезда указана в разделе price и `currency_type`.
- Перед посадкой в метро пассажиры должны оплатить проезд в кассах станции. Это представлено в поле `payment_method=1`
- Поле transfer оставлено пустым, чтобы представить неограниченные пересадки.
- Поле `transfer_duration` соответствует 2-часовому пересадочному окну (в секундах).

Второй файл, [fare_rules.txt](../../reference/#fare_rulestxt), назначает тарифы на поездки путем привязки тарифа к маршруту, а также к месту отправления/назначения на этом маршруте.

Для этого ниже в файле [routes.txt](../../reference/#routestxt) определены две линии метро:

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

В этом примере моделируются пересадки на станции Bloor-Yonge. Для этого станция моделируется как две отдельные остановки, первая - станция Bloor, которая обслуживается линией 1, а вторая - станция Yonge, которая обслуживается линией 2. Обе имеют `zone_id=ttc_subway_stations`, чтобы сгруппировать все станции метро в одну тарифную зону.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

В [fare_rules.txt](../../reference/#fare_rulestxt) тариф PRESTO связан с обеими линиями метро и станциями с помощью следующих отношений:

- При `тарифе fare_id=presto_fare` пассажиры могут перемещаться между любыми двумя станциями линии 1`(route_id=line1`) с `origin_id=ttc_subway_stations` и `destination_id=ttc_subway_stations`.

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

Третий файл, [transfers.txt](../../reference/#transferstxt), определяет точки пересадки между различными маршрутами. Для моделирования пересадок на станции Bloor-Yonge требуется две записи:

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- Первая модель моделирует пересадки с Линии 1 на Линию 2, используя `from_route_id` и `to_route_id` от станции Bloor до станции Yonge.
- Второй моделирует пересадки с Линии 2 на Линию 1, используя `from_route_id` и `to_route_id` от станции Yonge до станции Bloor.
- Значение для `transfer_type` равно `0`, так как для пересадок нет никаких особых требований или соображений.

[Пример источника](https://www.ttc.ca/Fares-and-passes)
