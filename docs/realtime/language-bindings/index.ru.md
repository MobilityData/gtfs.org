# gtfs-realtime-bindings [![Join the MobilityData chat](https://img.shields.io/badge/chat-on%20slack-red)](https://share.mobilitydata.org/slack)

Языковые привязки, созданные на основе спецификации протокольных буферов [GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) для популярных языков.

## Введение

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) - это формат данных для передачи информации о системах общественного транспорта в реальном времени. Данные GTFS Realtime кодируются и декодируются с помощью [Protocol Buffers](https://developers.google.com/protocol-buffers/), компактного двоичного представления, разработанного для быстрой и эффективной обработки. Сама схема данных определена в файле [GTFS-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto).

Для работы с данными GTFS Realtime разработчик обычно использует схему `gtfs-realtime.proto` для создания классов на выбранном им языке программирования. Затем эти классы могут быть использованы для создания объектов модели данных GTFS-realtimedata и их сериализации в виде двоичных данных или, в обратном направлении, для разбора двоичных данных в объекты модели данных.

Поскольку генерация классов модели данных GTFS Realtime из схемы `gtfs-realtime.proto` является такой распространенной задачей, которая иногда приводит в замешательство начинающих разработчиков, данный проект нацелен на предоставление предварительно сгенерированных языковых привязок GTFS Realtime для ряда наиболее популярных языков программирования. По возможности, эти языковые привязки будут опубликованы в виде пакетов, чтобы облегчить их использование в других проектах.

## Поддерживаемые языки

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~ *(Утратил актуальность с начала 2019 года)*
* ~~[PHP](php.md)~~ *(Утратил актуальность с начала 2019 года)*

## Другие языки

Мы не предоставляем сгенерированный код для C++, для этого используйте официальный компилятор protoc ( [отсюда](https://developers.google.com/protocol-buffers/docs/downloads) или [отсюда](https://github.com/google/protobuf)).

Нам не хватает вашего любимого языка? Сделайте свой вклад:

1. Прочитайте [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md).
2. Откройте запрос на исправление с указанием выбранного вами языка. Пожалуйста, включите инструкции по обновлению (в идеале - скрипты). Также предоставьте упаковку, подходящую для экосистемы языка.

## История проекта

Этот проект был первоначально создан Google - MobilityData начала поддерживать проект в начале 2019 года.

Старые версии библиотек привязки по-прежнему публикуются под именем Google. Смотрите документацию по каждому языку [здесь](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version), чтобы найти последнюю версию, опубликованную Google.
