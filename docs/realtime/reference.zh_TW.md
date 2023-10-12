---
search:
  exclude: true
---
  
# GTFS Realtime 參考

一個GTFS RealtimeFeed 讓公交機構可以向消費者提供有關其服務中斷（車站關閉、線路未運行、重要延誤等）車輛位置和預期的實時信息arrival次。

提要規範的 2.0 版在此站點上進行了討論和記錄。有效版本為“2.0”、“1.0”。

### 術語定義

#### 必需的

在GTFS -realtime v2.0 及更高版本，*必填*列描述了生產者必須提供哪些字段才能使傳輸數據有效並對消費應用程序有意義。

在*必填*字段中使用以下值：

*   **必填**：此字段必須由GTFS - 實時飼料生產者。
*   **有條件要求**：此字段在某些條件下是必需的，在字段*Description*中進行了概述。在這些條件之外，該字段是可選的。
*   **可選**：該字段是可選的，生產者不需要實現。但是，如果數據在基礎自動vehicle定位系統（例如，VehiclePositiontimestamp ) 建議生產者盡可能提供這些可選字段。

*請注意，語義要求未在*GTFS *-實時版本 1.0，因此提供*gtfs_realtime_version *of `1`可能不滿足這些要求（詳見[語義要求提案](https://github.com/google/transit/pull/64)）。 *

#### 基數

*基數*表示可以為特定字段提供的元素數量，具有以下值：

* **One** - 可為該字段提供單個 one 元素。這映射到[Protocol Buffer *required*和*optional* cardinalities](https://developers.google.com/protocol-buffers/docs/proto#simple) 。
* **許多**- 可以為此字段提供許多元素（0、1 或更多）。這映射到[Protocol Buffer 的*重複*基數](https://developers.google.com/protocol-buffers/docs/proto#simple)。

始終參考*必填*字段和*說明*字段以查看字段何時為必填、有條件必填或可選。請參考[GTFS](<https://github.com/google/transit/blob/master/\<glossary variable=>) [-實時/原型/](<https://github.com/google/transit/blob/master/\<glossary variable=>)GTFS [-realtime.proto">](<https://github.com/google/transit/blob/master/\<glossary variable=>)GTFS [`GTFS -realtime.proto`](<https://github.com/google/transit/blob/master/\<glossary variable=>)用於協議緩衝區基數。

#### 協議緩衝區數據類型

以下協議緩衝區數據類型用於描述提要元素：

*   message: 複合型
*   enum: 固定值列表

#### 實驗領域

標記為**實驗性**的字段可能會發生變化，尚未正式納入規範。未來可能會正式採用一個**實驗**領域。

## 元素索引

*   [FeedMessage](#message-feedmessage )
    *   [FeedHeader](#message-feedheader)
        *   [Incrementality](#enum-incrementality)
    *   [FeedEntity](#message-feedentity)
        *   [TripUpdate](#message-tripupdate)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [VehicleDescriptor](#message-vehicledescriptor)
                *   [WheelchairAccessible](#enum-wheelchairaccessible)
            *   [StopTimeUpdate](#message-stoptimeupdate)
                *   [StopTimeEvent](#message-stoptimeevent)
                *   [ScheduleRelationship](#enum-schedulerelationship)
                *   [StopTimeProperties](#message-stoptimeproperties)
            *   [TripProperties](#message-tripproperties)
        *   [VehiclePosition](#message-vehicleposition)
            *   [TripDescriptor](#message-tripdescriptor)
                *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [VehicleDescriptor](#message-vehicledescriptor)
                *   [WheelchairAccessible](#enum-wheelchairaccessible)
            *   [Position](#message-position)
            *   [VehicleStopStatus](#enum-vehiclestopstatus)
            *   [CongestionLevel](#enum-congestionlevel)
            *   [OccupancyStatus](#enum-occupancystatus)
            *   [CarriageDetails](#message-carriagedetails)
        *   [Alert](#message-alert)
            *   [TimeRange](#message-timerange)
            *   [EntitySelector](#message-entityselector)
                *   [TripDescriptor](#message-tripdescriptor)
                    *   [ScheduleRelationship](#enum-schedulerelationship-1)
            *   [Cause](#enum-cause)
            *   [Effect](#enum-effect)
            *   [TranslatedString](#message-translatedstring)
                *   [Translation](#message-translation)
            *   [SeverityLevel](#enum-severitylevel)

## 元素

## message FeedMessage

提要的內容message .每個message 流中的內容是作為對適當 HTTP GET 請求的響應而獲得的。實時饋送總是相對於現有的GTFS餵養。所有entityids 相對於GTFS餵養。

**字段**

| _**字段名稱**_ | _**類型**_                          | _**必需的**_ | _**基數**_ | _**描述**_                                                                |
| ---------- | --------------------------------- | --------- | -------- | ----------------------------------------------------------------------- |
| **header** | [FeedHeader](#message-feedheader) | 必需的       | 一        | 關於此提要和提要的元數據message .                                                    |
| **entity** | [FeedEntity](#message-feedentity) | 有條件要求     | 許多       | 提要的內容。如果有真-time公交系統可用的信息，必須提供此字段。如果這個字段是EMPTY，消費者應該假設沒有真正的-time系統可用的信息。 |


## message FeedHeader

有關提要的元數據，包含在提要消息中。

**字段**

| _**字段名稱**_                | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                                            |
| ------------------------- | -------------------------------------------------------------------------- | --------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **gtfs_realtime_version** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 供稿規範的版本。當前版本是2.0。 |
| **Incrementality**        | [Incrementality](#enum-incrementality)                                     | 必需的       | 一        |                                                                                                                                                                                                     |
| **timestamp**             | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 這個timestamp標識創建此提要的內容的時刻（在服務器中time）。在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以來的秒數）。避免time強烈建議生成和使用實時信息的系統之間的偏差timestamp從一個time服務器。使用 Stratum 3 甚至更低的 Stratum 服務器是完全可以接受的，因為time最多幾秒鐘的差異是可以容忍的。 |

## enum Incrementality

確定當前提取是否是增量的。

*   FULL_DATASET：此提要更新將覆蓋提要的所有先前實時信息。因此，本次更新預計將提供一個FULL所有已知實時信息的快照。
*   DIFFERENTIAL：目前，此模式**不受支持**，並且**未指定**使用此模式的提要的行為。有關於[GTFS](<http://groups.google.com/group/\<glossary variable=>)的討論[-實時">](<http://groups.google.com/group/\<glossary variable=>)GTFS Realtime圍繞完全指定行為的[郵件列表](<http://groups.google.com/group/\<glossary variable=>)DIFFERENTIAL模式和文檔將在這些討論完成後更新。

**價值觀**

| _**價值**_         |
| ---------------- |
| **FULL_DATASET** |
| **DIFFERENTIAL** |

## message FeedEntity

定義（或更新）entity在運輸提要中。如果entity沒有被刪除，正好是 'trip_update ', 'vehicle', 'Alert' 和 'Shape' 字段應該被填充。

**字段**

| _**字段名稱**_      | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                   |
| --------------- | -------------------------------------------------------------------------- | --------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| **id**          | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 供稿唯一標識符entity. id 僅用於提供Incrementality支持。提要引用的實際實體必須由顯式選擇器指定（請參閱EntitySelector下面了解更多INFO）。 |
| **is_deleted**  | [bool](https://developers.google.com/protocol-buffers/docs/proto#scalar)   | 可選的       | 一        | 這是否entity將被刪除。應該只為帶有Incrementality的DIFFERENTIAL- 不應為包含以下內容的提要提供此字段Incrementality的FULL_DATASET.                                             |
| **trip_update** | [TripUpdate](#message-tripupdate)                                          | 有條件要求     | 一        | 實時數據departure的延誤trip.至少其中一個字段trip_update ,vehicle,Alert， 或者Shape必須提供 - 所有這些字段都不能EMPTY.                                                     |
| **vehicle**     | [VehiclePosition](#message-vehicleposition)                                | 有條件要求     | 一        | 實時數據Position一個vehicle.至少其中一個字段trip_update ,vehicle,Alert， 或者Shape必須提供 - 所有這些字段都不能EMPTY.                                                    |
| **Alert**       | [Alert](#message-alert)                                                    | 有條件要求     | 一        | 實時數據Alert.至少其中一個字段trip_update ,vehicle,Alert， 或者Shape必須提供 - 所有這些字段都不能EMPTY.                                                                |
| **Shape**       | [Shape](#message-shape)                                                    | 有條件要求     | 一        | 實時數據ADDED形狀，例如對於DETOUR.至少其中一個字段trip_update ,vehicle,Alert， 或者Shape必須提供 - 所有這些字段都不能EMPTY.<br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |


## message TripUpdate

實時更新進度vehicle沿著一個trip.另請參閱[行程](</realtime/\<glossary variable=>)的一般討論[-更新">](</realtime/\<glossary variable=>)trip[更新實體](</realtime/\<glossary variable=>)。

取決於價值ScheduleRelationship， 一個TripUpdate可以指定：

*   一個trip按照時間表進行。
*   一個trip沿著一條路線前進，但沒有固定的時間表。
*   一個trip那是ADDED或刪除關於時間表。
*   一個新的trip這是現有的副本trip在靜態GTFS .它將在服務日期運行，並且time中指定TripProperties .

更新可能是未來的，預測的arrival/departure事件，或已經發生的過去事件。在大多數情況下，關於過去事件的信息是一個測量值，因此它uncertainty建議值為 0。儘管可能存在不成立的情況，因此允許具有uncertainty過去事件的值不同於 0。如果有更新uncertainty不是 0，要么更新是一個近似預測trip尚未完成或測量不精確或更新是對過去的預測，在事件發生後尚未得到驗證。

如果一個vehicle正在為同一個街區內的多個行程提供服務（有關行程和街區的更多信息，請參閱GTFStrips.txt ):

*   提要應包括TripUpdate為了trip目前由vehicle.鼓勵生產者在當前行程之後包含一次或多次行程的 TripUpdatestrip在這vehicle的塊，如果生產者對這些未來的預測質量有信心trip(s)。包括相同的多個 TripUpdatesvehicle避免對騎手的預測“彈出”作為vehicle從一個過渡trip到另一個人，並提前通知乘客影響下游行程的延誤（例如，當已知delay超過計劃的旅行之間的停留時間）。
*   各自的TripUpdate實體不需要是ADDED以與它們相同的順序添加到提要中SCHEDULED在塊中。例如，如果存在`trip_ids` 1、2 和 3 的行程都屬於一個街區，則vehicle旅行trip1，那麼trip2，然後trip3、trip_update實體可以按任何順序出現 - 例如，添加trip2、那麼trip1，然後trip3 是允許的。

請注意，更新可以描述一個trip已經完成了。到此end, 提供最後一站的更新就足夠了trip.如果time的arrival在最後一站是過去，客戶會得出結論，整個trip是過去的（儘管無關緊要，也可以為之前的停靠點提供更新）。此選項與trip已提前完成，但按照計劃，trip目前仍在進行中time.刪除此更新trip可以讓客戶假設trip仍在進行中。請注意，允許但不是必須的提要提供者清除過去的更新 - 這是實際有用的一種情況。

**字段**

| _**字段名稱**_           | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_|
| -------------------- | -------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**             | [TripDescriptor](#message-tripdescriptor)                                  | 必需的       | 一        | 這trip這message 適用於。最多可以有一個TripUpdateentity對於每個實際trip實例。如果沒有，則意味著沒有可用的預測信息。它確實_不是_意味著trip正在按計劃進行。 |
| **vehicle**          | [VehicleDescriptor](#message-vehicledescriptor)                            | 可選的       | 一        | 附加信息vehicle這是服務這個trip.                                                                                                                                                                                                                                                                                                                          |
| **stop_time_update** | [StopTimeUpdate](#message-stoptimeupdate)                                  | 有條件要求     | 許多       | 更新行程的 StopTimes（未來，即預測，在某些情況下，過去的，即已經發生的）。更新必須排序stop_sequence, 併申請到下一個指定的行程的所有以下停靠站stop_time_update.最後一個stop_time_update必須提供行程除非行程。schedule_relationship被取消、刪除或重複。如果行程被取消或刪除，則無需提供 stop_time_updates。如果為取消或刪除的行程提供了 stop_time_updates，則該行程。schedule_relationship優先於任何 stop_time_updates 及其關聯schedule_relationship .如果行程重複，可以提供stop_time_updates來指示新行程的實時信息。|
| **timestamp**        | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 最近的時刻vehicle是真的——time測量進度以估計未來的停止時間。當提供過去的 StopTimes 時，arrival/departure次可能早於該值。在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以來的秒數）。 |
| **delay**            | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可選的       | 一        | 目前的進度偏差trip.delay僅應在相對於某些現有時間表給出預測時指定GTFS .<br/>delay（以秒為單位）可以是正數（意味著vehicle遲到）或否定（意味著vehicle提前了）。 delay為 0 意味著vehicle正好在time.<br/>delayStopTimeUpdates 中的信息優先於trip-等級delay信息，這樣trip-等級delay只傳播到下一站trip與StopTimeUpdatedelay指定的值。 <br/>強烈建議飼料供應商提供TripUpdate.timestamp值指示何時delay最後更新值，以評估數據的新鮮度。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **trip_properties**  | [TripProperties](#message-tripproperties)                                  | 可選的       | 一        | 提供更新的屬性trip.<br/><br/>**警告：**這個message 還是**實驗**，並且可能會發生變化。將來可能會正式採用。 |

## message StopTimeEvent

單個預測事件的時間信息（arrival或者departure）。時序包括delay和/或估計time， 和uncertainty.

*   delay當預測是相對於一些現有的時間表給出時，應該使用GTFS .
*   time應該給出是否有預測的時間表。如果兩者time和delay被指定，time將優先（雖然通常，time, 如果給定一個SCHEDULEDtrip, 應該等於SCHEDULEDtime在GTFS +delay）。

uncertainty同樣適用於兩者time和delay.這uncertainty粗略指定 true 中的預期誤差delay（但請注意，我們尚未定義其精確的統計意義）。這是可能的uncertainty為 0，例如在計算機定時控制下行駛的火車。


**字段**

| _**字段名稱**_      | _**類型**_                                                                  | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                      |
| --------------- | ------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **delay**       | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | delay（以秒為單位）可以是正數（意味著vehicle遲到）或否定（意味著vehicle提前了）。 delay為 0 意味著vehicle正好在time.任何一個delay或者time必須在一個StopTimeEvent- 兩個字段都不能EMPTY. |
| **time**        | [int64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 絕對事件time.在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以來的秒數）。任何一個delay或者time必須在一個StopTimeEvent- 兩個字段都不能EMPTY.                 |
| **uncertainty** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       |一        | 如果uncertainty被省略，它被解釋為未知。要指定完全確定的預測，請將其設置為uncertainty為 0。 |

## message StopTimeUpdate

實時更新arrival和/或departure給定停止的事件trip.另請參閱停止的一般討論time[消息](<#\<glossary variable=>)中的更新[-tripdescriptor">](<#\<glossary variable=>)TripDescriptor和[旅行](</realtime/\<glossary variable=>)[-更新">](</realtime/\<glossary variable=>)trip[更新實體](</realtime/\<glossary variable=>)文檔。

可以為過去和未來的事件提供更新。儘管不是必需的，但允許生產者刪除過去的事件。更新鏈接到特定的停止，或者通過stop_sequence或者stop_id ，因此必須設置這些字段之一。如果一樣stop_id在一次訪問中不止一次trip， 然後stop_sequence應在所有 StopTimeUpdates 中為此提供stop_id在那trip.


**字段**

| _**字段名稱**_                     | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                                                                                                   |
| ------------------------------ | -------------------------------------------------------------------------- | --------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **stop_sequence**              | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 必須與中相同stop_times.txt在相應的GTFS餵養。任何一個stop_sequence或者stop_id必須在一個StopTimeUpdate- 兩個字段都不能EMPTY.stop_sequence訪問相同的旅行需要stop_id不止一次（例如，一個循環）來消除預測是針對哪個停止的歧義。如果`StopTimeProperties.assigned_stop_id`被填充，那麼`stop_sequence`必須填充。 |
| **stop_id**                    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 必須與中相同stops.txt在相應的GTFS餵養。任何一個stop_sequence或者stop_id必須在一個StopTimeUpdate- 兩個字段都不能EMPTY.如果`StopTimeProperties.assigned_stop_id`已填充，最好省略`stop_id`並且只使用`stop_sequence`.如果`StopTimeProperties.assigned_stop_id`和`stop_id`人口稠密，`stop_id`必須匹配`assigned_stop_id` . |
| **arrival**                    | [StopTimeEvent](#message-stoptimeevent)                                    | 有條件要求     | 一        | 如果schedule_relationship是EMPTY或者SCHEDULED， 任何一個arrival或者departure必須在一個StopTimeUpdate- 兩個字段都不能EMPTY.arrival和departure可能兩者都是EMPTY什麼時候schedule_relationship是SKIPPED.如果schedule_relationship是 NO_DATA，arrival和departure一定是EMPTY.                                |
| **departure**                  | [StopTimeEvent](#message-stoptimeevent)                                    | 有條件要求     | 一        | 如果schedule_relationship是EMPTY或者SCHEDULED， 任何一個arrival或者departure必須在一個StopTimeUpdate- 兩個字段都不能EMPTY.arrival和departure可能兩者都是EMPTY什麼時候schedule_relationship是SKIPPED.如果schedule_relationship是 NO_DATA，arrival和departure一定是EMPTY.                                |
| **departure_occupancy_status** | [OccupancyStatus](#enum-occupancystatus)                                   | 可選的       | 一        | 預計客座率vehicle之後立馬departure從給定的停止。如果提供，stop_sequence必須提供。提供departure_occupancy_status不提供任何真實的timearrival或者departure預測，填充此字段並設置StopTimeUpdate.schedule_relationship = NO_DATA。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **schedule_relationship**      | [ScheduleRelationship](#enum-schedulerelationship)                         | 可選的       | 一        | 默認關係是SCHEDULED.                                                                                                                                                                                                                                            |
| **stop_time_properties**       | [StopTimeProperties](#message-stoptimeproperties)                          | 可選的       | 一        | 內定義的某些屬性的實時更新GTFSstop_times.txt<br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |


## enum ScheduleRelationship

此 StopTime 與靜態計劃之間的關係。

**價值觀**

| _**價值**_        | _**評論**_                                                                                                                                                                                                                                                                                                                                             |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SCHEDULED**   | 這vehicle正在按照其靜態的停靠時間表進行，儘管不一定按照時間表的時間。這是**默認**行為。至少其中之一arrival和departure必須提供。基於頻率的旅行（GTFSfrequencies.txt與exact_times = 0) 不應該有SCHEDULED值並應該使用UNSCHEDULED反而。 |
| **SKIPPED**     | 停靠點是SKIPPED，即vehicle不會停在這一站。 arrival和departure是可選的。設置時`SKIPPED`不會傳播到相同的後續站點trip（即，vehicle將在隨後的站點停止trip除非這些站點也有`stop_time_update`和`schedule_relationship: SKIPPED`）。 delay從上一站trip_做_傳播到`SKIPPED`停止。換句話說，如果一個`stop_time_update`帶著`arrival`或者`departure`預測未設置為停止後`SKIPPED`停止，上游的預測`SKIPPED`停止後將傳播到停止`SKIPPED`停止和隨後的停止trip直到一個`stop_time_update`為隨後的停止提供。 |
| **沒有數據**        | 沒有給出此站點的數據。它表示沒有可用的實時時間信息。當設置 NO_DATA 通過後續停靠點傳播時，因此這是指定您沒有實時時間信息的停靠點的推薦方式。當 NO_DATA 均未設置時arrival也不departure應提供。 |
| **UNSCHEDULED** | 這vehicle正在運行基於頻率的trip(GTFSfrequencies.txt精確時間 = 0)。此值不應用於未定義的行程GTFSfrequencies.txt , 或旅行GTFSfrequencies.txt精確時間 = 1。行程包含`stop_time_updates`和`schedule_relationship: UNSCHEDULED`還必須設置TripDescriptor`schedule_relationship: UNSCHEDULED` <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |


## message StopTimeProperties

中定義的某些屬性的實時更新GTFSstop_times.txt .

**注意：**這個message 仍處於**試驗階段**，可能會發生變化。將來可能會正式採用。 <br/>

**字段**

| _**字段名稱**_           | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| -------------------- | -------------------------------------------------------------------------- | --------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **assigned_stop_id** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 支持實time停止分配。指一個`stop_id`中定義的GTFS`stops.txt` .<br/>新的`assigned_stop_id`不應導致顯著不同trip的經驗end用戶比`stop_id`定義在GTFS`stop_times.txt` .換句話說，end用戶不應查看此新內容`stop_id`如果新站點在沒有任何附加上下文的應用程序中呈現，則視為“不尋常的變化”。例如，此字段旨在通過使用`stop_id`與最初定義的停靠點屬於同一站GTFS`stop_times.txt` .<br/>在不提供任何真實信息的情況下分配止損timearrival或者departure預測，填充此字段並設置`StopTimeUpdate.schedule_relationship = NO_DATA` .<br/>如果填寫此字段，`StopTimeUpdate.stop_sequence`必須填充和`StopTimeUpdate.stop_id`不應填充。停止分配應反映在其他GTFS - 實時字段（例如，`VehiclePosition.stop_id`）。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |

## message TripProperties

定義更新的屬性trip

**注意：**這個message 仍處於**試驗階段**，可能會發生變化。將來可能會正式採用。 <br/>.<br/>


**字段**

| _**字段名稱**_     | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| -------------- | -------------------------------------------------------------------------- | --------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 定義一個新的標識符trip這是現有的副本trip在 (CSV) 中定義GTFStrips.txt但會start在不同的服務日期和/或time（定義使用`TripProperties.start_date`和`TripProperties.start_time`）。見定義`trips.trip_id`在 (CSV)GTFS .它的值必須不同於 (CSV) 中使用的值GTFS .此字段是必需的，如果`schedule_relationship`是`DUPLICATED` , 否則這個字段不能被填充並且會被消費者忽略。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **start_date** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 服務日期DUPLICATEDtrip將運行。必須以 YYYYMMDD 格式提供。此字段是必需的，如果`schedule_relationship`是`DUPLICATED` , 否則這個字段不能被填充並且會被消費者忽略。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **start_time** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 定義departurestarttime的trip什麼時候DUPLICATED.見定義`stop_times.departure_time`在 (CSV)GTFS .SCHEDULEDarrival和departure次為DUPLICATEDtrip是根據原始之間的偏移量計算的trip`departure_time`和這個領域。例如，如果一個GTFStrip有一個停止 A`departure_time`的`10:00:00`並停止 B`departure_time`的`10:01:00` ，並且該字段的值填充為`10:30:00`, 停止 BDUPLICATEDtrip會有一個SCHEDULED`departure_time`的`10:31:00`.真實的-time預言`delay`值應用於此計算的計劃time確定預測的time.例如，如果一個departure`delay`的`30`為停止 B 提供，則預測departuretime是`10:31:30`.真實的-time預言`time`值沒有應用任何偏移量並指示預測的time如提供。例如，如果一個departure`time`為停止 B 提供代表 10:31:30 的時間，則預測departuretime是`10:31:30`. 此字段是必需的，如果`schedule_relationship`是`DUPLICATED` , 否則這個字段不能被填充並且會被消費者忽略。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **shape_id**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 指定Shape的vehicle為此的旅行路線trip當它與原來的不同時。指一個Shape在 (CSV) 中定義GTFS或新的Shapeentity在一個真實的-time餵養。見定義`trips.shape_id`在 (CSV)GTFS .<br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |


## message VehiclePosition

給定的實時定位信息vehicle.

**字段**

| _**字段名稱**_                 | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                                                                                                                                      |
| -------------------------- | -------------------------------------------------------------------------- | --------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip**                   | [TripDescriptor](#message-tripdescriptor)                                  | 可選的       | 一        | 這trip這vehicle正在服務。可EMPTY或部分，如果vehicle無法識別給定的trip實例。 |
| **vehicle**                | [VehicleDescriptor](#message-vehicledescriptor)                            | 可選的       | 一        | 附加信息vehicle這是服務這個trip.每個條目應該有一個**獨特的**vehicleid .|
| **Position**               | [Position](#message-position)                                              | 可選的       | 一        | 當前的Position這個的vehicle.                                                                                                                                                                                                                                                                        |
| **current_stop_sequence**  | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 當前停靠點的停靠順序索引。的意思current_stop_sequence （即它所指的止損點）由下式確定current_status.如果current_status不見了IN_TRANSIT_TO假設。 |
| **stop_id**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 標識當前停靠點。該值必須與stops.txt在相應的GTFS餵養。如果`StopTimeProperties.assigned_stop_id`用於分配一個`stop_id`，這個字段也應該反映`stop_id` .                                                                                                                                                                                  |
| **current_status**         | [VehicleStopStatus](#enum-vehiclestopstatus)                               | 可選的       | 一        | 的確切狀態vehicle相對於當前停止。忽略如果current_stop_sequence不見了。 |
| **timestamp**              | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 時刻vehicle的Position被測量了。在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以來的秒數）。 |
| **congestion_level**       | [CongestionLevel](#enum-congestionlevel)                                   | 可選的       | 一        |                                                                                                                                                                                                                                                                                               |
| **occupancy_status**       | [OccupancyStatus](#enum-occupancystatus)                                   | _可選的_     | 一        | 客運量狀況vehicle或馬車。如果multi_carriage_details填充了每個車廂OccupancyStatus, 那麼這個字段應該描述整個vehicle考慮所有接受乘客的車廂。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **occupancy_percentage**   | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 一個百分比值，表示乘客的佔用程度vehicle.值 100 應代表總最大佔用率vehicle設計用於，包括座位和站立容量，以及當前的操作法規允許。如果乘客數量超過最大設計容量，該值可能會超過 100。精度occupancy_percentage應該足夠低，以至於無法跟踪個別乘客的上下車vehicle.如果multi_carriage_details填充了每個車廂occupancy_percentage, 那麼這個字段應該描述整個vehicle考慮所有接受乘客的車廂。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **multi_carriage_details** | [CarriageDetails](#message-CarriageDetails)                                | 可選的       | 許多       | 這個給定的多個車廂的詳細信息vehicle.第一次出現代表第一個車廂vehicle,**給定當前的行進方向**.的出現次數multi_carriage_details字段表示的車廂數量vehicle.它還包括不可登機的車廂，如發動機，MAINTENANCE車廂等……因為它們為乘客提供了有關站在平台上何處的寶貴信息。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |


## enum VehicleStopStatus

**價值觀**

| _**價值**_          | _**評論**_                                |
| ----------------- | --------------------------------------- |
| **INCOMING_AT**   | 這vehicle即將到達停靠點（在停靠點顯示上，vehicle符號通常閃爍）。 |
| **STOPPED_AT**    | 這vehicle站在車站。 |
| **IN_TRANSIT_TO** | 這vehicle已離開上一站並處於運輸途中。 |

## enum CongestionLevel

CONGESTION影響這一點的水平vehicle.

**價值觀**

| _**價值**_                     |
| ---------------------------- |
| **UNKNOWN_CONGESTION_LEVEL** |
| **RUNNING_SMOOTHLY**         |
| **STOP_AND_GO**              |
| **CONGESTION**               |
| **SEVERE_CONGESTION**        |

## enum OccupancyStatus

客運量狀況vehicle或馬車。

個別製作人不得全部發布OccupancyStatus價值觀。因此，消費者不能假設OccupancyStatus值遵循線性比例。消費者應代表OccupancyStatus值作為生產商指示和預期的狀態。同樣，生產者必須使用OccupancyStatus對應於實際的值vehicle佔用狀態。

有關以線性比例描述乘客佔用率的信息，請參閱occupancy_percentage .


**注意：**此字段仍處於**試驗階段**，可能會發生變化。將來可能會正式採用。

_**價值觀**_

| _**價值**_                         | _**評論**_                                                   |
| -------------------------------- | ---------------------------------------------------------- |
| _**EMPTY**_                      | _這vehicle被認為EMPTY大多數情況下，機上乘客很少或沒有乘客，但仍在接受乘客。 _              |
| _**MANY_SEATS_AVAILABLE**_       | _這vehicle或車廂有大量可用座位。在可用的總座位中被認為足夠大以屬於該類別的空閒座位的數量由生產者自行決定。 _ |
| _**FEW_SEATS_AVAILABLE**_        | _這vehicle或車廂有少量可用座位。可被視為小到足以落入這一類別的總座位中的空閒座位數量由生產者自行決定。 _   |
| _**STANDING_ROOM_ONLY**_         | _這vehicle或車廂目前只能容納站立的乘客。 _                                  |
| _**CRUSHED_STANDING_ROOM_ONLY**_ | _這vehicle或車廂目前只能容納站立的乘客，並且空間有限。 _                           |
| _**FULL**_                       | _這vehicle被認為FULL通過大多數措施，但可能仍允許乘客登機。 _                       |
| _**NOT_ACCEPTING_PASSENGERS**_   | _這vehicle或運輸不接受乘客。這vehicle或車廂通常接受乘客登機。 _                    |
| _**NO_DATA_AVAILABLE**_          | _這vehicle或運輸沒有任何可用的佔用數據time._                              |
| _**NOT_BOARDABLE**_              | _這vehicle或運輸不可登機，從不接受乘客。適用於特殊車輛或車廂（發動機、MAINTENANCE馬車等……）。 _ |


## message CarriageDetails

車廂特定細節，用於由多個車廂組成的車輛。

**注意：**這個message 仍處於**試驗階段**，可能會發生變化。將來可能會正式採用。

**字段**

| _**字段名稱**_               | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                                                                                                                                                    |
| ------------------------ | -------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **id**                   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 車廂的識別。每個應該是唯一的vehicle.<br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **label**                | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 用戶可見label可能會顯示給乘客以幫助識別車廂。示例：“7712”、“汽車 ABC-32”等...<br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **occupancy_status**     | [OccupancyStatus](#enum-occupancystatus)                                   | 可選的       | 一        | 此給定車廂的佔用狀態，在此vehicle.默認設置為`NO_DATA_AVAILABLE` .<br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **occupancy_percentage** | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可選的       | 一        | 這個給定車廂的佔用百分比，在這個vehicle.遵循與“VehiclePosition.occupancy_percentage”相同的規則。如果該給定托架的數據不可用，請使用 -1。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **carriage_sequence**    | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 識別該車廂相對於其他車廂的順序vehicle的 CarriageStatus 列表。行進方向上的第一個托架的值必須為 1。第二個值對應於行進方向上的第二個托架，值必須為 2，依此類推。例如，行駛方向的第一節車廂的值為 1。如果行駛方向的第二節車廂的值為 3，則消費者將丟棄所有車廂的數據（即multi_carriage_details場地）。沒有數據的托架必須用有效的表示carriage_sequencenum ber 和沒有數據的字段應該被省略（或者，這些字段也可以被包括並設置為“無數據”值）。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |

## message Alert

一個Alert，表示公共交通網絡中的某種事件。

**字段**

| _**字段名稱**_                 | _**類型**_                                      | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                                    |
| -------------------------- | --------------------------------------------- | --------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **active_period**          | [TimeRange](#message-timerange)               | 可選的       | 許多       | time當。 。 。的時候Alert應該顯示給用戶。如果丟失，則Alert只要它出現在提要中，就會顯示出來。如果給出多個範圍，則Alert將在所有期間顯示。 |
| **informed_entity**        | [EntitySelector](#message-entityselector)     | 必需的       | 許多       |我們應該通知其用戶的實體Alert.最後一個informed_entity必須提供。 |
| **Cause**                  | [Cause](#enum-cause)                          | 有條件要求     | 一        | 如果包含 cause_detail，則Cause也必須包括在內。 |
| **原因詳細信息**                 | [TranslatedString](#message-translatedstring) | 可選的       | 一        | 描述Cause的Alert允許特定於機構的language;比Cause.如果包含 cause_detail，則Cause也必須包括在內。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **Effect**                 | [Effect](#enum-effect)                        | 有條件要求     | 一        | 如果包含 effect_detail，則Effect也必須包括在內。 |
| **效果細節**                   | [TranslatedString](#message-translatedstring) | 可選的       | 一        | 描述Effect的Alert允許特定於機構的language;比Effect.如果包含 effect_detail，則Effect也必須包括在內。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **url**                    | [TranslatedString](#message-translatedstring) | 可選的       | 一        | 這url它提供了有關Alert.                                                                                                                                                                            |
| **header_text**            | [TranslatedString](#message-translatedstring) | 必需的       | 一        | header為了Alert.這樸素——textstring將突出顯示，例如以粗體顯示。 |
| **description_text**       | [TranslatedString](#message-translatedstring) | 必需的       | 一        | 說明Alert.這樸素——textstring將被格式化為Alert（或在用戶明確的“擴展”請求中顯示）。描述中的信息應添加到header.                                                                                                                      |
| **tts_header_text**        | [TranslatedString](#message-translatedstring) | 可選的       | 一        | text包含Alert的header用於text到語音的實現。這個字段是text- 到語音版本header_text.它應該包含與header_text但格式化為可以讀取為text-to-speech（例如，刪除的縮寫、拼出的數字等）                                                                       |
| **tts_description_text**   | [TranslatedString](#message-translatedstring) | 可選的       | 一        | text包含對Alert用於text到語音的實現。這個字段是text- 到語音版本description_text.它應該包含與description_text但格式化為可以讀取為text-to-speech（例如，刪除的縮寫、拼出的數字等）                                                                   |
| **severity_level**         | [SeverityLevel](#enum-severitylevel)          | 可選的       | 一        | 的嚴重性Alert.                                                                                                                                                                                  |
| **image**                  | [TranslatedImage](#message-translatedimage)   | 可選的       | 一        | TranslatedImage沿線顯示Alerttext.用於直觀地解釋AlertEffect一個DETOUR，車站關閉等。 image應該加強對Alert並且不能是重要信息的唯一位置。不鼓勵使用以下類型的圖像：image主要包含text、營銷或品牌圖像，不添加任何附加信息。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **image_alternative_text** | [TranslatedString](#message-translatedstring) | 可選的       | 一        | text描述鏈接的外觀image在裡面`image`字段（例如，如果image無法顯示或用戶看不到image出於可訪問性的原因）。見 HTML[替代規範imagetext](https://html.spec.whatwg.org/#alt) .<br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |


## enum Cause

Cause這個的Alert.

**價值觀**

| _**價值**_              |
| --------------------- |
| **UNKNOWN_CAUSE**     |
| **OTHER_CAUSE**       |
| **TECHNICAL_PROBLEM** |
| **STRIKE**            |
| **DEMONSTRATION**     |
| **ACCIDENT**          |
| **HOLIDAY**           |
| **WEATHER**           |
| **MAINTENANCE**       |
| **CONSTRUCTION**      |
| **POLICE_ACTIVITY**   |
| **MEDICAL_EMERGENCY** |

## enum Effect

這Effect這個問題對受影響的entity.

**價值觀**

| _**價值**_                |
| ----------------------- |
| **NO_SERVICE**          |
| **REDUCED_SERVICE**     |
| **SIGNIFICANT_DELAYS**  |
| **DETOUR**              |
| **ADDITIONAL_SERVICE**  |
| **MODIFIED_SERVICE**    |
| **OTHER_EFFECT**        |
| **UNKNOWN_EFFECT**      |
| **STOP_MOVED**          |
| **NO_EFFECT**           |
| **ACCESSIBILITY_ISSUE** |

## enum SeverityLevel

的嚴重性Alert.

**注意：**此字段仍處於**試驗階段**，可能會發生變化。將來可能會正式採用。

**價值觀**

| _**價值**_             |
| -------------------- |
| **UNKNOWN_SEVERITY** |
| **INFO**             |
| **WARNING**          |
| **SEVERE**           |

## message TimeRange

一個time間隔。間隔被認為是活躍的time`t`如果`t`大於或等於starttime並且小於endtime.

**字段**

| _**字段名稱**_ | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_|
| ---------- | -------------------------------------------------------------------------- | --------- | -------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **start**  | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | starttime, 在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以來的秒數）。如果缺失，則間隔從負無窮大開始。如果一個TimeRange提供，要么start或者end必須提供 - 兩個字段都不能EMPTY. |
| **end**    | [uint64](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | endtime, 在 POSIX 中time（即自 1970 年 1 月 1 日 00:00:00 UTC 以來的秒數）。如果缺失，則間隔以正無窮大結束。如果一個TimeRange提供，要么start或者end必須提供 - 兩個字段都不能EMPTY.   |

## message Position

一個地理Position一個vehicle.

**字段**

| _**字段名稱**_    | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                             |
| ------------- | -------------------------------------------------------------------------- | --------- | -------- | ---------------------------------------------------------------------------------------------------- |
| **latitude**  | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 必需的       | 一        | 北度數，在 WGS-84 坐標系中。 |
| **longitude** | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 必需的       | 一        | 東度，在 WGS-84 坐標系中。 |
| **bearing**   | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可選的       | 一        | bearing，以度為單位，從真北順時針方向，即，0 是北，90 是東。這可以是指南針bearing，或朝向下一站或中間位置的方向。這不應該從先前位置的序列中推斷出來，客戶可以從先前的數據中計算出來。 |
| **odometer**  | [double](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | odometer值，以米為單位。 |
| **speed**     | [float](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 可選的       | 一        | 瞬間speed由測量vehicle，以米/秒為單位。 |


## message TripDescriptor

標識單個實例的描述符GTFStrip.

指定單個trip例如，在許多情況下trip_id本身就足夠了。但是，以下情況需要額外的信息才能解決單個trip實例：

* 對於定義的行程frequencies.txt ,start_date和start_time除了需要trip_id
* 如果trip持續超過 24 小時，或被延遲以致與SCHEDULEDtrip第二天，然後start_date除了需要trip_id
* 如果trip_id無法提供字段，則route_id ,direction_id ,start_date ， 和start_time必須全部提供

在所有情況下，如果route_id除了提供trip_id ，那麼route_id必須相同route_id分配給給定的trip在GTFStrips.txt .

這trip_id字段不能單獨或與其他字段組合TripDescriptor字段，用於識別多個trip實例。例如，一個TripDescriptor永遠不應該指定trip_id本身為GTFSfrequencies.txt exact_times=0 次因為start_time也需要解決一個單一的trip實例開始於特定time的一天。如果TripDescriptor不解決單個trip實例（即，它解析為零或多個trip實例），它被認為是一個錯誤和entity包含錯誤的TripDescriptor可能會被消費者丟棄。

請注意，如果trip_id未知，則站序列 id 在TripUpdate還不夠，還必須提供 stop_ids。此外，絕對arrival/departure必須提供時間。

TripDescriptor.route_id不能在一個內使用AlertEntitySelector指定路由范圍Alert影響路線的所有行程 - 使用EntitySelector.route_id反而。


**字段**

| _**字段名稱**_                | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------------- | -------------------------------------------------------------------------- | --------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trip_id**               | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 這trip_id來自GTFS此選擇器引用的提要。對於非基於頻率的旅行（未在GTFSfrequencies.txt )，該字段足以唯一標識trip.對於定義的基於頻率的行程GTFSfrequencies.txt ,trip_id ,start_time， 和start_date都是必需的。為了SCHEDULED-基於旅行（旅行未定義在GTFSfrequencies.txt ),trip_id僅當trip可以通過以下組合唯一標識route_id ,direction_id,start_time， 和start_date，並且提供了所有這些字段。什麼時候schedule_relationship是DUPLICATED在一個TripUpdate， 這trip_id標識trip從靜態GTFS成為DUPLICATED.什麼時候schedule_relationship是DUPLICATED在一個VehiclePosition， 這trip_id標識新的副本trip並且必須包含對應的值TripUpdate.TripProperties .trip_id .                                                       |
| **route_id**              | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 這route_id來自GTFS這個選擇器所指的。如果trip_id被省略，route_id ,direction_id,start_time, 和 schedule_relationship=SCHEDULED必須全部設置為識別一個trip實例。 TripDescriptor.route_id不應該在一個內使用AlertEntitySelector指定路由范圍Alert影響路線的所有行程 - 使用EntitySelector.route_id反而。 |
| **direction_id**          | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 這direction_id來自GTFS餵養trips.txt文件，指示此選擇器所指的行程的行進方向。如果trip_id被省略，direction_id必須提供。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 <br/>                                                                                                                                                                                                                                                                                                                                                                                                              |
| **start_time**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 最初的SCHEDULEDstarttime這個的trip實例。當。 。 。的時候trip_id對應於非基於頻率的trip，此字段應省略或等於GTFS餵養。當。 。 。的時候trip_id對應於基於頻率的trip定義在GTFSfrequencies.txt ,start_time是必需的，必須指定為trip更新和vehicle職位。如果trip對應於exact_times=1GTFS記錄，然後start_time必須是 headway_secs 的某個倍數（包括零）frequencies.txtstart_time對於相應的time時期。如果trip對應於exact_times=0，那麼它的start_time可能是任意的，最初預計是第一個departure的trip.一經成立，start_time這個基於頻率的exact_times=0trip應該被認為是不可變的，即使第一個departuretime變化——那time相反，變化可能會反映在StopTimeUpdate.如果trip_id被省略，start_time必須提供。該字段的格式和語義與GTFS /frequencies.txt /start_time，例如 11:15:35 或 25:15:35。 |
| **start_date**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 這start這個日期tripYYYYMMDD 格式的實例。為了SCHEDULED行程（行程未在GTFSfrequencies.txt )，必須提供此字段以消除遲到以至於與SCHEDULEDtrip第二天。例如，對於每天 8:00 和 20:00 出發且晚點 12 小時的火車，同一班次會有兩個不同的行程time.可以提供此字段，但對於不可能發生此類衝突的計劃（例如，按小時計劃運行的服務，其中一個vehicle遲到一小時不再被認為與日程安排有關。此字段對於定義的基於頻率的行程是必需的GTFSfrequencies.txt .如果trip_id被省略，start_date必須提供。                                                                                                                                                                                                                                                  |
| **schedule_relationship** | [ScheduleRelationship](#enum-schedulerelationship-1)                       | 可選的       | 一        | 這之間的關係trip和靜態時間表。如果TripDescriptor提供在一個Alert`EntitySelector`， 這`schedule_relationship`消費者在識別匹配時忽略該字段trip實例。 |


## enum ScheduleRelationship

這之間的關係trip和靜態時間表。如果一個trip是按照臨時時間表完成的，沒有反映在GTFS ，那麼它不應該被標記為SCHEDULED, 但標記為ADDED.

**價值觀**

| _**價值**_        | _**評論**_                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **SCHEDULED**   | trip即按照其運行GTFS Schedule，或者足夠接近SCHEDULEDtrip與它相關聯。 |
| **ADDED**       | 一個額外的trip那是ADDED除了運行計劃之外，例如，替換損壞的vehicle或應對突然的載客量。 _注意：目前，未指定使用此模式的提要的行為。有關於的討論GTFS GitHub[ (1)](https://github.com/google/transit/issues/106) [ (2)](https://github.com/google/transit/pull/221) [ (3)](https://github.com/google/transit/pull/219)圍繞完全指定或棄用ADDED旅行和文件將在這些討論完成後更新。 _                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **UNSCHEDULED** | 一個trip正在運行且沒有與之關聯的時間表 - 此值用於識別定義的行程GTFSfrequencies.txt精確時間 = 0。它不應用於描述未定義的行程GTFSfrequencies.txt , 或旅行GTFSfrequencies.txt精確時間 = 1。 `schedule_relationship: UNSCHEDULED`還必須設置所有 StopTimeUpdates`schedule_relationship: UNSCHEDULED`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **CANCELED**    | 一個trip存在於計劃中但已被刪除。 |
| **DUPLICATED**  | 一個新的trip這與現有的相同SCHEDULEDtrip除了服務start日期和time.與`TripUpdate.TripProperties.trip_id` ,`TripUpdate.TripProperties.start_date`， 和`TripUpdate.TripProperties.start_time`複製現有的trip從靜態GTFS但start在不同的服務日期和/或time.複製一個trip如果與原始服務相關，則允許trip在 (CSV)GTFS （在`calendar.txt`或者`calendar_dates.txt`) 在接下來的 30 天內運營。這trip成為DUPLICATED通過識別`TripUpdate.TripDescriptor.trip_id` .<br/><br/>此枚舉不修改現有的trip被引用`TripUpdate.TripDescriptor.trip_id`- 如果製片人想取消原作trip, 它必須單獨發布`TripUpdate`與價值CANCELED.行程定義在GTFS`frequencies.txt`和`exact_times`那是EMPTY或等於`0`不可能是DUPLICATED.這`VehiclePosition.TripDescriptor.trip_id`對於新的trip必須包含來自的匹配值`TripUpdate.TripProperties.trip_id`和`VehiclePosition.TripDescriptor.ScheduleRelationship`還必須設置為`DUPLICATED`.<br/><br/>_現有的生產者和消費者正在使用ADDED枚舉來表示DUPLICATED旅行必須遵循[遷移指南](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/examples/migration-duplicated.md)過渡到DUPLICATED枚舉。 _ |
| **DELETED** | 行程表中存在但已刪除且不得向用戶顯示的行程。<br/><br/>應該使用 DELETED 而不是 CANCELED 來表示交通提供商希望從消費應用程序中完全刪除有關相應行程的信息，因此該行程不會向乘客顯示為已取消，例如，一個行程完全被另一個行程取代。如果取消多次旅行並用替代服務代替，則此指定變得尤為重要。如果消費者要顯示有關取消的明確信息，則會分散對更重要的實時預測的注意力。<br/><br/>**注意：**該字段仍處於**實驗**階段，可能會發生變化。它可能在未來被正式採用。|

## message VehicleDescriptor

身份識別信息vehicle執行trip.

**字段**

| _**字段名稱**_        | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                |
| ----------------- | -------------------------------------------------------------------------- | --------- | -------- | --------------------------------------------------------------------------------------- |
| **id**            | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 內部系統識別vehicle.應該**獨特的**每vehicle, 並用於跟踪vehicle當它通過系統進行時。這個id不應該對end-用戶;為此目的使用**label**場地 |
| **label**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 用戶可見label，即必須向乘客展示以幫助識別正確的東西vehicle.                                                    |
| **license_plate** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 可選的       | 一        | 車牌號vehicle.                                                                             |
| **無障礙通道**         | [無障礙通道](#enum-wheelchairaccessible)                                        | 可選的       | 一        | 如果提供，可以覆蓋_無障礙通道_靜態值GTFS .                                                               |

## enum 無障礙通道

如果一個特別的trip可供輪椅使用。如果可用，此值應覆蓋靜態中的_Wheelchair_accessible_值GTFS .

**價值觀**

| _**價值**_    | _**評論**_                                                  |
| ----------- | --------------------------------------------------------- |
| **沒有價值**    | 這trip沒有關於輪椅無障礙的信息。這是**默認**行為。如果靜電GTFS包含一個_無障礙通道_值，它不會被覆蓋。 |
| **未知**      | 這trip不存在可訪問性值。此值將覆蓋從GTFS .                                |
| **無障礙通道**   | 這trip輪椅可通行。此值將覆蓋從GTFS .                                   |
| **輪椅_無法訪問** | 這trip是**不是**無障礙通道。此值將覆蓋從GTFS .                            |


## message EntitySelector

一個選擇器entity在一個GTFS餵養。字段的值應對應於相應的字段GTFS餵養。必須至少給出一個說明符。如果給出了幾個，則應將它們解釋為由邏輯`AND`運算符連接。此外，說明符的組合必須與GTFS餵養。換句話說，為了一個Alert適用於entity在GTFS它必須匹配所有提供的EntitySelector字段。例如，一個EntitySelector包括字段route_id `route_id : "5"`和route_type `route_type : "3"`僅適用於route_id `route_id : "5"` bus - 它不適用於任何其他路線route_type `route_type : "3"` 。如果生產者想要一個Alert申請route_id `route_id : "5"`以及route_type `route_type : "3"` ，它應該提供兩個獨立的EntitySelector，一個引用route_id `route_id : "5"`和另一個引用route_type `route_type : "3"` 。

必須給出至少一個說明符 - 一個字段中的所有字段EntitySelector不可能是EMPTY.

**字段**

| _**字段名稱**_       | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                     |
| ---------------- | -------------------------------------------------------------------------- | --------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **agency_id**    | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 這agency_id來自GTFS此選擇器引用的提要。 |
| **route_id**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 這route_id來自GTFS這個選擇器所指的。如果direction_id提供，route_id也必須提供。 |
| **route_type**   | [int32](https://developers.google.com/protocol-buffers/docs/proto#scalar)  | 有條件要求     | 一        | 這route_type來自GTFS這個選擇器所指的。 |
| **direction_id** | [uint32](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 這direction_id來自GTFS餵養trips.txt文件，用於選擇路線的一個方向上的所有行程，由指定route_id .如果direction_id提供，route_id也必須提供。 <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 <br/>       |
| **trip**         | [TripDescriptor](#message-tripdescriptor)                                  | 有條件要求     | 一        | 這trip實例來自GTFS這個選擇器所指的。這個TripDescriptor必須解決單個trip中的實例GTFS數據（例如，生產者不能只提供trip_id對於exact_times=0 行程）。如果ScheduleRelationship字段填充在此TripDescriptor消費者在嘗試識別GTFStrip. |
| **stop_id**      | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        | 這stop_id來自GTFS此選擇器引用的提要。 |

## message TranslatedString

國際化的message 包含每language片段的版本text或一個url.來自 a 的字符串之一message 將被撿起。解決方法如下： 如果 UIlanguage匹配languagea的代碼Translation, 第一個匹配Translation被選中。如果默認 UIlanguage（例如，英語）匹配languagea的代碼Translation, 第一個匹配Translation被選中。如果有些Translation有一個未指定的language代碼，那個Translation被選中。


**字段**

| _**字段名稱**_      | _**類型**_                            | _**必需的**_ | _**基數**_ | _**描述**_             |
| --------------- | ----------------------------------- | --------- | -------- | -------------------- |
| **Translation** | [Translation](#message-translation) | 必需的       | 許多       | 最後一個Translation必須提供。 |

## message Translation

本地化的string映射到一個language.

| _**字段名稱**_   | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                      |
| ------------ | -------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------- |
| **text**     | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 一個 UTF-8string包含message .                                                                                                      |
| **language** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        |  BCP-47language代碼。可以省略，如果language是未知的，或者是否根本沒有對提要進行國際化。最多一個Translation允許有一個未指定的languagetag - 如果有多個Translation， 這language必須提供。 |

## message TranslatedImage

國際化的message 包含每language的版本image.其中一張圖片來自message 將被撿起。解決方法如下： 如果 UIlanguage匹配languagea的代碼Translation, 第一個匹配Translation被選中。如果默認 UIlanguage（例如，英語）匹配languagea的代碼Translation, 第一個匹配Translation被選中。如果有些Translation有一個未指定的language代碼，那個Translation被選中。

**注意：**這個message 仍處於**試驗階段**，可能會發生變化。將來可能會正式採用。

**字段**

| _**字段名稱**_          | _**類型**_                                  | _**必需的**_ | _**基數**_ | _**描述**_          |
| ------------------- | ----------------------------------------- | --------- | -------- | ----------------- |
| **localized_image** | [LocalizedImage](#message-localizedimage) | 必需的       | 許多       | 至少一個本地化image必須提供。 |


## message LocalizedImage

本地化的imageurl映射到一個language.

| _**字段名稱**_     | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                                                                                                                                                    |
| -------------- | -------------------------------------------------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **url**        | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | string包含一個url鏈接到image.這image鏈接必須小於 2MB。如果image以足夠顯著的方式發生變化，需要在消費者端進行更新，生產者必須更新url到一個新的。 <br/><br/>這url應該是完全合格的url包括 http:// 或 https:// 以及url必須正確轉義。請參閱以下內容[http://www.w3.org/Addressing/url/4_URI_Recommentations.html 為](http://www.w3.org/Addressing/URL/4_URI_Recommentations.html for)描述如何創建完全合格的url價值觀。 |
| **media_type** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | IANA media type as 指定的類型image要顯示。類型必須start與“圖像/”                                                                                                                                                                                                                                                            |
| **language**   | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 有條件要求     | 一        |  BCP-47language代碼。可以省略，如果language是未知的，或者是否根本沒有對提要進行國際化。最多一個Translation允許有一個未指定的languagetag - 如果有多個Translation， 這language必須提供。 |

## message Shape

描述一個物理路徑vehicle需要時Shape不屬於 (CSV)GTFS ，例如對於臨時DETOUR.形狀屬於 Trips，由編碼的折線組成，以實現更有效的傳輸。 Shapes 不需要精確地截取 Stops 的位置，但所有 Stops 都在一個trip應該在一個小的距離內Shape為了那個原因trip，即接近連接的直線段Shape積分

**注意：**這個message 仍處於**試驗階段**，可能會發生變化。將來可能會正式採用。 <br/>.<br/>


**字段**

| _**字段名稱**_           | _**類型**_                                                                   | _**必需的**_ | _**基數**_ | _**描述**_                                                                                                                                                                   |
| -------------------- | -------------------------------------------------------------------------- | --------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **shape_id**         | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 標識符Shape.必須不同於任何`shape_id`在 (CSV) 中定義GTFS .<br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |
| **encoded_polyline** | [string](https://developers.google.com/protocol-buffers/docs/proto#scalar) | 必需的       | 一        | 的編碼折線表示Shape.此折線必須至少包含兩個點。有關編碼折線的更多信息，請參閱<https://developers.google.com/maps/documentation/utilities/polylinealgorithm> <br/><br/>**警告：**這個領域仍然**實驗**，並且可能會發生變化。將來可能會正式採用。 |