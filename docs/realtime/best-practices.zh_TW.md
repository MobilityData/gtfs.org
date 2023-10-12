---
search:
  exclude: true
---
  
# GTFS Realtime 最佳實踐

## 介紹

這些是描述實時公共交通信息的推薦做法GTFS Realtime數據格式。

### 文件結構

推薦的做法分為兩個主要部分

* __[實踐建議組織者](#practice-recommendations-organized-by-message)__message__:__推薦由message和字段按照官方描述的相同順序GTFS Realtime參考。
* __[按案例組織的實踐建議](#practice-recommendations-organized-by-use-case)：__對於特定案例，例如基於頻率的服務（與基於時間表的服務），實踐可能需要應用於多個消息和字段以及相應的GTFS Schedule數據。此類建議合併在本節中。

### 飼料發布和一般實踐

* 提要應在公開的、永久的url
* 這url應該可以直接訪問，而無需登錄即可訪問提要。如果需要，可以使用 API 密鑰，但 API 密鑰的註冊應該是自動化的並且對所有人都可用。
* 維護持久標識符 (id字段）內GTFS Realtime飼料（例如，FeedEntity.id ,VehicleDescriptor.id ,CarriageDetails.id ) 跨提要迭代。
* GTFS Realtime提要應至少每 30 秒刷新一次，或者每當提要中表示的信息 (Position一個vehicle) 更改，以較頻繁者為準。 VehiclePositions 往往比其他提要實體更頻繁地更改，應盡可能頻繁地更新。如果內容未更改，則應使用新的更新FeedHeader `FeedHeader . timestamp`timestamp反映該信息仍然相關timestamp.
* 一個內的數據GTFS Realtime飼料不應超過 90 秒trip更新和vehicle服務警報的位置和不超過 10 分鐘。例如，即使生產者不斷刷新FeedHeader `FeedHeader . timestamp`timestamptimestamp每 30 秒，該提要中的 VehiclePosition 的年齡不應超過 90 秒。
* 服務器託管GTFS Realtime數據應該是可靠的，並且始終返回格式有效的 protobuf 編碼響應。少於 1% 的響應應該是無效的（protobuf 錯誤或獲取錯誤）。
* 網絡服務器託管GTFS Realtime數據應配置為正確報告文件修改日期（參見 HTTP/1.1 - Request for Comments 2616，在第 14.29 節下），以便消費者可以利用`If-Modified-Since` HTTPheader.這通過避免傳輸未更改的提要內容來節省生產者和消費者的帶寬。
* 當通過給定的 HTTP 請求進行查詢時，Feed 應默認提供協議緩衝區編碼的 Feed 內容url- 消費者不需要定義特殊的 HTTP 接受標頭來接收協議緩衝區編碼的內容。
* 由於協議緩衝區如何對[可選值](https://developers.google.com/protocol-buffers/docs/proto#optional)進行編碼，因此在從GTFS Realtime提要消費者應在使用該值之前使用協議緩衝區生成的`hasX()`方法檢查值的存在，並且僅應在`hasX()`為真（其中`X`是字段的名稱）時使用該值。如果`hasX()`返回`false` ，則該字段的默認值在GTFS應該假設`GTFS -realtime.proto`值。如果消費者在沒有首先檢查`hasX()`方法的情況下使用該值，則它可能正在讀取生產者無意發布的默認數據。
* Feed 應使用 HTTPS 而不是 HTTP（不加密）以確保 Feed 完整性。
* 提要應涵蓋伴隨靜態中包含的絕大多數行程GTFS數據集。特別是，它應該包括高密度和高流量的城市地區和繁忙路線的數據。

## 實踐建議組織者message

### FeedHeader

| 字段名稱                    | 推薦                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gtfs_realtime_version` | 當前版本是“2.0”。全部GTFS Realtime提要應該是“2.0”或更高版本，作為早期版本GTFS Realtime不需要所有字段來充分代表各種過境情況。 |
| `timestamp`             | 這個timestamp在兩個連續的饋送迭代之間不應減少。 |
|                         | 這個timestamp如果提要內容更改，則值應始終更改 - 提要內容不應在不更新header`timestamp` .<br/><br/>*常見錯誤*- 如果有多個實例GTFS Realtime在負載均衡器後面饋送，每個實例可能會從實時數據源中提取信息並將其發布給稍微不同步的消費者。如果一個GTFS Realtime消費者發出兩個背靠背請求，每個請求由不同的GTFS Realtimefeed 實例，相同的 feed 內容可能會以不同的時間戳返回給消費者。 <br/><br/>*可能的解決方案*- 生產者應提供`Last-Modified`HTTPheader, 消費者應該通過他們最近的`If-Modified-Since`HTTPheader以避免收到過時的數據。 <br/><br/>*可能的解決方案* - 如果無法使用 HTTP 標頭，則可以使用粘性會話等選項來確保每個消費者都被路由到同一個生產者服務器。 |

### FeedEntity

所有實體只能從GTFS Realtime當它們不再與用戶相關時提供。提要被認為是無狀態的，這意味著每個提要都反映了整個真實的time公交系統的狀態。如果entity在一個提要實例中提供，但在隨後的提要更新中刪除，應該假設沒有真正的-time相關信息entity.

| 字段名稱 | 推薦                 |
| ---- | ------------------ |
| `id` | 應該在整個過程中保持穩定trip期間 |

### TripUpdate

一般準則trip取消：

* 當取消幾天內的旅行時，生產者應提供引用給定`trip_ids`和`start_dates`的 TripUpdates 作為CANCELED以及一個Alert和NO_SERVICE引用相同的`trip_ids`和TimeRange可以顯示給乘客解釋取消（例如，DETOUR）。
* 如果沒有停止trip將被訪問，trip應該CANCELED而不是將所有`stop_time_updates`標記為SKIPPED .

| 字段名稱               | 推薦                                                                                                                                                                                                                                                                                                                       |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `trip`             | 參考[messageTripDescriptor](#TripDescriptor) .                                                                                                                                                                                                                                                                             |
|                    | 如果分開`VehiclePosition`和`TripUpdate`提供飼料，[TripDescriptor](#TripDescriptor)和[VehicleDescriptor](#VehicleDescriptor)id值配對應該在兩個提要之間匹配。 <br/><br/>例如，一個`VehiclePosition`entity有`vehicle_id:A`和`trip_id:4`, 那麼對應的`TripUpdate`entity也應該有`vehicle_id:A`和`trip_id:4`.如果有的話`TripUpdate`entity有`trip_id:4`和任何`vehicle_id`除了 4，這是一個錯誤。 |
| `vehicle`          | 參考[messageVehicleDescriptor](#VehicleDescriptor) .                                                                                                                                                                                                                                                                       |
|                    | 如果分開`VehiclePosition`和`TripUpdate`提供飼料，[TripDescriptor](#TripDescriptor)和[VehicleDescriptor](#VehicleDescriptor)id值配對應該在兩個提要之間匹配。 <br/><br/>例如，一個`VehiclePosition`entity有`vehicle_id:A`和`trip_id:4`, 那麼對應的`TripUpdate`entity也應該有`vehicle_id:A`和`trip_id:4`.如果有的話`TripUpdate`entity有`trip_id:4`和任何`vehicle_id`除了 4，這是一個錯誤。 |
| `stop_time_update` | `stop_time_updates`對於給定的`trip_id`應嚴格按照增加順序`stop_sequence`和不`stop_sequence`應該重複。 |
|                    | 雖然trip正在進行中，所有`TripUpdates`應至少包括一個`stop_time_update`與預測arrival或者departuretime在將來。請注意，[GTFS Realtime規格](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates)說生產者不應該放棄過去`StopTimeUpdate`如果它指的是一個停止SCHEDULEDarrivaltime在給定的未來trip（即vehicle已提前通過該站點），否則將得出該站點沒有更新的結論。 |
| `timestamp`        | 應反映time這個預測trip已更新。 |
| `delay`            | `TripUpdate.delay`應該表示進度偏差，即觀察到的過去值如何提前/落後於進度vehicle是。應通過以下方式提供對未來停靠點的預測`StopTimeEvent.delay`或者`StopTimeEvent.time` .                                                                                                                                                                                                    |

### TripDescriptor

如果分開VehiclePosition和TripUpdate提供飼料，TripDescriptor和VehicleDescriptorid值配對應該在兩個提要之間匹配。

例如，一個VehiclePositionentity有`vehicle_id:A`和trip_id `trip_id :4` ，那麼對應的TripUpdateentity還應該有`vehicle_id:A`和trip_id `trip_id :4` 。

| 字段名稱                    | 推薦                        |
| ----------------------- | ------------------------- |
| `schedule_relationship` | 的行為`ADDED`行程未指定，不推薦使用此枚舉。 |

### VehicleDescriptor

如果分開VehiclePosition和TripUpdate提供飼料，TripDescriptor和VehicleDescriptorid值配對應該在兩個提要之間匹配。

例如，一個VehiclePositionentity有`vehicle_id:A`和trip_id `trip_id :4` ，那麼對應的TripUpdateentity還應該有`vehicle_id:A`和trip_id `trip_id :4` 。

| 字段名稱 | 推薦                           |
| ---- | ---------------------------- |
| `id` | 應該唯一且穩定地識別一個vehicle在整個trip期間 |

### StopTimeUpdate

| 字段名稱            | 推薦                                                                                                                                   |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `stop_sequence` | 提供`stop_sequence`只要有可能，因為它明確地解析為GTFS停止time在`stop_times.txt`不像`stop_id`, 這可能在一個trip（例如，循環路線）。 |
| `arrival`       | arrival連續停止之間的時間應該增加 - 它們不應該相同或減少。 |
|                 | arrival`time`（指定在[StopTimeEvent](#StopTimeEvent)) 應該在departure`time`如果中途停留或停留，則為同一站點time預計 - 否則，arrival`time`應該是一樣的departure`time` . |
| `departure`     | departure連續停止之間的時間應該增加 - 它們不應該相同或減少。 |
|                 | departure`time`（指定在[StopTimeEvent](#StopTimeEvent)) 應與arrival`time`如果沒有中途停留或停留，則為同一站time預計 - 否則，departure`time`應該在之後arrival`time`.   |

### StopTimeEvent

| 字段名稱    | 推薦                                                                                                                                                                                                                                                    |
| ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `delay` | 要是`delay`提供在一個`stop_time_update` `arrival`或者`departure`（並不是`time`)，那麼GTFS[`stop_times.txt`](https://gtfs.org/reference/static#stopstxt)應該包含`arrival_times`和/或`departure_times`對於這些相應的站點。一個`delay`除非您有時鐘，否則實時提要中的值毫無意義time將其添加到GTFS`stop_times.txt`文件。 |

### VehiclePosition

以下是應包含在 VehiclePostions 提要中的推薦字段，以便為消費者提供高質量數據（例如，用於生成預測）

| 字段名稱                 | 筆記                                                                                                        |
| -------------------- | --------------------------------------------------------------------------------------------------------- |
| `entity.id`          | 應該在整個過程中保持穩定trip期間                                                                                        |
| `vehicle.timestamp`  | 提供timestamp在哪個vehiclePosition強烈建議進行測量。否則，消費者必須使用messagetimestamp，這可能會給騎手帶來誤導性的結果message比個人更頻繁地更新Position. |
| `vehicle.vehicle.id` | 應該唯一且穩定地識別一個vehicle在整個trip期間                                                                              |

### Position

這vehiclePosition應在 200 米範圍內GTFSshapes.txt當前的數據trip除非有一個Alert與Effect的DETOUR為了這trip_id .

### Alert

警報的一般準則：

* 什麼時候trip_id和start_time在`exact_time=1`區間內，start_time應該比間隔的開始晚一個精確的倍數`headway_secs` 。
* 當取消幾天內的旅行時，生產者應提供引用給定`trip_ids`和`start_dates`的 TripUpdates 作為CANCELED以及一個Alert和NO_SERVICE引用相同的`trip_ids`和TimeRange可以顯示給乘客解釋取消（例如，DETOUR）。
* 如果Alert影響一條線上的所有停靠點，使用基於線的Alert而不是基於停止的Alert.不要應用Alert到線路的每一站。
* 雖然服務提醒沒有字符限制，但公交乘客通常會在移動設備上查看提醒。請簡明扼要。

| 字段名稱               | 推薦                    |
| ------------------ | --------------------- |
| `description_text` | 使用換行符使您的服務Alert更容易閱讀。 |

## 按用例組織的實踐建議

### 基於頻率的旅行

基於頻率的trip不遵循固定的時間表，而是試圖保持預定的進度。這些行程在[GTFS](<https://\<glossary variable=>)中表示[.org/reference/static/#frequenciestxt">](<https://\<glossary variable=>)GTFS [frequency.txt](<https://\<glossary variable=>)通過設置`exact_times=0`或省略`exact_times`字段（注意`exact_times=1`行程*不是*基於頻率的行程-frequencies.txt使用`exact_times=1`只是作為一種方便的方法，以更緊湊的方式存儲基於時間表的行程）。構建時需要牢記幾個最佳實踐GTFS Realtime用於基於頻率的旅行的提要。

* 在TripUpdate[.](#StopTimeUpdate)StopTimeUpdate， 這StopTimeEvent為了arrival和departure不應包含delay因為基於頻率的旅行不遵循固定的時間表。反而，time應提供以表明arrival/departure預測。

* 根據規範的要求，在描述時trip在TripUpdate或者VehiclePosition通過使用TripDescriptor， 所有的trip_id ,start_time ， 和start_date必須提供。此外，schedule_relationship應該UNSCHEDULED .

（例如，重新執法旅行）。

## 關於本文檔

### 目標

維護的目標GTFS Realtime最佳實踐是：

* 提升end- 公共交通應用程序中的用戶客戶體驗
* 讓軟件開發人員更輕鬆地部署和擴展應用程序、產品和服務

### 如何提出或修改已發表GTFS Realtime最佳實踐

GTFS應用程序和實踐不斷發展，因此本文檔可能需要從time至time.要對本文檔提出修改建議，請[在](https://github.com/MobilityData/GTFS_Realtime_Best-Practices)GTFS Realtime[最佳實踐 GitHub 存儲庫](https://github.com/MobilityData/GTFS_Realtime_Best-Practices)並倡導變革。

### 鏈接到此文檔

請在此處鏈接，以便為飼料生產商提供正確形成的指導GTFS Realtime數據。每個單獨的推薦都有一個錨鏈接。點擊推薦獲取url對於頁內錨鏈接。

如果一個GTFS Realtime- 消費應用程序提出要求或建議GTFS Realtime對於此處未描述的數據實踐，建議發布包含這些要求或建議的文檔，以補充這些常見的最佳實踐。
