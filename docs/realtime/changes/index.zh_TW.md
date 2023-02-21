# GTFS Realtime 變化

GTFS Realtime 規範並非一成不變。相反，它是由交通機構、開發商和其他使用 GTFS Realtime 的利益相關者社區開發和維護的開放規範。預計這個 GTFS 實時數據的生產者和消費者社區將提出擴展規範以啟用新功能的建議。

要為 GTFS Realtime 做出貢獻，請閱讀[規範修訂過程](../process)並關注 Google 的 Transit Github 存儲庫 ( [google/transit](https://github.com/google/transit) ) 上未[解決問題](https://github.com/google/transit/issues)和[拉取請求](https://github.com/google/transit/pulls)中的討論。 ![](../../assets/mark-github.svg)

!!! note ""

    官方規範、參考和文檔均以英文編寫。如果一個翻譯不同的語言與英文原文不同，後者優先。所有交流均以英語進行。

<!-- <br><div class="landing-page">
    <a class="button" href="../process">規範修改過程</a><a class="button" href="../guiding-principles">指導原則</a><a class="button" href="../revision-history">修訂記錄</a><a class="button" href="../extensions">實時擴展</a>
</div> -->

## 積極的建議 &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- 對新功能的積極建議GTFS Realtime.  -->

加入[Github](https://github.com/google/transit/pulls)上的討論！

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">添加cause_detail和effect_detail到警報</a></h3>
        <p class="maintainer">#332 關於 2022 年 5 月 31 日由 <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">目前沒有積極的提案GTFS Realtime.</h3>
        <p class="prompt">有建議嗎 &ensp;➜&ensp; 打開一個 <a href="https://github.com/google/transit/pulls" target="_blank">拉取請求</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## 最近合併的提案 &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

最近合併的提議現在是[官方 GTFS Realtime規範](../reference)的特徵。有關更多信息，請參閱完整的[修訂歷史](../process#revision-history)。

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">將 cause_detail 和 effect_detail 添加到Alerts</a></h3><p class="maintainer">#332 由<a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a>於 2022 年 6 月 26 日合併</p></div><div class="featurelist"><ul><li>添加對警報的原因和影響的描述</li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt：輪椅通道更新</a></h3><p class="maintainer">#340 by <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a>於 2022 年 7 月 25 日合併</p></div><div class="featurelist"><ul><li>添加有關旅行可達性的實時信息</li><li>如果提供，則覆蓋 GTFS 計劃數據集中的<code>trips.wheelchair_accessible</code> </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Alerts中的功能/圖像</a></h3><p class="maintainer">#283 by <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a>已於 2021 年 11 月 26 日合併</p></div><div class="featurelist"><ul><li>將 URL 鏈接字段添加到圖像（例如照片或地圖）以顯示在應用程序的服務警報中，以增強對警報的理解</li><li>更改包括：強制執行圖像大小限制，每個警報一張圖像，並確保在圖像內容或語言發生變化時更改 URL </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">添加 GTFS-NewShapes 作為實驗</a></h3><p class="maintainer">#272 by <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a>於 2021 年 8 月 30 日合併</p></div><div class="featurelist"><ul><li>能夠實時更新路線形狀以反映彎路</li><li>路線更新通過引用現有的<code>shape_id</code>或通過實時將新形狀定義為編碼折線來反映</li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">將 departure_occupancy_status 添加到 TripUpdate</a></h3><p class="maintainer"> #260 by <a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a>於 2021 年 4 月 14 日合併</p></div><div class="featurelist"><ul><li>根據當前或歷史數據提供未來停靠點的交通車輛預測佔用率</li></ul></div></div>

<div class="row"></div>
