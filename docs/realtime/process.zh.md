# 向GTFS Realtime性添加新字段

当生产者或消费者对在GTFS Realtime规范中添加一个新字段感兴趣时，他们应该在[GTFS RealtimeGitHub仓库](https://github.com/google/transit)中开一个新问题，描述所提议的字段，并在[GTFS Realtime邮件列表](https://groups.google.com/forum/#!forum/gtfs-realtime)中宣布这个新字段（包括该问题的链接）。

## 规范修订过程

1. 创建一个git分支，更新协议定义、规范和文档文件的所有相关部分（翻译除外）。
2. 在<https://github.com/google/transit> 上创建拉动请求[。](https://github.com/google/transit)拉动请求必须包含对补丁的扩展描述。拉动请求的创建者成为*拥护者*。
3. 一旦拉动请求被注册，必须由其倡导者在[GTFS Realtime邮件列表](https://groups.google.com/forum/#!forum/gtfs-realtime)中公布。一旦宣布，该拉动请求就被认为是一项提案。
     - 由于倡导者是一个贡献者，他们必须在拉动请求被接受之前签署[贡献者许可协议](https://github.com/google/transit/blob/master/CONTRIBUTING.md)。
4. 下面是对该提案的讨论。拉动请求的评论应作为唯一的讨论论坛。
     - 讨论持续的时间，只要倡导者认为有必要，但必须至少是7个日历日。
     - 倡导者负责根据他们同意的评论及时更新提案（即拉动请求）。
     - 在任何time，倡导者都可以声称提案被放弃。
5. 倡导者可以在讨论所需的最初7天间隔之后的任何时间点要求对提案的版本进行投票。
     - 在要求投票之前，至少有一个GTFS-realtime生产者和一个GTFS-realtime消费者应实施提议的更改。希望GTFS-realtime生产者将该变更纳入面向公众的GTFS-realtime馈送中，并在拉动请求评论中提供该数据的链接，并且GTFS-realtime消费者在拉动请求评论中提供以非微不足道的方式利用该变更的应用程序的链接（即支持新功能或改进功能）。
     - 在呼吁投票时，倡导者应明确说明投票是为了将该领域正式纳入规范，还是为了实验性领域。
6. 表决持续的时间最少，足以涵盖7个完整的日历日和5个完整的瑞士工作日。投票于23:59:59 UTC结束。
     - 倡导者应在投票开始时宣布具体结束时间。
     - 在投票期间，只允许对提案进行编辑性修改（错别字，只要不改变含义，措辞可以改变）。
     - 任何人都可以以评论的形式对拉动请求投赞成/反对票，并且在投票期结束前可以改变投票。
   如果一个投票者改变了她的投票，建议通过删除投票内容并写上新的投票来更新原始投票评论。
     - 投票期开始前的投票不被考虑。
7. 如果至少有3票一致同意是，则提案被接受。
     - 提案人的投票不计入3票的总数。例如，如果提案人X创建了一个拉动请求并投了赞成票，而用户Y和Z也投了赞成票，这将被算作2张赞成票。
     - 反对票应是有动机的，最好能提供可操作的反馈。
     - 如果投票失败了，那么倡导者可以选择继续该提案的工作，或者放弃该提案。
   倡导者的任何决定都必须在邮件列表中公布。 
     - 如果倡导者继续提案的工作，那么在任何时间点都可以要求进行新的投票。
8. 任何在30个日历日内没有活动的拉动请求将被关闭。当一个拉动请求被关闭时，相应的提案被认为是被放弃了。如果倡导者希望继续或保持对话，他们可以在任何时候重新打开拉动请求。
     - 请注意，倡导者可以选择将该功能作为一个[自定义扩展](#extensions)来实现，而不是作为官方规范的一部分。
9. 如果提案被接受。
     - 谷歌承诺合并拉动请求的投票版本（前提是贡献者已经签署了[CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md)，并在5个工作日内执行拉动请求。
     - 谷歌承诺及时更新<https://github.com/google/gtfs-realtime-bindings>仓库。对gtfs-realime-bindings的提交，如果是提案的结果，应该参考该提案的拉动请求。
     - 翻译不得包含在原始拉动请求中。
   谷歌负责将相关翻译最终更新为支持的语言，但我们欢迎社区的纯翻译拉动请求，一旦所有的编辑意见得到解决，我们就会接受。

## *实验性*领域

1. 如果社区能够达成共识，(a)提议的字段似乎是有用的，(b)关于字段的类型 (`optional`与`repeated`，`string`与`int`与`bool`），那么将在GTFS-realtime消息中分配一个字段号，并在[.proto文件](../proto)和文档中说明这是一个*实验性*字段，将来可能会改变。
     - 共识是通过讨论和投票过程达成的，该过程与下面的[规范修正过程](#specification-amendment-process)相同，但不需要一致同意，只需要80%的同意票即可批准。
     - 希望使用新的*实验*字段的GTFS Realtime生产者和消费者将使用带有新字段的.proto文件重新生成他们的库（例如，谷歌将更新[gtfs-realime-bindings库](https://github.com/google/gtfs-realtime-bindings)），并开始用实时数据填充和解析该字段。
     - 一旦我们对*实验性*字段的价值感到满意，并且生产者和消费者都在使用该字段，那么我们将按照下面的[规范修正过程](#specification-amendment-process)将该字段正式添加到规范中。
     - 如果*实验性*字段在被批准为*实验性*字段的2年内没有通过[规范修正过程](#specification-amendment-process)被采用，那么它将被废弃，在[.proto文件](../proto)的字段值旁边添加`[deprecated=true]`。 通过使用`[deprecated=true]`（而不是`RESERVED`），已经采用该字段的生产者和消费者不需要将其从使用中移除。 此外，如果该字段在[规范修订过程](#specification-amendment-process)后的后续投票中被批准（例如，当更多的生产者和／或消费者开始使用该字段时），则该字段在将来可能被 "解除废弃"。
2. 如果新字段被认为是特定于单个生产者的，或者对数据类型有争议，那么我们将给生产者分配一个[自定义扩展](../extensions)，以便他们可以在自己的饲料中使用该字段。 在可能的情况下，我们应该避免扩展，将对许多机构有用的字段添加到主规范中，以避免碎片化和消费者为支持规范的各种扩展而进行的额外工作。

## 指导原则

为了保持GTFS Realtime的原始愿景，已经建立了一些指导原则，以便在扩展规范时予以考虑。

<br/>**馈送应该是高效的，可以实时生产和消费。**

实时信息是一个连续的、动态的数据流，必然需要高效的处理。我们选择协议缓冲区作为规范的基础，因为它们在开发者的易用性和传输数据的效率方面提供了良好的权衡。与GTFS不同，我们不认为许多机构会手工编辑GTFS Realtime馈送。协议缓冲区的选择反映了一个结论，即大多数GTFS Realtime馈送将以编程方式产生和消费。

<br/>**该规范是关于乘客信息的。**

与之前的GTFS一样，GTFS-realtime性主要关注乘客信息。也就是说，该规范应包括能够帮助乘客使用电动工具的信息，这一点是首要的。公交机构可能希望在系统之间内部传输大量的面向运营的信息。GTFS Realtime系统不是为了这个目的，可能有其他面向运营的数据标准可能更合适。

<br/>**对规范的修改应该是向后兼容的。**

当向规范添加功能时，我们希望避免做出会使现有馈送无效的改变。我们不希望为现有的信息源发布者创造更多的工作，直到他们想为他们的信息源添加功能。另外，只要有可能，我们希望现有的分析器能够继续阅读新的馈送的旧部分。扩展协议缓冲区的惯例将在一定程度上执行向后兼容。然而，我们希望避免对现有字段进行语义上的改变，因为这也可能破坏向后兼容性。

<br/>**我们不鼓励投机性功能。**

每一个新的功能都会增加创建和读取信息的复杂性。因此，我们要注意只添加我们知道是有用的功能。理想情况下，任何建议都会通过为一个使用新功能的真实交通系统生成数据，并编写软件来读取和显示数据来进行测试。

## 修订历史

**2020年3月12日**

- 更新了GTFS-realtime参考页面上的`TripDescriptor`描述。

**2015年2月26日**

- 为`TripDescriptor`增加了实验性字段`direction_id`[（讨论](https://groups.google.com/d/msg/gtfs-realtime/b8N2GGd2TBs/0fJ1IOMTjJ0J)）。

**2015年1月30日**

- 为所有尚未有协议缓冲区扩展命名空间的剩余GTFS-realtime消息（如`FeedMessage`和`FeedEntity`）添加了协议缓冲区扩展命名空间。

**2015年1月28日**

- 为`TripUpdate`添加了实验性字段`delay`[（讨论](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8)）。

**2015年1月16日**

- 更新`TripDescriptor.start_time`的描述。

**2015年1月8日**

- 定义了实验性枚举`OccupancyStatus`。
- 为`VehiclePosition`添加了实验性字段`occupancy_status`[（讨论](https://groups.google.com/forum/#!topic/gtfs-realtime/\_HtNTGp5LxM)）。

**May 22, 2014**

- 更新了`StopTimeUpdate`消息中`ScheduleRelationship`枚举的描述[（讨论](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)）。
- 从`TripDescriptor`消息中的`ScheduleRelationship`枚举值中删除了REPLACEMENT（[讨论](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)）。

**2012年10月12日**

- 为`TripUpdate`消息添加了时间戳字段。

**May 30, 2012**

- 在规范中添加了关于扩展的具体细节。

**2011年11月30日**

- 为关键的GTFS-realtime消息添加了协议缓冲区扩展命名空间，以方便向规范编写扩展。

**2011年10月25日**

- 更新了文档，澄清了`alert`、`header_text`和`description_text`都是纯文本值。

**2011年8月20日**

- 更新了文档，澄清了`TimeRange`消息的语义。

**2011年8月22日**

- 初始版本。
