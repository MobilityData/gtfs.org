<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# GTFS-Fares v2

Fares v2是一个GTFS时间表扩展项目，旨在解决[Fares v1](/schedule/examples/fares-v1)的局限性。

Fares v2计划体现的主要概念是

- 票价产品（如车票和通行证）
- 乘车人类别（如老年人和儿童）。
- 票价支付选项（如银行卡和信用卡）
- 票价上限

这些概念将允许数据生产者对基于区域的、与时间相关的和机构间的票价进行建模。这个扩展项目正在迭代中被采用。

目前，所采用的Fares v2的基本实现适用于以下用例。

- 定义交通票价
- 描述同一票价区的服务地点
- 为单程旅行创建规则
- 创建换乘规则

你可以[在这里](/schedule/examples/fares-v2)看到[一些例子](/schedule/examples/fares-v2)，这些[例子](/schedule/examples/fares-v2)显示了使用所采用的Fares v2基本实现可以建立什么模型。

生产者可以在同一数据集中实施Fares v2和Fares v1，因为两者之间没有技术冲突。消费者可以选择使用哪个版本，不受其他版本的影响。随着Fares v2的采用和充分认可，Fares v1可能在未来被废弃。

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/gtfs-fares-v2">查看完整提案</a>

## 正在进行的Fares v2工作

[票价媒体（以前的票价容器）提案已经通过](https://github.com/google/transit/pull/355#issuecomment-1468326858)，并在规范中被正式采用

Fares V2工作会议现在将专注于[建模和采用时间变量票价。](https://github.com/google/transit/pull/357)

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/slack">在Slack上加入#gtfs-fares查看</a><a class="button no-icon" target="_blank" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057">会议时间表查看</a><a class="button no-icon" target="_blank" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit">会议记录</a>

## 首批采用者

🎉 Shoutout to Fares v2 first adopters!至少有1个数据生产者和1个消费者必须承诺实施一项实验性功能，然后再进行公开投票，将其纳入正式规范。这些组织在实验性修改中投入了大量的时间和精力，以确保GTFS继续发展。

对于所采用的基本实现，第一个采用者是

- 生产者。[Interline](https://www.interline.io/)、[Maryland Department of Transportation](https://www.mta.maryland.gov/developer-resources)、[Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- 消费者。[Transit](https://transitapp.com/)

对于目前正在讨论fare media功能，首先采用者是

- 生产者。[Interline](https://www.interline.io/), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- 消费者。[Apple](https://www.apple.com/)

<a class="button no-icon" target="_blank" href="https://docs.google.com/spreadsheets/d/1jpKjz6MbCD2XPhmIP11EDi-P2jMh7x2k-oHS-pLf2vI/edit?usp=sharing">查看谁在使用Fares v2文件和字段</a>

## 讨论中Fares v2功能

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## 历史

- **2017:**行业研究和数据建模
- **2021年10月**。[起草并分享基本实施方案](https://github.com/google/transit/pull/286#issue-1026848880)
- **2021年12月**。[公开投票 #1 → 没有通过](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **2022年3月**：[公开投票2号→未通过](https://github.com/google/transit/pull/286#issuecomment-1080716109)
- **2022年5月**：[公开投票#3→通过](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **2022年8月**：[社区开始讨论Fares v2的下一个阶段](https://github.com/google/transit/issues/341)
- **2022年12月**：[社区确定功能的堆栈排名顺序，以确定迭代的优先次序](https://github.com/google/transit/issues/341#issuecomment-1339947915)
