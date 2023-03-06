<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# GTFS-Fares v2

Fares v2 - это проект расширения расписания GTFS, направленный на устранение ограничений [Fares v1](/schedule/examples/fares-v1).

Основными концепциями, которые планирует представлять Fares v2, являются

- тарифные продукты (например, билеты и абонементы)
- Категории пассажиров (например, пожилые люди и дети)
- Варианты оплаты проезда (например, банковская карта и кредитная карта)
- ограничение стоимости проезда

Эти концепции позволят производителям данных моделировать тарифы на основе зон, в зависимости от времени и между агентствами. Этот проект расширения принимается итерационно.

В настоящее время принятая базовая реализация Fares v2 работает для следующих случаев использования:

- Определение стоимости проезда
- Описание мест обслуживания в одной тарифной зоне
- Создание правил для поездок в один конец
- Создание правил для пересадок

[Здесь](/schedule/examples/fares-v2) вы можете посмотреть [примеры](/schedule/examples/fares-v2), которые показывают, что можно смоделировать, используя принятую базовую реализацию Fares v2.

Производители могут реализовать Fares v2 в одном наборе данных с Fares v1, поскольку между ними нет технического конфликта. Потребители могут выбирать, какую версию использовать, независимо от другой. При принятии и достаточном одобрении Fares v2, Fares v1 может быть отменен в будущем.

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/gtfs-fares-v2">Ознакомиться с полным предложением</a>

## Текущая работа над Fares v2

Предложение по fare media (ранее fare containers) было вынесено на голосование!

[Проголосуйте в GitHub pull request до 13 март 23:59:59 UTC.](https://github.com/google/transit/pull/355#issuecomment-1456392466)

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/slack">Присоединяйтесь к #gtfs-fares на Slack</a><a class="button no-icon" target="_blank" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057">Смотрите расписание встречСмотрите</a><a class="button no-icon" target="_blank" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit">записи встреч</a>

## Первые участники

🎉 Приветствуем первых пользователей Fares v2! Как минимум 1 производитель данных и 1 потребитель должны взять на себя обязательство реализовать экспериментальную функцию до того, как будет открыто общественное голосование за ее включение в официальную спецификацию. Эти организации вкладывают большое количество времени и энергии в экспериментальные изменения, чтобы убедиться, что GTFS продолжает развиваться.

Для принятой базовой реализации первыми последователями были

- Продюсеры: [Interline](https://www.interline.io/), [Maryland Department of Transportation](https://www.mta.maryland.gov/developer-resources), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Потребители: [Тransit](https://transitapp.com/)

Для функции fare media, которая в настоящее время обсуждается, первыми последователями были

- Производитель: [Interline](https://www.interline.io/), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Потребитель: [Apple](https://www.apple.com/)

<a class="button no-icon" target="_blank" href="https://docs.google.com/spreadsheets/d/1jpKjz6MbCD2XPhmIP11EDi-P2jMh7x2k-oHS-pLf2vI/edit?usp=sharing">Посмотрите, кто использует файлы и поля Fares v2</a>

## Обсуждаемые функции Fares v2

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## История

- **2017:** Исследование отрасли и моделирование данных
- **Октябрь 2021 года**: [Разработка и распространение базовой реализации](https://github.com/google/transit/pull/286#issue-1026848880)
- **Декабрь 2021 г**: [Открытое голосование #1 → не прошло](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **Март 2022**: [Открытое голосование #2 → не прошло](https://github.com/google/transit/pull/286#issuecomment-1080716109) 
- **Май 2022**: [Открытое голосование #3 → принято](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **Август 2022**: [Начинается обсуждение сообществом следующей фазы Fares v2](https://github.com/google/transit/issues/341)
- **Декабрь 2022**: [Сообщество определяет порядок ранжирования функций в стеке для определения приоритетности итераций](https://github.com/google/transit/issues/341#issuecomment-1339947915)
