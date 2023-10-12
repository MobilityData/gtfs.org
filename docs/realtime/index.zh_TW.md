---
search:
  exclude: true
---
  
# GTFS Realtime 概述

<div class=landing-page>
    <a class=button href=reference>參考</a><a class=button href=best-practices>最佳實踐</a><a class=button href=feed-examples>例子</a><a class=button href=changes>變化</a>
</div>

## 入門

為用戶提供實時的公交數據更新，極大地提升了他們對您的公交服務的體驗。提供有關當前到達和離開時間的最新信息使用戶能夠順利地計劃他們的旅行。結果，萬一不幸延誤，騎手知道他們可以在家裡多呆一會兒會鬆一口氣。

GTFS Realtime 是一種提要規範，允許公共交通機構向應用程序開發人員提供有關其車隊的實時更新。它是[GTFS](../schedule/reference) （通用交通饋送規範）的擴展，是一種用於公共交通時刻表和相關地理信息的開放數據格式。 GTFS Realtime 是圍繞易於實施、良好的 GTFS 互操作性和對乘客信息的關注而設計的。

該規範是通過最初的[實時交通更新](https://developers.google.com/transit/google-transit#LiveTransitUpdates)合作夥伴機構、一些交通開發商和谷歌的合作設計的。該規範是在[Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0.html)下發布的。

## 我該如何開始？

1.  繼續閱讀下面的概述。
2.  決定您將提供哪些[提要實體](feed-entities)。
3.  看看[示例提要](feed-examples)。
4.  使用[参考](reference)创建您自己的提要。
5.  [發布您的提要](best-practices/#feed-publishing-general-practices)。


## 的概述 GTFS Realtime 飼料

該規範目前支持以下類型的信息：

*   **行程更新** - 延誤、取消、更改路線
*   **服務警報** - 停止移動、影響車站、路線或整個網絡的不可預見事件
*   **車輛位置** - 有關車輛的信息，包括位置和擁堵程度

一個提要可以（儘管不是必需的）組合不同類型的實體。提要通過 HTTP 提供並經常更新。該文件本身是一個常規的二進製文件，因此任何類型的網絡服務器都可以託管和提供該文件（也可以使用其他傳輸協議）。或者，也可以使用 Web 應用程序服務器，它作為對有效 HTTP GET 請求的響應將返回提要。對於更新或檢索提要的頻率和確切方法沒有限制。

因為GTFSRealtime允許您展示車隊的_實際_狀態，需要定期更新提要 - 最好是每當新數據來自您的自動車輛定位系統時。

[有關提要實體的更多信息...](feed-entities)

## 數據格式

GTFS 實時數據交換格式基於 [Protocol Buffers](https://developers.google.com/protocol-buffers/)

協議緩衝區是一種與語言和平台無關的結構化數據序列化機制（想想 XML，但更小、更快、更簡單）。數據結構在 [gtfs-realtime.proto](proto) 文件中定義，然後用於生成源代碼，以便使用各種語言輕鬆地從各種數據流讀取和寫入結構化數據 -例如Java、C++ 或 Python。

[更多關於協議緩衝區...](https://developers.google.com/protocol-buffers/).

## 數據結構

元素的層次結構及其類型定義在 [gtfs-realtime.proto](proto) 文件中指定。

此文本文件用於以您選擇的編程語言生成必要的庫。這些庫提供了生成有效 GTFS 實時提要所需的類和函數。這些庫不僅使提要的創建更容易，而且還確保只生成有效的提要。

[更多關於數據結構...](reference)

## 獲得幫助

要參與圍繞 GTFS Realtime 的討論並對規範的更改和補充提出建議，請加入 [GTFS Realtime 郵件列表](http://groups.google.com/group/gtfs-realtime) 並關注 [google/transit GitHub 存儲庫](https://github.com/google/transit)。

## 谷歌地圖和實時公交更新

使用 GTFS Realtime 的可能應用程序之一是 [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates)，這是 Google 地圖中的一項功能，可為用戶提供實時交通信息。如果您為有興趣為 Google 地圖提供實時更新的公共交通機構工作，請訪問 [Google 公交合作夥伴頁面](http://maps.google.com/help/maps/transit/partners/live-updates.html)。
