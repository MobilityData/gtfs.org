---
search:
  exclude: true
---

# GTFS Realtime 概述

<div class="landing-page">
   <a class="button" href="reference">参考资料</a>
   <a class="button" href="best-practices">最佳实践
</a>  <a class="button" href="feed-examples">实例
</a>  <a class="button" href="changes">变化
</a></div>

## 开始使用

为用户提供实时的交通数据更新，可以大大增强他们对您的交通服务的体验。提供有关当前到达和出发时间的最新信息，使用户能够顺利地计划他们的旅行。因此，在不幸发生延误的情况下，乘客知道他们可以在家里多呆一会儿，就会松一口气。

GTFS Realtime是一个馈送规范，允许公共交通机构向应用程序开发人员提供有关其车队的Realtime更新。它是 [GTFS](../schedule/reference) (General Transit Feed Specification）的扩展，是一种用于公共交通时刻表和相关地理信息的开放数据格式。GTFS Realtime是围绕着易于实施、良好的GTFS互操作性和对乘客信息的关注而设计的。

该规范是由最初的[实时交通更新](https://developers.google.com/transit/google-transit#LiveTransitUpdates)伙伴机构、一些交通开发商和谷歌合作设计的。该规范在[Apache 2.0许可](https://www.apache.org/licenses/LICENSE-2.0.html)下发布。

## 我如何开始？

1.  继续阅读下面的概述。
2.  决定你将提供哪些[feed实体](feed-entities)。
3.  看一看[例子](feed-examples)中的feeds。
4.  使用[参考资料](reference)创建你自己的Feeds。
5.  [发布你的feed](best-practices/#feed-publishing-general-practices)。

## GTFS Realtime馈送的概述

该规范目前支持以下类型的信息。

*   **旅程更新**- 延误、取消、改变路线
*   **服务警报**--站台移动，影响车站、路线或整个网络的意外事件
*   **车辆位置**--关于车辆的信息，包括位置和拥堵程度

一个信息源可以，尽管不需要，结合不同类型的实体。馈送是通过HTTP提供的，并经常更新。文件本身是一个普通的二进制文件，所以任何类型的网络服务器都可以托管和提供该文件（也可以使用其他传输协议）。另外，也可以使用网络应用服务器，作为对有效的HTTP GET请求的响应，它将返回饲料。对于更新或检索饲料的频率和具体方法没有任何限制。

因为GTFS Realtime系统允许你展示你的车队的_实际_状态，所以馈送需要定期更新--最好是在你的自动车辆定位系统传来新数据时。

[关于馈送实体的更多信息...](feed-entities)

## 数据格式

GTFS Realtime数据交换格式是基于[协议缓冲区](https://developers.google.com/protocol-buffers/)的。

协议缓冲区是一种language和平台中立的机制，用于序列化结构化数据（想想XML，但更小、更快、更简单）。数据结构在[gtfs-realtime.proto](proto)文件中定义，然后用来生成源代码，以便使用各种语言--如Java、C++或Python--从各种数据流中轻松读写你的结构化数据。

[更多关于协议缓冲区....](https://developers.google.com/protocol-buffers/)

## 数据结构

元素的层次结构和它们的类型定义在[gtfs-realtime.proto](proto)文件中指定。

这个文本文件用于在您选择的language中生成必要的库。这些库提供生成有效的GTFS Realtime馈送所需的类和函数。这些库不仅使饲料创建更容易，而且还确保只产生有效的饲料。

[关于数据结构的更多信息...](reference)

## 获得帮助

要参与围绕GTFS Realtime的讨论，并对规范的修改和补充提出建议，请加入[GTFS Realtime mailing list](https://groups.google.com/group/gtfs-realtime)邮件列表，并关注[google/transit GitHub仓库](https://github.com/google/transit)中的对话。

## 谷歌地图和实时交通更新

使用GTFS Realtime的可能应用之一是[实时交通更新](https://developers.google.com/transit/google-transit#LiveTransitUpdates)，这是谷歌地图中的一项功能，为用户提供Realtime交通信息。如果你所在的公共交通机构对向谷歌地图提供Realtime更新感兴趣，请访问[谷歌交通合作伙伴页面](https://maps.google.com/help/maps/transit/partners/live-updates.html)。
