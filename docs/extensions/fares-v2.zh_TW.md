<svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>

# GTFS-票價 v2

Fares v2 是一個 GTFS 計劃擴展項目，旨在解決[Fares v1](/schedule/examples/fares-v1)的局限性。

Fares v2 計劃表達的主要概念是

- 票價產品（例如車票和通行證）
- 騎手類別（例如老年人和兒童）
- 票價支付選項（例如銀行卡和信用卡）
- 票價上限

這些概念將允許數據生產者對基於區域、時間相關和機構間的票價進行建模。這個擴展項目正在迭代中被採用。

目前，採用的 Fares v2 基礎實現適用於以下用例：

- 定義過境票價
- 描述同一票價區內的服務地點
- 為單程旅行製定規則
- 創建傳輸規則

您可以[在此處查看示例](/schedule/examples/fares-v2)，這些示例顯示了使用採用的 Fares v2 基礎實現可以建模的內容。

生產者可以在與 Fares v1 相同的數據集中實施 Fares v2，因為兩者之間沒有技術衝突。消費者可以選擇獨立使用哪個版本。隨著 Fares v2 的採用和充分認可，Fares v1 將來可能會被棄用。

[查看完整提案](https://share.mobilitydata.org/gtfs-fares-v2)

## 進行中的票價 v2 工作

GTFS 社區目前正在努力完成[票價容器](https://share.mobilitydata.org/fare-containers-to-fare-payment-types-proposal)提案。

目前正在討論的項目包括：

- 創建票價容器文件
- 調整哪些類型應包含在票價容器選項的枚舉中

[在 Slack 上加入#gtfs-fares](https://share.mobilitydata.org/slack) [查看會議日程](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057)[查看會議記錄](https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit)

## 首批採用者

🎉 向 Fares v2 的首批採用者致敬！在公開投票將其添加到官方規範之前，至少有 1 個數據生產者和 1 個消費者必須承諾實施實驗性功能。這些組織投入大量時間和精力進行實驗性更改，以確保 GTFS 繼續發展。

對於採用的基礎實現，第一批採用者是

- 生產商： [Interline](https://www.interline.io/) 、[馬里蘭州交通部](https://www.mta.maryland.gov/developer-resources)、 [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- 消費者：[公交](https://transitapp.com/)

對於目前正在討論的票價容器功能，第一批採用者是

- 生產商：[聯運](https://www.interline.io/)
- 消費者：[蘋果](https://www.apple.com/)、[全順](https://transitapp.com/)

[查看誰在使用 Fares v2 文件和字段](https://docs.google.com/spreadsheets/d/1jpKjz6MbCD2XPhmIP11EDi-P2jMh7x2k-oHS-pLf2vI/edit?usp=sharing)

## 正在討論的票價特點

<iframe src="https://portal.productboard.com/xcpvceqebovhprgzprgr2ryb" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## 歷史

- **2017** : 行業研究和數據建模
- **2021 年 10 月**：[起草並共享基礎實施](https://github.com/google/transit/pull/286#issue-1026848880)
- **2021 年 12 月**：[公開投票 #1 → 未通過](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **2022 年 3 月**：[公開投票 #2 → 未通過](https://github.com/google/transit/pull/286#issuecomment-1080716109)
- **2022 年 5 月**：[公開投票 #3 → 通過](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **2022 年 8 月**：[關於 Fares v2 下一階段的社區討論開始](https://github.com/google/transit/issues/341)
- **2022 年 12 月**：[社區確定功能的堆棧排名順序以確定迭代的優先級](https://github.com/google/transit/issues/341#issuecomment-1339947915)
