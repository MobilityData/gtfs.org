---
search:
  exclude: true
---

# GTFS : 使公共交通數據普遍可用

<div class="landing-page">
    <a class="button" href="schedule">GTFS Schedule</a><a class="button" href="realtime">GTFS Realtime</a><a class="button" href="resources">资源</a><a class="button" href="extensions">扩展</a>
</div>

這General Transit Feed Specification（GTFS）是一個[開放標準](https://www.interoperablemobility.org/definitions/#open_standard)，用於向乘客分發有關交通系統的相關資訊。它允許公共交通機構以多種軟體應用程式可以使用的格式發布其交通數據。今天，GTFS數以千計的公共交通提供者使用資料格式。

GTFS由兩個主要部分組成：GTFS Schedule和GTFS Realtime。GTFS Schedule包含有關路線、時刻表、票價和地理交通詳細信息的信息，並以簡單的文本文件形式呈現。這種簡單的格式可以輕鬆創建和MAINTENANCE無需依賴複雜或專有軟體。

GTFS Realtime包含行程更新、車輛位置和服務警報。它基於協定緩衝區，協定緩衝區是一種用於序列化結構化資料的語言（和平台）中立機制。

GTFS受到世界各地的支持，其使用、重要性和範圍一直在增加。您認識的某個機構可能已經在使用GTFS來表示路線、時間表、停靠位置和其他信息，並且乘客已經通過各種應用程式使用它。

[了解更多關於歷史的信息GTFS](background.md) 

## 為什麼要使用GTFS ？

GTFS被 100 多個國家的 10,000 多家運輸機構使用。大多數交通機構都聽過GTFS ，並迅速成為業界標準。有些機構自己產生這些數據，而有些機構則僱用供應商為其創建和維護數據。由於它是一個簡單的、基於文字的開放標準，許多交通技術供應商已經可以讀取和寫入GTFS文件。透過更好的理解GTFS ，機構在數據方面可以做出更好的選擇。機構在如何維護和分發方面所做的選擇GTFS可能會對服務品質產生巨大影響。

### 開放資料意味著更多的機會和選擇

GTFS是一個開放標準。這意味著各機構可以使用已經支援的眾多工具中的任何一種來提供訊息GTFS （包括使用文字編輯器或電子表格進行簡單的文字編輯）。開放標準可以創建易於共享的數據。提要只是描述服務的文本文件的集合，透過公開的永久連結在線託管。 Google、Apple、Transit App、Open Trip Planner，甚至乘客創建的應用程式都可以使用相同的來源。任何想要提供準確且最新的交通資訊的人都可以使用GTFS飼料這樣做。

一些騎手喜歡根據自己的需求使用不同的應用程式GTFS讓騎士選擇最適合他們的旅行計劃應用程式。有些應用程式可能更易於訪問或更好地為殘疾騎手提供信息，有些可能更簡單且更易於使用，有時騎手只是想要最新的應用程式。

### GTFS可能做的比你想像的更多

GTFS以旅行規劃資訊而聞名，尤其是在提供固定路線服務的都會區。然而，除了基本功能之外，還有多種選用功能GTFS Schedule規範使GTFS適用範圍更廣泛，包括用於顯示票價成本和結構的票價、用於需求響應型交通選項的Flex（正在開發中），例如電話預約和輔助交通服務，以及用於顯示對使用移動設備或乘客至關重要的無障礙資訊的路徑需要額外的住宿。GTFS Realtime建立在GTFS Schedule以及車載 GPS 系統，提供車輛位置的即時更新。

### GTFS不僅僅是旅行計劃

GTFS現在，各種軟體應用程式將數據用於許多不同的目的，包括用於規劃的數據視覺化和分析工具。擁有最新的高品質數據不僅可以為乘客提供準確的交通信息，還可以為規劃者和政策制定者提供準確的交通信息，讓他們能夠更好地了解社區中交通的使用情況。從 2023 年開始，美國聯邦交通管理局將要求[那裡的交通機構提交有效的](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications)GTFS [數據](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications)及其年度國家交通資料庫報告。

## 什麼是高品質GTFS ？

高品質GTFS完整、準確且最新。這意味著它代表服務當前的運作方式並提供盡可能多的信息。

### 完整數據

品質GTFS包括重要的服務細節，例如HOLIDAY夏季時間表的變化、準確的停靠位置以及與其他面向騎手的材料相匹配的路線名稱和車頭標誌。即使代理商與供應商合作生產GTFS ，最終由該機構來確保印刷、機上和線上提供的資訊一致。

有關創建高品質數據的信息，請參閱[加州交通數據指南](https://dot.ca.gov/cal-itp/california-transit-data-guidelines)和[GTFS 最佳實踐](schedule/best-practices)

### 最新

擁有過時的數據幾乎比沒有數據更糟。僅僅發布資訊是不夠的，它必須與騎手的所見所聞相匹配。一些最大的交通機構更新了他們的GTFS每週，甚至每天，但大多數機構都需要更新他們的訊息GTFS當服務發生變化時，每隔幾個月或一年幾次。這包括新路線或站點、時刻表變更或票價結構更新等。

許多機構聘請供應商來創建和管理他們的GTFS對於他們來說。一些供應商可能會主動詢問服務變更，但機構與供應商就即將到來的服務變更進行溝通非常重要。可以發布了GTFS提前調整服務，確保每個人（代理商、供應商、旅行規劃者和乘客）都能順利過渡！
