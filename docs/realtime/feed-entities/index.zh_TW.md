# 提要實體

GTFS Realtime 支持三種不同類型的實時數據，它們可以結合在一個實時源中。下面給出了摘要，相關部分提供了完整的文檔。

## Trip Updates

#### “公交車 X 晚點 5 分鐘”

Trip Updates代表時間表的波動。我們希望收到您安排的所有實時旅行的Trip Updates。這些更新會給出沿途停靠點的預計到達或離開。Trip Updates還可以提供更複雜的場景，其中行程被取消、添加到日程表中，甚至重新安排行程。

[更多關於Trip Updates...](trip-updates.md)

## Service Alerts

#### “Y站因施工關閉”

Service alerts表示特定實體的更高級別問題，並且通常採用中斷的文本描述形式。

它們可能代表以下問題：

*   車站
*   線條
*   全網
*   等等

Service alerts通常包含一些描述問題的文本，我們還允許使用 URL 獲取更多信息以及更多結構化信息，以幫助我們了解此service alerts影響的對象。

[有關Service Alerts的更多信息...](service-alerts.md)

## Vehicle Positions

#### “這輛公共汽車在時間 Y 位於位置 X”

Vehicle positions表示有關網絡上特定車輛的一些基本信息。

最重要的是車輛所在的緯度和經度，但我們也可以使用車輛當前速度和里程表讀數的數據。

[有關Vehicle Positions更新的更多信息...](vehicle-positions.md)

## 關於飼料類型的歷史評論

GTFS Realtime 規範的早期版本要求每個提要僅包含一種類型的實體。將合併模式轉換為按類型供稿模式的示例工具位於 Bliksem Labs [gtfsrt-examples](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py) GitHub 存儲庫中。
