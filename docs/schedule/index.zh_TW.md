---
search:
  exclude: true
---
  
# GTFS Schedule 概述

<div class="landing-page">
    <a class="button" href="reference">參考</a><a class="button" href="best-practices">最佳實踐</a><a class="button" href="examples">例子</a><a class="button" href="changes">變化</a><a class="button" href="validate">證實</a>
</div>

## 入門

包含靜態交通信息的 GTFS 提要由多個文本 (.txt) 文件組成，這些文件包含在單個 ZIP 文件中。每個文件都描述了公交信息的一個特定方面：站點、路線、行程、票價等。有關每個文件的更多信息，請參閱 GTFS 參考。

要創建 GTFS 提要，請按照以下步驟操作。

1. 創建所有需要的文件GTFSSchedule參考。如果需要其功能，請創建可選文件。
1. 以 .txt 格式保存所有文件。字段值應以逗號分隔，並且每行應以換行符結尾。見GTFS有關文件內容的詳細信息的參考。
1. 將所有文本文件壓縮在一起。壓縮文件包含一個版本的提要。
1. 使用以下選項之一發布提要。

## 公開提供公交信息
<hr>

數據集應發佈在公共的永久 URL 上，包括 zip 文件名。 （例如，www.agency.org/gtfs/gtfs.zip）。理想情況下，URL 應該可以直接下載，無需登錄即可訪問文件，以方便使用軟件應用程序進行下載。雖然建議（也是最常見的做法）使 GTFS 數據集可公開下載，但如果數據提供者出於許可或其他原因確實需要控制對 GTFS 的訪問，建議使用 API 密鑰控制對 GTFS 數據集的訪問，這將有助於自動下載。

託管 GTFS 數據的 Web 服務器應配置為正確報告文件修改日期（參見 HTTP/1.1 - Request for Comments 2616，第 14.29 節）。

有關進一步的建議，請參閱“[最佳實踐：數據集發布](best-practices/#dataset-publishing-general-practices)”。


## 訓練
<hr>

世界銀行開放學習園區 (OLC) 提供名為“ [GTFS](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>) ”的基於自我的在線課程[-and-informal-transit-system-mapping">介紹](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)General Transit Feed Specification[(](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)GTFS [) 和非正式交通系統映射](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)”。本課程包括以下部分：


- 什麼是GTFS ?歷史和文件結構
- 什麼是GTFS ?可視化與社區
- 設置一個GTFS餵養
- GitHub 和開源工具簡介
- 田野故事
- 如何映射公交數據
- 如何為城市的第一個 Feed 收集數據
- 應用調查
- GTFS -Realtime


查看更多 [在線課程](../resources/other/#on-line-courses).

## 獲得幫助和社區
<hr>

### 郵件列表

當您對公共交通數據、軟件、GTFS 和 GTFS-realtime 等格式以及其他問題有疑問時，有許多郵件列表可能是很好的資源：

* [GTFS Changes](https://groups.google.com/group/gtfs-changes): 討論擴展 GTFS 規範的提案，如[GTFS 更改文檔](https://github.com/google/transit/blob/master/gtfs/CHANGES.md)中所述
* [GTFS Realtime](https://groups.google.com/group/gtfs-realtime): 討論[GTFS 實時規範](https://github.com/google/transit/tree/master/gtfs-realtime)。
* [MobilityData Slack](https://mobilitydata-io.slack.com/): Slack“組織”在專門討論 GTFS 主題的頻道。 [在此處請求mobilitydata-io.slack.com 的邀請](https://share.mobilitydata.org/slack)。
* [transitfeed](https://groups.google.com/group/transitfeed): 討論開源[transitfeed](https://groups.google.com/group/transitfeed)項目，以及討論GTFS規範和相關工具。
* [transit-developers](https://groups.google.com/group/transit-developers): 一般運輸開發商討論。許多交通機構也有自己的專門針對該機構的開發者郵件列表。例如：
    * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
    * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
    * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
    * [MassDOT](https://groups.google.com/group/massdotdevelopers)
    * [Atlanta, GA region](https://groups.google.com/forum/#!forum/atl-transit-developers)
    * [511 San Francisco Bay Area Developer Resources](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)

請諮詢您當地的交通機構，看看他們是否有自己的郵寄名單。

查看更多 [社區資源](../resources/community).
