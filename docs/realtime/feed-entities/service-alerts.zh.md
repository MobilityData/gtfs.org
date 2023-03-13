# Service Alerts

服务提醒允许你在网络上出现中断时提供更新。个人行程的延误和取消通常应该使用[trip updates](trip-updates.md)来通知。

你可以选择提供以下内容。

*   URL - 链接到你的网站，解释更多关于警报的内容
*   Header text - 警报的摘要
*   Description - 警报的完整描述，将始终显示在标题旁边（因此不应重复这一信息）。

## TimeRange

警报将在给定的时间范围内适当地显示。这个范围应该涵盖该警报对乘客有用的整个时间。

如果没有给定时间，我们将显示警报的时间，只要它是在饲料中。如果给出了多个范围，我们将在所有范围内显示。

## EntitySelector

实体选择器允许你准确地指定这个警报影响到网络的哪些部分，这样我们就可以只向用户显示最合适的警报。你可以为影响多个实体的警报包括多个实体选择器。

实体是用它们的GTFS标识符选择的，你可以选择以下任何一种。

*   Agency - 影响整个网络
*   Route - 影响整个航线
*   Route type - 影响该类型的任何路线，如所有地铁。
*   Trip - 影响一个特定的行程
*   Stop - 影响一个特定的站

你可以在一个`informed_entity`中包括以上列出的一个以上的字段。当多个字段被包含在一个`informed_entity`中时，它们应该被解释为被`AND`逻辑运算符连接。换句话说，警报应该只在满足`informed_entity`中提供的所有字段的情况下被应用。例如，如果`route_id:"1"`和`stop_id:"5"`都包含在一个`informed_entity`中，那么警报应该只适用于路线1和站点5。 它不应该适用于1号路线的任何其他站点，也不应该适用于5号站点的任何其他路线。

如果你想表示一个影响超过一个实体的警报（例如，对路线1和站点5的警报），你应该给你的`alert`添加多个`informed_entity`，每个都适用于受影响的实体（例如，一个`informed_entity`包括路线1和另一个`informed_entity`包括站点5）。

## Cause

这个警报的原因是什么？你可以指定以下的一个。

*   Unknown cause
*   Other cause（不代表这些选项中的任何一个）。
*   Technical problem
*   Strike
*   Demonstration
*   Accident
*   Holiday
*   Weather
*   Maintenance
*   Construction
*   Police activity
*   Medical emergency

## Effect

这个问题对指定实体有什么影响？你可以指定以下之一。

*   No service
*   Reduced service
*   Significant delays（不重要的延误应该只通过[trip updates](trip-updates.md)提供）。
*   Detour
*   Additional service
*   Modified service。运营与乘客通常期望的不同。 一个例子是提醒乘客即将到来的假日时间表，该时间表与一周内的正常服务不同。
*   Stop moved
*   Other effect（不代表这些选项中的任何一个）。
*   Unknown effect
*   No effect。警报向乘客提供信息，但不影响运营。 这方面的例子包括为公众会议做广告，通过调查征求反馈意见。
*   Accessibility issue。警报提供有关影响无障碍通道的无障碍问题的信息。例子包括停用的电梯或可移动的坡道。
