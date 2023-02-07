---
search:
  exclude: true
---

# 规范修订过程

GTFS规范不是一成不变的。相反，它是一个开放的规范，由公交机构、开发商和其他使用GTFS的利益相关者社区开发和维护。预计这个由GTFS数据的生产者和消费者组成的社区将提出扩展规范以实现新功能的建议。为了帮助管理这个过程，我们制定了以下程序和指南。

!!!note ""

    官方规范、参考资料和文件都是用英文写的。如果Translation不同的语言与英文原文不同，则以后者为准。所有的交流都用英语进行。

1. 创建一个git分支，更新协议定义、规范和文档文件的所有相关部分（翻译除外）。
1. 在<https://github.com/google/transit> 上创建拉动请求[。](https://github.com/google/transit)拉动请求必须包含对补丁的扩展描述。拉动请求的创建者成为_拥护者_。
1. 一旦拉动请求被注册，它必须由其倡导者在[GTFS变更邮件列表](https://groups.google.com/forum/#!forum/gtfs-changes)中宣布，包括拉动请求的链接。一旦宣布，该拉动请求就被视为一项提案。 拉动请求也应该被编辑，以包含一个指向Google Groups公告的链接，这样它们就可以很容易地被交叉引用了。
   * 由于倡导者是一个贡献者，他们必须在拉动请求被接受之前签署[贡献者许可协议](../CONTRIBUTING.md)。
1. 下面是对该提案的讨论。拉动请求的评论应作为唯一的讨论论坛。
   * 讨论持续的时间，只要倡导者认为有必要，但必须至少是7个日历日。
   * 倡导者负责根据他们同意的评论及时更新提案（即拉动请求）。
   * 在任何time，倡导者都可以声称提案被放弃。
1. 倡导者可以在讨论所需的最初7天间隔之后的任何time点要求对提案的一个版本进行投票。
   * 在要求投票之前，至少有一个GTFS生产者和一个GTFS消费者应实施提议的改变。 希望GTFS生产者在面向公众的GTFS馈送中包含该变更，并在拉动请求的评论中提供该数据的链接，而且GTFS消费者在拉动请求的评论中提供一个链接，以非微不足道的方式利用该变更（即支持新的或改进的功能）的应用程序。
1. 投票持续的最短时间足以涵盖7个FULL日历日和5个FULL瑞士工作日。投票在23:59:59 UTC结束。
   * 倡导者应在投票start时宣布具体的end time。
   * 在投票期间，只允许对提案进行编辑性修改（错别字，只要不改变含义，措辞可以改变）。
   * 任何人都可以以评论的形式对拉动请求投赞成/反对票，并且在投票期end前可以改变投票。
   如果一个投票者改变了她的投票，建议通过删除投票内容并写上新的投票来更新原始投票评论。
   * 投票期start前的投票不予考虑。
   * 投票的开始和结束必须在[变更邮件列表](https://groups.google.com/forum/#!forum/gtfs-changes)中公布。
1. 如果至少有3票一致同意，则该提案被接受。
   * 提案人的投票不计入3票的总数。例如，如果提案人X创建了一个拉动请求并投了赞成票，而用户Y和Z也投了赞成票，这将被算作2张赞成票。
   * 反对票应是有动机的，最好能提供可操作的反馈。
   * 如果投票失败了，那么倡导者可以选择继续该提案的工作，或者放弃该提案。
   倡导者的任何决定都必须在[变更邮件列表](https://groups.google.com/forum/#!forum/gtfs-changes)中宣布。
   * 如果倡导者继续提案的工作，那么可以在任何time要求进行新的投票。
1. 任何在30天内不活动的拉动请求将被关闭。当一个拉动请求被关闭时，相应的提案被认为是被放弃了。如果倡导者希望继续或保持对话，他们可以在任何time重新打开拉动请求。
1. 如果提案被接受。
   * 谷歌承诺合并拉动请求的投票版本（前提是贡献者已经签署了[CLA](../CONTRIBUTING.md)），并在5个工作日内执行拉动请求。
   * 翻译不得包含在原始拉动请求中。
   谷歌负责最终将相关翻译更新为支持的语言，但欢迎来自社区的纯Translation拉动请求，一旦所有编辑意见得到解决，就会被接受。
1. 拉动请求的最终结果（接受或放弃）应该在最初宣布拉动请求的同一Google Groups主题上宣布。

<hr/>

## 指导原则

为了保持GTFS的最初愿景，我们制定了一些指导原则，以便在扩展该规范时加以考虑。

**我们**<br/>选择CSV作为规范的基础，因为它易于使用电子表格程序和text器查看和编辑，这对小型机构很有帮助。它也可以直接从大多数编程语言和数据库中生成，这对大型信息源的发布者很有帮助。<br/>

**馈送应该容易解析馈送**<br/>读者应该能够以尽可能少的工作提取他们正在寻找的信息。对Feed的修改和添加应该尽可能广泛有用，以尽量减少Feed的读者需要实现的代码路径的数量。(然而，应该优先考虑使创建更容易，因为最终会有更多的馈送发布者而不是馈送读者）。<br/>

**该规范是关于乘客信息的，GTFS**<br/>主要关注的是乘客信息。也就是说，该规范应该包括能够帮助乘客使用电动工具的信息，这一点是首要的。交通机构可能希望在系统之间内部传输大量的面向运营的信息。GTFS不是为了这个目的，可能有其他面向运营的数据标准可能更合适。<br/>

**对规范的修改应该是向后兼容的当**<br/>向规范添加功能<br/>**时**<br/>，我们希望避免做出会使现有馈送无效的修改。我们不希望为现有的信息源发布者创造更多的工作，直到他们想为他们的信息源增加功能。此外，只要有可能，我们希望现有的分析器能够继续阅读新的饲料的旧部分。<br/>

**不鼓励投机性的功能每一个**<br/>新的功能都会增加创建和阅读饲料的复杂性。因此，我们要注意只添加我们知道是有用的功能。理想情况下，任何建议都会通过为使用新功能的真实交通系统生成数据，并编写软件来读取和显示数据来进行测试。请注意，GTFS允许通过增加官方解析器和验证器所忽略的额外的列和文件来扩展格式，所以建议可以很容易地在现有的feeds上进行原型化和测试。<br/>

<hr/>

## 修订历史

**2021年9月15日**<br/>

* 允许票价门（pathway_mode=6）是双向的。见[讨论](https://github.com/google/transit/pull/276)。

**2021年9月13日**<br/>

* 更新了`stop_name的`最佳做法。见[讨论](https://github.com/google/transit/pull/282)。

**2021年8月27日**<br/>

* 根据[RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119)更新了GTFS Schedule。见[讨论](https://github.com/google/transit/pull/277)。

**2021年1月4日**<br/>

* 澄清了`stop_times`的描述`。stop_id`。参见[讨论](https://github.com/google/transit/pull/258)。
* 定义了正数和非零的字段符号。参见[讨论](https://github.com/google/transit/pull/251)。

**2020年10月2日**<br/>

* 将`frequencies.headway_secs`的字段类型从非负数改为正整数。参见[讨论](https://github.com/google/transit/pull/249)。

**2020年5月25日**<br/>

* 定义了`pathways.txt`、`levels.txt`和`attributions.txt`为可翻译的表格。添加了翻译多语言`signposted_as`值的建议。参见[讨论](https://github.com/google/transit/pull/220)。

**2020年5月13日**<br/>

* 在`routes.txt`txt和`stop_times.txt`中增加了`continuous_pickup`和`continuous_drop_off`。将`shape_id`从 "可选 "改为 "有条件要求"。见[讨论](https://github.com/google/transit/pull/208)。

**2020年3月24日**<br/>

* 定义了text字段，并在`stops.txt` `txt`中添加了`tts_stop_name`。参见[讨论](https://github.com/google/transit/pull/49)。

**2020年2月5日**<br/>

* 增加了无轨电车和单轨电车`的路线类型`。参见[讨论](https://github.com/google/transit/pull/174)。

**2020年1月9日**<br/>

* 添加了`translations.txt`。参见[讨论](https://github.com/google/transit/pull/180)。

**2019年12月26日**<br/>

* 更新了`route_type`中的缆车和空中电梯的定义。见[讨论](https://github.com/google/transit/pull/186)。

**2019年12月20日**<br/>

* 添加了`attributions.txt`。见[讨论](https://github.com/google/transit/pull/192)。

**2019年8月26日**<br/>

* 规定`stop_lat`和`stop_lon`的位置是乘客等待上车vehicle地方。参见[讨论](https://github.com/google/transit/pull/179)。

**2019年7月9日**<br/>

* 增加了arrival和departure time最佳实践。参见[讨论](https://github.com/google/transit/pull/165)。
* 增加了车头标志的最佳做法。参见[讨论](https://github.com/google/transit/pull/167)。
* 添加了`stop_id`的最佳做法。见[讨论](https://github.com/google/transit/pull/169)。

**2019年6月25日**<br/>

* 澄清了Shape点和站点的关系。见[讨论](https://github.com/google/transit/pull/39)。

**2019年4月4日**<br/>

* 在`stops.txt`中增加了`platform_code`字段。见[讨论](https://github.com/google/transit/pull/146)。

**2019年3月27日**<br/>

* 增加了`pathways.txt`和`levels.txt`。见[讨论](https://github.com/google/transit/pull/143)。

**2019年2月6日**<br/>

* 为清晰起见做了编辑和格式上的修改。 参见[讨论](https://github.com/google/transit/pull/120)。

**2018年10月2日**<br/>

* 因数化的字段类型。见[讨论](https://github.com/google/transit/pull/104)。

**2018年9月14日**<br/>

* 增加了 "有条件要求 "的概念。参见[讨论](https://github.com/google/transit/pull/100)。

**2018年9月4日**<br/>

* 统一了`agency_lang`和`feed_lang`的定义。参见[讨论](https://github.com/google/transit/pull/98)。

**2018年8月27日**<br/>

* 更新了`CHANGES.md`和最后修订日期。参见[讨论](https://github.com/google/transit/pull/99)。

**2018年8月22日**<br/>

* 在`feed_info.txt`文件中增加了feed\_`contact_email`和`feed_contact_url`字段。参见[讨论](https://github.com/google/transit/pull/31)。

**2017年12月11日**<br/>

* 在`routes.txt`txt中添加了route`_sort_order`。请参见[讨论](https://github.com/google/transit/pull/83)。

**2017年3月15日**<br/>

* 澄清了提案人的投票不计入总数。参见[讨论](https://github.com/google/transit/pull/50)。
* 明确了在召集投票之前，至少有一个GTFS生产者和一个GTFS消费者应该实现提议的修改。参见[讨论](https://github.com/google/transit/pull/46)。

**2017年2月7日**<br/>

* 澄清了`block_id`和`service_id` 的关系。参见[讨论](https://github.com/google/transit/pull/44)。
* 澄清了基于频率的服务从vehicle departure时开始。见[讨论](https://github.com/google/transit/pull/42)。
* 澄清了`stop_id`和`stop_code`的描述。参见[讨论](https://github.com/google/transit/pull/40)。

**2017年12月11日**<br/>

* 在`routes.txt`文件中增加了`route_sort_order`字段。参见[讨论](https://github.com/google/transit/pull/83)。

**2016年11月27日**<br/>

* 增加了车站入口作为`stops.location_type`。见[讨论](https://github.com/google/transit/pull/30)。

**2016年9月2日**<br/>

* 更新了文件，在`fare_attributes.txt` 中增加了`agency_id`。参见[讨论](https://github.com/google/transit/pull/27)。

**2016年3月16日**<br/>

* 将GTFS文档过渡到Github，网址是<https://github.com/google/transit>。

**2016年2月3日**<br/>

* 在`agency.txt`中添加了`agency_email`，建议加入规范：[讨论](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

**2015年2月2日**<br/>

* 添加了stop_times.txt'timepoint'建议到规范中：[讨论](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

**2014年2月17日**<br/>

* 添加trips.txt'bikes_allowed' 提案到规范中：[讨论](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

**2012年10月15日**<br/>

添加trips.txtwheelchair_accessible' 提案到规范：[讨论](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2012年6月20日**<br/>

* 在规范中添加了'wheelchair_boarding'建议：[讨论](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2012年2月2日**<br/>

* 在规范中添加了'stop_timezone'建议：[讨论](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)

**2012年1月18日**<br/>

* 将文档从旧的code.google.com迁移到它们在developer.google.com的新位置。

**2011年9月26日**<br/>

* 在规范中添加了'feed_info'建议：[讨论](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

**2011年9月6日**<br/>

* 在规范中添加了'agency_fare_url'建议：[讨论](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
* 在规范中添加了 "exact_times "建议：[讨论](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)。

**2009年3月30日**<br/>

* 新增了一个关于公开提供交通信息的部分。这一点以前没有在小组里讨论过，因为严格来说，这并不是对数据的解释或编写方式的改变。然而，谷歌的一些人认为，包括对GTFS的非谷歌用途的讨论会很有意义，因为有越来越多的应用程序可以利用GTFS数据。
* CSV格式的澄清：[讨论](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk)。
* 关于如何在route_color和route_text_color字段的描述中选择对比的颜色的额外指导。
* 在这些主题中提出并测试的trip_short_name：a和b。
* 修正了文件end的样本数据中的一个小错误（把S7站作为父站S8）。
* 根据Marcy在评论期间的建议，在文件end的样本数据中添加了 "agency_lang "信息：[讨论](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0)。
* 更新了侧边栏中OCTA的GTFSfeed的链接。
* 见[原始摘要](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw)。

**2009年2月26日**<br/>

* 删除了大部分针对谷歌的feed提交说明，因为目前还有许多其他的应用程序在消费GTFS数据。
* 修正了侧边栏中指向橙县OCTA公共馈送的断裂链接。

**2008年8月7日**<br/>

* 恢复了stop_url字段，该字段在8月6日的版本中被意外地省略了。
* 在样本数据中增加了机构电话
* 在向Google提交feed时，增加了对数据使用协议的提及。

**2008年8月6日**<br/>

* 增加了transfers.txt文件，允许feed发布者提供关于首选传输行为的提示[(原始建议](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw)）。
* 在stops.txt中增加了location_type和parent_station字段，允许将停车点归入车站[原始提议](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw)）。
* 增加了agency_phone字段，用于提供一个机构的语音电话号码[原始提案](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA)）。
* 增加了 "测试你的报文 "一节，提到了开源的测试工具
* 增加了对CSV格式、机构时区、机构语言、路线颜色、路线文本颜色、到达时间、出发时间、calendar.txt与calendar_dates.txt、票价表和frequencies.txt的说明。
* 增加了链接到馈送历史文件，并更正了一些公共馈送链接
* 更新了示例图片以描述当前的谷歌地图用户界面
* 更新/修正了文件中的样本数据

**2008年2月29日**<br/>

* 在stops.txt中增加了 stop_code 字段，允许指定面向乘客的车站代码[原始提案](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc)）。
* 澄清了routesroutes.txttxt中的route_short_name和route_long_name的描述。
* 澄清了stop_times.txt中的 arrival_time 和 departure_time 的描述。
* 修正了样本数据部分的错别字

**2007年11月20日**<br/>

* 澄清了block_id的描述
* 修改了语言，不再强调Google Transit（因为非Google应用程序正在使用GTFS，而且交通路线选择现在是Google Maps的一个综合功能），并修正了各种错别字
* 更新了截图示例，以反映GTFS字段在当前谷歌地图用户界面中的表现形式。
* 更新了交通数据提供者的谷歌联系电子邮件地址
* 更新了格式

**2007年10月5日**<br/>

* 修改了stop_sequence和shape_pt_sequence，允许任何增加的非负整数。
* 澄清了描述并修正了错别字

**2007年5月31日**<br/>

* 更新了页面风格，使HTML更简洁，更容易访问
* 增加了公共馈电实例和其他有用网站的链接
* 删除了个别字段描述中的例子

**2007年4月9日**<br/>

* 增加了关于[提交信息源](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle)的部分。
* 增加了[示范交通机构馈送的例子](https://developers.google.com/transit/gtfs/examples/gtfs-feed)。
* 增加了注意，如果所有的服务日期都在calendar_dates.txt中定义，可以省略calendar.txttxt。
* 在只包含一个机构的馈送中，使agency_id字段成为可选项。这允许现有的feeds没有agency_id而保持有效。
* 增加了agency_url、stop_url和route_url的更全面规范，以及这些字段的额外示例值。
* 增加了6（Gondola）和7（Funicular）作为有效的route_type值。

**2007年3月8日**<br/>

* 稍作编辑，将stop_url字段从stop_times.txt（在2月28日的更新中，该字段被错误地指定为stop_times.stops.txt）移至stops.txt，即它所属的位置。

**2007年3月5日**<br/>

* 稍作编辑，澄清了route_long_name字段的描述。

**2007年2月28日**<br/>

* 增加了frequencies.txt，以支持基于航向的时间表。
* 现在允许多个机构出现在同一个信息源中。还在 agencies.txt 和routes.txt中增加了新的agency_id字段，让你可以指定哪条线路是由哪个机构运营的。
* 增加了每条路线和每站的URLs。
* 在trips.txt中增加了direction_id字段。
* 在stop_times.txt中增加了stop_headsign字段，支持行程中的车头标志变更。
* 在routes.txttxt中增加了可选的routes_color和routes_text_color，支持路线颜色。
* 删除了使用街道地址指定站点的功能。上一版本的规范允许你在stop_street、stop_city、stop_region、stop_postcode和stop_country字段中使用街道地址来提供交通站点的位置。现在，必须用stop_lat表示latitude，stop_lon表示longitude，这对大多数应用来说更有用。
* 在routes.txt中的route_type字段中增加了缆车vehicle类型。
* 见原始的[Headway博客文章](https://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/)的变化总结。

**November 29, 2006**<br/>

* 通过shapes.txt增加了对trip Shape信息的支持
* 澄清了stop_sequence的定义
* 将pickup_type和drop_off_type标记为可选。

**2006年10月31日**<br/>

* 增加了对票价信息的支持
* 删除了个别文件名中的日期
* 改变了route_type值的定义
* 允许在time发布多个feed文件，只要它们的服务期不重叠。
* 修正了trips.txt中的block_id，使其正确标记为可选。
* 注意到必须包括列标题

**2006年9月29日**<br/>

* 稍作编辑，修正了例子中的几个错误。

**2006年9月25日**<br/>

* 初始版本。
