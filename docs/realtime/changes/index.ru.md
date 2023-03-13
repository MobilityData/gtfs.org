# Изменения GTFS Realtime

Спецификация GTFS Realtime не является каменной. Это открытая спецификация, разработанная и поддерживаемая сообществом транзитных агентств, разработчиков и других заинтересованных сторон, которые используют GTFS Realtime. Ожидается, что это сообщество производителей и потребителей данных GTFS Realtime будет иметь предложения по расширению спецификации для обеспечения новых возможностей.

Чтобы внести свой вклад в развитие GTFS Realtime, ознакомьтесь с [процессом внесения поправок в спецификацию](../process) и следите за обсуждениями в открытых [вопросах](https://github.com/google/transit/issues) и [запросах](https://github.com/google/transit/pulls) на исправление на Github-репозитории Google Transit[(google/transit](https://github.com/google/transit)). ![](../../assets/mark-github.svg)

!!! note ""

    Официальная спецификация, справочник и документация написаны на английском языке. Если перевод на другой язык отличается от английского оригинала, последний имеет приоритет. Все коммуникации осуществляются на английском языке.

<!-- <br><div class="landing-page">
    <a class="button" href="../process">Процесс внесения изменений в спецификацию</a><a class="button" href="../guiding-principles">Руководящие принципы</a><a class="button" href="../revision-history">История пересмотра</a><a class="button" href="../extensions">Расширения реального времени</a>
</div> -->

## Активные предложения &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- Активные предложения по новым функциям в GTFS Realtime.  -->

Присоединяйтесь к обсуждениям на [Github](https://github.com/google/transit/pulls)!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Добавить cause_detail и effect_detail в оповещениях</a></h3>
        <p class="maintainer">#332 открыт 31 мая 2022 г.<a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">В настоящее время нет активных предложений для GTFS Realtime.</h3>
        <p class="prompt">У вас есть предложение? &ensp;➜&ensp; Открыть <a href="https://github.com/google/transit/pulls" target="_blank">запрос на получение</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Недавно объединенные предложения &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Недавно объединенные предложения, которые теперь являются функциями [официальной спецификации GTFS Realtime](../reference). Подробнее см. в полной [истории изменений](../process#revision-history).

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Добавьте cause_detail и effect_detail в Alerts</a></h3>
        <p class="maintainer">#332 от <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> было объединено 26 июня 2022 г.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Добавляет описания причин и следствий к alerts</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : обновление доступа для инвалидных колясок</a></h3>
        <p class="maintainer">#340 by <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> было добавлено 25 июля 2022 г.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Добавляет информацию о доступности поездок в реальном времени</li>
            <li>Если предоставлена, перезаписывает <code>trips.wheelchair_accessible</code> в наборе данных GTFS Schedule</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Функция/изображение в предупреждениях</a></h3>
        <p class="maintainer">#283 от <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> было добавлено 26 ноября 2021 г.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Добавляет поле URL-ссылки на изображение (например, фотографию или карту) для отображения в сервисных оповещениях приложений, чтобы улучшить понимание оповещения.</li>
            <li>Изменения включают: принудительное ограничение размера изображения, одно изображение на одно оповещение и обеспечение изменения URL-адреса при изменении содержания или языка изображений.</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">Добавить GTFS-NewShapes в качестве экспериментального</a></h3>
        <p class="maintainer">#272 автор <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> был объединен 30 августа 2021 г.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Возможность обновления форм маршрутов в реальном времени для отражения объездов</li>
            <li>Обновления маршрута отражаются либо путем ссылки на существующий <code>shape_id</code>, либо путем определения в реальном времени новой фигуры в виде закодированной полилинии.</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">Добавить статус departure_occupancy status в TripUpdate</a></h3>
        <p class="maintainer">#260 by <a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a> была объединена 14 апреля 2021 г.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Предоставление прогнозируемой заполняемости транзитных транспортных средств на будущих остановках на основе текущих или исторических данных.</li>
        </ul>
    </div>
</div>

<div class="row"/>
