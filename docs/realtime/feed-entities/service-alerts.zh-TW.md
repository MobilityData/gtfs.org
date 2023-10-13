# Service Alerts

服務警報允許您在網絡中斷時提供更新。個別行程的延誤和取消通常應使用[trip updates](trip-updates.md)進行傳達。

您可以選擇提供以下內容：

*   URL - 鏈接到您的站點，詳細說明警報
*   Header text - 警報摘要
*   Description - 警報的完整說明，將始終顯示在標題旁邊（因此不應重複此信息）。

## TimeRange

警報將在給定時間範圍內的適當位置顯示。該範圍應涵蓋提醒對乘客有用的整個時間。

如果沒有給出時間，我們將在提要中顯示警報。如果給出了多個範圍，我們將在所有範圍內顯示。

## EntitySelector

實體選擇器允許您準確指定此警報影響網絡的哪些部分，以便我們可以僅向用戶顯示最合適的警報。您可以為影響多個實體的警報包含多個實體選擇器。

使用實體的 GTFS 標識符選擇實體，您可以選擇以下任何一項：

*   Agency - 影響整個網絡
*   Route - 影響整條路線
*   Route type - 影響該類型的任何路線。例如所有地鐵。
*   Trip - 影響特定行程
*   Stop - 影響特定的停止

您可以在一個`informed_entity`中包含以上列出的多個字段。當多個字段包含在一個`informed_entity`中時，它們應該被解釋為由`AND`邏輯運算符連接。換句話說，警報只應在滿足`informed_entity`中提供的所有字段的上下文中應用。例如，如果`route_id: "1"`和`stop_id: "5"`都包含在一個`informed_entity`中，則警報應僅應用於路線 1 的第 5 站。它不應應用於路線 1 上的任何其他站點，並且它不應應用於第 5 站的任何其他路線。

如果您想表示影響多個實體的警報（例如路線 1 和停靠點 5 的警報），您應該將多個`informed_entity`添加到您的`alert`中，每個實體都應用於受影響的實體（例如一個`informed_entity` that包括路線 1 和另一個包含停靠點 5 的`informed_entity` ）。

## Cause

此警報的原因是什麼？您可以指定以下內容之一：

*   Unknown cause
*   Other cause（不代表這些選項中的任何一個）
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

這個問題對指定實體有什麼影響？您可以指定以下內容之一：

*   No service
*   Reduced service
*   Significant delays（無關緊要的延誤只能通過[trip updates](trip-updates.md)提供）。
*   Detour
*   Additional service
*   Modified service：操作與騎手通常期望的不同。一個例子是提醒騎手即將到來的假期時間表的警報，該時間表與一周中的那一天的正常服務不同。
*   Stop moved
*   Other effect（未由任何這些選項表示）
*   Unknown effect
*   No effect：警報向騎手提供信息，但不影響操作。示例包括宣傳公開會議和通過調查徵求反饋。
*   Accessibility issue：該警報提供有關影響無障礙訪問的輔助功能問題的信息。示例包括停用的電梯或可移動的坡道。
