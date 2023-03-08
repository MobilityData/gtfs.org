# 向 GTFS Realtime 添加新字段

當生產者或消費者有興趣向 GTFS Realtime 規範添加新字段時，他們應該在[GTFS Realtime GitHub 存儲庫](https://github.com/google/transit)上打開一個新問題來描述提議的字段，並在[GTFS](https://groups.google.com/forum/#!forum/gtfs-realtime)上宣布這個新字段（包括問題的鏈接）[實時郵件列表](https://groups.google.com/forum/#!forum/gtfs-realtime)。

## 規範修改過程

1. 創建一個 git 分支，更新協議定義、規範和文檔文件的所有相關部分（翻譯除外）。
2. 在<https://github.com/google/transit>上創建拉取請求。拉取請求必須包含補丁的擴展描述。拉取請求的創建者成為*倡導者*。
3. 一旦拉取請求被註冊，它必須由其倡導者在[GTFS Realtime 郵件列表中公佈](https://groups.google.com/forum/#!forum/gtfs-realtime)。一旦宣布，拉取請求將被視為提案。
     - 由於倡導者是貢獻者，他們必須在接受拉取請求之前簽署[貢獻者許可協議](https://github.com/google/transit/blob/master/CONTRIBUTING.md)。
4. 該提案的討論如下。拉取請求評論應該用作唯一的討論論壇。
     - 只要倡導者認為有必要，討論就會持續，但必須至少為 7 個日曆日。
     - 倡導者負責根據他們同意的評論及時更新提案（即拉取請求）。
     - 在任何時候time倡導者可以要求提案被放棄。
5. 在最初的 7 天討論間隔之後，倡導者可以隨時要求對提案的某個版本進行投票。
     - 在要求投票之前，至少一個 GTFS-realtime生產者和一個 GTFS-realtime消費者應該實施提議的變更。預計 GTFS-realtime生產者將更改包含在面向公眾的 GTFS-realtime提要中，並在拉取請求評論中提供指向該數據的鏈接，並且 GTFS-realtime消費者提供一個鏈接在 pull request 評論中，應用程序正在以非平凡的方式利用更改（即，它支持新的或改進的功能）。
     - 在要求投票時，倡導者應明確說明投票是為了將該領域正式納入規範，還是為了實驗領域。
6. 投票持續的最短時間足以涵蓋 7 個完整的日曆日和 5 個完整的瑞士工作日。投票於世界標準時間 23:59:59 結束。
     - 倡導者應在投票開始時宣布具體結束時間。
     - 在投票期間，只允許對提案進行編輯性修改（錯別字、措辭可以更改，只要不改變意思）。
     - 任何人都可以對拉取請求以評論的形式投票是/否，並且可以更改投票直到投票期結束。
   如果選民改變她的投票，建議通過刪除投票並寫新投票來更新原始投票評論來做到這一點。
     - 投票期開始前的投票不予考慮。
7. 如果至少有 3 票一致同意，則該提案被接受。
     - 提議者的投票不計入 3 票總數。例如，如果提議者 X 創建一個拉取請求並投贊成票，而用戶 Y 和 Z 投贊成票，則這計為總共 2 票贊成票。
     - 反對票應有動機，並最好提供可操作的反饋。
     - 如果投票失敗，那麼倡導者可以選擇繼續對該提案進行工作，或者放棄該提案。
   倡導者的任何一個決定都必須在郵件列表中公佈。
     - 如果倡導者繼續提案工作，則可以隨時要求進行新的投票。
8. 任何在 30 個日曆日內保持非活動狀態的拉取請求都將被關閉。當拉取請求關閉時，相應的提案被視為已放棄。如果倡導者希望繼續或維持對話，他們可以隨時重新打開拉取請求。
     - 請注意，倡導者可以選擇將該功能作為[自定義擴展](#extensions)而不是官方規範的一部分來實現。
9. 如果提案被接受：
     - 谷歌承諾合併拉取請求的投票版本（前提是貢獻者已簽署[CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md) ，並在 5 個工作日內執行拉取請求。
     - Google 致力於及時更新<https://github.com/google/gtfs-realtime-bindings>存儲庫。提交作為提案結果的 gtfs-realtime-bindings，應參考提案的拉取請求。
     - 翻譯不得包含在原始拉取請求中。
   谷歌負責最終將相關翻譯更新為支持的語言，但歡迎來自社區的純翻譯拉取請求，並在所有編輯評論得到解決後立即接受。

## *實驗*田

1. 如果社區可以就 (a) 提議的字段似乎有用以及 (b) 字段類型（ `optional`與`repeated` ， `string`與`int`與`bool` ）達成共識，那麼將在 GTFS Realtime 消息中分配一個字段編號並且會在[.proto 文件](../proto)和文檔中註明這是一個*實驗*領域，將來可能會發生變化。
   - 通過與以下[規範修改過程](#specification-amendment-process)相同的討論和投票過程達成共識，但批准只需要 80% 的讚成票而不是一致同意。
   - 希望使用新*實驗*領域的 GTFS Realtime 生產者和消費者將使用帶有新領域的 .proto 文件重新生成他們的庫（例如，谷歌將更新[gtfs-realtime-bindings 庫](https://github.com/google/gtfs-realtime-bindings)），並開始填充和解析該領域與實時數據。
   - 一旦我們確信*實驗*領域是值得的並且生產者和消費者都在使用該領域，那麼我們將按照以下[規範修改流程](#specification-amendment-process)正式將領域添加到規範中。
   - 如果*實驗*場在被批准為*實驗*場後的 2 年內未通過[規範修訂過程](#specification-amendment-process)被採用，則將通過在[.proto 文件](../proto)中的字段值旁邊添加`[deprecated=true]`來棄用它。通過使用`[deprecated=true]` （而不是`RESERVED` ），已經採用該字段的生產者和消費者不必將其從使用中刪除。此外，如果在[規範修改過程](#specification-amendment-process)之後的後續投票中批准該字段（例如，當其他生產者和/或消費者開始使用該字段時），則該字段將來可能會“取消棄用”。
1. 如果新字段被認為特定於單個生產者或對數據類型存在爭議，那麼我們將為生產者分配[自定義擴展](../extensions)，以便他們可以在自己的提要中使用該字段。在可能的情況下，我們應該避免擴展，並將對許多機構有用的字段添加到主要規範中，以避免消費者為支持規範的各種擴展而產生的碎片化和額外工作。

## 指導原則

為了保留 GTFS Realtime 的原始願景，在擴展規範時要考慮一些指導原則：

<br/>**提要應該能夠高效地實時生產和消費。**

實時信息是連續的、動態的數據流，必然需要高效處理。我們選擇 Protocol Buffers 作為規範的基礎，因為它們在開發人員的易用性和傳輸數據的效率方面提供了很好的權衡。與 GTFS 不同，我們認為許多機構不會手動編輯 GTFS Realtime提要。 Protocol Buffers 的選擇反映了大多數 GTFS Realtime提要將以編程方式生成和使用的結論。

<br/>**該規範是關於乘客信息的。**

與之前的 GTFS 一樣，GTFS Realtime 主要關注乘客信息。也就是說，規範首先應包括有助於為騎手提供動力工具的信息。運輸機構可能希望在系統之間內部傳輸大量面向運營的信息。 GTFS Realtime 並非旨在用於該目的，並且可能存在其他可能更合適的面向操作的數據標準。

<br/>**對規範的更改應該是向後兼容的。**

在向規範添加功能時，我們希望避免進行會使現有提要無效的更改。在現有的提要發布者想要為其提要添加功能之前，我們不想為他們創造更多的工作。此外，只要有可能，我們希望現有的解析器能夠繼續讀取較新提要的較舊部分。擴展 Protocol Buffers 的約定將在一定程度上強制向後兼容。但是，我們希望避免對現有字段進行可能破壞向後兼容性的語義更改。

<br/>**不鼓勵投機功能。**

每個新功能都增加了創建和閱讀提要的複雜性。因此，我們要注意只添加我們知道有用的功能。理想情況下，任何提案都將通過為使用新功能的真實交通系統生成數據並編寫軟件來讀取和顯示來進行測試。

## 修訂記錄

**2020 年 3 月 12 日**

- 更新了 GTFS Realtime參考頁面上的`TripDescriptor`描述。

**2015 年 2 月 26 日**

- 將實驗場`direction_id`添加到`TripDescriptor` （[討論](https://groups.google.com/d/msg/gtfs-realtime/b8N2GGd2TBs/0fJ1IOMTjJ0J)）。

**2015 年 1 月 30 日**

- 將 Protocol Buffer 擴展命名空間添加到所有剩餘的 GTFS Realtime消息中，這些消息還沒有一個（例如`FeedMessage`和`FeedEntity` ）。

**2015 年 1 月 28 日**

- 為`TripUpdate`添加了試驗場`delay` （[討論](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8)）。

**2015 年 1 月 16 日**

- 更新`TripDescriptor.start_time`的描述。

**2015 年 1 月 8 日**

- 定義了實驗枚舉`OccupancyStatus` 。
- 將實驗場地`occupancy_status`添加到`VehiclePosition` （[討論](https://groups.google.com/forum/#!topic/gtfs-realtime/\_HtNTGp5LxM)）。

**2014 年 5 月 22 日**

- 更新了`StopTimeUpdate`消息中`ScheduleRelationship`枚舉的描述（[討論](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)）。
- 從`TripDescriptor`消息中的`ScheduleRelationship`枚舉值中刪除了 REPLACEMENT（[討論](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)）。

**2012 年 10 月 12 日**

- 為`TripUpdate`消息添加了時間戳字段。

**2012 年 5 月 30 日**

- 添加了關於規範擴展的具體細節。

**2011 年 11 月 30 日**

- 為關鍵的 GTFS Realtime消息添加了 Protocol Buffer 擴展命名空間，以方便編寫規範的擴展。

**2011 年 10 月 25 日**

- 更新文檔以闡明`alert` 、 `header_text`和`description_text`都是純文本值。

**2011 年 8 月 20 日**

- 更新文檔以闡明`TimeRange`消息的語義。

**2011 年 8 月 22 日**

- 初始版本。
