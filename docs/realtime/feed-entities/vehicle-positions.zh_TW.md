# Vehicle Positions

Vehicle position用於提供自動生成的有關車輛位置的信息，例如來自車載 GPS 設備的信息。應為每輛能夠提供它的車輛提供一個單一的車輛位置。

車輛當前服務的行程應通過[TripDescriptor](../reference.md#message-tripdescriptor)給出。您還可以提供一個[VehicleDescriptor](../reference.md#message-vehicledescriptor) ，它指定您要提供更新的精確物理車輛。下面提供了文檔。

可以提供表示獲取位置讀數的時間的**timestamp**。請注意，這與提要標頭中的時間戳不同，後者是服務器生成此消息的時間。

也可以提供**Current passage**（作為`stop_sequence`或`stop_id` ）。這是對車輛正在前往或已經停在的站點的引用。

## Position

Position 包含 Vehicle Position 中的位置數據。緯度和經度是必需的，其他字段是可選的。這些類型的數據是：

*   **Latitude**- 北度，在 WGS-84 坐標系中
*   **Longitude**- 東度，在 WGS-84 坐標系中
*   **Bearing**- 車輛朝向的方向
*   **Odometer**- 車輛行駛的距離
*   **Speed**——車輛測量的瞬時速度，以米/秒為單位

## CongestionLevel

Vehicle position還允許該機構指定車輛當前遇到的擁堵程度。擁塞可分為以下幾類：

*   Unknown congestion level
*   Running smoothly
*   Stop and go
*   Congestion
*   Severe congestion

由該機構將您歸類為每種擁堵類型。我們的指導意見是，嚴重擁堵僅在交通擁堵到人們離開汽車的情況下使用。

## OccupancyStatus

Vehicle position還允許該機構指定車輛的乘客佔用程度。入住狀態可分為以下幾類：

*   Empty
*   Many seats available
*   Few seats available
*   Standing room only
*   Crushed standing room only
*   Full
*   Not accepting passengers

該字段仍處於**實驗階段**，可能會發生變化。它可能在未來被正式採用。

## VehicleStopStatus

Vehicle stop status賦予車輛與當前正在接近或處於的停止相關的狀態的更多含義。它可以設置為這些值中的任何一個。

*   **Incoming at** - 車輛即將到達參考站點
*   **Stopped at**- 車輛停在參考停靠點
*   **In transit to** - 參考站是車輛的下一站 -**默認**

## VehicleDescriptor

VehicleDescriptor 描述了精確的物理車輛，可以包含以下任何屬性：

*   **ID** - 車輛的內部識別系統。應該是唯一的車輛
*   **Label**- 用戶可見標籤 - 例如火車名稱
*   **License plate**- 車輛的實際車牌
