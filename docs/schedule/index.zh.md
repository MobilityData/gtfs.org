# GTFS Schedule概述

<div class="landing-page">
   <a class="button" href="reference">参考资料</a>
   <a class="button" href="best-practices">最佳实践
</a>  <a class="button" href="examples">实例
</a>  <a class="button" href="changes">变化
</a></div>

## 开始使用

包含静态交通信息的GTFS提要是由包含在一个ZIP文件中的若干文本（.txt）文件组成。每个文件描述交通信息的一个特定方面：车站、路线、车次、票价等。关于每个文件的更多信息，请查阅GTFS参考资料。

为了创建一个GTFS信息源，请遵循以下步骤。

1. 创建[GTFS Schedule](reference)参考中描述的所有必要文件。如果需要可选文件的功能，则创建这些文件。
1. 将所有文件保存为.txt格式。字段值应以逗号分隔，每行应以换行符结束。关于文件内容的详细信息，请参见GTFS参考。
1. 将所有的文本文件压缩在一起。压缩后的文件包括饲料的一个版本。
1. 通过使用下面的一个选项发布信息源。

## 公开提供转播资料

<hr/>

数据集应该公布在一个公开的、永久的URL上，包括压缩文件的名称。(例如，[GTFS/GTFS.zip">GTFS](<http://www.agency.org/\<glossary variable=>)。理想情况下，这个网址应该是可以直接下载的，而不需要登录就可以访问该文件，以方便消费软件的下载。虽然建议（也是最常见的做法）使GTFS数据集可公开下载，但如果数据提供者确实需要出于许可或其他原因控制对GTFS访问，建议使用API密钥控制对GTFS数据集的访问，这将有利于自动下载。

托管GTFS数据的网络服务器应被配置为正确报告文件修改日期（见第14.29节下的HTTP/1.1-请求评论2616）。

参见 "[最佳实践。数据集发布](best-practices/#dataset-publishing-general-practices)"以获得进一步的建议。

## 培训

<hr/>

世界银行开放学习校园（OLC）提供了一门自学的在线课程，名为 "[GTFS-and-informal-transit-system-mapping"> General Transit Feed Specification（GTFS](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)）和非正式交通系统绘图介绍"。该课程包括以下部分。

* 什么是GTFS？历史和文件结构
* 什么是GTFS？视觉化和社区
* 设置GTFS饲料
* GitHub和开源工具介绍
* 来自实地的故事
* 如何绘制交通数据图
* 如何为一个城市的第一个反馈收集数据
* 应用程序调查
* GTFS

查看更多[在线课程](../resources/other/#on-line-courses)。

## 获得帮助和社区

<hr/>

### 邮件列表

当你有关于公共交通数据、软件、格式（如GTFS和GTFS和其他问题的问题时，有一些邮件列表可以成为很好的资源。

* [GTFS-changes">GTFS](<https://groups.google.com/group/\<glossary variable=>)变化：讨论关于扩展GTFS规范的建议。
* [MobilityData Slack](https://mobilitydata-io.slack.com/)。Slack的 "组织"，有专门讨论GTFS主题的频道。[在这里申请邀请到mobilitydata-io.slack.com](https://share.mobilitydata.org/slack)。
* [交通系统开发者](https://groups.google.com/group/transit-developers)：一般的交通系统开发者讨论。许多交通机构也有他们自己的开发者邮件列表，专门针对该机构。比如说。
  * [纽约市MTA](https://groups.google.com/group/mtadeveloperresources)
  * [波特兰，俄勒冈州](https://groups.google.com/group/transit-developers-pdx)
  * [BART - 加州旧金山](https://groups.google.com/group/bart-developers)
  * [马萨诸塞州交通局](https://groups.google.com/group/massdotdevelopers)
  * [佐治亚州亚特兰大地区](https://groups.google.com/forum/#!forum/atl-transit-developers)
  * [511旧金山湾区开发商资源](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)
* 请与您当地的公交机构联系，看看他们是否有自己的邮件列表。

查看更多[社区资源](../resources/community)。
