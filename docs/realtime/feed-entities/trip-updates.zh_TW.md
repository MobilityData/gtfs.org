# Trip Updates

行程更新代表時間表的波動。我們希望收到您安排的所有實時旅行的旅行更新。這些更新會給出沿途停靠點的預計到達或離開時間。行程更新還可以提供更複雜的場景，其中行程被取消或添加到日程表中，甚至重新安排行程。

**提醒：**在[GTFS](../../schedule/reference.md)中，行程是在特定時間發生的兩個或更多站點的序列。

每個預定行程**最多**應有一個行程更新。如果預定行程沒有行程更新，則得出該行程沒有實時數據可用的結論。數據消費者**不應**假定行程準時運行。

如果車輛在同一個街區內服務於多個行程（有關行程和街區的更多信息，請參閱[GTFS trips.txt](../../schedule/reference.md#tripstxt) ）：

*   提要應包含車輛當前提供的行程的 TripUpdate。如果生產者對這些未來行程的預測質量有信心，則鼓勵生產者在當前行程之後的一次或多次行程中包含 TripUpdates。包括同一車輛的多個 TripUpdates 可以避免在車輛從一個行程過渡到另一個行程時對騎手的預測“突然出現”，並且還可以提前通知騎手影響下游行程的延誤（例如，當已知的延誤超過行程之間的計劃停留時間時).
*   各個 TripUpdate 實體不需要按照它們在塊中安排的相同順序添加到提要中。例如，如果有`trip_ids` 1、2 和 3 的行程都屬於一個街區，並且車輛行駛行程 1，然後是行程 2，然後是行程 3，則`trip_update`實體可能以任何順序出現 - 例如，允許添加行程 2，然後是行程 1，然後是行程 3。

## StopTimeUpdate

行程更新包括對車輛停止時間的一次或多次更新，稱為[StopTimeUpdates](../reference.md#message-stoptimeupdate) 。這些可以為過去和未來的停止時間提供。您可以（但不是必須）放棄過去的停止時間。生產者不應刪除過去的`StopTimeUpdate` ，如果它指的是給定行程的未來預定到達時間的停靠站（即車輛提前通過停靠站），否則將得出沒有更新的結論這一站。

例如，如果以下數據出現在 GTFS-rt 提要中：

*   第 4 站 – 預計上午 10:18（預計上午 10:20 – 提前 2 分鐘）
*   第 5 站 - 預計上午 10:30（預定上午 10:30 - 準時）

...直到上午 10 點 21 分才能從提要中刪除對第 4 站的預測，即使公共汽車實際上在上午 10 點 18 分經過該站點。如果第 4 站的`StopTimeUpdate`在上午 10:18 或 10:19 從提要中刪除，並且預定到達時間為上午 10:20，那麼消費者應該假設此時沒有第 4 站的實時信息，並且應使用來自 GTFS 的時間表數據。

每個[StopTimeUpdate](../reference.md#message-stoptimeupdate)都鏈接到一個停止點。通常這可以使用 GTFS stop_sequence 或 GTFS stop_id 來完成。但是，如果您為沒有 GTFS trip_id 的行程提供更新，則必須指定 stop_id，因為 stop_sequence 沒有值。 stop_id 仍必須引用 GTFS 中的 stop_id。如果同一 stop_id 在一次行程中被多次訪問，則應在該行程中為該 stop_id 的所有 StopTimeUpdates 中提供 stop_sequence。

更新可以使用[StopTimeEvent](../reference.md#message-stoptimeevent)在[StopTimeUpdates](../reference.md#message-stoptimeupdate)中的停靠站提供**arrival**和/或**departure**的準確時間。這應該包含絕對**time**或**delay**（即與計劃時間的偏移量，以秒為單位）。延遲只能在行程更新指的是計劃的 GTFS 行程而不是基於頻率的行程的情況下使用。在這種情況下，時間應該等於預定時間+延遲。您還可以指定預測的**uncertainty**以及[StopTimeEvent](../reference.md#message-stoptimeevent) ，這在頁面下方的[不確定性](#uncertainty)部分中有更詳細的討論。

對於每個[StopTimeUpdate](../reference.md#message-stoptimeupdate) ，默認的調度關係是已**scheduled**的。 （請注意，這與行程的日程安排關係不同）。如果停靠點不會停止，您可以將其更改為**skipped**，或者如果您只有部分行程的實時數據，則可以將其更改為**no data**。

**更新應按 stop_sequence** （或按它們在行程中出現的順序的 stop_ids）排序。

如果行程中缺少一個或多個停靠點，則更新的`delay` （或者，如果更新中僅提供`time` ，則通過將`time`與 GTFS 計劃時間進行比較計算出的延遲）將傳播到所有後續停靠點。這意味著在沒有任何其他信息的情況下，更新某個停靠站的停靠時間將更改所有後續停靠站。請注意，計劃關係為`SKIPPED`的更新不會停止延遲傳播，但計劃關係為`SCHEDULED` （如果未提供計劃關係，這也是默認值）或`NO_DATA`的更新將停止。

**示例 1**

對於有 20 個停靠點的行程，對於當前停靠點的[stop_sequence](../reference.md#message-stoptimeupdate) ，到達延遲和出發延遲為 0 ( [StopTimeEvents](../reference.md#message-stoptimeevent) ) 的 [StopTimeUpdate](../reference.md#message-stoptimeupdate) 意味著行程準時。

**示例 2**

對於同一個行程實例，提供了三個[StopTimeUpdates](../reference.md#message-stoptimeupdate) ：

*   stop_sequence 3 延遲 300 秒
*   stop_sequence 8 延遲 60 秒
*   `NO_DATA`的[ScheduleRelationship](../reference.md#enum-schedulerelationship) for stop_sequence 10

這將被解釋為：

*   stop_sequences 1,2 有未知延遲。
*   stop_sequences 3,4,5,6,7 有 300 秒的延遲。
*   stop_sequences 8,9 有 60 秒的延遲。
*   停止序列 10,..,20 有未知延遲。

## TripDescriptor

TripDescriptor 提供的信息取決於您正在更新的行程的日程安排關係。有許多選項供您設置：

| _**價值**_ | _**評論**_                                                               |
| -------- | ---------------------------------------------------------------------- |
| **Scheduled**  | 此行程根據 GTFS 計劃運行，或者距離足夠近以仍與其相關聯。                                        |
| **Added**   | 此行程未安排，已添加。例如，為了應對需求，或更換發生故障的車輛。                                       |
| **Unscheduled**  | 此行程正在運行，並且從不與時間表相關聯。例如，如果沒有時刻表並且公交車運行穿梭服務。                             |
| **Canceled**   | 此行程已安排，但現在已刪除。                                                         |
| **Duplicated**  | 此新行程是靜態 GTFS 中現有行程的副本，但服務開始日期和時間除外。新行程將在 TripProperties 中指定的服務日期和時間運行。 |

在大多數情況下，您應該在 GTFS 中提供與此更新相關的計劃行程的 trip_id。

#### 具有重複 trip_id 的系統

對於使用重複 trip_id 的系統，例如使用 frequencies.txt 建模的行程，即基於頻率的行程，trip_id 本身並不是單一行程的唯一標識符，因為它缺少特定的時間組件。為了在 TripDescriptor 中唯一標識此類行程，必須提供三重標識符：

*   **trip_id**
*   **start_time**
*   **start_date**

start_time 應首先發布，任何後續提要更新在提及同一旅程時都應使用相同的 start_time。 StopTimeUpdates 應該用於指示調整； start_time 不必正好是從第一站出發的時間，儘管它應該非常接近那個時間。

例如，假設我們決定在 2015 年 5 月 25 日 10:00，trip_id=T 的行程將從 start_time=10:10:00 開始，並在 10:01 通過實時提要提供此信息。到 10:05 時，我們突然知道旅行不是在 10:10 開始，而是在 10:13 開始。在我們新的實時提要中，我們仍然可以識別這個 tripas (T, 2015-05-25, 10:10:00)，但提供一個 StopTimeUpdate，從 10:13:00 的第一站出發。

#### 備選行程匹配

不基於頻率的旅行也可以由 TripDescriptor 唯一標識，包括以下組合：

*   **route_id**
*   **direction_id**
*   **start_time**
*   **start_date**

其中 start_time 是靜態計劃中定義的計劃開始時間，只要提供的 ID 組合解析為唯一行程即可。

## 不確定

不確定性適用於[StopTimeUpdate](../reference.md#message-stoptimeupdate)的時間和延遲值。不確定性粗略地將真實延遲中的預期誤差指定為以秒為單位的整數（但請注意，尚未定義精確的統計意義）。不確定性可能為 0，例如對於在計算機時間控制下行駛的火車。

例如，在 4 分鐘誤差窗口（即 +2 / -2 分鐘）內到達下一站的估計延遲為 15 分鐘的長途巴士的不確定性值為 240。
