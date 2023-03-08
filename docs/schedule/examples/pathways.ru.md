---
search:
  exclude: true
---

# Пути

<hr/>

## Опишите расположение входов и выходов станции

С помощью GTFS можно точно описать станции, используя информацию о входах и интерьерах станций. В данном примере описаны участки станции Waterfront в центре Ванкувера. Станция является частью городской сети Skytrain и обслуживается линиями Canada Line, Expo Line, SeaBus и West Coast Express. Три входа на уровне улицы позволяют пассажирам входить и выходить на станции. Остальная часть станции находится под землей: на уровне вестибюля располагаются кассы для оплаты проезда, а на нижнем уровне - платформы.

Во-первых, расположение станции и ее входы определяются в файле [stops.txt](../../reference/#pathwaystxt):

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

В приведенном выше файле первая запись относится к расположению станции, поэтому `location_type` установлен на `1`. Остальные пять записей относятся к трем входам на станцию (необходимо пять записей, так как вход в Granville фактически имеет три отдельных входа: лестница, эскалатор и лифт). Эти пять записей определены как входы, поскольку `location_type` установлен на `2`.

Кроме того, `stop_id` Waterfront Station указан под `parent_station` для входов, чтобы связать их со станцией. Для доступных входов параметр `wheelchair_boarding` установлен на `1`, а для недоступных - на `2`.

## Опишите лестницы и эскалаторы

Вход в Waterfront Station на Granville street имеет лифт, эскалатор и лестницу, входы определены как узлы выше в [stops.txt](../../reference/#stopstxt). Чтобы соединить входы с внутренними секциями станции, необходимо создать дополнительные узлы в файле [stops.txt](../../reference/#stopstxt) под `parent_station` Waterfront Station. В файле [stops.txt](../../reference/#stopstxt) ниже определены общие узлы (`location_type 3`), которые соответствуют нижней части лестницы и эскалатора.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width="700px"/>

Далее, файл [pathways.txt](../../reference/#pathwaystxt) используется для связи узлов для создания путей, где первая запись связывает узлы, относящиеся к верху и низу лестницы. `pathway_mode` установлен на `2`, чтобы указать лестницу, а последнее поле описывает, что пассажиры могут идти по лестнице в обе стороны (вверх и вниз).

Аналогично, во второй записи описывается эскалатор (`pathway_mode` установлен на `4`). Поскольку эскалаторы могут двигаться только в одном направлении, поле `is_bidirectional` установлено в `0`, следовательно, эскалатор движется в одну сторону, от узла `96` к `91` (вверх).

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## Опишите лифты и пути

Лифт на Granville street доставляет пассажиров к дорожке на уровне конкорса, где end эскалатор и лестница. Лифт на уровне поверхности уже определен как вход на станцию выше`stop_id` `92`). Следовательно, дверь лифта на уровне конкорса также должна быть определена.

Кроме того, как показано на рисунке ниже, существует подземный пешеходный переход, который соединяет нижнюю часть лестницы, эскалатор и лифт на улице Granville с главным зданием станции. Поэтому создаются два дополнительных узла для определения участков пешеходных дорожек.

<img class="center" src="../../../assets/pathways-2.png" width="500px"/>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width="500px"/>

Наконец, узлы соединяются вместе, чтобы определить подземный путь, как показано в файле [pathways.txt](../../reference/#pathwaystxt) ниже:

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
