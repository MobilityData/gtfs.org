---
search:
  exclude: true
---

# Изменения вGTFS Schedule

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

Спецификация GTFS не является каменной. Вместо этого, это открытая спецификация, разработанная и поддерживаемая сообществом транзитных агентств, разработчиков и других заинтересованных сторон, которые используют GTFS. Ожидается, что это сообщество производителей и потребителей данных GTFS будет иметь предложения по расширению спецификации для обеспечения новых возможностей.

Чтобы внести свой вклад в GTFS, ознакомьтесь с [процессом внесения поправок в спецификацию](../process) и следите за обсуждениями в открытых [вопросах](https://github.com/google/transit/issues) и [запросах на доработку](https://github.com/google/transit/pulls) на Github-репозитории Google Transit [(google/transit)](https://github.com/google/transit). ![](../../assets/mark-github.svg)

!!! заметка ""

    Официальная спецификация, справочник и документация написаны на английском языке. Если Перевод на другой язык отличается от английского оригинала, последний имеет приоритет. Все коммуникации осуществляются на английском языке.


## Активные предложения &ensp; <img src="../../assets/pr-active.svg" style="height:1em;"/>

<!--
Active proposals for new features in <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.  -->

Присоединяйтесь к обсуждениям на [Github](https://github.com/google/transit/pulls)!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add <glossary variable="trip">trip</glossary>-to-<glossary variable="trip">trip</glossary> transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Недавно объединенные предложения &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Недавно объединенные предложения, которые теперь являются функциями [официальной спецификации GTFS Schedule](../reference). Смотрите полную [историю изменений](../process#revision-history) для получения дополнительной информации.

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">Добавить пересадку с trip с возможностью пересадки на сиденье</a></h3>
        <p class="maintainer">#303 автор <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> было добавлено 26 июня 2022 г.
</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Добавляет новый <code>transfer_type</code>'s для трансферов из trip в trip, чтобы определить, может ли пользователь сделать "трансфер на сиденье", когда одно и то же vehicle выполняет две последовательные поездки, и пользователь может оставаться на борту.</li>
            <li>Можно определить, когда пересадка на сиденье не разрешена, но может соединить две разные поездки оперативно
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank">Базовая реализация GTFS-Fares V2</a></h3>
        <p class="maintainer">#286 автор <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> была объединена 17 мая 2022 года
</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Транзитные тарифы и билеты</li>
            <li>Моделирование затрат для сложных тарифов и трансферов (многосетевые, time и подсчете трансферы)</li>
            <li>Модель для привязки остановок к зонам оплаты проезда</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">пересадки отtrip и от маршрута к маршруту</a></h3>
        <p class="maintainer">#284 автор <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> была объединена 5 октября 2021 года</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Определить правила для пересадок между парами остановок, trip или маршрутов в файле transfers.txt</li>
             <li>Ранжирование специфики правил трансфера на основе различных парных схем</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3>
        <p class="maintainer">#208 автор <a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a> была объединена 13 мая 2020 года</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Позволяет забирать или высаживать пассажиров в любом месте на пути следования vehicle</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3>
        <p class="maintainer">#180 автор <a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a> был объединен 9 января 2020 г.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Переводы для text полей, локализованных URL и контактной информации</li>
        </ul>
    </div>
</div>

<div class="row"/>
