---
search:
  exclude: true
---

# 規範修改過程

這GTFS規範不是一成不變的。相反，它是由交通機構、開發商和其他利益相關者社區開發和維護的開放規範，這些利益相關者使用GTFS .預計這個由生產者和消費者組成的社區GTFS data 將提出擴展規範以啟用新功能的建議。為幫助管理該流程，制定了以下程序和指南。

!!!note ""

    官方規範、參考和文檔均以英文編寫。如果一個Translation不同的語言與英文原文不同，後者優先。所有交流均以英語進行。


1. 創建一個 git 分支，更新協議定義、規範和文檔文件的所有相關部分（翻譯除外）。
1. 在<https://github.com/google/transit>上創建拉取請求。拉取請求必須包含補丁的擴展描述。拉取請求的創建者成為_倡導者_。
1. 一旦拉取請求被註冊，它必須由它的倡導者在 中宣布 [更改郵件列表](https://groups.google.com/forum/#!forum/gtfs-changes)，包括拉取請求的鏈接。一旦宣布，拉取請求將被視為提案。還應編輯拉取請求以包含指向 Google 網上論壇公告的鏈接，以便可以輕鬆地進行交叉引用。
   - 由於倡導者是貢獻者，他們必須在接受拉取請求之前簽署[貢獻者許可協議](../CONTRIBUTING.md)。
1. 該提案的討論如下。拉取請求評論應該用作唯一的討論論壇。
   - 只要倡導者認為有必要，討論就會持續，但必須至少為 7 個日曆日。
   - 倡導者負責根據他們同意的評論及時更新提案（即拉取請求）。
   - 在任何時候time倡導者可以要求提案被放棄。
1. 倡導者可以在任何時候要求對提案的一個版本進行投票time在討論所需的最初 7 天間隔之後。
   - 在要求投票之前，至少有一個GTFS製片人和一個GTFS消費者應實施提議的變更。預計GTFS生產者包括面向公眾的變化GTFS在拉取請求評論中提供並提供指向該數據的鏈接，並且GTFS消費者在 pull request 評論中提供了一個指向應用程序的鏈接，該應用程序正在以非平凡的方式利用更改（即，它支持新的或改進的功能）。
1. 投票持續的最短時間足以覆蓋 7FULL日曆日和 5FULL瑞士工作日。投票於世界標準時間 23:59:59 結束。
   - 倡導者應公佈具體endtime在start的投票。
   - 在投票期間，只允許對提案進行編輯性修改（錯別字、措辭可以更改，只要不改變意思）。
   - 任何人都可以對拉取請求以評論的形式投票是/否，並且投票可以更改，直到end的投票期。
   如果選民改變她的投票，建議通過刪除投票並寫新投票來更新原始投票評論來做到這一點。
   - 之前的投票start的投票期不予考慮。
   - 投票開始和結束必須在 上宣布 [更改郵件列表](https://groups.google.com/forum/#!forum/gtfs-changes)。
1. 如果至少有 3 票一致同意，則該提案被接受。
   - 提議者的投票不計入 3 票總數。例如，如果提議者 X 創建一個拉取請求並投贊成票，而用戶 Y 和 Z 投贊成票，則這計為總共 2 票贊成票。
   - 反對票應有動機，並最好提供可操作的反饋。
   - 如果投票失敗，那麼倡導者可以選擇繼續對該提案進行工作，或者放棄該提案。
   辯護人的任何一項決定都必須在 中宣布 [更改郵件列表](https://groups.google.com/forum/#!forum/gtfs-changes)。
   - 如果倡導者繼續提案工作，則可以在任何時候要求進行新的投票time.
1. 任何在 30 個日曆日內保持非活動狀態的拉取請求都將被關閉。當拉取請求關閉時，相應的提案被視為已放棄。倡導者可以隨時重新打開拉取請求time如果他們希望繼續或維持對話。
1. 如果提案被接受：
   - Google 承諾合併投票通過的拉取請求版本（前提是貢獻者已簽署[CLA](../CONTRIBUTING.md) ），並在 5 個工作日內執行拉取請求。
   - 翻譯不得包含在原始拉取請求中。
   Google 負責最終將相關翻譯更新為受支持的語言，但純Translation歡迎來自社區的拉取請求，並在所有編輯評論得到解決後立即接受。
1. 拉取請求的最終結果（接受或放棄）應在最初宣布拉取請求的同一 Google 網上論壇線程中公佈。

<hr/>

## 指導原則

為了保留原有的視野GTFS , 在擴展規範時要考慮一些指導原則：

**提要應該易於創建和編輯**<br/>我們選擇 CSV 作為規範的基礎，因為使用電子表格程序可以輕鬆查看和編輯它，並且text編輯器，這對較小的機構很有幫助。它也很容易從大多數編程語言和數據庫中生成，這對大型提要的發布者來說非常有用。<br/>

**提要應該易於解析**<br/>提要閱讀器應該能夠以盡可能少的工作提取他們正在尋找的信息。對 feed 的更改和添加應該盡可能廣泛有用，以最大限度地減少 feed 讀者需要實現的代碼路徑的數量。 （但是，應該優先考慮讓創建更容易，因為最終將有更多的提要發布者而不是提要閱讀者。）<br/>

**規範是關於乘客信息的**<br/>GTFS主要與乘客信息有關。也就是說，規範首先應包括有助於為騎手提供動力工具的信息。運輸機構可能希望在系統之間內部傳輸大量面向運營的信息。GTFS不用於該目的，並且可能存在其他可能更合適的面向操作的數據標準。<br/>

**對規範的更改應該向後兼容**<br/>在向規範添加功能時，我們希望避免進行會使現有提要無效的更改。在現有的提要發布者想要為其提要添加功能之前，我們不想為他們創造更多的工作。此外，只要有可能，我們希望現有的解析器能夠繼續讀取較新提要的較舊部分。<br/>

**不鼓勵投機功能**<br/>每一項新功能都增加了訂閱源的創建和閱讀的複雜性。因此，我們要注意只添加我們知道有用的功能。理想情況下，任何提案都將通過為使用新功能的真實交通系統生成數據並編寫軟件來讀取和顯示來進行測試。請注意，GTFS允許通過添加官方解析器和驗證器忽略的額外列和文件來擴展格式，因此可以輕鬆地對提案進行原型設計並在現有提要上進行測試。<br/>

<hr/>

## 修訂記錄

**2023年3月14日**<br/>

* 增加了票价媒体。见[讨论](https://github.com/google/transit/pull/355)。

**2022 年 7 月 26 日**

* 添加了帶座位選項的行程到行程的接送服務。 見[討論](https://github.com/google/transit/pull/303)

**2022 年 5 月 17 日**

* GTFS-Fares V2基礎實施。 見[討論](https://github.com/google/transit/pull/286)

**2021 年 10 月 22 日**

* 添加小學和外國id領域。 見[討論](https://github.com/google/transit/pull/278)

**2021 年 10 月 5 日**

* 添加了 旅行到旅行 和 路由到路由 轉移。 見[討論](https://github.com/google/transit/pull/284)

**2021 年 9 月 15 日**<br/>

* 允許收費站 (pathway_mode=6) 是雙向的。見[討論](https://github.com/google/transit/pull/276)。

**2021 年 9 月 13 日**<br/>

* 更新`stop_name`最佳實踐。見[討論](https://github.com/google/transit/pull/282)。

**2021 年 8 月 27 日**<br/>

* 更新GTFS Schedule到[RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119) 。見[討論](https://github.com/google/transit/pull/277)。

**2021 年 1 月 4 日**<br/>

* 澄清了`stop_times. stop_id` .見[討論](https://github.com/google/transit/pull/258)。
* 定義的正和非零字段符號。見[討論](https://github.com/google/transit/pull/251)。

**2020 年 10 月 2 日**<br/>

* 將`frequencies.headway_secs`的字段類型從非負數更改為正整數。見[討論](https://github.com/google/transit/pull/249)。

**2020 年 5 月 25 日**<br/>

* 定義`pathways.txt` ,`levels.txt`和`attributions.txt`作為可翻譯的表格。添加了翻譯多語言`signposted_as`值的建議。見[討論](https://github.com/google/transit/pull/220)。

**2020 年 5 月 13 日**<br/>

* 添加了`continuous_pickup`和`continuous_drop_off`到routes.txt和stop_times.txt .改變了shape_id從“Optional”到“Conditionally required”。見[討論](https://github.com/google/transit/pull/208)。

**2020 年 3 月 24 日**<br/>

* 定義text-to-speech 字段並將`tts_stop_name`添加到`stops.txt` .見[討論](https://github.com/google/transit/pull/49)。

**2020 年 2 月 5 日**<br/>

* 添加了無軌電車和單軌`route_types` 。見[討論](https://github.com/google/transit/pull/174)。

**2020 年 1 月 9 日**<br/>

* 添加`translations.txt` .見[討論](https://github.com/google/transit/pull/180)。

**2019 年 12 月 26 日**<br/>

* 更新了纜車和空中升降機的定義`route_type` .見[討論](https://github.com/google/transit/pull/186)。

**2019 年 12 月 20 日**<br/>

* 添加`attributions.txt` .見[討論](https://github.com/google/transit/pull/192)。

**2019 年 8 月 26 日**<br/>

* 指定`stop_lat`和`stop_lon`位於乘客等待登機的位置vehicle.見[討論](https://github.com/google/transit/pull/179)。

**2019 年 7 月 9 日**<br/>

* 添加arrival和departuretime最佳實踐。見[討論](https://github.com/google/transit/pull/165)。
* 添加了 headsign 最佳實踐。見[討論](https://github.com/google/transit/pull/167)。
* 添加`stop_id`最佳實踐。見[討論](https://github.com/google/transit/pull/169)。

**2019 年 6 月 25 日**<br/>

* 明確的關係Shape點和停止。見[討論](https://github.com/google/transit/pull/39)。

**2019 年 4 月 4 日**<br/>

* 在中添加了`platform_code`字段`stops.txt` .見[討論](https://github.com/google/transit/pull/146)。

**2019 年 3 月 27 日**<br/>

* 添加`pathways.txt`和`levels.txt` .見[討論](https://github.com/google/transit/pull/143)。

**2019 年 2 月 6 日**<br/>

* 為清楚起見，編輯和格式更改。見[討論](https://github.com/google/transit/pull/120)。

**2018 年 10 月 2 日**<br/>

* 分解字段類型。見[討論](https://github.com/google/transit/pull/104)。

**2018 年 9 月 14 日**<br/>

* 添加了“Conditionally required”的概念。見[討論](https://github.com/google/transit/pull/100)。

**2018 年 9 月 4 日**<br/>

* 統一了`agency_lang`和`feed_lang`的定義。見[討論](https://github.com/google/transit/pull/98)。

**2018 年 8 月 27 日**<br/>

* 更新`CHANGES.md`和最後修訂日期。見[討論](https://github.com/google/transit/pull/99)。

**2018 年 8 月 22 日**<br/>

* 添加`feed_contact_email`和`feed_contact_url`字段`feed_info.txt`文件。見[討論](https://github.com/google/transit/pull/31)。

**2017 年 12 月 11 日**<br/>

* `route_sort_order`添加到`routes.txt` .見[討論](https://github.com/google/transit/pull/83)。

**2017 年 3 月 15 日**<br/>

* 闡明提案人的投票不計入總票數。見[討論](https://github.com/google/transit/pull/50)。
* 指定在發起投票之前，至少有一個GTFS製片人和一個GTFS消費者應實施提議的變更。見[討論](https://github.com/google/transit/pull/46)。

**2017 年 2 月 7 日**<br/>

* 澄清了`block_id`和service_id .見[討論](https://github.com/google/transit/pull/44)。
* 澄清基於頻率的服務開始於vehicledeparture.見[討論](https://github.com/google/transit/pull/42)。
* 澄清說明`stop_id`和`stop_code` 。見[討論](https://github.com/google/transit/pull/40)。

**2017 年 12 月 11 日**<br/>

* 在中添加`route_sort_order`字段`routes.txt`文件。見[討論](https://github.com/google/transit/pull/83)。

**2016 年 11 月 27 日**<br/>

* 添加車站入口作為`stops.location_type` 。見[討論](https://github.com/google/transit/pull/30)。

**2016 年 9 月 2 日**<br/>

* 更新文檔以添加`agency_id`在下面`fare_attributes.txt` .見[討論](https://github.com/google/transit/pull/27)。

**2016 年 3 月 16 日**<br/>

* 的過渡GTFS在<https://github.com/google/transit>上向 Github 提供文檔

**2016 年 2 月 3 日**<br/>

* 添加`agency_email`到`agency.txt`規範提案： [討論](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

**2015 年 2 月 2 日**<br/>

* 添加stop_times.txt規範的“時間點”提案： [討論](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

**2014 年 2 月 17 日**<br/>

* 添加trips.txt 'bikes_allowed' 規範提案： [討論](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

**2012 年 10 月 15 日**<br/>

* 添加trips.txt 'wheelchair_accessible' 規範提案： [討論](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2012 年 6 月 20 日**<br/>

* 在規範中添加了“wheelchair_boarding”提案： [討論](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2012 年 2 月 2 日**<br/>

* 向規範添加了“stop_timezone”提案： [討論](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)

**2012 年 1 月 18 日**<br/>

* 將文檔從舊的 code.google.com 遷移到 developers.google.com 的新位置。

**2011 年 9 月 26 日**<br/>

* 向規範添加了“feed_info”提案： [討論](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

**2011 年 9 月 6 日**<br/>

* 向規範添加了“agency_fare_url”提案： [討論](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
* 向規範添加了“exact_times”提案： [討論](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

**2009 年 3 月 30 日**<br/>

* 關於公開提供交通提要的新部分。這之前沒有在小組中討論過，因為嚴格來說，這並不是對數據解釋或寫入方式的改變。然而，谷歌的一些人認為包含非谷歌使用的討論會提供信息GTFS ，因為越來越多的應用程序可以利用GTFS -格式化數據。
* CSV 格式說明： [討論](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk)。
* 有關如何在 route_color 和 route_text_color 字段的描述中選擇對比色的其他指導。
* trip_short_name，在這些線程中提出和測試：a 和 b。
* 修復了包含在示例數據中的一個小錯誤end文檔的（給 stop S7 parent_station S8）。
* 在示例數據中添加了“agency_lang”信息end正如 Marcy 在評論期間所建議的那樣，該文件的建議： [討論](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0)。
* 更新了 OCTA 的鏈接GTFS在邊欄中輸入
* 參見[原始摘要](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw)。

**2009 年 2 月 26 日**<br/>

* 刪除了大部分特定於 Google 的提要提交說明，因為還有許多其他應用程序使用GTFS此時的數據。
* 修復了側邊欄中指向奧蘭治縣 OCTA 公共提要的斷開鏈接。

**2008 年 8 月 7 日**<br/>

* 恢復了 stop_url 字段，該字段在 8 月 6 日的版本中被意外遺漏
* 添加 agency_phone 到示例數據
* 在向 Google 提交提要時添加了對數據使用協議的提及

**2008 年 8 月 6 日**<br/>

* 添加transfers.txt文件，允許提要發布者提供有關首選傳輸行為的提示（ [原始提案](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw)）
* 將 location_type 和 parent_station 字段添加到stops.txt ，允許將停止點分組為站（ [原始提案](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw)）
* 添加了 agency_phone 字段，用於為代理機構提供語音電話號碼 ( [原始提案](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA)）
* 添加了提及開源測試工具的“測試您的訂閱源”部分
* 添加了關於 CSV 格式、agency_timezone、agency_lang、route_color、route_text_color、arrival_time、departure_time、calendar.txt對比calendar_dates.txt ，票價表，和frequencies.txt
* 添加了提要歷史文檔的鏈接，並更正了一些公共提要鏈接
* 更新了示例圖像以描述當前的 Google 地圖用戶界面
* 更新/修復文檔中的示例數據

**2008 年 2 月 29 日**<br/>

* 在中添加了 stop_code 字段stops.txt允許規範面向騎手的停止代碼（ [原始提案](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc)）
* 澄清了 route_short_name 和 route_long_name 的描述`routes.txt`
* 澄清了arrival_time和departure_time的描述stop_times.txt
* 修復了示例數據部分中的拼寫錯誤

**2007 年 11 月 20 日**<br/>

* 闡明了 block_id 描述
* 更改語言以不再強調 Google Transit（因為非 Google 應用程序正在使用GTFS ，公交路線現在是谷歌地圖的一個集成功能），並修復各種拼寫錯誤
* 更新示例屏幕截圖以反映GTFS當前 Google 地圖用戶界面中的字段
* 更新了公交數據提供商的 Google 聯繫電子郵件地址
* 更新格式

**2007 年 10 月 5 日**<br/>

* 改變了stop_sequence和shape_pt_sequence允許任何遞增的非負整數
* 澄清的描述和更正的拼寫錯誤

**2007 年 5 月 31 日**<br/>

* 更新了頁面樣式，使 HTML 更簡潔、更易於訪問
* 添加了指向公共提要示例和其他有用站點的鏈接
* 從單個字段描述中刪除了示例

**2007 年 4 月 9 日**<br/>

* 添加了有關[提交提要的](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle)部分。
* 添加了[示例演示 Transit Agency feed](https://developers.google.com/transit/gtfs/examples/gtfs-feed) 。
* 補充說明calendar.txt如果所有服務日期都定義在calendar_dates.txt .
* 做了agency_id在僅包含一個機構的 Feed 中該字段是可選的。這允許現有的提要沒有agency_id保持有效。
* 添加了更完整的 agency_url、stop_url 和 route_url 規範，以及這些字段的其他示例值。
* 添加 6（纜車）和 7（纜車）有效route_type值。

**2007 年 3 月 8 日**<br/>

* 將 stop_url 字段從stop_times.txt ，在 2 月 28 日的更新中被錯誤地指定為stops.txt , 它屬於哪裡。

**2007 年 3 月 5 日**<br/>

* 小幅編輯以闡明 route_long_name 字段的描述。

**2007 年 2 月 28 日**<br/>

* 外加的frequencies.txt用於基於車頭時距的時間表支持。
* 現在允許在同一個提要中使用多個代理機構。還新增了agency_id agencies.txt 和routes.txt這讓您可以指定哪條路線由哪個機構運營。
* 添加每條路線和每站 URL。
* 外加的direction_id字段中trips.txt .
* 支持中tripheadsign 通過添加 stop_headsign 字段更改stop_times.txt .
* 通過在中添加可選的 route_color 和 route_text_color 來支持路由顏色routes.txt .
* 刪除了使用街道地址指定停靠點的功能。先前版本的規範允許您使用 stop_street、stop_city、stop_region、stop_postcode 和 stop_country 字段中的街道地址來提供公交站點的位置。現在必須使用 stop_lat 給出停止位置latitude和 stop_lon 為longitude，這對大多數應用程序更有用。
* 增加纜車vehicle輸入route_type字段中routes.txt .
* 請參閱原始的[Headway 博客文章](https://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/)更改摘要。

**2006 年 11 月 29 日**<br/>

* 添加了對tripShape信息通過shapes.txt
* 闡明了的定義stop_sequence
* 標記 pickup_type 和 drop_off_type 可選

**2006 年 10 月 31 日**<br/>

* 添加了對票價信息的支持
* 從單個文件名中刪除日期
* 改變了route_type價值定義
* 允許同時發布多個提要文件time，只要他們的服務期不重疊
* 修復了 block_idtrips.txt以便它被正確標記為可選
* 注意必須包含列標題

**2006 年 9 月 29 日**<br/>

* 較小的編輯以修復示例中的幾個錯誤。

**2006 年 9 月 25 日**<br/>

* 初始版本。
