---
search:
  exclude: true
---

# GTFS: обеспечение универсального доступа к данным об общественном транспорте

<div class="landing-page">
    <a class="button" href="schedule">GTFS Schedule</a><a class="button" href="realtime">GTFS Realtime</a><a class="button" href="resources">Ресурсы</a><a class="button" href="extensions">Расширения</a>
</div>

General Transit Feed SpecificationGTFS) - это [открытый стандарт](https://www.interoperablemobility.org/definitions/#open_standard), используемый для распространения актуальной информации о транзитных системах среди пассажиров. Он позволяет транспортным агентствам публиковать свои данные в формате, который может быть использован широким кругом программных приложений. Сегодня формат данных GTFS используется тысячами поставщиков общественного транспорта.

GTFS состоит из двух основных частей: GTFS Schedule и GTFS Realtime. GTFS Schedule содержит информацию о маршрутах, расписаниях, тарифах и географических особенностях транзита и представлена в виде простых текстовых файлов. Такой простой формат позволяет легко создавать и MAINTENANCE систему, не прибегая к использованию сложного или проприетарного программного обеспечения.

GTFS Realtime содержит обновления поездок, местоположения транспортных средств и сервисные предупреждения. Он основан на протокольных буферах, которые представляют собой нейтральный с точки зрения языка (и платформы) механизм сериализации структурированных данных.

GTFS поддерживается во всем мире, и ее использование, важность и масштабы постоянно растут. Вполне вероятно, что знакомое вам агентство уже использует GTFS для представления маршрутов, расписания, местоположения остановок и другой информации, а пассажиры уже пользуются ею через различные приложения.

[Подробнее об истории создания GTFS](background.md)

## Почему стоит использовать GTFS?

GTFS используется более чем 10 000 транзитных агентств в более чем 100 странах мира. Большинство транзитных агентств слышали о GTFS, и она быстро стала отраслевым стандартом. Некоторые агентства сами создают эти данные, другие нанимают поставщика для создания и поддержки данных. Поскольку этот стандарт является простым текстовым открытым стандартом, многие поставщики транзитных технологий уже умеют читать и записывать файлы GTFS. Более глубокое понимание GTFS позволяет агентствам делать более правильный выбор при работе с данными. Выбор, который делают агентства в отношении того, как поддерживать и распространять GTFS, может оказать огромное влияние на качество обслуживания.

### Открытые данные - это больше возможностей и выбора

GTFS является открытым стандартом. Это означает, что агентства могут предоставлять информацию с помощью любого из многочисленных инструментов, которые уже поддерживают GTFS (включая простое редактирование текста с помощью текстового редактора или электронной таблицы). Открытые стандарты позволяют создавать данные, которыми можно легко обмениваться. Фид - это просто набор текстовых файлов, описывающих сервис, размещенный в Интернете по общедоступной ссылке. Один и тот же фид может использоваться Google, Apple, Transit App, Open Trip Planner и даже приложениями, созданными самими пассажирами. Любой, кто хочет предоставлять точную и актуальную информацию о транспорте, может использовать для этого фид GTFS.

Некоторые пассажиры предпочитают использовать различные приложения в зависимости от своих потребностей - наличие GTFS позволяет им выбирать, какое приложение для планирования поездок им больше подходит. Некоторые приложения могут быть более доступными или лучше предоставлять информацию для пассажиров с ограниченными возможностями, некоторые могут быть более простыми и удобными в использовании, а иногда пассажиры просто хотят иметь самое новое приложение.

### GTFS, вероятно, может больше, чем вы думаете

GTFS наиболее широко известна благодаря информации о планировании поездок, особенно в районах метрополитена с фиксированным маршрутным сообщением. Однако помимо базовой спецификации GTFS Schedule существует целый ряд дополнительных функций, которые делают GTFS более широко применимой, включая Fares для отображения стоимости и структуры тарифов, Flex (находится в разработке) для опций транзита, реагирующих на спрос, таких как dial-a-ride и паратранзитные услуги, и Pathways для отображения информации о доступности, которая важна для пассажиров, использующих мобильные устройства или нуждающихся в дополнительных приспособлениях. GTFS Realtime опирается на GTFS Schedule и бортовые GPS-системы, обеспечивая обновление информации о местонахождении транспортных средств в режиме реального времени.

### GTFS - это больше, чем просто планирование поездок

В настоящее время данныеGTFS используются различными программными приложениями для самых разных целей, включая визуализацию данных и инструменты анализа для планирования. Наличие актуальных и качественных данных позволяет получать точную информацию о транспорте не только пассажирам, но и специалистам по планированию и разработке политики, которые могут лучше понять, как используется транспорт в их населенных пунктах. Начиная с 2023 года, Федеральное управление транзитных перевозок США будет требовать от [транзитных агентств представлять достоверные данные GTFS](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications) вместе с ежегодным отчетом по Национальной базе данных о транзитных перевозках.

## Что такое высококачественная GTFS?

Высококачественная GTFS является полной, точной и актуальной. Это означает, что она отражает текущую работу служб и предоставляет максимально возможный объем информации.

### Полные данные

Качественные GTFS включают в себя важные сведения об услугах, такие как изменения в расписании в HOLIDAY и летние дни, точное расположение остановок, названия маршрутов и вывески, соответствующие другим материалам, предназначенным для пассажиров. Даже если агентство сотрудничает с поставщиком для подготовки GTFS, в конечном итоге именно оно должно обеспечить соответствие информации, представленной в печатном виде, на борту и в Интернете.

Информацию о создании высококачественных данных можно найти в [Руководстве по сбору данных о транзитных перевозках в Калифорнии](https://dot.ca.gov/cal-itp/california-transit-data-guidelines) и в разделе [Лучшие практики GTFS](schedule/best-practices).

### Актуальность

Наличие устаревших данных почти хуже, чем их полное отсутствие. Недостаточно просто опубликовать информацию - она должна соответствовать тому, что видит и ощущает пассажир. Некоторые крупнейшие транспортные агентства обновляют свои GTFS еженедельно или даже ежедневно, но большинству агентств необходимо обновлять свои GTFS раз в несколько месяцев или несколько раз в год, когда происходит изменение сервиса. Это касается таких моментов, как появление новых маршрутов или остановок, изменение расписания или структуры тарифов.

Многие агентства нанимают поставщика для создания и управления GTFS. Некоторые поставщики могут активно интересоваться изменениями в обслуживании, но важно, чтобы агентства сообщали поставщикам о предстоящих изменениях в обслуживании. Можно заранее опубликовать GTFS с изменениями в услугах, чтобы переход прошел гладко для всех - агентств, поставщиков, планировщиков поездок и пассажиров!

