---
search:
  exclude: true
---

# Непрерывные остановки

<hr/>

## Посадка и высадка везде

Транзитное агентство The Current (Rockingham, US-VT) применяет политику непрерывных остановок на маршрутах 2, 53 и 55. Пассажира можно забирать и высаживать между scheduled остановками на всем протяжении маршрута, если есть безопасное место для остановки автобуса.

Файл [routes.txt](../../reference/#routestxt) используется для описания этой услуги с помощью полей `continuous_pickup` и `continuous_drop_off`. Эти поля устанавливаются в `0`, чтобы указать, что разрешены непрерывные заезды и выезды.

[**routes.txt**](../../reference/#routestxt)

    route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
    2,2,Bellows Falls In-Town,3,0,0
    53,53,Bellows Falls / Battleboro Commuter,3,0,0
    55,55,Bellows Falls / Springfield Shuttle,3,0,0

[Пример источника](https://crtransit.org/bus-schedules/)

<hr/>

## Посадка и высадка на участке маршрута

Транзитное агентство Victor Valley Transit (Victorville, US-CA) применяет политику непрерывных остановок только на части маршрута 22. Пассажир может садиться и выходить из автобуса в любом безопасном месте только в пределах зоны действия окружного тарифа. Непрерывные посадки и высадки невозможны в зоне местного тарифа.

Зона местного тарифа и зона окружного тарифа разделены скоростной автострадой Air Expressway, как показано на рисунке ниже. scheduled остановка National Trails Highway - Air Expressway расположена немного севернее этой границы. Для точности транзитное агентство может добавить остановку на фактическом пересечении автобусного маршрута с этой границей, с которой возможна непрерывная посадка и высадка пассажиров. Эта остановка может оставаться unscheduled.

![](../../assets/victor-valley-transit.svg)

Эта услуга описывается с помощью файлов [stops.txt](../../reference/#stopstxt) и [stop_times.txt](../../reference/#stoptimestxt):

- Первый файл определяет остановки вдоль маршрута
- Второй файл определяет правила непрерывной посадки и высадки между остановками.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon
    A,Victoriaville Transfer Station,34.514356,-117.318323
    B,Dante St & Venus Ave,34.564499,-117.287097
    C,Victorville Transportation Center,34.538433,-117.294703
    X,Local/County Fare Boundary,34.566224,-117.318357
    D,National Trails Highway - Air Expressway,34.567536,-117.319716
    E,Oro Grande Post Office,34.599292,-117.334452
    F,Silver Lakes Market,34.744662,-117.335407

В файле [stop_times.txt](../../reference/#stoptimestxt) для данной trip:

- Запись с параметром `continuous_pickup=0` означает, что с этой остановки до следующей остановки разрешены непрерывные заезды.
- Запись с параметром `continuous_pickup=1` означает, что с данной остановки до следующей остановки запрещены постоянные подвозки.

[**stop_times.txt**](../../reference/#stoptimestxt)

    trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
    22NB9AM,A,1,09:00:00,09:00:00,1,1,1
    22NB9AM,B,2,09:14:00,09:14:00,1,1,1
    22NB9AM,C,3,09:21:00,09:21:00,1,1,1
    22NB9AM,X,4,,,0,0,0
    22NB9AM,D,5,09:25:00,09:25:00,0,0,1
    22NB9AM,E,6,09:31:00,09:31:00,0,0,1
    22NB9AM,F,7,09:46:00,09:46:00,0,0,1

Такая же логика применима к полю `continuous_drop_off`, но для случая высадки пассажиров.

В приведенном выше примере остановки A, B, C имеют значения continuous_pickup и `continuous_drop_off` равные `1`, что запрещает непрерывные подвозки и высадки между ними. Для остановок `X`, `D`, `E` и `F` поля `continuous_pickup` и `continuous_drop_off` установлены в `0`, что разрешает непрерывные заезды и выезды между ними.

[Пример источника](https://vvta.org/routes/route-22/)
