---
search:
  exclude: true
---

# GTFS Schedule變化

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

這GTFS規範不是一成不變的。相反，它是由交通機構、開發商和其他利益相關者社區開發和維護的開放規範，這些利益相關者使用GTFS .預計這個由生產者和消費者組成的社區GTFS data 將提出擴展規範以啟用新功能的建議。

貢獻於GTFS ，閱讀[規範修訂流程](../process)並關注未[解決問題](https://github.com/google/transit/issues)中的討論，並在 Google 的 Transit Github 存儲庫 ( [google/transit](https://github.com/google/transit) ) 上[拉取請求](https://github.com/google/transit/pulls)。![](../../assets/mark-github.svg)

！！！筆記 ””

  官方規範、參考和文檔均以英文編寫。如果一個Translation不同的語言與英文原文不同，後者優先。所有交流均以英語進行。


## 積極的建議![](../../assets/pr-active.svg)

<!--
Active proposals for new features in <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.  -->

加入[Github](https://github.com/google/transit/pulls)上的討論！

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add <glossary variable="trip">trip</glossary>-to-<glossary variable="trip">trip</glossary> transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## 最近合併的提案![](../../assets/pr-merged.svg)

最近合併的提案現在是[官方](../reference)的功能GTFS Schedule[規範](../reference)。有關更多信息，請參閱完整的[修訂歷史](../process#revision-history)。

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">添加trip-至-trip帶座位選項的接送服務</a></h3><p class="maintainer">#303 by <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a>於 2022 年 6 月 26 日合併</p></div><div class="featurelist"><ul><li>添加新的<code>transfer_type</code> `strip至trip轉移定義用戶是否可以在相同的情況下進行“座位轉移”vehicle正在經營兩個連續的行程，用戶可以留在船上</li><li>可以定義何時不允許在座位上轉機，但可以在操作上將兩個不同的行程聯繫在一起</li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank">GTFS-Fares V2基礎實施</a></h3><p class="maintainer">#286 由<a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a>於 2022 年 5 月 17 日合併</p></div><div class="featurelist"><ul><li>過境票價和車票</li><li>複雜票價和轉賬的成本建模（多網絡，time基於和基於計數的傳輸）</li><li>將停靠點與收費區域相關聯的模型</li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">trip-至-trip和路線到路線的轉移</a></h3><p class="maintainer">#284 由<a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a>於 2021 年 10 月 5 日合併</p></div><div class="featurelist"><ul><li>指定停止之間的傳輸規則，trip或路由對transfers.txt</li><li>基於不同配對安排的轉移規則的排名特異性</li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3><p class="maintainer">#208 由<a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a>於 2020 年 5 月 13 日合併</p></div><div class="featurelist"><ul><li>允許騎手在沿途的任何地方上車或下車vehicle的旅行路線</li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3><p class="maintainer">#180 由<a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a>於 2020 年 1 月 9 日合併</p></div><div class="featurelist"><ul><li>翻譯為text字段、本地化 URL 和聯繫信息</li></ul></div></div>

<div class="row"/>
